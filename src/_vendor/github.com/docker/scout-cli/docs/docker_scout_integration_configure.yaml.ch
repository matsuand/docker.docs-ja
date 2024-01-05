%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout integration configure
short: Configure or update a new integration configuration
long: |
    The docker scout integration configure command creates or updates a new integration configuration for an organization.
usage: docker scout integration configure INTEGRATION
pname: docker scout integration
plink: docker_scout_integration.yaml
options:
    - option: name
      value_type: string
      description: Name of integration configuration to create
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parameter
      value_type: stringSlice
      default_value: '[]'
      description: Integration parameters in the form of --parameter NAME=VALUE
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
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker scout integration configure
short: Configure or update a new integration configuration
long: |
    The docker scout integration configure command creates or updates a new integration configuration for an organization.
usage: docker scout integration configure INTEGRATION
pname: docker scout integration
plink: docker_scout_integration.yaml
options:
    - option: name
      value_type: string
      description: Name of integration configuration to create
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parameter
      value_type: stringSlice
      default_value: '[]'
      description: Integration parameters in the form of --parameter NAME=VALUE
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
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
