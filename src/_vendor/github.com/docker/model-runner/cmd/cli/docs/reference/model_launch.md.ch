%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model launch
@y
# docker model launch
@z

@x
<!---MARKER_GEN_START-->
Launch an app configured to use Docker Model Runner.
@y
<!---MARKER_GEN_START-->
Launch an app configured to use Docker Model Runner.
@z

@x
Without arguments, lists all supported apps.
@y
Without arguments, lists all supported apps.
@z

@x
Supported apps: anythingllm, claude, codex, openclaw, opencode, openwebui
@y
Supported apps: anythingllm, claude, codex, openclaw, opencode, openwebui
@z

@x
Examples:
  docker model launch
  docker model launch opencode
  docker model launch claude -- --help
  docker model launch openwebui --port 3000
  docker model launch claude --config
@y
Examples:
  docker model launch
  docker model launch opencode
  docker model launch claude -- --help
  docker model launch openwebui --port 3000
  docker model launch claude --config
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name        | Type     | Default | Description                                     |
|:------------|:---------|:--------|:------------------------------------------------|
| `--config`  | `bool`   |         | Print configuration without launching           |
| `--detach`  | `bool`   |         | Run containerized app in background             |
| `--dry-run` | `bool`   |         | Print what would be executed without running it |
| `--image`   | `string` |         | Override container image for containerized apps |
| `--model`   | `string` |         | Model to use (for opencode)                     |
| `--port`    | `int`    | `0`     | Host port to expose (web UIs)                   |
@y
| Name        | Type     | Default | Description                                     |
|:------------|:---------|:--------|:------------------------------------------------|
| `--config`  | `bool`   |         | Print configuration without launching           |
| `--detach`  | `bool`   |         | Run containerized app in background             |
| `--dry-run` | `bool`   |         | Print what would be executed without running it |
| `--image`   | `string` |         | Override container image for containerized apps |
| `--model`   | `string` |         | Model to use (for opencode)                     |
| `--port`    | `int`    | `0`     | Host port to expose (web UIs)                   |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
