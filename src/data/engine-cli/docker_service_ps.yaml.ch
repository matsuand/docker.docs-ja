%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service ps
short: List the tasks of one or more services
long: |-
    Lists the tasks that are running as part of the specified services.
@y
command: docker service ps
short: List the tasks of one or more services
long: |-
    Lists the tasks that are running as part of the specified services.
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
usage: docker service ps [OPTIONS] SERVICE [SERVICE...]
@y
usage: docker service ps [OPTIONS] SERVICE [SERVICE...]
@z

% options:

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: Pretty-print tasks using a Go template
@y
      description: Pretty-print tasks using a Go template
@z

@x no-resolve
      description: Do not map IDs to Names
@y
      description: Do not map IDs to Names
@z

@x no-trunc
      description: Do not truncate output
@y
      description: Do not truncate output
@z

@x quiet
      description: Only display task IDs
@y
      description: Only display task IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### List the tasks that are part of a service
@y
examples: |-
    ### List the tasks that are part of a service
@z

@x
    The following command shows all the tasks that are part of the `redis` service:
@y
    The following command shows all the tasks that are part of the `redis` service:
@z

% snip command...

@x
    In addition to running tasks, the output also shows the task history. For
    example, after updating the service to use the `redis:3.0.6` image, the output
    may look like this:
@y
    In addition to running tasks, the output also shows the task history. For
    example, after updating the service to use the `redis:3.0.6` image, the output
    may look like this:
@z

% snip command...

@x
    The number of items in the task history is determined by the
    `--task-history-limit` option that was set when initializing the swarm. You can
    change the task history retention limit using the
    [`docker swarm update`](/reference/cli/docker/swarm/update/) command.
@y
    The number of items in the task history is determined by the
    `--task-history-limit` option that was set when initializing the swarm. You can
    change the task history retention limit using the
    [`docker swarm update`](__SUBDIR__/reference/cli/docker/swarm/update/) command.
@z

@x
    When deploying a service, docker resolves the digest for the service's image,
    and pins the service to that digest. The digest is not shown by default, but is
    printed if `--no-trunc` is used. The `--no-trunc` option also shows the
    non-truncated task ID, and error messages, as can be seen in the following
    example:
@y
    When deploying a service, docker resolves the digest for the service's image,
    and pins the service to that digest. The digest is not shown by default, but is
    printed if `--no-trunc` is used. The `--no-trunc` option also shows the
    non-truncated task ID, and error messages, as can be seen in the following
    example:
@z

% snip command...

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter. For example,
    `-f name=redis.1 -f name=redis.7` returns both `redis.1` and `redis.7` tasks.
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter. For example,
    `-f name=redis.1 -f name=redis.7` returns both `redis.1` and `redis.7` tasks.
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * [id](#id)
    * [name](#name)
    * [node](#node)
    * [desired-state](#desired-state)
@y
    * [id](#id)
    * [name](#name)
    * [node](#node)
    * [desired-state](#desired-state)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches on all or a prefix of a task's ID.
@y
    The `id` filter matches on all or a prefix of a task's ID.
@z

% snip command...

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on task names.
@y
    The `name` filter matches on task names.
@z

% snip command...

@x
    #### node
@y
    #### node
@z

@x
    The `node` filter matches on a node name or a node ID.
@y
    The `node` filter matches on a node name or a node ID.
@z

% snip command...

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
    When using the `--format` option, the `service ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `service ps` command will either
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

% snip command...

% snip directives...
