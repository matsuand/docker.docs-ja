%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker secret rm
aliases: docker secret rm, docker secret remove
short: Remove one or more secrets
long: |-
    Removes the specified secrets from the swarm.
@y
command: docker secret rm
aliases: docker secret rm, docker secret remove
short: Remove one or more secrets
long: |-
    Removes the specified secrets from the swarm.
@z

@x
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](__SUBDIR__/engine/swarm/secrets/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker secret rm SECRET [SECRET...]
pname: docker secret
plink: docker_secret.yaml
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
    This example removes a secret:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker secret rm SECRET [SECRET...]
pname: docker secret
plink: docker_secret.yaml
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
    This example removes a secret:
@z

@x
    ```console
    $ docker secret rm secret.json
    sapth4csdo5b6wz2p5uimh5xg
    ```
@y
    ```console
    $ docker secret rm secret.json
    sapth4csdo5b6wz2p5uimh5xg
    ```
@z

@x
    > **Warning**
    >
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a secret.
    { .warning }
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    > **Warning**
    >
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a secret.
    { .warning }
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
