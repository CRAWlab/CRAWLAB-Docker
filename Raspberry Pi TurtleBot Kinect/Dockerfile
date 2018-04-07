# -----------------------------------------------------------------------------
# This dockerfile adds Microsoft Kinect capabilities to the based TURTLEBOT
#  It will only work on a Raspberry Pi.
#
# Created: 03/24/18 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   * 
# 
# TODO:
# * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM ros:turtlebot2

# Fix inability to launch avahi-daemon correctly
# Modified instructions from https://github.com/dockerimages/docker-systemd
RUN sudo apt-get update && \
    sudo apt-get install -y  wget \
                        libnss-mdns \
                        netatalk \
                        systemd \
                        libfreenect-dev \
                        ros-indigo-openni-launch \
                        ros-indigo-freenect-launch \
                        ros-indigo-image-view && \
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sudo mkdir -p /var/run/dbus
ENV sudo init /lib/systemd/systemd


# install and register Kinect
ENV TURTLEBOT_3D_SENSOR kinect
RUN cd /tmp &&\
    wget -q https://github.com/avin2/SensorKinect/archive/v0.93-5.1.2.1.tar.gz &&\
    tar -xf v0.93-5.1.2.1.tar.gz &&\
    cd SensorKinect-0.93-5.1.2.1/Bin &&\
    tar xjf SensorKinect093-Bin-Linux-x64-v5.1.2.1.tar.bz2 &&\
    cd Sensor-Bin-Linux-x64-v5.1.2.1 &&\
    sudo bash install.sh &&\
    rm -rf /tmp/v0.93-5.1.2.1.tar.gz /tmp/SensorKinect-0.93-5.1.2.1
