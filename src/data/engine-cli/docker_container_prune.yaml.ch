%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container prune
short: Remove all stopped containers
long: Removes all stopped containers.
usage: docker container prune [OPTIONS]
pname: docker container
plink: docker_container.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `until=<timestamp>`)
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ### Prune containers
@y
command: docker container prune
short: Remove all stopped containers
long: Removes all stopped containers.
usage: docker container prune [OPTIONS]
pname: docker container
plink: docker_container.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `until=<timestamp>`)
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ### Prune containers
@z

@x
    ```console
    $ docker container prune
    WARNING! This will remove all stopped containers.
    Are you sure you want to continue? [y/N] y
    Deleted Containers:
    4a7f7eebae0f63178aff7eb0aa39cd3f0627a203ab2df258c1a00b456cf20063
    f98f9c2aa1eaf727e4ec9c0283bc7d4aa4762fbdba7f26191f26c97f64090360
@y
    ```console
    $ docker container prune
    WARNING! This will remove all stopped containers.
    Are you sure you want to continue? [y/N] y
    Deleted Containers:
    4a7f7eebae0f63178aff7eb0aa39cd3f0627a203ab2df258c1a00b456cf20063
    f98f9c2aa1eaf727e4ec9c0283bc7d4aa4762fbdba7f26191f26c97f64090360
@z

@x
    Total reclaimed space: 212 B
    ```
@y
    Total reclaimed space: 212 B
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * until (`<timestamp>`) - only remove containers created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove containers with (or without, in case `label!=...` is used) the specified labels.
@y
    * until (`<timestamp>`) - only remove containers created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove containers with (or without, in case `label!=...` is used) the specified labels.
@z

@x
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02Z07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@y
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02Z07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@z

@x
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes containers with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    containers without the specified labels.
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes containers with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    containers without the specified labels.
@z

@x
    The following removes containers created more than 5 minutes ago:
@y
    The following removes containers created more than 5 minutes ago:
@z

@x
    ```console
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@y
    ```console
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    61b9efa71024        busybox             "sh"                2017-01-04 13:23:33 -0800 PST   Exited (0) 41 seconds ago
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 12 minutes ago
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    61b9efa71024        busybox             "sh"                2017-01-04 13:23:33 -0800 PST   Exited (0) 41 seconds ago
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 12 minutes ago
@z

@x
    $ docker container prune --force --filter "until=5m"
@y
    $ docker container prune --force --filter "until=5m"
@z

@x
    Deleted Containers:
    53a9bc23a5168b6caa2bfbefddf1b30f93c7ad57f3dec271fd32707497cb9369
@y
    Deleted Containers:
    53a9bc23a5168b6caa2bfbefddf1b30f93c7ad57f3dec271fd32707497cb9369
@z

@x
    Total reclaimed space: 25 B
@y
    Total reclaimed space: 25 B
@z

@x
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@y
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    61b9efa71024        busybox             "sh"                2017-01-04 13:23:33 -0800 PST   Exited (0) 44 seconds ago
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    61b9efa71024        busybox             "sh"                2017-01-04 13:23:33 -0800 PST   Exited (0) 44 seconds ago
    ```
@z

@x
    The following removes containers created before `2017-01-04T13:10:00`:
@y
    The following removes containers created before `2017-01-04T13:10:00`:
@z

@x
    ```console
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@y
    ```console
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 7 minutes ago
    4a75091a6d61        busybox             "sh"                2017-01-04 13:09:53 -0800 PST   Exited (0) 9 minutes ago
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 7 minutes ago
    4a75091a6d61        busybox             "sh"                2017-01-04 13:09:53 -0800 PST   Exited (0) 9 minutes ago
@z

@x
    $ docker container prune --force --filter "until=2017-01-04T13:10:00"
@y
    $ docker container prune --force --filter "until=2017-01-04T13:10:00"
@z

@x
    Deleted Containers:
    4a75091a6d618526fcd8b33ccd6e5928ca2a64415466f768a6180004b0c72c6c
@y
    Deleted Containers:
    4a75091a6d618526fcd8b33ccd6e5928ca2a64415466f768a6180004b0c72c6c
@z

@x
    Total reclaimed space: 27 B
@y
    Total reclaimed space: 27 B
@z

@x
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@y
    $ docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}'
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 9 minutes ago
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED AT                      STATUS
    53a9bc23a516        busybox             "sh"                2017-01-04 13:11:59 -0800 PST   Exited (0) 9 minutes ago
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
