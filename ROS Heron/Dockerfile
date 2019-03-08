# This dockerfile created a container with the common ros tutorials installed

# This part is copied from https://github.com/bpinaya/robond-docker/blob/master/Dockerfile
FROM dorowu/ubuntu-desktop-lxde-vnc:xenial

RUN apt-get update && apt-get install -y dirmngr

# Add keys for ROS
#RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116
#    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# Instal ROS
RUN apt-get update && apt-get install -y ros-kinetic-desktop-full \
		wget git nano
RUN rosdep init && rosdep update


# Create workspace directory
RUN mkdir -p ~/catkin_ws/src

# Set up the workspace
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash && \
                  cd ~/catkin_ws/ && \
                  catkin_make && \
                  echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc"

# Installing Heron repositories
RUN cd ~/catkin_ws/src &&\
    git clone https://github.com/uuvsimulator/uuv_simulator &&\
    git clone https://github.com/heron/heron &&\
    git clone https://github.com/heron/heron_controller &&\
    git clone https://github.com/heron/heron_simulator &&\
	cd .. &&\
	rosdep install --from-paths src --ignore-src --rosdistro=kinetic -yr
	

# install ROS heron packages
RUN apt-get update && apt-get install -y \
    ros-kinetic-heron-desktop \
    ros-kinetic-imu-tools \
    && rm -rf /var/lib/apt/lists/

# Set up the workspace
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash && \
                  cd ~/catkin_ws/ && \
                  catkin_make -j2 && \
                  echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc"

