%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout cache prune
short: Remove temporary or cached data
long: |-
    The `docker scout cache prune` command removes temporary data and SBOM cache.

    By default, `docker scout cache prune` only deletes temporary data.
    To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
@y
command: docker scout cache prune
short: Remove temporary or cached data
long: |-
    The `docker scout cache prune` command removes temporary data and SBOM cache.

    By default, `docker scout cache prune` only deletes temporary data.
    To delete temporary data and clear the SBOM cache, use the `--sboms` flag.
@z

@x
usage: docker scout cache prune
@y
usage: docker scout cache prune
@z

% options:

@x epss
      description: Prune cached EPSS scores
@y
      description: Prune cached EPSS scores
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

@x sboms
      description: Prune cached SBOMs
@y
      description: Prune cached SBOMs
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
    ### Delete temporary data
@y
examples: |-
    ### Delete temporary data
@z

% snip command...

@x
    ### Delete temporary _and_ cache data
@y
    ### Delete temporary _and_ cache data
@z

% snip command...
% snip directives...
