%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout environment
aliases: docker scout environment, docker scout env
short: Manage environments (experimental)
long: |-
    The `docker scout environment` command lists the environments.
    If you pass an image reference, the image is recorded to the specified environment.
@y
command: docker scout environment
aliases: docker scout environment, docker scout env
short: Manage environments (experimental)
long: |-
    The `docker scout environment` command lists the environments.
    If you pass an image reference, the image is recorded to the specified environment.
@z

@x
    Once recorded, environments can be referred to by their name. For example,
    you can refer to the `production` environment with the `docker scout compare`
    command as follows:
@y
    Once recorded, environments can be referred to by their name. For example,
    you can refer to the `production` environment with the `docker scout compare`
    command as follows:
@z

@x
    ```console
    $ docker scout compare --to-env production
    ```
usage: docker scout environment [ENVIRONMENT] [IMAGE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to record
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List existing environments
@y
    ```console
    $ docker scout compare --to-env production
    ```
usage: docker scout environment [ENVIRONMENT] [IMAGE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to record
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List existing environments
@z

@x
    ```console
    $ docker scout environment
    prod
    staging
    ```
@y
    ```console
    $ docker scout environment
    prod
    staging
    ```
@z

@x
    ### List images of an environment
@y
    ### List images of an environment
@z

@x
    ```console
    $ docker scout environment staging
    namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
    namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
    ```
@y
    ```console
    $ docker scout environment staging
    namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
    namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
    ```
@z

@x
    ### Record an image to an environment, for a specific platform
@y
    ### Record an image to an environment, for a specific platform
@z

@x
    ```console
    $ docker scout environment staging namespace/repo:stage-latest --platform linux/amd64
    ✓ Pulled
    ✓ Successfully recorded namespace/repo:stage-latest in environment staging
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout environment staging namespace/repo:stage-latest --platform linux/amd64
    ✓ Pulled
    ✓ Successfully recorded namespace/repo:stage-latest in environment staging
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
