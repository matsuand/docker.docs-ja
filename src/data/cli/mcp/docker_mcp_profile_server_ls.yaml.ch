%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp profile server ls
aliases: docker mcp profile server ls, docker mcp profile server list
short: List servers across profiles
long: |-
    List all servers grouped by profile.
@y
command: docker mcp profile server ls
aliases: docker mcp profile server ls, docker mcp profile server list
short: List servers across profiles
long: |-
    List all servers grouped by profile.
@z

@x
    Use --filter to search for servers matching a query (case-insensitive substring matching on server names).
    Filters use key=value format (e.g., name=github, profile=my-dev-env).
usage: docker mcp profile server ls
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: filter
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Filter output (e.g., name=github, profile=my-dev-env)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: human
      description: 'Supported: json, yaml, human.'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # List all servers across all profiles
      docker mcp profile server ls
@y
    Use --filter to search for servers matching a query (case-insensitive substring matching on server names).
    Filters use key=value format (e.g., name=github, profile=my-dev-env).
usage: docker mcp profile server ls
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: filter
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Filter output (e.g., name=github, profile=my-dev-env)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: human
      description: 'Supported: json, yaml, human.'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # List all servers across all profiles
      docker mcp profile server ls
@z

@x
      # Filter servers by name
      docker mcp profile server ls --filter name=github
@y
      # Filter servers by name
      docker mcp profile server ls --filter name=github
@z

@x
      # Show servers from a specific profile
      docker mcp profile server ls --filter profile=my-dev-env
@y
      # Show servers from a specific profile
      docker mcp profile server ls --filter profile=my-dev-env
@z

@x
      # Combine multiple filters (using short flag)
      docker mcp profile server ls -f name=slack -f profile=my-dev-env
@y
      # Combine multiple filters (using short flag)
      docker mcp profile server ls -f name=slack -f profile=my-dev-env
@z

@x
      # Output in JSON format
      docker mcp profile server ls --format json
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # Output in JSON format
      docker mcp profile server ls --format json
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
