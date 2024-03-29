%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network inspect
short: Display detailed information on one or more networks
long: |-
    Returns information about one or more networks. By default, this command renders
    all results in a JSON object.
usage: docker network inspect [OPTIONS] NETWORK [NETWORK...]
pname: docker network
plink: docker_network.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Verbose output for diagnostics
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
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker network inspect
short: Display detailed information on one or more networks
long: |-
    Returns information about one or more networks. By default, this command renders
    all results in a JSON object.
usage: docker network inspect [OPTIONS] NETWORK [NETWORK...]
pname: docker network
plink: docker_network.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Verbose output for diagnostics
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
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
