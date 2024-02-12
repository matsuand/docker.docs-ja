%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker stack ls
aliases: docker stack ls, docker stack list
short: List stacks
long: |-
    Lists the stacks.
@y
command: docker stack ls
aliases: docker stack ls, docker stack list
short: List stacks
long: |-
    Lists the stacks.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack ls [OPTIONS]
pname: docker stack
plink: docker_stack.yaml
options:
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
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
    The following command shows all stacks and some additional information:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker stack ls [OPTIONS]
pname: docker stack
plink: docker_stack.yaml
options:
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
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
    The following command shows all stacks and some additional information:
@z

@x
    ```console
    $ docker stack ls
@y
    ```console
    $ docker stack ls
@z

@x
    ID                 SERVICES            ORCHESTRATOR
    myapp              2                   Kubernetes
    vossibility-stack  6                   Swarm
    ```
@y
    ID                 SERVICES            ORCHESTRATOR
    myapp              2                   Kubernetes
    vossibility-stack  6                   Swarm
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty-prints stacks using a Go template.
@y
    The formatting option (`--format`) pretty-prints stacks using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description        |
    |-----------------|--------------------|
    | `.Name`         | Stack name         |
    | `.Services`     | Number of services |
    | `.Orchestrator` | Orchestrator name  |
    | `.Namespace`    | Namespace          |
@y
    | Placeholder     | Description        |
    |-----------------|--------------------|
    | `.Name`         | Stack name         |
    | `.Services`     | Number of services |
    | `.Orchestrator` | Orchestrator name  |
    | `.Namespace`    | Namespace          |
@z

@x
    When using the `--format` option, the `stack ls` command either outputs
    the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `stack ls` command either outputs
    the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `Services` entries separated by a colon (`:`) for all stacks:
@y
    The following example uses a template without headers and outputs the
    `Name` and `Services` entries separated by a colon (`:`) for all stacks:
@z

@x
    ```console
    $ docker stack ls --format "{{.Name}}: {{.Services}}"
    web-server: 1
    web-cache: 4
    ```
@y
    ```console
    $ docker stack ls --format "{{.Name}}: {{.Services}}"
    web-server: 1
    web-cache: 4
    ```
@z

@x
    To list all stacks in JSON format, use the `json` directive:
@y
    To list all stacks in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker stack ls --format json
    {"Name":"myapp","Namespace":"","Orchestrator":"Swarm","Services":"3"}
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ```console
    $ docker stack ls --format json
    {"Name":"myapp","Namespace":"","Orchestrator":"Swarm","Services":"3"}
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
