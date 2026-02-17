%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Build and develop a ROS 2 workspace
linkTitle: Set Up ROS 2 workspace
@y
title: Build and develop a ROS 2 workspace
linkTitle: Set Up ROS 2 workspace
@z

@x
keywords: ros2, robotics, docker, dockerfile, devcontainer, vscode, workspace
description: Learn how to develop ROS 2 applications using a Docker based workspace and development containers.
@y
keywords: ros2, robotics, docker, dockerfile, devcontainer, vscode, workspace
description: Learn how to develop ROS 2 applications using a Docker based workspace and development containers.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you will set up a ROS 2 workspace using Docker and development containers, review the workspace layout, open the workspace in Visual Studio Code, and edit and build ROS 2 projects inside the container.
@y
In this section, you will set up a ROS 2 workspace using Docker and development containers, review the workspace layout, open the workspace in Visual Studio Code, and edit and build ROS 2 projects inside the container.
@z

@x
## Get the sample ROS 2 workspace
@y
## Get the sample ROS 2 workspace
@z

@x
A consistent workspace simplifies managing ROS 2 projects and build artifacts across different distributions.
@y
A consistent workspace simplifies managing ROS 2 projects and build artifacts across different distributions.
@z

@x
1. Open a terminal and clone the sample workspace repository:
@y
1. Open a terminal and clone the sample workspace repository:
@z

@x
   ```console
   $ git clone https://github.com/shakirth-anisha/docker-ros2-workspace.git
   $ cd docker-ros2-workspace
@y
   ```console
   $ git clone https://github.com/shakirth-anisha/docker-ros2-workspace.git
   $ cd docker-ros2-workspace
@z

@x
   ```
@y
   ```
@z

@x
   Moving forward, Linux users can use the `ws_linux` folder, and macOS users can use `ws_mac`.
@y
   Moving forward, Linux users can use the `ws_linux` folder, and macOS users can use `ws_mac`.
@z

@x
2. Verify the workspace structure:
@y
2. Verify the workspace structure:
@z

@x
   ```text
   ws_linux/
   ├── compose.yml
   ├── Dockerfile
   └── src/
       ├── package1/
       └── package2/
@y
   ```text
   ws_linux/
   ├── compose.yml
   ├── Dockerfile
   └── src/
       ├── package1/
       └── package2/
@z

@x
   ws_mac/
   ├── compose.yml
   ├── Dockerfile
   └── src/
       ├── package1/
       └── package2/
@y
   ws_mac/
   ├── compose.yml
   ├── Dockerfile
   └── src/
       ├── package1/
       └── package2/
@z

@x
   ```
@y
   ```
@z

@x
3. Explore the workspace layout
@y
3. Explore the workspace layout
@z

@x
- `compose.yml` : Defines how Docker Compose builds and runs the ROS 2 container, including mounts, environment variables, and networking settings.
- `Dockerfile` : Builds the ROS 2 development image. It uses an official ROS 2 base image, creates a non-root development user, and installs required system and ROS 2 dependencies.
- `src` : Contains all ROS 2 packages. This directory is mounted into the container as the active workspace.
@y
- `compose.yml` : Defines how Docker Compose builds and runs the ROS 2 container, including mounts, environment variables, and networking settings.
- `Dockerfile` : Builds the ROS 2 development image. It uses an official ROS 2 base image, creates a non-root development user, and installs required system and ROS 2 dependencies.
- `src` : Contains all ROS 2 packages. This directory is mounted into the container as the active workspace.
@z

@x
## Open and build the container
@y
## Open and build the container
@z

@x
1. Execute the following commands to build and start the container:
@y
1. Execute the following commands to build and start the container:
@z

@x
   For Linux:
@y
   For Linux:
@z

@x
   ```console
   $ cd ws_linux
   $ docker compose up -d
   $ docker compose exec ros2 /bin/bash
   ```
@y
   ```console
   $ cd ws_linux
   $ docker compose up -d
   $ docker compose exec ros2 /bin/bash
   ```
@z

@x
   For macOS:
@y
   For macOS:
@z

@x
   ```console
   $ cd ws_mac
   $ docker compose up -d
   $ docker compose exec ros2 /bin/bash
   ```
@y
   ```console
   $ cd ws_mac
   $ docker compose up -d
   $ docker compose exec ros2 /bin/bash
   ```
@z

@x
   This command builds the Docker image defined in your `Dockerfile` and starts the container in the background.
@y
   This command builds the Docker image defined in your `Dockerfile` and starts the container in the background.
@z

@x
   > [!NOTE]
   >
   > Building the image may take several minutes during the first run
   > as the CLI pulls the base ROS 2 image and installs required dependencies.
   > Subsequent starts will be significantly faster.
@y
   > [!NOTE]
   >
   > Building the image may take several minutes during the first run
   > as the CLI pulls the base ROS 2 image and installs required dependencies.
   > Subsequent starts will be significantly faster.
@z

@x
2. Once the container is running, execute commands inside it using `exec`:
@y
2. Once the container is running, execute commands inside it using `exec`:
@z

@x
   ```console
   $ docker compose exec ros2 /bin/bash
   ```
@y
   ```console
   $ docker compose exec ros2 /bin/bash
   ```
@z

@x
3. Inside the container terminal, verify the environment:
@y
3. Inside the container terminal, verify the environment:
@z

@x
```console
$ echo $ROS_VERSION
$ which colcon
```
@y
```console
$ echo $ROS_VERSION
$ which colcon
```
@z

@x
All commands should execute successfully inside the container.
@y
All commands should execute successfully inside the container.
@z

@x
## Switch ROS 2 distributions
@y
## Switch ROS 2 distributions
@z

@x
Update the base image in your `Dockerfile`, changing from `humble` to another distribution like `rolling`, `jazzy`, or `iron`.
@y
Update the base image in your `Dockerfile`, changing from `humble` to another distribution like `rolling`, `jazzy`, or `iron`.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to create a structured workspace, write a Dockerfile with development tools, and configure a Docker Compose setup. Your ROS 2 development environment is now ready with a consistent, reproducible setup across any machine.
@y
In this section, you learned how to create a structured workspace, write a Dockerfile with development tools, and configure a Docker Compose setup. Your ROS 2 development environment is now ready with a consistent, reproducible setup across any machine.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll run a complete end-to-end example with Turtlesim.
@y
In the next section, you'll run a complete end-to-end example with Turtlesim.
@z
