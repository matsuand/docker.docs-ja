%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog create
short: Create a new empty catalog
long: |
    Create a new empty catalog for organizing custom MCP servers. The catalog will be stored locally and can be populated using 'docker mcp catalog add'.
usage: docker mcp catalog create <name>
@y
command: docker mcp catalog create
short: Create a new empty catalog
long: |
    Create a new empty catalog for organizing custom MCP servers. The catalog will be stored locally and can be populated using 'docker mcp catalog add'.
usage: docker mcp catalog create <name>
@z

@x
examples: "  # Create a new catalog for development servers\n  docker mcp catalog create dev-servers\n  \n  # Create a catalog for production monitoring tools  \n  docker mcp catalog create prod-monitoring"
@y
examples: "  # Create a new catalog for development servers\n  docker mcp catalog create dev-servers\n  \n  # Create a catalog for production monitoring tools  \n  docker mcp catalog create prod-monitoring"
@z

% snip directives...
