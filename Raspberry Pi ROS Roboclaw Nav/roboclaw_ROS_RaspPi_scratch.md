
docker run -it --rm --net stingray --device=/dev/ttyACM0:/dev/ttyACM0 --name roboclaw --user=root ros:roboclaw roslaunch

docker run -it --rm --net stingray --name=check --env ROS_HOSTNAME=check --env ROS_MASTER_URI=http://roboclaw:11311 ros:roboclaw

    rostopic pub -r 1 /cmd_vel geometry_msgs/Twist '[0.1, 0.0, 0.0]' '[0.0, 0.0, 0.0]'




docker run -it --rm --net stingray --name=echo --env ROS_HOSTNAME=echo --env ROS_MASTER_URI=http://roboclaw1:11311 ros:roboclaw


docker run -it --rm --net roboclaw_default --name=master ros:roboclaw roscore


rosrun nmea_navsat_driver nmea_serial_driver _port:=/dev/ttyAMA0 _baud:=9600