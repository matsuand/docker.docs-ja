%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog rm
short: Remove a catalog
long: |-
    Remove a locally configured catalog. This will delete the catalog and all its server definitions.
    The Docker official catalog cannot be removed.
usage: docker mcp catalog rm <name>
@y
command: docker mcp catalog rm
short: Remove a catalog
long: |-
    Remove a locally configured catalog. This will delete the catalog and all its server definitions.
    The Docker official catalog cannot be removed.
usage: docker mcp catalog rm <name>
@z

@x
examples: |4-
      # Remove a catalog
      docker mcp catalog rm old-servers
@y
examples: |4-
      # Remove a catalog
      docker mcp catalog rm old-servers
@z

% snip directives...
