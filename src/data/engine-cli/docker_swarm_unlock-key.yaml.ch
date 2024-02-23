%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm unlock-key
short: Manage the unlock key
long: |-
    An unlock key is a secret key needed to unlock a manager after its Docker daemon
    restarts. These keys are only used when the autolock feature is enabled for the
    swarm.
@y
command: docker swarm unlock-key
short: Manage the unlock key
long: |-
    An unlock key is a secret key needed to unlock a manager after its Docker daemon
    restarts. These keys are only used when the autolock feature is enabled for the
    swarm.
@z

@x
    You can view or rotate the unlock key using `swarm unlock-key`. To view the key,
    run the `docker swarm unlock-key` command without any arguments:
@y
    You can view or rotate the unlock key using `swarm unlock-key`. To view the key,
    run the `docker swarm unlock-key` command without any arguments:
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker swarm unlock-key [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display token
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rotate
      value_type: bool
      default_value: "false"
      description: Rotate unlock key
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
examples: |-
    ```console
    $ docker swarm unlock-key
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker swarm unlock-key [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display token
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rotate
      value_type: bool
      default_value: "false"
      description: Rotate unlock key
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
examples: |-
    ```console
    $ docker swarm unlock-key
@z

@x
    To unlock a swarm manager after it restarts, run the `docker swarm unlock`
    command and provide the following key:
@y
    To unlock a swarm manager after it restarts, run the `docker swarm unlock`
    command and provide the following key:
@z

@x
        SWMKEY-1-fySn8TY4w5lKcWcJPIpKufejh9hxx5KYwx6XZigx3Q4
@y
        SWMKEY-1-fySn8TY4w5lKcWcJPIpKufejh9hxx5KYwx6XZigx3Q4
@z

@x
    Please remember to store this key in a password manager, since without it you
    will not be able to restart the manager.
    ```
@y
    Please remember to store this key in a password manager, since without it you
    will not be able to restart the manager.
    ```
@z

@x
    Use the `--rotate` flag to rotate the unlock key to a new, randomly-generated
    key:
@y
    Use the `--rotate` flag to rotate the unlock key to a new, randomly-generated
    key:
@z

@x
    ```console
    $ docker swarm unlock-key --rotate
@y
    ```console
    $ docker swarm unlock-key --rotate
@z

@x
    Successfully rotated manager unlock key.
@y
    Successfully rotated manager unlock key.
@z

@x
    To unlock a swarm manager after it restarts, run the `docker swarm unlock`
    command and provide the following key:
@y
    To unlock a swarm manager after it restarts, run the `docker swarm unlock`
    command and provide the following key:
@z

@x
        SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8
@y
        SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8
@z

@x
    Please remember to store this key in a password manager, since without it you
    will not be able to restart the manager.
    ```
@y
    Please remember to store this key in a password manager, since without it you
    will not be able to restart the manager.
    ```
@z

@x
    The `-q` (or `--quiet`) flag only prints the key:
@y
    The `-q` (or `--quiet`) flag only prints the key:
@z

@x
    ```console
    $ docker swarm unlock-key -q
@y
    ```console
    $ docker swarm unlock-key -q
@z

@x
    SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8
    ```
@y
    SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8
    ```
@z

@x
    ### `--rotate`
@y
    ### `--rotate`
@z

@x
    This flag rotates the unlock key, replacing it with a new randomly-generated
    key. The old unlock key will no longer be accepted.
@y
    This flag rotates the unlock key, replacing it with a new randomly-generated
    key. The old unlock key will no longer be accepted.
@z

@x
    ### `--quiet`
@y
    ### `--quiet`
@z

@x
    Only print the unlock key, without instructions.
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    Only print the unlock key, without instructions.
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
