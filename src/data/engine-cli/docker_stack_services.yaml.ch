%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker stack services
short: List the services in the stack
long: |-
    Lists the services that are running as part of the specified stack.
@y
command: docker stack services
short: List the services in the stack
long: |-
    Lists the services that are running as part of the specified stack.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack services [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display IDs
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
    The following command shows all services in the `myapp` stack:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack services [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display IDs
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
    The following command shows all services in the `myapp` stack:
@z

@x
    ```console
    $ docker stack services myapp
@y
    ```console
    $ docker stack services myapp
@z

@x
    ID            NAME            REPLICAS  IMAGE                                                                          COMMAND
    7be5ei6sqeye  myapp_web       1/1       nginx@sha256:23f809e7fd5952e7d5be065b4d3643fbbceccd349d537b62a123ef2201bc886f
    dn7m7nhhfb9y  myapp_db        1/1       mysql@sha256:a9a5b559f8821fe73d58c3606c812d1c044868d42c63817fa5125fd9d8b7b539
    ```
@y
    ID            NAME            REPLICAS  IMAGE                                                                          COMMAND
    7be5ei6sqeye  myapp_web       1/1       nginx@sha256:23f809e7fd5952e7d5be065b4d3643fbbceccd349d537b62a123ef2201bc886f
    dn7m7nhhfb9y  myapp_db        1/1       mysql@sha256:a9a5b559f8821fe73d58c3606c812d1c044868d42c63817fa5125fd9d8b7b539
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter.
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter.
@z

@x
    The following command shows both the `web` and `db` services:
@y
    The following command shows both the `web` and `db` services:
@z

@x
    ```console
    $ docker stack services --filter name=myapp_web --filter name=myapp_db myapp
@y
    ```console
    $ docker stack services --filter name=myapp_web --filter name=myapp_db myapp
@z

@x
    ID            NAME            REPLICAS  IMAGE                                                                          COMMAND
    7be5ei6sqeye  myapp_web       1/1       nginx@sha256:23f809e7fd5952e7d5be065b4d3643fbbceccd349d537b62a123ef2201bc886f
    dn7m7nhhfb9y  myapp_db        1/1       mysql@sha256:a9a5b559f8821fe73d58c3606c812d1c044868d42c63817fa5125fd9d8b7b539
    ```
@y
    ID            NAME            REPLICAS  IMAGE                                                                          COMMAND
    7be5ei6sqeye  myapp_web       1/1       nginx@sha256:23f809e7fd5952e7d5be065b4d3643fbbceccd349d537b62a123ef2201bc886f
    dn7m7nhhfb9y  myapp_db        1/1       mysql@sha256:a9a5b559f8821fe73d58c3606c812d1c044868d42c63817fa5125fd9d8b7b539
    ```
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * id / ID (`--filter id=7be5ei6sqeye`, or `--filter ID=7be5ei6sqeye`)
    * label (`--filter label=key=value`)
    * mode (`--filter mode=replicated`, or `--filter mode=global`)
      * Swarm: not supported
    * name (`--filter name=myapp_web`)
    * node (`--filter node=mynode`)
      * Swarm: not supported
    * service (`--filter service=web`)
      * Swarm: not supported
@y
    * id / ID (`--filter id=7be5ei6sqeye`, or `--filter ID=7be5ei6sqeye`)
    * label (`--filter label=key=value`)
    * mode (`--filter mode=replicated`, or `--filter mode=global`)
      * Swarm: not supported
    * name (`--filter name=myapp_web`)
    * node (`--filter node=mynode`)
      * Swarm: not supported
    * service (`--filter service=web`)
      * Swarm: not supported
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints services output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints services output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder | Description                       |
    |-------------|-----------------------------------|
    | `.ID`       | Service ID                        |
    | `.Name`     | Service name                      |
    | `.Mode`     | Service mode (replicated, global) |
    | `.Replicas` | Service replicas                  |
    | `.Image`    | Service image                     |
@y
    | Placeholder | Description                       |
    |-------------|-----------------------------------|
    | `.ID`       | Service ID                        |
    | `.Name`     | Service name                      |
    | `.Mode`     | Service mode (replicated, global) |
    | `.Replicas` | Service replicas                  |
    | `.Image`    | Service image                     |
@z

@x
    When using the `--format` option, the `stack services` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `stack services` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID`, `Mode`, and `Replicas` entries separated by a colon (`:`) for all services:
@y
    The following example uses a template without headers and outputs the
    `ID`, `Mode`, and `Replicas` entries separated by a colon (`:`) for all services:
@z

@x
    ```console
    $ docker stack services --format "{{.ID}}: {{.Mode}} {{.Replicas}}"
@y
    ```console
    $ docker stack services --format "{{.ID}}: {{.Mode}} {{.Replicas}}"
@z

@x
    0zmvwuiu3vue: replicated 10/10
    fm6uf97exkul: global 5/5
    ```
@y
    0zmvwuiu3vue: replicated 10/10
    fm6uf97exkul: global 5/5
    ```
@z

@x
    To list all services in JSON format, use the `json` directive:
@y
    To list all services in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker stack services ls --format json
    {"ID":"0axqbl293vwm","Image":"localstack/localstack:latest","Mode":"replicated","Name":"myapp_localstack","Ports":"*:4566-\u003e4566/tcp, *:8080-\u003e8080/tcp","Replicas":"0/1"}
    {"ID":"384xvtzigz3p","Image":"redis:6.0.9-alpine3.12","Mode":"replicated","Name":"myapp_redis","Ports":"*:6379-\u003e6379/tcp","Replicas":"1/1"}
    {"ID":"hyujct8cnjkk","Image":"postgres:13.2-alpine","Mode":"replicated","Name":"myapp_repos-db","Ports":"*:5432-\u003e5432/tcp","Replicas":"0/1"}
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ```console
    $ docker stack services ls --format json
    {"ID":"0axqbl293vwm","Image":"localstack/localstack:latest","Mode":"replicated","Name":"myapp_localstack","Ports":"*:4566-\u003e4566/tcp, *:8080-\u003e8080/tcp","Replicas":"0/1"}
    {"ID":"384xvtzigz3p","Image":"redis:6.0.9-alpine3.12","Mode":"replicated","Name":"myapp_redis","Ports":"*:6379-\u003e6379/tcp","Replicas":"1/1"}
    {"ID":"hyujct8cnjkk","Image":"postgres:13.2-alpine","Mode":"replicated","Name":"myapp_repos-db","Ports":"*:5432-\u003e5432/tcp","Replicas":"0/1"}
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
