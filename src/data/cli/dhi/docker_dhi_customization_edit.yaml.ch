%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker dhi customization edit
aliases: docker dhi customization edit, docker dhi customization update
short: Edit an existing customization from YAML file
long: |
    Edit an existing Docker Hardened Images customization using a YAML file as input. The file should contain the complete customization structure with an 'id' field to identify which customization to update.
usage: docker dhi customization edit <file>
@y
command: docker dhi customization edit
aliases: docker dhi customization edit, docker dhi customization update
short: Edit an existing customization from YAML file
long: |
    Edit an existing Docker Hardened Images customization using a YAML file as input. The file should contain the complete customization structure with an 'id' field to identify which customization to update.
usage: docker dhi customization edit <file>
@z

%options:

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

%inherited_options:

@x org
      description: Docker Hub organization (overrides config)
@y
      description: Docker Hub organization (overrides config)
@z

% snip directives...
