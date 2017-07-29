#!/bin/bash
set -e

# setup ROS environment
source "/home/pi/catkin_ws/devel/setup.bash"
exec "$@"