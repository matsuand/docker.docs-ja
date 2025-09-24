%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Environment variables precedence in Docker Compose
linkTitle: Environment variables precedence
@y
title: Environment variables precedence in Docker Compose
linkTitle: Environment variables precedence
@z

@x
description: Scenario overview illustrating how environment variables are resolved
  in Compose
keywords: compose, environment, env file
@y
description: Scenario overview illustrating how environment variables are resolved
  in Compose
keywords: compose, environment, env file
@z

@x
When the same environment variable is set in multiple sources, Docker Compose follows a precedence rule to determine the value for that variable in your container's environment.
@y
When the same environment variable is set in multiple sources, Docker Compose follows a precedence rule to determine the value for that variable in your container's environment.
@z

@x
This page explains how Docker Compose determines the final value of an environment variable when it's defined in multiple locations.
@y
This page explains how Docker Compose determines the final value of an environment variable when it's defined in multiple locations.
@z

@x
The order of precedence (highest to lowest) is as follows:
1. Set using [`docker compose run -e` in the CLI](set-environment-variables.md#set-environment-variables-with-docker-compose-run---env).
2. Set with either the `environment` or `env_file` attribute but with the value interpolated from your [shell](variable-interpolation.md#substitute-from-the-shell) or an environment file. (either your default [`.env` file](variable-interpolation.md#env-file), or with the [`--env-file` argument](variable-interpolation.md#substitute-with---env-file) in the CLI).
3. Set using just the [`environment` attribute](set-environment-variables.md#use-the-environment-attribute) in the Compose file.
4. Use of the [`env_file` attribute](set-environment-variables.md#use-the-env_file-attribute) in the Compose file.
5. Set in a container image in the [ENV directive](/reference/dockerfile.md#env).
   Having any `ARG` or `ENV` setting in a `Dockerfile` evaluates only if there is no Docker Compose entry for `environment`, `env_file` or `run --env`.
@y
The order of precedence (highest to lowest) is as follows:
1. Set using [`docker compose run -e` in the CLI](set-environment-variables.md#set-environment-variables-with-docker-compose-run---env).
2. Set with either the `environment` or `env_file` attribute but with the value interpolated from your [shell](variable-interpolation.md#substitute-from-the-shell) or an environment file. (either your default [`.env` file](variable-interpolation.md#env-file), or with the [`--env-file` argument](variable-interpolation.md#substitute-with---env-file) in the CLI).
3. Set using just the [`environment` attribute](set-environment-variables.md#use-the-environment-attribute) in the Compose file.
4. Use of the [`env_file` attribute](set-environment-variables.md#use-the-env_file-attribute) in the Compose file.
5. Set in a container image in the [ENV directive](reference/dockerfile.md#env).
   Having any `ARG` or `ENV` setting in a `Dockerfile` evaluates only if there is no Docker Compose entry for `environment`, `env_file` or `run --env`.
@z

@x
## Simple example
@y
## Simple example
@z

@x
In the following example, a different value for the same environment variable in an `.env` file and with the `environment` attribute in the Compose file:
@y
In the following example, a different value for the same environment variable in an `.env` file and with the `environment` attribute in the Compose file:
@z

% snip command...

@x
The environment variable defined with the `environment` attribute takes precedence.
@y
The environment variable defined with the `environment` attribute takes precedence.
@z

% snip command...

@x
## Advanced example 
@y
## Advanced example 
@z

@x
The following table uses `VALUE`, an environment variable defining the version for an image, as an example.
@y
The following table uses `VALUE`, an environment variable defining the version for an image, as an example.
@z

@x
### How the table works
@y
### How the table works
@z

@x
Each column represents a context from where you can set a value, or substitute in a value for `VALUE`.
@y
Each column represents a context from where you can set a value, or substitute in a value for `VALUE`.
@z

@x
The columns `Host OS environment` and `.env` file is listed only for illustration purposes. In reality, they don't result in a variable in the container by itself, but in conjunction with either the `environment` or `env_file` attribute.
@y
The columns `Host OS environment` and `.env` file is listed only for illustration purposes. In reality, they don't result in a variable in the container by itself, but in conjunction with either the `environment` or `env_file` attribute.
@z

@x
Each row represents a combination of contexts where `VALUE` is set, substituted, or both. The **Result** column indicates the final value for `VALUE` in each scenario.
@y
Each row represents a combination of contexts where `VALUE` is set, substituted, or both. The **Result** column indicates the final value for `VALUE` in each scenario.
@z

@x
|  # |  `docker compose run`  |  `environment` attribute  |  `env_file` attribute  |  Image `ENV` |  `Host OS` environment  |  `.env` file      |   Result  |
|:--:|:----------------:|:-------------------------------:|:----------------------:|:------------:|:-----------------------:|:-----------------:|:----------:|
|  1 |   -              |   -                             |   -                    |   -          |  `VALUE=1.4`            |  `VALUE=1.3`      | -               |
|  2 |   -              |   -                             |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |   -               |**`VALUE=1.6`**  |
|  3 |   -              |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |   -               |**`VALUE=1.7`**  |
|  4 |   -              |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.5`**  |
|  5 |`--env VALUE=1.8` |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
|  6 |`--env VALUE`     |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
|  7 |`--env VALUE`     |   -                             |   -                    |  `VALUE=1.5` |   -                     |  `VALUE=1.3`      |**`VALUE=1.3`**  |
|  8 |   -              |   -                             |   `VALUE`              |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
|  9 |   -              |   -                             |   `VALUE`              |  `VALUE=1.5` |   -                     |  `VALUE=1.3`      |**`VALUE=1.3`**  |
| 10 |   -              |  `VALUE`                        |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
| 11 |   -              |  `VALUE`                        |   -                    |  `VALUE=1.5` |  -                      |  `VALUE=1.3`      |**`VALUE=1.3`**  |
| 12 |`--env VALUE`     |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
| 13 |`--env VALUE=1.8` |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
| 14 |`--env VALUE=1.8` |   -                             |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
| 15 |`--env VALUE=1.8` |  `VALUE=1.7`                    |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
@y
|  # |  `docker compose run`  |  `environment` attribute  |  `env_file` attribute  |  Image `ENV` |  `Host OS` environment  |  `.env` file      |   Result  |
|:--:|:----------------:|:-------------------------------:|:----------------------:|:------------:|:-----------------------:|:-----------------:|:----------:|
|  1 |   -              |   -                             |   -                    |   -          |  `VALUE=1.4`            |  `VALUE=1.3`      | -               |
|  2 |   -              |   -                             |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |   -               |**`VALUE=1.6`**  |
|  3 |   -              |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |   -               |**`VALUE=1.7`**  |
|  4 |   -              |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.5`**  |
|  5 |`--env VALUE=1.8` |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
|  6 |`--env VALUE`     |   -                             |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
|  7 |`--env VALUE`     |   -                             |   -                    |  `VALUE=1.5` |   -                     |  `VALUE=1.3`      |**`VALUE=1.3`**  |
|  8 |   -              |   -                             |   `VALUE`              |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
|  9 |   -              |   -                             |   `VALUE`              |  `VALUE=1.5` |   -                     |  `VALUE=1.3`      |**`VALUE=1.3`**  |
| 10 |   -              |  `VALUE`                        |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
| 11 |   -              |  `VALUE`                        |   -                    |  `VALUE=1.5` |  -                      |  `VALUE=1.3`      |**`VALUE=1.3`**  |
| 12 |`--env VALUE`     |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.4`**  |
| 13 |`--env VALUE=1.8` |  `VALUE=1.7`                    |   -                    |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
| 14 |`--env VALUE=1.8` |   -                             |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
| 15 |`--env VALUE=1.8` |  `VALUE=1.7`                    |  `VALUE=1.6`           |  `VALUE=1.5` |  `VALUE=1.4`            |  `VALUE=1.3`      |**`VALUE=1.8`**  |
@z

@x
### Understanding precedence results
@y
### Understanding precedence results
@z

@x
Result 1: The local environment takes precedence, but the Compose file is not set to replicate this inside the container, so no such variable is set.
@y
Result 1: The local environment takes precedence, but the Compose file is not set to replicate this inside the container, so no such variable is set.
@z

@x
Result 2: The `env_file` attribute in the Compose file defines an explicit value for `VALUE` so the container environment is set accordingly.
@y
Result 2: The `env_file` attribute in the Compose file defines an explicit value for `VALUE` so the container environment is set accordingly.
@z

@x
Result 3: The `environment` attribute in the Compose file defines an explicit value for `VALUE`, so the container environment is set accordingly.
@y
Result 3: The `environment` attribute in the Compose file defines an explicit value for `VALUE`, so the container environment is set accordingly.
@z

@x
Result 4: The image's `ENV` directive declares the variable `VALUE`, and since the Compose file is not set to override this value, this variable is defined by image
@y
Result 4: The image's `ENV` directive declares the variable `VALUE`, and since the Compose file is not set to override this value, this variable is defined by image
@z

@x
Result 5: The `docker compose run` command has the `--env` flag set with an explicit value, and overrides the value set by the image. 
@y
Result 5: The `docker compose run` command has the `--env` flag set with an explicit value, and overrides the value set by the image. 
@z

@x
Result 6: The `docker compose run` command has the `--env` flag set to replicate the value from the environment. Host OS value takes precedence and is replicated into the container's environment.
@y
Result 6: The `docker compose run` command has the `--env` flag set to replicate the value from the environment. Host OS value takes precedence and is replicated into the container's environment.
@z

@x
Result 7: The `docker compose run` command has the `--env` flag set to replicate the value from the environment. Value from `.env` file is selected to define the container's environment.
@y
Result 7: The `docker compose run` command has the `--env` flag set to replicate the value from the environment. Value from `.env` file is selected to define the container's environment.
@z

@x
Result 8: The `env_file` attribute in the Compose file is set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@y
Result 8: The `env_file` attribute in the Compose file is set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@z

@x
Result 9: The `env_file` attribute in the Compose file is set to replicate `VALUE` from the local environment. Value from `.env` file is selected to define the container's environment.
@y
Result 9: The `env_file` attribute in the Compose file is set to replicate `VALUE` from the local environment. Value from `.env` file is selected to define the container's environment.
@z

@x
Result 10: The `environment` attribute in the Compose file is set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@y
Result 10: The `environment` attribute in the Compose file is set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@z

@x
Result 11: The `environment` attribute in the Compose file is set to replicate `VALUE` from the local environment. Value from `.env` file is selected to define the container's environment.
@y
Result 11: The `environment` attribute in the Compose file is set to replicate `VALUE` from the local environment. Value from `.env` file is selected to define the container's environment.
@z

@x
Result 12: The `--env` flag has higher precedence than the `environment` and `env_file` attributes and is to set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@y
Result 12: The `--env` flag has higher precedence than the `environment` and `env_file` attributes and is to set to replicate `VALUE` from the local environment. Host OS value takes precedence and is replicated into the container's environment.
@z

@x
Results 13 to 15: The `--env` flag has higher precedence than the `environment` and `env_file` attributes and so sets the value. 
@y
Results 13 to 15: The `--env` flag has higher precedence than the `environment` and `env_file` attributes and so sets the value. 
@z
