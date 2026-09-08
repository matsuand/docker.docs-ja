%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit pack
synopsis: Package a directory as a kit artifact
experimental: true
description: |-
    Validate and package a kit artifact directory as a ZIP file.
@y
name: sbx kit pack
synopsis: Package a directory as a kit artifact
experimental: true
description: |-
    Validate and package a kit artifact directory as a ZIP file.
@z

@x
    The directory must contain a valid spec.yaml and an optional files/ directory.
@y
    The directory must contain a valid spec.yaml and an optional files/ directory.
@z

@x
usage: sbx kit pack DIRECTORY [flags]
@y
usage: sbx kit pack DIRECTORY [flags]
@z

% options:

@x help
      usage: help for pack
@y
      usage: help for pack
@z

@x output
      usage: 'Output ZIP file path (default: <name>.zip)'
@y
      usage: 'Output ZIP file path (default: <name>.zip)'
@z

% inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
