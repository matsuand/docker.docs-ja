%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog update
short: Update catalog(s) from remote sources
long: |-
    Update one or more catalogs by re-downloading from their original sources.
    If no name is provided, updates all catalogs that have remote sources.
usage: docker mcp catalog update [name]
@y
command: docker mcp catalog update
short: Update catalog(s) from remote sources
long: |-
    Update one or more catalogs by re-downloading from their original sources.
    If no name is provided, updates all catalogs that have remote sources.
usage: docker mcp catalog update [name]
@z

@x
examples: |4-
      # Update all catalogs
      docker mcp catalog update
@y
examples: |4-
      # Update all catalogs
      docker mcp catalog update
@z

@x
      # Update specific catalog
      docker mcp catalog update team-servers
@y
      # Update specific catalog
      docker mcp catalog update team-servers
@z

% snip directives...
