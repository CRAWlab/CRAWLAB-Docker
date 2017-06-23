# This dockerfile created a container with the common ros tutorials installed

FROM pablogn/rpi-ros-core-indigo

# install ros tutorials packages
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    ros-indigo-tf \
    ros-indigo-diagnostics \
    python-serial \
    && sudo rm -rf /var/lib/apt/lists/

# get the roboclaw ROS package from github and run it
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