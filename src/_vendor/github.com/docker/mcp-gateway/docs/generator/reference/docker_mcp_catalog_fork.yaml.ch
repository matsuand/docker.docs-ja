%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog fork
short: Create a copy of an existing catalog
long: |
    Create a new catalog by copying all servers from an existing catalog. Useful for creating variations of existing catalogs.
usage: docker mcp catalog fork <src-catalog> <new-name>
@y
command: docker mcp catalog fork
short: Create a copy of an existing catalog
long: |
    Create a new catalog by copying all servers from an existing catalog. Useful for creating variations of existing catalogs.
usage: docker mcp catalog fork <src-catalog> <new-name>
@z

@x
examples: "  # Fork the Docker catalog to customize it\n  docker mcp catalog fork docker-mcp my-custom-docker\n  \n  # Fork a team catalog for personal use\n  docker mcp catalog fork team-servers my-servers"
@y
examples: "  # Fork the Docker catalog to customize it\n  docker mcp catalog fork docker-mcp my-custom-docker\n  \n  # Fork a team catalog for personal use\n  docker mcp catalog fork team-servers my-servers"
@z

% snip directives...
