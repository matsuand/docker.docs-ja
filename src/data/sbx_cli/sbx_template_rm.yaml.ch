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
    Identify the image by tag, repository digest (REPOSITORY@sha256:DIGEST),
    or image ID (full or prefix). Use "sbx template ls --all --digests" to see
    available images and their digests.
@y
    Identify the image by tag, repository digest (REPOSITORY@sha256:DIGEST),
    or image ID (full or prefix). Use "sbx template ls --all --digests" to see
    available images and their digests.
@z

@x
    With --cloud:
    Remove a cloud sandbox template by name or tmpl_* ID.
    Use "sbx --cloud template ls" to list templates.
@y
    With --cloud:
    Remove a cloud sandbox template by name or tmpl_* ID.
    Use "sbx --cloud template ls" to list templates.
@z

@x
usage: sbx template rm TAG|DIGEST|ID|NAME [flags]
@y
usage: sbx template rm TAG|DIGEST|ID|NAME [flags]
@z

%options:

@x force
      usage: Skip confirmation prompts
@y
      usage: Skip confirmation prompts
@z

@x help
      usage: help for rm
@y
      usage: help for rm
@z

%inherited_options:

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

@x
      # Remove by repository digest
      sbx template rm myimage@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
@y
      # Remove by repository digest
      sbx template rm myimage@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
@z

@x
      # Cloud: remove by name
      sbx --cloud template rm my-template
@y
      # Cloud: remove by name
      sbx --cloud template rm my-template
@z

@x
      # Cloud: remove by tmpl_* id
      sbx --cloud template rm tmpl_abc123
@y
      # Cloud: remove by tmpl_* id
      sbx --cloud template rm tmpl_abc123
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
