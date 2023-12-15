%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker ps
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker ps [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all containers (default shows just running)
      details_url: '#all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: last
      shorthand: "n"
      value_type: int
      default_value: "-1"
      description: Show n last created containers (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Show the latest created container (includes all states)
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
      details_url: '#no-trunc'
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
      description: Only display container IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes
      details_url: '#size'
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
    ### Do not truncate output (--no-trunc) {#no-trunc}
@y
command: docker ps
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker ps [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all containers (default shows just running)
      details_url: '#all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: last
      shorthand: "n"
      value_type: int
      default_value: "-1"
      description: Show n last created containers (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Show the latest created container (includes all states)
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
      details_url: '#no-trunc'
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
      description: Only display container IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes
      details_url: '#size'
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
    ### Do not truncate output (--no-trunc) {#no-trunc}
@z

@x
    Running `docker ps --no-trunc` showing 2 linked containers.
@y
    Running `docker ps --no-trunc` showing 2 linked containers.
@z

@x
    ```console
    $ docker ps --no-trunc
@y
    ```console
    $ docker ps --no-trunc
@z

@x
    CONTAINER ID                                                     IMAGE                        COMMAND                CREATED              STATUS              PORTS               NAMES
    ca5534a51dd04bbcebe9b23ba05f389466cf0c190f1f8f182d7eea92a9671d00 ubuntu:22.04                 bash                   17 seconds ago       Up 16 seconds       3300-3310/tcp       webapp
    9ca9747b233100676a48cc7806131586213fa5dab86dd1972d6a8732e3a84a4d crosbymichael/redis:latest   /redis-server --dir    33 minutes ago       Up 33 minutes       6379/tcp            redis,webapp/db
    ```
@y
    CONTAINER ID                                                     IMAGE                        COMMAND                CREATED              STATUS              PORTS               NAMES
    ca5534a51dd04bbcebe9b23ba05f389466cf0c190f1f8f182d7eea92a9671d00 ubuntu:22.04                 bash                   17 seconds ago       Up 16 seconds       3300-3310/tcp       webapp
    9ca9747b233100676a48cc7806131586213fa5dab86dd1972d6a8732e3a84a4d crosbymichael/redis:latest   /redis-server --dir    33 minutes ago       Up 33 minutes       6379/tcp            redis,webapp/db
    ```
@z

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

@x
    ```console
    $ docker ps -a
    ```
@y
    ```console
    $ docker ps -a
    ```
@z

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

@x
    ```console
    $ docker ps --size
@y
    ```console
    $ docker ps --size
@z

@x
    CONTAINER ID   IMAGE          COMMAND                  CREATED        STATUS       PORTS   NAMES        SIZE
    e90b8831a4b8   nginx          "/bin/bash -c 'mkdir "   11 weeks ago   Up 4 hours           my_nginx     35.58 kB (virtual 109.2 MB)
    00c6131c5e30   telegraf:1.5   "/entrypoint.sh"         11 weeks ago   Up 11 weeks          my_telegraf  0 B (virtual 209.5 MB)
    ```
      * The "size" information shows the amount of data (on disk) that is used for the _writable_ layer of each container
      * The "virtual size" is the total amount of disk-space used for the read-only _image_ data used by the container and the writable layer.
@y
    CONTAINER ID   IMAGE          COMMAND                  CREATED        STATUS       PORTS   NAMES        SIZE
    e90b8831a4b8   nginx          "/bin/bash -c 'mkdir "   11 weeks ago   Up 4 hours           my_nginx     35.58 kB (virtual 109.2 MB)
    00c6131c5e30   telegraf:1.5   "/entrypoint.sh"         11 weeks ago   Up 11 weeks          my_telegraf  0 B (virtual 209.5 MB)
    ```
      * The "size" information shows the amount of data (on disk) that is used for the _writable_ layer of each container
      * The "virtual size" is the total amount of disk-space used for the read-only _image_ data used by the container and the writable layer.
@z

@x
    For more information, refer to the [container size on disk](/storage/storagedriver/#container-size-on-disk) section.
@y
    For more information, refer to the [container size on disk](/storage/storagedriver/#container-size-on-disk) section.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The `--filter` (or `-f`) flag format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`)
@y
    The `--filter` (or `-f`) flag format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`)
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

@x
    ```console
    $ docker ps --filter "label=color"
@y
    ```console
    $ docker ps --filter "label=color"
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    673394ef1d4c        busybox             "top"               47 seconds ago      Up 45 seconds                           nostalgic_shockley
    d85756f57265        busybox             "top"               52 seconds ago      Up 51 seconds                           high_albattani
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    673394ef1d4c        busybox             "top"               47 seconds ago      Up 45 seconds                           nostalgic_shockley
    d85756f57265        busybox             "top"               52 seconds ago      Up 51 seconds                           high_albattani
    ```
@z

@x
    The following filter matches containers with the `color` label with the `blue` value.
@y
    The following filter matches containers with the `color` label with the `blue` value.
@z

@x
    ```console
    $ docker ps --filter "label=color=blue"
@y
    ```console
    $ docker ps --filter "label=color=blue"
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    d85756f57265        busybox             "top"               About a minute ago   Up About a minute                       high_albattani
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    d85756f57265        busybox             "top"               About a minute ago   Up About a minute                       high_albattani
    ```
@z

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

@x
    ```console
    $ docker ps --filter "name=nostalgic_stallman"
@y
    ```console
    $ docker ps --filter "name=nostalgic_stallman"
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    9b6247364a03        busybox             "top"               2 minutes ago       Up 2 minutes                            nostalgic_stallman
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    9b6247364a03        busybox             "top"               2 minutes ago       Up 2 minutes                            nostalgic_stallman
    ```
@z

@x
    You can also filter for a substring in a name as this shows:
@y
    You can also filter for a substring in a name as this shows:
@z

@x
    ```console
    $ docker ps --filter "name=nostalgic"
@y
    ```console
    $ docker ps --filter "name=nostalgic"
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    715ebfcee040        busybox             "top"               3 seconds ago       Up 1 second                             i_am_nostalgic
    9b6247364a03        busybox             "top"               7 minutes ago       Up 7 minutes                            nostalgic_stallman
    673394ef1d4c        busybox             "top"               38 minutes ago      Up 38 minutes                           nostalgic_shockley
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    715ebfcee040        busybox             "top"               3 seconds ago       Up 1 second                             i_am_nostalgic
    9b6247364a03        busybox             "top"               7 minutes ago       Up 7 minutes                            nostalgic_stallman
    673394ef1d4c        busybox             "top"               38 minutes ago      Up 38 minutes                           nostalgic_shockley
    ```
@z

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

@x
    ```console
    $ docker ps -a --filter 'exited=0'
@y
    ```console
    $ docker ps -a --filter 'exited=0'
@z

@x
    CONTAINER ID        IMAGE             COMMAND                CREATED             STATUS                   PORTS                      NAMES
    ea09c3c82f6e        registry:latest   /srv/run.sh            2 weeks ago         Exited (0) 2 weeks ago   127.0.0.1:5000->5000/tcp   desperate_leakey
    106ea823fe4e        fedora:latest     /bin/sh -c 'bash -l'   2 weeks ago         Exited (0) 2 weeks ago                              determined_albattani
    48ee228c9464        fedora:20         bash                   2 weeks ago         Exited (0) 2 weeks ago                              tender_torvalds
    ```
@y
    CONTAINER ID        IMAGE             COMMAND                CREATED             STATUS                   PORTS                      NAMES
    ea09c3c82f6e        registry:latest   /srv/run.sh            2 weeks ago         Exited (0) 2 weeks ago   127.0.0.1:5000->5000/tcp   desperate_leakey
    106ea823fe4e        fedora:latest     /bin/sh -c 'bash -l'   2 weeks ago         Exited (0) 2 weeks ago                              determined_albattani
    48ee228c9464        fedora:20         bash                   2 weeks ago         Exited (0) 2 weeks ago                              tender_torvalds
    ```
@z

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

@x
    ```console
    $ docker ps -a --filter 'exited=137'
@y
    ```console
    $ docker ps -a --filter 'exited=137'
@z

@x
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                       PORTS               NAMES
    b3e1c0ed5bfe        ubuntu:latest       "sleep 1000"           12 seconds ago      Exited (137) 5 seconds ago                       grave_kowalevski
    a2eb5558d669        redis:latest        "/entrypoint.sh redi   2 hours ago         Exited (137) 2 hours ago                         sharp_lalande
    ```
@y
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                       PORTS               NAMES
    b3e1c0ed5bfe        ubuntu:latest       "sleep 1000"           12 seconds ago      Exited (137) 5 seconds ago                       grave_kowalevski
    a2eb5558d669        redis:latest        "/entrypoint.sh redi   2 hours ago         Exited (137) 2 hours ago                         sharp_lalande
    ```
@z

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

@x
    ```console
    $ docker ps --filter status=running
@y
    ```console
    $ docker ps --filter status=running
@z

@x
    CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS              PORTS               NAMES
    715ebfcee040        busybox                "top"               16 minutes ago      Up 16 minutes                           i_am_nostalgic
    d5c976d3c462        busybox                "top"               23 minutes ago      Up 23 minutes                           top
    9b6247364a03        busybox                "top"               24 minutes ago      Up 24 minutes                           nostalgic_stallman
    ```
@y
    CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS              PORTS               NAMES
    715ebfcee040        busybox                "top"               16 minutes ago      Up 16 minutes                           i_am_nostalgic
    d5c976d3c462        busybox                "top"               23 minutes ago      Up 23 minutes                           top
    9b6247364a03        busybox                "top"               24 minutes ago      Up 24 minutes                           nostalgic_stallman
    ```
@z

@x
    To filter for `paused` containers:
@y
    To filter for `paused` containers:
@z

@x
    ```console
    $ docker ps --filter status=paused
@y
    ```console
    $ docker ps --filter status=paused
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    673394ef1d4c        busybox             "top"               About an hour ago   Up About an hour (Paused)                       nostalgic_shockley
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    673394ef1d4c        busybox             "top"               About an hour ago   Up About an hour (Paused)                       nostalgic_shockley
    ```
@z

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

@x
    ```console
    $ docker ps --filter ancestor=ubuntu
@y
    ```console
    $ docker ps --filter ancestor=ubuntu
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    919e1179bdb8        ubuntu-c1           "top"               About a minute ago   Up About a minute                       admiring_lovelace
    5d1e4a540723        ubuntu-c2           "top"               About a minute ago   Up About a minute                       admiring_sammet
    82a598284012        ubuntu              "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    bab2a34ba363        ubuntu              "top"               3 minutes ago        Up 3 minutes                            focused_yonath
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    919e1179bdb8        ubuntu-c1           "top"               About a minute ago   Up About a minute                       admiring_lovelace
    5d1e4a540723        ubuntu-c2           "top"               About a minute ago   Up About a minute                       admiring_sammet
    82a598284012        ubuntu              "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    bab2a34ba363        ubuntu              "top"               3 minutes ago        Up 3 minutes                            focused_yonath
    ```
@z

@x
    Match containers based on the `ubuntu-c1` image which, in this case, is a child
    of `ubuntu`:
@y
    Match containers based on the `ubuntu-c1` image which, in this case, is a child
    of `ubuntu`:
@z

@x
    ```console
    $ docker ps --filter ancestor=ubuntu-c1
@y
    ```console
    $ docker ps --filter ancestor=ubuntu-c1
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    919e1179bdb8        ubuntu-c1           "top"               About a minute ago   Up About a minute                       admiring_lovelace
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    919e1179bdb8        ubuntu-c1           "top"               About a minute ago   Up About a minute                       admiring_lovelace
    ```
@z

@x
    Match containers based on the `ubuntu` version `22.04` image:
@y
    Match containers based on the `ubuntu` version `22.04` image:
@z

@x
    ```console
    $ docker ps --filter ancestor=ubuntu:22.04
@y
    ```console
    $ docker ps --filter ancestor=ubuntu:22.04
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    82a598284012        ubuntu:22.04        "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    82a598284012        ubuntu:22.04        "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    ```
@z

@x
    The following matches containers based on the layer `d0e008c6cf02` or an image
    that have this layer in its layer stack.
@y
    The following matches containers based on the layer `d0e008c6cf02` or an image
    that have this layer in its layer stack.
@z

@x
    ```console
    $ docker ps --filter ancestor=d0e008c6cf02
@y
    ```console
    $ docker ps --filter ancestor=d0e008c6cf02
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    82a598284012        ubuntu:22.04        "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
    82a598284012        ubuntu:22.04        "top"               3 minutes ago        Up 3 minutes                            sleepy_bose
    ```
@z

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
    given id or name. For example, having these containers created:
@y
    The `before` filter shows only containers created before the container with
    given id or name. For example, having these containers created:
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE       COMMAND       CREATED              STATUS              PORTS              NAMES
    9c3527ed70ce        busybox     "top"         14 seconds ago       Up 15 seconds                          desperate_dubinsky
    4aace5031105        busybox     "top"         48 seconds ago       Up 49 seconds                          focused_hamilton
    6e63f6ff38b0        busybox     "top"         About a minute ago   Up About a minute                      distracted_fermat
    ```
@y
    CONTAINER ID        IMAGE       COMMAND       CREATED              STATUS              PORTS              NAMES
    9c3527ed70ce        busybox     "top"         14 seconds ago       Up 15 seconds                          desperate_dubinsky
    4aace5031105        busybox     "top"         48 seconds ago       Up 49 seconds                          focused_hamilton
    6e63f6ff38b0        busybox     "top"         About a minute ago   Up About a minute                      distracted_fermat
    ```
@z

@x
    Filtering with `before` would give:
@y
    Filtering with `before` would give:
@z

@x
    ```console
    $ docker ps -f before=9c3527ed70ce
@y
    ```console
    $ docker ps -f before=9c3527ed70ce
@z

@x
    CONTAINER ID        IMAGE       COMMAND       CREATED              STATUS              PORTS              NAMES
    4aace5031105        busybox     "top"         About a minute ago   Up About a minute                      focused_hamilton
    6e63f6ff38b0        busybox     "top"         About a minute ago   Up About a minute                      distracted_fermat
    ```
@y
    CONTAINER ID        IMAGE       COMMAND       CREATED              STATUS              PORTS              NAMES
    4aace5031105        busybox     "top"         About a minute ago   Up About a minute                      focused_hamilton
    6e63f6ff38b0        busybox     "top"         About a minute ago   Up About a minute                      distracted_fermat
    ```
@z

@x
    ##### since
@y
    ##### since
@z

@x
    The `since` filter shows only containers created since the container with given
    id or name. For example, with the same containers as in `before` filter:
@y
    The `since` filter shows only containers created since the container with given
    id or name. For example, with the same containers as in `before` filter:
@z

@x
    ```console
    $ docker ps -f since=6e63f6ff38b0
@y
    ```console
    $ docker ps -f since=6e63f6ff38b0
@z

@x
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9c3527ed70ce        busybox     "top"         10 minutes ago      Up 10 minutes                           desperate_dubinsky
    4aace5031105        busybox     "top"         10 minutes ago      Up 10 minutes                           focused_hamilton
    ```
@y
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9c3527ed70ce        busybox     "top"         10 minutes ago      Up 10 minutes                           desperate_dubinsky
    4aace5031105        busybox     "top"         10 minutes ago      Up 10 minutes                           focused_hamilton
    ```
@z

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

@x
    ```console
    $ docker ps --filter volume=remote-volume --format "table {{.ID}}\t{{.Mounts}}"
@y
    ```console
    $ docker ps --filter volume=remote-volume --format "table {{.ID}}\t{{.Mounts}}"
@z

@x
    CONTAINER ID        MOUNTS
    9c3527ed70ce        remote-volume
@y
    CONTAINER ID        MOUNTS
    9c3527ed70ce        remote-volume
@z

@x
    $ docker ps --filter volume=/data --format "table {{.ID}}\t{{.Mounts}}"
@y
    $ docker ps --filter volume=/data --format "table {{.ID}}\t{{.Mounts}}"
@z

@x
    CONTAINER ID        MOUNTS
    9c3527ed70ce        remote-volume
    ```
@y
    CONTAINER ID        MOUNTS
    9c3527ed70ce        remote-volume
    ```
@z

@x
    #### network
@y
    #### network
@z

@x
    The `network` filter shows only containers that are connected to a network with
    a given name or id.
@y
    The `network` filter shows only containers that are connected to a network with
    a given name or id.
@z

@x
    The following filter matches all containers that are connected to a network
    with a name containing `net1`.
@y
    The following filter matches all containers that are connected to a network
    with a name containing `net1`.
@z

@x
    ```console
    $ docker run -d --net=net1 --name=test1 ubuntu top
    $ docker run -d --net=net2 --name=test2 ubuntu top
@y
    ```console
    $ docker run -d --net=net1 --name=test1 ubuntu top
    $ docker run -d --net=net2 --name=test2 ubuntu top
@z

@x
    $ docker ps --filter network=net1
@y
    $ docker ps --filter network=net1
@z

@x
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9d4893ed80fe        ubuntu      "top"         10 minutes ago      Up 10 minutes                           test1
    ```
@y
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9d4893ed80fe        ubuntu      "top"         10 minutes ago      Up 10 minutes                           test1
    ```
@z

@x
    The network filter matches on both the network's name and id. The following
    example shows all containers that are attached to the `net1` network, using
    the network id as a filter;
@y
    The network filter matches on both the network's name and id. The following
    example shows all containers that are attached to the `net1` network, using
    the network id as a filter;
@z

@x
    ```console
    $ docker network inspect --format "{{.ID}}" net1
@y
    ```console
    $ docker network inspect --format "{{.ID}}" net1
@z

@x
    8c0b4110ae930dbe26b258de9bc34a03f98056ed6f27f991d32919bfe401d7c5
@y
    8c0b4110ae930dbe26b258de9bc34a03f98056ed6f27f991d32919bfe401d7c5
@z

@x
    $ docker ps --filter network=8c0b4110ae930dbe26b258de9bc34a03f98056ed6f27f991d32919bfe401d7c5
@y
    $ docker ps --filter network=8c0b4110ae930dbe26b258de9bc34a03f98056ed6f27f991d32919bfe401d7c5
@z

@x
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9d4893ed80fe        ubuntu      "top"         10 minutes ago      Up 10 minutes                           test1
    ```
@y
    CONTAINER ID        IMAGE       COMMAND       CREATED             STATUS              PORTS               NAMES
    9d4893ed80fe        ubuntu      "top"         10 minutes ago      Up 10 minutes                           test1
    ```
@z

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

@x
    ```console
    $ docker run -d --publish=80 busybox top
    $ docker run -d --expose=8080 busybox top
@y
    ```console
    $ docker run -d --publish=80 busybox top
    $ docker run -d --expose=8080 busybox top
@z

@x
    $ docker ps -a
@y
    $ docker ps -a
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                   NAMES
    9833437217a5        busybox             "top"               5 seconds ago       Up 4 seconds        8080/tcp                dreamy_mccarthy
    fc7e477723b7        busybox             "top"               50 seconds ago      Up 50 seconds       0.0.0.0:32768->80/tcp   admiring_roentgen
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                   NAMES
    9833437217a5        busybox             "top"               5 seconds ago       Up 4 seconds        8080/tcp                dreamy_mccarthy
    fc7e477723b7        busybox             "top"               50 seconds ago      Up 50 seconds       0.0.0.0:32768->80/tcp   admiring_roentgen
@z

@x
    $ docker ps --filter publish=80
@y
    $ docker ps --filter publish=80
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                   NAMES
    fc7e477723b7        busybox             "top"               About a minute ago   Up About a minute   0.0.0.0:32768->80/tcp   admiring_roentgen
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                   NAMES
    fc7e477723b7        busybox             "top"               About a minute ago   Up About a minute   0.0.0.0:32768->80/tcp   admiring_roentgen
    ```
@z

@x
    The following filter matches all containers that have exposed TCP port in the range of `8000-8080`:
@y
    The following filter matches all containers that have exposed TCP port in the range of `8000-8080`:
@z

@x
    ```console
    $ docker ps --filter expose=8000-8080/tcp
@y
    ```console
    $ docker ps --filter expose=8000-8080/tcp
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    9833437217a5        busybox             "top"               21 seconds ago      Up 19 seconds       8080/tcp            dreamy_mccarthy
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    9833437217a5        busybox             "top"               21 seconds ago      Up 19 seconds       8080/tcp            dreamy_mccarthy
    ```
@z

@x
    The following filter matches all containers that have exposed UDP port `80`:
@y
    The following filter matches all containers that have exposed UDP port `80`:
@z

@x
    ```console
    $ docker ps --filter publish=80/udp
@y
    ```console
    $ docker ps --filter publish=80/udp
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    ```
@z

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

@x
    ```console
    $ docker ps --format "{{.ID}}: {{.Command}}"
@y
    ```console
    $ docker ps --format "{{.ID}}: {{.Command}}"
@z

@x
    a87ecb4f327c: /bin/sh -c #(nop) MA
    01946d9d34d8: /bin/sh -c #(nop) MA
    c1d3b0166030: /bin/sh -c yum -y up
    41d50ecd2f57: /bin/sh -c #(nop) MA
    ```
@y
    a87ecb4f327c: /bin/sh -c #(nop) MA
    01946d9d34d8: /bin/sh -c #(nop) MA
    c1d3b0166030: /bin/sh -c yum -y up
    41d50ecd2f57: /bin/sh -c #(nop) MA
    ```
@z

@x
    To list all running containers with their labels in a table format you can use:
@y
    To list all running containers with their labels in a table format you can use:
@z

@x
    ```console
    $ docker ps --format "table {{.ID}}\t{{.Labels}}"
@y
    ```console
    $ docker ps --format "table {{.ID}}\t{{.Labels}}"
@z

@x
    CONTAINER ID        LABELS
    a87ecb4f327c        com.docker.swarm.node=ubuntu,com.docker.swarm.storage=ssd
    01946d9d34d8
    c1d3b0166030        com.docker.swarm.node=debian,com.docker.swarm.cpu=6
    41d50ecd2f57        com.docker.swarm.node=fedora,com.docker.swarm.cpu=3,com.docker.swarm.storage=ssd
    ```
@y
    CONTAINER ID        LABELS
    a87ecb4f327c        com.docker.swarm.node=ubuntu,com.docker.swarm.storage=ssd
    01946d9d34d8
    c1d3b0166030        com.docker.swarm.node=debian,com.docker.swarm.cpu=6
    41d50ecd2f57        com.docker.swarm.node=fedora,com.docker.swarm.cpu=3,com.docker.swarm.storage=ssd
    ```
@z

@x
    To list all running containers in JSON format, use the `json` directive:
@y
    To list all running containers in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker ps --format json
    {"Command":"\"/docker-entrypoint.…\"","CreatedAt":"2021-03-10 00:15:05 +0100 CET","ID":"a762a2b37a1d","Image":"nginx","Labels":"maintainer=NGINX Docker Maintainers \u003cdocker-maint@nginx.com\u003e","LocalVolumes":"0","Mounts":"","Names":"boring_keldysh","Networks":"bridge","Ports":"80/tcp","RunningFor":"4 seconds ago","Size":"0B","State":"running","Status":"Up 3 seconds"}
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker ps --format json
    {"Command":"\"/docker-entrypoint.…\"","CreatedAt":"2021-03-10 00:15:05 +0100 CET","ID":"a762a2b37a1d","Image":"nginx","Labels":"maintainer=NGINX Docker Maintainers \u003cdocker-maint@nginx.com\u003e","LocalVolumes":"0","Mounts":"","Names":"boring_keldysh","Networks":"bridge","Ports":"80/tcp","RunningFor":"4 seconds ago","Size":"0B","State":"running","Status":"Up 3 seconds"}
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
