%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container ls
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker container ls [OPTIONS]
@y
command: docker container ls
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker container ls [OPTIONS]
@z

% options:

@x all
      description: Show all containers (default shows just running)
@y
      description: Show all containers (default shows just running)
@z

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

@x last
      description: Show n last created containers (includes all states)
@y
      description: Show n last created containers (includes all states)
@z

@x latest
      description: Show the latest created container (includes all states)
@y
      description: Show the latest created container (includes all states)
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only display container IDs
@y
      description: Only display container IDs
@z

@x size
      description: Display total file sizes
@y
      description: Display total file sizes
@z

%inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Do not truncate output (--no-trunc) {#no-trunc}
@y
examples: |-
    ### Do not truncate output (--no-trunc) {#no-trunc}
@z

@x
    Running `docker ps --no-trunc` showing 2 linked containers.
@y
    Running `docker ps --no-trunc` showing 2 linked containers.
@z

% snip command...

@x
    ### Show both running and stopped containers (-a, --all) {#all}
@y
    ### Show both running and stopped containers (-a, --all) {#all}
@z

@x
    The `docker ps` command only shows running containers by default. To see all
    containers, use the `--all` (or `-a`) flag:
@y
    The `docker ps` command only shows running containers by default. To see all
    containers, use the `--all` (or `-a`) flag:
@z

% snip command...

@x
    `docker ps` groups exposed ports into a single range if possible. E.g., a
    container that exposes TCP ports `100, 101, 102` displays `100-102/tcp` in
    the `PORTS` column.
@y
    `docker ps` groups exposed ports into a single range if possible. E.g., a
    container that exposes TCP ports `100, 101, 102` displays `100-102/tcp` in
    the `PORTS` column.
@z

@x
    ### Show disk usage by container (--size) {#size}
@y
    ### Show disk usage by container (--size) {#size}
@z

@x
    The `docker ps --size` (or `-s`) command displays two different on-disk-sizes for each container:
@y
    The `docker ps --size` (or `-s`) command displays two different on-disk-sizes for each container:
@z

% snip command...

@x
      * The "size" information shows the amount of data (on disk) that is used for the _writable_ layer of each container
      * The "virtual size" is the total amount of disk-space used for the read-only _image_ data used by the container and the writable layer.
@y
      * The "size" information shows the amount of data (on disk) that is used for the _writable_ layer of each container
      * The "virtual size" is the total amount of disk-space used for the read-only _image_ data used by the container and the writable layer.
@z

@x
    For more information, refer to the [container size on disk](/engine/storage/drivers/#container-size-on-disk) section.
@y
    For more information, refer to the [container size on disk](__SUBDIR__/engine/storage/drivers/#container-size-on-disk) section.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The `--filter` (or `-f`) flag format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
@y
    The `--filter` (or `-f`) flag format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    | Filter                | Description                                                                                                                          |
    |:----------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
    | `id`                  | Container's ID                                                                                                                       |
    | `name`                | Container's name                                                                                                                     |
    | `label`               | An arbitrary string representing either a key or a key-value pair. Expressed as `<key>` or `<key>=<value>`                           |
    | `exited`              | An integer representing the container's exit code. Only useful with `--all`.                                                         |
    | `status`              | One of `created`, `restarting`, `running`, `removing`, `paused`, `exited`, or `dead`                                                 |
    | `ancestor`            | Filters containers which share a given image as an ancestor. Expressed as `<image-name>[:<tag>]`,  `<image id>`, or `<image@digest>` |
    | `before` or `since`   | Filters containers created before or after a given container ID or name                                                              |
    | `volume`              | Filters running containers which have mounted a given volume or bind mount.                                                          |
    | `network`             | Filters running containers connected to a given network.                                                                             |
    | `publish` or `expose` | Filters containers which publish or expose a given port. Expressed as `<port>[/<proto>]` or `<startport-endport>/[<proto>]`          |
    | `health`              | Filters containers based on their healthcheck status. One of `starting`, `healthy`, `unhealthy` or `none`.                           |
    | `isolation`           | Windows daemon only. One of `default`, `process`, or `hyperv`.                                                                       |
    | `is-task`             | Filters containers that are a "task" for a service. Boolean option (`true` or `false`)                                               |
@y
    | Filter                | Description                                                                                                                          |
    |:----------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
    | `id`                  | Container's ID                                                                                                                       |
    | `name`                | Container's name                                                                                                                     |
    | `label`               | An arbitrary string representing either a key or a key-value pair. Expressed as `<key>` or `<key>=<value>`                           |
    | `exited`              | An integer representing the container's exit code. Only useful with `--all`.                                                         |
    | `status`              | One of `created`, `restarting`, `running`, `removing`, `paused`, `exited`, or `dead`                                                 |
    | `ancestor`            | Filters containers which share a given image as an ancestor. Expressed as `<image-name>[:<tag>]`,  `<image id>`, or `<image@digest>` |
    | `before` or `since`   | Filters containers created before or after a given container ID or name                                                              |
    | `volume`              | Filters running containers which have mounted a given volume or bind mount.                                                          |
    | `network`             | Filters running containers connected to a given network.                                                                             |
    | `publish` or `expose` | Filters containers which publish or expose a given port. Expressed as `<port>[/<proto>]` or `<startport-endport>/[<proto>]`          |
    | `health`              | Filters containers based on their healthcheck status. One of `starting`, `healthy`, `unhealthy` or `none`.                           |
    | `isolation`           | Windows daemon only. One of `default`, `process`, or `hyperv`.                                                                       |
    | `is-task`             | Filters containers that are a "task" for a service. Boolean option (`true` or `false`)                                               |
@z

@x
    #### label
@y
    #### label
@z

@x
    The `label` filter matches containers based on the presence of a `label` alone or a `label` and a
    value.
@y
    The `label` filter matches containers based on the presence of a `label` alone or a `label` and a
    value.
@z

@x
    The following filter matches containers with the `color` label regardless of its value.
@y
    The following filter matches containers with the `color` label regardless of its value.
@z

% snip command...

@x
    The following filter matches containers with the `color` label with the `blue` value.
@y
    The following filter matches containers with the `color` label with the `blue` value.
@z

% snip command...

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on all or part of a container's name.
@y
    The `name` filter matches on all or part of a container's name.
@z

@x
    The following filter matches all containers with a name containing the `nostalgic_stallman` string.
@y
    The following filter matches all containers with a name containing the `nostalgic_stallman` string.
@z

% snip command...

@x
    You can also filter for a substring in a name as this shows:
@y
    You can also filter for a substring in a name as this shows:
@z

% snip command...

@x
    #### exited
@y
    #### exited
@z

@x
    The `exited` filter matches containers by exist status code. For example, to
    filter for containers that have exited successfully:
@y
    The `exited` filter matches containers by exist status code. For example, to
    filter for containers that have exited successfully:
@z

% snip command...

@x
    #### Filter by exit signal
@y
    #### Filter by exit signal
@z

@x
    You can use a filter to locate containers that exited with status of `137`
    meaning a `SIGKILL(9)` killed them.
@y
    You can use a filter to locate containers that exited with status of `137`
    meaning a `SIGKILL(9)` killed them.
@z

% snip command...

@x
    Any of these events result in a `137` status:
@y
    Any of these events result in a `137` status:
@z

@x
    * the `init` process of the container is killed manually
    * `docker kill` kills the container
    * Docker daemon restarts which kills all running containers
@y
    * the `init` process of the container is killed manually
    * `docker kill` kills the container
    * Docker daemon restarts which kills all running containers
@z

@x
    #### status
@y
    #### status
@z

@x
    The `status` filter matches containers by status. The possible values for the container status are:
@y
    The `status` filter matches containers by status. The possible values for the container status are:
@z

@x
    | Status       | Description                                                                                                                                                                                     |
    | :----------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `created`    | A container that has never been started.                                                                                                                                                        |
    | `running`    | A running container, started by either `docker start` or `docker run`.                                                                                                                          |
    | `paused`     | A paused container. See `docker pause`.                                                                                                                                                         |
    | `restarting` | A container which is starting due to the designated restart policy for that container.                                                                                                          |
    | `exited`     | A container which is no longer running. For example, the process inside the container completed or the container was stopped using the `docker stop` command.                                   |
    | `removing`   | A container which is in the process of being removed. See `docker rm`.                                                                                                                          |
    | `dead`       | A "defunct" container; for example, a container that was only partially removed because resources were kept busy by an external process. `dead` containers cannot be (re)started, only removed. |
@y
    | Status       | Description                                                                                                                                                                                     |
    | :----------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `created`    | A container that has never been started.                                                                                                                                                        |
    | `running`    | A running container, started by either `docker start` or `docker run`.                                                                                                                          |
    | `paused`     | A paused container. See `docker pause`.                                                                                                                                                         |
    | `restarting` | A container which is starting due to the designated restart policy for that container.                                                                                                          |
    | `exited`     | A container which is no longer running. For example, the process inside the container completed or the container was stopped using the `docker stop` command.                                   |
    | `removing`   | A container which is in the process of being removed. See `docker rm`.                                                                                                                          |
    | `dead`       | A "defunct" container; for example, a container that was only partially removed because resources were kept busy by an external process. `dead` containers cannot be (re)started, only removed. |
@z

@x
    For example, to filter for `running` containers:
@y
    For example, to filter for `running` containers:
@z

% snip command...

@x
    To filter for `paused` containers:
@y
    To filter for `paused` containers:
@z

% snip command...

@x
    #### ancestor
@y
    #### ancestor
@z

@x
    The `ancestor` filter matches containers based on its image or a descendant of
    it. The filter supports the following image representation:
@y
    The `ancestor` filter matches containers based on its image or a descendant of
    it. The filter supports the following image representation:
@z

@x
    - `image`
    - `image:tag`
    - `image:tag@digest`
    - `short-id`
    - `full-id`
@y
    - `image`
    - `image:tag`
    - `image:tag@digest`
    - `short-id`
    - `full-id`
@z

@x
    If you don't specify a `tag`, the `latest` tag is used. For example, to filter
    for containers that use the latest `ubuntu` image:
@y
    If you don't specify a `tag`, the `latest` tag is used. For example, to filter
    for containers that use the latest `ubuntu` image:
@z

% snip command...

@x
    Match containers based on the `ubuntu-c1` image which, in this case, is a child
    of `ubuntu`:
@y
    Match containers based on the `ubuntu-c1` image which, in this case, is a child
    of `ubuntu`:
@z

% snip command...

@x
    Match containers based on the `ubuntu` version `24.04` image:
@y
    Match containers based on the `ubuntu` version `24.04` image:
@z

% snip command...

@x
    The following matches containers based on the layer `d0e008c6cf02` or an image
    that have this layer in its layer stack.
@y
    The following matches containers based on the layer `d0e008c6cf02` or an image
    that have this layer in its layer stack.
@z

% snip command...

@x
    #### Create time
@y
    #### Create time
@z

@x
    ##### before
@y
    ##### before
@z

@x
    The `before` filter shows only containers created before the container with
    a given ID or name. For example, having these containers created:
@y
    The `before` filter shows only containers created before the container with
    a given ID or name. For example, having these containers created:
@z

% snip command...

@x
    Filtering with `before` would give:
@y
    Filtering with `before` would give:
@z

% snip command...

@x
    ##### since
@y
    ##### since
@z

@x
    The `since` filter shows only containers created since the container with a given
    ID or name. For example, with the same containers as in `before` filter:
@y
    The `since` filter shows only containers created since the container with a given
    ID or name. For example, with the same containers as in `before` filter:
@z

% snip command...

@x
    #### volume
@y
    #### volume
@z

@x
    The `volume` filter shows only containers that mount a specific volume or have
    a volume mounted in a specific path:
@y
    The `volume` filter shows only containers that mount a specific volume or have
    a volume mounted in a specific path:
@z

% snip command...

@x
    #### network
@y
    #### network
@z

@x
    The `network` filter shows only containers that are connected to a network with
    a given name or ID.
@y
    The `network` filter shows only containers that are connected to a network with
    a given name or ID.
@z

@x
    The following filter matches all containers that are connected to a network
    with a name containing `net1`.
@y
    The following filter matches all containers that are connected to a network
    with a name containing `net1`.
@z

% snip command...

@x
    The network filter matches on both the network's name and ID. The following
    example shows all containers that are attached to the `net1` network, using
    the network ID as a filter:
@y
    The network filter matches on both the network's name and ID. The following
    example shows all containers that are attached to the `net1` network, using
    the network ID as a filter:
@z

% snip command...

@x
    #### publish and expose
@y
    #### publish and expose
@z

@x
    The `publish` and `expose` filters show only containers that have published or exposed port with a given port
    number, port range, and/or protocol. The default protocol is `tcp` when not specified.
@y
    The `publish` and `expose` filters show only containers that have published or exposed port with a given port
    number, port range, and/or protocol. The default protocol is `tcp` when not specified.
@z

@x
    The following filter matches all containers that have published port of 80:
@y
    The following filter matches all containers that have published port of 80:
@z

% snip command...

@x
    The following filter matches all containers that have exposed TCP port in the range of `8000-8080`:
@y
    The following filter matches all containers that have exposed TCP port in the range of `8000-8080`:
@z

% snip command...

@x
    The following filter matches all containers that have exposed UDP port `80`:
@y
    The following filter matches all containers that have exposed UDP port `80`:
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty-prints container output using a Go
    template.
@y
    The formatting option (`--format`) pretty-prints container output using a Go
    template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder   | Description                                                                                     |
    |:--------------|:------------------------------------------------------------------------------------------------|
    | `.ID`         | Container ID                                                                                    |
    | `.Image`      | Image ID                                                                                        |
    | `.Command`    | Quoted command                                                                                  |
    | `.CreatedAt`  | Time when the container was created.                                                            |
    | `.RunningFor` | Elapsed time since the container was started.                                                   |
    | `.Ports`      | Exposed ports.                                                                                  |
    | `.State`      | Container status (for example; "created", "running", "exited").                                 |
    | `.Status`     | Container status with details about duration and health-status.                                 |
    | `.Size`       | Container disk size.                                                                            |
    | `.Names`      | Container names.                                                                                |
    | `.Labels`     | All labels assigned to the container.                                                           |
    | `.Label`      | Value of a specific label for this container. For example `'{{.Label "com.docker.swarm.cpu"}}'` |
    | `.Mounts`     | Names of the volumes mounted in this container.                                                 |
    | `.Networks`   | Names of the networks attached to this container.                                               |
@y
    | Placeholder   | Description                                                                                     |
    |:--------------|:------------------------------------------------------------------------------------------------|
    | `.ID`         | Container ID                                                                                    |
    | `.Image`      | Image ID                                                                                        |
    | `.Command`    | Quoted command                                                                                  |
    | `.CreatedAt`  | Time when the container was created.                                                            |
    | `.RunningFor` | Elapsed time since the container was started.                                                   |
    | `.Ports`      | Exposed ports.                                                                                  |
    | `.State`      | Container status (for example; "created", "running", "exited").                                 |
    | `.Status`     | Container status with details about duration and health-status.                                 |
    | `.Size`       | Container disk size.                                                                            |
    | `.Names`      | Container names.                                                                                |
    | `.Labels`     | All labels assigned to the container.                                                           |
    | `.Label`      | Value of a specific label for this container. For example `'{{.Label "com.docker.swarm.cpu"}}'` |
    | `.Mounts`     | Names of the volumes mounted in this container.                                                 |
    | `.Networks`   | Names of the networks attached to this container.                                               |
@z

@x
    When using the `--format` option, the `ps` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@y
    When using the `--format` option, the `ps` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@z

@x
    The following example uses a template without headers and outputs the `ID` and
    `Command` entries separated by a colon (`:`) for all running containers:
@y
    The following example uses a template without headers and outputs the `ID` and
    `Command` entries separated by a colon (`:`) for all running containers:
@z

% snip command...

@x
    To list all running containers with their labels in a table format you can use:
@y
    To list all running containers with their labels in a table format you can use:
@z

% snip command...

@x
    To list all running containers in JSON format, use the `json` directive:
@y
    To list all running containers in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
