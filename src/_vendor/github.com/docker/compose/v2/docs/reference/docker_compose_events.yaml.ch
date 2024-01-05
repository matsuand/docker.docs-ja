%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose events
short: Receive real time events from containers.
long: |-
    Stream container events for every container in the project.
@y
command: docker compose events
short: Receive real time events from containers.
long: |-
    Stream container events for every container in the project.
@z

@x
    With the `--json` flag, a json object is printed one per line with the format:
@y
    With the `--json` flag, a json object is printed one per line with the format:
@z

@x
    ```json
    {
        "time": "2015-11-20T18:01:03.615550",
        "type": "container",
        "action": "create",
        "id": "213cf7...5fc39a",
        "service": "web",
        "attributes": {
          "name": "application_web_1",
          "image": "alpine:edge"
        }
    }
    ```
@y
    ```json
    {
        "time": "2015-11-20T18:01:03.615550",
        "type": "container",
        "action": "create",
        "id": "213cf7...5fc39a",
        "service": "web",
        "attributes": {
          "name": "application_web_1",
          "image": "alpine:edge"
        }
    }
    ```
@z

@x
    The events that can be received using this can be seen [here](/engine/reference/commandline/events/#object-types).
usage: docker compose events [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: json
      value_type: bool
      default_value: "false"
      description: Output events as a stream of json objects
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The events that can be received using this can be seen [here](/engine/reference/commandline/events/#object-types).
usage: docker compose events [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: json
      value_type: bool
      default_value: "false"
      description: Output events as a stream of json objects
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
