%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog bootstrap
short: |
    Create a starter catalog file with Docker and Docker Hub server entries as examples
long: |-
    Create a starter catalog file with Docker Hub and Docker CLI server entries as examples.
    This command extracts the official Docker server definitions and creates a properly formatted
    catalog file that users can modify and use as a foundation for their custom catalogs.
@y
command: docker mcp catalog bootstrap
short: |
    Create a starter catalog file with Docker and Docker Hub server entries as examples
long: |-
    Create a starter catalog file with Docker Hub and Docker CLI server entries as examples.
    This command extracts the official Docker server definitions and creates a properly formatted
    catalog file that users can modify and use as a foundation for their custom catalogs.
@z

@x
    The output file is standalone and not automatically imported - users can modify it and then
    import it or use it as a source for the 'catalog add' command.
@y
    The output file is standalone and not automatically imported - users can modify it and then
    import it or use it as a source for the 'catalog add' command.
@z

@x
usage: docker mcp catalog bootstrap <output-file-path>
@y
usage: docker mcp catalog bootstrap <output-file-path>
@z

% snip code...
