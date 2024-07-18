%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose events
@y
# docker compose events
@z

@x
<!---MARKER_GEN_START-->
Stream container events for every container in the project.
@y
<!---MARKER_GEN_START-->
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
### Options
@y
### Options
@z

@x
| Name        | Type   | Default | Description                               |
|:------------|:-------|:--------|:------------------------------------------|
| `--dry-run` | `bool` |         | Execute command in dry run mode           |
| `--json`    | `bool` |         | Output events as a stream of json objects |
@y
| Name        | Type   | Default | Description                               |
|:------------|:-------|:--------|:------------------------------------------|
| `--dry-run` | `bool` |         | Execute command in dry run mode           |
| `--json`    | `bool` |         | Output events as a stream of json objects |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
Stream container events for every container in the project.
@y
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
The events that can be received using this can be seen [here](https://docs.docker.com/reference/cli/docker/system/events/#object-types).
@y
The events that can be received using this can be seen [here](https://docs.docker.com/reference/cli/docker/system/events/#object-types).
@z
