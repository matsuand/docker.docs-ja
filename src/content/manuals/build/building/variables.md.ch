%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Build variables
linkTitle: Variables
@y
title: Build variables
linkTitle: Variables
@z

@x
description: Using build arguments and environment variables to configure builds
keywords: build, args, variables, parameters, env, environment variables, config
@y
description: Using build arguments and environment variables to configure builds
keywords: build, args, variables, parameters, env, environment variables, config
@z

@x
In Docker Build, build arguments (`ARG`) and environment variables (`ENV`)
both serve as a means to pass information into the build process.
You can use them to parameterize the build, allowing for more flexible and configurable builds.
@y
In Docker Build, build arguments (`ARG`) and environment variables (`ENV`)
both serve as a means to pass information into the build process.
You can use them to parameterize the build, allowing for more flexible and configurable builds.
@z

@x
> [!WARNING]
>
> Build arguments and environment variables are inappropriate for passing secrets
> to your build, because they're exposed in the final image. Instead, use
> secret mounts or SSH mounts, which expose secrets to your builds securely.
>
> See [Build secrets](./secrets.md) for more information.
@y
> [!WARNING]
>
> Build arguments and environment variables are inappropriate for passing secrets
> to your build, because they're exposed in the final image. Instead, use
> secret mounts or SSH mounts, which expose secrets to your builds securely.
>
> See [Build secrets](./secrets.md) for more information.
@z

@x
## Similarities and differences
@y
## Similarities and differences
@z

@x
Build arguments and environment variables are similar.
They're both declared in the Dockerfile and can be set using flags for the `docker build` command.
Both can be used to parameterize the build.
But they each serve a distinct purpose.
@y
Build arguments and environment variables are similar.
They're both declared in the Dockerfile and can be set using flags for the `docker build` command.
Both can be used to parameterize the build.
But they each serve a distinct purpose.
@z

@x
### Build arguments
@y
### Build arguments
@z

@x
Build arguments are variables for the Dockerfile itself.
Use them to parameterize values of Dockerfile instructions.
For example, you might use a build argument to specify the version of a dependency to install.
@y
Build arguments are variables for the Dockerfile itself.
Use them to parameterize values of Dockerfile instructions.
For example, you might use a build argument to specify the version of a dependency to install.
@z

@x
Build arguments have no effect on the build unless it's used in an instruction.
They're not accessible or present in containers instantiated from the image
unless explicitly passed through from the Dockerfile into the image filesystem or configuration.
They may persist in the image metadata, as provenance attestations and in the image history,
which is why they're not suitable for holding secrets.
@y
Build arguments have no effect on the build unless it's used in an instruction.
They're not accessible or present in containers instantiated from the image
unless explicitly passed through from the Dockerfile into the image filesystem or configuration.
They may persist in the image metadata, as provenance attestations and in the image history,
which is why they're not suitable for holding secrets.
@z

@x
They make Dockerfiles more flexible, and easier to maintain.
@y
They make Dockerfiles more flexible, and easier to maintain.
@z

@x
For an example on how you can use build arguments,
see [`ARG` usage example](#arg-usage-example).
@y
For an example on how you can use build arguments,
see [`ARG` usage example](#arg-usage-example).
@z

@x
### Environment variables
@y
### Environment variables
@z

@x
Environment variables are passed through to the build execution environment,
and persist in containers instantiated from the image.
@y
Environment variables are passed through to the build execution environment,
and persist in containers instantiated from the image.
@z

@x
Environment variables are primarily used to:
@y
Environment variables are primarily used to:
@z

@x
- Configure the execution environment for builds
- Set default environment variables for containers
@y
- Configure the execution environment for builds
- Set default environment variables for containers
@z

@x
Environment variables, if set, can directly influence the execution of your build,
and the behavior or configuration of the application.
@y
Environment variables, if set, can directly influence the execution of your build,
and the behavior or configuration of the application.
@z

@x
You can't override or set an environment variable at build-time.
Values for environment variables must be declared in the Dockerfile.
You can combine environment variables and build arguments to allow
environment variables to be configured at build-time.
@y
You can't override or set an environment variable at build-time.
Values for environment variables must be declared in the Dockerfile.
You can combine environment variables and build arguments to allow
environment variables to be configured at build-time.
@z

@x
For an example on how to use environment variables for configuring builds,
see [`ENV` usage example](#env-usage-example).
@y
For an example on how to use environment variables for configuring builds,
see [`ENV` usage example](#env-usage-example).
@z

@x
## `ARG` usage example
@y
## `ARG` usage example
@z

@x
Build arguments are commonly used to specify versions of components,
such as image variants or package versions, used in a build.
@y
Build arguments are commonly used to specify versions of components,
such as image variants or package versions, used in a build.
@z

@x
Specifying versions as build arguments lets you build with different versions
without having to manually update the Dockerfile.
It also makes it easier to maintain the Dockerfile,
since it lets you declare versions at the top of the file.
@y
Specifying versions as build arguments lets you build with different versions
without having to manually update the Dockerfile.
It also makes it easier to maintain the Dockerfile,
since it lets you declare versions at the top of the file.
@z

@x
Build arguments can also be a way to reuse a value in multiple places.
For example, if you use multiple flavors of `alpine` in your build,
you can ensure you're using the same version of `alpine` everywhere:
@y
Build arguments can also be a way to reuse a value in multiple places.
For example, if you use multiple flavors of `alpine` in your build,
you can ensure you're using the same version of `alpine` everywhere:
@z

@x
- `golang:1.22-alpine${ALPINE_VERSION}`
- `python:3.12-alpine${ALPINE_VERSION}`
- `nginx:1-alpine${ALPINE_VERSION}`
@y
- `golang:1.22-alpine${ALPINE_VERSION}`
- `python:3.12-alpine${ALPINE_VERSION}`
- `nginx:1-alpine${ALPINE_VERSION}`
@z

@x
The following example defines the version of `node` and `alpine` using build arguments.
@y
The following example defines the version of `node` and `alpine` using build arguments.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
ARG NODE_VERSION="{{% param example_node_version %}}"
ARG ALPINE_VERSION="{{% param example_alpine_version %}}"
@y
ARG NODE_VERSION="{{% param example_node_version %}}"
ARG ALPINE_VERSION="{{% param example_alpine_version %}}"
@z

@x
FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS base
WORKDIR /src
@y
FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS base
WORKDIR /src
@z

@x
FROM base AS build
COPY package*.json ./
RUN npm ci
RUN npm run build
@y
FROM base AS build
COPY package*.json ./
RUN npm ci
RUN npm run build
@z

@x
FROM base AS production
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY --from=build /src/dist/ .
CMD ["node", "app.js"]
```
@y
FROM base AS production
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY --from=build /src/dist/ .
CMD ["node", "app.js"]
```
@z

@x
In this case, the build arguments have default values.
Specifying their values when you invoke a build is optional.
To override the defaults, you would use the `--build-arg` CLI flag:
@y
In this case, the build arguments have default values.
Specifying their values when you invoke a build is optional.
To override the defaults, you would use the `--build-arg` CLI flag:
@z

@x
```console
$ docker build --build-arg NODE_VERSION=current .
```
@y
```console
$ docker build --build-arg NODE_VERSION=current .
```
@z

@x
For more information on how to use build arguments, refer to:
@y
For more information on how to use build arguments, refer to:
@z

@x
- [`ARG` Dockerfile reference](/reference/dockerfile.md#arg)
- [`docker build --build-arg` reference](/reference/cli/docker/buildx/build/#build-arg)
@y
- [`ARG` Dockerfile reference](reference/dockerfile.md#arg)
- [`docker build --build-arg` reference](__SUBDIR__/reference/cli/docker/buildx/build/#build-arg)
@z

@x
## `ENV` usage example
@y
## `ENV` usage example
@z

@x
Declaring an environment variable with `ENV` makes the variable
available to all subsequent instructions in the build stage.
The following example shows an example setting `NODE_ENV` to `production`
before installing JavaScript dependencies with `npm`.
Setting the variable makes `npm` omits packages needed only for local development.
@y
Declaring an environment variable with `ENV` makes the variable
available to all subsequent instructions in the build stage.
The following example shows an example setting `NODE_ENV` to `production`
before installing JavaScript dependencies with `npm`.
Setting the variable makes `npm` omits packages needed only for local development.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM node:20
WORKDIR /app
COPY package*.json ./
ENV NODE_ENV=production
RUN npm ci && npm cache clean --force
COPY . .
CMD ["node", "app.js"]
```
@y
FROM node:20
WORKDIR /app
COPY package*.json ./
ENV NODE_ENV=production
RUN npm ci && npm cache clean --force
COPY . .
CMD ["node", "app.js"]
```
@z

@x
Environment variables aren't configurable at build-time by default.
If you want to change the value of an `ENV` at build-time,
you can combine environment variables and build arguments:
@y
Environment variables aren't configurable at build-time by default.
If you want to change the value of an `ENV` at build-time,
you can combine environment variables and build arguments:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM node:20
ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV
WORKDIR /app
COPY package*.json ./
RUN npm ci && npm cache clean --force
COPY . .
CMD ["node", "app.js"]
```
@y
FROM node:20
ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV
WORKDIR /app
COPY package*.json ./
RUN npm ci && npm cache clean --force
COPY . .
CMD ["node", "app.js"]
```
@z

@x
With this Dockerfile, you can use `--build-arg` to override the default value of `NODE_ENV`:
@y
With this Dockerfile, you can use `--build-arg` to override the default value of `NODE_ENV`:
@z

@x
```console
$ docker build --build-arg NODE_ENV=development .
```
@y
```console
$ docker build --build-arg NODE_ENV=development .
```
@z

@x
Note that, because the environment variables you set persist in containers,
using them can lead to unintended side-effects for the application's runtime.
@y
Note that, because the environment variables you set persist in containers,
using them can lead to unintended side-effects for the application's runtime.
@z

@x
For more information on how to use environment variables in builds, refer to:
@y
For more information on how to use environment variables in builds, refer to:
@z

@x
- [`ENV` Dockerfile reference](/reference/dockerfile.md#env)
@y
- [`ENV` Dockerfile reference](reference/dockerfile.md#env)
@z

@x
## Scoping
@y
## Scoping
@z

@x
Build arguments declared in the global scope of a Dockerfile
aren't automatically inherited into the build stages.
They're only accessible in the global scope.
@y
Build arguments declared in the global scope of a Dockerfile
aren't automatically inherited into the build stages.
They're only accessible in the global scope.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# The following build argument is declared in the global scope:
ARG NAME="joe"
@y
# The following build argument is declared in the global scope:
ARG NAME="joe"
@z

@x
FROM alpine
# The following instruction doesn't have access to the $NAME build argument
# because the argument was defined in the global scope, not for this stage.
RUN echo "hello ${NAME}!"
```
@y
FROM alpine
# The following instruction doesn't have access to the $NAME build argument
# because the argument was defined in the global scope, not for this stage.
RUN echo "hello ${NAME}!"
```
@z

@x
The `echo` command in this example evaluates to `hello !`
because the value of the `NAME` build argument is out of scope.
To inherit global build arguments into a stage, you must consume them:
@y
The `echo` command in this example evaluates to `hello !`
because the value of the `NAME` build argument is out of scope.
To inherit global build arguments into a stage, you must consume them:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Declare the build argument in the global scope
ARG NAME="joe"
@y
# Declare the build argument in the global scope
ARG NAME="joe"
@z

@x
FROM alpine
# Consume the build argument in the build stage
ARG NAME
RUN echo $NAME
```
@y
FROM alpine
# Consume the build argument in the build stage
ARG NAME
RUN echo $NAME
```
@z

@x
Once a build argument is declared or consumed in a stage,
it's automatically inherited by child stages.
@y
Once a build argument is declared or consumed in a stage,
it's automatically inherited by child stages.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine AS base
# Declare the build argument in the build stage
ARG NAME="joe"
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine AS base
# Declare the build argument in the build stage
ARG NAME="joe"
@z

@x
# Create a new stage based on "base"
FROM base AS build
# The NAME build argument is available here
# since it's declared in a parent stage
RUN echo "hello $NAME!"
```
@y
# Create a new stage based on "base"
FROM base AS build
# The NAME build argument is available here
# since it's declared in a parent stage
RUN echo "hello $NAME!"
```
@z

@x
The following diagram further exemplifies how build argument
and environment variable inheritance works for multi-stage builds.
@y
The following diagram further exemplifies how build argument
and environment variable inheritance works for multi-stage builds.
@z

@x
{{< figure src="../../images/build-variables.svg" class="invertible" >}}
@y
{{< figure src="../../images/build-variables.svg" class="invertible" >}}
@z

@x
## Pre-defined build arguments
@y
## Pre-defined build arguments
@z

@x
This section describes pre-defined build arguments available to all builds by default.
@y
This section describes pre-defined build arguments available to all builds by default.
@z

@x
### Multi-platform build arguments
@y
### Multi-platform build arguments
@z

@x
Multi-platform build arguments describe the build and target platforms for the build.
@y
Multi-platform build arguments describe the build and target platforms for the build.
@z

@x
The build platform is the operating system, architecture, and platform variant
of the host system where the builder (the BuildKit daemon) is running.
@y
The build platform is the operating system, architecture, and platform variant
of the host system where the builder (the BuildKit daemon) is running.
@z

@x
- `BUILDPLATFORM`
- `BUILDOS`
- `BUILDARCH`
- `BUILDVARIANT`
@y
- `BUILDPLATFORM`
- `BUILDOS`
- `BUILDARCH`
- `BUILDVARIANT`
@z

@x
The target platform arguments hold the same values for the target platforms for the build,
specified using the `--platform` flag for the `docker build` command.
@y
The target platform arguments hold the same values for the target platforms for the build,
specified using the `--platform` flag for the `docker build` command.
@z

@x
- `TARGETPLATFORM`
- `TARGETOS`
- `TARGETARCH`
- `TARGETVARIANT`
@y
- `TARGETPLATFORM`
- `TARGETOS`
- `TARGETARCH`
- `TARGETVARIANT`
@z

@x
These arguments are useful for doing cross-compilation in multi-platform builds.
They're available in the global scope of the Dockerfile,
but they aren't automatically inherited by build stages.
To use them inside stage, you must declare them:
@y
These arguments are useful for doing cross-compilation in multi-platform builds.
They're available in the global scope of the Dockerfile,
but they aren't automatically inherited by build stages.
To use them inside stage, you must declare them:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Pre-defined build arguments are available in the global scope
FROM --platform=$BUILDPLATFORM golang
# To inherit them to a stage, declare them with ARG
ARG TARGETOS
RUN GOOS=$TARGETOS go build -o ./exe .
```
@y
# Pre-defined build arguments are available in the global scope
FROM --platform=$BUILDPLATFORM golang
# To inherit them to a stage, declare them with ARG
ARG TARGETOS
RUN GOOS=$TARGETOS go build -o ./exe .
```
@z

@x
For more information about multi-platform build arguments, refer to
[Multi-platform arguments](/reference/dockerfile.md#automatic-platform-args-in-the-global-scope)
@y
For more information about multi-platform build arguments, refer to
[Multi-platform arguments](reference/dockerfile.md#automatic-platform-args-in-the-global-scope)
@z

@x
### Proxy arguments
@y
### Proxy arguments
@z

@x
Proxy build arguments let you specify proxies to use for your build.
You don't need to declare or reference these arguments in the Dockerfile.
Specifying a proxy with `--build-arg` is enough to make your build use the proxy.
@y
Proxy build arguments let you specify proxies to use for your build.
You don't need to declare or reference these arguments in the Dockerfile.
Specifying a proxy with `--build-arg` is enough to make your build use the proxy.
@z

@x
Proxy arguments are automatically excluded from the build cache
and the output of `docker history` by default.
If you do reference the arguments in your Dockerfile,
the proxy configuration ends up in the build cache.
@y
Proxy arguments are automatically excluded from the build cache
and the output of `docker history` by default.
If you do reference the arguments in your Dockerfile,
the proxy configuration ends up in the build cache.
@z

@x
The builder respects the following proxy build arguments.
The variables are case insensitive.
@y
The builder respects the following proxy build arguments.
The variables are case insensitive.
@z

@x
- `HTTP_PROXY`
- `HTTPS_PROXY`
- `FTP_PROXY`
- `NO_PROXY`
- `ALL_PROXY`
@y
- `HTTP_PROXY`
- `HTTPS_PROXY`
- `FTP_PROXY`
- `NO_PROXY`
- `ALL_PROXY`
@z

@x
To configure a proxy for your build:
@y
To configure a proxy for your build:
@z

@x
```console
$ docker build --build-arg HTTP_PROXY=https://my-proxy.example.com .
```
@y
```console
$ docker build --build-arg HTTP_PROXY=https://my-proxy.example.com .
```
@z

@x
For more information about proxy build arguments, refer to
[Proxy arguments](/reference/dockerfile.md#predefined-args).
@y
For more information about proxy build arguments, refer to
[Proxy arguments](reference/dockerfile.md#predefined-args).
@z

@x
## Build tool configuration variables
@y
## Build tool configuration variables
@z

@x
The following environment variables enable, disable, or change the behavior of Buildx and BuildKit.
Note that these variables aren't used to configure the build container;
they aren't available inside the build and they have no relation to the `ENV` instruction.
They're used to configure the Buildx client, or the BuildKit daemon.
@y
The following environment variables enable, disable, or change the behavior of Buildx and BuildKit.
Note that these variables aren't used to configure the build container;
they aren't available inside the build and they have no relation to the `ENV` instruction.
They're used to configure the Buildx client, or the BuildKit daemon.
@z

@x
| Variable                                                                    | Type              | Description                                                     |
|-----------------------------------------------------------------------------|-------------------|-----------------------------------------------------------------|
| [BUILDKIT_COLORS](#buildkit_colors)                                         | String            | Configure text color for the terminal output.                   |
| [BUILDKIT_HOST](#buildkit_host)                                             | String            | Specify host to use for remote builders.                        |
| [BUILDKIT_PROGRESS](#buildkit_progress)                                     | String            | Configure type of progress output.                              |
| [BUILDKIT_TTY_LOG_LINES](#buildkit_tty_log_lines)                           | String            | Number of log lines (for active steps in TTY mode).             |
| [BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP](#buildx_bake_disable_vars_env_lookup) | Boolean           | Disable environment lookups in Bake definitions.                |
| [BUILDX_BAKE_FILE](#buildx_bake_file)                                       | String            | Specify the build definition file(s) for `docker buildx bake`.  |
| [BUILDX_BAKE_FILE_RELATIVE_PATHS](#buildx_bake_file_relative_paths)         | Boolean           | Resolve local build contexts from their definition file.        |
| [BUILDX_BAKE_FILE_SEPARATOR](#buildx_bake_file_separator)                   | String            | Specify the file-path separator for `BUILDX_BAKE_FILE`.         |
| [BUILDX_BAKE_GIT_ADVICE](#buildx_bake_git_advice)                           | Boolean           | Show Git advice when fetching remote Bake definitions.          |
| [BUILDX_BAKE_GIT_AUTH_HEADER](#buildx_bake_git_auth_header)                 | String            | HTTP authentication scheme for remote Bake files.               |
| [BUILDX_BAKE_GIT_AUTH_TOKEN](#buildx_bake_git_auth_token)                   | String            | HTTP authentication token for remote Bake files.                |
| [BUILDX_BAKE_GIT_SSH](#buildx_bake_git_ssh)                                 | String            | SSH authentication for remote Bake files.                       |
| [BUILDX_BUILDER](#buildx_builder)                                           | String            | Specify the builder instance to use.                            |
| [BUILDX_CONFIG](#buildx_config)                                             | String            | Specify location for configuration, state, and logs.            |
| [BUILDX_CPU_PROFILE](#buildx_cpu_profile)                                   | String            | Generate a `pprof` CPU profile at the specified location.       |
| [BUILDX_EXPERIMENTAL](#buildx_experimental)                                 | Boolean           | Turn on experimental features.                                  |
| [BUILDX_GIT_CHECK_DIRTY](#buildx_git_check_dirty)                           | Boolean           | Enable dirty Git checkout detection.                            |
| [BUILDX_GIT_INFO](#buildx_git_info)                                         | Boolean           | Remove Git information in provenance attestations.              |
| [BUILDX_GIT_LABELS](#buildx_git_labels)                                     | String \| Boolean | Add Git provenance labels to images.                            |
| [BUILDX_MEM_PROFILE](#buildx_mem_profile)                                   | String            | Generate a `pprof` memory profile at the specified location.    |
| [BUILDX_METADATA_PROVENANCE](#buildx_metadata_provenance)                   | String \| Boolean | Customize provenance information included in the metadata file. |
| [BUILDX_METADATA_WARNINGS](#buildx_metadata_warnings)                       | String            | Include build warnings in the metadata file.                    |
| [BUILDX_NO_DEFAULT_ATTESTATIONS](#buildx_no_default_attestations)           | Boolean           | Turn off default provenance attestations.                       |
| [BUILDX_NO_DEFAULT_OCI_ARTIFACT](#buildx_no_default_oci_artifact)           | Boolean           | Turn off OCI artifact storage for attestations by default.      |
| [BUILDX_NO_DEFAULT_LOAD](#buildx_no_default_load)                           | Boolean           | Turn off loading images to image store by default.              |
| [BUILDX_SEND_GIT_QUERY_AS_INPUT](#buildx_send_git_query_as_input)           | Boolean           | Resolve Git URL queries in Buildx for frontend compatibility.   |
| [EXPERIMENTAL_BUILDKIT_SOURCE_POLICY](#experimental_buildkit_source_policy) | String            | Specify a BuildKit source policy file.                          |
@y
| Variable                                                                    | Type              | Description                                                     |
|-----------------------------------------------------------------------------|-------------------|-----------------------------------------------------------------|
| [BUILDKIT_COLORS](#buildkit_colors)                                         | String            | Configure text color for the terminal output.                   |
| [BUILDKIT_HOST](#buildkit_host)                                             | String            | Specify host to use for remote builders.                        |
| [BUILDKIT_PROGRESS](#buildkit_progress)                                     | String            | Configure type of progress output.                              |
| [BUILDKIT_TTY_LOG_LINES](#buildkit_tty_log_lines)                           | String            | Number of log lines (for active steps in TTY mode).             |
| [BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP](#buildx_bake_disable_vars_env_lookup) | Boolean           | Disable environment lookups in Bake definitions.                |
| [BUILDX_BAKE_FILE](#buildx_bake_file)                                       | String            | Specify the build definition file(s) for `docker buildx bake`.  |
| [BUILDX_BAKE_FILE_RELATIVE_PATHS](#buildx_bake_file_relative_paths)         | Boolean           | Resolve local build contexts from their definition file.        |
| [BUILDX_BAKE_FILE_SEPARATOR](#buildx_bake_file_separator)                   | String            | Specify the file-path separator for `BUILDX_BAKE_FILE`.         |
| [BUILDX_BAKE_GIT_ADVICE](#buildx_bake_git_advice)                           | Boolean           | Show Git advice when fetching remote Bake definitions.          |
| [BUILDX_BAKE_GIT_AUTH_HEADER](#buildx_bake_git_auth_header)                 | String            | HTTP authentication scheme for remote Bake files.               |
| [BUILDX_BAKE_GIT_AUTH_TOKEN](#buildx_bake_git_auth_token)                   | String            | HTTP authentication token for remote Bake files.                |
| [BUILDX_BAKE_GIT_SSH](#buildx_bake_git_ssh)                                 | String            | SSH authentication for remote Bake files.                       |
| [BUILDX_BUILDER](#buildx_builder)                                           | String            | Specify the builder instance to use.                            |
| [BUILDX_CONFIG](#buildx_config)                                             | String            | Specify location for configuration, state, and logs.            |
| [BUILDX_CPU_PROFILE](#buildx_cpu_profile)                                   | String            | Generate a `pprof` CPU profile at the specified location.       |
| [BUILDX_EXPERIMENTAL](#buildx_experimental)                                 | Boolean           | Turn on experimental features.                                  |
| [BUILDX_GIT_CHECK_DIRTY](#buildx_git_check_dirty)                           | Boolean           | Enable dirty Git checkout detection.                            |
| [BUILDX_GIT_INFO](#buildx_git_info)                                         | Boolean           | Remove Git information in provenance attestations.              |
| [BUILDX_GIT_LABELS](#buildx_git_labels)                                     | String \| Boolean | Add Git provenance labels to images.                            |
| [BUILDX_MEM_PROFILE](#buildx_mem_profile)                                   | String            | Generate a `pprof` memory profile at the specified location.    |
| [BUILDX_METADATA_PROVENANCE](#buildx_metadata_provenance)                   | String \| Boolean | Customize provenance information included in the metadata file. |
| [BUILDX_METADATA_WARNINGS](#buildx_metadata_warnings)                       | String            | Include build warnings in the metadata file.                    |
| [BUILDX_NO_DEFAULT_ATTESTATIONS](#buildx_no_default_attestations)           | Boolean           | Turn off default provenance attestations.                       |
| [BUILDX_NO_DEFAULT_OCI_ARTIFACT](#buildx_no_default_oci_artifact)           | Boolean           | Turn off OCI artifact storage for attestations by default.      |
| [BUILDX_NO_DEFAULT_LOAD](#buildx_no_default_load)                           | Boolean           | Turn off loading images to image store by default.              |
| [BUILDX_SEND_GIT_QUERY_AS_INPUT](#buildx_send_git_query_as_input)           | Boolean           | Resolve Git URL queries in Buildx for frontend compatibility.   |
| [EXPERIMENTAL_BUILDKIT_SOURCE_POLICY](#experimental_buildkit_source_policy) | String            | Specify a BuildKit source policy file.                          |
@z

@x
BuildKit also supports a few additional configuration parameters. Refer to
[BuildKit built-in build args](/reference/dockerfile.md#buildkit-built-in-build-args).
@y
BuildKit also supports a few additional configuration parameters. Refer to
[BuildKit built-in build args](reference/dockerfile.md#buildkit-built-in-build-args).
@z

@x
You can express Boolean values for environment variables in different ways.
For example, `true`, `1`, and `T` all evaluate to true.
Evaluation is done using the `strconv.ParseBool` function in the Go standard library.
See the [reference documentation](https://pkg.go.dev/strconv#ParseBool) for details.
@y
You can express Boolean values for environment variables in different ways.
For example, `true`, `1`, and `T` all evaluate to true.
Evaluation is done using the `strconv.ParseBool` function in the Go standard library.
See the [reference documentation](https://pkg.go.dev/strconv#ParseBool) for details.
@z

@x
<!-- vale Docker.HeadingSentenceCase = NO -->
@y
<!-- vale Docker.HeadingSentenceCase = NO -->
@z

@x
### BUILDKIT_COLORS
@y
### BUILDKIT_COLORS
@z

@x
Changes the colors of the terminal output. Set `BUILDKIT_COLORS` to a CSV string
in the following format:
@y
Changes the colors of the terminal output. Set `BUILDKIT_COLORS` to a CSV string
in the following format:
@z

@x
```console
$ export BUILDKIT_COLORS="run=123,20,245:error=yellow:cancel=blue:warning=white"
```
@y
```console
$ export BUILDKIT_COLORS="run=123,20,245:error=yellow:cancel=blue:warning=white"
```
@z

@x
Color values can be any valid RGB hex code, or one of the
[BuildKit predefined colors](https://github.com/moby/buildkit/blob/master/util/progress/progressui/colors.go).
@y
Color values can be any valid RGB hex code, or one of the
[BuildKit predefined colors](https://github.com/moby/buildkit/blob/master/util/progress/progressui/colors.go).
@z

@x
Setting `NO_COLOR` to anything turns off colorized output, as recommended by
[no-color.org](https://no-color.org/).
@y
Setting `NO_COLOR` to anything turns off colorized output, as recommended by
[no-color.org](https://no-color.org/).
@z

@x
### BUILDKIT_HOST
@y
### BUILDKIT_HOST
@z

@x
{{< summary-bar feature_name="Buildkit host" >}}
@y
{{< summary-bar feature_name="Buildkit host" >}}
@z

@x
You use the `BUILDKIT_HOST` to specify the address of a BuildKit daemon to use
as a remote builder. This is the same as specifying the address as a positional
argument to `docker buildx create`.
@y
You use the `BUILDKIT_HOST` to specify the address of a BuildKit daemon to use
as a remote builder. This is the same as specifying the address as a positional
argument to `docker buildx create`.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDKIT_HOST=tcp://localhost:1234
$ docker buildx create --name=remote --driver=remote
```
@y
```console
$ export BUILDKIT_HOST=tcp://localhost:1234
$ docker buildx create --name=remote --driver=remote
```
@z

@x
If you specify both the `BUILDKIT_HOST` environment variable and a positional
argument, the argument takes priority.
@y
If you specify both the `BUILDKIT_HOST` environment variable and a positional
argument, the argument takes priority.
@z

@x
### BUILDKIT_PROGRESS
@y
### BUILDKIT_PROGRESS
@z

@x
Sets the type of the BuildKit progress output. Valid values are:
@y
Sets the type of the BuildKit progress output. Valid values are:
@z

@x
- `auto` (default): automatically uses `tty` in interactive terminals, `plain` otherwise
- `plain`: displays build steps sequentially in simple text format
- `tty`: interactive output with formatted progress bars and build steps
- `quiet`: suppresses progress output, only shows errors and final image ID
- `none`: no progress output, only shows errors
- `rawjson`: outputs build progress as raw JSON (useful for parsing by other tools)
@y
- `auto` (default): automatically uses `tty` in interactive terminals, `plain` otherwise
- `plain`: displays build steps sequentially in simple text format
- `tty`: interactive output with formatted progress bars and build steps
- `quiet`: suppresses progress output, only shows errors and final image ID
- `none`: no progress output, only shows errors
- `rawjson`: outputs build progress as raw JSON (useful for parsing by other tools)
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDKIT_PROGRESS=plain
```
@y
```console
$ export BUILDKIT_PROGRESS=plain
```
@z

@x
### BUILDKIT_TTY_LOG_LINES
@y
### BUILDKIT_TTY_LOG_LINES
@z

@x
You can change how many log lines are visible for active steps in TTY mode by
setting `BUILDKIT_TTY_LOG_LINES` to a number (default to `6`).
@y
You can change how many log lines are visible for active steps in TTY mode by
setting `BUILDKIT_TTY_LOG_LINES` to a number (default to `6`).
@z

@x
```console
$ export BUILDKIT_TTY_LOG_LINES=8
```
@y
```console
$ export BUILDKIT_TTY_LOG_LINES=8
```
@z

@x
### EXPERIMENTAL_BUILDKIT_SOURCE_POLICY
@y
### EXPERIMENTAL_BUILDKIT_SOURCE_POLICY
@z

@x
Lets you specify a
[BuildKit source policy](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#reproducing-the-pinned-dependencies)
file for creating reproducible builds with pinned dependencies.
@y
Lets you specify a
[BuildKit source policy](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#reproducing-the-pinned-dependencies)
file for creating reproducible builds with pinned dependencies.
@z

@x
```console
$ export EXPERIMENTAL_BUILDKIT_SOURCE_POLICY=./policy.json
```
@y
```console
$ export EXPERIMENTAL_BUILDKIT_SOURCE_POLICY=./policy.json
```
@z

@x
Example:
@y
Example:
@z

@x
```json
{
  "rules": [
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "docker-image://docker.io/library/alpine:latest"
      },
      "updates": {
        "identifier": "docker-image://docker.io/library/alpine:latest@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454"
      }
    },
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "https://raw.githubusercontent.com/moby/buildkit/v0.10.1/README.md"
      },
      "updates": {
        "attrs": {"http.checksum": "sha256:6e4b94fc270e708e1068be28bd3551dc6917a4fc5a61293d51bb36e6b75c4b53"}
      }
    },
    {
      "action": "DENY",
      "selector": {
        "identifier": "docker-image://docker.io/library/golang*"
      }
    }
  ]
}
```
@y
```json
{
  "rules": [
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "docker-image://docker.io/library/alpine:latest"
      },
      "updates": {
        "identifier": "docker-image://docker.io/library/alpine:latest@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454"
      }
    },
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "https://raw.githubusercontent.com/moby/buildkit/v0.10.1/README.md"
      },
      "updates": {
        "attrs": {"http.checksum": "sha256:6e4b94fc270e708e1068be28bd3551dc6917a4fc5a61293d51bb36e6b75c4b53"}
      }
    },
    {
      "action": "DENY",
      "selector": {
        "identifier": "docker-image://docker.io/library/golang*"
      }
    }
  ]
}
```
@z

@x
### BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP
@y
### BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP
@z

@x
Set `BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1` to prevent Bake definitions from
reading variable values from the process environment. For HCL input, this
disables environment overrides of declared variables. It also disables the
implicit environment lookup for `--set app.arg.NAME` when no value is given.
@y
Set `BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1` to prevent Bake definitions from
reading variable values from the process environment. For HCL input, this
disables environment overrides of declared variables. It also disables the
implicit environment lookup for `--set app.arg.NAME` when no value is given.
@z

@x
For example, keep the Bake file's default `TAG` even when the shell defines
a `TAG` environment variable:
@y
For example, keep the Bake file's default `TAG` even when the shell defines
a `TAG` environment variable:
@z

@x
```console
$ BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1 TAG=dev docker buildx bake --print
```
@y
```console
$ BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1 TAG=dev docker buildx bake --print
```
@z

@x
You can still pass values explicitly with `--var TAG=dev` or
`--set app.arg.NAME=value`.
@y
You can still pass values explicitly with `--var TAG=dev` or
`--set app.arg.NAME=value`.
@z

@x
For Compose input, this setting excludes the process environment from variable
interpolation. Bake still loads `.env` from the working directory and accepts
explicit `--var` values. The setting doesn't disable environment variables
used to configure Buildx itself, such as `BUILDX_BUILDER`.
@y
For Compose input, this setting excludes the process environment from variable
interpolation. Bake still loads `.env` from the working directory and accepts
explicit `--var` values. The setting doesn't disable environment variables
used to configure Buildx itself, such as `BUILDX_BUILDER`.
@z

@x
### BUILDX_BAKE_FILE
@y
### BUILDX_BAKE_FILE
@z

@x
{{< summary-bar feature_name="Buildx bake file" >}}
@y
{{< summary-bar feature_name="Buildx bake file" >}}
@z

@x
Specify one or more build definition files for `docker buildx bake`. 
@y
Specify one or more build definition files for `docker buildx bake`. 
@z

@x
This environment variable provides an alternative to the `-f` / `--file` command-line flag.
@y
This environment variable provides an alternative to the `-f` / `--file` command-line flag.
@z

@x
Multiple files can be specified by separating them with the system path separator (":" on Linux/macOS, ";" on Windows):
@y
Multiple files can be specified by separating them with the system path separator (":" on Linux/macOS, ";" on Windows):
@z

@x
```console
export BUILDX_BAKE_FILE=file1.hcl:file2.hcl
```
@y
```console
export BUILDX_BAKE_FILE=file1.hcl:file2.hcl
```
@z

@x
Or with a custom separator defined by the [BUILDX_BAKE_FILE_SEPARATOR](#buildx_bake_file_separator) variable:
@y
Or with a custom separator defined by the [BUILDX_BAKE_FILE_SEPARATOR](#buildx_bake_file_separator) variable:
@z

@x
```console
export BUILDX_BAKE_FILE_SEPARATOR=@
export BUILDX_BAKE_FILE=file1.hcl@file2.hcl
```
@y
```console
export BUILDX_BAKE_FILE_SEPARATOR=@
export BUILDX_BAKE_FILE=file1.hcl@file2.hcl
```
@z

@x
If both `BUILDX_BAKE_FILE` and the `-f` flag are set, only the files provided via `-f` are used. 
@y
If both `BUILDX_BAKE_FILE` and the `-f` flag are set, only the files provided via `-f` are used. 
@z

@x
If a listed file does not exist or is invalid, bake returns an error.
@y
If a listed file does not exist or is invalid, bake returns an error.
@z

@x
### BUILDX_BAKE_FILE_RELATIVE_PATHS
@y
### BUILDX_BAKE_FILE_RELATIVE_PATHS
@z

@x
By default, Bake resolves local directory paths in `target.context` and
`target.contexts` from the directory where you run the command. Set
`BUILDX_BAKE_FILE_RELATIVE_PATHS=1` to resolve these paths from the definition
file instead.
@y
By default, Bake resolves local directory paths in `target.context` and
`target.contexts` from the directory where you run the command. Set
`BUILDX_BAKE_FILE_RELATIVE_PATHS=1` to resolve these paths from the definition
file instead.
@z

@x
For HCL files, each path is relative to the Bake file that defines it. An
omitted `context` uses `.` relative to the file that defines the target.
For Compose input, paths are relative to the first Compose file's directory,
including paths added by override files.
@y
For HCL files, each path is relative to the Bake file that defines it. An
omitted `context` uses `.` relative to the file that defines the target.
For Compose input, paths are relative to the first Compose file's directory,
including paths added by override files.
@z

@x
For example, if `build/docker-bake.hcl` contains `context = "./src"`, the
following command uses `build/src` as its context:
@y
For example, if `build/docker-bake.hcl` contains `context = "./src"`, the
following command uses `build/src` as its context:
@z

@x
```console
$ BUILDX_BAKE_FILE_RELATIVE_PATHS=1 \
    docker buildx bake -f build/docker-bake.hcl
```
@y
```console
$ BUILDX_BAKE_FILE_RELATIVE_PATHS=1 \
    docker buildx bake -f build/docker-bake.hcl
```
@z

@x
Use the `cwd://` prefix, such as `context = "cwd://src"`, to keep a path
relative to the invocation directory. Absolute paths, remote URLs, and
special contexts such as `target:app` keep their existing meaning.
@y
Use the `cwd://` prefix, such as `context = "cwd://src"`, to keep a path
relative to the invocation directory. Absolute paths, remote URLs, and
special contexts such as `target:app` keep their existing meaning.
@z

@x
### BUILDX_BAKE_FILE_SEPARATOR
@y
### BUILDX_BAKE_FILE_SEPARATOR
@z

@x
{{< summary-bar feature_name="Buildx bake file separator" >}}
@y
{{< summary-bar feature_name="Buildx bake file separator" >}}
@z

@x
Controls the separator used between file paths in the `BUILDX_BAKE_FILE` environment variable. 
@y
Controls the separator used between file paths in the `BUILDX_BAKE_FILE` environment variable. 
@z

@x
This is useful if your file paths contain the default separator character or if you want to standardize separators across different platforms.
@y
This is useful if your file paths contain the default separator character or if you want to standardize separators across different platforms.
@z

@x
```console
export BUILDX_BAKE_PATH_SEPARATOR=@
export BUILDX_BAKE_FILE=file1.hcl@file2.hcl
```
@y
```console
export BUILDX_BAKE_PATH_SEPARATOR=@
export BUILDX_BAKE_FILE=file1.hcl@file2.hcl
```
@z

@x
### BUILDX_BAKE_GIT_ADVICE
@y
### BUILDX_BAKE_GIT_ADVICE
@z

@x
Set `BUILDX_BAKE_GIT_ADVICE=1` to show Git advice messages while fetching a
remote Bake definition. Advice includes messages such as Git's detached HEAD
notice. Advice is disabled by default.
@y
Set `BUILDX_BAKE_GIT_ADVICE=1` to show Git advice messages while fetching a
remote Bake definition. Advice includes messages such as Git's detached HEAD
notice. Advice is disabled by default.
@z

@x
```console
$ BUILDX_BAKE_GIT_ADVICE=1 docker buildx bake --progress=plain \
    https://github.com/user/myrepo.git
```
@y
```console
$ BUILDX_BAKE_GIT_ADVICE=1 docker buildx bake --progress=plain \
    https://github.com/user/myrepo.git
```
@z

@x
This variable controls fetching the Bake definition. To show advice for Git
build contexts, pass the `BUILDKIT_GIT_ADVICE` build argument instead:
@y
This variable controls fetching the Bake definition. To show advice for Git
build contexts, pass the `BUILDKIT_GIT_ADVICE` build argument instead:
@z

@x
```console
$ docker buildx build --progress=plain --build-arg BUILDKIT_GIT_ADVICE=1 \
    https://github.com/user/myrepo.git
```
@y
```console
$ docker buildx build --progress=plain --build-arg BUILDKIT_GIT_ADVICE=1 \
    https://github.com/user/myrepo.git
```
@z

@x
See the
[built-in arguments](/reference/dockerfile.md#buildkit-built-in-build-args).
@y
See the
[built-in arguments](reference/dockerfile.md#buildkit-built-in-build-args).
@z

@x
### BUILDX_BAKE_GIT_AUTH_HEADER
@y
### BUILDX_BAKE_GIT_AUTH_HEADER
@z

@x
{{< summary-bar feature_name="Buildx bake Git auth token" >}}
@y
{{< summary-bar feature_name="Buildx bake Git auth token" >}}
@z

@x
Sets the HTTP authentication scheme when using a remote Bake definition in a private Git repository.
This is equivalent to the [`GIT_AUTH_HEADER` secret](./secrets#http-authentication-scheme),
but facilitates the pre-flight authentication in Bake when loading the remote Bake file.
Supported values are `bearer` (default) and `basic`.
@y
Sets the HTTP authentication scheme when using a remote Bake definition in a private Git repository.
This is equivalent to the [`GIT_AUTH_HEADER` secret](./secrets#http-authentication-scheme),
but facilitates the pre-flight authentication in Bake when loading the remote Bake file.
Supported values are `bearer` (default) and `basic`.
@z

@x
Bake also uses this scheme when authenticating Git build contexts on the
same host as the remote definition. See
[`BUILDX_BAKE_GIT_AUTH_TOKEN`](#buildx_bake_git_auth_token) for details.
@y
Bake also uses this scheme when authenticating Git build contexts on the
same host as the remote definition. See
[`BUILDX_BAKE_GIT_AUTH_TOKEN`](#buildx_bake_git_auth_token) for details.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_BAKE_GIT_AUTH_HEADER=basic
```
@y
```console
$ export BUILDX_BAKE_GIT_AUTH_HEADER=basic
```
@z

@x
### BUILDX_BAKE_GIT_AUTH_TOKEN
@y
### BUILDX_BAKE_GIT_AUTH_TOKEN
@z

@x
{{< summary-bar feature_name="Buildx bake Git auth token" >}}
@y
{{< summary-bar feature_name="Buildx bake Git auth token" >}}
@z

@x
Sets the HTTP authentication token when using a remote Bake definition in a private Git repository.
This is equivalent to the [`GIT_AUTH_TOKEN` secret](./secrets#git-authentication-for-remote-contexts),
but facilitates the pre-flight authentication in Bake when loading the remote Bake file.
@y
Sets the HTTP authentication token when using a remote Bake definition in a private Git repository.
This is equivalent to the [`GIT_AUTH_TOKEN` secret](./secrets#git-authentication-for-remote-contexts),
but facilitates the pre-flight authentication in Bake when loading the remote Bake file.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_BAKE_GIT_AUTH_TOKEN=$(cat git-token.txt)
```
@y
```console
$ export BUILDX_BAKE_GIT_AUTH_TOKEN=$(cat git-token.txt)
```
@z

@x
When you build from a remote Bake definition, Bake also uses this token to
authenticate Git build contexts on the same host. For example, a definition
fetched from `https://git.example.com/team/app.git` can use the token for a
Git context on `git.example.com`. Private Git contexts on other hosts need
separate credentials.
@y
When you build from a remote Bake definition, Bake also uses this token to
authenticate Git build contexts on the same host. For example, a definition
fetched from `https://git.example.com/team/app.git` can use the token for a
Git context on `git.example.com`. Private Git contexts on other hosts need
separate credentials.
@z

@x
Bake determines which host can use these credentials from the remote
definition URL.
@y
Bake determines which host can use these credentials from the remote
definition URL.
@z

@x
When you use only local Bake definition files, `BUILDX_BAKE_GIT_AUTH_TOKEN`
and `BUILDX_BAKE_GIT_AUTH_HEADER` don't provide credentials for Git build
contexts. Configure
[Git authentication secrets](./secrets.md#git-authentication-for-remote-contexts)
for those contexts instead.
@y
When you use only local Bake definition files, `BUILDX_BAKE_GIT_AUTH_TOKEN`
and `BUILDX_BAKE_GIT_AUTH_HEADER` don't provide credentials for Git build
contexts. Configure
[Git authentication secrets](./secrets.md#git-authentication-for-remote-contexts)
for those contexts instead.
@z

@x
### BUILDX_BAKE_GIT_SSH
@y
### BUILDX_BAKE_GIT_SSH
@z

@x
{{< summary-bar feature_name="Buildx bake Git SSH" >}}
@y
{{< summary-bar feature_name="Buildx bake Git SSH" >}}
@z

@x
Lets you specify a list of SSH agent socket filepaths to forward to Bake
for authenticating to a Git server when using a remote Bake definition in a private repository.
This is similar to SSH mounts for builds, but facilitates the pre-flight authentication in Bake when resolving the build definition.
@y
Lets you specify a list of SSH agent socket filepaths to forward to Bake
for authenticating to a Git server when using a remote Bake definition in a private repository.
This is similar to SSH mounts for builds, but facilitates the pre-flight authentication in Bake when resolving the build definition.
@z

@x
Setting this environment is typically not necessary, because Bake will use the `SSH_AUTH_SOCK` agent socket by default.
You only need to specify this variable if you want to use a socket with a different filepath.
This variable can take multiple paths using a comma-separated string.
@y
Setting this environment is typically not necessary, because Bake will use the `SSH_AUTH_SOCK` agent socket by default.
You only need to specify this variable if you want to use a socket with a different filepath.
This variable can take multiple paths using a comma-separated string.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_BAKE_GIT_SSH=/run/foo/listener.sock,~/.creds/ssh.sock
```
@y
```console
$ export BUILDX_BAKE_GIT_SSH=/run/foo/listener.sock,~/.creds/ssh.sock
```
@z

@x
### BUILDX_BUILDER
@y
### BUILDX_BUILDER
@z

@x
Overrides the configured builder instance. Same as the `docker buildx --builder`
CLI flag.
@y
Overrides the configured builder instance. Same as the `docker buildx --builder`
CLI flag.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_BUILDER=my-builder
```
@y
```console
$ export BUILDX_BUILDER=my-builder
```
@z

@x
### BUILDX_CONFIG
@y
### BUILDX_CONFIG
@z

@x
You can use `BUILDX_CONFIG` to specify the directory to use for build
configuration, state, and logs. The lookup order for this directory is as
follows:
@y
You can use `BUILDX_CONFIG` to specify the directory to use for build
configuration, state, and logs. The lookup order for this directory is as
follows:
@z

@x
- `$BUILDX_CONFIG`
- `$DOCKER_CONFIG/buildx`
- `~/.docker/buildx` (default)
@y
- `$BUILDX_CONFIG`
- `$DOCKER_CONFIG/buildx`
- `~/.docker/buildx` (default)
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_CONFIG=/usr/local/etc
```
@y
```console
$ export BUILDX_CONFIG=/usr/local/etc
```
@z

@x
For repository- and scope-specific credentials stored under this directory,
see [Registry authentication](./registry-auth.md).
@y
For repository- and scope-specific credentials stored under this directory,
see [Registry authentication](./registry-auth.md).
@z

@x
### BUILDX_CPU_PROFILE
@y
### BUILDX_CPU_PROFILE
@z

@x
{{< summary-bar feature_name="Buildx CPU profile" >}}
@y
{{< summary-bar feature_name="Buildx CPU profile" >}}
@z

@x
If specified, Buildx generates a `pprof` CPU profile at the specified location.
@y
If specified, Buildx generates a `pprof` CPU profile at the specified location.
@z

@x
> [!NOTE]
> This property is only useful for when developing Buildx. The profiling data
> is not relevant for analyzing a build's performance.
@y
> [!NOTE]
> This property is only useful for when developing Buildx. The profiling data
> is not relevant for analyzing a build's performance.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_CPU_PROFILE=buildx_cpu.prof
```
@y
```console
$ export BUILDX_CPU_PROFILE=buildx_cpu.prof
```
@z

@x
### BUILDX_EXPERIMENTAL
@y
### BUILDX_EXPERIMENTAL
@z

@x
Enables experimental build features.
@y
Enables experimental build features.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_EXPERIMENTAL=1
```
@y
```console
$ export BUILDX_EXPERIMENTAL=1
```
@z

@x
### BUILDX_GIT_CHECK_DIRTY
@y
### BUILDX_GIT_CHECK_DIRTY
@z

@x
{{< summary-bar feature_name="Buildx Git check dirty" >}}
@y
{{< summary-bar feature_name="Buildx Git check dirty" >}}
@z

@x
When set to true, checks for dirty state in source control information for
[provenance attestations](/manuals/build/metadata/attestations/slsa-provenance.md).
@y
When set to true, checks for dirty state in source control information for
[provenance attestations](manuals/build/metadata/attestations/slsa-provenance.md).
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_GIT_CHECK_DIRTY=1
```
@y
```console
$ export BUILDX_GIT_CHECK_DIRTY=1
```
@z

@x
### BUILDX_GIT_INFO
@y
### BUILDX_GIT_INFO
@z

@x
{{< summary-bar feature_name="Buildx Git info" >}}
@y
{{< summary-bar feature_name="Buildx Git info" >}}
@z

@x
When set to false, removes source control information from
[provenance attestations](/manuals/build/metadata/attestations/slsa-provenance.md).
@y
When set to false, removes source control information from
[provenance attestations](manuals/build/metadata/attestations/slsa-provenance.md).
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_GIT_INFO=0
```
@y
```console
$ export BUILDX_GIT_INFO=0
```
@z

@x
### BUILDX_GIT_LABELS
@y
### BUILDX_GIT_LABELS
@z

@x
{{< summary-bar feature_name="Buildx Git labels" >}}
@y
{{< summary-bar feature_name="Buildx Git labels" >}}
@z

@x
Adds provenance labels, based on Git information, to images that you build. The
labels are:
@y
Adds provenance labels, based on Git information, to images that you build. The
labels are:
@z

@x
- `com.docker.image.source.entrypoint`: Location of the Dockerfile relative to
  the project root
- `org.opencontainers.image.revision`: Git commit revision
- `org.opencontainers.image.source`: SSH or HTTPS address of the repository
@y
- `com.docker.image.source.entrypoint`: Location of the Dockerfile relative to
  the project root
- `org.opencontainers.image.revision`: Git commit revision
- `org.opencontainers.image.source`: SSH or HTTPS address of the repository
@z

@x
Example:
@y
Example:
@z

@x
```json
  "Labels": {
    "com.docker.image.source.entrypoint": "Dockerfile",
    "org.opencontainers.image.revision": "5734329c6af43c2ae295010778cd308866b95d9b",
    "org.opencontainers.image.source": "git@github.com:foo/bar.git"
  }
```
@y
```json
  "Labels": {
    "com.docker.image.source.entrypoint": "Dockerfile",
    "org.opencontainers.image.revision": "5734329c6af43c2ae295010778cd308866b95d9b",
    "org.opencontainers.image.source": "git@github.com:foo/bar.git"
  }
```
@z

@x
Usage:
@y
Usage:
@z

@x
- Set `BUILDX_GIT_LABELS=1` to include the `entrypoint` and `revision` labels.
- Set `BUILDX_GIT_LABELS=full` to include all labels.
@y
- Set `BUILDX_GIT_LABELS=1` to include the `entrypoint` and `revision` labels.
- Set `BUILDX_GIT_LABELS=full` to include all labels.
@z

@x
If the repository is in a dirty state, the `revision` gets a `-dirty` suffix.
@y
If the repository is in a dirty state, the `revision` gets a `-dirty` suffix.
@z

@x
### BUILDX_MEM_PROFILE
@y
### BUILDX_MEM_PROFILE
@z

@x
{{< summary-bar feature_name="Buildx mem profile" >}}
@y
{{< summary-bar feature_name="Buildx mem profile" >}}
@z

@x
If specified, Buildx generates a `pprof` memory profile at the specified
location.
@y
If specified, Buildx generates a `pprof` memory profile at the specified
location.
@z

@x
> [!NOTE]
> This property is only useful for when developing Buildx. The profiling data
> is not relevant for analyzing a build's performance.
@y
> [!NOTE]
> This property is only useful for when developing Buildx. The profiling data
> is not relevant for analyzing a build's performance.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_MEM_PROFILE=buildx_mem.prof
```
@y
```console
$ export BUILDX_MEM_PROFILE=buildx_mem.prof
```
@z

@x
### BUILDX_METADATA_PROVENANCE
@y
### BUILDX_METADATA_PROVENANCE
@z

@x
{{< summary-bar feature_name="Buildx metadata provenance" >}}
@y
{{< summary-bar feature_name="Buildx metadata provenance" >}}
@z

@x
By default, Buildx includes minimal provenance information in the metadata file
through [`--metadata-file` flag](/reference/cli/docker/buildx/build/#metadata-file).
This environment variable allows you to customize the provenance information
included in the metadata file:
* `min` sets minimal provenance (default).
* `max` sets full provenance.
* `disabled`, `false` or `0` does not set any provenance.
@y
By default, Buildx includes minimal provenance information in the metadata file
through [`--metadata-file` flag](__SUBDIR__/reference/cli/docker/buildx/build/#metadata-file).
This environment variable allows you to customize the provenance information
included in the metadata file:
* `min` sets minimal provenance (default).
* `max` sets full provenance.
* `disabled`, `false` or `0` does not set any provenance.
@z

@x
### BUILDX_METADATA_WARNINGS
@y
### BUILDX_METADATA_WARNINGS
@z

@x
{{< summary-bar feature_name="Buildx metadata warnings" >}}
@y
{{< summary-bar feature_name="Buildx metadata warnings" >}}
@z

@x
By default, Buildx does not include build warnings in the metadata file through
[`--metadata-file` flag](/reference/cli/docker/buildx/build/#metadata-file).
You can set this environment variable to `1` or `true` to include them.
@y
By default, Buildx does not include build warnings in the metadata file through
[`--metadata-file` flag](__SUBDIR__/reference/cli/docker/buildx/build/#metadata-file).
You can set this environment variable to `1` or `true` to include them.
@z

@x
### BUILDX_NO_DEFAULT_ATTESTATIONS
@y
### BUILDX_NO_DEFAULT_ATTESTATIONS
@z

@x
{{< summary-bar feature_name="Buildx no default" >}}
@y
{{< summary-bar feature_name="Buildx no default" >}}
@z

@x
By default, BuildKit v0.11 and later adds
[provenance attestations](/manuals/build/metadata/attestations/slsa-provenance.md) to images you
build. Set `BUILDX_NO_DEFAULT_ATTESTATIONS=1` to disable the default provenance
attestations.
@y
By default, BuildKit v0.11 and later adds
[provenance attestations](manuals/build/metadata/attestations/slsa-provenance.md) to images you
build. Set `BUILDX_NO_DEFAULT_ATTESTATIONS=1` to disable the default provenance
attestations.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_NO_DEFAULT_ATTESTATIONS=1
```
@y
```console
$ export BUILDX_NO_DEFAULT_ATTESTATIONS=1
```
@z

@x
### BUILDX_NO_DEFAULT_OCI_ARTIFACT
@y
### BUILDX_NO_DEFAULT_OCI_ARTIFACT
@z

@x
{{< summary-bar feature_name="Buildx no default OCI artifact" >}}
@y
{{< summary-bar feature_name="Buildx no default OCI artifact" >}}
@z

@x
Starting with BuildKit v0.32.0, BuildKit stores attestations as OCI artifacts
when OCI media types are enabled. Set `BUILDX_NO_DEFAULT_OCI_ARTIFACT=1` to
make Buildx set `oci-artifact=false` when the build uses an exporter that
supports attestations and you haven't explicitly set the `oci-artifact`
exporter attribute.
@y
Starting with BuildKit v0.32.0, BuildKit stores attestations as OCI artifacts
when OCI media types are enabled. Set `BUILDX_NO_DEFAULT_OCI_ARTIFACT=1` to
make Buildx set `oci-artifact=false` when the build uses an exporter that
supports attestations and you haven't explicitly set the `oci-artifact`
exporter attribute.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_NO_DEFAULT_OCI_ARTIFACT=1
```
@y
```console
$ export BUILDX_NO_DEFAULT_OCI_ARTIFACT=1
```
@z

@x
### BUILDX_NO_DEFAULT_LOAD
@y
### BUILDX_NO_DEFAULT_LOAD
@z

@x
When you build an image using the `docker` driver, the image is automatically
loaded to the image store when the build finishes. Set `BUILDX_NO_DEFAULT_LOAD`
to disable automatic loading of images to the local container store.
@y
When you build an image using the `docker` driver, the image is automatically
loaded to the image store when the build finishes. Set `BUILDX_NO_DEFAULT_LOAD`
to disable automatic loading of images to the local container store.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_NO_DEFAULT_LOAD=1
```
@y
```console
$ export BUILDX_NO_DEFAULT_LOAD=1
```
@z

@x
### BUILDX_SEND_GIT_QUERY_AS_INPUT
@y
### BUILDX_SEND_GIT_QUERY_AS_INPUT
@z

@x
Set `BUILDX_SEND_GIT_QUERY_AS_INPUT=1` to use Git URL queries with a BuildKit
daemon or Dockerfile frontend that doesn't support the Git query-string
format. Buildx resolves the Git URL into a source input instead of requiring
the frontend to interpret the query. The default is `false`.
@y
Set `BUILDX_SEND_GIT_QUERY_AS_INPUT=1` to use Git URL queries with a BuildKit
daemon or Dockerfile frontend that doesn't support the Git query-string
format. Buildx resolves the Git URL into a source input instead of requiring
the frontend to interpret the query. The default is `false`.
@z

@x
For example, select a tag and verify its commit while using an older builder:
@y
For example, select a tag and verify its commit while using an older builder:
@z

@x
```console
$ BUILDX_SEND_GIT_QUERY_AS_INPUT=1 docker buildx build \
    'https://github.com/moby/buildkit.git?tag=v0.21.1&checksum=66735c67'
```
@y
```console
$ BUILDX_SEND_GIT_QUERY_AS_INPUT=1 docker buildx build \
    'https://github.com/moby/buildkit.git?tag=v0.21.1&checksum=66735c67'
```
@z

@x
This applies to the main Git context and additional Git contexts that use
URL queries. It changes how the context is represented in provenance:
the context is supplied as a source input instead of the usual context
string. If you consume provenance, account for that difference before
enabling the setting in your workflow.
@y
This applies to the main Git context and additional Git contexts that use
URL queries. It changes how the context is represented in provenance:
the context is supplied as a source input instead of the usual context
string. If you consume provenance, account for that difference before
enabling the setting in your workflow.
@z

@x
See [Git URL queries](../concepts/context.md#url-queries) for query syntax.
@y
See [Git URL queries](../concepts/context.md#url-queries) for query syntax.
@z

@x
<!-- vale Docker.HeadingSentenceCase = YES -->
@y
<!-- vale Docker.HeadingSentenceCase = YES -->
@z
