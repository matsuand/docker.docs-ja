%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose events
short: Receive real time events from containers
long: |-
    Stream container events for every container in the project.
@y
command: docker compose events
short: Receive real time events from containers
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
    The events that can be received using this can be seen [here](/reference/cli/docker/system/events/#object-types).
@y
    The events that can be received using this can be seen [here](/reference/cli/docker/system/events/#object-types).
@z

@x
usage: docker compose events [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
@y
@z

% options:
@x json
      description: Output events as a stream of json objects
@y
      description: Output events as a stream of json objects
@z

@x since
      description: Show all events created since timestamp
@y
      description: Show all events created since timestamp
@z

@x until
      description: Stream events until this timestamp
@y
      description: Stream events until this timestamp
@z

% inherited_options:
@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% skip directives...
