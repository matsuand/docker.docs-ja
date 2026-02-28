%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp profile server add
short: Add MCP servers to a profile
long: Add MCP servers to a profile.
usage: docker mcp profile server add <profile-id> [--server <ref1> --server <ref2> ...]
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: server
      value_type: stringArray
      default_value: '[]'
      description: |
        Server to include specified with a URI: https:// (MCP Registry reference) or docker:// (Docker Image reference) or catalog:// (Catalog reference) or file:// (Local file path). Can be specified multiple times.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # Add servers from a catalog
      docker mcp profile server add dev-tools --server catalog://mcp/docker-mcp-catalog/github+obsidian
@y
command: docker mcp profile server add
short: Add MCP servers to a profile
long: Add MCP servers to a profile.
usage: docker mcp profile server add <profile-id> [--server <ref1> --server <ref2> ...]
pname: docker mcp profile server
plink: docker_mcp_profile_server.yaml
options:
    - option: server
      value_type: stringArray
      default_value: '[]'
      description: |
        Server to include specified with a URI: https:// (MCP Registry reference) or docker:// (Docker Image reference) or catalog:// (Catalog reference) or file:// (Local file path). Can be specified multiple times.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # Add servers from a catalog
      docker mcp profile server add dev-tools --server catalog://mcp/docker-mcp-catalog/github+obsidian
@z

@x
      # Add servers with OCI references
      docker mcp profile server add my-profile --server docker://my-server:latest
@y
      # Add servers with OCI references
      docker mcp profile server add my-profile --server docker://my-server:latest
@z

@x
      # Add servers with MCP Registry references
      docker mcp profile server add my-profile --server http://registry.modelcontextprotocol.io/v0/servers/71de5a2a-6cfb-4250-a196-f93080ecc860
@y
      # Add servers with MCP Registry references
      docker mcp profile server add my-profile --server http://registry.modelcontextprotocol.io/v0/servers/71de5a2a-6cfb-4250-a196-f93080ecc860
@z

@x
      # Mix server references
      docker mcp profile server add dev-tools --server catalog://mcp/docker-mcp-catalog/github+obsidian --server docker://my-server:latest
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # Mix server references
      docker mcp profile server add dev-tools --server catalog://mcp/docker-mcp-catalog/github+obsidian --server docker://my-server:latest
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
