%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx kit add
synopsis: Add a mixin to a sandbox
experimental: true
description: |-
    Add a mixin artifact to an existing sandbox.
@y
name: sbx kit add
synopsis: Add a mixin to a sandbox
experimental: true
description: |-
    Add a mixin artifact to an existing sandbox.
@z

@x
    The sandbox's container is recreated with the new kit appended to its
    original kit list, preserving kit-owned volumes (e.g. agent session
    state) across the swap. Workspace data is unaffected: bind-mounted
    sandboxes keep their host-side mount; --clone sandboxes keep their
    in-container working tree via a named workspace volume that
    reattaches to the swap container.
@y
    The sandbox's container is recreated with the new kit appended to its
    original kit list, preserving kit-owned volumes (e.g. agent session
    state) across the swap. Workspace data is unaffected: bind-mounted
    sandboxes keep their host-side mount; --clone sandboxes keep their
    in-container working tree via a named workspace volume that
    reattaches to the swap container.
@z

@x
    The sandbox must already exist and must have been created with the
    recreate-aware label set (sandboxes created before the kit-add recreate
    feature shipped will be refused with a clear error). The reference can be
    a local directory, ZIP file path, OCI registry reference, or git
    repository.
@y
    The sandbox must already exist and must have been created with the
    recreate-aware label set (sandboxes created before the kit-add recreate
    feature shipped will be refused with a clear error). The reference can be
    a local directory, ZIP file path, OCI registry reference, or git
    repository.
@z

@x
usage: sbx kit add SANDBOX REFERENCE [flags]
@y
usage: sbx kit add SANDBOX REFERENCE [flags]
@z

% options:

@x help
      usage: help for add
@y
      usage: help for add
@z

@x kit-arg
      usage: |
        Value for an argument the kit declares, as name=value for every kit or kit.name=value for one (can be repeated)
@y
      usage: |
        Value for an argument the kit declares, as name=value for every kit or kit.name=value for one (can be repeated)
@z

@x kit-args-file
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@y
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
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
      # Add a local mixin directory to a sandbox
      sbx kit add my-sandbox ./mcp-postgres/
@y
example: |4-
      # Add a local mixin directory to a sandbox
      sbx kit add my-sandbox ./mcp-postgres/
@z

@x
      # Add a kit from a ZIP file
      sbx kit add my-sandbox ./mcp-postgres.zip
@y
      # Add a kit from a ZIP file
      sbx kit add my-sandbox ./mcp-postgres.zip
@z

@x
      # Add a kit from an OCI registry
      sbx kit add my-sandbox ghcr.io/myorg/mcp-postgres:1.0
@y
      # Add a kit from an OCI registry
      sbx kit add my-sandbox ghcr.io/myorg/mcp-postgres:1.0
@z

@x
      # Add a kit from a git repository
      sbx kit add my-sandbox git+https://github.com/org/kits.git#dir=mcp-postgres
@y
      # Add a kit from a git repository
      sbx kit add my-sandbox git+https://github.com/org/kits.git#dir=mcp-postgres
@z

@x
      # Add a parameterized kit
      sbx kit add my-sandbox ./mcp-postgres/ --kit-arg host=db.internal
@y
      # Add a parameterized kit
      sbx kit add my-sandbox ./mcp-postgres/ --kit-arg host=db.internal
@z

% see_also:

@x
    - sbx kit - (Experimental) Manage kit artifacts
@y
    - sbx kit - (Experimental) Manage kit artifacts
@z
