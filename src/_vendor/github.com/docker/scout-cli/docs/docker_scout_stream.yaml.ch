%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout stream
short: Manage streams (experimental)
long: |-
    The `docker scout stream` command lists the deployment streams and records an image to it.
@y
command: docker scout stream
short: Manage streams (experimental)
long: |-
    The `docker scout stream` command lists the deployment streams and records an image to it.
@z

@x
    Once recorded, streams can be referred to by their name, eg. in the `docker scout compare` command using `--to-stream`.
usage: docker scout stream [STREAM] [IMAGE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to record
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
    ### List existing streams
@y
    Once recorded, streams can be referred to by their name, eg. in the `docker scout compare` command using `--to-stream`.
usage: docker scout stream [STREAM] [IMAGE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to record
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
    ### List existing streams
@z

@x
    ```console
    $ %[1]s %[2]s
    prod-cluster-123
    stage-cluster-234
    ```
@y
    ```console
    $ %[1]s %[2]s
    prod-cluster-123
    stage-cluster-234
    ```
@z

@x
    ### List images of a stream
@y
    ### List images of a stream
@z

@x
    ```console
    $ %[1]s %[2]s prod-cluster-123
    namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
    namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
    ```
@y
    ```console
    $ %[1]s %[2]s prod-cluster-123
    namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
    namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
    ```
@z

@x
    ### Record an image to a stream, for a specific platform
@y
    ### Record an image to a stream, for a specific platform
@z

@x
    ```console
    $ %[1]s %[2]s stage-cluster-234 namespace/repo:stage-latest --platform linux/amd64
    ✓ Pulled
    ✓ Successfully recorded namespace/repo:stage-latest in stream stage-cluster-234
    ```
deprecated: true
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    ```console
    $ %[1]s %[2]s stage-cluster-234 namespace/repo:stage-latest --platform linux/amd64
    ✓ Pulled
    ✓ Successfully recorded namespace/repo:stage-latest in stream stage-cluster-234
    ```
deprecated: true
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
