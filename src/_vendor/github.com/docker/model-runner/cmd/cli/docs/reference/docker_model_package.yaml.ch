%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model package
short: |
    Package a GGUF file, Safetensors directory, or existing model into a Docker model OCI artifact.
long: |-
    Package a GGUF file, Safetensors directory, or existing model into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
    When packaging a sharded GGUF model, --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
    When packaging a Safetensors model, --safetensors-dir should point to a directory containing .safetensors files and config files (*.json, merges.txt). All files will be auto-discovered and config files will be packaged into a tar archive.
    When packaging from an existing model using --from, you can modify properties like context size to create a variant of the original model.
usage: docker model package (--gguf <path> | --safetensors-dir <path> | --from <model>) [--license <path>...] [--context-size <tokens>] [--push] MODEL
@y
command: docker model package
short: |
    Package a GGUF file, Safetensors directory, or existing model into a Docker model OCI artifact.
long: |-
    Package a GGUF file, Safetensors directory, or existing model into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
    When packaging a sharded GGUF model, --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
    When packaging a Safetensors model, --safetensors-dir should point to a directory containing .safetensors files and config files (*.json, merges.txt). All files will be auto-discovered and config files will be packaged into a tar archive.
    When packaging from an existing model using --from, you can modify properties like context size to create a variant of the original model.
usage: docker model package (--gguf <path> | --safetensors-dir <path> | --from <model>) [--license <path>...] [--context-size <tokens>] [--push] MODEL
@z

% options:

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

@x dir-tar
      description: |
        relative path to directory to package as tar (can be specified multiple times)
@y
      description: |
        relative path to directory to package as tar (can be specified multiple times)
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

@x push
      description: |
        push to registry (if not set, the model is loaded into the Model Runner content store)
@y
      description: |
        push to registry (if not set, the model is loaded into the Model Runner content store)
@z

@x safetensors-dir
      description: absolute path to directory containing safetensors files and config
@y
      description: absolute path to directory containing safetensors files and config
@z

% snip directives...
