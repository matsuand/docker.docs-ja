%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
command: docker compose ps
short: List containers
long: |-
    Lists containers for a Compose project, with current status and exposed ports.
@y
command: docker compose ps
short: List containers
long: |-
    Lists containers for a Compose project, with current status and exposed ports.
@z

% snip command...

@x
    By default, only running containers are shown. `--all` flag can be used to include stopped containers.
@y
    By default, only running containers are shown. `--all` flag can be used to include stopped containers.
@z

% snip command...

@x
usage: docker compose ps [OPTIONS] [SERVICE...]
@y
usage: docker compose ps [OPTIONS] [SERVICE...]
@z

% options:

@x all
      description: |
        Show all stopped containers (including those created by the run command)
@y
      description: |
        Show all stopped containers (including those created by the run command)
@z

@x filter
      description: 'Filter services by a property (supported filters: status)'
@y
      description: 'Filter services by a property (supported filters: status)'
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

@x orphans
      description: Include orphaned services (not declared by project)
@y
      description: Include orphaned services (not declared by project)
@z

@x quiet
      description: Only display IDs
@y
      description: Only display IDs
@z

@x services
      description: Display services
@y
      description: Display services
@z

@x status
      description: |
        Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
@y
      description: |
        Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

@x
examples: |-
    ### Format the output (--format) {#format}
@y
examples: |-
    ### Format the output (--format) {#format}
@z

@x
    By default, the `docker compose ps` command uses a table ("pretty") format to
    show the containers. The `--format` flag allows you to specify alternative
    presentations for the output. Currently, supported options are `pretty` (default),
    and `json`, which outputs information about the containers as JSON Lines
    (one JSON object per line), aligned with the output of `docker ps --format json`:
@y
    By default, the `docker compose ps` command uses a table ("pretty") format to
    show the containers. The `--format` flag allows you to specify alternative
    presentations for the output. Currently, supported options are `pretty` (default),
    and `json`, which outputs information about the containers as JSON Lines
    (one JSON object per line), aligned with the output of `docker ps --format json`:
@z

% snip command...

@x
    The JSON output allows you to use the information in other tools for further
    processing, for example, using the [`jq` utility](https://stedolan.github.io/jq/)
    to pretty-print each object:
@y
    The JSON output allows you to use the information in other tools for further
    processing, for example, using the [`jq` utility](https://stedolan.github.io/jq/)
    to pretty-print each object:
@z

% snip command...

@x
    ### Filter containers by status (--status) {#status}
@y
    ### Filter containers by status (--status) {#status}
@z

@x
    Use the `--status` flag to filter the list of containers by status. For example,
    to show only containers that are running or only containers that have exited:
@y
    Use the `--status` flag to filter the list of containers by status. For example,
    to show only containers that are running or only containers that have exited:
@z

% snip command...

@x
    ### Filter containers by status (--filter) {#filter}
@y
    ### Filter containers by status (--filter) {#filter}
@z

@x
    The [`--status` flag](#status) is a convenient shorthand for the `--filter status=<status>`
    flag. The example below is the equivalent to the example from the previous section,
    this time using the `--filter` flag:
@y
    The [`--status` flag](#status) is a convenient shorthand for the `--filter status=<status>`
    flag. The example below is the equivalent to the example from the previous section,
    this time using the `--filter` flag:
@z

% snip command...

@x
    The `docker compose ps` command currently only supports the `--filter status=<status>`
    option, but additional filter options may be added in the future.
@y
    The `docker compose ps` command currently only supports the `--filter status=<status>`
    option, but additional filter options may be added in the future.
@z
