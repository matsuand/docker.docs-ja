%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model start-runner
short: Start Docker Model Runner (Docker Engine only)
long: |-
    This command starts the Docker Model Runner without pulling container images. Use this command to start the runner when you already have the required images locally.

    For the first-time setup or to ensure you have the latest images, use `docker model install-runner` instead.
@y
command: docker model start-runner
short: Start Docker Model Runner (Docker Engine only)
long: |-
    This command starts the Docker Model Runner without pulling container images. Use this command to start the runner when you already have the required images locally.

    For the first-time setup or to ensure you have the latest images, use `docker model install-runner` instead.
@z

@x
usage: docker model start-runner
@y
usage: docker model start-runner
@z

% options:

@x backend
      description: 'Specify backend (llama.cpp|vllm). Default: llama.cpp'
@y
      description: 'Specify backend (llama.cpp|vllm). Default: llama.cpp'
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x do-not-track
      description: Do not track models usage in Docker Model Runner
@y
      description: Do not track models usage in Docker Model Runner
@z

@x gpu
      description: Specify GPU support (none|auto|cuda|rocm|musa|cann)
@y
      description: Specify GPU support (none|auto|cuda|rocm|musa|cann)
@z

@x port
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode)
@y
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode)
@z

% snip directives...
