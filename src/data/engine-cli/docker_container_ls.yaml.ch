%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container ls
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker container ls [OPTIONS]
@y
command: docker container ls
aliases: docker container ls, docker container list, docker container ps, docker ps
short: List containers
long: List containers
usage: docker container ls [OPTIONS]
@z

% options:

@x all
      description: Show all containers (default shows just running)
@y
      description: Show all containers (default shows just running)
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

@x last
      description: Show n last created containers (includes all states)
@y
      description: Show n last created containers (includes all states)
@z

@x latest
      description: Show the latest created container (includes all states)
@y
      description: Show the latest created container (includes all states)
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only display container IDs
@y
      description: Only display container IDs
@z

@x size
      description: Display total file sizes
@y
      description: Display total file sizes
@z

%inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Do not truncate output (--no-trunc) {#no-trunc}
@y
examples: |-
    ### Do not truncate output (--no-trunc) {#no-trunc}
@z
