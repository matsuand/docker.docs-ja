%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template save
synopsis: Save a snapshot of the sandbox as a template
description: |-
    Save a snapshot of the sandbox as a template.
@y
name: sbx template save
synopsis: Save a snapshot of the sandbox as a template
description: |-
    Save a snapshot of the sandbox as a template.
@z

@x
    The saved image is stored in the sandbox runtime's image store and can be
    used as a template for new sandboxes with: sbx run -t TAG AGENT [WORKSPACE]
@y
    The saved image is stored in the sandbox runtime's image store and can be
    used as a template for new sandboxes with: sbx run -t TAG AGENT [WORKSPACE]
@z

@x
    Use --output to also export the image to a tar file that can be shared
    and loaded on another host with: sbx template load FILE
usage: sbx template save SANDBOX TAG [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for save
    - name: output
      shorthand: o
      usage: Also export the image to a tar file
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Save as a template for new sandboxes on this host
      sbx template save my-sandbox myimage:v1.0
@y
    Use --output to also export the image to a tar file that can be shared
    and loaded on another host with: sbx template load FILE
usage: sbx template save SANDBOX TAG [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for save
    - name: output
      shorthand: o
      usage: Also export the image to a tar file
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # Save as a template for new sandboxes on this host
      sbx template save my-sandbox myimage:v1.0
@z

@x
      # Also export to a shareable tar file
      sbx template save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
see_also:
    - sbx template - Manage sandbox templates
@y
      # Also export to a shareable tar file
      sbx template save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
see_also:
    - sbx template - Manage sandbox templates
@z
