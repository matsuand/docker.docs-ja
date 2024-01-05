%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout config
short: Manage Docker Scout configuration
long: |-
    `docker scout config` allows you to list, get and set Docker Scout configuration.
@y
command: docker scout config
short: Manage Docker Scout configuration
long: |-
    `docker scout config` allows you to list, get and set Docker Scout configuration.
@z

@x
    Available configuration key:
@y
    Available configuration key:
@z

@x
    - `organization`: Namespace of the Docker organization to be used by default.
usage: docker scout config [KEY] [VALUE]
pname: docker scout
plink: docker_scout.yaml
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List existing configuration
@y
    - `organization`: Namespace of the Docker organization to be used by default.
usage: docker scout config [KEY] [VALUE]
pname: docker scout
plink: docker_scout.yaml
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### List existing configuration
@z

@x
    ```console
    $ docker scout config
    organization=my-org-namespace
    ```
@y
    ```console
    $ docker scout config
    organization=my-org-namespace
    ```
@z

@x
    ### Print configuration value
@y
    ### Print configuration value
@z

@x
    ```console
    $ docker scout config organization
    my-org-namespace
    ```
@y
    ```console
    $ docker scout config organization
    my-org-namespace
    ```
@z

@x
    ### Set configuration value
@y
    ### Set configuration value
@z

@x
    ```console
    $ docker scout config organization my-org-namespace
        ✓ Successfully set organization to my-org-namespace
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout config organization my-org-namespace
        ✓ Successfully set organization to my-org-namespace
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
