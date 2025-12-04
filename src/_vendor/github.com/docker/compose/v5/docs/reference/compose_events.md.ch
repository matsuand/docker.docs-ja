%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

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

% snip code...
@x
The events that can be received using this can be seen [here](/reference/cli/docker/system/events/#object-types).
@y
The events that can be received using this can be seen [here](__SUBDIR__/reference/cli/docker/system/events/#object-types).
@z

@x
### Options
@y
### Options
@z

@x
| Name        | Type     | Default | Description                               |
|:------------|:---------|:--------|:------------------------------------------|
| `--dry-run` | `bool`   |         | Execute command in dry run mode           |
| `--json`    | `bool`   |         | Output events as a stream of json objects |
| `--since`   | `string` |         | Show all events created since timestamp   |
| `--until`   | `string` |         | Stream events until this timestamp        |
@y
| Name        | Type     | Default | Description                               |
|:------------|:---------|:--------|:------------------------------------------|
| `--dry-run` | `bool`   |         | Execute command in dry run mode           |
| `--json`    | `bool`   |         | Output events as a stream of json objects |
| `--since`   | `string` |         | Show all events created since timestamp   |
| `--until`   | `string` |         | Stream events until this timestamp        |
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

% snip code...

@x
The events that can be received using this can be seen [here](https://docs.docker.com/reference/cli/docker/system/events/#object-types).
@y
The events that can be received using this can be seen [here](https://docs.docker.com/reference/cli/docker/system/events/#object-types).
@z
