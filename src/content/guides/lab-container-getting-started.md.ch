%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Lab: Getting Started with Docker"
linkTitle: "Lab: Getting Started with Docker"
description: |
  Learn Docker fundamentals by running containers, exploring the container
  lifecycle, and packaging a real Node.js app into your own custom image.
summary: |
  Hands-on lab: Run your first containers, write a Dockerfile, build a custom
  image from a Node.js app, and optionally push it to Docker Hub.
keywords: Docker, containers, Dockerfile, images, getting started, lab, labspace
@y
title: "Lab: Getting Started with Docker"
linkTitle: "Lab: Getting Started with Docker"
description: |
  Learn Docker fundamentals by running containers, exploring the container
  lifecycle, and packaging a real Node.js app into your own custom image.
summary: |
  Hands-on lab: Run your first containers, write a Dockerfile, build a custom
  image from a Node.js app, and optionally push it to Docker Hub.
keywords: Docker, containers, Dockerfile, images, getting started, lab, labspace
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
    - title: Docker overview
      url: /get-started/docker-overview/
    - title: Dockerfile reference
      url: /reference/dockerfile/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-container-getting-started
@y
    - title: Docker overview
      url: __SUBDIR__/get-started/docker-overview/
    - title: Dockerfile reference
      url: __SUBDIR__/reference/dockerfile/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-container-getting-started
@z

@x
Start from zero and learn Docker's core building blocks. You'll run pre-built
containers, write a `Dockerfile` to package a Node.js app, build your own
image, and see container immutability and isolation in action.
@y
Start from zero and learn Docker's core building blocks. You'll run pre-built
containers, write a `Dockerfile` to package a Node.js app, build your own
image, and see container immutability and isolation in action.
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
{{< labspace-launch image="dockersamples/labspace-container-getting-started" >}}
@y
{{< labspace-launch image="dockersamples/labspace-container-getting-started" >}}
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
By the end of this Labspace, you will have completed the following:
@y
By the end of this Labspace, you will have completed the following:
@z

@x
- Understand what containers are and how they differ from virtual machines
- Run containers in the background, inspect their logs and filesystem, and manage their lifecycle
- Write a `Dockerfile` to package an application, using layer caching for fast rebuilds
- Build a custom image with `docker build` and run it as a container
- Optionally publish your image to Docker Hub
@y
- Understand what containers are and how they differ from virtual machines
- Run containers in the background, inspect their logs and filesystem, and manage their lifecycle
- Write a `Dockerfile` to package an application, using layer caching for fast rebuilds
- Build a custom image with `docker build` and run it as a container
- Optionally publish your image to Docker Hub
@z

@x
## Modules
@y
## Modules
@z

@x
| #   | Module                    | Description                                                                    |
| --- | ------------------------- | ------------------------------------------------------------------------------ |
| 1   | Welcome to Docker         | Introduction to containers and running your first `hello-world` container      |
| 2   | Running Containers        | Launch Nginx, inspect logs and internals, and manage the container lifecycle   |
| 3   | Building Your First Image | Write a `Dockerfile` and build a custom image from a Node.js app               |
| 4   | Running Your App          | Run your image, explore container isolation, and optionally push to Docker Hub |
| 5   | Wrap-up                   | Summary of key concepts and next steps                                         |
@y
| #   | Module                    | Description                                                                    |
| --- | ------------------------- | ------------------------------------------------------------------------------ |
| 1   | Welcome to Docker         | Introduction to containers and running your first `hello-world` container      |
| 2   | Running Containers        | Launch Nginx, inspect logs and internals, and manage the container lifecycle   |
| 3   | Building Your First Image | Write a `Dockerfile` and build a custom image from a Node.js app               |
| 4   | Running Your App          | Run your image, explore container isolation, and optionally push to Docker Hub |
| 5   | Wrap-up                   | Summary of key concepts and next steps                                         |
@z
