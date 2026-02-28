%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout push
short: Push an image or image index to Docker Scout
long: |
    The `docker scout push` command lets you push an image or analysis result to Docker Scout.
usage: docker scout push IMAGE
pname: docker scout
plink: docker_scout.yaml
@y
command: docker scout push
short: Push an image or image index to Docker Scout
long: |
    The `docker scout push` command lets you push an image or analysis result to Docker Scout.
usage: docker scout push IMAGE
pname: docker scout
plink: docker_scout.yaml
@z

% options:

@x author
      description: Name of the author of the image
@y
      description: Name of the author of the image
@z

@x dry-run
      description: Do not push the image but process it
@y
      description: Do not push the image but process it
@z

@x org
      description: Namespace of the Docker organization to which image will be pushed
@y
      description: Namespace of the Docker organization to which image will be pushed
@z

@x output
      description: Write the report to a file
@y
      description: Write the report to a file
@z

@x platform
      description: Platform of image to be pushed
@y
      description: Platform of image to be pushed
@z

@x sbom
      description: Create and upload SBOMs
@y
      description: Create and upload SBOMs
@z

@x timestamp
      description: Timestamp of image or tag creation
@y
      description: Timestamp of image or tag creation
@z

% inherited_options:

@x debug
      description: Debug messages
@y
      description: Debug messages
@z

@x verbose-debug
      description: Verbose debug
@y
      description: Verbose debug
@z

@x
examples: |-
    ### Push an image to Docker Scout
@y
examples: |-
    ### Push an image to Docker Scout
@z

% snip command...
% snip directives...
