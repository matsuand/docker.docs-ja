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
usage: docker compose push [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: ignore-push-failures
      value_type: bool
      default_value: "false"
      description: Push what it can and ignores images with push failures
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: include-deps
      value_type: bool
      default_value: "false"
      description: Also push images of services declared as dependencies
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Push without printing progress information
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      service2:
        build: .
        image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
    ```
usage: docker compose push [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: ignore-push-failures
      value_type: bool
      default_value: "false"
      description: Push what it can and ignores images with push failures
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: include-deps
      value_type: bool
      default_value: "false"
      description: Also push images of services declared as dependencies
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Push without printing progress information
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
