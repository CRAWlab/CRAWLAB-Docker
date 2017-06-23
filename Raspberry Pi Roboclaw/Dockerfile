# -----------------------------------------------------------------------------
# This dockerfile creates a container with the common ROS tutorials installed 
# and adds the files necessary to use the roboclaw motor driver. It will only
# work on a Raspberry Pi.
#
# Created: 06/23/17 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   *
# 
# TODO:
#   * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM pablogn/rpi-ros-core-indigo 

# Then, install ROS tutorials packages, pyserial, and 
# remove the package list to save space
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    ros-indigo-tf \
    ros-indigo-diagnostics \
    python-serial \
    && sudo rm -rf /var/lib/apt/lists/

# Get the roboclaw ROS package from github and install it
RUN /bin/bash -c "mkdir -p ~/catkin_ws/src && \
                  cd ~/catkin_ws/src && \
                  git clone https://github.com/sonyccd/roboclaw_ros.git && \
                  cd ~/catkin_ws && \
                  source /opt/ros/indigo/setup.bash && \
                  catkin_make && \
                  source devel/setup.bash" # do we need this last line?
                  
# setup entrypoint
WORKDIR /home/pi/catkin_ws
COPY ./entrypoint.sh entrypoint.sh
RUN sudo chown pi:pi entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]
USER pi