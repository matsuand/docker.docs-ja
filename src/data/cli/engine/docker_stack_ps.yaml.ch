%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker stack ps
short: List the tasks in the stack
long: |-
    Lists the tasks that are running as part of the specified stack.
@y
command: docker stack ps
short: List the tasks in the stack
long: |-
    Lists the tasks that are running as part of the specified stack.
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
usage: docker stack ps [OPTIONS] STACK
@y
usage: docker stack ps [OPTIONS] STACK
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

@x orchestrator
      description: Orchestrator to use (swarm|all)
@y
      description: Orchestrator to use (swarm|all)
@z

@x
examples: |-
    ### List the tasks that are part of a stack
@y
examples: |-
    ### List the tasks that are part of a stack
@z

@x
    The following command shows all the tasks that are part of the `voting` stack:
@y
    The following command shows all the tasks that are part of the `voting` stack:
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
    The `desired-state` filter can take the values `running`, `shutdown`, `ready` or `accepted`.
@y
    The `desired-state` filter can take the values `running`, `shutdown`, `ready` or `accepted`.
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints tasks output using a Go template.
@y
    The formatting options (`--format`) pretty-prints tasks output using a Go template.
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
    When using the `--format` option, the `stack ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `stack ps` command will either
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

@x
    To list all tasks in JSON format, use the `json` directive:
@y
    To list all tasks in JSON format, use the `json` directive:
@z

% snip command...

@x
    ### Do not map IDs to Names (--no-resolve) {#no-resolve}
@y
    ### Do not map IDs to Names (--no-resolve) {#no-resolve}
@z

@x
    The `--no-resolve` option shows IDs for task name, without mapping IDs to Names.
@y
    The `--no-resolve` option shows IDs for task name, without mapping IDs to Names.
@z

% snip command...

@x
    ### Do not truncate output (--no-trunc) {#no-trunc}
@y
    ### Do not truncate output (--no-trunc) {#no-trunc}
@z

@x
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task IDs, and error-messages, as can be seen below:
@y
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task IDs, and error-messages, as can be seen below:
@z

% snip command...

@x
    ### Only display task IDs (-q, --quiet) {#quiet}
@y
    ### Only display task IDs (-q, --quiet) {#quiet}
@z

@x
    The `-q ` or `--quiet` option only shows IDs of the tasks in the stack.
    This example outputs all task IDs of the `voting` stack:
@y
    The `-q ` or `--quiet` option only shows IDs of the tasks in the stack.
    This example outputs all task IDs of the `voting` stack:
@z

% snip command...

@x
    This option can be used to perform batch operations. For example, you can use
    the task IDs as input for other commands, such as `docker inspect`. The
    following example inspects all tasks of the `voting` stack:
@y
    This option can be used to perform batch operations. For example, you can use
    the task IDs as input for other commands, such as `docker inspect`. The
    following example inspects all tasks of the `voting` stack:
@z

% snip command...
% snip directives...
