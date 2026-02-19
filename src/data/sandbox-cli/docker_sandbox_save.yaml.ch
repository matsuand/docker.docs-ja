%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox save
short: Save a snapshot of the sandbox as a template
long: |-
    Save a snapshot of the sandbox as a template.
@y
command: docker sandbox save
short: Save a snapshot of the sandbox as a template
long: |-
    Save a snapshot of the sandbox as a template.
@z

@x
    By default, the image is loaded into the host's Docker daemon (requires Docker to be running).
    Use --output to save the image to a tar file instead.
@y
    By default, the image is loaded into the host's Docker daemon (requires Docker to be running).
    Use --output to save the image to a tar file instead.
@z

@x
    Examples:
      # Load into host Docker (requires host Docker running)
      docker sandbox save my-sandbox myimage:v1.0
@y
    Examples:
      # Load into host Docker (requires host Docker running)
      docker sandbox save my-sandbox myimage:v1.0
@z

@x
      # Save to file (works without host Docker)
      docker sandbox save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
@y
      # Save to file (works without host Docker)
      docker sandbox save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
@z

@x
usage: docker sandbox save SANDBOX TAG
@y
usage: docker sandbox save SANDBOX TAG
@z

% pname
% plink
% options

@x output
      description: |
        Save image to specified tar file instead of loading into host Docker
@y
      description: |
        Save image to specified tar file instead of loading into host Docker
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x socket
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@y
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@z

% snip directives...
