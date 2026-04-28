%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template rm
synopsis: Remove a template image
description: |-
    Remove a template image from the sandbox runtime's image store.
@y
name: sbx template rm
synopsis: Remove a template image
description: |-
    Remove a template image from the sandbox runtime's image store.
@z

@x
    The image can be identified by tag (e.g. "myimage:v1.0") or by image ID
    (full or prefix, e.g. "abc123"). Use "sbx template ls" to see available
    images and their IDs.
@y
    The image can be identified by tag (e.g. "myimage:v1.0") or by image ID
    (full or prefix, e.g. "abc123"). Use "sbx template ls" to see available
    images and their IDs.
@z

@x
usage: sbx template rm TAG|ID [flags]
@y
usage: sbx template rm TAG|ID [flags]
@z

%options:

@x help
      usage: help for rm
@y
      usage: help for rm
@z

%inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Remove by tag
      sbx template rm myimage:v1.0
@y
example: |4-
      # Remove by tag
      sbx template rm myimage:v1.0
@z

@x
      # Remove by image ID (prefix)
      sbx template rm abc123
@y
      # Remove by image ID (prefix)
      sbx template rm abc123
@z

%see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
