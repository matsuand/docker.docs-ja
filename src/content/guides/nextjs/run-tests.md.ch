%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Run Next.js tests in a container
linkTitle: Run your tests and lint
@y
title: Run Next.js tests in a container
linkTitle: Run your tests and lint
@z

@x
keywords: next.js, test, jest, vitest, lint, eslint
description: Learn how to run your Next.js tests and lint in a container.
@y
keywords: next.js, test, jest, vitest, lint, eslint
description: Learn how to run your Next.js tests and lint in a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize Next.js application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize Next.js application](containerize.md).
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
- Run unit tests using Vitest (or Jest) inside a Docker container.
- Run lint (e.g. ESLint) inside a Docker container.
- Use Docker Compose to run tests and lint in an isolated, reproducible environment.
@y
- Run unit tests using Vitest (or Jest) inside a Docker container.
- Run lint (e.g. ESLint) inside a Docker container.
- Use Docker Compose to run tests and lint in an isolated, reproducible environment.
@z

@x
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) uses [Vitest](https://vitest.dev/) with [Testing Library](https://testing-library.com/) for component testing. You can use the same setup or follow the alternative Jest configuration later.
@y
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) uses [Vitest](https://vitest.dev/) with [Testing Library](https://testing-library.com/) for component testing. You can use the same setup or follow the alternative Jest configuration later.
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
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) already includes lint (ESLint) and sample tests (Vitest, `app/page.test.tsx`) in place. If you're using the sample app, you can skip to **Step 3: Update compose.yaml** and run tests or lint with the commands below. If you're using your own project, follow the install and configuration steps to add the packages and scripts.
@y
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) already includes lint (ESLint) and sample tests (Vitest, `app/page.test.tsx`) in place. If you're using the sample app, you can skip to **Step 3: Update compose.yaml** and run tests or lint with the commands below. If you're using your own project, follow the install and configuration steps to add the packages and scripts.
@z

@x
The sample includes a test file at:
@y
The sample includes a test file at:
@z

@x
```text
app/page.test.tsx
```
@y
```text
app/page.test.tsx
```
@z

@x
This file uses Vitest and React Testing Library to verify the behavior of page components.
@y
This file uses Vitest and React Testing Library to verify the behavior of page components.
@z

@x
### Step 1: Install Vitest and React Testing Library (custom projects)
@y
### Step 1: Install Vitest and React Testing Library (custom projects)
@z

@x
If you're using a custom project and haven't already added the necessary testing tools, install them by running:
@y
If you're using a custom project and haven't already added the necessary testing tools, install them by running:
@z

@x
```console
$ npm install --save-dev vitest @vitejs/plugin-react @testing-library/react @testing-library/dom jsdom
```
@y
```console
$ npm install --save-dev vitest @vitejs/plugin-react @testing-library/react @testing-library/dom jsdom
```
@z

@x
Then, update the scripts section of your `package.json` file to include:
@y
Then, update the scripts section of your `package.json` file to include:
@z

@x
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run"
}
```
@y
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run"
}
```
@z

@x
For lint, add a `lint` script (and optionally `lint:fix`). For example, with [ESLint](https://eslint.org/):
@y
For lint, add a `lint` script (and optionally `lint:fix`). For example, with [ESLint](https://eslint.org/):
@z

@x
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix"
}
```
@y
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix"
}
```
@z

@x
The sample project uses `eslint` and `eslint-config-next` for Next.js. Install them in a custom project with:
@y
The sample project uses `eslint` and `eslint-config-next` for Next.js. Install them in a custom project with:
@z

@x
```console
$ npm install --save-dev eslint eslint-config-next @eslint/eslintrc
```
@y
```console
$ npm install --save-dev eslint eslint-config-next @eslint/eslintrc
```
@z

@x
Create an ESLint config file (e.g. `eslint.config.cjs`) in your project root with Next.js rules and global ignores:
@y
Create an ESLint config file (e.g. `eslint.config.cjs`) in your project root with Next.js rules and global ignores:
@z

@x
```js
const { defineConfig, globalIgnores } = require("eslint/config");
const { FlatCompat } = require("@eslint/eslintrc");
@y
```js
const { defineConfig, globalIgnores } = require("eslint/config");
const { FlatCompat } = require("@eslint/eslintrc");
@z

@x
const compat = new FlatCompat({ baseDirectory: __dirname });
@y
const compat = new FlatCompat({ baseDirectory: __dirname });
@z

@x
module.exports = defineConfig([
  ...compat.extends(
    "eslint-config-next/core-web-vitals",
    "eslint-config-next/typescript"
  ),
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "node_modules/**",
    "eslint.config.cjs",
  ]),
]);
```
@y
module.exports = defineConfig([
  ...compat.extends(
    "eslint-config-next/core-web-vitals",
    "eslint-config-next/typescript"
  ),
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "node_modules/**",
    "eslint.config.cjs",
  ]),
]);
```
@z

@x
---
@y
---
@z

@x
### Step 2: Configure Vitest (custom projects)
@y
### Step 2: Configure Vitest (custom projects)
@z

@x
If you're using a custom project, create a `vitest.config.ts` file in your project root (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@y
If you're using a custom project, create a `vitest.config.ts` file in your project root (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@z

@x
```ts
import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
@y
```ts
import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
@z

@x
export default defineConfig({
  plugins: [react()],
  test: {
    environment: "jsdom",
    setupFiles: "./vitest.setup.ts",
    globals: true,
  },
});
```
@y
export default defineConfig({
  plugins: [react()],
  test: {
    environment: "jsdom",
    setupFiles: "./vitest.setup.ts",
    globals: true,
  },
});
```
@z

@x
Create a `vitest.setup.ts` file in your project root:
@y
Create a `vitest.setup.ts` file in your project root:
@z

@x
```ts
import "@testing-library/jest-dom/vitest";
```
@y
```ts
import "@testing-library/jest-dom/vitest";
```
@z

@x
> [!NOTE]
> Vitest works well with Next.js and provides fast execution and ESM support. For more details, see the [Next.js testing documentation](https://nextjs.org/docs/app/building-your-application/testing) and [Vitest docs](https://vitest.dev/).
@y
> [!NOTE]
> Vitest works well with Next.js and provides fast execution and ESM support. For more details, see the [Next.js testing documentation](https://nextjs.org/docs/app/building-your-application/testing) and [Vitest docs](https://vitest.dev/).
@z

@x
### Step 3: Update compose.yaml
@y
### Step 3: Update compose.yaml
@z

@x
Add `nextjs-test` and `nextjs-lint` services to your `compose.yaml` file. In the sample project these services use the `tools` profile so they don't start with a normal `docker compose up`. Both reuse `Dockerfile.dev` and run the test or lint command:
@y
Add `nextjs-test` and `nextjs-lint` services to your `compose.yaml` file. In the sample project these services use the `tools` profile so they don't start with a normal `docker compose up`. Both reuse `Dockerfile.dev` and run the test or lint command:
@z

@x
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@y
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@z

@x
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
@y
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
@z

@x
  nextjs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-test
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run test:run 2>/dev/null || npm run test -- --run; elif [ -f yarn.lock ]; then yarn test:run 2>/dev/null || yarn test --run; elif [ -f pnpm-lock.yaml ]; then pnpm run test:run; else npm run test -- --run; fi",
      ]
    profiles:
      - tools
@y
  nextjs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-test
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run test:run 2>/dev/null || npm run test -- --run; elif [ -f yarn.lock ]; then yarn test:run 2>/dev/null || yarn test --run; elif [ -f pnpm-lock.yaml ]; then pnpm run test:run; else npm run test -- --run; fi",
      ]
    profiles:
      - tools
@z

@x
  nextjs-lint:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-lint
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run lint; elif [ -f yarn.lock ]; then yarn lint; elif [ -f pnpm-lock.yaml ]; then pnpm lint; else npm run lint; fi",
      ]
    profiles:
      - tools
```
@y
  nextjs-lint:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-lint
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run lint; elif [ -f yarn.lock ]; then yarn lint; elif [ -f pnpm-lock.yaml ]; then pnpm lint; else npm run lint; fi",
      ]
    profiles:
      - tools
```
@z

@x
The `nextjs-test` and `nextjs-lint` services reuse the same `Dockerfile.dev` used for [development](develop.md) and override the default command to run tests or lint. The `profiles: [tools]` means these services only run when you use the `--profile tools` option.
@y
The `nextjs-test` and `nextjs-lint` services reuse the same `Dockerfile.dev` used for [development](develop.md) and override the default command to run tests or lint. The `profiles: [tools]` means these services only run when you use the `--profile tools` option.
@z

@x
After completing the previous steps, your project directory should contain:
@y
After completing the previous steps, your project directory should contain:
@z

@x
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── vitest.config.ts
│ ├── vitest.setup.ts
│ ├── next.config.ts
│ └── README.Docker.md
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── vitest.config.ts
│ ├── vitest.setup.ts
│ ├── next.config.ts
│ └── README.Docker.md
```
@z

@x
### Step 4: Run the tests
@y
### Step 4: Run the tests
@z

@x
To execute your test suite inside the container, run from your project root:
@y
To execute your test suite inside the container, run from your project root:
@z

@x
```console
$ docker compose --profile tools run --rm nextjs-test
```
@y
```console
$ docker compose --profile tools run --rm nextjs-test
```
@z

@x
This command will:
- Start the `nextjs-test` service (because of `--profile tools`).
- Run your test script (`test:run` or `test -- --run`) in the same environment as development.
- Remove the container after the tests complete ([`docker compose run --rm`](/reference/cli/docker/compose/run/)).
@y
This command will:
- Start the `nextjs-test` service (because of `--profile tools`).
- Run your test script (`test:run` or `test -- --run`) in the same environment as development.
- Remove the container after the tests complete ([`docker compose run --rm`](__SUBDIR__/reference/cli/docker/compose/run/)).
@z

@x
> [!NOTE]
> For more information about Compose commands and profiles, see the [Compose CLI reference](/reference/cli/docker/compose/).
@y
> [!NOTE]
> For more information about Compose commands and profiles, see the [Compose CLI reference](__SUBDIR__/reference/cli/docker/compose/).
@z

@x
### Step 5: Run lint in the container
@y
### Step 5: Run lint in the container
@z

@x
To run your linter (e.g. ESLint) inside the container, use the `nextjs-lint` service with the same `tools` profile:
@y
To run your linter (e.g. ESLint) inside the container, use the `nextjs-lint` service with the same `tools` profile:
@z

@x
```console
$ docker compose --profile tools run --rm nextjs-lint
```
@y
```console
$ docker compose --profile tools run --rm nextjs-lint
```
@z

@x
This command will:
- Start the `nextjs-lint` service (because of `--profile tools`).
- Run your lint script (`npm run lint`, `yarn lint`, or `pnpm lint` depending on your lockfile) in the same environment as development.
- Remove the container after lint completes.
@y
This command will:
- Start the `nextjs-lint` service (because of `--profile tools`).
- Run your lint script (`npm run lint`, `yarn lint`, or `pnpm lint` depending on your lockfile) in the same environment as development.
- Remove the container after lint completes.
@z

@x
Ensure your `package.json` includes a `lint` script. The sample project already has `"lint": "eslint ."` and `"lint:fix": "eslint . --fix"`; for a custom project, add the same and install `eslint` and `eslint-config-next` if needed.
@y
Ensure your `package.json` includes a `lint` script. The sample project already has `"lint": "eslint ."` and `"lint:fix": "eslint . --fix"`; for a custom project, add the same and install `eslint` and `eslint-config-next` if needed.
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
In this section, you learned how to run unit tests for your Next.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your Next.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
- Installed and configured Vitest and React Testing Library for testing Next.js components.
- Created `nextjs-test` and `nextjs-lint` services in `compose.yaml` (with `tools` profile) to isolate test and lint execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev, test, and lint environments.
- Ran tests inside the container using `docker compose --profile tools run --rm nextjs-test`.
- Ran lint inside the container using `docker compose --profile tools run --rm nextjs-lint`.
- Ensured reliable, repeatable testing and linting across environments without relying on local machine setup.
@y
What you accomplished:
- Installed and configured Vitest and React Testing Library for testing Next.js components.
- Created `nextjs-test` and `nextjs-lint` services in `compose.yaml` (with `tools` profile) to isolate test and lint execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev, test, and lint environments.
- Ran tests inside the container using `docker compose --profile tools run --rm nextjs-test`.
- Ran lint inside the container using `docker compose --profile tools run --rm nextjs-lint`.
- Ensured reliable, repeatable testing and linting across environments without relying on local machine setup.
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
- [Next.js Testing Documentation](https://nextjs.org/docs/app/building-your-application/testing) – Official Next.js testing guide.
---
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.  
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
- [Next.js Testing Documentation](https://nextjs.org/docs/app/building-your-application/testing) – Official Next.js testing guide.
---
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your Next.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@y
Next, you'll learn how to set up a CI/CD pipeline using GitHub Actions to automatically build and test your Next.js application in a containerized environment. This ensures your code is validated on every push or pull request, maintaining consistency and reliability across your development workflow.
@z
