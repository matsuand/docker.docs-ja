%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model package
@y
# docker model package
@z

@x
<!---MARKER_GEN_START-->
Package a GGUF file into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
When packaging a sharded model --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
@y
<!---MARKER_GEN_START-->
Package a GGUF file into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
When packaging a sharded model --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
@z

@x
### Options
@y
### Options
@z

@x
| Name              | Type          | Default | Description                                                                            |
|:------------------|:--------------|:--------|:---------------------------------------------------------------------------------------|
| `--chat-template` | `string`      |         | absolute path to chat template file (must be Jinja format)                             |
| `--context-size`  | `uint64`      | `0`     | context size in tokens                                                                 |
| `--gguf`          | `string`      |         | absolute path to gguf file (required)                                                  |
| `-l`, `--license` | `stringArray` |         | absolute path to a license file                                                        |
| `--push`          | `bool`        |         | push to registry (if not set, the model is loaded into the Model Runner content store) |
@y
| Name              | Type          | Default | Description                                                                            |
|:------------------|:--------------|:--------|:---------------------------------------------------------------------------------------|
| `--chat-template` | `string`      |         | absolute path to chat template file (must be Jinja format)                             |
| `--context-size`  | `uint64`      | `0`     | context size in tokens                                                                 |
| `--gguf`          | `string`      |         | absolute path to gguf file (required)                                                  |
| `-l`, `--license` | `stringArray` |         | absolute path to a license file                                                        |
| `--push`          | `bool`        |         | push to registry (if not set, the model is loaded into the Model Runner content store) |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
