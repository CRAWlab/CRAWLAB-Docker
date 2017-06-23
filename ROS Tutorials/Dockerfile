# This dockerfile created a container with the common ros tutorials installed

FROM ros:indigo-ros-base

# install ros tutorials packages
RUN apt-get update && apt-get install -y \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    && rm -rf /var/lib/apt/lists/