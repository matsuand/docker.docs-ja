%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker config rm
aliases: docker config rm, docker config remove
short: Remove one or more configs
long: |-
    Removes the specified configs from the Swarm.
@y
command: docker config rm
aliases: docker config rm, docker config remove
short: Remove one or more configs
long: |-
    Removes the specified configs from the Swarm.
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker config rm CONFIG [CONFIG...]
pname: docker config
plink: docker_config.yaml
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    This example removes a config:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker config rm CONFIG [CONFIG...]
pname: docker config
plink: docker_config.yaml
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    This example removes a config:
@z

@x
    ```console
    $ docker config rm my_config
    sapth4csdo5b6wz2p5uimh5xg
    ```
@y
    ```console
    $ docker config rm my_config
    sapth4csdo5b6wz2p5uimh5xg
    ```
@z

@x
    > **Warning**
    >
    > This command doesn't ask for confirmation before removing a config.
    { .warning }
deprecated: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    > **Warning**
    >
    > This command doesn't ask for confirmation before removing a config.
    { .warning }
deprecated: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
