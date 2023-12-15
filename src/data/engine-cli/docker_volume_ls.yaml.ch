%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume ls
aliases: docker volume ls, docker volume list
short: List volumes
long: |-
    List all the volumes known to Docker. You can filter using the `-f` or
    `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
usage: docker volume ls [OPTIONS]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: cluster
      value_type: bool
      default_value: "false"
      description: |
        Display only cluster volumes, and use cluster volume list formatting
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `dangling=true`)
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
      description: Only display volume names
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
    ### Create a volume
@y
command: docker volume ls
aliases: docker volume ls, docker volume list
short: List volumes
long: |-
    List all the volumes known to Docker. You can filter using the `-f` or
    `--filter` flag. Refer to the [filtering](#filter) section for more
    information about available filter options.
usage: docker volume ls [OPTIONS]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: cluster
      value_type: bool
      default_value: "false"
      description: |
        Display only cluster volumes, and use cluster volume list formatting
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: filter
      shorthand: f
      value_type: filter
      description: Provide filter values (e.g. `dangling=true`)
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
      description: Only display volume names
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
    ### Create a volume
@z

@x
    ```console
    $ docker volume create rosemary
@y
    ```console
    $ docker volume create rosemary
@z

@x
    rosemary
@y
    rosemary
@z

@x
    $ docker volume create tyler
@y
    $ docker volume create tyler
@z

@x
    tyler
@y
    tyler
@z

@x
    $ docker volume ls
@y
    $ docker volume ls
@z

@x
    DRIVER              VOLUME NAME
    local               rosemary
    local               tyler
    ```
@y
    DRIVER              VOLUME NAME
    local               rosemary
    local               tyler
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - dangling (boolean - true or false, 0 or 1)
    - driver (a volume driver's name)
    - label (`label=<key>` or `label=<key>=<value>`)
    - name (a volume's name)
@y
    - dangling (boolean - true or false, 0 or 1)
    - driver (a volume driver's name)
    - label (`label=<key>` or `label=<key>=<value>`)
    - name (a volume's name)
@z

@x
    #### dangling
@y
    #### dangling
@z

@x
    The `dangling` filter matches on all volumes not referenced by any containers
@y
    The `dangling` filter matches on all volumes not referenced by any containers
@z

@x
    ```console
    $ docker run -d  -v tyler:/tmpwork  busybox
@y
    ```console
    $ docker run -d  -v tyler:/tmpwork  busybox
@z

@x
    f86a7dd02898067079c99ceacd810149060a70528eff3754d0b0f1a93bd0af18
    $ docker volume ls -f dangling=true
    DRIVER              VOLUME NAME
    local               rosemary
    ```
@y
    f86a7dd02898067079c99ceacd810149060a70528eff3754d0b0f1a93bd0af18
    $ docker volume ls -f dangling=true
    DRIVER              VOLUME NAME
    local               rosemary
    ```
@z

@x
    #### driver
@y
    #### driver
@z

@x
    The `driver` filter matches volumes based on their driver.
@y
    The `driver` filter matches volumes based on their driver.
@z

@x
    The following example matches volumes that are created with the `local` driver:
@y
    The following example matches volumes that are created with the `local` driver:
@z

@x
    ```console
    $ docker volume ls -f driver=local
@y
    ```console
    $ docker volume ls -f driver=local
@z

@x
    DRIVER              VOLUME NAME
    local               rosemary
    local               tyler
    ```
@y
    DRIVER              VOLUME NAME
    local               rosemary
    local               tyler
    ```
@z

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches volumes based on the presence of a `label` alone or
    a `label` and a value.
@y
    The `label` filter matches volumes based on the presence of a `label` alone or
    a `label` and a value.
@z

@x
    First, let's create some volumes to illustrate this;
@y
    First, let's create some volumes to illustrate this;
@z

@x
    ```console
    $ docker volume create the-doctor --label is-timelord=yes
@y
    ```console
    $ docker volume create the-doctor --label is-timelord=yes
@z

@x
    the-doctor
    $ docker volume create daleks --label is-timelord=no
@y
    the-doctor
    $ docker volume create daleks --label is-timelord=no
@z

@x
    daleks
    ```
@y
    daleks
    ```
@z

@x
    The following example filter matches volumes with the `is-timelord` label
    regardless of its value.
@y
    The following example filter matches volumes with the `is-timelord` label
    regardless of its value.
@z

@x
    ```console
    $ docker volume ls --filter label=is-timelord
@y
    ```console
    $ docker volume ls --filter label=is-timelord
@z

@x
    DRIVER              VOLUME NAME
    local               daleks
    local               the-doctor
    ```
@y
    DRIVER              VOLUME NAME
    local               daleks
    local               the-doctor
    ```
@z

@x
    As the above example demonstrates, both volumes with `is-timelord=yes`, and
    `is-timelord=no` are returned.
@y
    As the above example demonstrates, both volumes with `is-timelord=yes`, and
    `is-timelord=no` are returned.
@z

@x
    Filtering on both `key` *and* `value` of the label, produces the expected result:
@y
    Filtering on both `key` *and* `value` of the label, produces the expected result:
@z

@x
    ```console
    $ docker volume ls --filter label=is-timelord=yes
@y
    ```console
    $ docker volume ls --filter label=is-timelord=yes
@z

@x
    DRIVER              VOLUME NAME
    local               the-doctor
    ```
@y
    DRIVER              VOLUME NAME
    local               the-doctor
    ```
@z

@x
    Specifying multiple label filter produces an "and" search; all conditions
    should be met;
@y
    Specifying multiple label filter produces an "and" search; all conditions
    should be met;
@z

@x
    ```console
    $ docker volume ls --filter label=is-timelord=yes --filter label=is-timelord=no
@y
    ```console
    $ docker volume ls --filter label=is-timelord=yes --filter label=is-timelord=no
@z

@x
    DRIVER              VOLUME NAME
    ```
@y
    DRIVER              VOLUME NAME
    ```
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a volume's name.
@y
    The `name` filter matches on all or part of a volume's name.
@z

@x
    The following filter matches all volumes with a name containing the `rose` string.
@y
    The following filter matches all volumes with a name containing the `rose` string.
@z

@x
    ```console
    $ docker volume ls -f name=rose
@y
    ```console
    $ docker volume ls -f name=rose
@z

@x
    DRIVER              VOLUME NAME
    local               rosemary
    ```
@y
    DRIVER              VOLUME NAME
    local               rosemary
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints volumes output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints volumes output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder   | Description                                                                           |
    |---------------|---------------------------------------------------------------------------------------|
    | `.Name`       | Volume name                                                                           |
    | `.Driver`     | Volume driver                                                                         |
    | `.Scope`      | Volume scope (local, global)                                                          |
    | `.Mountpoint` | The mount point of the volume on the host                                             |
    | `.Labels`     | All labels assigned to the volume                                                     |
    | `.Label`      | Value of a specific label for this volume. For example `{{.Label "project.version"}}` |
@y
    | Placeholder   | Description                                                                           |
    |---------------|---------------------------------------------------------------------------------------|
    | `.Name`       | Volume name                                                                           |
    | `.Driver`     | Volume driver                                                                         |
    | `.Scope`      | Volume scope (local, global)                                                          |
    | `.Mountpoint` | The mount point of the volume on the host                                             |
    | `.Labels`     | All labels assigned to the volume                                                     |
    | `.Label`      | Value of a specific label for this volume. For example `{{.Label "project.version"}}` |
@z

@x
    When using the `--format` option, the `volume ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `volume ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `Driver` entries separated by a colon (`:`) for all volumes:
@y
    The following example uses a template without headers and outputs the
    `Name` and `Driver` entries separated by a colon (`:`) for all volumes:
@z

@x
    ```console
    $ docker volume ls --format "{{.Name}}: {{.Driver}}"
@y
    ```console
    $ docker volume ls --format "{{.Name}}: {{.Driver}}"
@z

@x
    vol1: local
    vol2: local
    vol3: local
    ```
@y
    vol1: local
    vol2: local
    vol3: local
    ```
@z

@x
    To list all volumes in JSON format, use the `json` directive:
@y
    To list all volumes in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker volume ls --format json
    {"Driver":"local","Labels":"","Links":"N/A","Mountpoint":"/var/lib/docker/volumes/docker-cli-dev-cache/_data","Name":"docker-cli-dev-cache","Scope":"local","Size":"N/A"}
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker volume ls --format json
    {"Driver":"local","Labels":"","Links":"N/A","Mountpoint":"/var/lib/docker/volumes/docker-cli-dev-cache/_data","Name":"docker-cli-dev-cache","Scope":"local","Size":"N/A"}
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
