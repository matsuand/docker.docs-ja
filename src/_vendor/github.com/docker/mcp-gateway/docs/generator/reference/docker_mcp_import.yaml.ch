%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp import
short: Import a server
long: |-
    Import and parse a server definition from an official MCP registry URL.
@y
command: docker mcp import
short: Import a server
long: |-
    Import and parse a server definition from an official MCP registry URL.
@z

@x
    This command fetches the server definition from the provided URL, parses it as a ServerDetail,
    converts it to the internal Server format, and displays the results.
@y
    This command fetches the server definition from the provided URL, parses it as a ServerDetail,
    converts it to the internal Server format, and displays the results.
@z

@x
    Example:
      docker mcp officialregistry import https://registry.example.com/servers/my-server
@y
    Example:
      docker mcp officialregistry import https://registry.example.com/servers/my-server
@z

@x
usage: docker mcp import
@y
usage: docker mcp import
@z

% options:

@x catalog
      description: import to local catalog
@y
      description: import to local catalog
@z

@x mcp-registry
      description: import from MCP registry format
@y
      description: import from MCP registry format
@z

@x push
      description: push the new server artifact
@y
      description: push the new server artifact
@z

% snip directives...
