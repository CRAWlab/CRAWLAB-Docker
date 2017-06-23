# This dockerfile created a container with the common ros tutorials installed

FROM pablogn/rpi-ros-core-indigo

# install ros tutorials packages
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    && sudo rm -rf /var/lib/apt/lists/