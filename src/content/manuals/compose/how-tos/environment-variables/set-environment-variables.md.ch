%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Set environment variables within your container's environment
linkTitle: Set environment variables
@y
title: Set environment variables within your container's environment
linkTitle: Set environment variables
@z

@x
description: How to set, use, and manage environment variables with Compose
keywords: compose, orchestration, environment, environment variables, container environment variables
@y
description: How to set, use, and manage environment variables with Compose
keywords: compose, orchestration, environment, environment variables, container environment variables
@z

@x
A container's environment is not set until there's an explicit entry in the service configuration to make this happen. With Compose, there are two ways you can set environment variables in your containers with your Compose file. 
@y
A container's environment is not set until there's an explicit entry in the service configuration to make this happen. With Compose, there are two ways you can set environment variables in your containers with your Compose file. 
@z

@x
>[!TIP]
>
> Don't use environment variables to pass sensitive information, such as passwords, in to your containers. Use [secrets](../use-secrets.md) instead.
@y
>[!TIP]
>
> Don't use environment variables to pass sensitive information, such as passwords, in to your containers. Use [secrets](../use-secrets.md) instead.
@z

@x
## Use the `environment` attribute
@y
## Use the `environment` attribute
@z

@x
You can set environment variables directly in your container's environment with the
[`environment` attribute](/reference/compose-file/services.md#environment) in your `compose.yml`. 
@y
You can set environment variables directly in your container's environment with the
[`environment` attribute](reference/compose-file/services.md#environment) in your `compose.yml`. 
@z

@x
It supports both list and mapping syntax:
@y
It supports both list and mapping syntax:
@z

@x
```yaml
services:
  webapp:
    environment:
      DEBUG: "true"
```
is equivalent to 
```yaml
services:
  webapp:
    environment:
      - DEBUG=true
```
@y
```yaml
services:
  webapp:
    environment:
      DEBUG: "true"
```
is equivalent to 
```yaml
services:
  webapp:
    environment:
      - DEBUG=true
```
@z

@x
See [`environment` attribute](/reference/compose-file/services.md#environment) for more examples on how to use it. 
@y
See [`environment` attribute](reference/compose-file/services.md#environment) for more examples on how to use it. 
@z

@x
### Additional information 
@y
### Additional information 
@z

@x
- You can choose not to set a value and pass the environment variables from your shell straight through to your containers. It works in the same way as `docker run -e VARIABLE ...`:
  ```yaml
  web:
    environment:
      - DEBUG
  ```
The value of the `DEBUG` variable in the container is taken from the value for the same variable in the shell in which Compose is run. Note that in this case no warning is issued if the `DEBUG` variable in the shell environment is not set. 
@y
- You can choose not to set a value and pass the environment variables from your shell straight through to your containers. It works in the same way as `docker run -e VARIABLE ...`:
  ```yaml
  web:
    environment:
      - DEBUG
  ```
The value of the `DEBUG` variable in the container is taken from the value for the same variable in the shell in which Compose is run. Note that in this case no warning is issued if the `DEBUG` variable in the shell environment is not set. 
@z

@x
- You can also take advantage of [interpolation](variable-interpolation.md#interpolation-syntax). In the following example, the result is similar to the one above but Compose gives you a warning if the `DEBUG` variable is not set in the shell environment or in an `.env` file in the project directory.
@y
- You can also take advantage of [interpolation](variable-interpolation.md#interpolation-syntax). In the following example, the result is similar to the one above but Compose gives you a warning if the `DEBUG` variable is not set in the shell environment or in an `.env` file in the project directory.
@z

@x
  ```yaml
  web:
    environment:
      - DEBUG=${DEBUG}
  ```
@y
  ```yaml
  web:
    environment:
      - DEBUG=${DEBUG}
  ```
@z

@x
## Use the `env_file` attribute
@y
## Use the `env_file` attribute
@z

@x
A container's environment can also be set using [`.env` files](variable-interpolation.md#env-file) along with the [`env_file` attribute](/reference/compose-file/services.md#env_file).
@y
A container's environment can also be set using [`.env` files](variable-interpolation.md#env-file) along with the [`env_file` attribute](reference/compose-file/services.md#env_file).
@z

@x
```yaml
services:
  webapp:
    env_file: "webapp.env"
```
@y
```yaml
services:
  webapp:
    env_file: "webapp.env"
```
@z

@x
Using an `.env` file lets you use the same file for use by a plain `docker run --env-file ...` command, or to share the same `.env` file within multiple services without the need to duplicate a long `environment` YAML block.
@y
Using an `.env` file lets you use the same file for use by a plain `docker run --env-file ...` command, or to share the same `.env` file within multiple services without the need to duplicate a long `environment` YAML block.
@z

@x
It can also help you keep your environment variables separate from your main configuration file, providing a more organized and secure way to manage sensitive information, as you do not need to place your `.env` file in the root of your project's directory.
@y
It can also help you keep your environment variables separate from your main configuration file, providing a more organized and secure way to manage sensitive information, as you do not need to place your `.env` file in the root of your project's directory.
@z

@x
The [`env_file` attribute](/reference/compose-file/services.md#env_file) also lets you use multiple `.env` files in your Compose application.  
@y
The [`env_file` attribute](reference/compose-file/services.md#env_file) also lets you use multiple `.env` files in your Compose application.  
@z

@x
The paths to your `.env` file, specified in the `env_file` attribute, are relative to the location of your `compose.yml` file. 
@y
The paths to your `.env` file, specified in the `env_file` attribute, are relative to the location of your `compose.yml` file. 
@z

@x
> [!IMPORTANT]
>
> Interpolation in `.env` files is a Docker Compose CLI feature.
>
> It is not supported when running `docker run --env-file ...`.
@y
> [!IMPORTANT]
>
> Interpolation in `.env` files is a Docker Compose CLI feature.
>
> It is not supported when running `docker run --env-file ...`.
@z

@x
### Additional information 
@y
### Additional information 
@z

@x
- If multiple files are specified, they are evaluated in order and can override values set in previous files.
- As of Docker Compose version 2.24.0, you can set your `.env` file, defined by the `env_file` attribute, to be optional by using the `required` field. When `required` is set to `false` and the `.env` file is missing, Compose silently ignores the entry.
@y
- If multiple files are specified, they are evaluated in order and can override values set in previous files.
- As of Docker Compose version 2.24.0, you can set your `.env` file, defined by the `env_file` attribute, to be optional by using the `required` field. When `required` is set to `false` and the `.env` file is missing, Compose silently ignores the entry.
@z

% snip code...

@x
- Values in your `.env` file can be overridden from the command line by using [`docker compose run -e`](#set-environment-variables-with-docker-compose-run---env). 
@y
- Values in your `.env` file can be overridden from the command line by using [`docker compose run -e`](#set-environment-variables-with-docker-compose-run---env). 
@z

@x
## Set environment variables with `docker compose run --env`
@y
## Set environment variables with `docker compose run --env`
@z

@x
Similar to `docker run --env`, you can set environment variables temporarily with `docker compose run --env` or its short form `docker compose run -e`:
@y
Similar to `docker run --env`, you can set environment variables temporarily with `docker compose run --env` or its short form `docker compose run -e`:
@z

@x
```console
$ docker compose run -e DEBUG=1 web python console.py
```
@y
```console
$ docker compose run -e DEBUG=1 web python console.py
```
@z

@x
### Additional information 
@y
### Additional information 
@z

@x
- You can also pass a variable from the shell or your environment files by not giving it a value:
@y
- You can also pass a variable from the shell or your environment files by not giving it a value:
@z

@x
  ```console
  $ docker compose run -e DEBUG web python console.py
  ```
@y
  ```console
  $ docker compose run -e DEBUG web python console.py
  ```
@z

@x
The value of the `DEBUG` variable in the container is taken from the value for the same variable in the shell in which Compose is run or from the environment files.
@y
The value of the `DEBUG` variable in the container is taken from the value for the same variable in the shell in which Compose is run or from the environment files.
@z

@x
## Further resources
@y
## Further resources
@z

@x
- [Understand environment variable precedence](envvars-precedence.md).
- [Set or change predefined environment variables](envvars.md)
- [Explore best practices](best-practices.md)
- [Understand interpolation](variable-interpolation.md)
@y
- [Understand environment variable precedence](envvars-precedence.md).
- [Set or change predefined environment variables](envvars.md)
- [Explore best practices](best-practices.md)
- [Understand interpolation](variable-interpolation.md)
@z
