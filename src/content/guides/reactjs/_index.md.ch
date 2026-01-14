%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: React.js language-specific guide
linkTitle: React.js
description: Containerize and develop React.js apps using Docker
keywords: getting started, React.js, react.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize React.js applications using Docker.
@y
title: React.js language-specific guide
linkTitle: React.js
description: Containerize and develop React.js apps using Docker
keywords: getting started, React.js, react.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize React.js applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The React.js language-specific guide shows you how to containerize a React.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
The React.js language-specific guide shows you how to containerize a React.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[React.js](https://react.dev/) is a widely used library for building interactive user interfaces. However, managing dependencies, environments, and deployments efficiently can be complex. Docker simplifies this process by providing a consistent and containerized environment.
@y
[React.js](https://react.dev/) is a widely used library for building interactive user interfaces. However, managing dependencies, environments, and deployments efficiently can be complex. Docker simplifies this process by providing a consistent and containerized environment.
@z

@x
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@y
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Containerize and run a React.js application using Docker.
- Set up a local development environment for React.js inside a container. 
- Run tests for your React.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized React.js application to a local Kubernetes cluster for testing and debugging.
@y
- Containerize and run a React.js application using Docker.
- Set up a local development environment for React.js inside a container. 
- Run tests for your React.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized React.js application to a local Kubernetes cluster for testing and debugging.
@z

@x
To begin, you’ll start by containerizing an existing React.js application.
@y
To begin, you’ll start by containerizing an existing React.js application.
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
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React.js](https://react.dev/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React.js](https://react.dev/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the React.js getting started modules, you’ll be ready to containerize your own React.js application using the examples and instructions provided in this guide.
@y
Once you've completed the React.js getting started modules, you’ll be ready to containerize your own React.js application using the examples and instructions provided in this guide.
@z
