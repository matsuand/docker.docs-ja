%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker config ls
aliases: docker config ls, docker config list
short: List configs
long: |-
    Run this command on a manager node to list the configs in the Swarm.
@y
command: docker config ls
aliases: docker config ls, docker config list
short: List configs
long: |-
    Run this command on a manager node to list the configs in the Swarm.
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    For detailed information about using configs, refer to [store configuration data using Docker Configs](__SUBDIR__/engine/swarm/configs/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
@z

@x
usage: docker config ls [OPTIONS]
@y
usage: docker config ls [OPTIONS]
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

% examples:

% snip command...

@x
    ### Filtering (-f, --filter) {#filter}
@y
    ### Filtering (-f, --filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - [id](#id) (config's ID)
    - [label](#label) (`label=<key>` or `label=<key>=<value>`)
    - [name](#name) (config's name)
@y
    - [id](#id) (config's ID)
    - [label](#label) (`label=<key>` or `label=<key>=<value>`)
    - [name](#name) (config's name)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or prefix of a config's id.
@y
    The `id` filter matches all or prefix of a config's id.
@z

% snip command...

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches configs based on the presence of a `label` alone or
    a `label` and a value.
@y
    The `label` filter matches configs based on the presence of a `label` alone or
    a `label` and a value.
@z

@x
    The following filter matches all configs with a `project` label regardless of
    its value:
@y
    The following filter matches all configs with a `project` label regardless of
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
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or prefix of a config's name.
@y
    The `name` filter matches on all or prefix of a config's name.
@z

@x
    The following filter matches config with a name containing a prefix of `test`.
@y
    The following filter matches config with a name containing a prefix of `test`.
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty prints configs output
    using a Go template.
@y
    The formatting option (`--format`) pretty prints configs output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder  | Description                                                                          |
    |--------------|--------------------------------------------------------------------------------------|
    | `.ID`        | Config ID                                                                            |
    | `.Name`      | Config name                                                                          |
    | `.CreatedAt` | Time when the config was created                                                     |
    | `.UpdatedAt` | Time when the config was updated                                                     |
    | `.Labels`    | All labels assigned to the config                                                    |
    | `.Label`     | Value of a specific label for this config. For example `{{.Label "my-label"}}`       |
@y
    | Placeholder  | Description                                                                          |
    |--------------|--------------------------------------------------------------------------------------|
    | `.ID`        | Config ID                                                                            |
    | `.Name`      | Config name                                                                          |
    | `.CreatedAt` | Time when the config was created                                                     |
    | `.UpdatedAt` | Time when the config was updated                                                     |
    | `.Labels`    | All labels assigned to the config                                                    |
    | `.Label`     | Value of a specific label for this config. For example `{{.Label "my-label"}}`       |
@z

@x
    When using the `--format` option, the `config ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@y
    When using the `--format` option, the `config ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `Name` entries separated by a colon (`:`) for all images:
@y
    The following example uses a template without headers and outputs the
    `ID` and `Name` entries separated by a colon (`:`) for all images:
@z

% snip command...

@x
    To list all configs with their name and created date in a table format you
    can use:
@y
    To list all configs with their name and created date in a table format you
    can use:
@z

% snip command...

% snip directives...
