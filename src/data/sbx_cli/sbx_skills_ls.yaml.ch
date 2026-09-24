%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills ls
synopsis: List installed skills
experimental: true
description: List skills available to agents in Docker Sandboxes.
@y
name: sbx skills ls
synopsis: List installed skills
experimental: true
description: List skills available to agents in Docker Sandboxes.
@z

@x
usage: sbx skills ls [flags]
@y
usage: sbx skills ls [flags]
@z

% options:

@x help
      usage: help for ls
@y
      usage: help for ls
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x quiet
      usage: Only display skill names
@y
      usage: Only display skill names
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx skills - (Experimental) Manage skills available in sandboxes
@y
    - sbx skills - (Experimental) Manage skills available in sandboxes
@z
