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
@y
    Use --output to also export the image to a tar file that can be shared
    and loaded on another host with: sbx template load FILE
@z

@x
    With --cloud:
    Snapshot a running cloud sandbox into a cloud-managed template. The
    snapshot can take several minutes for kit-sized images; the command
    polls for completion. Use --description to attach a free-form description
    to the saved template.
@y
    With --cloud:
    Snapshot a running cloud sandbox into a cloud-managed template. The
    snapshot can take several minutes for kit-sized images; the command
    polls for completion. Use --description to attach a free-form description
    to the saved template.
@z

@x
    --capture-mode controls what gets captured: "disk" (default) cold-boots
    from the filesystem; "all" captures memory + disk + microVM checkpoint so
    subsequent runs resume in sub-second time at the cost of a slower load.
@y
    --capture-mode controls what gets captured: "disk" (default) cold-boots
    from the filesystem; "all" captures memory + disk + microVM checkpoint so
    subsequent runs resume in sub-second time at the cost of a slower load.
@z

@x
    Cloud snapshots typically produce multi-GB templates and take several
    minutes to complete. See https://docs.docker.com/ai/sandboxes/ for the snapshot/load model.
@y
    Cloud snapshots typically produce multi-GB templates and take several
    minutes to complete. See https://docs.docker.com/ai/sandboxes/ for the snapshot/load model.
@z

@x
usage: sbx template save SANDBOX TAG [flags]
@y
usage: sbx template save SANDBOX TAG [flags]
@z

% options:

@x capture-mode
      usage: |
        What gets captured for this template. "disk" (default) captures only the filesystem — cold-boot from a standard OCI image, faster load. "all" captures memory + disk + microVM checkpoint — sub-second TTI on resume, slower load. Only effective with --cloud.
@y
      usage: |
        What gets captured for this template. "disk" (default) captures only the filesystem — cold-boot from a standard OCI image, faster load. "all" captures memory + disk + microVM checkpoint — sub-second TTI on resume, slower load. Only effective with --cloud.
@z

@x description
      usage: Description for the template (cloud only)
@y
      usage: Description for the template (cloud only)
@z

@x help
      usage: help for save
@y
      usage: help for save
@z

@x output
      usage: Also export the image to a tar file
@y
      usage: Also export the image to a tar file
@z

% inherited_options:

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
      # Save as a template for new sandboxes on this host
      sbx template save my-sandbox myimage:v1.0
@y
example: |4-
      # Save as a template for new sandboxes on this host
      sbx template save my-sandbox myimage:v1.0
@z

@x
      # Also export to a shareable tar file
      sbx template save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
@y
      # Also export to a shareable tar file
      sbx template save my-sandbox myimage:v1.0 --output /tmp/myimage.tar
@z

@x
      # Cloud: snapshot a running cloud sandbox into a cloud-managed template
      sbx template save sbx_abc123 my-snap --cloud
@y
      # Cloud: snapshot a running cloud sandbox into a cloud-managed template
      sbx template save sbx_abc123 my-snap --cloud
@z

@x
      # Cloud: attach a description to the saved template
      sbx template save sbx_abc123 my-snap --cloud --description "nightly build"
@y
      # Cloud: attach a description to the saved template
      sbx template save sbx_abc123 my-snap --cloud --description "nightly build"
@z

@x
      # Cloud: capture memory + disk + microVM checkpoint for sub-second resume
      sbx template save sbx_abc123 my-snap --cloud --capture-mode all
@y
      # Cloud: capture memory + disk + microVM checkpoint for sub-second resume
      sbx template save sbx_abc123 my-snap --cloud --capture-mode all
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
