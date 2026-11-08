%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose push
short: Push service images
long: |-
    Pushes images for services to their respective registry/repository.
@y
command: docker compose push
short: Push service images
long: |-
    Pushes images for services to their respective registry/repository.
@z

@x
    The following assumptions are made:
    - You are pushing an image you have built locally
    - You have access to the build key
@y
    The following assumptions are made:
    - You are pushing an image you have built locally
    - You have access to the build key
@z

@x
    Examples
@y
    Examples
@z

@x
    ```yaml
    services:
      service1:
        build: .
        image: localhost:5000/yourimage  ## goes to local registry
@y
    ```yaml
    services:
      service1:
        build: .
        image: localhost:5000/yourimage  ## goes to local registry
@z

@x
      service2:
        build: .
        image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
    ```
@y
      service2:
        build: .
        image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
    ```
@z

@x
usage: docker compose push [OPTIONS] [SERVICE...]
@y
usage: docker compose push [OPTIONS] [SERVICE...]
@z

% options:

@x ignore-missing
      description: |
        Skip images that are not available locally instead of failing to push them
@y
      description: |
        Skip images that are not available locally instead of failing to push them
@z

@x ignore-push-failures
      description: Push what it can and ignores images with push failures
@y
      description: Push what it can and ignores images with push failures
@z

@x include-deps
      description: Also push images of services declared as dependencies
@y
      description: Also push images of services declared as dependencies
@z

@x quiet
      description: Push without printing progress information
@y
      description: Push without printing progress information
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z
