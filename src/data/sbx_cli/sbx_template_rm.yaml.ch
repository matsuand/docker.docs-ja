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
    With --cloud:
    The template can be identified by its tmpl_* ID or by its human name
    (resolved via the server-side ?name= filter). Use "sbx template ls --cloud".
@y
    With --cloud:
    The template can be identified by its tmpl_* ID or by its human name
    (resolved via the server-side ?name= filter). Use "sbx template ls --cloud".
@z

@x
usage: sbx template rm TAG|ID|NAME [flags]
@y
usage: sbx template rm TAG|ID|NAME [flags]
@z

%options:

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

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
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
      # Cloud: remove by name
      sbx template rm my-template --cloud
@y
      # Cloud: remove by name
      sbx template rm my-template --cloud
@z

@x
      # Cloud: remove by tmpl_* id
      sbx template rm tmpl_abc123 --cloud
@y
      # Cloud: remove by tmpl_* id
      sbx template rm tmpl_abc123 --cloud
@z

%see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
