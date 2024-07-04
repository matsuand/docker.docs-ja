%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network prune
short: Remove all unused networks
long: |-
    Remove all unused networks. Unused networks are those which are not referenced
    by any containers.
usage: docker network prune [OPTIONS]
pname: docker network
plink: docker_network.yaml
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
    ```console
    $ docker network prune
@y
command: docker network prune
short: Remove all unused networks
long: |-
    Remove all unused networks. Unused networks are those which are not referenced
    by any containers.
usage: docker network prune [OPTIONS]
pname: docker network
plink: docker_network.yaml
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
    ```console
    $ docker network prune
@z

@x
    WARNING! This will remove all custom networks not used by at least one container.
    Are you sure you want to continue? [y/N] y
    Deleted Networks:
    n1
    n2
    ```
@y
    WARNING! This will remove all custom networks not used by at least one container.
    Are you sure you want to continue? [y/N] y
    Deleted Networks:
    n1
    n2
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
    * until (`<timestamp>`) - only remove networks created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove networks with (or without, in case `label!=...` is used) the specified labels.
@y
    * until (`<timestamp>`) - only remove networks created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove networks with (or without, in case `label!=...` is used) the specified labels.
@z

@x
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp.  When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@y
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp.  When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@z

@x
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes networks with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    networks without the specified labels.
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes networks with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    networks without the specified labels.
@z

@x
    The following removes networks created more than 5 minutes ago. Note that
    system networks such as `bridge`, `host`, and `none` will never be pruned:
@y
    The following removes networks created more than 5 minutes ago. Note that
    system networks such as `bridge`, `host`, and `none` will never be pruned:
@z

@x
    ```console
    $ docker network ls
@y
    ```console
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    7430df902d7a        bridge              bridge              local
    ea92373fd499        foo-1-day-ago       bridge              local
    ab53663ed3c7        foo-1-min-ago       bridge              local
    97b91972bc3b        host                host                local
    f949d337b1f5        none                null                local
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    7430df902d7a        bridge              bridge              local
    ea92373fd499        foo-1-day-ago       bridge              local
    ab53663ed3c7        foo-1-min-ago       bridge              local
    97b91972bc3b        host                host                local
    f949d337b1f5        none                null                local
@z

@x
    $ docker network prune --force --filter until=5m
@y
    $ docker network prune --force --filter until=5m
@z

@x
    Deleted Networks:
    foo-1-day-ago
@y
    Deleted Networks:
    foo-1-day-ago
@z

@x
    $ docker network ls
@y
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    7430df902d7a        bridge              bridge              local
    ab53663ed3c7        foo-1-min-ago       bridge              local
    97b91972bc3b        host                host                local
    f949d337b1f5        none                null                local
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    7430df902d7a        bridge              bridge              local
    ab53663ed3c7        foo-1-min-ago       bridge              local
    97b91972bc3b        host                host                local
    f949d337b1f5        none                null                local
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
