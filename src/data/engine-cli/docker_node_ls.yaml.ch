%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node ls
aliases: docker node ls, docker node list
short: List nodes in the swarm
long: |-
    Lists all the nodes that the Docker Swarm manager knows about. You can filter
    using the `-f` or `--filter` flag. Refer to the [filtering](#filter) section
    for more information about available filter options.
@y
command: docker node ls
aliases: docker node ls, docker node list
short: List nodes in the swarm
long: |-
    Lists all the nodes that the Docker Swarm manager knows about. You can filter
    using the `-f` or `--filter` flag. Refer to the [filtering](#filter) section
    for more information about available filter options.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node ls [OPTIONS]
pname: docker node
plink: docker_node.yaml
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
    $ docker node ls
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker node ls [OPTIONS]
pname: docker node
plink: docker_node.yaml
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
    $ docker node ls
@z

@x
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    swarm-worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    swarm-worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    swarm-worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    swarm-worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@z

@x
    > **Note**
    >
    > In the above example output, there is a hidden column of `.Self` that indicates
    > if the node is the same node as the current docker daemon. A `*` (e.g.,
    > `e216jshn25ckzbvmwlnh5jr3g *`) means this node is the current docker daemon.
@y
    > **Note**
    >
    > In the above example output, there is a hidden column of `.Self` that indicates
    > if the node is the same node as the current docker daemon. A `*` (e.g.,
    > `e216jshn25ckzbvmwlnh5jr3g *`) means this node is the current docker daemon.
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
    * [id](#id)
    * [label](#label)
    * [node.label](#nodelabel)
    * [membership](#membership)
    * [name](#name)
    * [role](#role)
@y
    * [id](#id)
    * [label](#label)
    * [node.label](#nodelabel)
    * [membership](#membership)
    * [name](#name)
    * [role](#role)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches all or part of a node's id.
@y
    The `id` filter matches all or part of a node's id.
@z

@x
    ```console
    $ docker node ls -f id=1
@y
    ```console
    $ docker node ls -f id=1
@z

@x
    ID                         HOSTNAME       STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0  swarm-worker2  Ready   Active
    ```
@y
    ID                         HOSTNAME       STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0  swarm-worker2  Ready   Active
    ```
@z

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches nodes based on engine labels and on the presence of a
    `label` alone or a `label` and a value. Engine labels are configured in
    the [daemon configuration](dockerd.md#daemon-configuration-file). To filter on
    Swarm `node` labels, use [`node.label` instead](#nodelabel).
@y
    The `label` filter matches nodes based on engine labels and on the presence of a
    `label` alone or a `label` and a value. Engine labels are configured in
    the [daemon configuration](dockerd.md#daemon-configuration-file). To filter on
    Swarm `node` labels, use [`node.label` instead](#nodelabel).
@z

@x
    The following filter matches nodes with the `foo` label regardless of its value.
@y
    The following filter matches nodes with the `foo` label regardless of its value.
@z

@x
    ```console
    $ docker node ls -f "label=foo"
@y
    ```console
    $ docker node ls -f "label=foo"
@z

@x
    ID                         HOSTNAME       STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0  swarm-worker2  Ready   Active
    ```
@y
    ID                         HOSTNAME       STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0  swarm-worker2  Ready   Active
    ```
@z

@x
    #### node.label
@y
    #### node.label
@z

@x
    The `node.label` filter matches nodes based on node labels and on the presence
    of a `node.label` alone or a `node.label` and a value.
@y
    The `node.label` filter matches nodes based on node labels and on the presence
    of a `node.label` alone or a `node.label` and a value.
@z

@x
    The following filter updates nodes to have a `region` node label:
@y
    The following filter updates nodes to have a `region` node label:
@z

@x
    ```console
    $ docker node update --label-add region=region-a swarm-test-01
    $ docker node update --label-add region=region-a swarm-test-02
    $ docker node update --label-add region=region-b swarm-test-03
    $ docker node update --label-add region=region-b swarm-test-04
    ```
@y
    ```console
    $ docker node update --label-add region=region-a swarm-test-01
    $ docker node update --label-add region=region-a swarm-test-02
    $ docker node update --label-add region=region-b swarm-test-03
    $ docker node update --label-add region=region-b swarm-test-04
    ```
@z

@x
    Show all nodes that have a `region` node label set:
@y
    Show all nodes that have a `region` node label set:
@z

@x
    ```console
    $ docker node ls --filter node.label=region
@y
    ```console
    $ docker node ls --filter node.label=region
@z

@x
    ID                            HOSTNAME        STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    yg550ettvsjn6g6t840iaiwgb *   swarm-test-01   Ready     Active         Leader           23.0.3
    2lm9w9kbepgvkzkkeyku40e65     swarm-test-02   Ready     Active         Reachable        23.0.3
    hc0pu7ntc7s4uvj4pv7z7pz15     swarm-test-03   Ready     Active         Reachable        23.0.3
    n41b2cijmhifxxvz56vwrs12q     swarm-test-04   Ready     Active                          23.0.3
    ```
@y
    ID                            HOSTNAME        STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    yg550ettvsjn6g6t840iaiwgb *   swarm-test-01   Ready     Active         Leader           23.0.3
    2lm9w9kbepgvkzkkeyku40e65     swarm-test-02   Ready     Active         Reachable        23.0.3
    hc0pu7ntc7s4uvj4pv7z7pz15     swarm-test-03   Ready     Active         Reachable        23.0.3
    n41b2cijmhifxxvz56vwrs12q     swarm-test-04   Ready     Active                          23.0.3
    ```
@z

@x
    Show all nodes that have a `region` node label, with value `region-a`:
@y
    Show all nodes that have a `region` node label, with value `region-a`:
@z

@x
    ```console
    $ docker node ls --filter node.label=region=region-a
@y
    ```console
    $ docker node ls --filter node.label=region=region-a
@z

@x
    ID                            HOSTNAME        STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    yg550ettvsjn6g6t840iaiwgb *   swarm-test-01   Ready     Active         Leader           23.0.3
    2lm9w9kbepgvkzkkeyku40e65     swarm-test-02   Ready     Active         Reachable        23.0.3
    ```
@y
    ID                            HOSTNAME        STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    yg550ettvsjn6g6t840iaiwgb *   swarm-test-01   Ready     Active         Leader           23.0.3
    2lm9w9kbepgvkzkkeyku40e65     swarm-test-02   Ready     Active         Reachable        23.0.3
    ```
@z

@x
    #### membership
@y
    #### membership
@z

@x
    The `membership` filter matches nodes based on the presence of a `membership` and a value
    `accepted` or `pending`.
@y
    The `membership` filter matches nodes based on the presence of a `membership` and a value
    `accepted` or `pending`.
@z

@x
    The following filter matches nodes with the `membership` of `accepted`.
@y
    The following filter matches nodes with the `membership` of `accepted`.
@z

@x
    ```console
    $ docker node ls -f "membership=accepted"
@y
    ```console
    $ docker node ls -f "membership=accepted"
@z

@x
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    swarm-worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    swarm-worker1   Ready   Active
    ```
@y
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    swarm-worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    swarm-worker1   Ready   Active
    ```
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a node hostname.
@y
    The `name` filter matches on all or part of a node hostname.
@z

@x
    The following filter matches the nodes with a name equal to `swarm-master` string.
@y
    The following filter matches the nodes with a name equal to `swarm-master` string.
@z

@x
    ```console
    $ docker node ls -f name=swarm-manager1
@y
    ```console
    $ docker node ls -f name=swarm-manager1
@z

@x
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@z

@x
    #### role
@y
    #### role
@z

@x
    The `role` filter matches nodes based on the presence of a `role` and a value `worker` or `manager`.
@y
    The `role` filter matches nodes based on the presence of a `role` and a value `worker` or `manager`.
@z

@x
    The following filter matches nodes with the `manager` role.
@y
    The following filter matches nodes with the `manager` role.
@z

@x
    ```console
    $ docker node ls -f "role=manager"
@y
    ```console
    $ docker node ls -f "role=manager"
@z

@x
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME        STATUS  AVAILABILITY  MANAGER STATUS
    e216jshn25ckzbvmwlnh5jr3g *  swarm-manager1  Ready   Active        Leader
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints nodes output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints nodes output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder      | Description                                                                                           |
    |------------------|-------------------------------------------------------------------------------------------------------|
    | `.ID`            | Node ID                                                                                               |
    | `.Self`          | Node of the daemon (`true/false`, `true`indicates that the node is the same as current docker daemon) |
    | `.Hostname`      | Node hostname                                                                                         |
    | `.Status`        | Node status                                                                                           |
    | `.Availability`  | Node availability ("active", "pause", or "drain")                                                     |
    | `.ManagerStatus` | Manager status of the node                                                                            |
    | `.TLSStatus`     | TLS status of the node ("Ready", or "Needs Rotation" has TLS certificate signed by an old CA)         |
    | `.EngineVersion` | Engine version                                                                                        |
@y
    | Placeholder      | Description                                                                                           |
    |------------------|-------------------------------------------------------------------------------------------------------|
    | `.ID`            | Node ID                                                                                               |
    | `.Self`          | Node of the daemon (`true/false`, `true`indicates that the node is the same as current docker daemon) |
    | `.Hostname`      | Node hostname                                                                                         |
    | `.Status`        | Node status                                                                                           |
    | `.Availability`  | Node availability ("active", "pause", or "drain")                                                     |
    | `.ManagerStatus` | Manager status of the node                                                                            |
    | `.TLSStatus`     | TLS status of the node ("Ready", or "Needs Rotation" has TLS certificate signed by an old CA)         |
    | `.EngineVersion` | Engine version                                                                                        |
@z

@x
    When using the `--format` option, the `node ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `node ls` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID`, `Hostname`, and `TLS Status` entries separated by a colon (`:`) for all
    nodes:
@y
    The following example uses a template without headers and outputs the
    `ID`, `Hostname`, and `TLS Status` entries separated by a colon (`:`) for all
    nodes:
@z

@x
    ```console
    $ docker node ls --format "{{.ID}}: {{.Hostname}} {{.TLSStatus}}"
@y
    ```console
    $ docker node ls --format "{{.ID}}: {{.Hostname}} {{.TLSStatus}}"
@z

@x
    e216jshn25ckzbvmwlnh5jr3g: swarm-manager1 Ready
    35o6tiywb700jesrt3dmllaza: swarm-worker1 Needs Rotation
    ```
@y
    e216jshn25ckzbvmwlnh5jr3g: swarm-manager1 Ready
    35o6tiywb700jesrt3dmllaza: swarm-worker1 Needs Rotation
    ```
@z

@x
    To list all nodes in JSON format, use the `json` directive:
    ```console
    $ docker node ls --format json
    {"Availability":"Active","EngineVersion":"23.0.3","Hostname":"docker-desktop","ID":"k8f4w7qtzpj5sqzclcqafw35g","ManagerStatus":"Leader","Self":true,"Status":"Ready","TLSStatus":"Ready"}
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    To list all nodes in JSON format, use the `json` directive:
    ```console
    $ docker node ls --format json
    {"Availability":"Active","EngineVersion":"23.0.3","Hostname":"docker-desktop","ID":"k8f4w7qtzpj5sqzclcqafw35g","ManagerStatus":"Leader","Self":true,"Status":"Ready","TLSStatus":"Ready"}
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
