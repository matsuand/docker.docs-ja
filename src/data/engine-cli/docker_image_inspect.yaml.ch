%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image inspect
short: Display detailed information on one or more images
long: Display detailed information on one or more images
usage: docker image inspect [OPTIONS] IMAGE [IMAGE...]
@y
command: docker image inspect
short: Display detailed information on one or more images
long: Display detailed information on one or more images
usage: docker image inspect [OPTIONS] IMAGE [IMAGE...]
@z

% options:

@x format
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x platform
      description: |-
        Inspect a specific platform of the multi-platform image.
        If the image or the server is not multi-platform capable, the command will error out if the platform does not match.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@y
      description: |-
        Inspect a specific platform of the multi-platform image.
        If the image or the server is not multi-platform capable, the command will error out if the platform does not match.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
