%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker service ls
aliases: docker service ls, docker service list
short: List services
long: |-
    This command lists services are running in the swarm.
@y
command: docker service ls
aliases: docker service ls, docker service list
short: List services
long: |-
    This command lists services are running in the swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service ls [OPTIONS]
pname: docker service
plink: docker_service.yaml
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
examples: |-
    On a manager node:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service ls [OPTIONS]
pname: docker service
plink: docker_service.yaml
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
examples: |-
    On a manager node:
@z

@x
    ```console
    $ docker service ls
@y
    ```console
    $ docker service ls
@z

@x
    ID            NAME      MODE            REPLICAS             IMAGE
    c8wgl7q4ndfd  frontend  replicated      5/5                  nginx:alpine
    dmu1ept4cxcf  redis     replicated      3/3                  redis:3.0.6
    iwe3278osahj  mongo     global          7/7                  mongo:3.3
    hh08h9uu8uwr  job       replicated-job  1/1 (3/5 completed)  nginx:latest
    ```
@y
    ID            NAME      MODE            REPLICAS             IMAGE
    c8wgl7q4ndfd  frontend  replicated      5/5                  nginx:alpine
    dmu1ept4cxcf  redis     replicated      3/3                  redis:3.0.6
    iwe3278osahj  mongo     global          7/7                  mongo:3.3
    hh08h9uu8uwr  job       replicated-job  1/1 (3/5 completed)  nginx:latest
    ```
@z

@x
    The `REPLICAS` column shows both the *actual* and *desired* number of tasks for
    the service. If the service is in `replicated-job` or `global-job`, it will
    additionally show the completion status of the job as completed tasks over
    total tasks the job will execute.
@y
    The `REPLICAS` column shows both the *actual* and *desired* number of tasks for
    the service. If the service is in `replicated-job` or `global-job`, it will
    additionally show the completion status of the job as completed tasks over
    total tasks the job will execute.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * [id](service_ls.md#id)
    * [label](service_ls.md#label)
    * [mode](service_ls.md#mode)
    * [name](service_ls.md#name)
@y
    * [id](service_ls.md#id)
    * [label](service_ls.md#label)
    * [mode](service_ls.md#mode)
    * [name](service_ls.md#name)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or part of a service's id.
@y
    The `id` filter matches all or part of a service's id.
@z

@x
    ```console
    $ docker service ls -f "id=0bcjw"
    ID            NAME   MODE        REPLICAS  IMAGE
    0bcjwfh8ychr  redis  replicated  1/1       redis:3.0.6
    ```
@y
    ```console
    $ docker service ls -f "id=0bcjw"
    ID            NAME   MODE        REPLICAS  IMAGE
    0bcjwfh8ychr  redis  replicated  1/1       redis:3.0.6
    ```
@z

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches services based on the presence of a `label` alone or
    a `label` and a value.
@y
    The `label` filter matches services based on the presence of a `label` alone or
    a `label` and a value.
@z

@x
    The following filter matches all services with a `project` label regardless of
    its value:
@y
    The following filter matches all services with a `project` label regardless of
    its value:
@z

@x
    ```console
    $ docker service ls --filter label=project
    ID            NAME       MODE        REPLICAS  IMAGE
    01sl1rp6nj5u  frontend2  replicated  1/1       nginx:alpine
    36xvvwwauej0  frontend   replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend    replicated  3/3       redis:3.0.6
    ```
@y
    ```console
    $ docker service ls --filter label=project
    ID            NAME       MODE        REPLICAS  IMAGE
    01sl1rp6nj5u  frontend2  replicated  1/1       nginx:alpine
    36xvvwwauej0  frontend   replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend    replicated  3/3       redis:3.0.6
    ```
@z

@x
    The following filter matches only services with the `project` label with the
    `project-a` value.
@y
    The following filter matches only services with the `project` label with the
    `project-a` value.
@z

@x
    ```console
    $ docker service ls --filter label=project=project-a
    ID            NAME      MODE        REPLICAS  IMAGE
    36xvvwwauej0  frontend  replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend   replicated  3/3       redis:3.0.6
    ```
@y
    ```console
    $ docker service ls --filter label=project=project-a
    ID            NAME      MODE        REPLICAS  IMAGE
    36xvvwwauej0  frontend  replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend   replicated  3/3       redis:3.0.6
    ```
@z

@x
    #### mode
@y
    #### mode
@z

@x
    The `mode` filter matches on the mode (either `replicated` or `global`) of a service.
@y
    The `mode` filter matches on the mode (either `replicated` or `global`) of a service.
@z

@x
    The following filter matches only `global` services.
@y
    The following filter matches only `global` services.
@z

@x
    ```console
    $ docker service ls --filter mode=global
    ID                  NAME                MODE                REPLICAS            IMAGE
    w7y0v2yrn620        top                 global              1/1                 busybox
    ```
@y
    ```console
    $ docker service ls --filter mode=global
    ID                  NAME                MODE                REPLICAS            IMAGE
    w7y0v2yrn620        top                 global              1/1                 busybox
    ```
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a service's name.
@y
    The `name` filter matches on all or part of a service's name.
@z

@x
    The following filter matches services with a name containing `redis`.
@y
    The following filter matches services with a name containing `redis`.
@z

@x
    ```console
    $ docker service ls --filter name=redis
    ID            NAME   MODE        REPLICAS  IMAGE
    0bcjwfh8ychr  redis  replicated  1/1       redis:3.0.6
    ```
@y
    ```console
    $ docker service ls --filter name=redis
    ID            NAME   MODE        REPLICAS  IMAGE
    0bcjwfh8ychr  redis  replicated  1/1       redis:3.0.6
    ```
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
    | Placeholder | Description                             |
    |-------------|-----------------------------------------|
    | `.ID`       | Service ID                              |
    | `.Name`     | Service name                            |
    | `.Mode`     | Service mode (replicated, global)       |
    | `.Replicas` | Service replicas                        |
    | `.Image`    | Service image                           |
    | `.Ports`    | Service ports published in ingress mode |
@y
    | Placeholder | Description                             |
    |-------------|-----------------------------------------|
    | `.ID`       | Service ID                              |
    | `.Name`     | Service name                            |
    | `.Mode`     | Service mode (replicated, global)       |
    | `.Replicas` | Service replicas                        |
    | `.Image`    | Service image                           |
    | `.Ports`    | Service ports published in ingress mode |
@z

@x
    When using the `--format` option, the `service ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `service ls` command will either
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
    $ docker service ls --format "{{.ID}}: {{.Mode}} {{.Replicas}}"
@y
    ```console
    $ docker service ls --format "{{.ID}}: {{.Mode}} {{.Replicas}}"
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
    $ docker service ls --format json
    {"ID":"ssniordqolsi","Image":"hello-world:latest","Mode":"replicated","Name":"hello","Ports":"","Replicas":"0/1"}
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ```console
    $ docker service ls --format json
    {"ID":"ssniordqolsi","Image":"hello-world:latest","Mode":"replicated","Name":"hello","Ports":"","Replicas":"0/1"}
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
