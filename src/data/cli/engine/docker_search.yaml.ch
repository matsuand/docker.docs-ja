%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
command: docker search
short: Search Docker Hub for images
long: Search [Docker Hub](https://hub.docker.com) for images
usage: docker search [OPTIONS] TERM
@y
command: docker search
short: Search Docker Hub for images
long: Search [Docker Hub](https://hub.docker.com) for images
usage: docker search [OPTIONS] TERM
@z

% options:

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: Pretty-print search using a Go template
@y
      description: Pretty-print search using a Go template
@z

@x limit
      description: Max number of search results
@y
      description: Max number of search results
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Search images by name
@y
examples: |-
    ### Search images by name
@z

@x
    This example displays images with a name containing 'busybox':
@y
    This example displays images with a name containing 'busybox':
@z

% snip command...

@x
    ### Display non-truncated description (--no-trunc) {#no-trunc}
@y
    ### Display non-truncated description (--no-trunc) {#no-trunc}
@z

@x
    This example displays images with a name containing 'busybox',
    at least 3 stars and the description isn't truncated in the output:
@y
    This example displays images with a name containing 'busybox',
    at least 3 stars and the description isn't truncated in the output:
@z

% snip command...

@x
    ### Limit search results (--limit) {#limit}
@y
    ### Limit search results (--limit) {#limit}
@z

@x
    The flag `--limit` is the maximum number of results returned by a search. If no
    value is set, the default is set by the daemon.
@y
    The flag `--limit` is the maximum number of results returned by a search. If no
    value is set, the default is set by the daemon.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter is-official=true --filter stars=3`).
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter is-official=true --filter stars=3`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - stars (int - number of stars the image has)
    - is-automated (boolean - true or false) - is the image automated or not (deprecated)
    - is-official (boolean - true or false) - is the image official or not
@y
    - stars (int - number of stars the image has)
    - is-automated (boolean - true or false) - is the image automated or not (deprecated)
    - is-official (boolean - true or false) - is the image official or not
@z

@x
    #### stars
@y
    #### stars
@z

@x
    This example displays images with a name containing 'busybox' and at
    least 3 stars:
@y
    This example displays images with a name containing 'busybox' and at
    least 3 stars:
@z

% snip command...

@x
    #### is-official
@y
    #### is-official
@z

@x
    This example displays images with a name containing 'busybox', at least
    3 stars and are official builds:
@y
    This example displays images with a name containing 'busybox', at least
    3 stars and are official builds:
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty-prints search output
    using a Go template.
@y
    The formatting option (`--format`) pretty-prints search output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are:
@y
    Valid placeholders for the Go template are:
@z

@x
    | Placeholder    | Description                                    |
    |----------------|------------------------------------------------|
    | `.Name`        | Image Name                                     |
    | `.Description` | Image description                              |
    | `.StarCount`   | Number of stars for the image                  |
    | `.IsOfficial`  | "OK" if image is official                      |
@y
    | Placeholder    | Description                                    |
    |----------------|------------------------------------------------|
    | `.Name`        | Image Name                                     |
    | `.Description` | Image description                              |
    | `.StarCount`   | Number of stars for the image                  |
    | `.IsOfficial`  | "OK" if image is official                      |
@z

@x
    When you use the `--format` option, the `search` command will
    output the data exactly as the template declares. If you use the
    `table` directive, column headers are included as well.
@y
    When you use the `--format` option, the `search` command will
    output the data exactly as the template declares. If you use the
    `table` directive, column headers are included as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `StarCount` entries separated by a colon (`:`) for all images:
@y
    The following example uses a template without headers and outputs the
    `Name` and `StarCount` entries separated by a colon (`:`) for all images:
@z

% snip command...

@x
    This example outputs a table format:
@y
    This example outputs a table format:
@z

% snip command...
% snip directives...
