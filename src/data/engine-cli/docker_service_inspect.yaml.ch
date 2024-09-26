%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service inspect
short: Display detailed information on one or more services
long: |-
    Inspects the specified service.
@y
command: docker service inspect
short: Display detailed information on one or more services
long: |-
    Inspects the specified service.
@z

@x
    By default, this renders all results in a JSON array. If a format is specified,
    the given template will be executed for each result.
@y
    By default, this renders all results in a JSON array. If a format is specified,
    the given template will be executed for each result.
@z

@x
    Go's [text/template](https://pkg.go.dev/text/template) package
    describes all the details of the format.
@y
    Go's [text/template](https://pkg.go.dev/text/template) package
    describes all the details of the format.
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
usage: docker service inspect [OPTIONS] SERVICE [SERVICE...]
@y
usage: docker service inspect [OPTIONS] SERVICE [SERVICE...]
@z

% options:

@x format
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x pretty
      description: Print the information in a human friendly format
@y
      description: Print the information in a human friendly format
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Inspect a service by name or ID
@y
examples: |-
    ### Inspect a service by name or ID
@z

@x
    You can inspect a service, either by its *name*, or *ID*
@y
    You can inspect a service, either by its *name*, or *ID*
@z

@x
    For example, given the following service;
@y
    For example, given the following service;
@z

% snip command...

@x
    Both `docker service inspect redis`, and `docker service inspect dmu1ept4cxcf`
    produce the same result:
@y
    Both `docker service inspect redis`, and `docker service inspect dmu1ept4cxcf`
    produce the same result:
@z

% snip command...

@x
    The output is in JSON format, for example:
@y
    The output is in JSON format, for example:
@z

% snip code...
% snip command...

@x
    ### Formatting (--pretty) {#pretty}
@y
    ### Formatting (--pretty) {#pretty}
@z

@x
    You can print the inspect output in a human-readable format instead of the default
    JSON output, by using the `--pretty` option:
@y
    You can print the inspect output in a human-readable format instead of the default
    JSON output, by using the `--pretty` option:
@z

% snip command...

@x
    You can also use `--format pretty` for the same effect.
@y
    You can also use `--format pretty` for the same effect.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    You can use the --format option to obtain specific information about a
    The `--format` option can be used to obtain specific information about a
    service. For example, the following command outputs the number of replicas
    of the "redis" service.
@y
    You can use the --format option to obtain specific information about a
    The `--format` option can be used to obtain specific information about a
    service. For example, the following command outputs the number of replicas
    of the "redis" service.
@z

% snip command...
% snip directives...
