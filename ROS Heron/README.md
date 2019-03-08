# Docker for Heron 
This folder contains the `Dockerfile` and `docker-compose.yml` to set up and run a Docker image for simulation and control of the [Clearpath Heron ASV](https://www.clearpathrobotics.com/blog/2019/01/heron-usv-gets-a-new-simulator/). The Dockerfile basically follows the steps outlined in this article, but builds from the [images here](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc) that are base images that set up VNC access to the resulting Docker container.

To build the image, from the same folder in which the `Dockerfile` is contained, run:

```  docker build -t ros:heron .```

Once that runs, you can start the container by either running:

``` docker-compose up ```

provided the `docker-compose.yml` file is in the same folder or

``` docker run -it --rm  -e RESOLUTION=1920x1080 -e USER=ubuntu -e PASSWORD=crawlab -p 6080:80 -p 5901:5900 ros:heron``` 

from anywhere.

You can then access the GUI of the image by going to `0.0.0.0:6080` in your web browser or to `0.0.0.0:5901` in the VNC client of your choice. Additional options are explained in the [base VNC image](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc).

To stop the image, `control-c` from the terminal in which you started the container. If you started the container with `docker-compose up`, then run `docker-compose down` to tear down the image.