%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker history [OPTIONS] IMAGE
@y
command: docker history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker history [OPTIONS] IMAGE
@z

% options:

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

@x human
      description: Print sizes and dates in human readable format
@y
      description: Print sizes and dates in human readable format
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x platform
      description: |
        Show history for the given platform. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
        Show history for the given platform. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
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
