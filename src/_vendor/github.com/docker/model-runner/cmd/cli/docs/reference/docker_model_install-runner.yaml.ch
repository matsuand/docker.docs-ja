%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model install-runner
short: Install Docker Model Runner (Docker Engine only)
long: |
    This command runs implicitly when a docker model command is executed. You can run this command explicitly to add a new configuration.
usage: docker model install-runner
@y
command: docker model install-runner
short: Install Docker Model Runner (Docker Engine only)
long: |
    This command runs implicitly when a docker model command is executed. You can run this command explicitly to add a new configuration.
usage: docker model install-runner
@z

% options:

@x do-not-track
      description: Do not track models usage in Docker Model Runner
@y
      description: Do not track models usage in Docker Model Runner
@z

@x gpu
      description: Specify GPU support (none|auto|cuda)
@y
      description: Specify GPU support (none|auto|cuda)
@z

@x port
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker CE, 12435 for Cloud mode)
@y
      description: |
        Docker container port for Docker Model Runner (default: 12434 for Docker CE, 12435 for Cloud mode)
@z

% snip directives...
