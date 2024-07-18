%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose build
short: Build or rebuild services
@y
command: docker compose build
short: Build or rebuild services
@z

@x
long: |-
    Services are built once and then tagged, by default as `project-service`.

    If the Compose file specifies an
    [image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
    the image is tagged with that name, substituting any variables beforehand. See
    [variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).

    If you change a service's `Dockerfile` or the contents of its build directory,
    run `docker compose build` to rebuild it.
@y
long: |-
    Services are built once and then tagged, by default as `project-service`.

    If the Compose file specifies an
    [image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
    the image is tagged with that name, substituting any variables beforehand. See
    [variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).

    If you change a service's `Dockerfile` or the contents of its build directory,
    run `docker compose build` to rebuild it.
@z

@x
usage: docker compose build [OPTIONS] [SERVICE...]
@y
usage: docker compose build [OPTIONS] [SERVICE...]
@z

% options:

@x build-arg
      description: Set build-time variables for services
@y
      description: Set build-time variables for services
@z

@x builder
      description: Set builder to use
@y
      description: Set builder to use
@z

@x compress
      description: Compress the build context using gzip. DEPRECATED
@y
      description: Compress the build context using gzip. DEPRECATED
@z

@x force-rm
      description: Always remove intermediate containers. DEPRECATED
@y
      description: Always remove intermediate containers. DEPRECATED
@z

@x memory
      description: |
        Set memory limit for the build container. Not supported by BuildKit.
@y
      description: |
        Set memory limit for the build container. Not supported by BuildKit.
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: Do not use cache when building the image
@z

@x no-rm
      description: |
        Do not remove intermediate containers after a successful build. DEPRECATED
@y
      description: |
        Do not remove intermediate containers after a successful build. DEPRECATED
@z

@x parallel
      description: Build images in parallel. DEPRECATED
@y
      description: Build images in parallel. DEPRECATED
@z

@x progress
      description: Set type of ui output (auto, tty, plain, json, quiet)
@y
      description: Set type of ui output (auto, tty, plain, json, quiet)
@z

@x pull
      description: Always attempt to pull a newer version of the image
@y
      description: Always attempt to pull a newer version of the image
@z

@x push
      description: Push service images
@y
      description: Push service images
@z

@x quiet
      description: Don't print anything to STDOUT
@y
      description: Don't print anything to STDOUT
@z

@x ssh
      description: |
        Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent)
@y
      description: |
        Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent)
@z

@x with-dependencies
      description: Also build dependencies (transitively)
@y
      description: Also build dependencies (transitively)
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
