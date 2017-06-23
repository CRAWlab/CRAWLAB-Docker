# -----------------------------------------------------------------------------
# This dockerfile creates a container with the common ROS tutorials installed.
# It will only work on a Raspberry Pi.
#
# Created: 06/23/17 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   *
# 
# TODO:
#   * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM pablogn/rpi-ros-core-indigo

# Then install ROS tutorials packages
RUN sudo apt-get update && sudo apt-get install -y \
    ros-indigo-ros-tutorials \
    ros-indigo-common-tutorials \
    && sudo rm -rf /var/lib/apt/lists/