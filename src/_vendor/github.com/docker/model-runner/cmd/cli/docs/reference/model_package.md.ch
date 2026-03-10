%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model package
@y
# docker model package
@z

@x
Package a model into a Docker Model OCI artifact.
@y
Package a model into a Docker Model OCI artifact.
@z

@x
The model source must be one of:
  --gguf               A GGUF file (single file or first shard of a sharded model)
  --safetensors-dir    A directory containing .safetensors and configuration files
  --dduf               A .dduf (Diffusers Unified Format) archive
  --from               An existing packaged model reference
@y
The model source must be one of:
  --gguf               A GGUF file (single file or first shard of a sharded model)
  --safetensors-dir    A directory containing .safetensors and configuration files
  --dduf               A .dduf (Diffusers Unified Format) archive
  --from               An existing packaged model reference
@z

@x
By default, the packaged artifact is loaded into the local Model Runner content store.
Use --push to publish the model to a registry instead.
@y
By default, the packaged artifact is loaded into the local Model Runner content store.
Use --push to publish the model to a registry instead.
@z

@x
MODEL specifies the target model reference (for example: myorg/llama3:8b).
When using --push, MODEL must be a registry-qualified reference.
@y
MODEL specifies the target model reference (for example: myorg/llama3:8b).
When using --push, MODEL must be a registry-qualified reference.
@z

@x
Packaging behavior:
@y
Packaging behavior:
@z

@x
  GGUF
    --gguf must point to a .gguf file.
    For sharded models, point to the first shard. All shards must:
      • reside in the same directory
      • follow an indexed naming convention (e.g. model-00001-of-00015.gguf)
    All shards are automatically discovered and packaged together.
@y
  GGUF
    --gguf must point to a .gguf file.
    For sharded models, point to the first shard. All shards must:
      • reside in the same directory
      • follow an indexed naming convention (e.g. model-00001-of-00015.gguf)
    All shards are automatically discovered and packaged together.
@z

@x
  Safetensors
    --safetensors-dir must point to a directory containing .safetensors files
    and required configuration files (e.g. model config, tokenizer files).
    All files under the directory (including nested subdirectories) are
    automatically discovered. Each file is packaged as a separate OCI layer.
@y
  Safetensors
    --safetensors-dir must point to a directory containing .safetensors files
    and required configuration files (e.g. model config, tokenizer files).
    All files under the directory (including nested subdirectories) are
    automatically discovered. Each file is packaged as a separate OCI layer.
@z

@x
  DDUF
    --dduf must point to a .dduf archive file.
@y
  DDUF
    --dduf must point to a .dduf archive file.
@z

@x
  Repackaging
    --from repackages an existing model. You may override selected properties
    such as --context-size to create a variant of the original model.
@y
  Repackaging
    --from repackages an existing model. You may override selected properties
    such as --context-size to create a variant of the original model.
@z

@x
  Multimodal models
    Use --mmproj to include a multimodal projector file.
@y
  Multimodal models
    Use --mmproj to include a multimodal projector file.
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name                | Type          | Default | Description                                                                            |
|:--------------------|:--------------|:--------|:---------------------------------------------------------------------------------------|
| `--chat-template`   | `string`      |         | absolute path to chat template file (must be Jinja format)                             |
| `--context-size`    | `uint64`      | `0`     | context size in tokens                                                                 |
| `--dduf`            | `string`      |         | absolute path to DDUF archive file (Diffusers Unified Format)                          |
| `--from`            | `string`      |         | reference to an existing model to repackage                                            |
| `--gguf`            | `string`      |         | absolute path to gguf file                                                             |
| `-l`, `--license`   | `stringArray` |         | absolute path to a license file                                                        |
| `--mmproj`          | `string`      |         | absolute path to multimodal projector file                                             |
| `--push`            | `bool`        |         | push to registry (if not set, the model is loaded into the Model Runner content store) |
| `--safetensors-dir` | `string`      |         | absolute path to directory containing safetensors files and config                     |
@y
| Name                | Type          | Default | Description                                                                            |
|:--------------------|:--------------|:--------|:---------------------------------------------------------------------------------------|
| `--chat-template`   | `string`      |         | absolute path to chat template file (must be Jinja format)                             |
| `--context-size`    | `uint64`      | `0`     | context size in tokens                                                                 |
| `--dduf`            | `string`      |         | absolute path to DDUF archive file (Diffusers Unified Format)                          |
| `--from`            | `string`      |         | reference to an existing model to repackage                                            |
| `--gguf`            | `string`      |         | absolute path to gguf file                                                             |
| `-l`, `--license`   | `stringArray` |         | absolute path to a license file                                                        |
| `--mmproj`          | `string`      |         | absolute path to multimodal projector file                                             |
| `--push`            | `bool`        |         | push to registry (if not set, the model is loaded into the Model Runner content store) |
| `--safetensors-dir` | `string`      |         | absolute path to directory containing safetensors files and config                     |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
