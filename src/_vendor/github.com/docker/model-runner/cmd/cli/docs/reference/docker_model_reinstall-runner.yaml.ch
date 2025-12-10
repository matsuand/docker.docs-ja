%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model reinstall-runner
short: Reinstall Docker Model Runner (Docker Engine only)
long: |
    This command removes the existing Docker Model Runner container and reinstalls it with the specified configuration. Models and images are preserved during reinstallation.
usage: docker model reinstall-runner
@y
command: docker model reinstall-runner
short: Reinstall Docker Model Runner (Docker Engine only)
long: |
    This command removes the existing Docker Model Runner container and reinstalls it with the specified configuration. Models and images are preserved during reinstallation.
usage: docker model reinstall-runner
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

@x host
      description: Host address to bind Docker Model Runner
@y
      description: Host address to bind Docker Model Runner
@z

@x port
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode)
@y
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker Engine, 12435 for Cloud mode)
@z

% snip directives...
