%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization list
short: List all customizations
long: List all Docker Hardened Images customizations
usage: docker dhi customization list
@y
command: docker dhi customization list
short: List all customizations
long: List all Docker Hardened Images customizations
usage: docker dhi customization list
@z

% options

@x bulk-id
      description: Filter by bulk customization ID (exact match)
@y
      description: Filter by bulk customization ID (exact match)
@z

@x filter
      description: Filter by customization name (case-insensitive substring match)
@y
      description: Filter by customization name (case-insensitive substring match)
@z

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x repo
      description: |
        Filter by destination repository (case-insensitive substring match)
@y
      description: |
        Filter by destination repository (case-insensitive substring match)
@z

@x source
      description: Filter by DHI source repository (case-insensitive substring match)
@y
      description: Filter by DHI source repository (case-insensitive substring match)
@z

% inherited_options

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
