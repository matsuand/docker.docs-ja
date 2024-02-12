%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker stack deploy
aliases: docker stack deploy, docker stack up
short: Deploy a new stack or update an existing stack
long: |-
    Create and update a stack from a `compose` file on the swarm.
@y
command: docker stack deploy
aliases: docker stack deploy, docker stack up
short: Deploy a new stack or update an existing stack
long: |-
    Create and update a stack from a `compose` file on the swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack deploy [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
options:
    - option: compose-file
      shorthand: c
      value_type: stringSlice
      default_value: '[]'
      description: Path to a Compose file, or `-` to read from stdin
      details_url: '#compose-file'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: prune
      value_type: bool
      default_value: "false"
      description: Prune services that are no longer referenced
      deprecated: false
      hidden: false
      min_api_version: "1.27"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: resolve-image
      value_type: string
      default_value: always
      description: |
        Query the registry to resolve image digest and supported platforms (`always`, `changed`, `never`)
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-registry-auth
      value_type: bool
      default_value: "false"
      description: Send registry authentication details to Swarm agents
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Compose file (--compose-file) {#compose-file}
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker stack deploy [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
options:
    - option: compose-file
      shorthand: c
      value_type: stringSlice
      default_value: '[]'
      description: Path to a Compose file, or `-` to read from stdin
      details_url: '#compose-file'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: prune
      value_type: bool
      default_value: "false"
      description: Prune services that are no longer referenced
      deprecated: false
      hidden: false
      min_api_version: "1.27"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: resolve-image
      value_type: string
      default_value: always
      description: |
        Query the registry to resolve image digest and supported platforms (`always`, `changed`, `never`)
      deprecated: false
      hidden: false
      min_api_version: "1.30"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-registry-auth
      value_type: bool
      default_value: "false"
      description: Send registry authentication details to Swarm agents
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Compose file (--compose-file) {#compose-file}
@z

@x
    The `deploy` command supports Compose file version `3.0` and above.
@y
    The `deploy` command supports Compose file version `3.0` and above.
@z

@x
    ```console
    $ docker stack deploy --compose-file docker-compose.yml vossibility
@y
    ```console
    $ docker stack deploy --compose-file docker-compose.yml vossibility
@z

@x
    Ignoring unsupported options: links
@y
    Ignoring unsupported options: links
@z

@x
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@y
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@z

@x
    The Compose file can also be provided as standard input with `--compose-file -`:
@y
    The Compose file can also be provided as standard input with `--compose-file -`:
@z

@x
    ```console
    $ cat docker-compose.yml | docker stack deploy --compose-file - vossibility
@y
    ```console
    $ cat docker-compose.yml | docker stack deploy --compose-file - vossibility
@z

@x
    Ignoring unsupported options: links
@y
    Ignoring unsupported options: links
@z

@x
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@y
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@z

@x
    If your configuration is split between multiple Compose files, e.g. a base
    configuration and environment-specific overrides, you can provide multiple
    `--compose-file` flags.
@y
    If your configuration is split between multiple Compose files, e.g. a base
    configuration and environment-specific overrides, you can provide multiple
    `--compose-file` flags.
@z

@x
    ```console
    $ docker stack deploy --compose-file docker-compose.yml -c docker-compose.prod.yml vossibility
@y
    ```console
    $ docker stack deploy --compose-file docker-compose.yml -c docker-compose.prod.yml vossibility
@z

@x
    Ignoring unsupported options: links
@y
    Ignoring unsupported options: links
@z

@x
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@y
    Creating network vossibility_vossibility
    Creating network vossibility_default
    Creating service vossibility_nsqd
    Creating service vossibility_logstash
    Creating service vossibility_elasticsearch
    Creating service vossibility_kibana
    Creating service vossibility_ghollector
    Creating service vossibility_lookupd
    ```
@z

@x
    You can verify that the services were correctly created:
@y
    You can verify that the services were correctly created:
@z

@x
    ```console
    $ docker service ls
@y
    ```console
    $ docker service ls
@z

@x
    ID            NAME                               MODE        REPLICAS  IMAGE
    29bv0vnlm903  vossibility_lookupd                replicated  1/1       nsqio/nsq@sha256:eeba05599f31eba418e96e71e0984c3dc96963ceb66924dd37a47bf7ce18a662
    4awt47624qwh  vossibility_nsqd                   replicated  1/1       nsqio/nsq@sha256:eeba05599f31eba418e96e71e0984c3dc96963ceb66924dd37a47bf7ce18a662
    4tjx9biia6fs  vossibility_elasticsearch          replicated  1/1       elasticsearch@sha256:12ac7c6af55d001f71800b83ba91a04f716e58d82e748fa6e5a7359eed2301aa
    7563uuzr9eys  vossibility_kibana                 replicated  1/1       kibana@sha256:6995a2d25709a62694a937b8a529ff36da92ebee74bafd7bf00e6caf6db2eb03
    9gc5m4met4he  vossibility_logstash               replicated  1/1       logstash@sha256:2dc8bddd1bb4a5a34e8ebaf73749f6413c101b2edef6617f2f7713926d2141fe
    axqh55ipl40h  vossibility_vossibility-collector  replicated  1/1       icecrime/vossibility-collector@sha256:f03f2977203ba6253988c18d04061c5ec7aab46bca9dfd89a9a1fa4500989fba
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ID            NAME                               MODE        REPLICAS  IMAGE
    29bv0vnlm903  vossibility_lookupd                replicated  1/1       nsqio/nsq@sha256:eeba05599f31eba418e96e71e0984c3dc96963ceb66924dd37a47bf7ce18a662
    4awt47624qwh  vossibility_nsqd                   replicated  1/1       nsqio/nsq@sha256:eeba05599f31eba418e96e71e0984c3dc96963ceb66924dd37a47bf7ce18a662
    4tjx9biia6fs  vossibility_elasticsearch          replicated  1/1       elasticsearch@sha256:12ac7c6af55d001f71800b83ba91a04f716e58d82e748fa6e5a7359eed2301aa
    7563uuzr9eys  vossibility_kibana                 replicated  1/1       kibana@sha256:6995a2d25709a62694a937b8a529ff36da92ebee74bafd7bf00e6caf6db2eb03
    9gc5m4met4he  vossibility_logstash               replicated  1/1       logstash@sha256:2dc8bddd1bb4a5a34e8ebaf73749f6413c101b2edef6617f2f7713926d2141fe
    axqh55ipl40h  vossibility_vossibility-collector  replicated  1/1       icecrime/vossibility-collector@sha256:f03f2977203ba6253988c18d04061c5ec7aab46bca9dfd89a9a1fa4500989fba
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
