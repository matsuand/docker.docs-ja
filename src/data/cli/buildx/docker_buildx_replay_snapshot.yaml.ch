%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx replay snapshot
short: Export replay inputs for a subject as a reusable materials store
long: Export replay inputs for a subject as a reusable materials store
usage: docker buildx replay snapshot [OPTIONS] SUBJECT
@y
command: docker buildx replay snapshot
short: Export replay inputs for a subject as a reusable materials store
long: Export replay inputs for a subject as a reusable materials store
usage: docker buildx replay snapshot [OPTIONS] SUBJECT
@z

% options:

@x dry-run
      description: Print a JSON plan of the snapshot without writing output
@y
      description: Print a JSON plan of the snapshot without writing output
@z

@x include-materials
      description: Include material content in the snapshot
@y
      description: Include material content in the snapshot
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
      description: |
        Output destination (default: `-` — oci tar to stdout; bare `<path>` writes an oci-layout directory; `type=oci,dest=X[,tar=true|false]`)
@y
      description: |
        Output destination (default: `-` — oci tar to stdout; bare `<path>` writes an oci-layout directory; `type=oci,dest=X[,tar=true|false]`)
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
