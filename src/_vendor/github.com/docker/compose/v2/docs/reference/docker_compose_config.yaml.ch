%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose config
aliases: docker compose config, docker compose convert
short: Parse, resolve and render compose file in canonical format
long: |-
    `docker compose config` renders the actual data model to be applied on the Docker Engine.
    It merges the Compose files set by `-f` flags, resolves variables in the Compose file, and expands short-notation into
    the canonical format.
usage: docker compose config [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: format
      value_type: string
      default_value: yaml
      description: 'Format the output. Values: [yaml | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hash
      value_type: string
      description: Print the service config hash, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: images
      value_type: bool
      default_value: "false"
      description: Print the image names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-consistency
      value_type: bool
      default_value: "false"
      description: |
        Don't check model consistency - warning: may produce invalid Compose output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-interpolate
      value_type: bool
      default_value: "false"
      description: Don't interpolate environment variables.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-normalize
      value_type: bool
      default_value: "false"
      description: Don't normalize compose model.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-path-resolution
      value_type: bool
      default_value: "false"
      description: Don't resolve file paths.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Save to file (default to stdout)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: profiles
      value_type: bool
      default_value: "false"
      description: Print the profile names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only validate the configuration, don't print anything.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: resolve-image-digests
      value_type: bool
      default_value: "false"
      description: Pin image tags to digests.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: services
      value_type: bool
      default_value: "false"
      description: Print the service names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      value_type: bool
      default_value: "false"
      description: Print the volume names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker compose config
aliases: docker compose config, docker compose convert
short: Parse, resolve and render compose file in canonical format
long: |-
    `docker compose config` renders the actual data model to be applied on the Docker Engine.
    It merges the Compose files set by `-f` flags, resolves variables in the Compose file, and expands short-notation into
    the canonical format.
usage: docker compose config [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: format
      value_type: string
      default_value: yaml
      description: 'Format the output. Values: [yaml | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hash
      value_type: string
      description: Print the service config hash, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: images
      value_type: bool
      default_value: "false"
      description: Print the image names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-consistency
      value_type: bool
      default_value: "false"
      description: |
        Don't check model consistency - warning: may produce invalid Compose output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-interpolate
      value_type: bool
      default_value: "false"
      description: Don't interpolate environment variables.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-normalize
      value_type: bool
      default_value: "false"
      description: Don't normalize compose model.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-path-resolution
      value_type: bool
      default_value: "false"
      description: Don't resolve file paths.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Save to file (default to stdout)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: profiles
      value_type: bool
      default_value: "false"
      description: Print the profile names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only validate the configuration, don't print anything.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: resolve-image-digests
      value_type: bool
      default_value: "false"
      description: Pin image tags to digests.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: services
      value_type: bool
      default_value: "false"
      description: Print the service names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      value_type: bool
      default_value: "false"
      description: Print the volume names, one per line.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
