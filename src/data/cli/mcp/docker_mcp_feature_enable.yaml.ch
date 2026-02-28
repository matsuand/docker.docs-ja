%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp feature enable
short: Enable an experimental feature
long: |-
    Enable an experimental feature.
@y
command: docker mcp feature enable
short: Enable an experimental feature
long: |-
    Enable an experimental feature.
@z

@x
    Available features:
      oauth-interceptor      Enable GitHub OAuth flow interception for automatic authentication
      mcp-oauth-dcr          Enable Dynamic Client Registration (DCR) for automatic OAuth client setup
      dynamic-tools          Enable internal MCP management tools (mcp-find, mcp-add, mcp-remove)
    	profiles               Enable profile management (docker mcp profile <subcommand>)
      tool-name-prefix       Prefix all tool names with server name to avoid conflicts
usage: docker mcp feature enable <feature-name>
pname: docker mcp feature
plink: docker_mcp_feature.yaml
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Available features:
      oauth-interceptor      Enable GitHub OAuth flow interception for automatic authentication
      mcp-oauth-dcr          Enable Dynamic Client Registration (DCR) for automatic OAuth client setup
      dynamic-tools          Enable internal MCP management tools (mcp-find, mcp-add, mcp-remove)
    	profiles               Enable profile management (docker mcp profile <subcommand>)
      tool-name-prefix       Prefix all tool names with server name to avoid conflicts
usage: docker mcp feature enable <feature-name>
pname: docker mcp feature
plink: docker_mcp_feature.yaml
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
