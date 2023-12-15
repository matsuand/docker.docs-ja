%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker stack ps
short: List the tasks in the stack
long: |-
    Lists the tasks that are running as part of the specified stack.
@y
command: docker stack ps
short: List the tasks in the stack
long: |-
    Lists the tasks that are running as part of the specified stack.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack ps [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
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
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      details_url: '#no-resolve'
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
      description: Only display task IDs
      details_url: '#quiet'
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List the tasks that are part of a stack
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack ps [OPTIONS] STACK
pname: docker stack
plink: docker_stack.yaml
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
    - option: no-resolve
      value_type: bool
      default_value: "false"
      description: Do not map IDs to Names
      details_url: '#no-resolve'
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
      description: Only display task IDs
      details_url: '#quiet'
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List the tasks that are part of a stack
@z

@x
    The following command shows all the tasks that are part of the `voting` stack:
@y
    The following command shows all the tasks that are part of the `voting` stack:
@z

@x
    ```console
    $ docker stack ps voting
@y
    ```console
    $ docker stack ps voting
@z

@x
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE          ERROR  PORTS
    xim5bcqtgk1b        voting_worker.1       dockersamples/examplevotingapp_worker:latest   node2  Running        Running 2 minutes ago
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 2 minutes ago
    rx5yo0866nfx        voting_vote.1         dockersamples/examplevotingapp_vote:before     node3  Running        Running 2 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 2 minutes ago
    w48spazhbmxc        voting_redis.1        redis:alpine                                   node2  Running        Running 3 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 2 minutes ago
    kqgdmededccb        voting_vote.2         dockersamples/examplevotingapp_vote:before     node2  Running        Running 2 minutes ago
    t72q3z038jeh        voting_redis.2        redis:alpine                                   node3  Running        Running 3 minutes ago
    ```
@y
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE          ERROR  PORTS
    xim5bcqtgk1b        voting_worker.1       dockersamples/examplevotingapp_worker:latest   node2  Running        Running 2 minutes ago
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 2 minutes ago
    rx5yo0866nfx        voting_vote.1         dockersamples/examplevotingapp_vote:before     node3  Running        Running 2 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 2 minutes ago
    w48spazhbmxc        voting_redis.1        redis:alpine                                   node2  Running        Running 3 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 2 minutes ago
    kqgdmededccb        voting_vote.2         dockersamples/examplevotingapp_vote:before     node2  Running        Running 2 minutes ago
    t72q3z038jeh        voting_redis.2        redis:alpine                                   node3  Running        Running 3 minutes ago
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
    $ docker stack ps -f "id=t" voting
@y
    ```console
    $ docker stack ps -f "id=t" voting
@z

@x
    ID                  NAME                IMAGE               NODE         DESIRED STATE       CURRENTSTATE            ERROR  PORTS
    tz6j82jnwrx7        voting_db.1         postgres:9.4        node1        Running             Running 14 minutes ago
    t72q3z038jeh        voting_redis.2      redis:alpine        node3        Running             Running 14 minutes ago
    ```
@y
    ID                  NAME                IMAGE               NODE         DESIRED STATE       CURRENTSTATE            ERROR  PORTS
    tz6j82jnwrx7        voting_db.1         postgres:9.4        node1        Running             Running 14 minutes ago
    t72q3z038jeh        voting_redis.2      redis:alpine        node3        Running             Running 14 minutes ago
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
    $ docker stack ps -f "name=voting_redis" voting
@y
    ```console
    $ docker stack ps -f "name=voting_redis" voting
@z

@x
    ID                  NAME                IMAGE               NODE         DESIRED STATE       CURRENTSTATE            ERROR  PORTS
    w48spazhbmxc        voting_redis.1      redis:alpine        node2        Running             Running 17 minutes ago
    t72q3z038jeh        voting_redis.2      redis:alpine        node3        Running             Running 17 minutes ago
    ```
@y
    ID                  NAME                IMAGE               NODE         DESIRED STATE       CURRENTSTATE            ERROR  PORTS
    w48spazhbmxc        voting_redis.1      redis:alpine        node2        Running             Running 17 minutes ago
    t72q3z038jeh        voting_redis.2      redis:alpine        node3        Running             Running 17 minutes ago
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
    $ docker stack ps -f "node=node1" voting
@y
    ```console
    $ docker stack ps -f "node=node1" voting
@z

@x
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE          ERROR  PORTS
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 18 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 18 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 18 minutes ago
    ```
@y
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE          ERROR  PORTS
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 18 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 18 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 18 minutes ago
    ```
@z

@x
    #### desired-state
@y
    #### desired-state
@z

@x
    The `desired-state` filter can take the values `running`, `shutdown`, `ready` or `accepted`.
@y
    The `desired-state` filter can take the values `running`, `shutdown`, `ready` or `accepted`.
@z

@x
    ```console
    $ docker stack ps -f "desired-state=running" voting
@y
    ```console
    $ docker stack ps -f "desired-state=running" voting
@z

@x
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE           ERROR  PORTS
    xim5bcqtgk1b        voting_worker.1       dockersamples/examplevotingapp_worker:latest   node2  Running        Running 21 minutes ago
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 21 minutes ago
    rx5yo0866nfx        voting_vote.1         dockersamples/examplevotingapp_vote:before     node3  Running        Running 21 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 21 minutes ago
    w48spazhbmxc        voting_redis.1        redis:alpine                                   node2  Running        Running 21 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 21 minutes ago
    kqgdmededccb        voting_vote.2         dockersamples/examplevotingapp_vote:before     node2  Running        Running 21 minutes ago
    t72q3z038jeh        voting_redis.2        redis:alpine                                   node3  Running        Running 21 minutes ago
    ```
@y
    ID                  NAME                  IMAGE                                          NODE   DESIRED STATE  CURRENT STATE           ERROR  PORTS
    xim5bcqtgk1b        voting_worker.1       dockersamples/examplevotingapp_worker:latest   node2  Running        Running 21 minutes ago
    q7yik0ks1in6        voting_result.1       dockersamples/examplevotingapp_result:before   node1  Running        Running 21 minutes ago
    rx5yo0866nfx        voting_vote.1         dockersamples/examplevotingapp_vote:before     node3  Running        Running 21 minutes ago
    tz6j82jnwrx7        voting_db.1           postgres:9.4                                   node1  Running        Running 21 minutes ago
    w48spazhbmxc        voting_redis.1        redis:alpine                                   node2  Running        Running 21 minutes ago
    6jj1m02freg1        voting_visualizer.1   dockersamples/visualizer:stable                node1  Running        Running 21 minutes ago
    kqgdmededccb        voting_vote.2         dockersamples/examplevotingapp_vote:before     node2  Running        Running 21 minutes ago
    t72q3z038jeh        voting_redis.2        redis:alpine                                   node3  Running        Running 21 minutes ago
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints tasks output using a Go template.
@y
    The formatting options (`--format`) pretty-prints tasks output using a Go template.
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
    When using the `--format` option, the `stack ps` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `stack ps` command will either
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
    $ docker stack ps --format "{{.Name}}: {{.Image}}" voting
@y
    ```console
    $ docker stack ps --format "{{.Name}}: {{.Image}}" voting
@z

@x
    voting_worker.1: dockersamples/examplevotingapp_worker:latest
    voting_result.1: dockersamples/examplevotingapp_result:before
    voting_vote.1: dockersamples/examplevotingapp_vote:before
    voting_db.1: postgres:9.4
    voting_redis.1: redis:alpine
    voting_visualizer.1: dockersamples/visualizer:stable
    voting_vote.2: dockersamples/examplevotingapp_vote:before
    voting_redis.2: redis:alpine
    ```
@y
    voting_worker.1: dockersamples/examplevotingapp_worker:latest
    voting_result.1: dockersamples/examplevotingapp_result:before
    voting_vote.1: dockersamples/examplevotingapp_vote:before
    voting_db.1: postgres:9.4
    voting_redis.1: redis:alpine
    voting_visualizer.1: dockersamples/visualizer:stable
    voting_vote.2: dockersamples/examplevotingapp_vote:before
    voting_redis.2: redis:alpine
    ```
@z

@x
    To list all tasks in JSON format, use the `json` directive:
    ```console
    $ docker stack ps --format json myapp
    {"CurrentState":"Preparing 23 seconds ago","DesiredState":"Running","Error":"","ID":"2ufjubh79tn0","Image":"localstack/localstack:latest","Name":"myapp_localstack.1","Node":"docker-desktop","Ports":""}
    {"CurrentState":"Running 20 seconds ago","DesiredState":"Running","Error":"","ID":"roee387ngf5r","Image":"redis:6.0.9-alpine3.12","Name":"myapp_redis.1","Node":"docker-desktop","Ports":""}
    {"CurrentState":"Preparing 13 seconds ago","DesiredState":"Running","Error":"","ID":"yte68ouq7glh","Image":"postgres:13.2-alpine","Name":"myapp_repos-db.1","Node":"docker-desktop","Ports":""}
    ```
@y
    To list all tasks in JSON format, use the `json` directive:
    ```console
    $ docker stack ps --format json myapp
    {"CurrentState":"Preparing 23 seconds ago","DesiredState":"Running","Error":"","ID":"2ufjubh79tn0","Image":"localstack/localstack:latest","Name":"myapp_localstack.1","Node":"docker-desktop","Ports":""}
    {"CurrentState":"Running 20 seconds ago","DesiredState":"Running","Error":"","ID":"roee387ngf5r","Image":"redis:6.0.9-alpine3.12","Name":"myapp_redis.1","Node":"docker-desktop","Ports":""}
    {"CurrentState":"Preparing 13 seconds ago","DesiredState":"Running","Error":"","ID":"yte68ouq7glh","Image":"postgres:13.2-alpine","Name":"myapp_repos-db.1","Node":"docker-desktop","Ports":""}
    ```
@z

@x
    ### Do not map IDs to Names (--no-resolve) {#no-resolve}
@y
    ### Do not map IDs to Names (--no-resolve) {#no-resolve}
@z

@x
    The `--no-resolve` option shows IDs for task name, without mapping IDs to Names.
@y
    The `--no-resolve` option shows IDs for task name, without mapping IDs to Names.
@z

@x
    ```console
    $ docker stack ps --no-resolve voting
@y
    ```console
    $ docker stack ps --no-resolve voting
@z

@x
    ID                  NAME                          IMAGE                                          NODE                        DESIRED STATE  CURRENT STATE            ERROR  PORTS
    xim5bcqtgk1b        10z9fjfqzsxnezo4hb81p8mqg.1   dockersamples/examplevotingapp_worker:latest   qaqt4nrzo775jrx6detglho01   Running        Running 30 minutes ago
    q7yik0ks1in6        hbxltua1na7mgqjnidldv5m65.1   dockersamples/examplevotingapp_result:before   mxpaef1tlh23s052erw88a4w5   Running        Running 30 minutes ago
    rx5yo0866nfx        qyprtqw1g5nrki557i974ou1d.1   dockersamples/examplevotingapp_vote:before     kanqcxfajd1r16wlnqcblobmm   Running        Running 31 minutes ago
    tz6j82jnwrx7        122f0xxngg17z52be7xspa72x.1   postgres:9.4                                   mxpaef1tlh23s052erw88a4w5   Running        Running 31 minutes ago
    w48spazhbmxc        tg61x8myx563ueo3urmn1ic6m.1   redis:alpine                                   qaqt4nrzo775jrx6detglho01   Running        Running 31 minutes ago
    6jj1m02freg1        8cqlyi444kzd3panjb7edh26v.1   dockersamples/visualizer:stable                mxpaef1tlh23s052erw88a4w5   Running        Running 31 minutes ago
    kqgdmededccb        qyprtqw1g5nrki557i974ou1d.2   dockersamples/examplevotingapp_vote:before     qaqt4nrzo775jrx6detglho01   Running        Running 31 minutes ago
    t72q3z038jeh        tg61x8myx563ueo3urmn1ic6m.2   redis:alpine                                   kanqcxfajd1r16wlnqcblobmm   Running        Running 31 minutes ago
    ```
@y
    ID                  NAME                          IMAGE                                          NODE                        DESIRED STATE  CURRENT STATE            ERROR  PORTS
    xim5bcqtgk1b        10z9fjfqzsxnezo4hb81p8mqg.1   dockersamples/examplevotingapp_worker:latest   qaqt4nrzo775jrx6detglho01   Running        Running 30 minutes ago
    q7yik0ks1in6        hbxltua1na7mgqjnidldv5m65.1   dockersamples/examplevotingapp_result:before   mxpaef1tlh23s052erw88a4w5   Running        Running 30 minutes ago
    rx5yo0866nfx        qyprtqw1g5nrki557i974ou1d.1   dockersamples/examplevotingapp_vote:before     kanqcxfajd1r16wlnqcblobmm   Running        Running 31 minutes ago
    tz6j82jnwrx7        122f0xxngg17z52be7xspa72x.1   postgres:9.4                                   mxpaef1tlh23s052erw88a4w5   Running        Running 31 minutes ago
    w48spazhbmxc        tg61x8myx563ueo3urmn1ic6m.1   redis:alpine                                   qaqt4nrzo775jrx6detglho01   Running        Running 31 minutes ago
    6jj1m02freg1        8cqlyi444kzd3panjb7edh26v.1   dockersamples/visualizer:stable                mxpaef1tlh23s052erw88a4w5   Running        Running 31 minutes ago
    kqgdmededccb        qyprtqw1g5nrki557i974ou1d.2   dockersamples/examplevotingapp_vote:before     qaqt4nrzo775jrx6detglho01   Running        Running 31 minutes ago
    t72q3z038jeh        tg61x8myx563ueo3urmn1ic6m.2   redis:alpine                                   kanqcxfajd1r16wlnqcblobmm   Running        Running 31 minutes ago
    ```
@z

@x
    ### Do not truncate output (--no-trunc) {#no-trunc}
@y
    ### Do not truncate output (--no-trunc) {#no-trunc}
@z

@x
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task IDs, and error-messages, as can be seen below:
@y
    When deploying a service, docker resolves the digest for the service's
    image, and pins the service to that digest. The digest is not shown by
    default, but is printed if `--no-trunc` is used. The `--no-trunc` option
    also shows the non-truncated task IDs, and error-messages, as can be seen below:
@z

@x
    ```console
    $ docker stack ps --no-trunc voting
@y
    ```console
    $ docker stack ps --no-trunc voting
@z

@x
    ID                          NAME                  IMAGE                                                                                                                 NODE   DESIRED STATE  CURREN STATE           ERROR  PORTS
    xim5bcqtgk1bxqz91jzo4a1s5   voting_worker.1       dockersamples/examplevotingapp_worker:latest@sha256:3e4ddf59c15f432280a2c0679c4fc5a2ee5a797023c8ef0d3baf7b1385e9fed   node2  Running        Runnin 32 minutes ago
    q7yik0ks1in6kv32gg6y6yjf7   voting_result.1       dockersamples/examplevotingapp_result:before@sha256:83b56996e930c292a6ae5187fda84dd6568a19d97cdb933720be15c757b7463   node1  Running        Runnin 32 minutes ago
    rx5yo0866nfxc58zf4irsss6n   voting_vote.1         dockersamples/examplevotingapp_vote:before@sha256:8e64b182c87de902f2b72321c89b4af4e2b942d76d0b772532ff27ec4c6ebf6     node3  Running        Runnin 32 minutes ago
    tz6j82jnwrx7n2offljp3mn03   voting_db.1           postgres:9.4@sha256:6046af499eae34d2074c0b53f9a8b404716d415e4a03e68bc1d2f8064f2b027                                   node1  Running        Runnin 32 minutes ago
    w48spazhbmxcmbjfi54gs7x90   voting_redis.1        redis:alpine@sha256:9cd405cd1ec1410eaab064a1383d0d8854d1ef74a54e1e4a92fb4ec7bdc3ee7                                   node2  Running        Runnin 32 minutes ago
    6jj1m02freg1n3z9n1evrzsbl   voting_visualizer.1   dockersamples/visualizer:stable@sha256:f924ad66c8e94b10baaf7bdb9cd491ef4e982a1d048a56a17e02bf5945401e5                node1  Running        Runnin 32 minutes ago
    kqgdmededccbhz2wuc0e9hx7g   voting_vote.2         dockersamples/examplevotingapp_vote:before@sha256:8e64b182c87de902f2b72321c89b4af4e2b942d76d0b772532ff27ec4c6ebf6     node2  Running        Runnin 32 minutes ago
    t72q3z038jehe1wbh9gdum076   voting_redis.2        redis:alpine@sha256:9cd405cd1ec1410eaab064a1383d0d8854d1ef74a54e1e4a92fb4ec7bdc3ee7                                   node3  Running        Runnin 32 minutes ago
    ```
@y
    ID                          NAME                  IMAGE                                                                                                                 NODE   DESIRED STATE  CURREN STATE           ERROR  PORTS
    xim5bcqtgk1bxqz91jzo4a1s5   voting_worker.1       dockersamples/examplevotingapp_worker:latest@sha256:3e4ddf59c15f432280a2c0679c4fc5a2ee5a797023c8ef0d3baf7b1385e9fed   node2  Running        Runnin 32 minutes ago
    q7yik0ks1in6kv32gg6y6yjf7   voting_result.1       dockersamples/examplevotingapp_result:before@sha256:83b56996e930c292a6ae5187fda84dd6568a19d97cdb933720be15c757b7463   node1  Running        Runnin 32 minutes ago
    rx5yo0866nfxc58zf4irsss6n   voting_vote.1         dockersamples/examplevotingapp_vote:before@sha256:8e64b182c87de902f2b72321c89b4af4e2b942d76d0b772532ff27ec4c6ebf6     node3  Running        Runnin 32 minutes ago
    tz6j82jnwrx7n2offljp3mn03   voting_db.1           postgres:9.4@sha256:6046af499eae34d2074c0b53f9a8b404716d415e4a03e68bc1d2f8064f2b027                                   node1  Running        Runnin 32 minutes ago
    w48spazhbmxcmbjfi54gs7x90   voting_redis.1        redis:alpine@sha256:9cd405cd1ec1410eaab064a1383d0d8854d1ef74a54e1e4a92fb4ec7bdc3ee7                                   node2  Running        Runnin 32 minutes ago
    6jj1m02freg1n3z9n1evrzsbl   voting_visualizer.1   dockersamples/visualizer:stable@sha256:f924ad66c8e94b10baaf7bdb9cd491ef4e982a1d048a56a17e02bf5945401e5                node1  Running        Runnin 32 minutes ago
    kqgdmededccbhz2wuc0e9hx7g   voting_vote.2         dockersamples/examplevotingapp_vote:before@sha256:8e64b182c87de902f2b72321c89b4af4e2b942d76d0b772532ff27ec4c6ebf6     node2  Running        Runnin 32 minutes ago
    t72q3z038jehe1wbh9gdum076   voting_redis.2        redis:alpine@sha256:9cd405cd1ec1410eaab064a1383d0d8854d1ef74a54e1e4a92fb4ec7bdc3ee7                                   node3  Running        Runnin 32 minutes ago
    ```
@z

@x
    ### Only display task IDs (-q, --quiet) {#quiet}
@y
    ### Only display task IDs (-q, --quiet) {#quiet}
@z

@x
    The `-q ` or `--quiet` option only shows IDs of the tasks in the stack.
    This example outputs all task IDs of the "voting" stack;
@y
    The `-q ` or `--quiet` option only shows IDs of the tasks in the stack.
    This example outputs all task IDs of the "voting" stack;
@z

@x
    ```console
    $ docker stack ps -q voting
    xim5bcqtgk1b
    q7yik0ks1in6
    rx5yo0866nfx
    tz6j82jnwrx7
    w48spazhbmxc
    6jj1m02freg1
    kqgdmededccb
    t72q3z038jeh
    ```
@y
    ```console
    $ docker stack ps -q voting
    xim5bcqtgk1b
    q7yik0ks1in6
    rx5yo0866nfx
    tz6j82jnwrx7
    w48spazhbmxc
    6jj1m02freg1
    kqgdmededccb
    t72q3z038jeh
    ```
@z

@x
    This option can be used to perform batch operations. For example, you can use
    the task IDs as input for other commands, such as `docker inspect`. The
    following example inspects all tasks of the "voting" stack;
@y
    This option can be used to perform batch operations. For example, you can use
    the task IDs as input for other commands, such as `docker inspect`. The
    following example inspects all tasks of the "voting" stack;
@z

@x
    ```console
    $ docker inspect $(docker stack ps -q voting)
@y
    ```console
    $ docker inspect $(docker stack ps -q voting)
@z

@x
    [
        {
            "ID": "xim5bcqtgk1b1gk0krq1",
            "Version": {
    <...>
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    [
        {
            "ID": "xim5bcqtgk1b1gk0krq1",
            "Version": {
    <...>
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
