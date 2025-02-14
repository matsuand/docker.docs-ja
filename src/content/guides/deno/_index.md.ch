%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Containerize and develop Deno applications using Docker.
keywords: getting started, deno
title: Deno language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Deno runtime using Docker.
@y
description: Containerize and develop Deno applications using Docker.
keywords: getting started, deno
title: Deno language-specific guide
summary: |
  Learn how to containerize JavaScript applications with the Deno runtime using Docker.
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
The Deno getting started guide teaches you how to create a containerized Deno application using Docker. In this guide, you'll learn how to:
@y
The Deno getting started guide teaches you how to create a containerized Deno application using Docker. In this guide, you'll learn how to:
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
* Containerize and run a Deno application using Docker
* Set up a local environment to develop a Deno application using containers
* Use Docker Compose to run the application.
* Configure a CI/CD pipeline for a containerized Deno application using GitHub Actions
* Deploy your containerized application locally to Kubernetes to test and debug your deployment
@y
* Containerize and run a Deno application using Docker
* Set up a local environment to develop a Deno application using containers
* Use Docker Compose to run the application.
* Configure a CI/CD pipeline for a containerized Deno application using GitHub Actions
* Deploy your containerized application locally to Kubernetes to test and debug your deployment
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Basic understanding of JavaScript is assumed.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of JavaScript is assumed.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
After completing the Deno getting started modules, you should be able to containerize your own Deno application based on the examples and instructions provided in this guide.
@y
After completing the Deno getting started modules, you should be able to containerize your own Deno application based on the examples and instructions provided in this guide.
@z

@x
Start by containerizing an existing Deno application.
@y
Start by containerizing an existing Deno application.
@z
