%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx replay build
short: Rebuild an image from provenance and pinned materials
long: |-
    `replay build` reconstructs an image from the provenance attestation attached
    to an existing subject.
@y
command: docker buildx replay build
short: Rebuild an image from provenance and pinned materials
long: |-
    `replay build` reconstructs an image from the provenance attestation attached
    to an existing subject.
@z

@x
    The replay mode controls how sources are resolved:
@y
    The replay mode controls how sources are resolved:
@z

@x
    - `materials` (default) pins every source to the digest recorded in the
      provenance. A source that is not recorded, or whose content changed, fails
      the build.
    - `frontend` replays the recorded frontend and options, but resolves sources
      again, so the result can differ from the original build.
@y
    - `materials` (default) pins every source to the digest recorded in the
      provenance. A source that is not recorded, or whose content changed, fails
      the build.
    - `frontend` replays the recorded frontend and options, but resolves sources
      again, so the result can differ from the original build.
@z

@x
    Replayed builds do not add new provenance or SBOM attestations. Local outputs
    with `mode=delete` are not supported.
@y
    Replayed builds do not add new provenance or SBOM attestations. Local outputs
    with `mode=delete` are not supported.
@z

@x
usage: docker buildx replay build [OPTIONS] SUBJECT
@y
usage: docker buildx replay build [OPTIONS] SUBJECT
@z

% options:

@x dry-run
      description: Print a plan of the replay without solving or exporting
@y
      description: Print a plan of the replay without solving or exporting
@z

@x format
      description: Format dry-run output (`pretty` | `json`)
@y
      description: Format dry-run output (`pretty` | `json`)
@z

@x load
      description: Shorthand for `--output=type=docker`
@y
      description: Shorthand for `--output=type=docker`
@z

@x materials
      description: |
        Materials store (repeatable; format: `provenance` | `oci-layout://<path>[:<tag>]` | `<absolute-path>` | `<key>=<value>`)
@y
      description: |
        Materials store (repeatable; format: `provenance` | `oci-layout://<path>[:<tag>]` | `<absolute-path>` | `<key>=<value>`)
@z

@x network
      description: |
        Network mode for RUN instructions (`default` | `none`; defaults to the mode of the original build)
@y
      description: |
        Network mode for RUN instructions (`default` | `none`; defaults to the mode of the original build)
@z

@x output
      description: 'Output destination (format: `type=local,dest=path`)'
@y
      description: 'Output destination (format: `type=local,dest=path`)'
@z

@x platform
      description: |
        Platform of the subject to replay (defaults to the only platform of the subject or the builder default platform)
@y
      description: |
        Platform of the subject to replay (defaults to the only platform of the subject or the builder default platform)
@z

@x progress
      description: |
        Set type of progress output (`auto` | `plain` | `tty` | `quiet` | `rawjson`)
@y
      description: |
        Set type of progress output (`auto` | `plain` | `tty` | `quiet` | `rawjson`)
@z

@x push
      description: Shorthand for `--output=type=registry,unpack=false`
@y
      description: Shorthand for `--output=type=registry,unpack=false`
@z

@x replay-mode
      description: Replay mode (`materials` | `frontend`)
@y
      description: Replay mode (`materials` | `frontend`)
@z

@x secret
      description: |
        Secret to expose to the replayed build (format: `id=mysecret[,src=/local/secret]`)
@y
      description: |
        Secret to expose to the replayed build (format: `id=mysecret[,src=/local/secret]`)
@z

@x ssh
      description: |
        SSH agent socket or keys to expose (format: `default|<id>[=<socket>|<key>[,<key>]]`)
@y
      description: |
        SSH agent socket or keys to expose (format: `default|<id>[=<socket>|<key>[,<key>]]`)
@z

@x tag
      description: 'Image identifier (format: `[registry/]repository[:tag]`)'
@y
      description: 'Image identifier (format: `[registry/]repository[:tag]`)'
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### Replay a registry image and export to an OCI tar
@y
examples: |-
    ### Replay a registry image and export to an OCI tar
@z

@x
    ```console
    docker buildx replay build docker-image://example.com/app@sha256:deadbeef \
      --output=type=oci,dest=replay.oci.tar
    ```
@y
    ```console
    docker buildx replay build docker-image://example.com/app@sha256:deadbeef \
      --output=type=oci,dest=replay.oci.tar
    ```
@z

@x
    ### Dry-run a replay to inspect the plan
@y
    ### Dry-run a replay to inspect the plan
@z

@x
    ```console
    docker buildx replay build docker-image://example.com/app@sha256:deadbeef --dry-run --format=json | jq
    ```
@y
    ```console
    docker buildx replay build docker-image://example.com/app@sha256:deadbeef --dry-run --format=json | jq
    ```
@z

@x
    Dry-run runs the same checks as a real replay, so a subject that cannot be
    replayed fails before any build starts.
@y
    Dry-run runs the same checks as a real replay, so a subject that cannot be
    replayed fails before any build starts.
@z
