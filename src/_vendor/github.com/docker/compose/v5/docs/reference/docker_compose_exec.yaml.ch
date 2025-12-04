%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose exec
short: Execute a command in a running container
long: |-
    This is the equivalent of `docker exec` targeting a Compose service.
@y
command: docker compose exec
short: Execute a command in a running container
long: |-
    This is the equivalent of `docker exec` targeting a Compose service.
@z

@x
    With this subcommand, you can run arbitrary commands in your services. Commands allocate a TTY by default, so
    you can use a command such as `docker compose exec web sh` to get an interactive prompt.
@y
    With this subcommand, you can run arbitrary commands in your services. Commands allocate a TTY by default, so
    you can use a command such as `docker compose exec web sh` to get an interactive prompt.
@z

@x
    By default, Compose will enter container in interactive mode and allocate a TTY, while the equivalent `docker exec`
    command requires passing `--interactive --tty` flags to get the same behavior. Compose also support those two flags
    to offer a smooth migration between commands, whenever they are no-op by default. Still, `interactive` can be used to
    force disabling interactive mode (`--interactive=false`), typically when `docker compose exec` command is used inside
    a script.
@y
    By default, Compose will enter container in interactive mode and allocate a TTY, while the equivalent `docker exec`
    command requires passing `--interactive --tty` flags to get the same behavior. Compose also support those two flags
    to offer a smooth migration between commands, whenever they are no-op by default. Still, `interactive` can be used to
    force disabling interactive mode (`--interactive=false`), typically when `docker compose exec` command is used inside
    a script.
@z

@x
usage: docker compose exec [OPTIONS] SERVICE COMMAND [ARGS...]
@y
usage: docker compose exec [OPTIONS] SERVICE COMMAND [ARGS...]
@z

% options:

@x detach
      description: 'Detached mode: Run command in the background'
@y
      description: 'Detached mode: Run command in the background'
@z

@x env
      description: Set environment variables
@y
      description: Set environment variables
@z

@x index
      description: Index of the container if service has multiple replicas
@y
      description: Index of the container if service has multiple replicas
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: Keep STDIN open even if not attached
@z

@x no-tty
      description: |
        Disable pseudo-TTY allocation. By default 'docker compose exec' allocates a TTY.
@y
      description: |
        Disable pseudo-TTY allocation. By default 'docker compose exec' allocates a TTY.
@z

@x privileged
      description: Give extended privileges to the process
@y
      description: Give extended privileges to the process
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x user
      description: Run the command as this user
@y
      description: Run the command as this user
@z

@x workdir
      description: Path to workdir directory for this command
@y
      description: Path to workdir directory for this command
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
