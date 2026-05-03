%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization delete
short: Delete one or more customizations
long: |-
    Delete one or more Docker Hardened Images customizations by their IDs.
@y
command: docker dhi customization delete
short: Delete one or more customizations
long: |-
    Delete one or more Docker Hardened Images customizations by their IDs.
@z

@x
    Multiple IDs can be specified as positional arguments.
@y
    Multiple IDs can be specified as positional arguments.
@z

@x
    Examples:
      # Delete a single customization
      docker dhi customization delete abc123
@y
    Examples:
      # Delete a single customization
      docker dhi customization delete abc123
@z

@x
      # Delete multiple customizations
      docker dhi customization delete abc123 def456 ghi789
@y
      # Delete multiple customizations
      docker dhi customization delete abc123 def456 ghi789
@z

@x
      # Delete without confirmation prompt
      docker dhi customization delete abc123 def456 --force
@y
      # Delete without confirmation prompt
      docker dhi customization delete abc123 def456 --force
@z

@x
usage: docker dhi customization delete <id> [id...]
@y
usage: docker dhi customization delete <id> [id...]
@z

%options:

@x force
      description: Skip the confirmation prompt; aborts if any ID does not exist
@y
      description: Skip the confirmation prompt; aborts if any ID does not exist
@z

%inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
