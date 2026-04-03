%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a Next.js application
linkTitle: Next.js
description: Containerize, develop, test, and deploy Next.js apps with Docker and Kubernetes
keywords: getting started, Next.js, next.js, docker, language, Dockerfile, CI/CD, Kubernetes
summary: |
  This guide explains how to containerize Next.js applications, set up
  development and testing in containers, automate builds with GitHub Actions,
  and deploy to Kubernetes.
@y
title: Containerize a Next.js application
linkTitle: Next.js
description: Containerize, develop, test, and deploy Next.js apps with Docker and Kubernetes
keywords: getting started, Next.js, next.js, docker, language, Dockerfile, CI/CD, Kubernetes
summary: |
  This guide explains how to containerize Next.js applications, set up
  development and testing in containers, automate builds with GitHub Actions,
  and deploy to Kubernetes.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
This guide shows you how to containerize a Next.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
This guide shows you how to containerize a Next.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[Next.js](https://nextjs.org/) is a React framework that enables server-side
rendering, static site generation, and full-stack capabilities. Docker
provides a consistent containerized environment from development to
production.
@y
[Next.js](https://nextjs.org/) is a React framework that enables server-side
rendering, static site generation, and full-stack capabilities. Docker
provides a consistent containerized environment from development to
production.
@z

@x
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide and contributing the official [Next.js Docker examples](https://github.com/vercel/next.js/tree/canary/examples/with-docker) to the Vercel Next.js repository, including the standalone and export output examples. As a Docker Captain and experienced engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@y
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide and contributing the official [Next.js Docker examples](https://github.com/vercel/next.js/tree/canary/examples/with-docker) to the Vercel Next.js repository, including the standalone and export output examples. As a Docker Captain and experienced engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
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
- Containerize and run a Next.js application using Docker.
- Set up a local development environment for Next.js inside a container. 
- Run tests for your Next.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Next.js application to a local Kubernetes cluster for testing and debugging.
@y
- Containerize and run a Next.js application using Docker.
- Set up a local development environment for Next.js inside a container. 
- Run tests for your Next.js application within a Docker container.
- Configure a CI/CD pipeline using GitHub Actions for your containerized app.
- Deploy the containerized Next.js application to a local Kubernetes cluster for testing and debugging.
@z

@x
To begin, you'll start by containerizing an existing Next.js application.
@y
To begin, you'll start by containerizing an existing Next.js application.
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
Before you begin, make sure you're familiar with the following:
@y
Before you begin, make sure you're familiar with the following:
@z

@x
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React](https://react.dev/) and [Next.js](https://nextjs.org/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React](https://react.dev/) and [Next.js](https://nextjs.org/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the Next.js getting started modules, you'll be ready to containerize your own Next.js application using the examples and instructions provided in this guide.
@y
Once you've completed the Next.js getting started modules, you'll be ready to containerize your own Next.js application using the examples and instructions provided in this guide.
@z
