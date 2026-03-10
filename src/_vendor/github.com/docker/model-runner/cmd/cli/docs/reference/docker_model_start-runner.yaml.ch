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
      description: 'Specify backend (llama.cpp|vllm|diffusers). Default: llama.cpp'
@y
      description: 'Specify backend (llama.cpp|vllm|diffusers). Default: llama.cpp'
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

@x proxy-cert
      description: Path to a CA certificate file for proxy SSL inspection
@y
      description: Path to a CA certificate file for proxy SSL inspection
@z

@x tls
      description: Enable TLS/HTTPS for Docker Model Runner API
@y
      description: Enable TLS/HTTPS for Docker Model Runner API
@z

@x tls-cert
      description: Path to TLS certificate file (auto-generated if not provided)
@y
      description: Path to TLS certificate file (auto-generated if not provided)
@z

@x tls-key
      description: Path to TLS private key file (auto-generated if not provided)
@y
      description: Path to TLS private key file (auto-generated if not provided)
@z

@x tls-port
      description: |
        TLS port for Docker Model Runner (default: 12444 for Docker Engine, 12445 for Cloud mode)
@y
      description: |
        TLS port for Docker Model Runner (default: 12444 for Docker Engine, 12445 for Cloud mode)
@z

% snip directives...
