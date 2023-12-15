%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker service ps
short: List the tasks of one or more services
long: |-
    Lists the tasks that are running as part of the specified services.
@y
command: docker service ps
short: List the tasks of one or more services
long: |-
    Lists the tasks that are running as part of the specified services.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service ps [OPTIONS] SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
      description: Pretty-print tasks using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate output
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
      description: Only display task IDs
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
    ### List the tasks that are part of a service
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service ps [OPTIONS] SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
      description: Pretty-print tasks using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Do not truncate output
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
      description: Only display task IDs
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
    ### List the tasks that are part of a service
@z

@x
    The following command shows all the tasks that are part of the `redis` service:
@y
    The following command shows all the tasks that are part of the `redis` service:
@z

@x
    ```console
    $ docker service ps redis
@y
    ```console
    $ docker service ps redis
@z

@x
    ID             NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE          ERROR  PORTS
    0qihejybwf1x   redis.1   redis:3.0.5  manager1  Running        Running 8 seconds
    bk658fpbex0d   redis.2   redis:3.0.5  worker2   Running        Running 9 seconds
    5ls5s5fldaqg   redis.3   redis:3.0.5  worker1   Running        Running 9 seconds
    8ryt076polmc   redis.4   redis:3.0.5  worker1   Running        Running 9 seconds
    1x0v8yomsncd   redis.5   redis:3.0.5  manager1  Running        Running 8 seconds
    71v7je3el7rr   redis.6   redis:3.0.5  worker2   Running        Running 9 seconds
    4l3zm9b7tfr7   redis.7   redis:3.0.5  worker2   Running        Running 9 seconds
    9tfpyixiy2i7   redis.8   redis:3.0.5  worker1   Running        Running 9 seconds
    3w1wu13yupln   redis.9   redis:3.0.5  manager1  Running        Running 8 seconds
    8eaxrb2fqpbn   redis.10  redis:3.0.5  manager1  Running        Running 8 seconds
    ```
@y
    ID             NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE          ERROR  PORTS
    0qihejybwf1x   redis.1   redis:3.0.5  manager1  Running        Running 8 seconds
    bk658fpbex0d   redis.2   redis:3.0.5  worker2   Running        Running 9 seconds
    5ls5s5fldaqg   redis.3   redis:3.0.5  worker1   Running        Running 9 seconds
    8ryt076polmc   redis.4   redis:3.0.5  worker1   Running        Running 9 seconds
    1x0v8yomsncd   redis.5   redis:3.0.5  manager1  Running        Running 8 seconds
    71v7je3el7rr   redis.6   redis:3.0.5  worker2   Running        Running 9 seconds
    4l3zm9b7tfr7   redis.7   redis:3.0.5  worker2   Running        Running 9 seconds
    9tfpyixiy2i7   redis.8   redis:3.0.5  worker1   Running        Running 9 seconds
    3w1wu13yupln   redis.9   redis:3.0.5  manager1  Running        Running 8 seconds
    8eaxrb2fqpbn   redis.10  redis:3.0.5  manager1  Running        Running 8 seconds
    ```
@z

@x
    In addition to _running_ tasks, the output also shows the task history. For
    example, after updating the service to use the `redis:3.0.6` image, the output
    may look like this:
@y
    In addition to _running_ tasks, the output also shows the task history. For
    example, after updating the service to use the `redis:3.0.6` image, the output
    may look like this:
@z

@x
    ```console
    $ docker service ps redis
@y
    ```console
    $ docker service ps redis
@z

@x
    ID            NAME         IMAGE        NODE      DESIRED STATE  CURRENT STATE                   ERROR  PORTS
    50qe8lfnxaxk  redis.1      redis:3.0.6  manager1  Running        Running 6 seconds ago
    ky2re9oz86r9   \_ redis.1  redis:3.0.5  manager1  Shutdown       Shutdown 8 seconds ago
    3s46te2nzl4i  redis.2      redis:3.0.6  worker2   Running        Running less than a second ago
    nvjljf7rmor4   \_ redis.2  redis:3.0.6  worker2   Shutdown       Rejected 23 seconds ago        "No such image: redis@sha256:6…"
    vtiuz2fpc0yb   \_ redis.2  redis:3.0.5  worker2   Shutdown       Shutdown 1 second ago
    jnarweeha8x4  redis.3      redis:3.0.6  worker1   Running        Running 3 seconds ago
    vs448yca2nz4   \_ redis.3  redis:3.0.5  worker1   Shutdown       Shutdown 4 seconds ago
    jf1i992619ir  redis.4      redis:3.0.6  worker1   Running        Running 10 seconds ago
    blkttv7zs8ee   \_ redis.4  redis:3.0.5  worker1   Shutdown       Shutdown 11 seconds ago
    ```
@y
    ID            NAME         IMAGE        NODE      DESIRED STATE  CURRENT STATE                   ERROR  PORTS
    50qe8lfnxaxk  redis.1      redis:3.0.6  manager1  Running        Running 6 seconds ago
    ky2re9oz86r9   \_ redis.1  redis:3.0.5  manager1  Shutdown       Shutdown 8 seconds ago
    3s46te2nzl4i  redis.2      redis:3.0.6  worker2   Running        Running less than a second ago
    nvjljf7rmor4   \_ redis.2  redis:3.0.6  worker2   Shutdown       Rejected 23 seconds ago        "No such image: redis@sha256:6…"
    vtiuz2fpc0yb   \_ redis.2  redis:3.0.5  worker2   Shutdown       Shutdown 1 second ago
    jnarweeha8x4  redis.3      redis:3.0.6  worker1   Running        Running 3 seconds ago
    vs448yca2nz4   \_ redis.3  redis:3.0.5  worker1   Shutdown       Shutdown 4 seconds ago
    jf1i992619ir  redis.4      redis:3.0.6  worker1   Running        Running 10 seconds ago
    blkttv7zs8ee   \_ redis.4  redis:3.0.5  worker1   Shutdown       Shutdown 11 seconds ago
    ```
@z

@x
    The number of items in the task history is determined by the
    `--task-history-limit` option that was set when initializing the swarm. You can
    change the task history retention limit using the
    [`docker swarm update`](swarm_update.md) command.
@y
    The number of items in the task history is determined by the
    `--task-history-limit` option that was set when initializing the swarm. You can
    change the task history retention limit using the
    [`docker swarm update`](swarm_update.md) command.
@z

@x
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task ID, and error-messages, as can be seen below;
@y
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task ID, and error-messages, as can be seen below;
@z

@x
    ```console
    $ docker service ps --no-trunc redis
@y
    ```console
    $ docker service ps --no-trunc redis
@z

@x
    ID                          NAME         IMAGE                                                                                NODE      DESIRED STATE  CURRENT STATE            ERROR                                                                                           PORTS
    50qe8lfnxaxksi9w2a704wkp7   redis.1      redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  manager1  Running        Running 5 minutes ago
    ky2re9oz86r9556i2szb8a8af   \_ redis.1   redis:3.0.5@sha256:f8829e00d95672c48c60f468329d6693c4bdd28d1f057e755f8ba8b40008682e  worker2   Shutdown       Shutdown 5 minutes ago
    bk658fpbex0d57cqcwoe3jthu   redis.2      redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  worker2   Running        Running 5 seconds
    nvjljf7rmor4htv7l8rwcx7i7   \_ redis.2   redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  worker2   Shutdown       Rejected 5 minutes ago   "No such image: redis@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842"
    ```
@y
    ID                          NAME         IMAGE                                                                                NODE      DESIRED STATE  CURRENT STATE            ERROR                                                                                           PORTS
    50qe8lfnxaxksi9w2a704wkp7   redis.1      redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  manager1  Running        Running 5 minutes ago
    ky2re9oz86r9556i2szb8a8af   \_ redis.1   redis:3.0.5@sha256:f8829e00d95672c48c60f468329d6693c4bdd28d1f057e755f8ba8b40008682e  worker2   Shutdown       Shutdown 5 minutes ago
    bk658fpbex0d57cqcwoe3jthu   redis.2      redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  worker2   Running        Running 5 seconds
    nvjljf7rmor4htv7l8rwcx7i7   \_ redis.2   redis:3.0.6@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842  worker2   Shutdown       Rejected 5 minutes ago   "No such image: redis@sha256:6a692a76c2081888b589e26e6ec835743119fe453d67ecf03df7de5b73d69842"
    ```
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter. For example,
    `-f name=redis.1 -f name=redis.7` returns both `redis.1` and `redis.7` tasks.
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there
    is more than one filter, then pass multiple flags (e.g. `--filter "foo=bar" --filter "bif=baz"`).
    Multiple filter flags are combined as an `OR` filter. For example,
    `-f name=redis.1 -f name=redis.7` returns both `redis.1` and `redis.7` tasks.
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * [id](#id)
    * [name](#name)
    * [node](#node)
    * [desired-state](#desired-state)
@y
    * [id](#id)
    * [name](#name)
    * [node](#node)
    * [desired-state](#desired-state)
@z

@x
    #### id
@y
    #### id
@z

@x
    The `id` filter matches on all or a prefix of a task's ID.
@y
    The `id` filter matches on all or a prefix of a task's ID.
@z

@x
    ```console
    $ docker service ps -f "id=8" redis
@y
    ```console
    $ docker service ps -f "id=8" redis
@z

@x
    ID             NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    8ryt076polmc   redis.4   redis:3.0.6  worker1   Running        Running 9 seconds
    8eaxrb2fqpbn   redis.10  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@y
    ID             NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    8ryt076polmc   redis.4   redis:3.0.6  worker1   Running        Running 9 seconds
    8eaxrb2fqpbn   redis.10  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@z

@x
    #### name
@y
    #### name
@z

@x
    The `name` filter matches on task names.
@y
    The `name` filter matches on task names.
@z

@x
    ```console
    $ docker service ps -f "name=redis.1" redis
@y
    ```console
    $ docker service ps -f "name=redis.1" redis
@z

@x
    ID            NAME     IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    qihejybwf1x5  redis.1  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@y
    ID            NAME     IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    qihejybwf1x5  redis.1  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@z

@x
    #### node
@y
    #### node
@z

@x
    The `node` filter matches on a node name or a node ID.
@y
    The `node` filter matches on a node name or a node ID.
@z

@x
    ```console
    $ docker service ps -f "node=manager1" redis
@y
    ```console
    $ docker service ps -f "node=manager1" redis
@z

@x
    ID            NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    0qihejybwf1x  redis.1   redis:3.0.6  manager1  Running        Running 8 seconds
    1x0v8yomsncd  redis.5   redis:3.0.6  manager1  Running        Running 8 seconds
    3w1wu13yupln  redis.9   redis:3.0.6  manager1  Running        Running 8 seconds
    8eaxrb2fqpbn  redis.10  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@y
    ID            NAME      IMAGE        NODE      DESIRED STATE  CURRENT STATE      ERROR  PORTS
    0qihejybwf1x  redis.1   redis:3.0.6  manager1  Running        Running 8 seconds
    1x0v8yomsncd  redis.5   redis:3.0.6  manager1  Running        Running 8 seconds
    3w1wu13yupln  redis.9   redis:3.0.6  manager1  Running        Running 8 seconds
    8eaxrb2fqpbn  redis.10  redis:3.0.6  manager1  Running        Running 8 seconds
    ```
@z

@x
    #### desired-state
@y
    #### desired-state
@z

@x
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@y
    The `desired-state` filter can take the values `running`, `shutdown`, or `accepted`.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints tasks output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints tasks output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description                                                      |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | Task ID                                                          |
    | `.Name`         | Task name                                                        |
    | `.Image`        | Task image                                                       |
    | `.Node`         | Node ID                                                          |
    | `.DesiredState` | Desired state of the task (`running`, `shutdown`, or `accepted`) |
    | `.CurrentState` | Current state of the task                                        |
    | `.Error`        | Error                                                            |
    | `.Ports`        | Task published ports                                             |
@y
    | Placeholder     | Description                                                      |
    |-----------------|------------------------------------------------------------------|
    | `.ID`           | Task ID                                                          |
    | `.Name`         | Task name                                                        |
    | `.Image`        | Task image                                                       |
    | `.Node`         | Node ID                                                          |
    | `.DesiredState` | Desired state of the task (`running`, `shutdown`, or `accepted`) |
    | `.CurrentState` | Current state of the task                                        |
    | `.Error`        | Error                                                            |
    | `.Ports`        | Task published ports                                             |
@z

@x
    When using the `--format` option, the `service ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `service ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `Image` entries separated by a colon (`:`) for all tasks:
@y
    The following example uses a template without headers and outputs the
    `Name` and `Image` entries separated by a colon (`:`) for all tasks:
@z

@x
    ```console
    $ docker service ps --format "{{.Name}}: {{.Image}}" top
@y
    ```console
    $ docker service ps --format "{{.Name}}: {{.Image}}" top
@z

@x
    top.1: busybox
    top.2: busybox
    top.3: busybox
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    top.1: busybox
    top.2: busybox
    top.3: busybox
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
