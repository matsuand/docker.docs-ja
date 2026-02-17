%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Introduction to ROS 2 Development with Docker
linkTitle: ROS 2
description: Learn how to containerize and develop ROS 2 applications using Docker.
keywords: ros2, robotics, devcontainers, python, cpp, Dockerfile, rviz
summary: |
  This guide details how to containerize ROS 2 applications using Docker.
@y
title: Docker を使った ROS 2 開発
linkTitle: ROS 2
description: Learn how to containerize and develop ROS 2 applications using Docker.
keywords: ros2, robotics, devcontainers, python, cpp, Dockerfile, rviz
summary: |
  このガイドでは Docker を使って ROS 2 アプリケーションをコンテナー化する方法について学びます。
@z

@x
  time: 30 minutes
  image: /images/guides/ros2.jpg
@y
  time: 30 分
  image: images/guides/ros2.jpg
@z

@x
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [Shakirth Anisha](https://www.linkedin.com/in/shakirth-anisha/) for her contribution
> to this guide.
@y
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [Shakirth Anisha](https://www.linkedin.com/in/shakirth-anisha/) for her contribution
> to this guide.
@z

@x
[ROS 2](https://www.ros.org/) is a set of software libraries and tools for building robot applications. It uses Data Distribution Service (DDS) for real-time, secure communication between distributed nodes, making it ideal for robotics and autonomous systems.
@y
[ROS 2](https://www.ros.org/) is a set of software libraries and tools for building robot applications. It uses Data Distribution Service (DDS) for real-time, secure communication between distributed nodes, making it ideal for robotics and autonomous systems.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Use official ROS 2 base images from Docker Hub
- Run ROS 2 in an Ubuntu container
- Install ROS 2 packages and dependencies
- Set up a development container for local development
- Run a complete end-to-end example with Turtlesim
@y
- Use official ROS 2 base images from Docker Hub
- Run ROS 2 in an Ubuntu container
- Install ROS 2 packages and dependencies
- Set up a development container for local development
- Run a complete end-to-end example with Turtlesim
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, make sure you're familiar with the following:
@y
Before you begin, make sure you're familiar with the following:
@z

@x
- [Docker Desktop](https://docs.docker.com/desktop/): You must have Docker Desktop installed and running.
- [Docker concepts](/get-started/docker-concepts/the-basics/what-is-a-container.md): You must understand core Docker concepts, such as images and containers.
- [ROS 2 concepts](https://www.ros.org): Basic understanding of concepts like nodes, packages, topics, and services.
@y
- [Docker Desktop](https://docs.docker.com/desktop/): You must have Docker Desktop installed and running.
- [Docker concepts](get-started/docker-concepts/the-basics/what-is-a-container.md): You must understand core Docker concepts, such as images and containers.
- [ROS 2 concepts](https://www.ros.org): Basic understanding of concepts like nodes, packages, topics, and services.
@z

@x
## What's next?
@y
## What's next?
@z

@x
Start by setting up your ROS 2 development environment using Docker and dev containers.
@y
Start by setting up your ROS 2 development environment using Docker and dev containers.
@z
