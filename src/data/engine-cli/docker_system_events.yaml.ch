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
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
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
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
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

% snip command...

@x
    **Shell 2: Start and Stop containers:**
@y
    **Shell 2: Start and Stop containers:**
@z

% snip command...

@x
    **Shell 1: (Again .. now showing events):**
@y
    **Shell 1: (Again .. now showing events):**
@z

% snip output...

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

% snip command...

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

% snip command...

@x
    ### Format the output
@y
    ### Format the output
@z

% snip command...

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

% snip command...
% snip directives...
