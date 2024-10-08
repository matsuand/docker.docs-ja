%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service logs
short: Fetch the logs of a service or task
long: |-
    The `docker service logs` command batch-retrieves logs present at the time of execution.
@y
command: docker service logs
short: Fetch the logs of a service or task
long: |-
    The `docker service logs` command batch-retrieves logs present at the time of execution.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
    The `docker service logs` command can be used with either the name or ID of a
    service, or with the ID of a task. If a service is passed, it will display logs
    for all of the containers in that service. If a task is passed, it will only
    display logs from that particular task.
@y
    The `docker service logs` command can be used with either the name or ID of a
    service, or with the ID of a task. If a service is passed, it will display logs
    for all of the containers in that service. If a task is passed, it will only
    display logs from that particular task.
@z

@x
    > [!NOTE]
    > This command is only functional for services that are started with
    > the `json-file` or `journald` logging driver.
@y
    > [!NOTE]
    > This command is only functional for services that are started with
    > the `json-file` or `journald` logging driver.
@z

@x
    For more information about selecting and configuring logging drivers, refer to
    [Configure logging drivers](/engine/logging/configure/).
@y
    For more information about selecting and configuring logging drivers, refer to
    [Configure logging drivers](__SUBDIR__/engine/logging/configure/).
@z

@x
    The `docker service logs --follow` command will continue streaming the new output from
    the service's `STDOUT` and `STDERR`.
@y
    The `docker service logs --follow` command will continue streaming the new output from
    the service's `STDOUT` and `STDERR`.
@z

@x
    Passing a negative number or a non-integer to `--tail` is invalid and the
    value is set to `all` in that case.
@y
    Passing a negative number or a non-integer to `--tail` is invalid and the
    value is set to `all` in that case.
@z

@x
    The `docker service logs --timestamps` command will add an [RFC3339Nano timestamp](https://pkg.go.dev/time#RFC3339Nano)
    , for example `2014-09-16T06:17:46.000000000Z`, to each
    log entry. To ensure that the timestamps are aligned the
    nano-second part of the timestamp will be padded with zero when necessary.
@y
    The `docker service logs --timestamps` command will add an [RFC3339Nano timestamp](https://pkg.go.dev/time#RFC3339Nano)
    , for example `2014-09-16T06:17:46.000000000Z`, to each
    log entry. To ensure that the timestamps are aligned the
    nano-second part of the timestamp will be padded with zero when necessary.
@z

@x
    The `docker service logs --details` command will add on extra attributes, such as
    environment variables and labels, provided to `--log-opt` when creating the
    service.
@y
    The `docker service logs --details` command will add on extra attributes, such as
    environment variables and labels, provided to `--log-opt` when creating the
    service.
@z

@x
    The `--since` option shows only the service logs generated after
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
    The `--since` option shows only the service logs generated after
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
usage: docker service logs [OPTIONS] SERVICE|TASK
@y
usage: docker service logs [OPTIONS] SERVICE|TASK
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

@x no-resolve
      description: Do not map IDs to Names in output
@y
      description: Do not map IDs to Names in output
@z

@x no-task-ids
      description: Do not include task IDs in output
@y
      description: Do not include task IDs in output
@z

@x no-trunc
      description: Do not truncate output
@y
      description: Do not truncate output
@z

@x raw
      description: Do not neatly format logs
@y
      description: Do not neatly format logs
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

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
