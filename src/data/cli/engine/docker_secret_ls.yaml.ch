%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker secret ls
aliases: docker secret ls, docker secret list
short: List secrets
long: |-
    Run this command on a manager node to list the secrets in the swarm.
@y
command: docker secret ls
aliases: docker secret ls, docker secret list
short: List secrets
long: |-
    Run this command on a manager node to list the secrets in the swarm.
@z

@x
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](__SUBDIR__/engine/swarm/secrets/).
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
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
@y
examples: |-
@z

% snip command...

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - [id](#id) (secret's ID)
    - [label](#label) (`label=<key>` or `label=<key>=<value>`)
    - [name](#name) (secret's name)
@y
    - [id](#id) (secret's ID)
    - [label](#label) (`label=<key>` or `label=<key>=<value>`)
    - [name](#name) (secret's name)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or prefix of a secret's id.
@y
    The `id` filter matches all or prefix of a secret's id.
@z

% snip command...

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches secrets based on the presence of a `label` alone or
    a `label` and a value.
@y
    The `label` filter matches secrets based on the presence of a `label` alone or
    a `label` and a value.
@z

@x
    The following filter matches all secrets with a `project` label regardless of
    its value:
@y
    The following filter matches all secrets with a `project` label regardless of
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
    The `name` filter matches on all or prefix of a secret's name.
@y
    The `name` filter matches on all or prefix of a secret's name.
@z

@x
    The following filter matches secret with a name containing a prefix of `test`.
@y
    The following filter matches secret with a name containing a prefix of `test`.
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty prints secrets output
    using a Go template.
@y
    The formatting option (`--format`) pretty prints secrets output
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
    | `.ID`        | Secret ID                                                                            |
    | `.Name`      | Secret name                                                                          |
    | `.CreatedAt` | Time when the secret was created                                                     |
    | `.UpdatedAt` | Time when the secret was updated                                                     |
    | `.Labels`    | All labels assigned to the secret                                                    |
    | `.Label`     | Value of a specific label for this secret. For example `{{.Label "secret.ssh.key"}}` |
@y
    | Placeholder  | Description                                                                          |
    |--------------|--------------------------------------------------------------------------------------|
    | `.ID`        | Secret ID                                                                            |
    | `.Name`      | Secret name                                                                          |
    | `.CreatedAt` | Time when the secret was created                                                     |
    | `.UpdatedAt` | Time when the secret was updated                                                     |
    | `.Labels`    | All labels assigned to the secret                                                    |
    | `.Label`     | Value of a specific label for this secret. For example `{{.Label "secret.ssh.key"}}` |
@z

@x
    When using the `--format` option, the `secret ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@y
    When using the `--format` option, the `secret ls` command will either
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
    To list all secrets with their name and created date in a table format you
    can use:
@y
    To list all secrets with their name and created date in a table format you
    can use:
@z

% snip command...

@x
    To list all secrets in JSON format, use the `json` directive:
@y
    To list all secrets in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
