/*
串口通信模块
作者：hqy
修改时间:2020.1.13  1:00AM
问题：收发数据的方式，暴力delay的写法很有可能导致丢包，并且无法控制收发的速率
    可能要改成频率式的收发
*/
#include <ros/ros.h>
#include <serial/serial.h>
#include <iostream>
#include <std_msgs/String.h>
#include <serial_com/parameters.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/types.h>
#define MAX_INFO_BYTES 1024*1024
//#define POSITION					//使用位置式的标签,默认取消，位置式云台会抽搐

class SerialCom{
public: 
    SerialCom();                                    //构造函数，在此打开串口
    ~SerialCom();                                   //析构
    ros::NodeHandle nh;                             //节点管理器
    ros::Subscriber para_sub;                       //接收
    ros::Publisher para_pub;                        //发送云台信息给图像处理节点        
    serial::Serial ser;                             
public:
    int getDataFromSerial(float &input1, float &input2, int &stat); //读取云台板发送数据
    void getBuffer(uint8_t *buffer, float pitch, float yaw,         //对需要发送的数据进行预处理
        float v1, float v2, float v3, uint8_t status);
    void infoExchange(const serial_com::parameters::ConstPtr &msg); //回调函数，负责与云台板进行收发

    /** @brief 从云台板数据中取出pitch,yaw位置
    *   @param buffer 从云台板上读取的数据缓冲区
    *   @param pitch input&output 从串口数据中取出pitch
    *   @param yaw input&output 从串口数据中取出yaw
    *   @param stat input&output 从串口数据中取出stat(状态信息)
    */
    void receiveData(uint8_t *buffer, float &pitch, float &yaw, int &stat);    
private:
    int serialOK(char *output);                                     //查找可用设备，查找到将返回0


private:
    float old_yaw;                                //云台yaw位置旧值,防止云台所发信息丢包（否则无法测定弹道）
    float old_pitch;                              //云台pitch位置旧值,同上
    int old_status;                               //旧状态码，同上

};

SerialCom::SerialCom(){
    try{
        char path[128]="/dev/serial/by-id/";
        if(!serialOK(path)==0){
            ROS_ERROR_STREAM("Unable to open port.");
            exit(-1);
        }
        ser.setPort(path);                                          //path会经过serialOk的修改
        serial::Timeout to=serial::Timeout::simpleTimeout(100);
        ser.setBaudrate(115200);
        //串口设置timeout
        ser.setTimeout(to);
        ser.open();
    }
    catch (serial::IOException &e){
        ROS_ERROR_STREAM("Unable to open port.");
        exit(-1);
    }
    if(ser.isOpen()){
        ROS_INFO_STREAM("Serial Port initialized.");
    }
    else{
        ROS_ERROR_STREAM("Open serial port failed.");
        exit(-1);
    }
    para_pub = nh.advertise<serial_com::parameters>("gimbalData", 1000);
    para_sub=nh.subscribe("cameraData", 1000, &SerialCom::infoExchange,      //接收相机角度信息（parameters）
        this);
    ROS_INFO("Topic subscribed.\n");

    #ifdef POSITION
        old_pitch=0.0;            //位置式调试使用
        old_yaw=0.0;              //位置式调试使用
    #endif
}

SerialCom::~SerialCom(){
    ser.close();
}

//把需要的数据转换成uint_8
void SerialCom::getBuffer(uint8_t *buffer, float pitch, float yaw,
    float v1, float v2, float v3, uint8_t status){
    unsigned int p1 = ((unsigned int *)&(pitch))[0];
    unsigned int p2 = ((unsigned int *)&(yaw))[0];
    unsigned int p3 = ((unsigned int *)&(v1))[0];
    unsigned int p4 = ((unsigned int *)&(v2))[0];
    unsigned int p5 = ((unsigned int *)&(v3))[0];
    //buffer是8位unsigned int 数组，每一位代表一字节
    for (int i = 0; i < 4; i++){                //4个字节的float pitch转换为buffer中的4位
        uint8_t tmp = (p1 >> (8 * i)) & 0xff;
        buffer[i] = tmp;                        //4个字节的float yaw转换为buffer中的4位
    }
    for (int i = 0; i < 4; i++){                //4个字节的float v1
        uint8_t tmp = (p2 >> (8 * i)) & 0xff;
        buffer[i + 4] = tmp;
    }
    for (int i = 0; i < 4; i++){                //v2
        uint8_t tmp = (p3 >> (8 * i)) & 0xff;
        buffer[i + 8] = tmp;
    }
    for (int i = 0; i < 4; i++){                //v3
        uint8_t tmp = (p4 >> (8 * i)) & 0xff;
        buffer[i + 12] = tmp;
    }
    for (int i = 0; i < 4; i++){                //机器人状态码：0-255，所以只需要一个字节
        uint8_t tmp = (p5 >> (8 * i)) & 0xff;
        buffer[i + 16] = tmp;
    }
    buffer[20]=status;
}

//串口收发数据测试
//此函数是subscriber的回调函数
void SerialCom::infoExchange(const serial_com::parameters::ConstPtr &msg){
    uint8_t buffer[20];
    size_t num=0;

    #ifdef POSITION         //位置式测试
        getBuffer(buffer, msg->pitch+old_pitch, msg->yaw+old_yaw, 
            msg->v1, msg->v2, msg->v3, msg->status);
    #else                   //增量式测试
        getBuffer(buffer, msg->pitch, msg->yaw, 
            msg->v1, msg->v2, msg->v3, msg->status);
    #endif

    num=ser.write(buffer, 21);
    ROS_INFO("Sent data to serial port. %d bits.", (int)num);
    //写入usb后立即从usb取数据，然后发布获取的解码数据
    float pitch=0.0, yaw=0.0; int status;
    for(int i=0;i<150000;++i){;}                        //此处需要更改写法，暴力delay并不合适
    if(getDataFromSerial(pitch, yaw, status)==1){               //丛云台板读取信息成功
    
        serial_com::parameters to_send;
        to_send.pitch = pitch; to_send.yaw = yaw;
        to_send.v1 = to_send.v2 = to_send.v3 = 0;
        to_send.status = status;
        old_pitch=pitch; old_yaw=yaw; old_status = status;      //保存历史位置
        para_pub.publish(to_send);                              //发送云台数据给另一节点   
        std::cout<<"Pitch, Yaw from chip:"<<pitch<<", "<<"yaw"<<std::endl;
        ROS_INFO("Incoming data from the chip processed.\n");
    }
    else{
        serial_com::parameters to_send;
        to_send.pitch = old_pitch; to_send.yaw = old_yaw;
        to_send.v1 = to_send.v2 = to_send.v3 = 0;
        to_send.status = old_status;
        para_pub.publish(to_send);                              //从云台取得信息失败，发送旧值
        std::cout<<"No incoming data from the chip. Old data sent."<<std::endl;
    }
}

//从串口接收数据
void SerialCom::receiveData(uint8_t *buffer, float &pitch, float &yaw, int &stat){
    unsigned int hor=0, ver=0;
    for(int i=3;i>=0;--i){
        hor+=buffer[i];
        if(i) hor=hor<<8;
    }
    for(int i=7;i>=4;--i){
        ver+=buffer[i];
        if(i!=4) ver=ver<<8;
    }
    pitch = ((float*)&hor)[0];
    yaw = ((float*)&ver)[0];
    stat = (int)buffer[20];             //最后一位是状态码
}

//查找需要的串口
int SerialCom::serialOK(char *output){
    if(access("dev/serial/by-id", R_OK)){                       //目录是否存在
        std::cout<<"Directory dev/serial exists."<<std::endl;
        DIR *dir=opendir("/dev/serial/by-id");
        if(!dir){                                               //是否能正常打开目录
            std::cout<<"Open directory error."<<std::endl;
            return -1;
        }
        struct dirent* files;
        bool find_device=false;
        while((files=readdir(dir))){                            //查找名称长度大于5的为USB设备
            for(int i=0;i<256&&files->d_name[i]>0;++i){
                if(i>5){
                    strcat(output, files->d_name);
                    return 0;
                }
            }
        }
    }
    else{
        if(!access("dev/serial/by-id", F_OK)){
            std::cout<<"No plug-in usb serial device."<<std::endl;
            return -1;
        }
        else{
            std::cout<<"Error in access."<<std::endl;
            return -1;
        }
    }
    return -1;                                                  //所有设备名称不符合要求
}

int SerialCom::getDataFromSerial(float &input1, float &input2, int &stat){  //输出是两个float值
    if(ser.available()){                                    //缓冲区内有信息                                    
        size_t num = ser.available();                       //获取缓冲区内数据量
        if(num){
            int status = 0;
            float pitch=0.0, yaw=0.0;
            std_msgs::String res;
            res.data=ser.read(num);                         //一次性读出缓冲区里所有的数据
            if(!res.data.size()){
                ROS_ERROR_STREAM("There has been a Read Error.\n");
            }
            std::cout<<"Data received."<<std::endl;
            uint8_t result[21];
            for(int i=0;i<21;++i){
                result[i] = res.data[i];                    //云台发来的数据全部使用
            }
            receiveData(result, pitch, yaw, status);        //解包
            std::cout<<"Data de-packaged.Pitch:"<<pitch<<   //打印读取数据
                ", yaw:"<<yaw<<", stat:"<<stat<<std::endl;
            input1=pitch; input2=yaw; stat = status;        //输出
            return 1;
        }else{
            ROS_ERROR_STREAM("Unknown Error with 0 available but failed to detect.");
            return -1;
        }  
    }else{
        ROS_ERROR_STREAM("No data available.");
        return -1;
    }
}

