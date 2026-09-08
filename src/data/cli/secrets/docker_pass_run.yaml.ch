%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass run
short: Run a command with `se://` environment references resolved.
long: |-
    Scans the current environment (plus any `--env-file` inputs) for variables
    whose value is exactly `se://<ID|pattern>`. Each reference is resolved through the
    secrets-engine daemon and the resolved value is passed to the child process.
    The child inherits stdin, stdout, and stderr.
@y
command: docker pass run
short: Run a command with `se://` environment references resolved.
long: |-
    Scans the current environment (plus any `--env-file` inputs) for variables
    whose value is exactly `se://<ID|pattern>`. Each reference is resolved through the
    secrets-engine daemon and the resolved value is passed to the child process.
    The child inherits stdin, stdout, and stderr.
@z

@x
    Requires the secrets-engine daemon (Docker Desktop) to be running.
@y
    Requires the secrets-engine daemon (Docker Desktop) to be running.
@z

@x
    If any reference cannot be resolved, the command fails before the child is
    started and exits non-zero.
usage: docker pass run -- CMD [ARGS...] [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: env-file
      value_type: stringArray
      default_value: '[]'
      description: Read environment variables from a dotenv-formatted file. Repeatable; later files override earlier files and the process environment.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
    ### Run a command with one secret in its environment:
@y
    If any reference cannot be resolved, the command fails before the child is
    started and exits non-zero.
usage: docker pass run -- CMD [ARGS...] [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: env-file
      value_type: stringArray
      default_value: '[]'
      description: Read environment variables from a dotenv-formatted file. Repeatable; later files override earlier files and the process environment.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
    ### Run a command with one secret in its environment:
@z

@x
    ```console
    $ SE_TOKEN=se://gh-token docker pass run -- gh repo list
    ```
@y
    ```console
    $ SE_TOKEN=se://gh-token docker pass run -- gh repo list
    ```
@z

@x
    ### Multiple references:
@y
    ### Multiple references:
@z

@x
    ```console
    $ DB_PASSWORD=se://myapp/postgres/password API_KEY=se://myapp/anthropic/api-key docker pass run -- ./my-binary
    ```
@y
    ```console
    $ DB_PASSWORD=se://myapp/postgres/password API_KEY=se://myapp/anthropic/api-key docker pass run -- ./my-binary
    ```
@z

@x
    ### Resolve references from a dotenv file:
@y
    ### Resolve references from a dotenv file:
@z

@x
    ```console
    $ docker pass run --env-file .env -- ./my-binary
    ```
@y
    ```console
    $ docker pass run --env-file .env -- ./my-binary
    ```
@z

@x
    ### Multiple files (later overrides earlier; files override the process environment):
@y
    ### Multiple files (later overrides earlier; files override the process environment):
@z

@x
    ```console
    $ docker pass run --env-file .env --env-file .env.local -- ./my-binary
    ```
@y
    ```console
    $ docker pass run --env-file .env --env-file .env.local -- ./my-binary
    ```
@z
