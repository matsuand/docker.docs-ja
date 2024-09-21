%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Run PHP tests in a container
linkTitle: Run your tests
@y
title: コンテナーでの PHP テストの実行
linkTitle: テストの実行
@z

@x
keywords: php, test
description: Learn how to run your PHP tests in a container.
@y
keywords: php, test
description: Learn how to run your PHP tests in a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a PHP application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize a PHP application](containerize.md).
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
The sample application already has a PHPUnit test inside the `tests` directory. When developing locally, you can use Compose to run your tests.
@y
The sample application already has a PHPUnit test inside the `tests` directory. When developing locally, you can use Compose to run your tests.
@z

@x
Run the following command in the `docker-php-sample` directory to run the tests inside a container.
@y
Run the following command in the `docker-php-sample` directory to run the tests inside a container.
@z

@x
```console
$ docker compose run --build --rm server ./vendor/bin/phpunit tests/HelloWorldTest.php
```
@y
```console
$ docker compose run --build --rm server ./vendor/bin/phpunit tests/HelloWorldTest.php
```
@z

@x
You should see output that contains the following.
@y
You should see output that contains the following.
@z

% snip output ...

@x
To learn more about the command, see [docker compose run](/reference/cli/docker/compose/run/).
@y
To learn more about the command, see [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/).
@z

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run your tests when building, you need to update your Dockerfile. Create a new test stage that runs the tests.
@y
To run your tests when building, you need to update your Dockerfile. Create a new test stage that runs the tests.
@z

@x
The following is the updated Dockerfile.
@y
The following is the updated Dockerfile.
@z

@x
```dockerfile {hl_lines="26-28"}
# syntax=docker/dockerfile:1
@y
```dockerfile {hl_lines="26-28"}
# syntax=docker/dockerfile:1
@z

@x
FROM composer:lts as prod-deps
WORKDIR /app
RUN --mount=type=bind,source=./composer.json,target=composer.json \
    --mount=type=bind,source=./composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction
@y
FROM composer:lts as prod-deps
WORKDIR /app
RUN --mount=type=bind,source=./composer.json,target=composer.json \
    --mount=type=bind,source=./composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction
@z

@x
FROM composer:lts as dev-deps
WORKDIR /app
RUN --mount=type=bind,source=./composer.json,target=composer.json \
    --mount=type=bind,source=./composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-interaction
@y
FROM composer:lts as dev-deps
WORKDIR /app
RUN --mount=type=bind,source=./composer.json,target=composer.json \
    --mount=type=bind,source=./composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-interaction
@z

@x
FROM php:8.2-apache as base
RUN docker-php-ext-install pdo pdo_mysql
COPY ./src /var/www/html
@y
FROM php:8.2-apache as base
RUN docker-php-ext-install pdo pdo_mysql
COPY ./src /var/www/html
@z

@x
FROM base as development
COPY ./tests /var/www/html/tests
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
COPY --from=dev-deps app/vendor/ /var/www/html/vendor
@y
FROM base as development
COPY ./tests /var/www/html/tests
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
COPY --from=dev-deps app/vendor/ /var/www/html/vendor
@z

@x
FROM development as test
WORKDIR /var/www/html
RUN ./vendor/bin/phpunit tests/HelloWorldTest.php
@y
FROM development as test
WORKDIR /var/www/html
RUN ./vendor/bin/phpunit tests/HelloWorldTest.php
@z

@x
FROM base as final
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY --from=prod-deps app/vendor/ /var/www/html/vendor
USER www-data
```
@y
FROM base as final
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY --from=prod-deps app/vendor/ /var/www/html/vendor
USER www-data
```
@z

@x
Run the following command to build an image using the test stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@y
Run the following command to build an image using the test stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@z

@x
```console
$ docker build -t php-docker-image-test --progress plain --no-cache --target test .
```
@y
```console
$ docker build -t php-docker-image-test --progress plain --no-cache --target test .
```
@z

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

@x
```console
#18 [test 2/2] RUN ./vendor/bin/phpunit tests/HelloWorldTest.php
#18 0.385 Hello, Docker!PHPUnit 9.6.13 by Sebastian Bergmann and contributors.
#18 0.392
#18 0.394 .                                                                   1 / 1 (100%)
#18 0.395
#18 0.395 Time: 00:00.003, Memory: 4.00 MB
#18 0.395
#18 0.395 OK (1 test, 1 assertion)
```
@y
```console
#18 [test 2/2] RUN ./vendor/bin/phpunit tests/HelloWorldTest.php
#18 0.385 Hello, Docker!PHPUnit 9.6.13 by Sebastian Bergmann and contributors.
#18 0.392
#18 0.394 .                                                                   1 / 1 (100%)
#18 0.395
#18 0.395 Time: 00:00.003, Memory: 4.00 MB
#18 0.395
#18 0.395 OK (1 test, 1 assertion)
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
 - [docker compose run](/reference/cli/docker/compose/run/)
@y
Related information:
 - [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/)
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
