%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout repo disable
short: Disable Docker Scout
long: |
    The docker scout repo disable command disables Docker Scout on repositories.
usage: docker scout repo disable [REPOSITORY]
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: |
        Disable all repositories of the organization. Can not be used with --filter.
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
    ### Disable a specific repository
@y
command: docker scout repo disable
short: Disable Docker Scout
long: |
    The docker scout repo disable command disables Docker Scout on repositories.
usage: docker scout repo disable [REPOSITORY]
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: |
        Disable all repositories of the organization. Can not be used with --filter.
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
    ### Disable a specific repository
@z

@x
    ```console
    $ docker scout repo disable my/repository
    ```
@y
    ```console
    $ docker scout repo disable my/repository
    ```
@z

@x
    ### Disable all repositories of the organization
@y
    ### Disable all repositories of the organization
@z

@x
    ```console
    $ docker scout repo disable --all
    ```
@y
    ```console
    $ docker scout repo disable --all
    ```
@z

@x
    ### Disable some repositories based on a filter
@y
    ### Disable some repositories based on a filter
@z

@x
    ```console
    $ docker scout repo disable --filter namespace/backend
    ```
@y
    ```console
    $ docker scout repo disable --filter namespace/backend
    ```
@z

@x
    ### Disable a repository from a specific registry
@y
    ### Disable a repository from a specific registry
@z

@x
    ```console
    $ docker scout repo disable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout repo disable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
