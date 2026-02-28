%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network ls
aliases: docker network ls, docker network list
short: List networks
long: |-
    Lists all the networks the Engine `daemon` knows about. This includes the
    networks that span across multiple hosts in a cluster.
usage: docker network ls [OPTIONS]
@y
command: docker network ls
aliases: docker network ls, docker network list
short: ネットワークを一覧表示します。
long: |-
    Engine の `daemon` が管理するネットワークの一覧を表示します。
    クラスター内の複数ホストにわたって展開されているネットワークを含みます。
usage: docker network ls [OPTIONS]
@z

% options:

@x filter
      description: Provide filter values (e.g. `driver=bridge`)
@y
      description: フィルター値を指定します。（たとえば `driver=bridge`）
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
        カスタムテンプレートを使って出力をフォーマットします。
        'table':            カラムヘッダー付きの表形式により出力します。(デフォルト)
        'table TEMPLATE':   指定された Go テンプレートを使って表形式により出力します。
        'json':             JSON 書式により出力します。
        'TEMPLATE':         指定された Go テンプレートを使って出力します。
        テンプレートを使ったフォーマット出力の詳細は __HOSTURL____SUBDIR__/engine/cli/formatting/ を参照してください。
@z

@x no-trunc
      description: Do not truncate the output
@y
      description: 詳細出力を行います。
@z

@x quiet
      description: Only display network IDs
@y
      description: ネットワーク ID のみを表示します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### List all networks
@y
examples: |-
    ### List all networks
@z

% snip command...

@x
    Use the `--no-trunc` option to display the full network id:
@y
    Use the `--no-trunc` option to display the full network id:
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
    `-f type=custom -f type=builtin` returns both `custom` and `builtin` networks.
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter. For example,
    `-f type=custom -f type=builtin` returns both `custom` and `builtin` networks.
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * driver
    * id (network's id)
    * label (`label=<key>` or `label=<key>=<value>`)
    * name (network's name)
    * scope (`swarm|global|local`)
    * type (`custom|builtin`)
@y
    * driver
    * id (network's id)
    * label (`label=<key>` or `label=<key>=<value>`)
    * name (network's name)
    * scope (`swarm|global|local`)
    * type (`custom|builtin`)
@z

@x
    #### Driver
@y
    #### Driver
@z

@x
    The `driver` filter matches networks based on their driver.
@y
    The `driver` filter matches networks based on their driver.
@z

@x
    The following example matches networks with the `bridge` driver:
@y
    The following example matches networks with the `bridge` driver:
@z

% snip command...

@x
    #### ID
@y
    #### ID
@z

@x
    The `id` filter matches on all or part of a network's ID.
@y
    The `id` filter matches on all or part of a network's ID.
@z

@x
    The following filter matches all networks with an ID containing the
    `63d1ff1f77b0...` string.
@y
    The following filter matches all networks with an ID containing the
    `63d1ff1f77b0...` string.
@z

% snip command...

@x
    You can also filter for a substring in an ID as this shows:
@y
    You can also filter for a substring in an ID as this shows:
@z

% snip command...

@x
    #### Label
@y
    #### Label
@z

@x
    The `label` filter matches networks based on the presence of a `label` alone or a `label` and a
    value.
@y
    The `label` filter matches networks based on the presence of a `label` alone or a `label` and a
    value.
@z

@x
    The following filter matches networks with the `usage` label regardless of its value.
@y
    The following filter matches networks with the `usage` label regardless of its value.
@z

% snip command...

@x
    The following filter matches networks with the `usage` label with the `prod` value.
@y
    The following filter matches networks with the `usage` label with the `prod` value.
@z

% snip command...

@x
    #### Name
@y
    #### Name
@z

@x
    The `name` filter matches on all or part of a network's name.
@y
    The `name` filter matches on all or part of a network's name.
@z

@x
    The following filter matches all networks with a name containing the `foobar` string.
@y
    The following filter matches all networks with a name containing the `foobar` string.
@z

% snip command...

@x
    You can also filter for a substring in a name as this shows:
@y
    You can also filter for a substring in a name as this shows:
@z

% snip command...

@x
    #### Scope
@y
    #### Scope
@z

@x
    The `scope` filter matches networks based on their scope.
@y
    The `scope` filter matches networks based on their scope.
@z

@x
    The following example matches networks with the `swarm` scope:
@y
    The following example matches networks with the `swarm` scope:
@z

% snip command...

@x
    The following example matches networks with the `local` scope:
@y
    The following example matches networks with the `local` scope:
@z

% snip command...

@x
    #### Type
@y
    #### Type
@z

@x
    The `type` filter supports two values; `builtin` displays predefined networks
    (`bridge`, `none`, `host`), whereas `custom` displays user defined networks.
@y
    The `type` filter supports two values; `builtin` displays predefined networks
    (`bridge`, `none`, `host`), whereas `custom` displays user defined networks.
@z

@x
    The following filter matches all user defined networks:
@y
    The following filter matches all user defined networks:
@z

% snip command...

@x
    By having this flag it allows for batch cleanup. For example, use this filter
    to delete all user defined networks:
@y
    By having this flag it allows for batch cleanup. For example, use this filter
    to delete all user defined networks:
@z

% snip command...

@x
    A warning will be issued when trying to remove a network that has containers
    attached.
@y
    A warning will be issued when trying to remove a network that has containers
    attached.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints networks output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints networks output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder  | Description                                                                            |
    |--------------|----------------------------------------------------------------------------------------|
    | `.ID`        | Network ID                                                                             |
    | `.Name`      | Network name                                                                           |
    | `.Driver`    | Network driver                                                                         |
    | `.Scope`     | Network scope (local, global)                                                          |
    | `.IPv6`      | Whether IPv6 is enabled on the network or not.                                         |
    | `.Internal`  | Whether the network is internal or not.                                                |
    | `.Labels`    | All labels assigned to the network.                                                    |
    | `.Label`     | Value of a specific label for this network. For example `{{.Label "project.version"}}` |
    | `.CreatedAt` | Time when the network was created                                                      |
@y
    | Placeholder  | Description                                                                            |
    |--------------|----------------------------------------------------------------------------------------|
    | `.ID`        | Network ID                                                                             |
    | `.Name`      | Network name                                                                           |
    | `.Driver`    | Network driver                                                                         |
    | `.Scope`     | Network scope (local, global)                                                          |
    | `.IPv6`      | Whether IPv6 is enabled on the network or not.                                         |
    | `.Internal`  | Whether the network is internal or not.                                                |
    | `.Labels`    | All labels assigned to the network.                                                    |
    | `.Label`     | Value of a specific label for this network. For example `{{.Label "project.version"}}` |
    | `.CreatedAt` | Time when the network was created                                                      |
@z

@x
    When using the `--format` option, the `network ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `network ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `Driver` entries separated by a colon (`:`) for all networks:
@y
    The following example uses a template without headers and outputs the
    `ID` and `Driver` entries separated by a colon (`:`) for all networks:
@z

% snip command...

@x
    To list all networks in JSON format, use the `json` directive:
@y
    To list all networks in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
