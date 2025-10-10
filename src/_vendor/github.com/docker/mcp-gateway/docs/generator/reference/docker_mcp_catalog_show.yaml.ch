%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog show
short: Display catalog contents
long: |-
    Display the contents of a catalog including all server definitions and metadata.
    If no name is provided, shows the Docker official catalog.
usage: docker mcp catalog show [name]
@y
command: docker mcp catalog show
short: Display catalog contents
long: |-
    Display the contents of a catalog including all server definitions and metadata.
    If no name is provided, shows the Docker official catalog.
usage: docker mcp catalog show [name]
@z

% options:

@x format
      description: 'Supported: "json", "yaml".'
@y
      description: 'Supported: "json", "yaml".'
@z

@x
examples: |4-
      # Show Docker's official catalog
      docker mcp catalog show
@y
examples: |4-
      # Show Docker's official catalog
      docker mcp catalog show
@z

@x
      # Show a specific catalog in JSON format
      docker mcp catalog show my-catalog --format=json
@y
      # Show a specific catalog in JSON format
      docker mcp catalog show my-catalog --format=json
@z

% snip directives...
