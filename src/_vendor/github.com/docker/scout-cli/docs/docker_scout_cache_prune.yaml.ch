%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout cache prune
short: Remove temporary or cached data
long: |-
    The `docker scout cache prune` command removes temporary data and SBOM cache.
@y
command: docker scout cache prune
short: Remove temporary or cached data
long: |-
    The `docker scout cache prune` command removes temporary data and SBOM cache.
@z

@x
    By default, `docker scout cache prune` only deletes temporary data.
    To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
usage: docker scout cache prune
pname: docker scout cache
plink: docker_scout_cache.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sboms
      value_type: bool
      default_value: "false"
      description: Prune cached SBOMs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    ### Delete temporary data
@y
    By default, `docker scout cache prune` only deletes temporary data.
    To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
usage: docker scout cache prune
pname: docker scout cache
plink: docker_scout_cache.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sboms
      value_type: bool
      default_value: "false"
      description: Prune cached SBOMs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    ### Delete temporary data
@z

@x
    ```console
    $ docker scout cache prune
    ? Are you sure to delete all temporary data? Yes
        ✓ temporary data deleted
    ```
@y
    ```console
    $ docker scout cache prune
    ? Are you sure to delete all temporary data? Yes
        ✓ temporary data deleted
    ```
@z

@x
    ### Delete temporary _and_ cache data
@y
    ### Delete temporary _and_ cache data
@z

@x
    ```console
    $ docker scout cache prune --sboms
    ? Are you sure to delete all temporary data and all cached SBOMs? Yes
        ✓ temporary data deleted
        ✓ cached SBOMs deleted
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout cache prune --sboms
    ? Are you sure to delete all temporary data and all cached SBOMs? Yes
        ✓ temporary data deleted
        ✓ cached SBOMs deleted
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
