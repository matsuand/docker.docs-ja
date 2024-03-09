%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx imagetools inspect
short: Show details of an image in the registry
long: |-
    Show details of an image in the registry.
@y
command: docker buildx imagetools inspect
short: Show details of an image in the registry
long: |-
    Show details of an image in the registry.
@z

% snip command...

@x
usage: docker buildx imagetools inspect [OPTIONS] NAME
@y
usage: docker buildx imagetools inspect [OPTIONS] NAME
@z

% options:

@x format
      description: Format the output using the given Go template
@y
      description: Format the output using the given Go template
@z

@x raw
      description: Show original, unformatted JSON manifest
@y
      description: Show original, unformatted JSON manifest
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@y
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    Format the output using the given Go template. Defaults to `{{.Manifest}}` if
    unset. Following fields are available:
@y
    Format the output using the given Go template. Defaults to `{{.Manifest}}` if
    unset. Following fields are available:
@z

@x
    * `.Name`: provides the reference of the image
    * `.Manifest`: provides the manifest or manifest list
    * `.Image`: provides the image config
@y
    * `.Name`: provides the reference of the image
    * `.Manifest`: provides the manifest or manifest list
    * `.Image`: provides the image config
@z

@x
    #### `.Name`
@y
    #### `.Name`
@z

% snip command...

@x
    #### `.Manifest`
@y
    #### `.Manifest`
@z

% snip command...
% snip command...

@x
    #### JSON output
@y
    #### JSON output
@z

@x
    A `json` template function is also available if you want to render fields in
    JSON format:
@y
    A `json` template function is also available if you want to render fields in
    JSON format:
@z

% snip command...
% snip command...
% snip command...

@x
    The following command provides [SLSA](https://github.com/moby/buildkit/blob/master/docs/attestations/slsa-provenance.md)
    JSON output:
@y
    The following command provides [SLSA](https://github.com/moby/buildkit/blob/master/docs/attestations/slsa-provenance.md)
    JSON output:
@z

% snip command...

@x
    The following command provides [SBOM](https://github.com/moby/buildkit/blob/master/docs/attestations/sbom.md)
    JSON output:
@y
    The following command provides [SBOM](https://github.com/moby/buildkit/blob/master/docs/attestations/sbom.md)
    JSON output:
@z

% snip command...
% snip command...

@x
    #### Multi-platform
@y
    #### Multi-platform
@z

@x
    Multi-platform images are supported for `.Image`, `.SLSA` and `.SBOM` fields.
    If you want to pick up a specific platform, you can specify it using the `index`
    go template function:
@y
    Multi-platform images are supported for `.Image`, `.SLSA` and `.SBOM` fields.
    If you want to pick up a specific platform, you can specify it using the `index`
    go template function:
@z

% snip command...

@x
    ### Show original JSON manifest (--raw) {#raw}
@y
    ### Show original JSON manifest (--raw) {#raw}
@z

@x
    Use the `--raw` option to print the raw JSON manifest.
@y
    Use the `--raw` option to print the raw JSON manifest.
@z

% snip command...
% snip command...
% snip directives...
