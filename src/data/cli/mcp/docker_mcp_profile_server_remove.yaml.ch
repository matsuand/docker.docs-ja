%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp profile server remove
aliases: docker mcp profile server remove, docker mcp profile server rm
short: Remove MCP servers from a profile
long: Remove MCP servers from a profile by server name.
usage: docker mcp profile server remove <profile-id> --name <name1> --name <name2> ...
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: name
      value_type: stringArray
      default_value: '[]'
      description: Server name to remove (can be specified multiple times)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
     # Remove servers by name
      docker mcp profile server remove dev-tools --name github --name slack
@y
command: docker mcp profile server remove
aliases: docker mcp profile server remove, docker mcp profile server rm
short: Remove MCP servers from a profile
long: Remove MCP servers from a profile by server name.
usage: docker mcp profile server remove <profile-id> --name <name1> --name <name2> ...
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: name
      value_type: stringArray
      default_value: '[]'
      description: Server name to remove (can be specified multiple times)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
     # Remove servers by name
      docker mcp profile server remove dev-tools --name github --name slack
@z

@x
      # Remove a single server
      docker mcp profile server remove dev-tools --name github
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # Remove a single server
      docker mcp profile server remove dev-tools --name github
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
