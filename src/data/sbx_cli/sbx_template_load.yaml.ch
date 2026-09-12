%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx template load
synopsis: Load an image from a tar file into the sandbox runtime
description: |-
    Load an image from a tar file into the sandbox runtime's image store.
@y
name: sbx template load
synopsis: Load an image from a tar file into the sandbox runtime
description: |-
    Load an image from a tar file into the sandbox runtime's image store.
@z

@x
    The loaded image can be used as a template for new sandboxes.
    Tar files are typically created with: sbx template save SANDBOX TAG --output FILE
@y
    The loaded image can be used as a template for new sandboxes.
    Tar files are typically created with: sbx template save SANDBOX TAG --output FILE
@z

@x
    With --cloud:
    The tar is uploaded to the cloud template registry as a new template.
    Takes two arguments (FILE, NAME). NAME must be unique per account.
    --cpus and --memory-mib are required (the server enforces power-of-two
    CPUs and memory:cpu ratio constraints). --capture-mode controls what
    gets captured for the template: "disk" (default) is faster to load and
    cold-boots from the filesystem; "all" captures memory + disk + microVM
    checkpoint so subsequent runs resume in sub-second time at the cost of
    a slower load.
@y
    With --cloud:
    The tar is uploaded to the cloud template registry as a new template.
    Takes two arguments (FILE, NAME). NAME must be unique per account.
    --cpus and --memory-mib are required (the server enforces power-of-two
    CPUs and memory:cpu ratio constraints). --capture-mode controls what
    gets captured for the template: "disk" (default) is faster to load and
    cold-boots from the filesystem; "all" captures memory + disk + microVM
    checkpoint so subsequent runs resume in sub-second time at the cost of
    a slower load.
@z

@x
    Cloud loads upload your full tar to the registry; multi-GB uploads can
    take several minutes. See https://docs.docker.com/ai/sandboxes/ for the snapshot/load model.
@y
    Cloud loads upload your full tar to the registry; multi-GB uploads can
    take several minutes. See https://docs.docker.com/ai/sandboxes/ for the snapshot/load model.
@z

@x
usage: sbx template load FILE [NAME] [flags]
@y
usage: sbx template load FILE [NAME] [flags]
@z

% options:

@x capture-mode
      usage: |
        What gets captured for this template. "disk" (default) captures only the filesystem — cold-boot from a standard OCI image, faster load. "all" captures memory + disk + microVM checkpoint — sub-second TTI on resume, slower load. Only effective with --cloud.
@y
      usage: |
        What gets captured for this template. "disk" (default) captures only the filesystem — cold-boot from a standard OCI image, faster load. "all" captures memory + disk + microVM checkpoint — sub-second TTI on resume, slower load. Only effective with --cloud.
@z

@x cpus
      usage: Number of CPUs (1, 2, 4, 8, or 16; required with --cloud)
@y
      usage: Number of CPUs (1, 2, 4, 8, or 16; required with --cloud)
@z

@x description
      usage: Optional template description (--cloud only)
@y
      usage: Optional template description (--cloud only)
@z

@x help
      usage: help for load
@y
      usage: help for load
@z

@x memory-mib
      usage: |
        Memory in MiB (512–32768, must satisfy 2:1/1:1/1:2 ratio with --cpus; required with --cloud)
@y
      usage: |
        Memory in MiB (512–32768, must satisfy 2:1/1:1/1:2 ratio with --cpus; required with --cloud)
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
      # Load an image from a tar file
      sbx template load /tmp/myimage.tar              # Linux/macOS
      sbx template load C:\Users\me\myimage.tar       # Windows
@y
example: |4-
      # Load an image from a tar file
      sbx template load /tmp/myimage.tar              # Linux/macOS
      sbx template load C:\Users\me\myimage.tar       # Windows
@z

@x
      # Use the loaded image as a template
      sbx run -t myimage:v1.0 claude
@y
      # Use the loaded image as a template
      sbx run -t myimage:v1.0 claude
@z

@x
      # Cloud: upload a tar as a cloud-managed template (disk capture, faster load)
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048
@y
      # Cloud: upload a tar as a cloud-managed template (disk capture, faster load)
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048
@z

@x
      # Cloud: capture memory + disk + microVM checkpoint for sub-second resume
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048 --capture-mode all
@y
      # Cloud: capture memory + disk + microVM checkpoint for sub-second resume
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048 --capture-mode all
@z

@x
      # Cloud: with a description
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048 --description "Nightly baseline"
@y
      # Cloud: with a description
      sbx template load /tmp/myimage.tar my-template --cloud --cpus 2 --memory-mib 2048 --description "Nightly baseline"
@z

% see_also:

@x
    - sbx template - Manage sandbox templates
@y
    - sbx template - Manage sandbox templates
@z
