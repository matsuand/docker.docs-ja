%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history export
short: Export build records into Docker Desktop bundle
long: |-
    Export one or more build records to `.dockerbuild` archive files. These archives
    contain metadata, logs, and build outputs, and can be imported into Docker
    Desktop or shared across environments.
usage: docker buildx history export [OPTIONS] [REF...]
pname: docker buildx history
plink: docker_buildx_history.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: Export all build records for the builder
      details_url: '#all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: finalize
      value_type: bool
      default_value: "false"
      description: Ensure build records are finalized before exporting
      details_url: '#finalize'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Output file path
      details_url: '#output'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: Enable debug logging
      details_url: '#debug'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Export all build records to a file (--all) {#all}
@y
command: docker buildx history export
short: Export build records into Docker Desktop bundle
long: |-
    Export one or more build records to `.dockerbuild` archive files. These archives
    contain metadata, logs, and build outputs, and can be imported into Docker
    Desktop or shared across environments.
usage: docker buildx history export [OPTIONS] [REF...]
pname: docker buildx history
plink: docker_buildx_history.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: Export all build records for the builder
      details_url: '#all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: finalize
      value_type: bool
      default_value: "false"
      description: Ensure build records are finalized before exporting
      details_url: '#finalize'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Output file path
      details_url: '#output'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: Enable debug logging
      details_url: '#debug'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Export all build records to a file (--all) {#all}
@z

@x
    Use the `--all` flag and redirect the output:
@y
    Use the `--all` flag and redirect the output:
@z

@x
    ```console
    docker buildx history export --all > all-builds.dockerbuild
    ```
@y
    ```console
    docker buildx history export --all > all-builds.dockerbuild
    ```
@z

@x
    Or use the `--output` flag:
@y
    Or use the `--output` flag:
@z

@x
    ```console
    docker buildx history export --all -o all-builds.dockerbuild
    ```
@y
    ```console
    docker buildx history export --all -o all-builds.dockerbuild
    ```
@z

@x
    ### Use a specific builder instance (--builder) {#builder}
@y
    ### Use a specific builder instance (--builder) {#builder}
@z

@x
    ```console
    docker buildx history export --builder builder0 ^1 -o builder0-build.dockerbuild
    ```
@y
    ```console
    docker buildx history export --builder builder0 ^1 -o builder0-build.dockerbuild
    ```
@z

@x
    ### Enable debug logging (--debug) {#debug}
@y
    ### Enable debug logging (--debug) {#debug}
@z

@x
    ```console
    docker buildx history export --debug qu2gsuo8ejqrwdfii23xkkckt -o debug-build.dockerbuild
    ```
@y
    ```console
    docker buildx history export --debug qu2gsuo8ejqrwdfii23xkkckt -o debug-build.dockerbuild
    ```
@z

@x
    ### Ensure build records are finalized before exporting (--finalize) {#finalize}
@y
    ### Ensure build records are finalized before exporting (--finalize) {#finalize}
@z

@x
    Clients can report their own traces concurrently, and not all traces may be
    saved yet by the time of the export. Use the `--finalize` flag to ensure all
    traces are finalized before exporting.
@y
    Clients can report their own traces concurrently, and not all traces may be
    saved yet by the time of the export. Use the `--finalize` flag to ensure all
    traces are finalized before exporting.
@z

@x
    ```console
    docker buildx history export --finalize qu2gsuo8ejqrwdfii23xkkckt -o finalized-build.dockerbuild
    ```
@y
    ```console
    docker buildx history export --finalize qu2gsuo8ejqrwdfii23xkkckt -o finalized-build.dockerbuild
    ```
@z

@x
    ### Export a single build to a custom file (--output) {#output}
@y
    ### Export a single build to a custom file (--output) {#output}
@z

@x
    ```console
    docker buildx history export qu2gsuo8ejqrwdfii23xkkckt --output mybuild.dockerbuild
    ```
@y
    ```console
    docker buildx history export qu2gsuo8ejqrwdfii23xkkckt --output mybuild.dockerbuild
    ```
@z

@x
    You can find build IDs by running:
@y
    You can find build IDs by running:
@z

@x
    ```console
    docker buildx history ls
    ```
@y
    ```console
    docker buildx history ls
    ```
@z

@x
    To export two builds to separate files:
@y
    To export two builds to separate files:
@z

@x
    ```console
    # Using build IDs
    docker buildx history export qu2gsuo8ejqrwdfii23xkkckt qsiifiuf1ad9pa9qvppc0z1l3 -o multi.dockerbuild
@y
    ```console
    # Using build IDs
    docker buildx history export qu2gsuo8ejqrwdfii23xkkckt qsiifiuf1ad9pa9qvppc0z1l3 -o multi.dockerbuild
@z

@x
    # Or using relative offsets
    docker buildx history export ^1 ^2 -o multi.dockerbuild
    ```
@y
    # Or using relative offsets
    docker buildx history export ^1 ^2 -o multi.dockerbuild
    ```
@z

@x
    Or use shell redirection:
@y
    Or use shell redirection:
@z

@x
    ```console
    docker buildx history export ^1 > mybuild.dockerbuild
    docker buildx history export ^2 > backend-build.dockerbuild
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    docker buildx history export ^1 > mybuild.dockerbuild
    docker buildx history export ^2 > backend-build.dockerbuild
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
