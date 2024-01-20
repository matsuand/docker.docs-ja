%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context export
short: Export a context to a tar archive FILE or a tar stream on STDOUT.
long: |-
    Exports a context to a file that can then be used with `docker context import`.
@y
command: docker context export
short: Export a context to a tar archive FILE or a tar stream on STDOUT.
long: |-
    Exports a context to a file that can then be used with `docker context import`.
@z

@x
    The default output filename is `<CONTEXT>.dockercontext`. To export to `STDOUT`,
    use `-` as filename, for example:
@y
    The default output filename is `<CONTEXT>.dockercontext`. To export to `STDOUT`,
    use `-` as filename, for example:
@z

@x
    ```console
    $ docker context export my-context -
    ```
usage: docker context export [OPTIONS] CONTEXT [FILE|-]
pname: docker context
plink: docker_context.yaml
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
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker context export my-context -
    ```
usage: docker context export [OPTIONS] CONTEXT [FILE|-]
pname: docker context
plink: docker_context.yaml
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
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
