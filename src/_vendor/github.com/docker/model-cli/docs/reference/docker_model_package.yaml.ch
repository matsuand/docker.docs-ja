%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model package
short: |
    Package a GGUF file into a Docker model OCI artifact, with optional licenses.
long: |-
    Package a GGUF file into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
    When packaging a sharded model --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
usage: docker model package --gguf <path> [--license <path>...] [--context-size <tokens>] [--push] MODEL
@y
command: docker model package
short: |
    Package a GGUF file into a Docker model OCI artifact, with optional licenses.
long: |-
    Package a GGUF file into a Docker model OCI artifact, with optional licenses. The package is sent to the model-runner, unless --push is specified.
    When packaging a sharded model --gguf should point to the first shard. All shard files should be siblings and should include the index in the file name (e.g. model-00001-of-00015.gguf).
usage: docker model package --gguf <path> [--license <path>...] [--context-size <tokens>] [--push] MODEL
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

@x gguf
      description: absolute path to gguf file (required)
@y
      description: absolute path to gguf file (required)
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

% snip directives...
