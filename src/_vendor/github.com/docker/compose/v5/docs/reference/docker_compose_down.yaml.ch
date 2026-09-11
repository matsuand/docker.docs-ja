%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose down
short: Stop and remove containers, networks
long: |-
    Stops containers and removes containers, networks, volumes, and images created by `up`.
@y
command: docker compose down
short: Stop and remove containers, networks
long: |-
    Stops containers and removes containers, networks, volumes, and images created by `up`.
@z

@x
    By default, the only things removed are:
@y
    By default, the only things removed are:
@z

@x
    - Containers for services defined in the Compose file.
    - Networks defined in the networks section of the Compose file.
    - The default network, if one is used.
@y
    - Containers for services defined in the Compose file.
    - Networks defined in the networks section of the Compose file.
    - The default network, if one is used.
@z

@x
    Networks and volumes defined as external are never removed.
@y
    Networks and volumes defined as external are never removed.
@z

@x
    Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
    mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
    named volumes.
@y
    Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
    mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
    named volumes.
@z

@x
    ### Pre-start hook containers
@y
    ### Pre-start hook containers
@z

@x
    When a `pre_start` lifecycle hook fails, Compose retains its container for post-mortem inspection instead of removing
    it immediately. `compose down` automatically removes these retained hook containers as part of teardown, so they do
    not accumulate over time.
@y
    When a `pre_start` lifecycle hook fails, Compose retains its container for post-mortem inspection instead of removing
    it immediately. `compose down` automatically removes these retained hook containers as part of teardown, so they do
    not accumulate over time.
@z

@x
    To list retained hook containers before running `down`:
@y
    To list retained hook containers before running `down`:
@z

% snip command...

@x
usage: docker compose down [OPTIONS] [SERVICES]
@y
usage: docker compose down [OPTIONS] [SERVICES]
@z

% options:

@x remove-orphans
      description: Remove containers for services not defined in the Compose file
@y
      description: Remove containers for services not defined in the Compose file
@z

@x rmi
      description: |
        Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
@y
      description: |
        Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
@z

@x timeout
      description: Specify a shutdown timeout in seconds
@y
      description: Specify a shutdown timeout in seconds
@z

@x volumes
      description: |
        Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
@y
      description: |
        Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z
