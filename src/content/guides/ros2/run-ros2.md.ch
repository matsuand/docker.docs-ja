%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run ROS 2 in a container
linkTitle: Run ROS 2
@y
title: Run ROS 2 in a container
linkTitle: Run ROS 2
@z

@x
keywords: ros2, robotics, docker, dockerfile, devcontainer, vscode, workspace
description: Run ROS 2 in an isolated Docker container using official ROS 2 images and install additional ROS 2 packages.
@y
keywords: ros2, robotics, docker, dockerfile, devcontainer, vscode, workspace
description: Run ROS 2 in an isolated Docker container using official ROS 2 images and install additional ROS 2 packages.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you will run ROS 2 in an isolated Docker container using official ROS 2 images, verify that ROS 2 is working, and install additional ROS 2 packages for development and testing.
@y
In this section, you will run ROS 2 in an isolated Docker container using official ROS 2 images, verify that ROS 2 is working, and install additional ROS 2 packages for development and testing.
@z

@x
## Run ROS 2 in a container
@y
## Run ROS 2 in a container
@z

@x
The fastest way to get started with ROS 2 is to use the [official Docker image](https://hub.docker.com/_/ros/). To pull an image, start a container, and open an interactive bash shell:
@y
The fastest way to get started with ROS 2 is to use the [official Docker image](https://hub.docker.com/_/ros/). To pull an image, start a container, and open an interactive bash shell:
@z

@x
1. Pull and run the official ROS 2 Docker image:
@y
1. Pull and run the official ROS 2 Docker image:
@z

@x
   ```console
   $ docker run -it ros:humble
   ```
@y
   ```console
   $ docker run -it ros:humble
   ```
@z

@x
   This guide uses the Humble distribution. You can replace `humble` with another supported distribution such as `rolling`, `jazzy`, or `iron`.
@y
   This guide uses the Humble distribution. You can replace `humble` with another supported distribution such as `rolling`, `jazzy`, or `iron`.
@z

@x
   > [!NOTE]
   >
   > This environment is temporary and does not maintain persistence.
   > Any files you create or packages you install will be deleted once the container is stopped or removed.
@y
   > [!NOTE]
   >
   > This environment is temporary and does not maintain persistence.
   > Any files you create or packages you install will be deleted once the container is stopped or removed.
@z

@x
2. Verify ROS 2 is working:
@y
2. Verify ROS 2 is working:
@z

@x
   ```console
   $ echo $ROS_DISTRO
   ```
@y
   ```console
   $ echo $ROS_DISTRO
   ```
@z

@x
   You should see output similar to:
@y
   You should see output similar to:
@z

@x
   ```text
   humble
   ```
@y
   ```text
   humble
   ```
@z

@x
## Install ROS 2 packages
@y
## Install ROS 2 packages
@z

@x
The official ROS 2 images include core packages. To install additional packages, use the `apt` package manager:
@y
The official ROS 2 images include core packages. To install additional packages, use the `apt` package manager:
@z

@x
1. Update the package manager:
@y
1. Update the package manager:
@z

@x
   ```console
   $ sudo apt update
   ```
@y
   ```console
   $ sudo apt update
   ```
@z

@x
2. Install the desired package:
@y
2. Install the desired package:
@z

@x
   ```console
   $ sudo apt install $PACKAGE_NAME
   ```
@y
   ```console
   $ sudo apt install $PACKAGE_NAME
   ```
@z

@x
Replace `$PACKAGE_NAME` with any package you want to install.
@y
Replace `$PACKAGE_NAME` with any package you want to install.
@z

@x
Some commonly used packages include:
@y
Some commonly used packages include:
@z

@x
- `ros-humble-turtlesim` - Visualization and simulation tool
- `ros-humble-rviz2` - 3D visualization tool
- `ros-humble-rqt` - Qt-based ROS graphical tools
- `ros-humble-demo-nodes-cpp` - C++ demo nodes
- `ros-humble-demo-nodes-py` - Python demo nodes
- `ros-humble-colcon-common-extensions` - Build system extensions
@y
- `ros-humble-turtlesim` - Visualization and simulation tool
- `ros-humble-rviz2` - 3D visualization tool
- `ros-humble-rqt` - Qt-based ROS graphical tools
- `ros-humble-demo-nodes-cpp` - C++ demo nodes
- `ros-humble-demo-nodes-py` - Python demo nodes
- `ros-humble-colcon-common-extensions` - Build system extensions
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you pulled an official ROS 2 Docker image, launched an interactive session, and extended the container's capabilities by installing additional ROS 2 packages using apt.
@y
In this section, you pulled an official ROS 2 Docker image, launched an interactive session, and extended the container's capabilities by installing additional ROS 2 packages using apt.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you will configure a persistent workspace to ensure your code and modifications are saved across sessions.
@y
In the next section, you will configure a persistent workspace to ensure your code and modifications are saved across sessions.
@z
