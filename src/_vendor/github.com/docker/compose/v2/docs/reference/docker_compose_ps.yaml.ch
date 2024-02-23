%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose ps
short: List containers
long: |-
    Lists containers for a Compose project, with current status and exposed ports.
@y
command: docker compose ps
short: List containers
long: |-
    Lists containers for a Compose project, with current status and exposed ports.
@z

@x
    ```console
    $ docker compose ps
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    ```
@y
    ```console
    $ docker compose ps
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    ```
@z

@x
    By default, only running containers are shown. `--all` flag can be used to include stopped containers.
@y
    By default, only running containers are shown. `--all` flag can be used to include stopped containers.
@z

@x
    ```console
    $ docker compose ps --all
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    example-bar-1   alpine    "/entrypoint.…"   bar        4 seconds ago   exited (0)
    ```
usage: docker compose ps [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: |
        Show all stopped containers (including those created by the run command)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: string
      description: 'Filter services by a property (supported filters: status)'
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: table
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
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: orphans
      value_type: bool
      default_value: "true"
      description: Include orphaned services (not declared by project)
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
      description: Only display IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: services
      value_type: bool
      default_value: "false"
      description: Display services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: status
      value_type: stringArray
      default_value: '[]'
      description: |
        Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
      details_url: '#status'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Format the output (--format) {#format}
@y
    ```console
    $ docker compose ps --all
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    example-bar-1   alpine    "/entrypoint.…"   bar        4 seconds ago   exited (0)
    ```
usage: docker compose ps [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: |
        Show all stopped containers (including those created by the run command)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: string
      description: 'Filter services by a property (supported filters: status)'
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: table
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
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: orphans
      value_type: bool
      default_value: "true"
      description: Include orphaned services (not declared by project)
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
      description: Only display IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: services
      value_type: bool
      default_value: "false"
      description: Display services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: status
      value_type: stringArray
      default_value: '[]'
      description: |
        Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
      details_url: '#status'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Format the output (--format) {#format}
@z

@x
    By default, the `docker compose ps` command uses a table ("pretty") format to
    show the containers. The `--format` flag allows you to specify alternative
    presentations for the output. Currently, supported options are `pretty` (default),
    and `json`, which outputs information about the containers as a JSON array:
@y
    By default, the `docker compose ps` command uses a table ("pretty") format to
    show the containers. The `--format` flag allows you to specify alternative
    presentations for the output. Currently, supported options are `pretty` (default),
    and `json`, which outputs information about the containers as a JSON array:
@z

@x
    ```console
    $ docker compose ps --format json
    [{"ID":"1553b0236cf4d2715845f053a4ee97042c4f9a2ef655731ee34f1f7940eaa41a","Name":"example-bar-1","Command":"/docker-entrypoint.sh nginx -g 'daemon off;'","Project":"example","Service":"bar","State":"exited","Health":"","ExitCode":0,"Publishers":null},{"ID":"f02a4efaabb67416e1ff127d51c4b5578634a0ad5743bd65225ff7d1909a3fa0","Name":"example-foo-1","Command":"/docker-entrypoint.sh nginx -g 'daemon off;'","Project":"example","Service":"foo","State":"running","Health":"","ExitCode":0,"Publishers":[{"URL":"0.0.0.0","TargetPort":80,"PublishedPort":8080,"Protocol":"tcp"}]}]
    ```
@y
    ```console
    $ docker compose ps --format json
    [{"ID":"1553b0236cf4d2715845f053a4ee97042c4f9a2ef655731ee34f1f7940eaa41a","Name":"example-bar-1","Command":"/docker-entrypoint.sh nginx -g 'daemon off;'","Project":"example","Service":"bar","State":"exited","Health":"","ExitCode":0,"Publishers":null},{"ID":"f02a4efaabb67416e1ff127d51c4b5578634a0ad5743bd65225ff7d1909a3fa0","Name":"example-foo-1","Command":"/docker-entrypoint.sh nginx -g 'daemon off;'","Project":"example","Service":"foo","State":"running","Health":"","ExitCode":0,"Publishers":[{"URL":"0.0.0.0","TargetPort":80,"PublishedPort":8080,"Protocol":"tcp"}]}]
    ```
@z

@x
    The JSON output allows you to use the information in other tools for further
    processing, for example, using the [`jq` utility](https://stedolan.github.io/jq/)
    to pretty-print the JSON:
@y
    The JSON output allows you to use the information in other tools for further
    processing, for example, using the [`jq` utility](https://stedolan.github.io/jq/)
    to pretty-print the JSON:
@z

@x
    ```console
    $ docker compose ps --format json | jq .
    [
      {
        "ID": "1553b0236cf4d2715845f053a4ee97042c4f9a2ef655731ee34f1f7940eaa41a",
        "Name": "example-bar-1",
        "Command": "/docker-entrypoint.sh nginx -g 'daemon off;'",
        "Project": "example",
        "Service": "bar",
        "State": "exited",
        "Health": "",
        "ExitCode": 0,
        "Publishers": null
      },
      {
        "ID": "f02a4efaabb67416e1ff127d51c4b5578634a0ad5743bd65225ff7d1909a3fa0",
        "Name": "example-foo-1",
        "Command": "/docker-entrypoint.sh nginx -g 'daemon off;'",
        "Project": "example",
        "Service": "foo",
        "State": "running",
        "Health": "",
        "ExitCode": 0,
        "Publishers": [
          {
            "URL": "0.0.0.0",
            "TargetPort": 80,
            "PublishedPort": 8080,
            "Protocol": "tcp"
          }
        ]
      }
    ]
    ```
@y
    ```console
    $ docker compose ps --format json | jq .
    [
      {
        "ID": "1553b0236cf4d2715845f053a4ee97042c4f9a2ef655731ee34f1f7940eaa41a",
        "Name": "example-bar-1",
        "Command": "/docker-entrypoint.sh nginx -g 'daemon off;'",
        "Project": "example",
        "Service": "bar",
        "State": "exited",
        "Health": "",
        "ExitCode": 0,
        "Publishers": null
      },
      {
        "ID": "f02a4efaabb67416e1ff127d51c4b5578634a0ad5743bd65225ff7d1909a3fa0",
        "Name": "example-foo-1",
        "Command": "/docker-entrypoint.sh nginx -g 'daemon off;'",
        "Project": "example",
        "Service": "foo",
        "State": "running",
        "Health": "",
        "ExitCode": 0,
        "Publishers": [
          {
            "URL": "0.0.0.0",
            "TargetPort": 80,
            "PublishedPort": 8080,
            "Protocol": "tcp"
          }
        ]
      }
    ]
    ```
@z

@x
    ### Filter containers by status (--status) {#status}
@y
    ### Filter containers by status (--status) {#status}
@z

@x
    Use the `--status` flag to filter the list of containers by status. For example,
    to show only containers that are running or only containers that have exited:
@y
    Use the `--status` flag to filter the list of containers by status. For example,
    to show only containers that are running or only containers that have exited:
@z

@x
    ```console
    $ docker compose ps --status=running
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
@y
    ```console
    $ docker compose ps --status=running
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
@z

@x
    $ docker compose ps --status=exited
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-bar-1   alpine    "/entrypoint.…"   bar        4 seconds ago   exited (0)
    ```
@y
    $ docker compose ps --status=exited
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-bar-1   alpine    "/entrypoint.…"   bar        4 seconds ago   exited (0)
    ```
@z

@x
    ### Filter containers by status (--filter) {#filter}
@y
    ### Filter containers by status (--filter) {#filter}
@z

@x
    The [`--status` flag](#status) is a convenient shorthand for the `--filter status=<status>`
    flag. The example below is the equivalent to the example from the previous section,
    this time using the `--filter` flag:
@y
    The [`--status` flag](#status) is a convenient shorthand for the `--filter status=<status>`
    flag. The example below is the equivalent to the example from the previous section,
    this time using the `--filter` flag:
@z

@x
    ```console
    $ docker compose ps --filter status=running
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    ```
@y
    ```console
    $ docker compose ps --filter status=running
    NAME            IMAGE     COMMAND           SERVICE    CREATED         STATUS          PORTS
    example-foo-1   alpine    "/entrypoint.…"   foo        4 seconds ago   Up 2 seconds    0.0.0.0:8080->80/tcp
    ```
@z

@x
    The `docker compose ps` command currently only supports the `--filter status=<status>`
    option, but additional filter options may be added in the future.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The `docker compose ps` command currently only supports the `--filter status=<status>`
    option, but additional filter options may be added in the future.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
