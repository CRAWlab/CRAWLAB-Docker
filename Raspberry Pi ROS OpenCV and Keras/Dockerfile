# -----------------------------------------------------------------------------
# This dockerfile creates a container with the common ROS tutorials, OPENCV,
# Keras and Tensorflow
# installed. It will only work on a Raspberry Pi.
#
# DockerFile extended from: https://hub.docker.com/r/rickryan/rpi-jessie-opencv3.2/
#
# Created: 06/23/17 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   *
# 
# TODO:
#   * 
# -----------------------------------------------------------------------------

# Pull from the base image for ROS on Raspberry Pi
FROM ros:OpenCV

RUN sudo apt-get update &&\
    sudo apt-get install -y libhdf5-dev

# install necessary libraries --extra-index-url=https://www.piwheels.org/simple
RUN sudo pip install pgen &&\
    sudo pip install Cython &&\
    sudo pip install h5py &&\
    sudo pip install keras #tensorflow

# cleanup source
RUN sudo rm -rf /var/lib/apt/lists/

# setup entrypoint
WORKDIR /home/pi/catkin_ws
COPY ./entrypoint.sh entrypoint.sh
RUN sudo chown pi:pi entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]
USER pi