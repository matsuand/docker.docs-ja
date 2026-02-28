%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service ls
aliases: docker service ls, docker service list
short: List services
long: |-
    This command lists services that are running in the swarm.
@y
command: docker service ls
aliases: docker service ls, docker service list
short: List services
long: |-
    This command lists services that are running in the swarm.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker service ls [OPTIONS]
@y
usage: docker service ls [OPTIONS]
@z

% options:

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x quiet
      description: Only display IDs
@y
      description: Only display IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    On a manager node:
@y
examples: |-
    On a manager node:
@z

% snip command...

@x
    The `REPLICAS` column shows both the actual and desired number of tasks for
    the service. If the service is in `replicated-job` or `global-job`, it will
    additionally show the completion status of the job as completed tasks over
    total tasks the job will execute.
@y
    The `REPLICAS` column shows both the actual and desired number of tasks for
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
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * [id](/reference/cli/docker/service/ls/#id)
    * [label](/reference/cli/docker/service/ls/#label)
    * [mode](/reference/cli/docker/service/ls/#mode)
    * [name](/reference/cli/docker/service/ls/#name)
@y
    * [id](__SUBDIR__/reference/cli/docker/service/ls/#id)
    * [label](__SUBDIR__/reference/cli/docker/service/ls/#label)
    * [mode](__SUBDIR__/reference/cli/docker/service/ls/#mode)
    * [name](__SUBDIR__/reference/cli/docker/service/ls/#name)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or the prefix of a service's ID.
@y
    The `id` filter matches all or the prefix of a service's ID.
@z

@x
    The following filter matches services with an ID starting with `0bcjw`:
@y
    The following filter matches services with an ID starting with `0bcjw`:
@z

% snip command...

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

% snip command...

@x
    The following filter matches only services with the `project` label with the
    `project-a` value.
@y
    The following filter matches only services with the `project` label with the
    `project-a` value.
@z

% snip command...

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

% snip command...

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or the prefix of a service's name.
@y
    The `name` filter matches on all or the prefix of a service's name.
@z

@x
    The following filter matches services with a name starting with `redis`.
@y
    The following filter matches services with a name starting with `redis`.
@z

% snip command...

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

% snip command...

@x
    To list all services in JSON format, use the `json` directive:
@y
    To list all services in JSON format, use the `json` directive:
@z

% snip directives...
