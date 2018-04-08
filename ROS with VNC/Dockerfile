# Pull from the base image for the desktop ROS with VNC
FROM ct2034/vnc-ros-kinetic-full

# Then, install ROS tutorials packages
# The TurtleBot list is copied from the tutorials page
RUN sudo apt-get update && sudo apt-get install -y \
    ros-kinetic-turtlebot \ 
    ros-kinetic-turtlebot-apps \ 
    ros-kinetic-turtlebot-interactions \ 
    ros-kinetic-turtlebot-simulator \
    ros-kinetic-ros-tutorials \
    ros-kinetic-common-tutorials \
    && rm -rf /var/lib/apt/lists/