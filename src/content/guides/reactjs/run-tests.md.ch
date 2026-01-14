%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Run React.js tests in a container
linkTitle: Run your tests
@y
title: Run React.js tests in a container
linkTitle: Run your tests
@z

@x
keywords: react.js, react, test, vitest
description: Learn how to run your React.js tests in a container.
@y
keywords: react.js, react, test, vitest
description: Learn how to run your React.js tests in a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize React.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize React.js application](containerize.md).
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
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — along with [Testing Library](https://testing-library.com/) for assertions.
@y
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — along with [Testing Library](https://testing-library.com/) for assertions.
@z

@x
## Run tests during development
@y
## Run tests during development
@z

@x
`docker-reactjs-sample` application includes a sample test file at location:
@y
`docker-reactjs-sample` application includes a sample test file at location:
@z

@x
```console
$ src/App.test.tsx
```
@y
```console
$ src/App.test.tsx
```
@z

@x
This file uses Vitest and React Testing Library to verify the behavior of `App` component.
@y
This file uses Vitest and React Testing Library to verify the behavior of `App` component.
@z

@x
### Step 1: Install Vitest and React Testing Library
@y
### Step 1: Install Vitest and React Testing Library
@z

@x
If you haven’t already added the necessary testing tools, install them by running:
@y
If you haven’t already added the necessary testing tools, install them by running:
@z

@x
```console
$ npm install --save-dev vitest @testing-library/react @testing-library/jest-dom jsdom
```
@y
```console
$ npm install --save-dev vitest @testing-library/react @testing-library/jest-dom jsdom
```
@z

@x
Then, update the scripts section of your `package.json` file to include the following:
@y
Then, update the scripts section of your `package.json` file to include the following:
@z

% snip code...

@x
### Step 2: Configure Vitest
@y
### Step 2: Configure Vitest
@z

@x
Update `vitest.config.ts` file in your project root with the following configuration:
@y
Update `vitest.config.ts` file in your project root with the following configuration:
@z

@x
```ts {hl_lines="14-18",linenos=true}
/// <reference types="vitest" />
@y
```ts {hl_lines="14-18",linenos=true}
/// <reference types="vitest" />
@z

@x
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@y
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@z

@x
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
  test: {
    environment: "jsdom",
    setupFiles: "./src/setupTests.ts",
    globals: true,
  },
});
```
@y
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
  test: {
    environment: "jsdom",
    setupFiles: "./src/setupTests.ts",
    globals: true,
  },
});
```
@z

@x
> [!NOTE]
> The `test` options in `vitest.config.ts` are essential for reliable testing inside Docker:
> - `environment: "jsdom"` simulates a browser-like environment for rendering and DOM interactions.  
> - `setupFiles: "./src/setupTests.ts"` loads global configuration or mocks before each test file (optional but recommended).  
> - `globals: true` enables global test functions like `describe`, `it`, and `expect` without importing them.
>
> For more details, see the official [Vitest configuration docs](https://vitest.dev/config/).
@y
> [!NOTE]
> The `test` options in `vitest.config.ts` are essential for reliable testing inside Docker:
> - `environment: "jsdom"` simulates a browser-like environment for rendering and DOM interactions.  
> - `setupFiles: "./src/setupTests.ts"` loads global configuration or mocks before each test file (optional but recommended).  
> - `globals: true` enables global test functions like `describe`, `it`, and `expect` without importing them.
>
> For more details, see the official [Vitest configuration docs](https://vitest.dev/config/).
@z

@x
### Step 3: Update compose.yaml
@y
### Step 3: Update compose.yaml
@z

@x
Add a new service named `react-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@y
Add a new service named `react-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@z

@x
```yaml {hl_lines="22-26",linenos=true}
services:
  react-dev:
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
```yaml {hl_lines="22-26",linenos=true}
services:
  react-dev:
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
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@y
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@z

@x
  react-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test"]
@y
  react-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test"]
@z

@x
```
@y
```
@z

@x
The react-test service reuses the same `Dockerfile.dev` used for [development](develop.md) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@y
The react-test service reuses the same `Dockerfile.dev` used for [development](develop.md) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@z

@x
After completing the previous steps, your project directory should contain the following files:
@y
After completing the previous steps, your project directory should contain the following files:
@z

@x
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@y
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@z

@x
### Step 4: Run the tests
@y
### Step 4: Run the tests
@z

@x
To execute your test suite inside the container, run the following command from your project root:
@y
To execute your test suite inside the container, run the following command from your project root:
@z

@x
```console
$ docker compose run --rm react-test
```
@y
```console
$ docker compose run --rm react-test
```
@z

@x
This command will:
- Start the `react-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](/engine/reference/commandline/compose_run) command.
@y
This command will:
- Start the `react-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](__SUBDIR__/engine/reference/commandline/compose_run) command.
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
## Summary
@y
## Summary
@z

@x
In this section, you learned how to run unit tests for your React.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your React.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
- Installed and configured Vitest and React Testing Library for testing React components.
- Created a `react-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm react-test`.
- Ensured reliable, repeatable testing across environments without relying on local machine setup.
@y
What you accomplished:
- Installed and configured Vitest and React Testing Library for testing React components.
- Created a `react-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm react-test`.
- Ensured reliable, repeatable testing across environments without relying on local machine setup.
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
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your React.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@y
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your React.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@z
