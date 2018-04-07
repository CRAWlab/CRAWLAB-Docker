# Pull from the base image for the desktop ROS
FROM osrf/ros:indigo-desktop-full

# Then, install ROS tutorials packages
# The TurtleBot list is copied from the tutorials page
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-turtlebot \ 
    ros-indigo-turtlebot-apps \ 
    ros-indigo-turtlebot-interactions \ 
    ros-indigo-turtlebot-simulator \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    && rm -rf /var/lib/apt/lists/
