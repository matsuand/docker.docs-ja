%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx replay
short: Replay a build from its provenance
long: |-
    `buildx replay` reads the SLSA provenance attestation of an existing build and
    reproduces the build with the recorded frontend, options, and source digests.
    Replay runs on the selected builder and requires BuildKit v0.27 or later.
@y
command: docker buildx replay
short: Replay a build from its provenance
long: |-
    `buildx replay` reads the SLSA provenance attestation of an existing build and
    reproduces the build with the recorded frontend, options, and source digests.
    Replay runs on the selected builder and requires BuildKit v0.27 or later.
@z

@x
    Subjects are accepted in three forms:
@y
    Subjects are accepted in three forms:
@z

@x
    - `docker-image://<ref>` or a bare `<ref>` — resolve through the registry.
    - `oci-layout://<path>[:<tag>]` — read from a local OCI layout.
    - A local attestation file: an in-toto statement (`.intoto.jsonl`), an
      unsigned DSSE envelope, a Sigstore bundle, or a bare SLSA provenance
      predicate.
@y
    - `docker-image://<ref>` or a bare `<ref>` — resolve through the registry.
    - `oci-layout://<path>[:<tag>]` — read from a local OCI layout.
    - A local attestation file: an in-toto statement (`.intoto.jsonl`), an
      unsigned DSSE envelope, a Sigstore bundle, or a bare SLSA provenance
      predicate.
@z

@x
    A build can be replayed when:
@y
    A build can be replayed when:
@z

@x
    - its provenance was recorded with `mode=max`
      (`--provenance=mode=max` or `--attest=type=provenance,mode=max`). `mode=min`
      provenance omits the build arguments, secrets, and SSH needed for replay;
    - its build context was a Git repository or an HTTP(S) URL. Builds that used
      local directories, stdin, OCI layouts, or other Bake targets as build
      contexts cannot be replayed;
    - it did not use `--network=host`, unless a different `--network` is passed
      to replay;
    - the recorded sources are still available.
@y
    - its provenance was recorded with `mode=max`
      (`--provenance=mode=max` or `--attest=type=provenance,mode=max`). `mode=min`
      provenance omits the build arguments, secrets, and SSH needed for replay;
    - its build context was a Git repository or an HTTP(S) URL. Builds that used
      local directories, stdin, OCI layouts, or other Bake targets as build
      contexts cannot be replayed;
    - it did not use `--network=host`, unless a different `--network` is passed
      to replay;
    - the recorded sources are still available.
@z

@x
    Replay rebuilds one platform at a time. For a multi-platform image, select the
    platform with `--platform`. By default, the only platform of the image or the
    default platform of the builder is used.
@y
    Replay rebuilds one platform at a time. For a multi-platform image, select the
    platform with `--platform`. By default, the only platform of the image or the
    default platform of the builder is used.
@z

@x
usage: docker buildx replay
@y
usage: docker buildx replay
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
