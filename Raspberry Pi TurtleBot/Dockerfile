# -----------------------------------------------------------------------------
# This dockerfile creates a container with the common ros tutorials installed 
# and adds the files necessary to use the TurtleBot. It will only
# work on a Raspberry Pi.
#
# Created: 06/23/17 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   * 07/28/17 - JEV - joshua.vaughan@louisiana.edu
#       - Added entrypoint
#   * 06/26/21 - JEV - joshua.vaughan@louisiana.edu 
#       - re-added entrypoint
#       - consolidated "fix" images here
#       - Added MQTT
# 
# TODO:
# * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM ros:melodic-robot-bionic

RUN sudo apt-get update && sudo apt-get install -y \
    apt-utils \
    curl \
    htop \
    python-pip \
    tmux \
    nano

# Install MQTT
RUN sudo pip install paho-mqtt &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    sudo rm -rf /var/lib/apt/lists/

# Change to the src directory of the workspace
WORKDIR /home/pi/catkin_ws/

# RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && bash -c "source ~/.bashrc" && catkin_make
RUN mkdir src && . /opt/ros/melodic/setup.sh && catkin_make

# Now download and install the TurtleBot packages from source 
# using the script from:
#  https://github.com/gaunthan/Turtlebot2-On-Melodic
RUN sudo apt-get update &&\
    sudo apt-get install -y ros-melodic-cv-bridge \
      ros-melodic-depth-image-proc \
      libyaml-cpp-dev &&\
    curl -sLf https://raw.githubusercontent.com/gaunthan/Turtlebot2-On-Melodic/master/install_basic.sh | bash &&\
    sudo rm -rf /home/pi/catkin_ws/src/kobuki_gazebo_plugins &&\
    sudo rm -rf /home/pi/catkin_ws/src/turtlebot_simulator &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    sudo rm -rf /var/lib/apt/lists/

RUN . /opt/ros/melodic/setup.sh && catkin_make

# Finally, set up the entrypoint to source the TurtleBot workspace
# Note: entrypoint.sh needs to be executable
COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]