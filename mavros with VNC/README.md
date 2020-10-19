This Dockerfile adds the mavros to the image from [a full ROS Install with a VNC server](https://github.com/Tiryoh/docker-ros-desktop-vnc).

To build:
1. Navigate to this folder.
2. Run `docker build -t mavros_vnc .`

To use:
1. `docker run -it --rm -p 6080:80 --shm-size=512m --privileged mavros_vnc` 
2. Open a web browser at the size you'd like the ROS desktop to be.
3. Log in to the VNC server using your browser at the address `127.0.0.1:6080`. The image is set up to use the resolution set at the login from the web interface.
4. Now, you can either:    
    i. Work from that web desktop, or    
    ii. Now, open your VNC client and point it to `127.0.0.1` on port 5901. My favorite free client is [VNC Viewer from RealVNC](https://www.realvnc.com/en/connect/download/viewer/).    