# This dockerfile created a container with the common ros tutorials installed

FROM pablogn/rpi-ros-core-indigo

# install ros tutorials packages
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-turtlebot \ 
    ros-indigo-turtlebot-apps \ 
    ros-indigo-turtlebot-interactions \ 
#    ros-indigo-turtlebot-simulator \ 
    ros-indigo-kobuki-ftdi \ 
    ros-indigo-rocon-remocon \ 
    ros-indigo-rocon-qt-library \ 
    ros-indigo-ar-track-alvar-msgs \
    && sudo rm -rf /var/lib/apt/lists/