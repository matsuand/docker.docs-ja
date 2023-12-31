%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context create
short: Create a context
long: |-
    Creates a new `context`. This allows you to quickly switch the cli
    configuration to connect to different clusters or single nodes.
usage: docker context create [OPTIONS] CONTEXT
pname: docker context
plink: docker_context.yaml
options:
    - option: default-stack-orchestrator
      value_type: string
      description: |
        Default orchestrator for stack operations to use with this context (`swarm`, `kubernetes`, `all`)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: description
      value_type: string
      description: Description of the context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: docker
      value_type: stringToString
      default_value: '[]'
      description: set the docker endpoint
      details_url: '#docker'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: from
      value_type: string
      description: create context from a named context
      details_url: '#from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kubernetes
      value_type: stringToString
      default_value: '[]'
      description: set the kubernetes endpoint
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: true
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
examples: |-
    ### Create a context with a docker endpoint (--docker) {#docker}
@y
command: docker context create
short: Create a context
long: |-
    Creates a new `context`. This allows you to quickly switch the cli
    configuration to connect to different clusters or single nodes.
usage: docker context create [OPTIONS] CONTEXT
pname: docker context
plink: docker_context.yaml
options:
    - option: default-stack-orchestrator
      value_type: string
      description: |
        Default orchestrator for stack operations to use with this context (`swarm`, `kubernetes`, `all`)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: description
      value_type: string
      description: Description of the context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: docker
      value_type: stringToString
      default_value: '[]'
      description: set the docker endpoint
      details_url: '#docker'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: from
      value_type: string
      description: create context from a named context
      details_url: '#from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kubernetes
      value_type: stringToString
      default_value: '[]'
      description: set the kubernetes endpoint
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: true
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
examples: |-
    ### Create a context with a docker endpoint (--docker) {#docker}
@z

@x
    To create a context from scratch provide the docker and, if required,
    kubernetes options. The example below creates the context `my-context`
    with a docker endpoint of `/var/run/docker.sock`:
@y
    To create a context from scratch provide the docker and, if required,
    kubernetes options. The example below creates the context `my-context`
    with a docker endpoint of `/var/run/docker.sock`:
@z

@x
    ```console
    $ docker context create \
        --docker host=unix:///var/run/docker.sock \
        my-context
    ```
@y
    ```console
    $ docker context create \
        --docker host=unix:///var/run/docker.sock \
        my-context
    ```
@z

@x
    ### Create a context based on an existing context (--from) {#from}
@y
    ### Create a context based on an existing context (--from) {#from}
@z

@x
    Use the `--from=<context-name>` option to create a new context from
    an existing context. The example below creates a new context named `my-context`
    from the existing context `existing-context`:
@y
    Use the `--from=<context-name>` option to create a new context from
    an existing context. The example below creates a new context named `my-context`
    from the existing context `existing-context`:
@z

@x
    ```console
    $ docker context create --from existing-context my-context
    ```
@y
    ```console
    $ docker context create --from existing-context my-context
    ```
@z

@x
    If the `--from` option is not set, the `context` is created from the current context:
@y
    If the `--from` option is not set, the `context` is created from the current context:
@z

@x
    ```console
    $ docker context create my-context
    ```
@y
    ```console
    $ docker context create my-context
    ```
@z

@x
    This can be used to create a context out of an existing `DOCKER_HOST` based script:
@y
    This can be used to create a context out of an existing `DOCKER_HOST` based script:
@z

@x
    ```console
    $ source my-setup-script.sh
    $ docker context create my-context
    ```
@y
    ```console
    $ source my-setup-script.sh
    $ docker context create my-context
    ```
@z

@x
    To source the `docker` endpoint configuration from an existing context
    use the `--docker from=<context-name>` option. The example below creates a
    new context named `my-context` using the docker endpoint configuration from
    the existing context `existing-context`:
@y
    To source the `docker` endpoint configuration from an existing context
    use the `--docker from=<context-name>` option. The example below creates a
    new context named `my-context` using the docker endpoint configuration from
    the existing context `existing-context`:
@z

@x
    ```console
    $ docker context create \
        --docker from=existing-context \
        my-context
    ```
@y
    ```console
    $ docker context create \
        --docker from=existing-context \
        my-context
    ```
@z

@x
    Docker endpoints configurations, as well as the description can be modified with
    `docker context update`.
@y
    Docker endpoints configurations, as well as the description can be modified with
    `docker context update`.
@z

@x
    Refer to the [`docker context update` reference](context_update.md) for details.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Refer to the [`docker context update` reference](context_update.md) for details.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
