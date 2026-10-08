%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose port
short: |
    List port mappings or print the public port for a specific mapping for the service
long: |
    List port mappings or print the public port for a specific mapping for the service
usage: docker compose port [OPTIONS] SERVICE [PRIVATE_PORT]
@y
command: docker compose port
short: |
    List port mappings or print the public port for a specific mapping for the service
long: |
    List port mappings or print the public port for a specific mapping for the service
usage: docker compose port [OPTIONS] SERVICE [PRIVATE_PORT]
@z

% options:

@x index
      description: Index of the container if service has multiple replicas
@y
      description: Index of the container if service has multiple replicas
@z

@x protocol
      description: tcp or udp
@y
      description: tcp or udp
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z
