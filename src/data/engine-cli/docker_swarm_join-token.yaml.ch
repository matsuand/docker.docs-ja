%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm join-token
short: Manage join tokens
long: |-
    Join tokens are secrets that allow a node to join the swarm. There are two
    different join tokens available, one for the worker role and one for the manager
    role. You pass the token using the `--token` flag when you run
    [swarm join](swarm_join.md). Nodes use the join token only when they join the
    swarm.
@y
command: docker swarm join-token
short: Manage join tokens
long: |-
    Join tokens are secrets that allow a node to join the swarm. There are two
    different join tokens available, one for the worker role and one for the manager
    role. You pass the token using the `--token` flag when you run
    [swarm join](swarm_join.md). Nodes use the join token only when they join the
    swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker swarm join-token [OPTIONS] (worker|manager)
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
      description: Rotate join token
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
    You can view or rotate the join tokens using `swarm join-token`.
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker swarm join-token [OPTIONS] (worker|manager)
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
      description: Rotate join token
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
    You can view or rotate the join tokens using `swarm join-token`.
@z

@x
    As a convenience, you can pass `worker` or `manager` as an argument to
    `join-token` to print the full `docker swarm join` command to join a new node to
    the swarm:
@y
    As a convenience, you can pass `worker` or `manager` as an argument to
    `join-token` to print the full `docker swarm join` command to join a new node to
    the swarm:
@z

@x
    ```console
    $ docker swarm join-token worker
@y
    ```console
    $ docker swarm join-token worker
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx \
        172.17.0.2:2377
@y
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx \
        172.17.0.2:2377
@z

@x
    $ docker swarm join-token manager
@y
    $ docker swarm join-token manager
@z

@x
    To add a manager to this swarm, run the following command:
@y
    To add a manager to this swarm, run the following command:
@z

@x
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2 \
        172.17.0.2:2377
    ```
@y
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2 \
        172.17.0.2:2377
    ```
@z

@x
    Use the `--rotate` flag to generate a new join token for the specified role:
@y
    Use the `--rotate` flag to generate a new join token for the specified role:
@z

@x
    ```console
    $ docker swarm join-token --rotate worker
@y
    ```console
    $ docker swarm join-token --rotate worker
@z

@x
    Successfully rotated worker join token.
@y
    Successfully rotated worker join token.
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-b30ljddcqhef9b9v4rs7mel7t \
        172.17.0.2:2377
    ```
@y
        docker swarm join \
        --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-b30ljddcqhef9b9v4rs7mel7t \
        172.17.0.2:2377
    ```
@z

@x
    After using `--rotate`, only the new token will be valid for joining with the specified role.
@y
    After using `--rotate`, only the new token will be valid for joining with the specified role.
@z

@x
    The `-q` (or `--quiet`) flag only prints the token:
@y
    The `-q` (or `--quiet`) flag only prints the token:
@z

@x
    ```console
    $ docker swarm join-token -q worker
@y
    ```console
    $ docker swarm join-token -q worker
@z

@x
    SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-b30ljddcqhef9b9v4rs7mel7t
    ```
@y
    SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-b30ljddcqhef9b9v4rs7mel7t
    ```
@z

@x
    ### `--rotate`
@y
    ### `--rotate`
@z

@x
    Because tokens allow new nodes to join the swarm, you should keep them secret.
    Be particularly careful with manager tokens since they allow new manager nodes
    to join the swarm. A rogue manager has the potential to disrupt the operation of
    your swarm.
@y
    Because tokens allow new nodes to join the swarm, you should keep them secret.
    Be particularly careful with manager tokens since they allow new manager nodes
    to join the swarm. A rogue manager has the potential to disrupt the operation of
    your swarm.
@z

@x
    Rotate your swarm's join token if a token gets checked-in to version control,
    stolen, or a node is compromised. You may also want to periodically rotate the
    token to ensure any unknown token leaks do not allow a rogue node to join
    the swarm.
@y
    Rotate your swarm's join token if a token gets checked-in to version control,
    stolen, or a node is compromised. You may also want to periodically rotate the
    token to ensure any unknown token leaks do not allow a rogue node to join
    the swarm.
@z

@x
    To rotate the join token and print the newly generated token, run
    `docker swarm join-token --rotate` and pass the role: `manager` or `worker`.
@y
    To rotate the join token and print the newly generated token, run
    `docker swarm join-token --rotate` and pass the role: `manager` or `worker`.
@z

@x
    Rotating a join-token means that no new nodes will be able to join the swarm
    using the old token. Rotation does not affect existing nodes in the swarm
    because the join token is only used for authorizing new nodes joining the swarm.
@y
    Rotating a join-token means that no new nodes will be able to join the swarm
    using the old token. Rotation does not affect existing nodes in the swarm
    because the join token is only used for authorizing new nodes joining the swarm.
@z

@x
    ### `--quiet`
@y
    ### `--quiet`
@z

@x
    Only print the token. Do not print a complete command for joining.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    Only print the token. Do not print a complete command for joining.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
