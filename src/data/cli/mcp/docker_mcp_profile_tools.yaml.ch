%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp profile tools
short: Manage tool allowlist for servers in a profile
long: |-
    Manage the tool allowlist for servers in a profile.
    Tools are specified using dot notation: <serverName>.<toolName>
@y
command: docker mcp profile tools
short: Manage tool allowlist for servers in a profile
long: |-
    Manage the tool allowlist for servers in a profile.
    Tools are specified using dot notation: <serverName>.<toolName>
@z

@x
    Use --enable to enable specific tools for a server (can be specified multiple times).
    Use --disable to disable specific tools for a server (can be specified multiple times).
    Use --enable-all to enable all tools for a server (can be specified multiple times).
    Use --disable-all to disable all tools for a server (can be specified multiple times).
@y
    Use --enable to enable specific tools for a server (can be specified multiple times).
    Use --disable to disable specific tools for a server (can be specified multiple times).
    Use --enable-all to enable all tools for a server (can be specified multiple times).
    Use --disable-all to disable all tools for a server (can be specified multiple times).
@z

@x
    To view enabled tools, use: docker mcp profile show <profile-id>
usage: docker mcp profile tools <profile-id> [--enable <tool> ...] [--disable <tool> ...] [--enable-all <server> ...] [--disable-all <server> ...]
pname: docker mcp profile
plink: docker_mcp_profile.yaml
options:
    - option: disable
      value_type: stringArray
      default_value: '[]'
      description: 'Disable specific tools: <serverName>.<toolName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-all
      value_type: stringArray
      default_value: '[]'
      description: 'Disable all tools for a server: <serverName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: enable
      value_type: stringArray
      default_value: '[]'
      description: 'Enable specific tools: <serverName>.<toolName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: enable-all
      value_type: stringArray
      default_value: '[]'
      description: 'Enable all tools for a server: <serverName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # Enable specific tools for a server
      docker mcp profile tools my-profile --enable github.create_issue --enable github.list_repos
@y
    To view enabled tools, use: docker mcp profile show <profile-id>
usage: docker mcp profile tools <profile-id> [--enable <tool> ...] [--disable <tool> ...] [--enable-all <server> ...] [--disable-all <server> ...]
pname: docker mcp profile
plink: docker_mcp_profile.yaml
options:
    - option: disable
      value_type: stringArray
      default_value: '[]'
      description: 'Disable specific tools: <serverName>.<toolName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-all
      value_type: stringArray
      default_value: '[]'
      description: 'Disable all tools for a server: <serverName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: enable
      value_type: stringArray
      default_value: '[]'
      description: 'Enable specific tools: <serverName>.<toolName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: enable-all
      value_type: stringArray
      default_value: '[]'
      description: 'Enable all tools for a server: <serverName> (repeatable)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |4-
      # Enable specific tools for a server
      docker mcp profile tools my-profile --enable github.create_issue --enable github.list_repos
@z

@x
      # Disable specific tools for a server
      docker mcp profile tools my-profile --disable github.create_issue --disable github.search_code
@y
      # Disable specific tools for a server
      docker mcp profile tools my-profile --disable github.create_issue --disable github.search_code
@z

@x
      # Enable and disable in one command
      docker mcp profile tools my-profile --enable github.create_issue --disable github.search_code
@y
      # Enable and disable in one command
      docker mcp profile tools my-profile --enable github.create_issue --disable github.search_code
@z

@x
      # Enable all tools for a server
      docker mcp profile tools my-profile --enable-all github
@y
      # Enable all tools for a server
      docker mcp profile tools my-profile --enable-all github
@z

@x
      # Disable all tools for a server
      docker mcp profile tools my-profile --disable-all github
@y
      # Disable all tools for a server
      docker mcp profile tools my-profile --disable-all github
@z

@x
      # View all enabled tools in the profile
      docker mcp profile show my-profile
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
      # View all enabled tools in the profile
      docker mcp profile show my-profile
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
