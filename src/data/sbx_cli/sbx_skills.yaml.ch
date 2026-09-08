%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx skills
synopsis: Manage skills shared across sandboxes
experimental: true
description: |-
    Manage the persistent agent skills store shared across sandboxes.
@y
name: sbx skills
synopsis: Manage skills shared across sandboxes
experimental: true
description: |-
    Manage the persistent agent skills store shared across sandboxes.
@z

@x
    Copy skills from supported agent directories on the host into the store with:
      sbx skills import
@y
    Copy skills from supported agent directories on the host into the store with:
      sbx skills import
@z

@x
    Sandboxes with skills sharing enabled mount the store read-write. Use
    --no-share-skills when creating a sandbox to opt out.
usage: sbx skills COMMAND
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for skills
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx skills import - Import skills from supported agent directories
    - sbx skills ls - List imported skills
@y
    Sandboxes with skills sharing enabled mount the store read-write. Use
    --no-share-skills when creating a sandbox to opt out.
usage: sbx skills COMMAND
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for skills
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
see_also:
    - sbx - Manage AI coding agent sandboxes.
    - sbx skills import - Import skills from supported agent directories
    - sbx skills ls - List imported skills
@z
