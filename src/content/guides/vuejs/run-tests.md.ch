%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Run vue.js tests in a container
linkTitle: Run your tests
@y
title: Run vue.js tests in a container
linkTitle: Run your tests
@z

@x
keywords: vue.js, vue, test, vitest
description: Learn how to run your vue.js tests in a container.
@y
keywords: vue.js, vue, test, vitest
description: Learn how to run your vue.js tests in a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize Vue.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize Vue.js application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
Testing is a critical part of the development process. In this section, you'll learn how to:
@y
Testing is a critical part of the development process. In this section, you'll learn how to:
@z

@x
- Run unit tests using Vitest inside a Docker container.
- Use Docker Compose to run tests in an isolated, reproducible environment.
@y
- Run unit tests using Vitest inside a Docker container.
- Use Docker Compose to run tests in an isolated, reproducible environment.
@z

@x
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — together with [@vue/test-utils](https://test-utils.vuejs.org/) to write unit tests that validate your component logic, props, events, and reactive behavior.
@y
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — together with [@vue/test-utils](https://test-utils.vuejs.org/) to write unit tests that validate your component logic, props, events, and reactive behavior.
@z

@x
This setup ensures your Vue.js components are tested in an environment that mirrors how users actually interact with your application.
@y
This setup ensures your Vue.js components are tested in an environment that mirrors how users actually interact with your application.
@z

@x
---
@y
---
@z

@x
## Run tests during development
@y
## Run tests during development
@z

@x
`docker-vuejs-sample` application includes a sample test file at location:
@y
`docker-vuejs-sample` application includes a sample test file at location:
@z

@x
```console
$ src/components/__tests__/HelloWorld.spec.ts
```
@y
```console
$ src/components/__tests__/HelloWorld.spec.ts
```
@z

@x
This test uses Vitest and Vue Test Utils to verify the behavior of the HelloWorld component.
@y
This test uses Vitest and Vue Test Utils to verify the behavior of the HelloWorld component.
@z

@x
---
@y
---
@z

@x
### Step 1: Update compose.yaml
@y
### Step 1: Update compose.yaml
@z

@x
Add a new service named `vuejs-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@y
Add a new service named `vuejs-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@z

@x
```yaml {hl_lines="22-26",linenos=true}
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@y
```yaml {hl_lines="22-26",linenos=true}
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@z

@x
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
@y
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
@z

@x
  vuejs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test:unit"]
```
@y
  vuejs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test:unit"]
```
@z

@x
The vuejs-test service reuses the same `Dockerfile.dev` used for [development](develop.md) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@y
The vuejs-test service reuses the same `Dockerfile.dev` used for [development](develop.md) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@z

@x
After completing the previous steps, your project directory should contain the following files:
@y
After completing the previous steps, your project directory should contain the following files:
@z

@x
```text
├── docker-vuejs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@y
```text
├── docker-vuejs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@z

@x
### Step 2: Run the tests
@y
### Step 2: Run the tests
@z

@x
To execute your test suite inside the container, run the following command from your project root:
@y
To execute your test suite inside the container, run the following command from your project root:
@z

@x
```console
$ docker compose run --rm vuejs-test
```
@y
```console
$ docker compose run --rm vuejs-test
```
@z

@x
This command will:
- Start the `vuejs-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](/engine/reference/commandline/compose_run) command.
@y
This command will:
- Start the `vuejs-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](__SUBDIR__/engine/reference/commandline/compose_run) command.
@z

@x
You should see output similar to the following:
@y
You should see output similar to the following:
@z

@x
```shell
Test Files: 1 passed (1)
Tests:      1 passed (1)
Start at:   16:50:55
Duration:   718ms
```
@y
```shell
Test Files: 1 passed (1)
Tests:      1 passed (1)
Start at:   16:50:55
Duration:   718ms
```
@z

@x
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](/reference/cli/docker/compose/_index.md).
@y
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](reference/cli/docker/compose/_index.md).
@z

@x
---
@y
---
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to run unit tests for your Vue.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your Vue.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
- Created a `vuejs-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm vuejs-test`.
- Ensured reliable, repeatable testing across environments without depending on your local machine setup.
@y
What you accomplished:
- Created a `vuejs-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm vuejs-test`.
- Ensured reliable, repeatable testing across environments without depending on your local machine setup.
@z

@x
---
@y
---
@z

@x
## Related resources
@y
## Related resources
@z

@x
Explore official references and best practices to sharpen your Docker testing workflow:
@y
Explore official references and best practices to sharpen your Docker testing workflow:
@z

@x
- [Dockerfile reference](/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.  
- [`docker compose run` CLI reference](/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
---
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.  
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
---
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your Vue.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@y
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your Vue.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@z
