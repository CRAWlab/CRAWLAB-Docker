This Dockerfile adds the TurtleBot Tutorials to the image from [a full ROS Kinetic Install with a VNC server](https://hub.docker.com/r/ct2034/vnc-ros-kinetic-full/).

To use:
1. `docker run -it --rm -p 6080:80 -p 5901:5900 -e VNC_PASSWORD=your_password  ros:turtlebot_VNC` where `your_password` is the password you want to use.
2. Open a web browser at the size you'd like the ROS desktop to be.
3. Log in to the VNC server using your browser at the address `127.0.0.1:6080`. The image is set up to use the resolution set at the login from the web interface.
4. Now, you can either:    
    i. Work from that web desktop, or    
    ii. Now, open your VNC client and point it to `127.0.0.1` on port 5901. My favorite free client is [VNC Viewer from RealVNC](https://www.realvnc.com/en/connect/download/viewer/).    