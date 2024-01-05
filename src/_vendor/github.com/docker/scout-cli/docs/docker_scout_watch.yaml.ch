%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
long: |-
    The `docker scout watch` command watches repositories in a registry
    and pushes images or analysis results to Docker Scout.
usage: docker scout watch
pname: docker scout
plink: docker_scout.yaml
options:
    - option: all-images
      value_type: bool
      default_value: "false"
      description: |
        Push all images instead of only the ones pushed during the watch command is running
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Watch images and prepare them, but do not push them
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interval
      value_type: int64
      default_value: "60"
      description: Interval in seconds between checks
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization to which image will be pushed
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: refresh-registry
      value_type: bool
      default_value: "false"
      description: |
        Refresh the list of repositories of a registry at every run. Only with --registry.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: registry
      value_type: string
      description: Registry to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: repository
      value_type: stringSlice
      default_value: '[]'
      description: Repository to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: bool
      default_value: "true"
      description: Create and upload SBOMs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      value_type: stringSlice
      default_value: '[]'
      description: Regular expression to match tags to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workers
      value_type: int
      default_value: "3"
      description: Number of concurrent workers
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
    ### Watch for new images from two repositories and push them
@y
command: docker scout watch
short: |
    Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
long: |-
    The `docker scout watch` command watches repositories in a registry
    and pushes images or analysis results to Docker Scout.
usage: docker scout watch
pname: docker scout
plink: docker_scout.yaml
options:
    - option: all-images
      value_type: bool
      default_value: "false"
      description: |
        Push all images instead of only the ones pushed during the watch command is running
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Watch images and prepare them, but do not push them
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interval
      value_type: int64
      default_value: "60"
      description: Interval in seconds between checks
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization to which image will be pushed
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: refresh-registry
      value_type: bool
      default_value: "false"
      description: |
        Refresh the list of repositories of a registry at every run. Only with --registry.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: registry
      value_type: string
      description: Registry to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: repository
      value_type: stringSlice
      default_value: '[]'
      description: Repository to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: bool
      default_value: "true"
      description: Create and upload SBOMs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      value_type: stringSlice
      default_value: '[]'
      description: Regular expression to match tags to watch
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workers
      value_type: int
      default_value: "3"
      description: Number of concurrent workers
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
    ### Watch for new images from two repositories and push them
@z

@x
    ```console
    $ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2
    ```
@y
    ```console
    $ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2
    ```
@z

@x
    ### Only push images with a specific tag
@y
    ### Only push images with a specific tag
@z

@x
    ```console
    $ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest
    ```
@y
    ```console
    $ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest
    ```
@z

@x
    ### Watch all repositories of a registry
@y
    ### Watch all repositories of a registry
@z

@x
    ```console
    $ docker scout watch --org my-org --registry registry.example.com
    ```
@y
    ```console
    $ docker scout watch --org my-org --registry registry.example.com
    ```
@z

@x
    ### Push all images and not just the new ones
@y
    ### Push all images and not just the new ones
@z

@x
    ```console
    $ docker scout watch--org my-org --repository registry.example.com/my-service --all-images
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout watch--org my-org --repository registry.example.com/my-service --all-images
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
