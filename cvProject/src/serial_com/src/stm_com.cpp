/*stm32云台板通信节点
作者:hqy
最后修改日期：2020.1.14 00:15
问题：SerialCom多个函数可以优化，但是现在还没有清晰的思路
*/

#include <serial_com/SerialCom.hpp>
#include <serial_com/parameters.h>

int main(int argc, char ** argv){
    ros::init(argc, argv, "stm_com");
    SerialCom cm;
    ros::spin();
    return 0;
}