# -----------------------------------------------------------------------------
# This dockerfile creates a container with the common ros tutorials installed 
# and adds the files necessary to use the TurtleBot. It will only
# work on a Raspberry Pi.
#
# Created: 06/23/17 - Joshua Vaughan - joshua.vaughan@louisiana.edu
# 
# Modified:
#   * 07/28/17 - JEV - joshua.vaughan@louisiana.edu
#       - Added entrypoint
# 
# TODO:
# * 
# -----------------------------------------------------------------------------

# Pull from he base image for ROS on Raspberry Pi
FROM ros:turtlebot

# setup entrypoint
WORKDIR /home/pi/catkin_ws
COPY ./entrypoint.sh entrypoint.sh
RUN sudo chown pi:pi entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]
USER pi