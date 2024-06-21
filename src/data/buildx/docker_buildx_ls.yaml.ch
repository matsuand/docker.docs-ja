%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx ls
short: List builder instances
long: |-
    Lists all builder instances and the nodes for each instance.
@y
command: docker buildx ls
short: ビルダーインスタンスの一覧表示
long: |-
    Lists all builder instances and the nodes for each instance.
@z

% snip command...

@x
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
@y
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
@z

@x
usage: docker buildx ls
@y
usage: docker buildx ls
@z

% options:

% builder???

@x format
      description: Format the output
@y
      description: Format the output
@z

@x
examples: |-
    ### Format the output (--format) {#format}
@y
examples: |-
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints builder instances output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints builder instances output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder       | Description                                 |
    |-------------------|---------------------------------------------|
    | `.Name`           | Builder or node name                        |
    | `.DriverEndpoint` | Driver (for builder) or Endpoint (for node) |
    | `.LastActivity`   | Builder last activity                       |
    | `.Status`         | Builder or node status                      |
    | `.Buildkit`       | BuildKit version of the node                |
    | `.Platforms`      | Available node's platforms                  |
    | `.Error`          | Error                                       |
    | `.Builder`        | Builder object                              |
@y
    | Placeholder       | Description                                 |
    |-------------------|---------------------------------------------|
    | `.Name`           | Builder or node name                        |
    | `.DriverEndpoint` | Driver (for builder) or Endpoint (for node) |
    | `.LastActivity`   | Builder last activity                       |
    | `.Status`         | Builder or node status                      |
    | `.Buildkit`       | BuildKit version of the node                |
    | `.Platforms`      | Available node's platforms                  |
    | `.Error`          | Error                                       |
    | `.Builder`        | Builder object                              |
@z

@x
    When using the `--format` option, the `ls` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@y
    When using the `--format` option, the `ls` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `DriverEndpoint` entries separated by a colon (`:`):
@y
    The following example uses a template without headers and outputs the
    `Name` and `DriverEndpoint` entries separated by a colon (`:`):
@z

% snip command...

@x
    The `Builder` placeholder can be used to access the builder object and its
    fields. For example, the following template outputs the builder's and
    nodes' names with their respective endpoints:
@y
    The `Builder` placeholder can be used to access the builder object and its
    fields. For example, the following template outputs the builder's and
    nodes' names with their respective endpoints:
@z

% snip command...
% snip directives...
