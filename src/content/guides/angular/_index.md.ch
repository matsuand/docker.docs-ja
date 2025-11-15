%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Angular language-specific guide
linkTitle: Angular
description: Containerize and develop Angular apps using Docker
keywords: getting started, angular, docker, language, Dockerfile
summary: |
  This guide explains how to containerize Angular applications using Docker.
@y
title: Angular language-specific guide
linkTitle: Angular
description: Containerize and develop Angular apps using Docker
keywords: getting started, angular, docker, language, Dockerfile
summary: |
  This guide explains how to containerize Angular applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The Angular language-specific guide shows you how to containerize an Angular application using Docker, following best practices for creating efficient, production-ready containers.
@y
The Angular language-specific guide shows you how to containerize an Angular application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[Angular](https://angular.dev/) is a robust and widely adopted framework for building dynamic, enterprise-grade web applications. However, managing dependencies, environments, and deployments can become complex as applications scale. Docker streamlines these challenges by offering a consistent, isolated environment for development and production.
@y
[Angular](https://angular.dev/) is a robust and widely adopted framework for building dynamic, enterprise-grade web applications. However, managing dependencies, environments, and deployments can become complex as applications scale. Docker streamlines these challenges by offering a consistent, isolated environment for development and production.
@z

@x
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource essential for the community, helping developers navigate and optimize their Docker workflows.
@y
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource essential for the community, helping developers navigate and optimize their Docker workflows.
@z

@x
---
@y
---
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
- Containerize and run an Angular application using Docker.
- Set up a local development environment for Angular inside a container.
- Run tests for your Angular application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Angular application to a local Kubernetes cluster for testing and debugging.
@y
- Containerize and run an Angular application using Docker.
- Set up a local development environment for Angular inside a container.
- Run tests for your Angular application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Angular application to a local Kubernetes cluster for testing and debugging.
@z

@x
You'll start by containerizing an existing Angular application and work your way up to production-level deployments.
@y
You'll start by containerizing an existing Angular application and work your way up to production-level deployments.
@z

@x
---
@y
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have a working knowledge of:
@y
Before you begin, ensure you have a working knowledge of:
@z

@x
- Basic understanding of [TypeScript](https://www.typescriptlang.org/) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript).
- Familiarity with [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [Angular](https://angular.io/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [TypeScript](https://www.typescriptlang.org/) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript).
- Familiarity with [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [Angular](https://angular.io/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the Angular getting started modules, you’ll be fully prepared to containerize your own Angular application using the detailed examples and best practices outlined in this guide.
@y
Once you've completed the Angular getting started modules, you’ll be fully prepared to containerize your own Angular application using the detailed examples and best practices outlined in this guide.
@z
