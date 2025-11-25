%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Run Node.js tests in a container
linkTitle: Run your tests
@y
title: コンテナーでの Node.js テストの実行
linkTitle: テストの実行
@z

@x
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
@y
keywords: node.js, node, test
description: コンテナー内の Node.js テストを実行する方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@y
本ガイドの [Node.js アプリケーションのコンテナー化](containerize.md) から始まる前節までを完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
Testing is a core part of building reliable software. Whether you're writing unit tests, integration tests, or end-to-end tests, running them consistently across environments matters. Docker makes this easy by giving you the same setup locally, in CI/CD, and during image builds.
@y
Testing is a core part of building reliable software. Whether you're writing unit tests, integration tests, or end-to-end tests, running them consistently across environments matters. Docker makes this easy by giving you the same setup locally, in CI/CD, and during image builds.
@z

@x
## Run tests when developing locally
@y
## Run tests when developing locally
@z

@x
The sample application uses Vitest for testing, and it already includes tests for React components, custom hooks, API routes, database operations, and utility functions.
@y
The sample application uses Vitest for testing, and it already includes tests for React components, custom hooks, API routes, database operations, and utility functions.
@z

@x
### Run tests locally (without Docker)
@y
### Run tests locally (without Docker)
@z

@x
```console
$ npm run test
```
@y
```console
$ npm run test
```
@z

@x
### Add test service to Docker Compose
@y
### Add test service to Docker Compose
@z

@x
To run tests in a containerized environment, you need to add a dedicated test service to your `compose.yml` file. Add the following service configuration:
@y
To run tests in a containerized environment, you need to add a dedicated test service to your `compose.yml` file. Add the following service configuration:
@z

@x
```yaml
services:
  # ... existing services ...
@y
```yaml
services:
  # ... existing services ...
@z

@x
  # ========================================
  # Test Service
  # ========================================
  app-test:
    build:
      context: .
      dockerfile: Dockerfile
      target: test
    container_name: todoapp-test
    environment:
      NODE_ENV: test
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp_test
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: '${POSTGRES_PASSWORD:-todoapp_password}'
    depends_on:
      db:
        condition: service_healthy
    command: ['npm', 'run', 'test:coverage']
    networks:
      - todoapp-network
    profiles:
      - test
```
@y
  # ========================================
  # Test Service
  # ========================================
  app-test:
    build:
      context: .
      dockerfile: Dockerfile
      target: test
    container_name: todoapp-test
    environment:
      NODE_ENV: test
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp_test
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: '${POSTGRES_PASSWORD:-todoapp_password}'
    depends_on:
      db:
        condition: service_healthy
    command: ['npm', 'run', 'test:coverage']
    networks:
      - todoapp-network
    profiles:
      - test
```
@z

@x
This test service configuration:
@y
This test service configuration:
@z

@x
- **Builds from test stage**: Uses the `test` target from your multi-stage Dockerfile
- **Isolated test database**: Uses a separate `todoapp_test` database for testing
- **Profile-based**: Uses the `test` profile so it only runs when explicitly requested
- **Health dependency**: Waits for the database to be healthy before starting tests
@y
- **Builds from test stage**: Uses the `test` target from your multi-stage Dockerfile
- **Isolated test database**: Uses a separate `todoapp_test` database for testing
- **Profile-based**: Uses the `test` profile so it only runs when explicitly requested
- **Health dependency**: Waits for the database to be healthy before starting tests
@z

@x
### Run tests in a container
@y
### Run tests in a container
@z

@x
You can run tests using the dedicated test service:
@y
You can run tests using the dedicated test service:
@z

@x
```console
$ docker compose up app-test --build
```
@y
```console
$ docker compose up app-test --build
```
@z

@x
Or run tests against the development service:
@y
Or run tests against the development service:
@z

@x
```console
$ docker compose run --rm app-dev npm run test
```
@y
```console
$ docker compose run --rm app-dev npm run test
```
@z

@x
For a one-off test run with coverage:
@y
For a one-off test run with coverage:
@z

@x
```console
$ docker compose run --rm app-dev npm run test:coverage
```
@y
```console
$ docker compose run --rm app-dev npm run test:coverage
```
@z

@x
### Run tests with coverage
@y
### Run tests with coverage
@z

@x
To generate a coverage report:
@y
To generate a coverage report:
@z

@x
```console
$ npm run test:coverage
```
@y
```console
$ npm run test:coverage
```
@z

@x
You should see output like the following:
@y
You should see output like the following:
@z

@x
```console
> docker-nodejs-sample@1.0.0 test
> vitest --run
@y
```console
> docker-nodejs-sample@1.0.0 test
> vitest --run
@z

@x
 ✓ src/server/__tests__/routes/todos.test.ts (5 tests) 16ms
 ✓ src/shared/utils/__tests__/validation.test.ts (15 tests) 6ms
 ✓ src/client/components/__tests__/LoadingSpinner.test.tsx (8 tests) 67ms
 ✓ src/server/database/__tests__/postgres.test.ts (13 tests) 136ms
 ✓ src/client/components/__tests__/ErrorMessage.test.tsx (8 tests) 127ms
 ✓ src/client/components/__tests__/TodoList.test.tsx (8 tests) 147ms
 ✓ src/client/components/__tests__/TodoItem.test.tsx (8 tests) 218ms
 ✓ src/client/__tests__/App.test.tsx (13 tests) 259ms
 ✓ src/client/components/__tests__/AddTodoForm.test.tsx (12 tests) 323ms
 ✓ src/client/hooks/__tests__/useTodos.test.ts (11 tests) 569ms
@y
 ✓ src/server/__tests__/routes/todos.test.ts (5 tests) 16ms
 ✓ src/shared/utils/__tests__/validation.test.ts (15 tests) 6ms
 ✓ src/client/components/__tests__/LoadingSpinner.test.tsx (8 tests) 67ms
 ✓ src/server/database/__tests__/postgres.test.ts (13 tests) 136ms
 ✓ src/client/components/__tests__/ErrorMessage.test.tsx (8 tests) 127ms
 ✓ src/client/components/__tests__/TodoList.test.tsx (8 tests) 147ms
 ✓ src/client/components/__tests__/TodoItem.test.tsx (8 tests) 218ms
 ✓ src/client/__tests__/App.test.tsx (13 tests) 259ms
 ✓ src/client/components/__tests__/AddTodoForm.test.tsx (12 tests) 323ms
 ✓ src/client/hooks/__tests__/useTodos.test.ts (11 tests) 569ms
@z

@x
 Test Files  9 passed (9)
      Tests  88 passed (88)
   Start at  20:57:19
   Duration  4.41s (transform 1.79s, setup 2.66s, collect 5.38s, tests 4.61s, environment 14.07s, prepare 4.34s)
```
@y
 Test Files  9 passed (9)
      Tests  88 passed (88)
   Start at  20:57:19
   Duration  4.41s (transform 1.79s, setup 2.66s, collect 5.38s, tests 4.61s, environment 14.07s, prepare 4.34s)
```
@z

@x
### Test structure
@y
### Test structure
@z

@x
The test suite covers:
@y
The test suite covers:
@z

@x
- **Client Components** (`src/client/components/__tests__/`): React component testing with React Testing Library
- **Custom Hooks** (`src/client/hooks/__tests__/`): React hooks testing with proper mocking
- **Server Routes** (`src/server/__tests__/routes/`): API endpoint testing
- **Database Layer** (`src/server/database/__tests__/`): PostgreSQL database operations testing
- **Utility Functions** (`src/shared/utils/__tests__/`): Validation and helper function testing
- **Integration Tests** (`src/client/__tests__/`): Full application integration testing
@y
- **Client Components** (`src/client/components/__tests__/`): React component testing with React Testing Library
- **Custom Hooks** (`src/client/hooks/__tests__/`): React hooks testing with proper mocking
- **Server Routes** (`src/server/__tests__/routes/`): API endpoint testing
- **Database Layer** (`src/server/database/__tests__/`): PostgreSQL database operations testing
- **Utility Functions** (`src/shared/utils/__tests__/`): Validation and helper function testing
- **Integration Tests** (`src/client/__tests__/`): Full application integration testing
@z

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run tests during the Docker build process, you need to add a dedicated test stage to your Dockerfile. If you haven't already added this stage, add the following to your multi-stage Dockerfile:
@y
To run tests during the Docker build process, you need to add a dedicated test stage to your Dockerfile. If you haven't already added this stage, add the following to your multi-stage Dockerfile:
@z

@x
```dockerfile
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@y
```dockerfile
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@z

@x
# Set environment
ENV NODE_ENV=test \
    CI=true
@y
# Set environment
ENV NODE_ENV=test \
    CI=true
@z

@x
# Copy source files
COPY --chown=nodejs:nodejs . .
@y
# Copy source files
COPY --chown=nodejs:nodejs . .
@z

@x
# Switch to non-root user
USER nodejs
@y
# Switch to non-root user
USER nodejs
@z

@x
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
```
@y
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
```
@z

@x
This test stage:
@y
This test stage:
@z

@x
- **Test environment**: Sets `NODE_ENV=test` and `CI=true` for proper test execution
- **Non-root user**: Runs tests as the `nodejs` user for security
- **Flexible execution**: Uses `CMD` instead of `RUN` to allow running tests during build or as a separate container
- **Coverage support**: Configured to run tests with coverage reporting
@y
- **Test environment**: Sets `NODE_ENV=test` and `CI=true` for proper test execution
- **Non-root user**: Runs tests as the `nodejs` user for security
- **Flexible execution**: Uses `CMD` instead of `RUN` to allow running tests during build or as a separate container
- **Coverage support**: Configured to run tests with coverage reporting
@z

@x
### Build and run tests during image build
@y
### Build and run tests during image build
@z

@x
To build an image that runs tests during the build process, you can create a custom Dockerfile or modify the existing one temporarily:
@y
To build an image that runs tests during the build process, you can create a custom Dockerfile or modify the existing one temporarily:
@z

@x
```console
$ docker build --target test -t node-docker-image-test .
```
@y
```console
$ docker build --target test -t node-docker-image-test .
```
@z

@x
### Run tests in a dedicated test container
@y
### Run tests in a dedicated test container
@z

@x
The recommended approach is to use the test service defined in `compose.yml`:
@y
The recommended approach is to use the test service defined in `compose.yml`:
@z

@x
```console
$ docker compose --profile test up app-test --build
```
@y
```console
$ docker compose --profile test up app-test --build
```
@z

@x
Or run it as a one-off container:
@y
Or run it as a one-off container:
@z

@x
```console
$ docker compose run --rm app-test
```
@y
```console
$ docker compose run --rm app-test
```
@z

@x
### Run tests with coverage in CI/CD
@y
### Run tests with coverage in CI/CD
@z

@x
For continuous integration, you can run tests with coverage:
@y
For continuous integration, you can run tests with coverage:
@z

@x
```console
$ docker build --target test --progress=plain --no-cache -t test-image .
$ docker run --rm test-image npm run test:coverage
```
@y
```console
$ docker build --target test --progress=plain --no-cache -t test-image .
$ docker run --rm test-image npm run test:coverage
```
@z

@x
You should see output containing the following:
@y
You should see output containing the following:
@z

@x
```console
 ✓ src/server/__tests__/routes/todos.test.ts (5 tests) 16ms
 ✓ src/shared/utils/__tests__/validation.test.ts (15 tests) 6ms
 ✓ src/client/components/__tests__/LoadingSpinner.test.tsx (8 tests) 67ms
 ✓ src/server/database/__tests__/postgres.test.ts (13 tests) 136ms
 ✓ src/client/components/__tests__/ErrorMessage.test.tsx (8 tests) 127ms
 ✓ src/client/components/__tests__/TodoList.test.tsx (8 tests) 147ms
 ✓ src/client/components/__tests__/TodoItem.test.tsx (8 tests) 218ms
 ✓ src/client/__tests__/App.test.tsx (13 tests) 259ms
 ✓ src/client/components/__tests__/AddTodoForm.test.tsx (12 tests) 323ms
 ✓ src/client/hooks/__tests__/useTodos.test.ts (11 tests) 569ms
@y
```console
 ✓ src/server/__tests__/routes/todos.test.ts (5 tests) 16ms
 ✓ src/shared/utils/__tests__/validation.test.ts (15 tests) 6ms
 ✓ src/client/components/__tests__/LoadingSpinner.test.tsx (8 tests) 67ms
 ✓ src/server/database/__tests__/postgres.test.ts (13 tests) 136ms
 ✓ src/client/components/__tests__/ErrorMessage.test.tsx (8 tests) 127ms
 ✓ src/client/components/__tests__/TodoList.test.tsx (8 tests) 147ms
 ✓ src/client/components/__tests__/TodoItem.test.tsx (8 tests) 218ms
 ✓ src/client/__tests__/App.test.tsx (13 tests) 259ms
 ✓ src/client/components/__tests__/AddTodoForm.test.tsx (12 tests) 323ms
 ✓ src/client/hooks/__tests__/useTodos.test.ts (11 tests) 569ms
@z

@x
 Test Files  9 passed (9)
      Tests  88 passed (88)
   Start at  20:57:19
   Duration  4.41s (transform 1.79s, setup 2.66s, collect 5.38s, tests 4.61s, environment 14.07s, prepare 4.34s)
```
@y
 Test Files  9 passed (9)
      Tests  88 passed (88)
   Start at  20:57:19
   Duration  4.41s (transform 1.79s, setup 2.66s, collect 5.38s, tests 4.61s, environment 14.07s, prepare 4.34s)
```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to run tests when developing locally using Docker Compose and how to run tests when building your image.
@y
In this section, you learned how to run tests when developing locally using Docker Compose and how to run tests when building your image.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
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
