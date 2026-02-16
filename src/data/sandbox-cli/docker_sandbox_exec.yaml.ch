%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox exec
short: Execute a command inside a sandbox
long: |-
    Execute a command in a sandbox that was previously created with 'docker sandbox create'.

    The command and any additional arguments are executed inside the sandbox container.
@y
command: docker sandbox exec
short: Execute a command inside a sandbox
long: |-
    Execute a command in a sandbox that was previously created with 'docker sandbox create'.

    The command and any additional arguments are executed inside the sandbox container.
@z

@x
usage: docker sandbox exec [OPTIONS] SANDBOX COMMAND [ARG...]
@y
usage: docker sandbox exec [OPTIONS] SANDBOX COMMAND [ARG...]
@z

% pname
% plink
% options:

@x detach
      description: 'Detached mode: run command in the background'
@y
      description: 'Detached mode: run command in the background'
@z

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: Override the key sequence for detaching a container
@z

@x env
      description: Set environment variables
@y
      description: Set environment variables
@z

@x env-file
      description: Read in a file of environment variables
@y
      description: Read in a file of environment variables
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: Keep STDIN open even if not attached
@z

@x privileged
      description: Give extended privileges to the command
@y
      description: Give extended privileges to the command
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x user
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@y
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@z

@x workdir
      description: Working directory inside the container
@y
      description: Working directory inside the container
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x socket
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@y
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@z

@x
examples: |-
    ### Execute a command in a sandbox
@y
examples: |-
    ### Execute a command in a sandbox
@z

% snip command...

@x
    ### Run an interactive shell
@y
    ### Run an interactive shell
@z

% snip command...

@x
    ### Set environment variables (-e, --env) {#env}
@y
    ### Set environment variables (-e, --env) {#env}
@z

% snip code...

@x
    Pass environment variables to the command:
@y
    Pass environment variables to the command:
@z

% snip command...

@x
    ### Set working directory (-w, --workdir) {#workdir}
@y
    ### Set working directory (-w, --workdir) {#workdir}
@z

% snip code...

@x
    Run the command in a specific directory:
@y
    Run the command in a specific directory:
@z

@x
    ### Run as specific user (-u, --user) {#user}
@y
    ### Run as specific user (-u, --user) {#user}
@z

% snip code...

@x
    Execute command as a different user:
@y
    Execute command as a different user:
@z

% snip command...

@x
    ### Run in background (-d, --detach) {#detach}
@y
    ### Run in background (-d, --detach) {#detach}
@z

@x
    Run a long-running command in the background:
@y
    Run a long-running command in the background:
@z

% snip command...
% snip directives...
