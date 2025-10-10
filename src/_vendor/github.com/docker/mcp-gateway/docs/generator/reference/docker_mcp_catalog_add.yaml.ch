%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog add
short: Add a server to a catalog
long: |-
    Add an MCP server definition to an existing catalog by copying it from another catalog file.
    The server definition includes all configuration, tools, and metadata.
usage: docker mcp catalog add <catalog> <server-name> <catalog-file>
@y
command: docker mcp catalog add
short: Add a server to a catalog
long: |-
    Add an MCP server definition to an existing catalog by copying it from another catalog file.
    The server definition includes all configuration, tools, and metadata.
usage: docker mcp catalog add <catalog> <server-name> <catalog-file>
@z

% options:

@x force
      description: Overwrite existing server in the catalog
@y
      description: カタログ内の既存サーバーを上書きします。
@z

@x
examples: "  # Add a server from another catalog file\n  docker mcp catalog add my-catalog github-server ./github-catalog.yaml\n  \n  # Add with force to overwrite existing server\n  docker mcp catalog add my-catalog slack-bot ./team-catalog.yaml --force"
@y
examples: "  # Add a server from another catalog file\n  docker mcp catalog add my-catalog github-server ./github-catalog.yaml\n  \n  # Add with force to overwrite existing server\n  docker mcp catalog add my-catalog slack-bot ./team-catalog.yaml --force"
@z

% snip directives...
