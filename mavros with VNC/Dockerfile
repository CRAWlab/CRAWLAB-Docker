# Pull from the base image for the desktop ROS with VNC
FROM tiryoh/ros-desktop-vnc:noetic

# Then, install ROS tutorials packages
# The TurtleBot list is copied from the tutorials page
RUN sudo apt-get update && sudo apt-get install -y \
    ros-noetic-mavros \
    ros-noetic-mavros-extras \
    nano \
    htop \ 
    tmux \
    && rm -rf /var/lib/apt/lists/
    
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh \
    && chmod +x install_geographiclib_datasets.sh \
    && sudo ./install_geographiclib_datasets.sh \
    && rm install_geographiclib_datasets.sh
    
COPY ./dotfile_setup.sh dotfile_setup.sh 

RUN chmod +x dotfile_setup.sh && ./dotfile_setup.sh