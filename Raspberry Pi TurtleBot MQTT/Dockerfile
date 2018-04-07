# -----------------------------------------------------------------------------
# This dockerfile adds MQTT to the base TurtleBot image for Raspberry Pi.
#
# Created: 04/06/18 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   *
# 
# TODO:
#   * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM ros:turtlebot2

RUN sudo apt-get update && \
    sudo apt-get install -y python-pip && \
    sudo pip install paho-mqtt &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup entrypoint
# WORKDIR /home/pi/catkin_ws
# COPY ./entrypoint.sh entrypoint.sh
# RUN sudo chown pi:pi entrypoint.sh
# ENTRYPOINT ["./entrypoint.sh"]
# CMD ["/bin/bash"]
# USER pi