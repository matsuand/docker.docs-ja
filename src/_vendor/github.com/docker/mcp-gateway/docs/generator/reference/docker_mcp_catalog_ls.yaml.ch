%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog ls
short: List all configured catalogs
long: |
    List all configured catalogs including Docker's official catalog and any locally managed catalogs.
usage: docker mcp catalog ls
@y
command: docker mcp catalog ls
short: List all configured catalogs
long: |
    List all configured catalogs including Docker's official catalog and any locally managed catalogs.
usage: docker mcp catalog ls
@z

% options:

@x format
      description: 'Output format. Supported: "json", "yaml".'
@y
      description: 'Output format. Supported: "json", "yaml".'
@z

@x
examples: |4-
      # List all catalogs
      docker mcp catalog ls
@y
examples: |4-
      # List all catalogs
      docker mcp catalog ls
@z

@x
      # List catalogs in JSON format
      docker mcp catalog ls --format=json
@y
      # List catalogs in JSON format
      docker mcp catalog ls --format=json
@z

% snip direcitves...
