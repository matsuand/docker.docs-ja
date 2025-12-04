%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose stats
short: Display a live stream of container(s) resource usage statistics
long: Display a live stream of container(s) resource usage statistics
usage: docker compose stats [OPTIONS] [SERVICE]
@y
command: docker compose stats
short: Display a live stream of container(s) resource usage statistics
long: Display a live stream of container(s) resource usage statistics
usage: docker compose stats [OPTIONS] [SERVICE]
@z

% options:

@x all
      description: Show all containers (default shows just running)
@y
      description: Show all containers (default shows just running)
@z

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/engine/cli/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/engine/cli/formatting/ for more information about formatting output with templates
@z

@x no-stream
      description: Disable streaming stats and only pull the first result
@y
      description: Disable streaming stats and only pull the first result
@z

@x no-trunc
      description: Do not truncate output
@y
      description: Do not truncate output
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
