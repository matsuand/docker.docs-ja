%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker ps
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker ps [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all containers (default shows just running)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: last
      shorthand: "n"
      value_type: int
      default_value: "-1"
      description: Show n last created containers (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Show the latest created container (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
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
      description: Only display container IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker ps
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker ps [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all containers (default shows just running)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: last
      shorthand: "n"
      value_type: int
      default_value: "-1"
      description: Show n last created containers (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Show the latest created container (includes all states)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
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
      description: Only display container IDs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
