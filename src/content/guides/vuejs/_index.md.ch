%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Vue.js language-specific guide
linkTitle: Vue.js
description: Containerize and develop Vue.js apps using Docker
keywords: getting started, vue, vuejs docker, language, Dockerfile
summary: |
  This guide explains how to containerize Vue.js applications using Docker.
@y
title: Vue.js language-specific guide
linkTitle: Vue.js
description: Containerize and develop Vue.js apps using Docker
keywords: getting started, vue, vuejs docker, language, Dockerfile
summary: |
  This guide explains how to containerize Vue.js applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The Vue.js language-specific guide shows you how to containerize an Vue.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
The Vue.js language-specific guide shows you how to containerize an Vue.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[Vue.js](https://vuejs.org/) is a progressive and flexible framework for building modern, interactive web applications. However, as applications scale, managing dependencies, environments, and deployments can become complex. Docker simplifies these challenges by providing a consistent, isolated environment for both development and production.
@y
[Vue.js](https://vuejs.org/) is a progressive and flexible framework for building modern, interactive web applications. However, as applications scale, managing dependencies, environments, and deployments can become complex. Docker simplifies these challenges by providing a consistent, isolated environment for both development and production.
@z

@x
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and highly skilled Front-end engineer, Kristiyan brings exceptional expertise in modern web development, Docker, and DevOps. His hands-on approach and clear, actionable guidance make this guide an essential resource for developers aiming to build, optimize, and secure Vue.js applications with Docker.
---
@y
> 
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and highly skilled Front-end engineer, Kristiyan brings exceptional expertise in modern web development, Docker, and DevOps. His hands-on approach and clear, actionable guidance make this guide an essential resource for developers aiming to build, optimize, and secure Vue.js applications with Docker.
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
- Containerize and run an Vue.js application using Docker.
- Set up a local development environment for Vue.js inside a container.
- Run tests for your Vue.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Vue.js application to a local Kubernetes cluster for testing and debugging.
@y
- Containerize and run an Vue.js application using Docker.
- Set up a local development environment for Vue.js inside a container.
- Run tests for your Vue.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Vue.js application to a local Kubernetes cluster for testing and debugging.
@z

@x
You'll start by containerizing an existing Vue.js application and work your way up to production-level deployments.
@y
You'll start by containerizing an existing Vue.js application and work your way up to production-level deployments.
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
- Familiarity with [Vue.js](https://vuejs.org/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [TypeScript](https://www.typescriptlang.org/) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript).
- Familiarity with [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [Vue.js](https://vuejs.org/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the Vue.js getting started modules, you’ll be fully prepared to containerize your own Vue.js application using the detailed examples and best practices outlined in this guide.
@y
Once you've completed the Vue.js getting started modules, you’ll be fully prepared to containerize your own Vue.js application using the detailed examples and best practices outlined in this guide.
@z
