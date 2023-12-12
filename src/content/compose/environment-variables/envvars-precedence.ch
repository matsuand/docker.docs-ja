%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Environment variables precedence in Docker Compose
description: Scenario overview illustrating how environment variables are resolved
  in Compose
keywords: compose, environment, env file
aliases:
- /compose/envvars-precedence/
---
@y
---
title: Environment variables precedence in Docker Compose
description: Scenario overview illustrating how environment variables are resolved
  in Compose
keywords: compose, environment, env file
aliases:
- /compose/envvars-precedence/
---
@z

@x
When the same environment variable is set in multiple sources, Docker Compose follows a precedence rule to determine the value for that variable.
@y
When the same environment variable is set in multiple sources, Docker Compose follows a precedence rule to determine the value for that variable.
@z

@x
This page contains information on the level of precedence each method of setting environmental variables takes.
@y
This page contains information on the level of precedence each method of setting environmental variables takes.
@z

@x
The order of precedence (highest to lowest) is as follows:
1. Set using [`docker compose run -e` in the CLI](set-environment-variables.md#set-environment-variables-with-docker-compose-run---env)
2. Substituted from your [shell](set-environment-variables.md#substitute-from-the-shell)
3. Set using just the [`environment` attribute in the Compose file](set-environment-variables.md#use-the-environment-attribute)
4. Use of the [`--env-file` argument](set-environment-variables.md#substitute-with---env-file) in the CLI
5. Use of the [`env_file` attribute](set-environment-variables.md#use-the-env_file-attribute) in the Compose file
6. Set using an [`.env` file](set-environment-variables.md#substitute-with-an-env-file) placed at base of your project directory
7. Set in a container image in the [ENV directive](../../engine/reference/builder.md#env).
   Having any `ARG` or `ENV` setting in a `Dockerfile` evaluates only if there is no Docker Compose entry for `environment`, `env_file` or `run --env`.
@y
The order of precedence (highest to lowest) is as follows:
1. Set using [`docker compose run -e` in the CLI](set-environment-variables.md#set-environment-variables-with-docker-compose-run---env)
2. Substituted from your [shell](set-environment-variables.md#substitute-from-the-shell)
3. Set using just the [`environment` attribute in the Compose file](set-environment-variables.md#use-the-environment-attribute)
4. Use of the [`--env-file` argument](set-environment-variables.md#substitute-with---env-file) in the CLI
5. Use of the [`env_file` attribute](set-environment-variables.md#use-the-env_file-attribute) in the Compose file
6. Set using an [`.env` file](set-environment-variables.md#substitute-with-an-env-file) placed at base of your project directory
7. Set in a container image in the [ENV directive](../../engine/reference/builder.md#env).
   Having any `ARG` or `ENV` setting in a `Dockerfile` evaluates only if there is no Docker Compose entry for `environment`, `env_file` or `run --env`.
@z

@x
## Simple example
@y
## Simple example
@z

@x
In the example below, we set a different value for the same environment variable in an `.env` file and with the `environment` attribute in the Compose file:
@y
In the example below, we set a different value for the same environment variable in an `.env` file and with the `environment` attribute in the Compose file:
@z

@x
```console
$ cat ./Docker/api/api.env
NODE_ENV=test
@y
```console
$ cat ./Docker/api/api.env
NODE_ENV=test
@z

@x
$ cat compose.yml
services:
  api:
    image: 'node:6-alpine'
    env_file:
     - ./Docker/api/api.env
    environment:
     - NODE_ENV=production
```
@y
$ cat compose.yml
services:
  api:
    image: 'node:6-alpine'
    env_file:
     - ./Docker/api/api.env
    environment:
     - NODE_ENV=production
```
@z

@x
The environment variable defined with the `environment` attribute takes precedence.
@y
The environment variable defined with the `environment` attribute takes precedence.
@z

@x
```console
$ docker compose exec api node
@y
```console
$ docker compose exec api node
@z

@x
> process.env.NODE_ENV
'production'
```
@y
> process.env.NODE_ENV
'production'
```
@z

@x
> Hard coding variables in container scripts
>
> Executing a command within the container that unconditionally sets a variable value overrules any setting in your `compose.yml` file.
>
> For example, in a NodeJS project, if you have a `package.json` entry for `scripts.start`, such as `NODE_ENV=test` `node server.js`, any value set for `NODE_ENV` in your Compose file, is ignored when running `npm run start` within the container.
{ .important }
@y
> Hard coding variables in container scripts
>
> Executing a command within the container that unconditionally sets a variable value overrules any setting in your `compose.yml` file.
>
> For example, in a NodeJS project, if you have a `package.json` entry for `scripts.start`, such as `NODE_ENV=test` `node server.js`, any value set for `NODE_ENV` in your Compose file, is ignored when running `npm run start` within the container.
{ .important }
@z

@x
## Advanced example 
@y
## Advanced example 
@z

@x
The following table uses `TAG`, an environment variable defining the version for an image, as an example.
@y
The following table uses `TAG`, an environment variable defining the version for an image, as an example.
@z

@x
### How the table works
@y
### How the table works
@z

@x
Each column represents a context from where you can set a value, or substitute in a value for `TAG`.
@y
Each column represents a context from where you can set a value, or substitute in a value for `TAG`.
@z

@x
The columns `Host OS environment` and `.env file` is listed only as an illustration lookup. In reality, they don't result in a variable in the container by itself.
@y
The columns `Host OS environment` and `.env file` is listed only as an illustration lookup. In reality, they don't result in a variable in the container by itself.
@z

@x
Each row represents a combination of contexts where `TAG` is set, substituted, or both. The **Result** column indicates the final value for `TAG` in each scenario.
@y
Each row represents a combination of contexts where `TAG` is set, substituted, or both. The **Result** column indicates the final value for `TAG` in each scenario.
@z

@x
|  # |  `docker compose run --env`  |  `environment` attribute  |  `env_file` attribute  |  Image `ENV` |  `Host OS` environment  |  `.env` file      | |  Result  |
|:--:|:-------------:|:----------------------------------:|:-------------------------------:|:------------:|:-----------------------:|:-----------------:|:---:|:-------------:|
|  1 |   -           |   -                                |   -                             |   -          |  `TAG=1.4`              |  `TAG=1.3`        || - |
|  2 |   -           |   -                                |   -                             |`TAG=1.5` |  `TAG=1.4`                  |  `TAG=1.3`        ||**`TAG=1.5`**  |
|  3 |`TAG`          |   -                                |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  4 |   -           |   -                                |`TAG`                            |  `TAG=1.5`   |   -                     |`TAG=1.3`          ||**`TAG=1.3`**  |
|  5 |`TAG`          |   -                                |   -                             |  `TAG=1.5`   |   -                     |`TAG=1.3`          ||**`TAG=1.3`**  |
|  6 |`TAG=1.8`      |   -                                |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
|  7 |   -           |`TAG`                               |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  8 |`TAG`          |  `TAG=1.7`                         |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  9 |`TAG=1.8`      |  `TAG=1.7`                         |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 10 |`TAG=1.8`      |   -                                |  `TAG=1.6`                      |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 11 |`TAG=1.8`      |  `TAG=1.7`                         |  `TAG=1.6`                      |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 12 |   -           |   -                                |`TAG=1.6`                        |  `TAG=1.5`   |  `TAG=1.4`              |   -               ||**`TAG=1.6`**  |
| 13 |   -           |`TAG=1.7`                           |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |   -               ||**`TAG=1.7`**  |
@y
|  # |  `docker compose run --env`  |  `environment` attribute  |  `env_file` attribute  |  Image `ENV` |  `Host OS` environment  |  `.env` file      | |  Result  |
|:--:|:-------------:|:----------------------------------:|:-------------------------------:|:------------:|:-----------------------:|:-----------------:|:---:|:-------------:|
|  1 |   -           |   -                                |   -                             |   -          |  `TAG=1.4`              |  `TAG=1.3`        || - |
|  2 |   -           |   -                                |   -                             |`TAG=1.5` |  `TAG=1.4`                  |  `TAG=1.3`        ||**`TAG=1.5`**  |
|  3 |`TAG`          |   -                                |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  4 |   -           |   -                                |`TAG`                            |  `TAG=1.5`   |   -                     |`TAG=1.3`          ||**`TAG=1.3`**  |
|  5 |`TAG`          |   -                                |   -                             |  `TAG=1.5`   |   -                     |`TAG=1.3`          ||**`TAG=1.3`**  |
|  6 |`TAG=1.8`      |   -                                |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
|  7 |   -           |`TAG`                               |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  8 |`TAG`          |  `TAG=1.7`                         |   -                             |  `TAG=1.5`   |`TAG=1.4`                |  `TAG=1.3`        ||**`TAG=1.4`**  |
|  9 |`TAG=1.8`      |  `TAG=1.7`                         |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 10 |`TAG=1.8`      |   -                                |  `TAG=1.6`                      |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 11 |`TAG=1.8`      |  `TAG=1.7`                         |  `TAG=1.6`                      |  `TAG=1.5`   |  `TAG=1.4`              |  `TAG=1.3`        ||**`TAG=1.8`**  |
| 12 |   -           |   -                                |`TAG=1.6`                        |  `TAG=1.5`   |  `TAG=1.4`              |   -               ||**`TAG=1.6`**  |
| 13 |   -           |`TAG=1.7`                           |   -                             |  `TAG=1.5`   |  `TAG=1.4`              |   -               ||**`TAG=1.7`**  |
@z
