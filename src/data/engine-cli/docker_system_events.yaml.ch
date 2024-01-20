%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker system events
aliases: docker system events, docker events
short: Get real time events from the server
long: |-
    Use `docker events` to get real-time events from the server. These events differ
    per Docker object type. Different event types have different scopes. Local
    scoped events are only seen on the node they take place on, and Swarm scoped
    events are seen on all managers.
@y
command: docker system events
aliases: docker system events, docker events
short: Get real time events from the server
long: |-
    Use `docker events` to get real-time events from the server. These events differ
    per Docker object type. Different event types have different scopes. Local
    scoped events are only seen on the node they take place on, and Swarm scoped
    events are seen on all managers.
@z

@x
    Only the last 1000 log events are returned. You can use filters to further limit
    the number of events returned.
@y
    Only the last 1000 log events are returned. You can use filters to further limit
    the number of events returned.
@z

@x
    ### Object types
@y
    ### Object types
@z

@x
    #### Containers
@y
    #### Containers
@z

@x
    Docker containers report the following events:
@y
    Docker containers report the following events:
@z

@x
    - `attach`
    - `commit`
    - `copy`
    - `create`
    - `destroy`
    - `detach`
    - `die`
    - `exec_create`
    - `exec_detach`
    - `exec_die`
    - `exec_start`
    - `export`
    - `health_status`
    - `kill`
    - `oom`
    - `pause`
    - `rename`
    - `resize`
    - `restart`
    - `start`
    - `stop`
    - `top`
    - `unpause`
    - `update`
@y
    - `attach`
    - `commit`
    - `copy`
    - `create`
    - `destroy`
    - `detach`
    - `die`
    - `exec_create`
    - `exec_detach`
    - `exec_die`
    - `exec_start`
    - `export`
    - `health_status`
    - `kill`
    - `oom`
    - `pause`
    - `rename`
    - `resize`
    - `restart`
    - `start`
    - `stop`
    - `top`
    - `unpause`
    - `update`
@z

@x
    #### Images
@y
    #### Images
@z

@x
    Docker images report the following events:
@y
    Docker images report the following events:
@z

@x
    - `delete`
    - `import`
    - `load`
    - `pull`
    - `push`
    - `save`
    - `tag`
    - `untag`
@y
    - `delete`
    - `import`
    - `load`
    - `pull`
    - `push`
    - `save`
    - `tag`
    - `untag`
@z

@x
    #### Plugins
@y
    #### Plugins
@z

@x
    Docker plugins report the following events:
@y
    Docker plugins report the following events:
@z

@x
    - `enable`
    - `disable`
    - `install`
    - `remove`
@y
    - `enable`
    - `disable`
    - `install`
    - `remove`
@z

@x
    #### Volumes
@y
    #### Volumes
@z

@x
    Docker volumes report the following events:
@y
    Docker volumes report the following events:
@z

@x
    - `create`
    - `destroy`
    - `mount`
    - `unmount`
@y
    - `create`
    - `destroy`
    - `mount`
    - `unmount`
@z

@x
    #### Networks
@y
    #### Networks
@z

@x
    Docker networks report the following events:
@y
    Docker networks report the following events:
@z

@x
    - `create`
    - `connect`
    - `destroy`
    - `disconnect`
    - `remove`
@y
    - `create`
    - `connect`
    - `destroy`
    - `disconnect`
    - `remove`
@z

@x
    #### Daemons
@y
    #### Daemons
@z

@x
    Docker daemons report the following events:
@y
    Docker daemons report the following events:
@z

@x
    - `reload`
@y
    - `reload`
@z

@x
    #### Services
@y
    #### Services
@z

@x
    Docker services report the following events:
@y
    Docker services report the following events:
@z

@x
    - `create`
    - `remove`
    - `update`
@y
    - `create`
    - `remove`
    - `update`
@z

@x
    #### Nodes
@y
    #### Nodes
@z

@x
    Docker nodes report the following events:
@y
    Docker nodes report the following events:
@z

@x
    - `create`
    - `remove`
    - `update`
@y
    - `create`
    - `remove`
    - `update`
@z

@x
    #### Secrets
@y
    #### Secrets
@z

@x
    Docker secrets report the following events:
@y
    Docker secrets report the following events:
@z

@x
    - `create`
    - `remove`
    - `update`
@y
    - `create`
    - `remove`
    - `update`
@z

@x
    #### Configs
@y
    #### Configs
@z

@x
    Docker configs report the following events:
@y
    Docker configs report the following events:
@z

@x
    - `create`
    - `remove`
    - `update`
@y
    - `create`
    - `remove`
    - `update`
@z

@x
    ### Limiting, filtering, and formatting the output
@y
    ### Limiting, filtering, and formatting the output
@z

@x
    #### Limit events by time (--since, --until) {#since}
@y
    #### Limit events by time (--since, --until) {#since}
@z

@x
    The `--since` and `--until` parameters can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the client machine’s time. If you do not provide the `--since` option,
    the command returns only new and/or live events. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02Z07:00`, and `2006-01-02`. The local
    timezone on the client will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@y
    The `--since` and `--until` parameters can be Unix timestamps, date formatted
    timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed
    relative to the client machine’s time. If you do not provide the `--since` option,
    the command returns only new and/or live events. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02Z07:00`, and `2006-01-02`. The local
    timezone on the client will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp. When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@z

@x
    Only the last 1000 log events are returned. You can use filters to further limit
    the number of events returned.
@y
    Only the last 1000 log events are returned. You can use filters to further limit
    the number of events returned.
@z

@x
    #### Filtering (--filter) {#filter}
@y
    #### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If you would
    like to use multiple filters, pass multiple flags (e.g.,
    `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If you would
    like to use multiple filters, pass multiple flags (e.g.,
    `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    Using the same filter multiple times is interpreted as a logical `OR`; for example,
    `--filter container=588a23dac085 --filter container=a8f7720b8c22` displays
    events for container `588a23dac085` or container `a8f7720b8c22`.
@y
    Using the same filter multiple times is interpreted as a logical `OR`; for example,
    `--filter container=588a23dac085 --filter container=a8f7720b8c22` displays
    events for container `588a23dac085` or container `a8f7720b8c22`.
@z

@x
    Using multiple filters is interpreted as a logical `AND`; for example,
    `--filter container=588a23dac085 --filter event=start` displays events for
    container `588a23dac085` and where the event type is `start`.
@y
    Using multiple filters is interpreted as a logical `AND`; for example,
    `--filter container=588a23dac085 --filter event=start` displays events for
    container `588a23dac085` and where the event type is `start`.
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - config (`config=<name or id>`)
    - container (`container=<name or id>`)
    - daemon (`daemon=<name or id>`)
    - event (`event=<event action>`)
    - image (`image=<repository or tag>`)
    - label (`label=<key>` or `label=<key>=<value>`)
    - network (`network=<name or id>`)
    - node (`node=<id>`)
    - plugin (`plugin=<name or id>`)
    - scope (`scope=<local or swarm>`)
    - secret (`secret=<name or id>`)
    - service (`service=<name or id>`)
    - type (`type=<container or image or volume or network or daemon or plugin or service or node or secret or config>`)
    - volume (`volume=<name>`)
@y
    - config (`config=<name or id>`)
    - container (`container=<name or id>`)
    - daemon (`daemon=<name or id>`)
    - event (`event=<event action>`)
    - image (`image=<repository or tag>`)
    - label (`label=<key>` or `label=<key>=<value>`)
    - network (`network=<name or id>`)
    - node (`node=<id>`)
    - plugin (`plugin=<name or id>`)
    - scope (`scope=<local or swarm>`)
    - secret (`secret=<name or id>`)
    - service (`service=<name or id>`)
    - type (`type=<container or image or volume or network or daemon or plugin or service or node or secret or config>`)
    - volume (`volume=<name>`)
@z

@x
    #### Format the output (--format) {#format}
@y
    #### Format the output (--format) {#format}
@z

@x
    If you specify a format (`--format`), the given template is executed
    instead of the default format. Go's [text/template](https://pkg.go.dev/text/template)
    package describes all the details of the format.
@y
    If you specify a format (`--format`), the given template is executed
    instead of the default format. Go's [text/template](https://pkg.go.dev/text/template)
    package describes all the details of the format.
@z

@x
    If a format is set to `{{json .}}`, events are streamed in the JSON Lines format.
    For information about JSON Lines, see <https://jsonlines.org/>.
usage: docker system events [OPTIONS]
pname: docker system
plink: docker_system.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
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
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: since
      value_type: string
      description: Show all events created since timestamp
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: until
      value_type: string
      description: Stream events until this timestamp
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
    ### Basic example
@y
    If a format is set to `{{json .}}`, events are streamed in the JSON Lines format.
    For information about JSON Lines, see <https://jsonlines.org/>.
usage: docker system events [OPTIONS]
pname: docker system
plink: docker_system.yaml
options:
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
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
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: since
      value_type: string
      description: Show all events created since timestamp
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: until
      value_type: string
      description: Stream events until this timestamp
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
    ### Basic example
@z

@x
    You'll need two shells for this example.
@y
    You'll need two shells for this example.
@z

@x
    **Shell 1: Listening for events:**
@y
    **Shell 1: Listening for events:**
@z

@x
    ```console
    $ docker events
    ```
@y
    ```console
    $ docker events
    ```
@z

@x
    **Shell 2: Start and Stop containers:**
@y
    **Shell 2: Start and Stop containers:**
@z

@x
    ```console
    $ docker create --name test alpine:latest top
    $ docker start test
    $ docker stop test
    ```
@y
    ```console
    $ docker create --name test alpine:latest top
    $ docker start test
    $ docker stop test
    ```
@z

@x
    **Shell 1: (Again .. now showing events):**
@y
    **Shell 1: (Again .. now showing events):**
@z

@x
    ```console
    2017-01-05T00:35:58.859401177+08:00 container create 0fdb48addc82871eb34eb23a847cfd033dedd1a0a37bef2e6d9eb3870fc7ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1f5ceda09d4300f3a846f0acfaa9a8bb0d89e775eb744c5acecd60e0529e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
    ```
@y
    ```console
    2017-01-05T00:35:58.859401177+08:00 container create 0fdb48addc82871eb34eb23a847cfd033dedd1a0a37bef2e6d9eb3870fc7ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1f5ceda09d4300f3a846f0acfaa9a8bb0d89e775eb744c5acecd60e0529e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
    ```
@z

@x
    To exit the `docker events` command, use `CTRL+C`.
@y
    To exit the `docker events` command, use `CTRL+C`.
@z

@x
    ### Filter events by time
@y
    ### Filter events by time
@z

@x
    You can filter the output by an absolute timestamp or relative time on the host
    machine, using the following different time formats:
@y
    You can filter the output by an absolute timestamp or relative time on the host
    machine, using the following different time formats:
@z

@x
    ```console
    $ docker events --since 1483283804
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@y
    ```console
    $ docker events --since 1483283804
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --since '2017-01-05'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@y
    $ docker events --since '2017-01-05'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --since '2013-09-03T15:49:29'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@y
    $ docker events --since '2013-09-03T15:49:29'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --since '10m'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@y
    $ docker events --since '10m'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:36:09.830268747+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:36:09.840186338+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:36:09.880113663+08:00 network disconnect e2e...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:09.890214053+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --since '2017-01-05T00:35:30' --until '2017-01-05T00:36:05'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    ```
@y
    $ docker events --since '2017-01-05T00:35:30' --until '2017-01-05T00:36:05'
    2017-01-05T00:35:41.241772953+08:00 volume create testVol (driver=local)
    2017-01-05T00:35:58.859401177+08:00 container create d9cd...4d70 (image=alpine:latest, name=test)
    2017-01-05T00:36:04.703631903+08:00 network connect e2e1...29e2 (container=0fdb...ff37, name=bridge, type=bridge)
    2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    ```
@z

@x
    ### Filter events by criteria
@y
    ### Filter events by criteria
@z

@x
    The following commands show several different ways to filter the `docker event`
    output.
@y
    The following commands show several different ways to filter the `docker event`
    output.
@z

@x
    ```console
    $ docker events --filter 'event=stop'
@y
    ```console
    $ docker events --filter 'event=stop'
@z

@x
    2017-01-05T00:40:22.880175420+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:41:17.888104182+08:00 container stop 2a8f...4e78 (image=alpine, name=kickass_brattain)
@y
    2017-01-05T00:40:22.880175420+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:41:17.888104182+08:00 container stop 2a8f...4e78 (image=alpine, name=kickass_brattain)
@z

@x
    $ docker events --filter 'image=alpine'
@y
    $ docker events --filter 'image=alpine'
@z

@x
    2017-01-05T00:41:55.784240236+08:00 container create d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:41:55.913156783+08:00 container start d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:42:01.106875249+08:00 container kill d9cd...4d70 (image=alpine, name=happy_meitner, signal=15)
    2017-01-05T00:42:11.111934041+08:00 container kill d9cd...4d70 (image=alpine, name=happy_meitner, signal=9)
    2017-01-05T00:42:11.119578204+08:00 container die d9cd...4d70 (exitCode=137, image=alpine, name=happy_meitner)
    2017-01-05T00:42:11.173276611+08:00 container stop d9cd...4d70 (image=alpine, name=happy_meitner)
@y
    2017-01-05T00:41:55.784240236+08:00 container create d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:41:55.913156783+08:00 container start d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:42:01.106875249+08:00 container kill d9cd...4d70 (image=alpine, name=happy_meitner, signal=15)
    2017-01-05T00:42:11.111934041+08:00 container kill d9cd...4d70 (image=alpine, name=happy_meitner, signal=9)
    2017-01-05T00:42:11.119578204+08:00 container die d9cd...4d70 (exitCode=137, image=alpine, name=happy_meitner)
    2017-01-05T00:42:11.173276611+08:00 container stop d9cd...4d70 (image=alpine, name=happy_meitner)
@z

@x
    $ docker events --filter 'container=test'
@y
    $ docker events --filter 'container=test'
@z

@x
    2017-01-05T00:43:00.139719934+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:43:09.259951086+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:43:09.270102715+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:43:09.312556440+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@y
    2017-01-05T00:43:00.139719934+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:43:09.259951086+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=15)
    2017-01-05T00:43:09.270102715+08:00 container die 0fdb...ff37 (exitCode=143, image=alpine:latest, name=test)
    2017-01-05T00:43:09.312556440+08:00 container stop 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --filter 'container=test' --filter 'container=d9cdb1525ea8'
@y
    $ docker events --filter 'container=test' --filter 'container=d9cdb1525ea8'
@z

@x
    2017-01-05T00:44:11.517071981+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:44:17.685870901+08:00 container start d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:44:29.757658470+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=9)
    2017-01-05T00:44:29.767718510+08:00 container die 0fdb...ff37 (exitCode=137, image=alpine:latest, name=test)
    2017-01-05T00:44:29.815798344+08:00 container destroy 0fdb...ff37 (image=alpine:latest, name=test)
@y
    2017-01-05T00:44:11.517071981+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)
    2017-01-05T00:44:17.685870901+08:00 container start d9cd...4d70 (image=alpine, name=happy_meitner)
    2017-01-05T00:44:29.757658470+08:00 container kill 0fdb...ff37 (image=alpine:latest, name=test, signal=9)
    2017-01-05T00:44:29.767718510+08:00 container die 0fdb...ff37 (exitCode=137, image=alpine:latest, name=test)
    2017-01-05T00:44:29.815798344+08:00 container destroy 0fdb...ff37 (image=alpine:latest, name=test)
@z

@x
    $ docker events --filter 'container=test' --filter 'event=stop'
@y
    $ docker events --filter 'container=test' --filter 'event=stop'
@z

@x
    2017-01-05T00:46:13.664099505+08:00 container stop a9d1...e130 (image=alpine, name=test)
@y
    2017-01-05T00:46:13.664099505+08:00 container stop a9d1...e130 (image=alpine, name=test)
@z

@x
    $ docker events --filter 'type=volume'
@y
    $ docker events --filter 'type=volume'
@z

@x
    2015-12-23T21:05:28.136212689Z volume create test-event-volume-local (driver=local)
    2015-12-23T21:05:28.383462717Z volume mount test-event-volume-local (read/write=true, container=562f...5025, destination=/foo, driver=local, propagation=rprivate)
    2015-12-23T21:05:28.650314265Z volume unmount test-event-volume-local (container=562f...5025, driver=local)
    2015-12-23T21:05:28.716218405Z volume destroy test-event-volume-local (driver=local)
@y
    2015-12-23T21:05:28.136212689Z volume create test-event-volume-local (driver=local)
    2015-12-23T21:05:28.383462717Z volume mount test-event-volume-local (read/write=true, container=562f...5025, destination=/foo, driver=local, propagation=rprivate)
    2015-12-23T21:05:28.650314265Z volume unmount test-event-volume-local (container=562f...5025, driver=local)
    2015-12-23T21:05:28.716218405Z volume destroy test-event-volume-local (driver=local)
@z

@x
    $ docker events --filter 'type=network'
@y
    $ docker events --filter 'type=network'
@z

@x
    2015-12-23T21:38:24.705709133Z network create 8b11...2c5b (name=test-event-network-local, type=bridge)
    2015-12-23T21:38:25.119625123Z network connect 8b11...2c5b (name=test-event-network-local, container=b4be...c54e, type=bridge)
@y
    2015-12-23T21:38:24.705709133Z network create 8b11...2c5b (name=test-event-network-local, type=bridge)
    2015-12-23T21:38:25.119625123Z network connect 8b11...2c5b (name=test-event-network-local, container=b4be...c54e, type=bridge)
@z

@x
    $ docker events --filter 'container=container_1' --filter 'container=container_2'
@y
    $ docker events --filter 'container=container_1' --filter 'container=container_2'
@z

@x
    2014-09-03T15:49:29.999999999Z07:00 container die 4386fb97867d (image=ubuntu:22.04)
    2014-05-10T17:42:14.999999999Z07:00 container stop 4386fb97867d (image=ubuntu:22.04)
    2014-05-10T17:42:14.999999999Z07:00 container die 7805c1d35632 (imager=redis:2.8)
    2014-09-03T15:49:29.999999999Z07:00 container stop 7805c1d35632 (image=redis:2.8)
@y
    2014-09-03T15:49:29.999999999Z07:00 container die 4386fb97867d (image=ubuntu:22.04)
    2014-05-10T17:42:14.999999999Z07:00 container stop 4386fb97867d (image=ubuntu:22.04)
    2014-05-10T17:42:14.999999999Z07:00 container die 7805c1d35632 (imager=redis:2.8)
    2014-09-03T15:49:29.999999999Z07:00 container stop 7805c1d35632 (image=redis:2.8)
@z

@x
    $ docker events --filter 'type=volume'
@y
    $ docker events --filter 'type=volume'
@z

@x
    2015-12-23T21:05:28.136212689Z volume create test-event-volume-local (driver=local)
    2015-12-23T21:05:28.383462717Z volume mount test-event-volume-local (read/write=true, container=562fe10671e9273da25eed36cdce26159085ac7ee6707105fd534866340a5025, destination=/foo, driver=local, propagation=rprivate)
    2015-12-23T21:05:28.650314265Z volume unmount test-event-volume-local (container=562fe10671e9273da25eed36cdce26159085ac7ee6707105fd534866340a5025, driver=local)
    2015-12-23T21:05:28.716218405Z volume destroy test-event-volume-local (driver=local)
@y
    2015-12-23T21:05:28.136212689Z volume create test-event-volume-local (driver=local)
    2015-12-23T21:05:28.383462717Z volume mount test-event-volume-local (read/write=true, container=562fe10671e9273da25eed36cdce26159085ac7ee6707105fd534866340a5025, destination=/foo, driver=local, propagation=rprivate)
    2015-12-23T21:05:28.650314265Z volume unmount test-event-volume-local (container=562fe10671e9273da25eed36cdce26159085ac7ee6707105fd534866340a5025, driver=local)
    2015-12-23T21:05:28.716218405Z volume destroy test-event-volume-local (driver=local)
@z

@x
    $ docker events --filter 'type=network'
@y
    $ docker events --filter 'type=network'
@z

@x
    2015-12-23T21:38:24.705709133Z network create 8b111217944ba0ba844a65b13efcd57dc494932ee2527577758f939315ba2c5b (name=test-event-network-local, type=bridge)
    2015-12-23T21:38:25.119625123Z network connect 8b111217944ba0ba844a65b13efcd57dc494932ee2527577758f939315ba2c5b (name=test-event-network-local, container=b4be644031a3d90b400f88ab3d4bdf4dc23adb250e696b6328b85441abe2c54e, type=bridge)
@y
    2015-12-23T21:38:24.705709133Z network create 8b111217944ba0ba844a65b13efcd57dc494932ee2527577758f939315ba2c5b (name=test-event-network-local, type=bridge)
    2015-12-23T21:38:25.119625123Z network connect 8b111217944ba0ba844a65b13efcd57dc494932ee2527577758f939315ba2c5b (name=test-event-network-local, container=b4be644031a3d90b400f88ab3d4bdf4dc23adb250e696b6328b85441abe2c54e, type=bridge)
@z

@x
    $ docker events --filter 'type=plugin'
@y
    $ docker events --filter 'type=plugin'
@z

@x
    2016-07-25T17:30:14.825557616Z plugin pull ec7b87f2ce84330fe076e666f17dfc049d2d7ae0b8190763de94e1f2d105993f (name=tiborvass/sample-volume-plugin:latest)
    2016-07-25T17:30:14.888127370Z plugin enable ec7b87f2ce84330fe076e666f17dfc049d2d7ae0b8190763de94e1f2d105993f (name=tiborvass/sample-volume-plugin:latest)
@y
    2016-07-25T17:30:14.825557616Z plugin pull ec7b87f2ce84330fe076e666f17dfc049d2d7ae0b8190763de94e1f2d105993f (name=tiborvass/sample-volume-plugin:latest)
    2016-07-25T17:30:14.888127370Z plugin enable ec7b87f2ce84330fe076e666f17dfc049d2d7ae0b8190763de94e1f2d105993f (name=tiborvass/sample-volume-plugin:latest)
@z

@x
    $ docker events -f type=service
@y
    $ docker events -f type=service
@z

@x
    2017-07-12T06:34:07.999446625Z service create wj64st89fzgchxnhiqpn8p4oj (name=reverent_albattani)
    2017-07-12T06:34:21.405496207Z service remove wj64st89fzgchxnhiqpn8p4oj (name=reverent_albattani)
@y
    2017-07-12T06:34:07.999446625Z service create wj64st89fzgchxnhiqpn8p4oj (name=reverent_albattani)
    2017-07-12T06:34:21.405496207Z service remove wj64st89fzgchxnhiqpn8p4oj (name=reverent_albattani)
@z

@x
    $ docker events -f type=node
@y
    $ docker events -f type=node
@z

@x
    2017-07-12T06:21:51.951586759Z node update 3xyz5ttp1a253q74z1thwywk9 (name=ip-172-31-23-42, state.new=ready, state.old=unknown)
@y
    2017-07-12T06:21:51.951586759Z node update 3xyz5ttp1a253q74z1thwywk9 (name=ip-172-31-23-42, state.new=ready, state.old=unknown)
@z

@x
    $ docker events -f type=secret
@y
    $ docker events -f type=secret
@z

@x
    2017-07-12T06:32:13.915704367Z secret create s8o6tmlnndrgzbmdilyy5ymju (name=new_secret)
    2017-07-12T06:32:37.052647783Z secret remove s8o6tmlnndrgzbmdilyy5ymju (name=new_secret)
@y
    2017-07-12T06:32:13.915704367Z secret create s8o6tmlnndrgzbmdilyy5ymju (name=new_secret)
    2017-07-12T06:32:37.052647783Z secret remove s8o6tmlnndrgzbmdilyy5ymju (name=new_secret)
@z

@x
    $  docker events -f type=config
    2017-07-12T06:44:13.349037127Z config create u96zlvzdfsyb9sg4mhyxfh3rl (name=abc)
    2017-07-12T06:44:36.327694184Z config remove u96zlvzdfsyb9sg4mhyxfh3rl (name=abc)
@y
    $  docker events -f type=config
    2017-07-12T06:44:13.349037127Z config create u96zlvzdfsyb9sg4mhyxfh3rl (name=abc)
    2017-07-12T06:44:36.327694184Z config remove u96zlvzdfsyb9sg4mhyxfh3rl (name=abc)
@z

@x
    $ docker events --filter 'scope=swarm'
@y
    $ docker events --filter 'scope=swarm'
@z

@x
    2017-07-10T07:46:50.250024503Z service create m8qcxu8081woyof7w3jaax6gk (name=affectionate_wilson)
    2017-07-10T07:47:31.093797134Z secret create 6g5pufzsv438p9tbvl9j94od4 (name=new_secret)
    ```
@y
    2017-07-10T07:46:50.250024503Z service create m8qcxu8081woyof7w3jaax6gk (name=affectionate_wilson)
    2017-07-10T07:47:31.093797134Z secret create 6g5pufzsv438p9tbvl9j94od4 (name=new_secret)
    ```
@z

@x
    ### Format the output
@y
    ### Format the output
@z

@x
    ```console
    $ docker events --filter 'type=container' --format 'Type={{.Type}}  Status={{.Status}}  ID={{.ID}}'
@y
    ```console
    $ docker events --filter 'type=container' --format 'Type={{.Type}}  Status={{.Status}}  ID={{.ID}}'
@z

@x
    Type=container  Status=create  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=attach  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=start  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=resize  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=die  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=destroy  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    ```
@y
    Type=container  Status=create  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=attach  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=start  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=resize  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=die  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    Type=container  Status=destroy  ID=2ee349dac409e97974ce8d01b70d250b85e0ba8189299c126a87812311951e26
    ```
@z

@x
    #### Format as JSON
@y
    #### Format as JSON
@z

@x
    To list events in JSON format, use the `json` directive, which is the same
    `--format '{{ json . }}`.
@y
    To list events in JSON format, use the `json` directive, which is the same
    `--format '{{ json . }}`.
@z

@x
    ```console
    $ docker events --format json
@y
    ```console
    $ docker events --format json
@z

@x
    {"status":"create","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    {"status":"attach","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    {"Type":"network","Action":"connect","Actor":{"ID":"1b50a5bf755f6021dfa78e..
    {"status":"start","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f42..
    {"status":"resize","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    {"status":"create","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    {"status":"attach","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    {"Type":"network","Action":"connect","Actor":{"ID":"1b50a5bf755f6021dfa78e..
    {"status":"start","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f42..
    {"status":"resize","id":"196016a57679bf42424484918746a9474cd905dd993c4d0f4..
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
