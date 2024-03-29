%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__対応

@x
command: docker plugin ls
aliases: docker plugin ls, docker plugin list
short: List plugins
long: |-
    Lists all the plugins that are currently installed. You can install plugins
    using the [`docker plugin install`](/reference/cli/docker/plugin/install/) command.
    You can also filter using the `-f` or `--filter` flag.
    Refer to the [filtering](#filter) section for more information about available filter options.
usage: docker plugin ls [OPTIONS]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `enabled=true`)
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
      description: Don't truncate output
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
      description: Only display plugin IDs
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
    $ docker plugin ls
@y
command: docker plugin ls
aliases: docker plugin ls, docker plugin list
short: List plugins
long: |-
    Lists all the plugins that are currently installed. You can install plugins
    using the [`docker plugin install`](__SUBDIR__/reference/cli/docker/plugin/install/) command.
    You can also filter using the `-f` or `--filter` flag.
    Refer to the [filtering](#filter) section for more information about available filter options.
usage: docker plugin ls [OPTIONS]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `enabled=true`)
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
      description: Don't truncate output
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
      description: Only display plugin IDs
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
    $ docker plugin ls
@z

@x
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
@y
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * enabled (boolean - true or false, 0 or 1)
    * capability (string - currently `volumedriver`, `networkdriver`, `ipamdriver`, `logdriver`, `metricscollector`, or `authz`)
@y
    * enabled (boolean - true or false, 0 or 1)
    * capability (string - currently `volumedriver`, `networkdriver`, `ipamdriver`, `logdriver`, `metricscollector`, or `authz`)
@z

@x
    #### enabled
@y
    #### enabled
@z

@x
    The `enabled` filter matches on plugins enabled or disabled.
@y
    The `enabled` filter matches on plugins enabled or disabled.
@z

@x
    #### capability
@y
    #### capability
@z

@x
    The `capability` filter matches on plugin capabilities. One plugin
    might have multiple capabilities. Currently `volumedriver`, `networkdriver`,
    `ipamdriver`, `logdriver`, `metricscollector`, and `authz` are supported capabilities.
@y
    The `capability` filter matches on plugin capabilities. One plugin
    might have multiple capabilities. Currently `volumedriver`, `networkdriver`,
    `ipamdriver`, `logdriver`, `metricscollector`, and `authz` are supported capabilities.
@z

@x
    ```console
    $ docker plugin install --disable vieux/sshfs
@y
    ```console
    $ docker plugin install --disable vieux/sshfs
@z

@x
    Installed plugin vieux/sshfs
@y
    Installed plugin vieux/sshfs
@z

@x
    $ docker plugin ls --filter enabled=true
@y
    $ docker plugin ls --filter enabled=true
@z

@x
    ID                  NAME                DESCRIPTION         ENABLED
    ```
@y
    ID                  NAME                DESCRIPTION         ENABLED
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints plugins output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints plugins output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder        | Description                                     |
    |--------------------|-------------------------------------------------|
    | `.ID`              | Plugin ID                                       |
    | `.Name`            | Plugin name and tag                             |
    | `.Description`     | Plugin description                              |
    | `.Enabled`         | Whether plugin is enabled or not                |
    | `.PluginReference` | The reference used to push/pull from a registry |
@y
    | Placeholder        | Description                                     |
    |--------------------|-------------------------------------------------|
    | `.ID`              | Plugin ID                                       |
    | `.Name`            | Plugin name and tag                             |
    | `.Description`     | Plugin description                              |
    | `.Enabled`         | Whether plugin is enabled or not                |
    | `.PluginReference` | The reference used to push/pull from a registry |
@z

@x
    When using the `--format` option, the `plugin ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `plugin ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `Name` entries separated by a colon (`:`) for all plugins:
@y
    The following example uses a template without headers and outputs the
    `ID` and `Name` entries separated by a colon (`:`) for all plugins:
@z

@x
    ```console
    $ docker plugin ls --format "{{.ID}}: {{.Name}}"
@y
    ```console
    $ docker plugin ls --format "{{.ID}}: {{.Name}}"
@z

@x
    4be01827a72e: vieux/sshfs:latest
    ```
@y
    4be01827a72e: vieux/sshfs:latest
    ```
@z

@x
    To list all plugins in JSON format, use the `json` directive:
    ```console
    $ docker plugin ls --format json
    {"Description":"sshFS plugin for Docker","Enabled":false,"ID":"856d89febb1c","Name":"vieux/sshfs:latest","PluginReference":"docker.io/vieux/sshfs:latest"}
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    To list all plugins in JSON format, use the `json` directive:
    ```console
    $ docker plugin ls --format json
    {"Description":"sshFS plugin for Docker","Enabled":false,"ID":"856d89febb1c","Name":"vieux/sshfs:latest","PluginReference":"docker.io/vieux/sshfs:latest"}
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
