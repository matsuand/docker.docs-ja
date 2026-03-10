%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization get
short: Get details of a specific customization
long: |
    Get detailed information about a Docker Hardened Images customization by repository and name. Outputs YAML to stdout by default, or to file if --output is specified.
usage: docker dhi customization get <repository> <name>
@y
command: docker dhi customization get
short: Get details of a specific customization
long: |
    Get detailed information about a Docker Hardened Images customization by repository and name. Outputs YAML to stdout by default, or to file if --output is specified.
usage: docker dhi customization get <repository> <name>
@z

% options

@x output
      description: Output file path (if not specified, outputs to stdout)
@y
      description: Output file path (if not specified, outputs to stdout)
@z

% inherited_options

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
