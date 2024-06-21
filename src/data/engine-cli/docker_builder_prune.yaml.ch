%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker builder prune
short: Remove build cache
long: Remove build cache
usage: docker builder prune
@y
command: docker builder prune
short: Remove build cache
long: Remove build cache
usage: docker builder prune
@z

% options:

@x all
      description: Remove all unused build cache, not just dangling ones
@y
      description: Remove all unused build cache, not just dangling ones
@z

@x filter
      description: Provide filter values (e.g. `until=24h`)
@y
      description: Provide filter values (e.g. `until=24h`)
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

@x keep-storage
      description: Amount of disk space to keep for cache
@y
      description: Amount of disk space to keep for cache
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
