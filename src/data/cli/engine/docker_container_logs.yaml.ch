%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container logs
aliases: docker container logs, docker logs
short: Fetch the logs of a container
long: |-
    The `docker logs` command batch-retrieves logs present at the time of execution.
@y
command: docker container logs
aliases: docker container logs, docker logs
short: Fetch the logs of a container
long: |-
    The `docker logs` command batch-retrieves logs present at the time of execution.
@z

@x
    For more information about selecting and configuring logging drivers, refer to
    [Configure logging drivers](/engine/logging/configure/).
@y
    For more information about selecting and configuring logging drivers, refer to
    [Configure logging drivers](__SUBDIR__/engine/logging/configure/).
@z

@x
    The `docker logs --follow` command will continue streaming the new output from
    the container's `STDOUT` and `STDERR`.
@y
    The `docker logs --follow` command will continue streaming the new output from
    the container's `STDOUT` and `STDERR`.
@z

@x
    Passing a negative number or a non-integer to `--tail` is invalid and the
    value is set to `all` in that case.
@y
    Passing a negative number or a non-integer to `--tail` is invalid and the
    value is set to `all` in that case.
@z

@x
    The `docker logs --timestamps` command will add an [RFC3339Nano timestamp](https://pkg.go.dev/time#RFC3339Nano)
    , for example `2014-09-16T06:17:46.000000000Z`, to each
    log entry. To ensure that the timestamps are aligned the
    nano-second part of the timestamp will be padded with zero when necessary.
@y
    The `docker logs --timestamps` command will add an [RFC3339Nano timestamp](https://pkg.go.dev/time#RFC3339Nano)
    , for example `2014-09-16T06:17:46.000000000Z`, to each
    log entry. To ensure that the timestamps are aligned the
    nano-second part of the timestamp will be padded with zero when necessary.
@z

@x
    The `docker logs --details` command will add on extra attributes, such as
    environment variables and labels, provided to `--log-opt` when creating the
    container.
@y
    The `docker logs --details` command will add on extra attributes, such as
    environment variables and labels, provided to `--log-opt` when creating the
    container.
@z

@x
    The `--since` option shows only the container logs generated after
    a given date. You can specify the date as an RFC 3339 date, a UNIX
    timestamp, or a Go duration string (e.g. `1m30s`, `3h`). Besides RFC3339 date
    format you may also use RFC3339Nano, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the client will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long. You can combine the
    `--since` option with either or both of the `--follow` or `--tail` options.
@y
    The `--since` option shows only the container logs generated after
    a given date. You can specify the date as an RFC 3339 date, a UNIX
    timestamp, or a Go duration string (e.g. `1m30s`, `3h`). Besides RFC3339 date
    format you may also use RFC3339Nano, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the client will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long. You can combine the
    `--since` option with either or both of the `--follow` or `--tail` options.
@z

@x
usage: docker container logs [OPTIONS] CONTAINER
@y
usage: docker container logs [OPTIONS] CONTAINER
@z

% options:

@x details
      description: Show extra details provided to logs
@y
      description: Show extra details provided to logs
@z

@x follow
      description: Follow log output
@y
      description: Follow log output
@z

@x since
      description: |
        Show logs since timestamp (e.g. `2013-01-02T13:23:37Z`) or relative (e.g. `42m` for 42 minutes)
@y
      description: |
        Show logs since timestamp (e.g. `2013-01-02T13:23:37Z`) or relative (e.g. `42m` for 42 minutes)
@z

@x tail
      description: Number of lines to show from the end of the logs
@y
      description: Number of lines to show from the end of the logs
@z

@x timestamps
      description: Show timestamps
@y
      description: Show timestamps
@z

@x until
      description: |
        Show logs before a timestamp (e.g. `2013-01-02T13:23:37Z`) or relative (e.g. `42m` for 42 minutes)
@y
      description: |
        Show logs before a timestamp (e.g. `2013-01-02T13:23:37Z`) or relative (e.g. `42m` for 42 minutes)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Retrieve logs until a specific point in time (--until) {#until}
@y
examples: |-
    ### Retrieve logs until a specific point in time (--until) {#until}
@z

@x
    In order to retrieve logs before a specific point in time, run:
@y
    In order to retrieve logs before a specific point in time, run:
@z

% snip command...

@x
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
