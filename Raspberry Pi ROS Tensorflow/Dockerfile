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
FROM elswork/tensorflow-diy:latest-py2

# update apt
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# install necessary build tools
RUN apt-get -y install build-essential \
    cmake \
    pkg-config \
    unzip \
    wget \
    dirmngr \
    gnupg2 \
    lsb-release

# install keras and OpenCV
RUN pip install numpy && \
    pip install scipy && \
    pip install paho-mqtt &&\
    pip install keras 

# ----- Install OpenCV -----
ENV OPENCV_VERSION 3.4.5

# install necessary libraries
RUN apt-get -y install \
	libjpeg-dev \
	libtiff5-dev \
	libjasper-dev \
	libpng12-dev \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	libv4l-dev \
	libxvidcore-dev \
	libx264-dev \
	libgtk2.0-dev \
	libatlas-base-dev \
	gfortran \
	python2.7-dev \
	python3-dev \
	python-pip \
	python-numpy

# download latest source & contrib
RUN cd /tmp && \
	wget -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && \
	unzip opencv.zip
	
RUN cd /tmp && \
	wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip && \
	unzip opencv_contrib.zip


RUN cd /tmp/opencv-$OPENCV_VERSION && \
	mkdir build && \
	cd build && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D BUILD_PYTHON_SUPPORT=ON \
	-D BUILD_NEW_PYTHON_SUPPORT=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-$OPENCV_VERSION/modules \
	-D BUILD_EXAMPLES=ON .. && \
	make -j4 && \
	make && \
    make install && \
	# ldconfig && \
	make clean
	
# cleanup source
RUN cd /tmp && rm -rf opencv-$OPENCV_VERSION

# ----- Install ROS -----
# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116
#    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages, including those for the TurleBot
ENV ROS_DISTRO kinetic
RUN apt-get install -y \
    ros-kinetic-desktop-full \
    ros-kinetic-turtlebot \ 
    ros-kinetic-turtlebot-apps \ 
    ros-kinetic-turtlebot-interactions \ 
# ros-kinetic-turtlebot-simulator \ # Don't include the simulator
    ros-kinetic-kobuki-ftdi \ 
#    ros-kinetic-rocon-remocon \ 
#    ros-kinetic-rocon-qt-library \ 
    ros-kinetic-ar-track-alvar-msgs \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
WORKDIR /home/pi/catkin_ws
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]