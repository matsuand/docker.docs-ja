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
usage: docker stack ls [OPTIONS]
@y
usage: docker stack ls [OPTIONS]
@z

% options:

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
    The following command shows all stacks and some additional information:
@y
examples: |-
    The following command shows all stacks and some additional information:
@z

% snip command...

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

% snip command...

@x
    To list all stacks in JSON format, use the `json` directive:
@y
    To list all stacks in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
