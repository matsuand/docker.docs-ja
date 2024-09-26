%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker system df
short: Show docker disk usage
long: |-
    The `docker system df` command displays information regarding the
    amount of disk space used by the Docker daemon.
@y
command: docker system df
short: Show docker disk usage
long: |-
    The `docker system df` command displays information regarding the
    amount of disk space used by the Docker daemon.
@z

@x
usage: docker system df [OPTIONS]
@y
usage: docker system df [OPTIONS]
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

@x verbose
      description: Show detailed information on space usage
@y
      description: Show detailed information on space usage
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    By default the command displays a summary of the data used:
@y
examples: |-
    By default the command displays a summary of the data used:
@z

% snip command...

@x
    Use the `-v, --verbose` flag to get more detailed information:
@y
    Use the `-v, --verbose` flag to get more detailed information:
@z

% snip command...

@x
    * `SHARED SIZE` is the amount of space that an image shares with another one (i.e. their common data)
    * `UNIQUE SIZE` is the amount of space that's only used by a given image
    * `SIZE` is the virtual size of the image, it's the sum of `SHARED SIZE` and `UNIQUE SIZE`
@y
    * `SHARED SIZE` is the amount of space that an image shares with another one (i.e. their common data)
    * `UNIQUE SIZE` is the amount of space that's only used by a given image
    * `SIZE` is the virtual size of the image, it's the sum of `SHARED SIZE` and `UNIQUE SIZE`
@z

@x
    > [!NOTE]
    > Network information isn't shown, because it doesn't consume disk space.
@y
    > [!NOTE]
    > Network information isn't shown, because it doesn't consume disk space.
@z

% snip directives...
