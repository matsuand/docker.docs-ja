%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model package
short: Package a model into a Docker Model OCI artifact
long: |-
    Package a model into a Docker Model OCI artifact.
@y
command: docker model package
short: Package a model into a Docker Model OCI artifact
long: |-
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
usage: docker model package (--gguf <path> | --safetensors-dir <path> | --dduf <path> | --from <model>) [--license <path>...] [--mmproj <path>] [--context-size <tokens>] [--push] MODEL
@y
usage: docker model package (--gguf <path> | --safetensors-dir <path> | --dduf <path> | --from <model>) [--license <path>...] [--mmproj <path>] [--context-size <tokens>] [--push] MODEL
@z

% pname
% plink
% options

@x chat-template
      description: absolute path to chat template file (must be Jinja format)
@y
      description: absolute path to chat template file (must be Jinja format)
@z

@x context-size
      description: context size in tokens
@y
      description: context size in tokens
@z

@x dduf
      description: absolute path to DDUF archive file (Diffusers Unified Format)
@y
      description: absolute path to DDUF archive file (Diffusers Unified Format)
@z

@x from
      description: reference to an existing model to repackage
@y
      description: reference to an existing model to repackage
@z

@x gguf
      description: absolute path to gguf file
@y
      description: absolute path to gguf file
@z

@x license
      description: absolute path to a license file
@y
      description: absolute path to a license file
@z

@x mmproj
      description: absolute path to multimodal projector file
@y
      description: absolute path to multimodal projector file
@z

@x push
      description: |
        push to registry (if not set, the model is loaded into the Model Runner content store)
@y
      description: |
@z

@x safetensors-dir
      description: absolute path to directory containing safetensors files and config
@y
      description: absolute path to directory containing safetensors files and config
@z

% snip directives...
