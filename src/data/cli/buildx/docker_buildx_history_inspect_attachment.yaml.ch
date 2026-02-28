%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history inspect attachment
short: Inspect a build record attachment
long: |-
    Inspect a specific attachment from a build record, such as a provenance file or
    SBOM. Attachments are optional artifacts stored with the build and may be
    platform-specific.
usage: docker buildx history inspect attachment [OPTIONS] [REF [DIGEST]]
@y
command: docker buildx history inspect attachment
short: Inspect a build record attachment
long: |-
    Inspect a specific attachment from a build record, such as a provenance file or
    SBOM. Attachments are optional artifacts stored with the build and may be
    platform-specific.
usage: docker buildx history inspect attachment [OPTIONS] [REF [DIGEST]]
@z

% options:

@x platform
      description: Platform of attachment
@y
      description: Platform of attachment
@z

@x type
      description: Type of attachment
@y
      description: Type of attachment
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
    ### Inspect an attachment by platform (--platform) {#platform}
@y
examples: |-
    ### Inspect an attachment by platform (--platform) {#platform}
@z

% snip command...

@x
    ### Inspect an attachment by type (--type) {#type}
@y
    ### Inspect an attachment by type (--type) {#type}
@z

@x
    Supported types include:
    * `index`
    * `manifest`
    * `image`
    * `provenance`
    * `sbom`
@y
    Supported types include:
    * `index`
    * `manifest`
    * `image`
    * `provenance`
    * `sbom`
@z

@x
    #### Index
@y
    #### Index
@z

% snip command...

@x
    #### Manifest
@y
    #### Manifest
@z

% snip command...

@x
    #### Provenance
@y
    #### Provenance
@z

% snip command...

@x
    ### Inspect an attachment by digest
@y
    ### Inspect an attachment by digest
@z

@x
    You can inspect an attachment directly using its digest, which you can get from
    the `inspect` output:
@y
    You can inspect an attachment directly using its digest, which you can get from
    the `inspect` output:
@z

@x within command
    # Using a build ID
@y
    # Using a build ID
@z

@x
    # Or using a relative offset
@y
    # Or using a relative offset
@z

@x
    Use `--type sbom` or `--type provenance` to filter attachments by type. To
    inspect a specific attachment by digest, omit the `--type` flag.
@y
    Use `--type sbom` or `--type provenance` to filter attachments by type. To
    inspect a specific attachment by digest, omit the `--type` flag.
@z

% snip directives...
