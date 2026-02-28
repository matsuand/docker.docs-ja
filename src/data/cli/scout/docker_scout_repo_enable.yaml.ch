%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout repo enable
short: Enable Docker Scout
long: The docker scout repo enable command enables Docker Scout on repositories.
usage: docker scout repo enable [REPOSITORY]
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: |
        Enable all repositories of the organization. Can not be used with --filter.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: string
      description: Regular expression to filter repositories by name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: integration
      value_type: string
      description: Name of the integration to use for enabling an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: registry
      value_type: string
      description: Container Registry
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
    ### Enable a specific repository
@y
command: docker scout repo enable
short: Enable Docker Scout
long: The docker scout repo enable command enables Docker Scout on repositories.
usage: docker scout repo enable [REPOSITORY]
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: |
        Enable all repositories of the organization. Can not be used with --filter.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: string
      description: Regular expression to filter repositories by name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: integration
      value_type: string
      description: Name of the integration to use for enabling an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: registry
      value_type: string
      description: Container Registry
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
    ### Enable a specific repository
@z

@x
    ```console
    $ docker scout repo enable my/repository
    ```
@y
    ```console
    $ docker scout repo enable my/repository
    ```
@z

@x
    ### Enable all repositories of the organization
@y
    ### Enable all repositories of the organization
@z

@x
    ```console
    $ docker scout repo enable --all
    ```
@y
    ```console
    $ docker scout repo enable --all
    ```
@z

@x
    ### Enable some repositories based on a filter
@y
    ### Enable some repositories based on a filter
@z

@x
    ```console
    $ docker scout repo enable --filter namespace/backend
    ```
@y
    ```console
    $ docker scout repo enable --filter namespace/backend
    ```
@z

@x
    ### Enable a repository from a specific registry
@y
    ### Enable a repository from a specific registry
@z

@x
    ```console
    $ docker scout repo enable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout repo enable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
