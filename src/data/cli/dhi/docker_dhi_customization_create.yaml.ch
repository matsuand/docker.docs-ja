%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization create
short: Create a new customization from YAML file
@y
command: docker dhi customization create
short: Create a new customization from YAML file
@z

@x
long: |-
    Create a new Docker Hardened Images customization using a YAML file as input.
    The file should contain the complete customization structure without an 'id' field.

    Flags can override values from the YAML file (see --help for details).
    Shell completions are available for --destination and --tag-definition-id flags.
    Run 'docker dhi completion --help' to set up shell completions.
@y
long: |-
    Create a new Docker Hardened Images customization using a YAML file as input.
    The file should contain the complete customization structure without an 'id' field.

    Flags can override values from the YAML file (see --help for details).
    Shell completions are available for --destination and --tag-definition-id flags.
    Run 'docker dhi completion --help' to set up shell completions.
@z

@x
usage: docker dhi customization create <file>
@y
usage: docker dhi customization create <file>
@z

%options:

@x destination
      description: Override the destination repository (e.g. myorg/dhi-golang)
@y
      description: Override the destination repository (e.g. myorg/dhi-golang)
@z

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x name
      description: Override the customization name from the YAML file
@y
      description: Override the customization name from the YAML file
@z

@x tag-definition-id
      description: Override the tag definition ID (single-target only)
@y
      description: Override the tag definition ID (single-target only)
@z

%inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
