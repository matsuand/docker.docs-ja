%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker stack config
short: Outputs the final config file, after doing merges and interpolations
long: |
    Outputs the final Compose file, after doing the merges and interpolations of the input Compose files.
usage: docker stack config [OPTIONS]
pname: docker stack
plink: docker_stack.yaml
options:
    - option: compose-file
      shorthand: c
      value_type: stringSlice
      default_value: '[]'
      description: Path to a Compose file, or `-` to read from stdin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: skip-interpolation
      value_type: bool
      default_value: "false"
      description: Skip interpolation and output only merged config
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    The following command outputs the result of the merge and interpolation of two Compose files.
@y
command: docker stack config
short: Outputs the final config file, after doing merges and interpolations
long: |
    Outputs the final Compose file, after doing the merges and interpolations of the input Compose files.
usage: docker stack config [OPTIONS]
pname: docker stack
plink: docker_stack.yaml
options:
    - option: compose-file
      shorthand: c
      value_type: stringSlice
      default_value: '[]'
      description: Path to a Compose file, or `-` to read from stdin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: skip-interpolation
      value_type: bool
      default_value: "false"
      description: Skip interpolation and output only merged config
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    The following command outputs the result of the merge and interpolation of two Compose files.
@z

@x
    ```bash
    $ docker stack config --compose-file docker-compose.yml --compose-file docker-compose.prod.yml
    ```
@y
    ```bash
    $ docker stack config --compose-file docker-compose.yml --compose-file docker-compose.prod.yml
    ```
@z

@x
    The Compose file can also be provided as standard input with `--compose-file -`:
@y
    The Compose file can also be provided as standard input with `--compose-file -`:
@z

@x
    ```bash
    $ cat docker-compose.yml | docker stack config --compose-file -
    ```
@y
    ```bash
    $ cat docker-compose.yml | docker stack config --compose-file -
    ```
@z

@x
    ### Skipping interpolation
@y
    ### Skipping interpolation
@z

@x
    In some cases, it might be useful to skip interpolation of environment variables.
    For example, when you want to pipe the output of this command back to `stack deploy`.
@y
    In some cases, it might be useful to skip interpolation of environment variables.
    For example, when you want to pipe the output of this command back to `stack deploy`.
@z

@x
    If you have a regex for a redirect route in an environment variable for your webserver you would use two `$` signs to prevent `stack deploy` from interpolating `${1}`.
@y
    If you have a regex for a redirect route in an environment variable for your webserver you would use two `$` signs to prevent `stack deploy` from interpolating `${1}`.
@z

@x
    ```bash
      service: webserver
      environment:
        REDIRECT_REGEX=http://host/redirect/$${1}
    ```
@y
    ```bash
      service: webserver
      environment:
        REDIRECT_REGEX=http://host/redirect/$${1}
    ```
@z

@x
    With interpolation, the `stack config` command will replace the environment variable in the Compose file
    with `REDIRECT_REGEX=http://host/redirect/${1}`, but then when piping it back to the `stack deploy`
    command it will be interpolated again and result in undefined behavior.
    That is why, when piping the output back to `stack deploy` one should always prefer the `--skip-interpolation` option.
@y
    With interpolation, the `stack config` command will replace the environment variable in the Compose file
    with `REDIRECT_REGEX=http://host/redirect/${1}`, but then when piping it back to the `stack deploy`
    command it will be interpolated again and result in undefined behavior.
    That is why, when piping the output back to `stack deploy` one should always prefer the `--skip-interpolation` option.
@z

@x
    ```
    $ docker stack config --compose-file web.yml --compose-file web.prod.yml --skip-interpolation | docker stack deploy --compose-file -
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ```
    $ docker stack config --compose-file web.yml --compose-file web.prod.yml --skip-interpolation | docker stack deploy --compose-file -
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
