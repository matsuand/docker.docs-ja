%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
---
title: Run Node.js tests in a container
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
---
@y
---
title: Run Node.js tests in a container
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@y
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@z

@x
## Run tests when developing locally
@y
## Run tests when developing locally
@z

@x
The sample application already has the Jest package for running tests and has tests inside the `spec` directory. When developing locally, you can use Compose to run your tests.
@y
The sample application already has the Jest package for running tests and has tests inside the `spec` directory. When developing locally, you can use Compose to run your tests.
@z

@x
Run the following command to run the test script from the `package.json` file inside a container.
@y
Run the following command to run the test script from the `package.json` file inside a container.
@z

@x
```console
$ docker compose run server npm run test
```
@y
```console
$ docker compose run server npm run test
```
@z

@x
To learn more about the command, see [docker compose run](/engine/reference/commandline/compose_run/).
@y
To learn more about the command, see [docker compose run](__SUBDIR__/engine/reference/commandline/compose_run/).
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
> docker-nodejs@1.0.0 test
> jest
@y
```console
> docker-nodejs@1.0.0 test
> jest
@z

@x
 PASS  spec/routes/deleteItem.spec.js
 PASS  spec/routes/getItems.spec.js
 PASS  spec/routes/addItem.spec.js
 PASS  spec/routes/updateItem.spec.js
 PASS  spec/persistence/sqlite.spec.js
  ● Console
@y
 PASS  spec/routes/deleteItem.spec.js
 PASS  spec/routes/getItems.spec.js
 PASS  spec/routes/addItem.spec.js
 PASS  spec/routes/updateItem.spec.js
 PASS  spec/persistence/sqlite.spec.js
  ● Console
@z

@x
    console.log
      Using sqlite database at /tmp/todo.db
@y
    console.log
      Using sqlite database at /tmp/todo.db
@z

@x
      at Database.log (src/persistence/sqlite.js:18:25)
@y
      at Database.log (src/persistence/sqlite.js:18:25)
@z

@x
    console.log
      Using sqlite database at /tmp/todo.db
@y
    console.log
      Using sqlite database at /tmp/todo.db
@z

@x
      at Database.log (src/persistence/sqlite.js:18:25)
@y
      at Database.log (src/persistence/sqlite.js:18:25)
@z

@x
    console.log
      Using sqlite database at /tmp/todo.db
@y
    console.log
      Using sqlite database at /tmp/todo.db
@z

@x
      at Database.log (src/persistence/sqlite.js:18:25)
@y
      at Database.log (src/persistence/sqlite.js:18:25)
@z

@x
    console.log
      Using sqlite database at /tmp/todo.db
@y
    console.log
      Using sqlite database at /tmp/todo.db
@z

@x
      at Database.log (src/persistence/sqlite.js:18:25)
@y
      at Database.log (src/persistence/sqlite.js:18:25)
@z

@x
    console.log
      Using sqlite database at /tmp/todo.db
@y
    console.log
      Using sqlite database at /tmp/todo.db
@z

@x
      at Database.log (src/persistence/sqlite.js:18:25)
@y
      at Database.log (src/persistence/sqlite.js:18:25)
@z

@x
Test Suites: 5 passed, 5 total
Tests:       9 passed, 9 total
Snapshots:   0 total
Time:        2.008 s
Ran all test suites.
```
@y
Test Suites: 5 passed, 5 total
Tests:       9 passed, 9 total
Snapshots:   0 total
Time:        2.008 s
Ran all test suites.
```
@z

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run your tests when building, you need to update your Dockerfile to add a new test stage.
@y
To run your tests when building, you need to update your Dockerfile to add a new test stage.
@z

@x
The following is the updated Dockerfile.
@y
The following is the updated Dockerfile.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
ARG NODE_VERSION=18.0.0
@y
ARG NODE_VERSION=18.0.0
@z

@x
FROM node:${NODE_VERSION}-alpine as base
WORKDIR /usr/src/app
EXPOSE 3000
@y
FROM node:${NODE_VERSION}-alpine as base
WORKDIR /usr/src/app
EXPOSE 3000
@z

@x
FROM base as dev
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev
USER node
COPY . .
CMD npm run dev
@y
FROM base as dev
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev
USER node
COPY . .
CMD npm run dev
@z

@x
FROM base as prod
ENV NODE_ENV production
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev
USER node
COPY . .
CMD node src/index.js
@y
FROM base as prod
ENV NODE_ENV production
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev
USER node
COPY . .
CMD node src/index.js
@z

@x
FROM base as test
ENV NODE_ENV test
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev
USER node
COPY . .
RUN npm run test
```
@y
FROM base as test
ENV NODE_ENV test
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev
USER node
COPY . .
RUN npm run test
```
@z

@x
Instead of using `CMD` in the test stage, use `RUN` to run the tests. The reason is that the `CMD` instruction runs when the container runs, and the `RUN` instruction runs when the image is being built and the build will fail if the tests fail.
@y
Instead of using `CMD` in the test stage, use `RUN` to run the tests. The reason is that the `CMD` instruction runs when the container runs, and the `RUN` instruction runs when the image is being built and the build will fail if the tests fail.
@z

@x
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@y
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@z

@x
```console
$ docker build -t node-docker-image-test --progress=plain --no-cache --target test .
```
@y
```console
$ docker build -t node-docker-image-test --progress=plain --no-cache --target test .
```
@z

@x
To learn more about building and running tests, see the [Build with Docker guide](../../build/guide/_index.md).
@y
To learn more about building and running tests, see the [Build with Docker guide](../../build/guide/_index.md).
@z

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

@x
```console
...
@y
```console
...
@z

@x
#11 [test 3/3] RUN npm run test
#11 1.058
#11 1.058 > docker-nodejs@1.0.0 test
#11 1.058 > jest
#11 1.058
#11 3.765 PASS spec/routes/getItems.spec.js
#11 3.767 PASS spec/routes/deleteItem.spec.js
#11 3.783 PASS spec/routes/updateItem.spec.js
#11 3.806 PASS spec/routes/addItem.spec.js
#11 4.179 PASS spec/persistence/sqlite.spec.js
#11 4.207
#11 4.208 Test Suites: 5 passed, 5 total
#11 4.208 Tests:       9 passed, 9 total
#11 4.208 Snapshots:   0 total
#11 4.208 Time:        2.168 s
#11 4.208 Ran all test suites.
#11 4.265 npm notice
#11 4.265 npm notice New major version of npm available! 8.6.0 -> 9.8.1
#11 4.265 npm notice Changelog: <https://github.com/npm/cli/releases/tag/v9.8.1>
#11 4.265 npm notice Run `npm install -g npm@9.8.1` to update!
#11 4.266 npm notice
#11 DONE 4.3s
@y
#11 [test 3/3] RUN npm run test
#11 1.058
#11 1.058 > docker-nodejs@1.0.0 test
#11 1.058 > jest
#11 1.058
#11 3.765 PASS spec/routes/getItems.spec.js
#11 3.767 PASS spec/routes/deleteItem.spec.js
#11 3.783 PASS spec/routes/updateItem.spec.js
#11 3.806 PASS spec/routes/addItem.spec.js
#11 4.179 PASS spec/persistence/sqlite.spec.js
#11 4.207
#11 4.208 Test Suites: 5 passed, 5 total
#11 4.208 Tests:       9 passed, 9 total
#11 4.208 Snapshots:   0 total
#11 4.208 Time:        2.168 s
#11 4.208 Ran all test suites.
#11 4.265 npm notice
#11 4.265 npm notice New major version of npm available! 8.6.0 -> 9.8.1
#11 4.265 npm notice Changelog: <https://github.com/npm/cli/releases/tag/v9.8.1>
#11 4.265 npm notice Run `npm install -g npm@9.8.1` to update!
#11 4.266 npm notice
#11 DONE 4.3s
@z

@x
...
```
@y
...
```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@y
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@z

@x
Related information:
 - [docker compose run](/engine/reference/commandline/compose_run/)
 - [Build with Docker guide](../../build/guide/index.md)
@y
Related information:
 - [docker compose run](__SUBDIR__/engine/reference/commandline/compose_run/)
 - [Build with Docker guide](../../build/guide/index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@y
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@z
