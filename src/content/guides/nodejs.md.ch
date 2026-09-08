%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Node.js language-specific guide
linkTitle: Node.js
description: Containerize and develop Node.js applications using Docker
keywords: getting started, node, node.js
summary: |
  This guide explains how to containerize Node.js applications using Docker.
@y
title: Node.js language-specific guide
linkTitle: Node.js
description: Containerize and develop Node.js applications using Docker
keywords: getting started, node, node.js
summary: |
  This guide explains how to containerize Node.js applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
[Node.js](https://nodejs.org/en) is a JavaScript runtime for building server-side applications. This guide shows you how to containerize a TypeScript Node.js application using Docker, starting from a simple Express API and progressively adding features like a database.
@y
[Node.js](https://nodejs.org/en) is a JavaScript runtime for building server-side applications. This guide shows you how to containerize a TypeScript Node.js application using Docker, starting from a simple Express API and progressively adding features like a database.
@z

@x
This guide focuses on a backend Node.js API. If you're building a standalone frontend application, Docker has dedicated guides for [React.js](/guides/reactjs/), [Vue.js](/guides/vuejs/), [Angular](/guides/angular/), and [Next.js](/guides/nextjs/).
@y
This guide focuses on a backend Node.js API. If you're building a standalone frontend application, Docker has dedicated guides for [React.js](__SUBDIR__/guides/reactjs/), [Vue.js](__SUBDIR__/guides/vuejs/), [Angular](__SUBDIR__/guides/angular/), and [Next.js](__SUBDIR__/guides/nextjs/).
@z

@x
> **Acknowledgment**
>
> Docker thanks [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker thanks [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for his contribution to this guide.
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
- Containerize and run a Node.js application using Docker.
- Set up a local development environment using containers.
- Run tests inside a Docker container.
@y
- Containerize and run a Node.js application using Docker.
- Set up a local development environment using containers.
- Run tests inside a Docker container.
@z

@x
Start by containerizing a Node.js application.
@y
Start by containerizing a Node.js application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm).
- Familiarity with Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm).
- Familiarity with Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
## Containerize a Node.js application
@y
## Containerize a Node.js application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You're familiar with basic Docker concepts. If you're new to Docker, start with [Get started](/get-started/introduction/).
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
- You're familiar with basic Docker concepts. If you're new to Docker, start with [Get started](__SUBDIR__/get-started/introduction/).
@z

@x
### Overview
@y
### Overview
@z

@x
Containerizing your application means packaging it together with its
dependencies, configuration, and runtime into a single portable unit called a
container image. Running that image creates a container, an isolated process
that behaves the same on any machine, whether it's your laptop, a CI runner, or
a production server.
@y
Containerizing your application means packaging it together with its
dependencies, configuration, and runtime into a single portable unit called a
container image. Running that image creates a container, an isolated process
that behaves the same on any machine, whether it's your laptop, a CI runner, or
a production server.
@z

@x
In this section, you'll containerize a simple [Express.js](https://expressjs.com/) API written in TypeScript. You'll write a `Dockerfile` that describes how to build the image, add a `compose.yaml` file that defines how Docker runs your container, and then build and start the application with one command.
@y
In this section, you'll containerize a simple [Express.js](https://expressjs.com/) API written in TypeScript. You'll write a `Dockerfile` that describes how to build the image, add a `compose.yaml` file that defines how Docker runs your container, and then build and start the application with one command.
@z

@x
You'll use [Docker Hardened Images](/dhi/) as the base. These are minimal, secure Node.js images maintained by Docker.
@y
You'll use [Docker Hardened Images](__SUBDIR__/dhi/) as the base. These are minimal, secure Node.js images maintained by Docker.
@z

@x
This guide focuses on a backend Node.js API. If you're building a standalone frontend application, Docker has dedicated guides for [React.js](/guides/reactjs/), [Vue.js](/guides/vuejs/), [Angular](/guides/angular/), and [Next.js](/guides/nextjs/).
@y
This guide focuses on a backend Node.js API. If you're building a standalone frontend application, Docker has dedicated guides for [React.js](__SUBDIR__/guides/reactjs/), [Vue.js](__SUBDIR__/guides/vuejs/), [Angular](__SUBDIR__/guides/angular/), and [Next.js](__SUBDIR__/guides/nextjs/).
@z

@x
### Create the application
@y
### Create the application
@z

@x
The sample application is a minimal Express API with a single endpoint that returns a JSON greeting. Create the following files in a new `nodejs-docker-example` directory. To create all the files at once, switch to the **Scaffold script** tab in the file browser and copy the shell command.
@y
The sample application is a minimal Express API with a single endpoint that returns a JSON greeting. Create the following files in a new `nodejs-docker-example` directory. To create all the files at once, switch to the **Scaffold script** tab in the file browser and copy the shell command.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="src/index.ts" status="new" >}}
@y
{{< file path="src/index.ts" status="new" >}}
@z

@x
```typescript
// A minimal Express application.
// The root endpoint (GET /) returns a JSON greeting.
// See https://expressjs.com/ for the framework reference.
@y
```typescript
// A minimal Express application.
// The root endpoint (GET /) returns a JSON greeting.
// See https://expressjs.com/ for the framework reference.
@z

@x
import express, { type Request, type Response } from "express";
@y
import express, { type Request, type Response } from "express";
@z

@x
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@y
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@z

@x
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@y
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@z

@x
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@y
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="package.json" status="new" >}}
@y
{{< file path="package.json" status="new" >}}
@z

@x
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@y
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="tsconfig.json" status="new" >}}
@y
{{< file path="tsconfig.json" status="new" >}}
@z

@x
```json
{
  // TypeScript compiler configuration for the Node.js application.
  // Compiles src/ to dist/ as CommonJS modules targeting ES2022.
  // See https://www.typescriptlang.org/tsconfig/ for all options.
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "lib": ["ES2022"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```
@y
```json
{
  // TypeScript compiler configuration for the Node.js application.
  // Compiles src/ to dist/ as CommonJS modules targeting ES2022.
  // See https://www.typescriptlang.org/tsconfig/ for all options.
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "lib": ["ES2022"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" status="new" >}}
@y
{{< file path=".gitignore" status="new" >}}
@z

@x
```text
# Files and directories that Git should ignore. Covers Node.js dependencies,
# TypeScript build output, environment files, and common editor artifacts.
# See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. Covers Node.js dependencies,
# TypeScript build output, environment files, and common editor artifacts.
# See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
node_modules/
dist/
.env
*.log
.DS_Store
coverage/
db/password.txt
```
@y
node_modules/
dist/
.env
*.log
.DS_Store
coverage/
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
If you have Node.js installed and want to verify the app works before containerizing it, you can run it locally.
@y
If you have Node.js installed and want to verify the app works before containerizing it, you can run it locally.
@z

@x
To run in development mode with hot-reload:
@y
To run in development mode with hot-reload:
@z

@x
```console
$ npm install
$ npm run dev
```
@y
```console
$ npm install
$ npm run dev
```
@z

@x
To run the compiled production build (matching what the Dockerfile does):
@y
To run the compiled production build (matching what the Dockerfile does):
@z

@x
```console
$ npm install
$ npm run build
$ npm start
```
@y
```console
$ npm install
$ npm run build
$ npm start
```
@z

@x
Then open [http://localhost:3000](http://localhost:3000) in your browser. You should see `{"message":"Hello World"}`.
@y
Then open [http://localhost:3000](http://localhost:3000) in your browser. You should see `{"message":"Hello World"}`.
@z

@x
If you don't have Node.js installed, skip ahead. The remaining steps run the application in a container, with no local Node.js required.
@y
If you don't have Node.js installed, skip ahead. The remaining steps run the application in a container, with no local Node.js required.
@z

@x
### Create the Docker assets
@y
### Create the Docker assets
@z

@x
Sign in to the DHI registry so Docker can pull the Node.js base images during the build. The available Node.js images are listed in the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/node).
@y
Sign in to the DHI registry so Docker can pull the Node.js base images during the build. The available Node.js images are listed in the [catalog](https://hub.docker.com/hardened-images/catalog/dhi/node).
@z

@x
```console
$ docker login dhi.io
```
@y
```console
$ docker login dhi.io
```
@z

@x
Add the following three files to your `nodejs-docker-example` directory. The `Dockerfile` describes how to build the image, `compose.yaml` defines how Docker runs the container, and `.dockerignore` keeps unwanted files out of the build context.
@y
Add the following three files to your `nodejs-docker-example` directory. The `Dockerfile` describes how to build the image, `compose.yaml` defines how Docker runs the container, and `.dockerignore` keeps unwanted files out of the build context.
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for
> your project. Ask Gordon to create a Dockerfile, Compose file, and
> `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for
> your project. Ask Gordon to create a Dockerfile, Compose file, and
> `.dockerignore` tailored to your application.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="src/index.ts" >}}
@y
{{< file path="src/index.ts" >}}
@z

@x
```typescript
// A minimal Express application.
// The root endpoint (GET /) returns a JSON greeting.
// See https://expressjs.com/ for the framework reference.
@y
```typescript
// A minimal Express application.
// The root endpoint (GET /) returns a JSON greeting.
// See https://expressjs.com/ for the framework reference.
@z

@x
import express, { type Request, type Response } from "express";
@y
import express, { type Request, type Response } from "express";
@z

@x
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@y
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@z

@x
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@y
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@z

@x
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@y
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="package.json" >}}
@y
{{< file path="package.json" >}}
@z

@x
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@y
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="tsconfig.json" >}}
@y
{{< file path="tsconfig.json" >}}
@z

@x
```json
{
  // TypeScript compiler configuration for the Node.js application.
  // Compiles src/ to dist/ as CommonJS modules targeting ES2022.
  // See https://www.typescriptlang.org/tsconfig/ for all options.
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "lib": ["ES2022"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```
@y
```json
{
  // TypeScript compiler configuration for the Node.js application.
  // Compiles src/ to dist/ as CommonJS modules targeting ES2022.
  // See https://www.typescriptlang.org/tsconfig/ for all options.
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "lib": ["ES2022"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="Dockerfile" status="new" >}}
@y
{{< file path="Dockerfile" status="new" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@z

@x
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Builder stage: install all dependencies and compile TypeScript.
FROM dhi.io/node:24-alpine3.23-dev AS builder
@y
# Builder stage: install all dependencies and compile TypeScript.
FROM dhi.io/node:24-alpine3.23-dev AS builder
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Install dependencies as a separate step to take advantage of Docker's
# caching. Leverage a cache mount to /root/.npm to speed up subsequent
# builds. Leverage a bind mount to package.json to avoid having to copy
# it into this layer.
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci
@y
# Install dependencies as a separate step to take advantage of Docker's
# caching. Leverage a cache mount to /root/.npm to speed up subsequent
# builds. Leverage a bind mount to package.json to avoid having to copy
# it into this layer.
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci
@z

@x
# Copy the source code into the container and compile TypeScript.
COPY . .
RUN npm run build
@y
# Copy the source code into the container and compile TypeScript.
COPY . .
RUN npm run build
@z

@x
# Deps stage: install production dependencies only.
FROM dhi.io/node:24-alpine3.23-dev AS deps
@y
# Deps stage: install production dependencies only.
FROM dhi.io/node:24-alpine3.23-dev AS deps
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci --omit=dev
@y
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci --omit=dev
@z

@x
# Runner stage: minimal runtime image with compiled app and production deps.
FROM dhi.io/node:24-alpine3.23 AS runner
@y
# Runner stage: minimal runtime image with compiled app and production deps.
FROM dhi.io/node:24-alpine3.23 AS runner
@z

@x
ENV PATH=/app/node_modules/.bin:$PATH
@y
ENV PATH=/app/node_modules/.bin:$PATH
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=builder --chown=node:node /app/dist ./dist
@y
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=builder --chown=node:node /app/dist ./dist
@z

@x
# Expose the port that the application listens on.
EXPOSE 3000
@y
# Expose the port that the application listens on.
EXPOSE 3000
@z

@x
# Run the application.
CMD ["node", "dist/index.js"]
```
@y
# Run the application.
CMD ["node", "dist/index.js"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="new" >}}
@y
{{< file path="compose.yaml" status="new" >}}
@z

@x
```yaml
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@y
```yaml
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Docker Compose reference guide at
# https://docs.docker.com/go/compose-spec-reference/
@z

@x
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
services:
  server:
    build:
      context: .
    ports:
      - 3000:3000
```
@y
# Here the instructions define your application as a service called "server".
# This service is built from the Dockerfile in the current directory.
# You can add other services your application may depend on here, such as a
# database or a cache. For examples, see the Awesome Compose repository:
# https://github.com/docker/awesome-compose
services:
  server:
    build:
      context: .
    ports:
      - 3000:3000
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".dockerignore" status="new" >}}
@y
{{< file path=".dockerignore" status="new" >}}
@z

@x
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@y
```text
# Include any files or directories that you don't want to be copied to your
# container here (e.g., local build artifacts, temporary files, etc.).
#
# For more help, visit the .dockerignore file reference guide at
# https://docs.docker.com/go/build-context-dockerignore/
@z

@x
node_modules/
dist/
.env
.git
.gitignore
.DS_Store
npm-debug.log*
coverage/
db/
```
@y
node_modules/
dist/
.env
.git
.gitignore
.DS_Store
npm-debug.log*
coverage/
db/
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".gitignore" >}}
@y
{{< file path=".gitignore" >}}
@z

@x
```text
# Files and directories that Git should ignore. Covers Node.js dependencies,
# TypeScript build output, environment files, and common editor artifacts.
# See https://git-scm.com/docs/gitignore for syntax reference.
@y
```text
# Files and directories that Git should ignore. Covers Node.js dependencies,
# TypeScript build output, environment files, and common editor artifacts.
# See https://git-scm.com/docs/gitignore for syntax reference.
@z

@x
node_modules/
dist/
.env
*.log
.DS_Store
coverage/
db/password.txt
```
@y
node_modules/
dist/
.env
*.log
.DS_Store
coverage/
db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
The `Dockerfile` uses three stages. The `builder` stage installs all dependencies and compiles TypeScript. The `deps` stage does a fresh install of production-only dependencies. The `runner` stage copies the compiled output and production node_modules into a minimal runtime image that contains only Node.js.
@y
The `Dockerfile` uses three stages. The `builder` stage installs all dependencies and compiles TypeScript. The `deps` stage does a fresh install of production-only dependencies. The `runner` stage copies the compiled output and production node_modules into a minimal runtime image that contains only Node.js.
@z

@x
To learn more about each file, see the following:
@y
To learn more about each file, see the following:
@z

@x
- [Dockerfile](/reference/dockerfile.md)
- [.dockerignore](/reference/dockerfile.md#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](reference/dockerfile.md)
- [.dockerignore](reference/dockerfile.md#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
### Run the application
@y
### Run the application
@z

@x
Inside the `nodejs-docker-example` directory, run the following command in a
terminal.
@y
Inside the `nodejs-docker-example` directory, run the following command in a
terminal.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see `{"message":"Hello World"}`.
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see `{"message":"Hello World"}`.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
#### Run the application in the background
@y
#### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `nodejs-docker-example` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `nodejs-docker-example` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/).
@y
For more information about Compose commands, see the [Compose CLI
reference](__SUBDIR__/reference/cli/docker/compose/).
@z

@x
## Use containers for Node.js development
@y
## Use containers for Node.js development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a Node.js application](#containerize-a-nodejs-application).
@y
Complete [Containerize a Node.js application](#containerize-a-nodejs-application).
@z

@x
### Overview
@y
### Overview
@z

@x
Once your application runs in a container, the next step is making the container part of your everyday development workflow. Code changes should show up quickly, and services your app depends on, like databases, should run right alongside it.
@y
Once your application runs in a container, the next step is making the container part of your everyday development workflow. Code changes should show up quickly, and services your app depends on, like databases, should run right alongside it.
@z

@x
In this section, you'll adapt the Dockerfile for local development by renaming the `builder` stage to `dev` and pointing Compose at it. You'll also update the application to connect to a PostgreSQL database, add a database service to `compose.yaml`, persist data in a named volume, enable Compose Watch so changes in your editor are picked up without a manual rebuild, and set up Node.js debugging so you can attach VS Code or Chrome DevTools to the running container.
@y
In this section, you'll adapt the Dockerfile for local development by renaming the `builder` stage to `dev` and pointing Compose at it. You'll also update the application to connect to a PostgreSQL database, add a database service to `compose.yaml`, persist data in a named volume, enable Compose Watch so changes in your editor are picked up without a manual rebuild, and set up Node.js debugging so you can attach VS Code or Chrome DevTools to the running container.
@z

@x
### Update the application
@y
### Update the application
@z

@x
You'll update your application to connect to a PostgreSQL database. Continue working in your `nodejs-docker-example` directory.
@y
You'll update your application to connect to a PostgreSQL database. Continue working in your `nodejs-docker-example` directory.
@z

@x
Replace `src/index.ts` and `package.json` with the following contents. The file browser shows only the files that change in this step.
@y
Replace `src/index.ts` and `package.json` with the following contents. The file browser shows only the files that change in this step.
@z

@x
> [!NOTE]
>
> The application won't run yet after this step. It tries to connect to a
> PostgreSQL database that doesn't exist. The next two sections add the
> database service and the Docker configuration needed to run everything
> together.
@y
> [!NOTE]
>
> The application won't run yet after this step. It tries to connect to a
> PostgreSQL database that doesn't exist. The next two sections add the
> database service and the Docker configuration needed to run everything
> together.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="src/index.ts" status="modified" >}}
@y
{{< file path="src/index.ts" status="modified" >}}
@z

@x
```typescript
// Express application backed by a PostgreSQL database.
// Creates a heroes table at startup.
// Endpoints: GET / (greeting), GET /health (health check), POST /heroes/ (create), GET /heroes/ (list).
// See https://expressjs.com/ and https://node-postgres.com/
@y
```typescript
// Express application backed by a PostgreSQL database.
// Creates a heroes table at startup.
// Endpoints: GET / (greeting), GET /health (health check), POST /heroes/ (create), GET /heroes/ (list).
// See https://expressjs.com/ and https://node-postgres.com/
@z

@x
import express, { type Request, type Response } from "express";
import { Pool } from "pg";
import { readFileSync } from "fs";
@y
import express, { type Request, type Response } from "express";
import { Pool } from "pg";
import { readFileSync } from "fs";
@z

@x
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@y
const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@z

@x
app.use(express.json());
@y
app.use(express.json());
@z

@x
function getPassword(): string {
  const passwordFile = process.env.POSTGRES_PASSWORD_FILE;
  if (passwordFile) {
    return readFileSync(passwordFile, "utf8").trim();
  }
  return process.env.POSTGRES_PASSWORD ?? "";
}
@y
function getPassword(): string {
  const passwordFile = process.env.POSTGRES_PASSWORD_FILE;
  if (passwordFile) {
    return readFileSync(passwordFile, "utf8").trim();
  }
  return process.env.POSTGRES_PASSWORD ?? "";
}
@z

@x
const pool = new Pool({
  host: process.env.POSTGRES_SERVER,
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: getPassword(),
});
@y
const pool = new Pool({
  host: process.env.POSTGRES_SERVER,
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: getPassword(),
});
@z

@x
pool
  .query(
    `CREATE TABLE IF NOT EXISTS heroes (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL,
      secret_name TEXT NOT NULL,
      age INTEGER
    )`,
  )
  .catch(console.error);
@y
pool
  .query(
    `CREATE TABLE IF NOT EXISTS heroes (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL,
      secret_name TEXT NOT NULL,
      age INTEGER
    )`,
  )
  .catch(console.error);
@z

@x
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@y
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@z

@x
app.get("/health", (_req: Request, res: Response) => {
  res.json({ status: "ok" });
});
@y
app.get("/health", (_req: Request, res: Response) => {
  res.json({ status: "ok" });
});
@z

@x
app.post("/heroes/", async (req: Request, res: Response) => {
  const { name, secret_name, age } = req.body as {
    name: string;
    secret_name: string;
    age?: number;
  };
  const result = await pool.query(
    "INSERT INTO heroes (name, secret_name, age) VALUES ($1, $2, $3) RETURNING *",
    [name, secret_name, age],
  );
  res.json(result.rows[0]);
});
@y
app.post("/heroes/", async (req: Request, res: Response) => {
  const { name, secret_name, age } = req.body as {
    name: string;
    secret_name: string;
    age?: number;
  };
  const result = await pool.query(
    "INSERT INTO heroes (name, secret_name, age) VALUES ($1, $2, $3) RETURNING *",
    [name, secret_name, age],
  );
  res.json(result.rows[0]);
});
@z

@x
app.get("/heroes/", async (_req: Request, res: Response) => {
  const result = await pool.query("SELECT * FROM heroes");
  res.json(result.rows);
});
@y
app.get("/heroes/", async (_req: Request, res: Response) => {
  const result = await pool.query("SELECT * FROM heroes");
  res.json(result.rows);
});
@z

@x
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@y
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="package.json" status="modified" hl_lines="13,18" >}}
@y
{{< file path="package.json" status="modified" hl_lines="13,18" >}}
@z

@x
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@y
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
### Update Docker assets
@y
### Update Docker assets
@z

@x
Replace `Dockerfile` and `compose.yaml` with the following.
@y
Replace `Dockerfile` and `compose.yaml` with the following.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="Dockerfile" status="modified" hl_lines="12,34,37,63" >}}
@y
{{< file path="Dockerfile" status="modified" hl_lines="12,34,37,63" >}}
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@y
# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/
@z

@x
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@y
# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
@z

@x
# Development stage: install all dependencies, compile TypeScript, and
# serve with hot-reload. Used directly in development via compose.yaml.
FROM dhi.io/node:24-alpine3.23-dev AS dev
@y
# Development stage: install all dependencies, compile TypeScript, and
# serve with hot-reload. Used directly in development via compose.yaml.
FROM dhi.io/node:24-alpine3.23-dev AS dev
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Install dependencies as a separate step to take advantage of Docker's
# caching. Leverage a cache mount to /root/.npm to speed up subsequent
# builds. Leverage a bind mount to package.json to avoid having to copy
# it into this layer.
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci
@y
# Install dependencies as a separate step to take advantage of Docker's
# caching. Leverage a cache mount to /root/.npm to speed up subsequent
# builds. Leverage a bind mount to package.json to avoid having to copy
# it into this layer.
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci
@z

@x
# Copy the source code into the container and compile TypeScript.
COPY . .
RUN npm run build
@y
# Copy the source code into the container and compile TypeScript.
COPY . .
RUN npm run build
@z

@x
# Expose the port that the application listens on.
EXPOSE 3000
@y
# Expose the port that the application listens on.
EXPOSE 3000
@z

@x
# Run the application in development mode.
CMD ["npm", "run", "dev"]
@y
# Run the application in development mode.
CMD ["npm", "run", "dev"]
@z

@x
# Deps stage: install production dependencies only.
FROM dhi.io/node:24-alpine3.23-dev AS deps
@y
# Deps stage: install production dependencies only.
FROM dhi.io/node:24-alpine3.23-dev AS deps
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci --omit=dev
@y
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
# Once you create a package-lock.json by running npm install locally, switch to npm ci and bind both files:
# RUN --mount=type=cache,target=/root/.npm \
#     --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=package-lock.json,target=package-lock.json \
#     npm ci --omit=dev
@z

@x
# Runner stage: minimal runtime image with compiled app and production deps.
FROM dhi.io/node:24-alpine3.23 AS runner
@y
# Runner stage: minimal runtime image with compiled app and production deps.
FROM dhi.io/node:24-alpine3.23 AS runner
@z

@x
ENV PATH=/app/node_modules/.bin:$PATH
@y
ENV PATH=/app/node_modules/.bin:$PATH
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=dev --chown=node:node /app/dist ./dist
@y
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=dev --chown=node:node /app/dist ./dist
@z

@x
# Expose the port that the application listens on.
EXPOSE 3000
@y
# Expose the port that the application listens on.
EXPOSE 3000
@z

@x
# Run the application.
CMD ["node", "dist/index.js"]
```
@y
# Run the application.
CMD ["node", "dist/index.js"]
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="8" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="8" >}}
@z

@x
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
```
@y
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
#### About these changes
@y
#### About these changes
@z

@x
The `builder` stage from containerize is renamed to `dev` and gains `EXPOSE 3000` and `CMD ["npm", "run", "dev"]`, which runs `tsx watch` for hot-reload. The `deps` and `runner` stages are unchanged.
@y
The `builder` stage from containerize is renamed to `dev` and gains `EXPOSE 3000` and `CMD ["npm", "run", "dev"]`, which runs `tsx watch` for hot-reload. The `deps` and `runner` stages are unchanged.
@z

@x
In `compose.yaml`, the new `target: dev` line tells Compose to build and run the `dev` stage during development. Unlike the production image, the development image includes `tsx` and other dev tooling. If you need a shell in a running production container, use [Docker Debug](/reference/cli/docker/debug/) instead.
@y
In `compose.yaml`, the new `target: dev` line tells Compose to build and run the `dev` stage during development. Unlike the production image, the development image includes `tsx` and other dev tooling. If you need a shell in a running production container, use [Docker Debug](__SUBDIR__/reference/cli/docker/debug/) instead.
@z

@x
The build step runs `tsc`, which compiles each TypeScript file into a corresponding JavaScript file. [esbuild](https://esbuild.github.io/) is a popular alternative that bundles everything into a single output file and builds significantly faster. To switch, replace the `tsc` call in `package.json` with an esbuild command and update the `COPY --from=dev` path in the `runner` stage to match esbuild's output.
@y
The build step runs `tsc`, which compiles each TypeScript file into a corresponding JavaScript file. [esbuild](https://esbuild.github.io/) is a popular alternative that bundles everything into a single output file and builds significantly faster. To switch, replace the `tsc` call in `package.json` with an esbuild command and update the `COPY --from=dev` path in the `runner` stage to match esbuild's output.
@z

@x
### Add a local database and persist data
@y
### Add a local database and persist data
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data, and add a `db/password.txt` file that holds the database password.
@y
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data, and add a `db/password.txt` file that holds the database password.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="11-46" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="11-46" >}}
@z

@x
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
  # Database service. Reads the password from a Docker secret mounted at
  # /run/secrets/db-password. Compose waits for the healthcheck to pass
  # before starting the server, via the server's depends_on.
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
  # Database service. Reads the password from a Docker secret mounted at
  # /run/secrets/db-password. Compose waits for the healthcheck to pass
  # before starting the server, via the server's depends_on.
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="db/password.txt" status="new" >}}
@y
{{< file path="db/password.txt" status="new" >}}
@z

@x
```text
mysecretpassword
```
@y
```text
mysecretpassword
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/reference/compose-file/).
@y
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/reference/compose-file/).
@z

@x
Now, run the following `docker compose up` command to start your application.
@y
Now, run the following `docker compose up` command to start your application.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Now test your API endpoint. Open a new terminal and make a request to the server using the curl commands.
@y
Now test your API endpoint. Open a new terminal and make a request to the server using the curl commands.
@z

@x
Create an object with a POST request:
@y
Create an object with a POST request:
@z

@x
```console
$ curl -X 'POST' \
  'http://localhost:3000/heroes/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}'
```
@y
```console
$ curl -X 'POST' \
  'http://localhost:3000/heroes/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}'
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
{
  "id": 1,
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}
```
@y
```json
{
  "id": 1,
  "name": "my hero",
  "secret_name": "austing",
  "age": 12
}
```
@z

@x
Now make a GET request:
@y
Now make a GET request:
@z

@x
```console
$ curl http://localhost:3000/heroes/
```
@y
```console
$ curl http://localhost:3000/heroes/
```
@z

@x
You should receive the same response because it's the only object in the database.
@y
You should receive the same response because it's the only object in the database.
@z

@x
Press `ctrl`+`c` in the terminal to stop your application.
@y
Press `ctrl`+`c` in the terminal to stop your application.
@z

@x
### Automatically update services
@y
### Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yaml` file in an IDE or text editor and add the highlighted Compose Watch instructions.
@y
Open your `compose.yaml` file in an IDE or text editor and add the highlighted Compose Watch instructions.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="21-27" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="21-27" >}}
@z

@x
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
        - action: rebuild
          path: package.json
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
        - action: rebuild
          path: package.json
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
In a terminal, curl the application to get a response.
@y
In a terminal, curl the application to get a response.
@z

@x
```console
$ curl http://localhost:3000
{"message":"Hello World"}
```
@y
```console
$ curl http://localhost:3000
{"message":"Hello World"}
```
@z

@x
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@z

@x
Open `nodejs-docker-example/src/index.ts` in an IDE or text editor and update the `Hello World` string by adding a few more exclamation marks.
@y
Open `nodejs-docker-example/src/index.ts` in an IDE or text editor and update the `Hello World` string by adding a few more exclamation marks.
@z

@x
```diff
-  res.json({ message: 'Hello World' });
+  res.json({ message: 'Hello World!!!' });
```
@y
```diff
-  res.json({ message: 'Hello World' });
+  res.json({ message: 'Hello World!!!' });
```
@z

@x
Save the changes to `src/index.ts` and then wait a few seconds for the application to reload. Curl the application again and verify that the updated text appears.
@y
Save the changes to `src/index.ts` and then wait a few seconds for the application to reload. Curl the application again and verify that the updated text appears.
@z

@x
```console
$ curl http://localhost:3000
{"message":"Hello World!!!"}
```
@y
```console
$ curl http://localhost:3000
{"message":"Hello World!!!"}
```
@z

@x
Press `ctrl`+`c` in the terminal to stop your application.
@y
Press `ctrl`+`c` in the terminal to stop your application.
@z

@x
### Debug your application
@y
### Debug your application
@z

@x
`tsx watch` supports the Node.js inspector protocol, so you can attach a debugger from VS Code or Chrome DevTools and set breakpoints directly in your TypeScript source files.
@y
`tsx watch` supports the Node.js inspector protocol, so you can attach a debugger from VS Code or Chrome DevTools and set breakpoints directly in your TypeScript source files.
@z

@x
Update the `dev` script in `package.json` to start the inspector. The `--inspect=0.0.0.0:9229` flag tells Node.js to listen for debugger connections on all network interfaces at port 9229. Using `0.0.0.0` rather than `localhost` is necessary so the debugger is reachable from outside the container. Also expose the debug port in `compose.yaml`, and add a `.vscode/launch.json` file that tells VS Code how to attach to the running inspector.
@y
Update the `dev` script in `package.json` to start the inspector. The `--inspect=0.0.0.0:9229` flag tells Node.js to listen for debugger connections on all network interfaces at port 9229. Using `0.0.0.0` rather than `localhost` is necessary so the debugger is reachable from outside the container. Also expose the debug port in `compose.yaml`, and add a `.vscode/launch.json` file that tells VS Code how to attach to the running inspector.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="package.json" status="modified" hl_lines="9" >}}
@y
{{< file path="package.json" status="modified" hl_lines="9" >}}
@z

@x
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch --inspect=0.0.0.0:9229 src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@y
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch --inspect=0.0.0.0:9229 src/index.ts"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3"
  }
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path=".vscode/launch.json" status="new" >}}
@y
{{< file path=".vscode/launch.json" status="new" >}}
@z

@x
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to Docker Container",
      "type": "node",
      "request": "attach",
      "port": 9229,
      "address": "localhost",
      "localRoot": "${workspaceFolder}",
      "remoteRoot": "/app",
      "protocol": "inspector",
      "restart": true,
      "sourceMaps": true,
      "skipFiles": ["<node_internals>/**"]
    }
  ]
}
```
@y
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to Docker Container",
      "type": "node",
      "request": "attach",
      "port": 9229,
      "address": "localhost",
      "localRoot": "${workspaceFolder}",
      "remoteRoot": "/app",
      "protocol": "inspector",
      "restart": true,
      "sourceMaps": true,
      "skipFiles": ["<node_internals>/**"]
    }
  ]
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="compose.yaml" status="modified" hl_lines="11" >}}
@y
{{< file path="compose.yaml" status="modified" hl_lines="11" >}}
@z

@x
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
      - 9229:9229
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
        - action: rebuild
          path: package.json
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  # Application service. The `target: dev` line builds the development
  # image (includes tsx and dev tooling); the runner stage of the
  # Dockerfile is unused in development.
  server:
    build:
      context: .
      target: dev
    ports:
      - 3000:3000
      - 9229:9229
    environment:
      - POSTGRES_SERVER=db
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    depends_on:
      db:
        condition: service_healthy
    secrets:
      - db-password
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
        - action: rebuild
          path: package.json
  db:
    image: dhi.io/postgres:18
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
Rebuild and restart with the updated configuration:
@y
Rebuild and restart with the updated configuration:
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
When the inspector is ready, you'll see a line like the following in the logs:
@y
When the inspector is ready, you'll see a line like the following in the logs:
@z

@x
```text
Debugger listening on ws://0.0.0.0:9229/...
```
@y
```text
Debugger listening on ws://0.0.0.0:9229/...
```
@z

@x
#### VS Code
@y
#### VS Code
@z

@x
With `.vscode/launch.json` in place, attach the debugger using the Debug panel.
@y
With `.vscode/launch.json` in place, attach the debugger using the Debug panel.
@z

@x
Open the Debug panel (`Ctrl+Shift+D` on Windows and Linux, `Cmd+Shift+D` on Mac), select **Attach to Docker Container**, and press `F5`. You can now set breakpoints in your TypeScript source files under `src/`.
@y
Open the Debug panel (`Ctrl+Shift+D` on Windows and Linux, `Cmd+Shift+D` on Mac), select **Attach to Docker Container**, and press `F5`. You can now set breakpoints in your TypeScript source files under `src/`.
@z

@x
#### Chrome DevTools
@y
#### Chrome DevTools
@z

@x
You can also use the built-in Node.js inspector in Chrome without any editor setup.
@y
You can also use the built-in Node.js inspector in Chrome without any editor setup.
@z

@x
1. Open Chrome and go to `chrome://inspect`.
@y
1. Open Chrome and go to `chrome://inspect`.
@z

@x
2. Select **Configure** and add `localhost:9229`.
@y
2. Select **Configure** and add `localhost:9229`.
@z

@x
3. When your Node.js target appears in the list, select **inspect**.
@y
3. When your Node.js target appears in the list, select **inspect**.
@z

@x
#### Troubleshoot the debugger
@y
#### Troubleshoot the debugger
@z

@x
If the debugger doesn't connect, verify the container is running and the port is mapped correctly:
@y
If the debugger doesn't connect, verify the container is running and the port is mapped correctly:
@z

@x
```console
$ docker compose ps
$ docker compose logs server
```
@y
```console
$ docker compose ps
$ docker compose logs server
```
@z

@x
The logs should include a line like:
@y
The logs should include a line like:
@z

@x
```text
Debugger listening on ws://0.0.0.0:9229/...
```
@y
```text
Debugger listening on ws://0.0.0.0:9229/...
```
@z

@x
If that line is missing, confirm the `dev` script in `package.json` includes `--inspect=0.0.0.0:9229` and that `9229:9229` appears in the `ports` list for the `server` service in `compose.yaml`.
@y
If that line is missing, confirm the `dev` script in `package.json` includes `--inspect=0.0.0.0:9229` and that `9229:9229` appears in the `ports` list for the `server` service in `compose.yaml`.
@z

@x
For more details about Node.js debugging, see the [Node.js debugging guide](https://nodejs.org/en/docs/guides/debugging-getting-started).
@y
For more details about Node.js debugging, see the [Node.js debugging guide](https://nodejs.org/en/docs/guides/debugging-getting-started).
@z

@x
## Run Node.js tests in a container
@y
## Run Node.js tests in a container
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](#containerize-a-nodejs-application).
@y
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](#containerize-a-nodejs-application).
@z

@x
### Overview
@y
### Overview
@z

@x
Testing is a core part of building reliable software. Docker makes it easy to
run your tests in the same environment used in CI and production, so failures
are caught before they reach your users.
@y
Testing is a core part of building reliable software. Docker makes it easy to
run your tests in the same environment used in CI and production, so failures
are caught before they reach your users.
@z

@x
In this section, you'll add [Vitest](https://vitest.dev/) to the project and
run tests both locally and inside a container.
@y
In this section, you'll add [Vitest](https://vitest.dev/) to the project and
run tests both locally and inside a container.
@z

@x
### Update the application
@y
### Update the application
@z

@x
You'll refactor `src/index.ts` to export the Express `app` instance so tests
can import it without starting a server. Add a test file and update
`package.json` to add Vitest and a test runner for HTTP requests. The file browser shows only the files that change in this step.
@y
You'll refactor `src/index.ts` to export the Express `app` instance so tests
can import it without starting a server. Add a test file and update
`package.json` to add Vitest and a test runner for HTTP requests. The file browser shows only the files that change in this step.
@z

@x
{{< files name="nodejs-docker-example" >}}
@y
{{< files name="nodejs-docker-example" >}}
@z

@x
{{< file path="src/index.ts" status="modified" hl_lines="10,31,70-75" >}}
@y
{{< file path="src/index.ts" status="modified" hl_lines="10,31,70-75" >}}
@z

@x
```typescript
// Express application backed by a PostgreSQL database.
// Creates a heroes table at startup.
// Endpoints: GET / (greeting), GET /health (health check), POST /heroes/ (create), GET /heroes/ (list).
// See https://expressjs.com/ and https://node-postgres.com/
@y
```typescript
// Express application backed by a PostgreSQL database.
// Creates a heroes table at startup.
// Endpoints: GET / (greeting), GET /health (health check), POST /heroes/ (create), GET /heroes/ (list).
// See https://expressjs.com/ and https://node-postgres.com/
@z

@x
import express, { type Request, type Response } from "express";
import { Pool } from "pg";
import { readFileSync } from "fs";
@y
import express, { type Request, type Response } from "express";
import { Pool } from "pg";
import { readFileSync } from "fs";
@z

@x
export const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@y
export const app = express();
const port = parseInt(process.env.PORT ?? "3000", 10);
@z

@x
app.use(express.json());
@y
app.use(express.json());
@z

@x
function getPassword(): string {
  const passwordFile = process.env.POSTGRES_PASSWORD_FILE;
  if (passwordFile) {
    return readFileSync(passwordFile, "utf8").trim();
  }
  return process.env.POSTGRES_PASSWORD ?? "";
}
@y
function getPassword(): string {
  const passwordFile = process.env.POSTGRES_PASSWORD_FILE;
  if (passwordFile) {
    return readFileSync(passwordFile, "utf8").trim();
  }
  return process.env.POSTGRES_PASSWORD ?? "";
}
@z

@x
const pool = new Pool({
  host: process.env.POSTGRES_SERVER,
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: getPassword(),
});
@y
const pool = new Pool({
  host: process.env.POSTGRES_SERVER,
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: getPassword(),
});
@z

@x
if (process.env.POSTGRES_SERVER) {
  pool
    .query(
      `CREATE TABLE IF NOT EXISTS heroes (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        secret_name TEXT NOT NULL,
        age INTEGER
      )`,
    )
    .catch(console.error);
}
@y
if (process.env.POSTGRES_SERVER) {
  pool
    .query(
      `CREATE TABLE IF NOT EXISTS heroes (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        secret_name TEXT NOT NULL,
        age INTEGER
      )`,
    )
    .catch(console.error);
}
@z

@x
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@y
app.get("/", (_req: Request, res: Response) => {
  res.json({ message: "Hello World" });
});
@z

@x
app.get("/health", (_req: Request, res: Response) => {
  res.json({ status: "ok" });
});
@y
app.get("/health", (_req: Request, res: Response) => {
  res.json({ status: "ok" });
});
@z

@x
app.post("/heroes/", async (req: Request, res: Response) => {
  const { name, secret_name, age } = req.body as {
    name: string;
    secret_name: string;
    age?: number;
  };
  const result = await pool.query(
    "INSERT INTO heroes (name, secret_name, age) VALUES ($1, $2, $3) RETURNING *",
    [name, secret_name, age],
  );
  res.json(result.rows[0]);
});
@y
app.post("/heroes/", async (req: Request, res: Response) => {
  const { name, secret_name, age } = req.body as {
    name: string;
    secret_name: string;
    age?: number;
  };
  const result = await pool.query(
    "INSERT INTO heroes (name, secret_name, age) VALUES ($1, $2, $3) RETURNING *",
    [name, secret_name, age],
  );
  res.json(result.rows[0]);
});
@z

@x
app.get("/heroes/", async (_req: Request, res: Response) => {
  const result = await pool.query("SELECT * FROM heroes");
  res.json(result.rows);
});
@y
app.get("/heroes/", async (_req: Request, res: Response) => {
  const result = await pool.query("SELECT * FROM heroes");
  res.json(result.rows);
});
@z

@x
// Only start the server when this file is run directly.
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
  });
}
```
@y
// Only start the server when this file is run directly.
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
  });
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="src/index.test.ts" status="new" >}}
@y
{{< file path="src/index.test.ts" status="new" >}}
@z

@x
```typescript
// Unit tests for the Express application.
// Tests the root endpoint without starting a server.
// See https://vitest.dev/ for the test framework reference.
@y
```typescript
// Unit tests for the Express application.
// Tests the root endpoint without starting a server.
// See https://vitest.dev/ for the test framework reference.
@z

@x
import { describe, it, expect } from "vitest";
import request from "supertest";
import { app } from "./index";
@y
import { describe, it, expect } from "vitest";
import request from "supertest";
import { app } from "./index";
@z

@x
describe("GET /", () => {
  it("returns a JSON greeting", async () => {
    const response = await request(app).get("/");
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ message: "Hello World" });
  });
});
```
@y
describe("GET /", () => {
  it("returns a JSON greeting", async () => {
    const response = await request(app).get("/");
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ message: "Hello World" });
  });
});
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< file path="package.json" status="modified" hl_lines="10,20-22" >}}
@y
{{< file path="package.json" status="modified" hl_lines="10,20-22" >}}
@z

@x
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts",
    "test": "vitest run"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "supertest": "^7.0.0",
    "@types/supertest": "^6.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3",
    "vitest": "^3.0.0"
  }
}
```
@y
```json
{
  "name": "nodejs-docker-example",
  "version": "1.0.0",
  "description": "A minimal Node.js TypeScript application.",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "node dist/index.js",
    "dev": "tsx watch src/index.ts",
    "test": "vitest run"
  },
  "dependencies": {
    "express": "^4.21.2",
    "pg": "^8.16.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^22.0.0",
    "@types/pg": "^8.11.0",
    "supertest": "^7.0.0",
    "@types/supertest": "^6.0.0",
    "tsx": "^4.19.3",
    "typescript": "^5.8.3",
    "vitest": "^3.0.0"
  }
}
```
@z

@x
{{< /file >}}
@y
{{< /file >}}
@z

@x
{{< /files >}}
@y
{{< /files >}}
@z

@x
### Run tests locally
@y
### Run tests locally
@z

@x
Run the following command to run the tests locally:
@y
Run the following command to run the tests locally:
@z

@x
```console
$ npm install
$ npm test
```
@y
```console
$ npm install
$ npm test
```
@z

@x
You should see output like the following:
@y
You should see output like the following:
@z

@x
```console
 RUN  v3.0.0 /app
@y
```console
 RUN  v3.0.0 /app
@z

@x
 ✓ src/index.test.ts (1)
   ✓ GET / (1)
     ✓ returns a JSON greeting
@y
 ✓ src/index.test.ts (1)
   ✓ GET / (1)
     ✓ returns a JSON greeting
@z

@x
 Test Files  1 passed (1)
      Tests  1 passed (1)
   Start at  12:00:00
   Duration  500ms
```
@y
 Test Files  1 passed (1)
      Tests  1 passed (1)
   Start at  12:00:00
   Duration  500ms
```
@z

@x
### Run tests in a container
@y
### Run tests in a container
@z

@x
Run the tests using the dev stage of your Dockerfile:
@y
Run the tests using the dev stage of your Dockerfile:
@z

@x
```console
$ docker compose run --build --rm --no-deps server npm test
```
@y
```console
$ docker compose run --build --rm --no-deps server npm test
```
@z

@x
The `--no-deps` flag skips starting the database, since the unit tests don't require it. The `--rm` flag removes the container when the tests finish.
@y
The `--no-deps` flag skips starting the database, since the unit tests don't require it. The `--rm` flag removes the container when the tests finish.
@z

@x
You should see the same test output as when running locally.
@y
You should see the same test output as when running locally.
@z

@x
### Run tests when building
@y
### Run tests when building
@z

@x
To run tests during the Docker build process, add a `test` stage to your Dockerfile that runs after the dev stage.
@y
To run tests during the Docker build process, add a `test` stage to your Dockerfile that runs after the dev stage.
@z

@x
```dockerfile {hl_lines="32-36"}
FROM dhi.io/node:24-alpine3.23-dev AS dev
@y
```dockerfile {hl_lines="32-36"}
FROM dhi.io/node:24-alpine3.23-dev AS dev
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
@y
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install
@z

@x
COPY . .
RUN npm run build
@y
COPY . .
RUN npm run build
@z

@x
EXPOSE 3000
CMD ["npm", "run", "dev"]
@y
EXPOSE 3000
CMD ["npm", "run", "dev"]
@z

@x
FROM dhi.io/node:24-alpine3.23-dev AS deps
WORKDIR /app
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
@y
FROM dhi.io/node:24-alpine3.23-dev AS deps
WORKDIR /app
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=bind,source=package.json,target=package.json \
    npm install --omit=dev
@z

@x
FROM dhi.io/node:24-alpine3.23 AS runner
ENV PATH=/app/node_modules/.bin:$PATH
WORKDIR /app
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=dev --chown=node:node /app/dist ./dist
@y
FROM dhi.io/node:24-alpine3.23 AS runner
ENV PATH=/app/node_modules/.bin:$PATH
WORKDIR /app
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --from=dev --chown=node:node /app/dist ./dist
@z

@x
EXPOSE 3000
CMD ["node", "dist/index.js"]
@y
EXPOSE 3000
CMD ["node", "dist/index.js"]
@z

@x
FROM dev AS test
@y
FROM dev AS test
@z

@x
ENV CI=true
@y
ENV CI=true
@z

@x
CMD ["npm", "test"]
```
@y
CMD ["npm", "test"]
```
@z

@x
Then build and run the test stage:
@y
Then build and run the test stage:
@z

@x
```console
$ docker build --target test -t nodejs-app-test .
$ docker run --rm nodejs-app-test
```
@y
```console
$ docker build --target test -t nodejs-app-test .
$ docker run --rm nodejs-app-test
```
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you learned how to run tests when developing locally and inside a container.
@y
In this section, you learned how to run tests when developing locally and inside a container.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile/)
- [Compose file reference](/compose/compose-file/)
- [`docker compose run` CLI reference](/reference/cli/docker/compose/run/)
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
- [Compose file reference](__SUBDIR__/compose/compose-file/)
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/)
@z
