%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker node ps
short: List tasks running on one or more nodes, defaults to current node
long: |-
    Lists all the tasks on a Node that Docker knows about. You can filter using the
    `-f` or `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
@y
command: docker node ps
short: List tasks running on one or more nodes, defaults to current node
long: |-
    Lists all the tasks on a Node that Docker knows about. You can filter using the
    `-f` or `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node ps [OPTIONS] [NODE...]
pname: docker node
plink: docker_node.yaml
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
      description: Pretty-print tasks using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate output
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
      description: Only display task IDs
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
    ```console
    $ docker node ps swarm-manager1
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node ps [OPTIONS] [NODE...]
pname: docker node
plink: docker_node.yaml
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
      description: Pretty-print tasks using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate output
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
      description: Only display task IDs
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
    ```console
    $ docker node ps swarm-manager1
@z

@x
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq   redis:3.0.6  swarm-manager1  Running        Running 5 hours
    redis.6.b465edgho06e318egmgjbqo4o   redis:3.0.6  swarm-manager1  Running        Running 29 seconds
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.9.dkkual96p4bb3s6b10r7coxxt   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.10.0tgctg8h8cech4w0k0gwrmr23  redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@y
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq   redis:3.0.6  swarm-manager1  Running        Running 5 hours
    redis.6.b465edgho06e318egmgjbqo4o   redis:3.0.6  swarm-manager1  Running        Running 29 seconds
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.9.dkkual96p4bb3s6b10r7coxxt   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.10.0tgctg8h8cech4w0k0gwrmr23  redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is
    more than one filter, then pass multiple flags (e.g., `--filter "foo=bar"
    --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is
    more than one filter, then pass multiple flags (e.g., `--filter "foo=bar"
    --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * [name](#name)
    * [id](#id)
    * [label](#label)
    * [desired-state](#desired-state)
@y
    * [name](#name)
    * [id](#id)
    * [label](#label)
    * [desired-state](#desired-state)
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a task's name.
@y
    The `name` filter matches on all or part of a task's name.
@z

@x
    The following filter matches all tasks with a name containing the `redis` string.
@y
    The following filter matches all tasks with a name containing the `redis` string.
@z

@x
    ```console
    $ docker node ps -f name=redis swarm-manager1
@y
    ```console
    $ docker node ps -f name=redis swarm-manager1
@z

@x
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq   redis:3.0.6  swarm-manager1  Running        Running 5 hours
    redis.6.b465edgho06e318egmgjbqo4o   redis:3.0.6  swarm-manager1  Running        Running 29 seconds
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.9.dkkual96p4bb3s6b10r7coxxt   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.10.0tgctg8h8cech4w0k0gwrmr23  redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@y
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq   redis:3.0.6  swarm-manager1  Running        Running 5 hours
    redis.6.b465edgho06e318egmgjbqo4o   redis:3.0.6  swarm-manager1  Running        Running 29 seconds
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.9.dkkual96p4bb3s6b10r7coxxt   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    redis.10.0tgctg8h8cech4w0k0gwrmr23  redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches a task's id.
@y
    The `id` filter matches a task's id.
@z

@x
    ```console
    $ docker node ps -f id=bg8c07zzg87di2mufeq51a2qp swarm-manager1
@y
    ```console
    $ docker node ps -f id=bg8c07zzg87di2mufeq51a2qp swarm-manager1
@z

@x
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@y
    NAME                                IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.7.bg8c07zzg87di2mufeq51a2qp   redis:3.0.6  swarm-manager1  Running        Running 5 seconds
    ```
@z

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches tasks based on the presence of a `label` alone or a `label` and a
    value.
@y
    The `label` filter matches tasks based on the presence of a `label` alone or a `label` and a
    value.
@z

@x
    The following filter matches tasks with the `usage` label regardless of its value.
@y
    The following filter matches tasks with the `usage` label regardless of its value.
@z

@x
    ```console
    $ docker node ps -f "label=usage"
@y
    ```console
    $ docker node ps -f "label=usage"
@z

@x
    NAME                               IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.6.b465edgho06e318egmgjbqo4o  redis:3.0.6  swarm-manager1  Running        Running 10 minutes
    redis.7.bg8c07zzg87di2mufeq51a2qp  redis:3.0.6  swarm-manager1  Running        Running 9 minutes
    ```
@y
    NAME                               IMAGE        NODE            DESIRED STATE  CURRENT STATE
    redis.6.b465edgho06e318egmgjbqo4o  redis:3.0.6  swarm-manager1  Running        Running 10 minutes
    redis.7.bg8c07zzg87di2mufeq51a2qp  redis:3.0.6  swarm-manager1  Running        Running 9 minutes
    ```
@z

@x
    #### desired-state
@y
    #### desired-state
@z

@x
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@y
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints tasks output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints tasks output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description                                                      |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | Task ID                                                          |
    | `.Name`         | Task name                                                        |
    | `.Image`        | Task image                                                       |
    | `.Node`         | Node ID                                                          |
    | `.DesiredState` | Desired state of the task (`running`, `shutdown`, or `accepted`) |
    | `.CurrentState` | Current state of the task                                        |
    | `.Error`        | Error                                                            |
    | `.Ports`        | Task published ports                                             |
@y
    | Placeholder     | Description                                                      |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | Task ID                                                          |
    | `.Name`         | Task name                                                        |
    | `.Image`        | Task image                                                       |
    | `.Node`         | Node ID                                                          |
    | `.DesiredState` | Desired state of the task (`running`, `shutdown`, or `accepted`) |
    | `.CurrentState` | Current state of the task                                        |
    | `.Error`        | Error                                                            |
    | `.Ports`        | Task published ports                                             |
@z

@x
    When using the `--format` option, the `node ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `node ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `Image` entries separated by a colon (`:`) for all tasks:
@y
    The following example uses a template without headers and outputs the
    `Name` and `Image` entries separated by a colon (`:`) for all tasks:
@z

@x
    ```console
    $ docker node ps --format "{{.Name}}: {{.Image}}"
@y
    ```console
    $ docker node ps --format "{{.Name}}: {{.Image}}"
@z

@x
    top.1: busybox
    top.2: busybox
    top.3: busybox
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    top.1: busybox
    top.2: busybox
    top.3: busybox
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
