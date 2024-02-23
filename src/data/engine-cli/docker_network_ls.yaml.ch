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
pname: docker network
plink: docker_network.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `driver=bridge`)
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
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate the output
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
      description: Only display network IDs
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
    ### List all networks
@y
command: docker network ls
aliases: docker network ls, docker network list
short: List networks
long: |-
    Lists all the networks the Engine `daemon` knows about. This includes the
    networks that span across multiple hosts in a cluster.
usage: docker network ls [OPTIONS]
pname: docker network
plink: docker_network.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `driver=bridge`)
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
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate the output
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
      description: Only display network IDs
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
    ### List all networks
@z

@x
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER          SCOPE
    7fca4eb8c647        bridge              bridge          local
    9f904ee27bf5        none                null            local
    cf03ee007fb4        host                host            local
    78b03ee04fc4        multi-host          overlay         swarm
    ```
@y
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER          SCOPE
    7fca4eb8c647        bridge              bridge          local
    9f904ee27bf5        none                null            local
    cf03ee007fb4        host                host            local
    78b03ee04fc4        multi-host          overlay         swarm
    ```
@z

@x
    Use the `--no-trunc` option to display the full network id:
@y
    Use the `--no-trunc` option to display the full network id:
@z

@x
    ```console
    $ docker network ls --no-trunc
    NETWORK ID                                                         NAME                DRIVER           SCOPE
    18a2866682b85619a026c81b98a5e375bd33e1b0936a26cc497c283d27bae9b3   none                null             local
    c288470c46f6c8949c5f7e5099b5b7947b07eabe8d9a27d79a9cbf111adcbf47   host                host             local
    7b369448dccbf865d397c8d2be0cda7cf7edc6b0945f77d2529912ae917a0185   bridge              bridge           local
    95e74588f40db048e86320c6526440c504650a1ff3e9f7d60a497c4d2163e5bd   foo                 bridge           local
    63d1ff1f77b07ca51070a8c227e962238358bd310bde1529cf62e6c307ade161   dev                 bridge           local
    ```
@y
    ```console
    $ docker network ls --no-trunc
    NETWORK ID                                                         NAME                DRIVER           SCOPE
    18a2866682b85619a026c81b98a5e375bd33e1b0936a26cc497c283d27bae9b3   none                null             local
    c288470c46f6c8949c5f7e5099b5b7947b07eabe8d9a27d79a9cbf111adcbf47   host                host             local
    7b369448dccbf865d397c8d2be0cda7cf7edc6b0945f77d2529912ae917a0185   bridge              bridge           local
    95e74588f40db048e86320c6526440c504650a1ff3e9f7d60a497c4d2163e5bd   foo                 bridge           local
    63d1ff1f77b07ca51070a8c227e962238358bd310bde1529cf62e6c307ade161   dev                 bridge           local
    ```
@z

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

@x
    ```console
    $ docker network ls --filter driver=bridge
    NETWORK ID          NAME                DRIVER            SCOPE
    db9db329f835        test1               bridge            local
    f6e212da9dfd        test2               bridge            local
    ```
@y
    ```console
    $ docker network ls --filter driver=bridge
    NETWORK ID          NAME                DRIVER            SCOPE
    db9db329f835        test1               bridge            local
    f6e212da9dfd        test2               bridge            local
    ```
@z

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

@x
    ```console
    $ docker network ls --filter id=63d1ff1f77b07ca51070a8c227e962238358bd310bde1529cf62e6c307ade161
    NETWORK ID          NAME                DRIVER           SCOPE
    63d1ff1f77b0        dev                 bridge           local
    ```
@y
    ```console
    $ docker network ls --filter id=63d1ff1f77b07ca51070a8c227e962238358bd310bde1529cf62e6c307ade161
    NETWORK ID          NAME                DRIVER           SCOPE
    63d1ff1f77b0        dev                 bridge           local
    ```
@z

@x
    You can also filter for a substring in an ID as this shows:
@y
    You can also filter for a substring in an ID as this shows:
@z

@x
    ```console
    $ docker network ls --filter id=95e74588f40d
    NETWORK ID          NAME                DRIVER          SCOPE
    95e74588f40d        foo                 bridge          local
@y
    ```console
    $ docker network ls --filter id=95e74588f40d
    NETWORK ID          NAME                DRIVER          SCOPE
    95e74588f40d        foo                 bridge          local
@z

@x
    $ docker network ls --filter id=95e
    NETWORK ID          NAME                DRIVER          SCOPE
    95e74588f40d        foo                 bridge          local
    ```
@y
    $ docker network ls --filter id=95e
    NETWORK ID          NAME                DRIVER          SCOPE
    95e74588f40d        foo                 bridge          local
    ```
@z

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

@x
    ```console
    $ docker network ls -f "label=usage"
    NETWORK ID          NAME                DRIVER         SCOPE
    db9db329f835        test1               bridge         local
    f6e212da9dfd        test2               bridge         local
    ```
@y
    ```console
    $ docker network ls -f "label=usage"
    NETWORK ID          NAME                DRIVER         SCOPE
    db9db329f835        test1               bridge         local
    f6e212da9dfd        test2               bridge         local
    ```
@z

@x
    The following filter matches networks with the `usage` label with the `prod` value.
@y
    The following filter matches networks with the `usage` label with the `prod` value.
@z

@x
    ```console
    $ docker network ls -f "label=usage=prod"
    NETWORK ID          NAME                DRIVER        SCOPE
    f6e212da9dfd        test2               bridge        local
    ```
@y
    ```console
    $ docker network ls -f "label=usage=prod"
    NETWORK ID          NAME                DRIVER        SCOPE
    f6e212da9dfd        test2               bridge        local
    ```
@z

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

@x
    ```console
    $ docker network ls --filter name=foobar
    NETWORK ID          NAME                DRIVER       SCOPE
    06e7eef0a170        foobar              bridge       local
    ```
@y
    ```console
    $ docker network ls --filter name=foobar
    NETWORK ID          NAME                DRIVER       SCOPE
    06e7eef0a170        foobar              bridge       local
    ```
@z

@x
    You can also filter for a substring in a name as this shows:
@y
    You can also filter for a substring in a name as this shows:
@z

@x
    ```console
    $ docker network ls --filter name=foo
    NETWORK ID          NAME                DRIVER       SCOPE
    95e74588f40d        foo                 bridge       local
    06e7eef0a170        foobar              bridge       local
    ```
@y
    ```console
    $ docker network ls --filter name=foo
    NETWORK ID          NAME                DRIVER       SCOPE
    95e74588f40d        foo                 bridge       local
    06e7eef0a170        foobar              bridge       local
    ```
@z

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

@x
    ```console
    $ docker network ls --filter scope=swarm
    NETWORK ID          NAME                DRIVER              SCOPE
    xbtm0v4f1lfh        ingress             overlay             swarm
    ic6r88twuu92        swarmnet            overlay             swarm
    ```
@y
    ```console
    $ docker network ls --filter scope=swarm
    NETWORK ID          NAME                DRIVER              SCOPE
    xbtm0v4f1lfh        ingress             overlay             swarm
    ic6r88twuu92        swarmnet            overlay             swarm
    ```
@z

@x
    The following example matches networks with the `local` scope:
@y
    The following example matches networks with the `local` scope:
@z

@x
    ```console
    $ docker network ls --filter scope=local
    NETWORK ID          NAME                DRIVER              SCOPE
    e85227439ac7        bridge              bridge              local
    0ca0e19443ed        host                host                local
    ca13cc149a36        localnet            bridge              local
    f9e115d2de35        none                null                local
    ```
@y
    ```console
    $ docker network ls --filter scope=local
    NETWORK ID          NAME                DRIVER              SCOPE
    e85227439ac7        bridge              bridge              local
    0ca0e19443ed        host                host                local
    ca13cc149a36        localnet            bridge              local
    f9e115d2de35        none                null                local
    ```
@z

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

@x
    ```console
    $ docker network ls --filter type=custom
    NETWORK ID          NAME                DRIVER       SCOPE
    95e74588f40d        foo                 bridge       local
    63d1ff1f77b0        dev                 bridge       local
    ```
@y
    ```console
    $ docker network ls --filter type=custom
    NETWORK ID          NAME                DRIVER       SCOPE
    95e74588f40d        foo                 bridge       local
    63d1ff1f77b0        dev                 bridge       local
    ```
@z

@x
    By having this flag it allows for batch cleanup. For example, use this filter
    to delete all user defined networks:
@y
    By having this flag it allows for batch cleanup. For example, use this filter
    to delete all user defined networks:
@z

@x
    ```console
    $ docker network rm `docker network ls --filter type=custom -q`
    ```
@y
    ```console
    $ docker network rm `docker network ls --filter type=custom -q`
    ```
@z

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

@x
    ```console
    $ docker network ls --format "{{.ID}}: {{.Driver}}"
    afaaab448eb2: bridge
    d1584f8dc718: host
    391df270dc66: null
    ```
@y
    ```console
    $ docker network ls --format "{{.ID}}: {{.Driver}}"
    afaaab448eb2: bridge
    d1584f8dc718: host
    391df270dc66: null
    ```
@z

@x
    To list all networks in JSON format, use the `json` directive:
@y
    To list all networks in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker network ls --format json
    {"CreatedAt":"2021-03-09 21:41:29.798999529 +0000 UTC","Driver":"bridge","ID":"f33ba176dd8e","IPv6":"false","Internal":"false","Labels":"","Name":"bridge","Scope":"local"}
    {"CreatedAt":"2021-03-09 21:41:29.772806592 +0000 UTC","Driver":"host","ID":"caf47bb3ac70","IPv6":"false","Internal":"false","Labels":"","Name":"host","Scope":"local"}
    {"CreatedAt":"2021-03-09 21:41:29.752212603 +0000 UTC","Driver":"null","ID":"9d096c122066","IPv6":"false","Internal":"false","Labels":"","Name":"none","Scope":"local"}
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker network ls --format json
    {"CreatedAt":"2021-03-09 21:41:29.798999529 +0000 UTC","Driver":"bridge","ID":"f33ba176dd8e","IPv6":"false","Internal":"false","Labels":"","Name":"bridge","Scope":"local"}
    {"CreatedAt":"2021-03-09 21:41:29.772806592 +0000 UTC","Driver":"host","ID":"caf47bb3ac70","IPv6":"false","Internal":"false","Labels":"","Name":"host","Scope":"local"}
    {"CreatedAt":"2021-03-09 21:41:29.752212603 +0000 UTC","Driver":"null","ID":"9d096c122066","IPv6":"false","Internal":"false","Labels":"","Name":"none","Scope":"local"}
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
