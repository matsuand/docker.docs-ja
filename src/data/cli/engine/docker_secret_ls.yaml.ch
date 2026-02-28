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
usage: docker secret ls [OPTIONS]
pname: docker secret
plink: docker_secret.yaml
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
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
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
      description: Only display IDs
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
    $ docker secret ls
@y
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker secret ls [OPTIONS]
pname: docker secret
plink: docker_secret.yaml
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
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
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
      description: Only display IDs
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
    $ docker secret ls
@z

@x
    ID                          NAME                        CREATED             UPDATED
    6697bflskwj1998km1gnnjr38   q5s5570vtvnimefos1fyeo2u2   6 weeks ago         6 weeks ago
    9u9hk4br2ej0wgngkga6rp4hq   my_secret                   5 weeks ago         5 weeks ago
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 3 seconds ago       3 seconds ago
    ```
@y
    ID                          NAME                        CREATED             UPDATED
    6697bflskwj1998km1gnnjr38   q5s5570vtvnimefos1fyeo2u2   6 weeks ago         6 weeks ago
    9u9hk4br2ej0wgngkga6rp4hq   my_secret                   5 weeks ago         5 weeks ago
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 3 seconds ago       3 seconds ago
    ```
@z

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

@x
    ```console
    $ docker secret ls -f "id=6697bflskwj1998km1gnnjr38"
@y
    ```console
    $ docker secret ls -f "id=6697bflskwj1998km1gnnjr38"
@z

@x
    ID                          NAME                        CREATED             UPDATED
    6697bflskwj1998km1gnnjr38   q5s5570vtvnimefos1fyeo2u2   6 weeks ago         6 weeks ago
    ```
@y
    ID                          NAME                        CREATED             UPDATED
    6697bflskwj1998km1gnnjr38   q5s5570vtvnimefos1fyeo2u2   6 weeks ago         6 weeks ago
    ```
@z

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

@x
    ```console
    $ docker secret ls --filter label=project
@y
    ```console
    $ docker secret ls --filter label=project
@z

@x
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@y
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@z

@x
    The following filter matches only services with the `project` label with the
    `project-a` value.
@y
    The following filter matches only services with the `project` label with the
    `project-a` value.
@z

@x
    ```console
    $ docker service ls --filter label=project=test
@y
    ```console
    $ docker service ls --filter label=project=test
@z

@x
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@y
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@z

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

@x
    ```console
    $ docker secret ls --filter name=test_secret
@y
    ```console
    $ docker secret ls --filter name=test_secret
@z

@x
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@y
    ID                          NAME                        CREATED             UPDATED
    mem02h8n73mybpgqjf0kfi1n0   test_secret                 About an hour ago   About an hour ago
    ```
@z

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

@x
    ```console
    $ docker secret ls --format "{{.ID}}: {{.Name}}"
@y
    ```console
    $ docker secret ls --format "{{.ID}}: {{.Name}}"
@z

@x
    77af4d6b9913: secret-1
    b6fa739cedf5: secret-2
    78a85c484f71: secret-3
    ```
@y
    77af4d6b9913: secret-1
    b6fa739cedf5: secret-2
    78a85c484f71: secret-3
    ```
@z

@x
    To list all secrets with their name and created date in a table format you
    can use:
@y
    To list all secrets with their name and created date in a table format you
    can use:
@z

@x
    ```console
    $ docker secret ls --format "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}"
@y
    ```console
    $ docker secret ls --format "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}"
@z

@x
    ID                  NAME                      CREATED
    77af4d6b9913        secret-1                  5 minutes ago
    b6fa739cedf5        secret-2                  3 hours ago
    78a85c484f71        secret-3                  10 days ago
    ```
@y
    ID                  NAME                      CREATED
    77af4d6b9913        secret-1                  5 minutes ago
    b6fa739cedf5        secret-2                  3 hours ago
    78a85c484f71        secret-3                  10 days ago
    ```
@z

@x
    To list all secrets in JSON format, use the `json` directive:
    ```console
    $ docker secret ls --format json
    {"CreatedAt":"28 seconds ago","Driver":"","ID":"4y7hvwrt1u8e9uxh5ygqj7mzc","Labels":"","Name":"mysecret","UpdatedAt":"28 seconds ago"}
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    To list all secrets in JSON format, use the `json` directive:
    ```console
    $ docker secret ls --format json
    {"CreatedAt":"28 seconds ago","Driver":"","ID":"4y7hvwrt1u8e9uxh5ygqj7mzc","Labels":"","Name":"mysecret","UpdatedAt":"28 seconds ago"}
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
