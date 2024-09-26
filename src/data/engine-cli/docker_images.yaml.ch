%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker images
aliases: docker image ls, docker image list, docker images
short: List images
long: List images
usage: docker images [OPTIONS] [REPOSITORY[:TAG]]
@y
command: docker images
aliases: docker image ls, docker image list, docker images
short: List images
long: List images
usage: docker images [OPTIONS] [REPOSITORY[:TAG]]
@z

% options:

@x all
      description: Show all images (default hides intermediate images)
@y
      description: Show all images (default hides intermediate images)
@z

@x digests
      description: Show digests
@y
      description: Show digests
@z

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only show image IDs
@y
      description: Only show image IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
