%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker system prune
short: Remove unused data
long: |-
    Remove all unused containers, networks, images (both dangling and unused),
    and optionally, volumes.
usage: docker system prune [OPTIONS]
@y
command: docker system prune
short: Remove unused data
long: |-
    Remove all unused containers, networks, images (both dangling and unused),
    and optionally, volumes.
usage: docker system prune [OPTIONS]
@z

% options:

@x all
      description: Remove all unused images not just dangling ones
@y
      description: Remove all unused images not just dangling ones
@z

@x filter
      description: Provide filter values (e.g. `label=<key>=<value>`)
@y
      description: Provide filter values (e.g. `label=<key>=<value>`)
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

@x volumes
      description: Prune anonymous volumes
@y
      description: Prune anonymous volumes
@z

%inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...

@x
    By default, volumes aren't removed to prevent important data from being
    deleted if there is currently no container using the volume. Use the `--volumes`
    flag when running the command to prune anonymous volumes as well:
@y
    By default, volumes aren't removed to prevent important data from being
    deleted if there is currently no container using the volume. Use the `--volumes`
    flag when running the command to prune anonymous volumes as well:
@z

% snip command...

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
    * until (`<timestamp>`) - only remove containers, images, and networks created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove containers, images, networks, and volumes with (or without, in case `label!=...` is used) the specified labels.
@y
    * until (`<timestamp>`) - only remove containers, images, and networks created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove containers, images, networks, and volumes with (or without, in case `label!=...` is used) the specified labels.
@z

@x
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings supported by [ParseDuration](https://pkg.go.dev/time#ParseDuration) (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@y
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings supported by [ParseDuration](https://pkg.go.dev/time#ParseDuration) (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@z

@x
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes containers, images, networks, and volumes with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    containers, images, networks, and volumes without the specified labels.
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes containers, images, networks, and volumes with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    containers, images, networks, and volumes without the specified labels.
@z

% snip directives...
