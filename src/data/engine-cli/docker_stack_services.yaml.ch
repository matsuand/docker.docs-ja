%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
usage: docker stack services [OPTIONS] STACK
@y
usage: docker stack services [OPTIONS] STACK
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

@x orchestrator
      description: Orchestrator to use (swarm|all)
@y
      description: Orchestrator to use (swarm|all)
@z

@x
examples: |-
    The following command shows all services in the `myapp` stack:
@y
examples: |-
    The following command shows all services in the `myapp` stack:
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

% snip command...

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

% snip command...

@x
    To list all services in JSON format, use the `json` directive:
@y
    To list all services in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
