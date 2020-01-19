/**ArmorDetect 装甲板检测节点（debug）
* 装甲板检测的传统实现
* 作者：hqy
* 最后修改日期：2020.1.14. 19:40
* 问题：
*	1.#ifdef #endif等等杂糅，并且灯条匹配没有最后确定函数
*	2.灯条匹配函数（估计最后使用ArmorPlate.hpp）
*	3.没有高性能接口取流
*	目前已经有非传统灯条匹配方法，但个人认为，如果只是用灯条查找而不使用distant detect的方法
*	意义并不大
*
*/

#include <CameraCtl.hpp>
#include <ros/ros.h>
//#define REMOTE						//远程静止单装甲板调试参数

cv::Mat frame;

//防止重复引用文件		
#include <GetLight.hpp>
#include <MatchLight.hpp>
#include <Robust.hpp>

char key = 0;


//摄像头图像发送节点
int main(int argc, char* argv[])
{
    //打开摄像头录制功能,有个问题，我不知道节点启动在什么位置
    std::string outputVideoPath = "cv_output.avi";
    cv::Size sWH = cv::Size(1440, 1080);
	cv::VideoWriter outputVideo;
	outputVideo.open(outputVideoPath, CV_FOURCC('D', 'I', 'V', 'X'), 60.0, sWH);		
	bool record_judge = false, low = false;
    ros::init(argc, argv, "record");
    ros::NodeHandle nh;
    cm::CameraCtl ctl;
    ctl.startGrabbing();
    while (ros::ok()) {
        if(low) ctl.setExposureTime(140);
        else ctl.setExposureTime(7000);
        low = !low;
        cv::Mat frame = ctl.getOpencvMat();				//录制视频
	    if(record_judge) outputVideo<<frame;
        key = cv::waitKey(1);
		if(key=='e'){														//按下e键录像
			record_judge =! record_judge;
		}
        else if(key == 27) break;
		if(record_judge)
		    cv::circle(frame, cv::Point(15, 15), 8, cv::Scalar(0, 0, 255), -1);	//录像标识(左上角小圆点)
	    cv::imshow("disp", frame);
        
    }
    outputVideo.release();

	cv::destroyAllWindows();
	return 0;
}
