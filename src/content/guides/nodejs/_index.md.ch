%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Node.js language-specific guide
linkTitle: Node.js
@y
title: Node.js 向けガイド
linkTitle: Node.js
@z

@x
description: Containerize and develop Node.js apps using Docker
keywords: getting started, node, node.js
@y
description: Containerize and develop Node.js apps using Docker
keywords: getting started, node, node.js
@z

@x
summary: |
  This guide explains how to containerize Node.js applications using Docker.
@y
summary: |
  このガイドでは Docker を使って Node.js アプリケーションのコンテナー化を行う方法について説明します。
@z

@x
languages: [js]
@y
languages: [js]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
[Node.js](https://nodejs.org/en) is a JavaScript runtime for building web applications. This guide shows you how to containerize a TypeScript Node.js application with a React frontend and PostgreSQL database.
@y
[Node.js](https://nodejs.org/en) is a JavaScript runtime for building web applications. This guide shows you how to containerize a TypeScript Node.js application with a React frontend and PostgreSQL database.
@z

@x
The sample application is a modern full-stack Todo application featuring:
@y
The sample application is a modern full-stack Todo application featuring:
@z

@x
- **Backend**: Express.js with TypeScript, PostgreSQL database, and RESTful API
- **Frontend**: React.js with Vite and Tailwind CSS 4
@y
- **Backend**: Express.js with TypeScript, PostgreSQL database, and RESTful API
- **Frontend**: React.js with Vite and Tailwind CSS 4
@z

@x
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Full-stack engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@y
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Full-stack engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
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
- Containerize and run a Node.js application using Docker.
- Run tests inside a Docker container.
- Set up a development container environment.
- Configure GitHub Actions for CI/CD with Docker.
- Deploy your Dockerized Node.js app to Kubernetes.
@y
- Containerize and run a Node.js application using Docker.
- Run tests inside a Docker container.
- Set up a development container environment.
- Configure GitHub Actions for CI/CD with Docker.
- Deploy your Dockerized Node.js app to Kubernetes.
@z

@x
To begin, you’ll start by containerizing an existing Node.js application.
@y
To begin, you’ll start by containerizing an existing Node.js application.
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
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en), [npm](https://docs.npmjs.com/about-npm), and [React](https://react.dev/) for modern web development.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
- Familiarity with [Express.js](https://expressjs.com/) for backend API development.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en), [npm](https://docs.npmjs.com/about-npm), and [React](https://react.dev/) for modern web development.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
- Familiarity with [Express.js](https://expressjs.com/) for backend API development.
@z

@x
Once you've completed the Node.js getting started modules, you’ll be ready to containerize your own Node.js application using the examples and instructions provided in this guide.
@y
Once you've completed the Node.js getting started modules, you’ll be ready to containerize your own Node.js application using the examples and instructions provided in this guide.
@z
