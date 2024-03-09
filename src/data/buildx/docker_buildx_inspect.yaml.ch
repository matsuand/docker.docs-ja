%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx inspect
short: Inspect current builder instance
long: Shows information about the current or specified builder.
usage: docker buildx inspect [NAME]
@y
command: docker buildx inspect
short: Inspect current builder instance
long: Shows information about the current or specified builder.
usage: docker buildx inspect [NAME]
@z

% options:

@x bootstrap
      description: Ensure builder has booted before inspecting
@y
      description: Ensure builder has booted before inspecting
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Ensure that the builder is running before inspecting (--bootstrap) {#bootstrap}
@y
examples: |-
    ### Ensure that the builder is running before inspecting (--bootstrap) {#bootstrap}
@z

@x
    Use the `--bootstrap` option to ensure that the builder is running before
    inspecting it. If the driver is `docker-container`, then `--bootstrap` starts
    the BuildKit container and waits until it's operational. Bootstrapping is
    automatically done during build, and therefore not necessary. The same BuildKit
    container is used during the lifetime of the associated builder node (as
    displayed in `buildx ls`).
@y
    Use the `--bootstrap` option to ensure that the builder is running before
    inspecting it. If the driver is `docker-container`, then `--bootstrap` starts
    the BuildKit container and waits until it's operational. Bootstrapping is
    automatically done during build, and therefore not necessary. The same BuildKit
    container is used during the lifetime of the associated builder node (as
    displayed in `buildx ls`).
@z

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

@x
    ### Get information about a builder instance
@y
    ### Get information about a builder instance
@z

@x
    By default, `inspect` shows information about the current builder. Specify the
    name of the builder to inspect to get information about that builder.
    The following example shows information about a builder instance named
    `elated_tesla`:
@y
    By default, `inspect` shows information about the current builder. Specify the
    name of the builder to inspect to get information about that builder.
    The following example shows information about a builder instance named
    `elated_tesla`:
@z

@x
    > **Note**
    >
    > The asterisk (`*`) next to node build platform(s) indicate they have been
    > manually set during `buildx create`. Otherwise the platforms were
    > automatically detected.
@y
    > **Note**
    >
    > The asterisk (`*`) next to node build platform(s) indicate they have been
    > manually set during `buildx create`. Otherwise the platforms were
    > automatically detected.
@z

% snip command...

@x
    `debug` flag can also be used to get more information about the builder:
@y
    `debug` flag can also be used to get more information about the builder:
@z

% snip command...
% snip directives...
