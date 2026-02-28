%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx bake
aliases: docker buildx bake, docker buildx f
short: Build from a file
long: |-
    Bake is a high-level build command. Each specified target runs in parallel
    as part of the build.
@y
command: docker buildx bake
aliases: docker buildx bake, docker buildx f
short: ファイルからのビルド
long: |-
    Bake is a high-level build command. Each specified target runs in parallel
    as part of the build.
@z

@x
    Read [High-level build options with Bake](/build/bake/)
    guide for introduction to writing bake files.
@y
    Read [High-level build options with Bake](__SUBDIR__/build/bake/)
    guide for introduction to writing bake files.
@z

@x
    > [!NOTE]
    > `buildx bake` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
@y
    > [!NOTE]
    > `buildx bake` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
@z

@x
usage: docker buildx bake [OPTIONS] [TARGET...]
@y
usage: docker buildx bake [OPTIONS] [TARGET...]
@z

% options:

@x allow
      description: Allow build to access specified resources
@y
      description: Allow build to access specified resources
@z

@x call
      description: Set method for evaluating build (`check`, `outline`, `targets`)
@y
      description: Set method for evaluating build (`check`, `outline`, `targets`)
@z

@x check
      description: Shorthand for `--call=check`
@y
      description: Shorthand for `--call=check`
@z

@x file
      description: Build definition file
@y
      description: ビルド定義ファイル。
@z

@x list
      description: List targets or variables
@y
      description: List targets or variables
@z

@x list-targets
      description: List available targets
@y
      description: List available targets
@z

@x list-variables
      description: List defined variables
@y
      description: List defined variables
@z

@x load
      description: Shorthand for `--set=*.output=type=docker`. Conditional.
@y
      description: 条件を定めた `--set=*.output=type=docker` の短縮形。
@z

@x metadata-file
      description: Write build result metadata to a file
@y
      description: Write build result metadata to a file
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: イメージビルド時にキャッシュを利用しません。
@z

@x print
      description: Print the options without building
@y
      description: Print the options without building
@z

@x progress
      description: |
        Set type of progress output (`auto`, `none`,  `plain`, `quiet`, `rawjson`, `tty`). Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `none`,  `plain`, `quiet`, `rawjson`, `tty`). Use plain to show container output
@z

@x provenance
      description: Shorthand for `--set=*.attest=type=provenance`
@y
      description: "`--set=*.attest=type=provenance` の短縮形。"
@z

@x pull
      description: Always attempt to pull all referenced images
@y
      description: Always attempt to pull all referenced images
@z

@x push
      description: Shorthand for `--set=*.output=type=registry`. Conditional.
@y
      description: 条件を定めた `--set=*.output=type=registry` の短縮形。
@z

@x sbom
      description: Shorthand for `--set=*.attest=type=sbom`
@y
      description: "`--set=*.attest=type=sbom` の短縮形。"
@z

@x set
      description: Override target value (e.g., `targetpattern.key=value`)
@y
      description: Override target value (e.g., `targetpattern.key=value`)
@z

@x var
      description: Set a variable value (e.g., `name=value`)
@y
      description: Set a variable value (e.g., `name=value`)
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
    ### Allow extra privileged entitlement (--allow) {#allow}
@y
examples: |-
    ### Allow extra privileged entitlement (--allow) {#allow}
@z

% snip code...

@x
    Entitlements are designed to provide controlled access to privileged
    operations. By default, Buildx and BuildKit operates with restricted
    permissions to protect users and their systems from unintended side effects or
    security risks. The `--allow` flag explicitly grants access to additional
    entitlements, making it clear when a build or bake operation requires elevated
    privileges.
@y
    Entitlements are designed to provide controlled access to privileged
    operations. By default, Buildx and BuildKit operates with restricted
    permissions to protect users and their systems from unintended side effects or
    security risks. The `--allow` flag explicitly grants access to additional
    entitlements, making it clear when a build or bake operation requires elevated
    privileges.
@z

@x
    In addition to BuildKit's `network.host` and `security.insecure` entitlements
    (see [`docker buildx build --allow`](/reference/cli/docker/buildx/build/#allow)),
    Bake supports file system entitlements that grant granular control over file
    system access. These are particularly useful when working with builds that need
    access to files outside the default working directory.
@y
    In addition to BuildKit's `network.host` and `security.insecure` entitlements
    (see [`docker buildx build --allow`](__SUBDIR__/reference/cli/docker/buildx/build/#allow)),
    Bake supports file system entitlements that grant granular control over file
    system access. These are particularly useful when working with builds that need
    access to files outside the default working directory.
@z

@x
    Bake supports the following filesystem entitlements:
@y
    Bake supports the following filesystem entitlements:
@z

@x
    - `--allow fs=<path|*>` - Grant read and write access to files outside of the
      working directory.
    - `--allow fs.read=<path|*>` - Grant read access to files outside of the
      working directory.
    - `--allow fs.write=<path|*>` - Grant write access to files outside of the
      working directory.
@y
    - `--allow fs=<path|*>` - Grant read and write access to files outside of the
      working directory.
    - `--allow fs.read=<path|*>` - Grant read access to files outside of the
      working directory.
    - `--allow fs.write=<path|*>` - Grant write access to files outside of the
      working directory.
@z

@x
    The `fs` entitlements take a path value (relative or absolute) to a directory
    on the filesystem. Alternatively, you can pass a wildcard (`*`) to allow Bake
    to access the entire filesystem.
@y
    The `fs` entitlements take a path value (relative or absolute) to a directory
    on the filesystem. Alternatively, you can pass a wildcard (`*`) to allow Bake
    to access the entire filesystem.
@z

@x
    ### Example: fs.read
@y
    ### Example: fs.read
@z

@x
    Given the following Bake configuration, Bake would need to access the parent
    directory, relative to the Bake file.
@y
    Given the following Bake configuration, Bake would need to access the parent
    directory, relative to the Bake file.
@z

% snip code...

@x
    Assuming `docker buildx bake app` is executed in the same directory as the
    `docker-bake.hcl` file, you would need to explicitly allow Bake to read from
    the `../src` directory. In this case, the following invocations all work:
@y
    Assuming `docker buildx bake app` is executed in the same directory as the
    `docker-bake.hcl` file, you would need to explicitly allow Bake to read from
    the `../src` directory. In this case, the following invocations all work:
@z

% snip command...

@x
    ### Example: fs.write
@y
    ### Example: fs.write
@z

@x
    The following `docker-bake.hcl` file requires write access to the `/tmp`
    directory.
@y
    The following `docker-bake.hcl` file requires write access to the `/tmp`
    directory.
@z

% snip code...

@x
    Assuming `docker buildx bake app` is executed outside of the `/tmp` directory,
    you would need to allow the `fs.write` entitlement, either by specifying the
    path or using a wildcard:
@y
    Assuming `docker buildx bake app` is executed outside of the `/tmp` directory,
    you would need to allow the `fs.write` entitlement, either by specifying the
    path or using a wildcard:
@z

% snip command...

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
    ### Invoke a frontend method (--call) {#call}
@y
    ### Invoke a frontend method (--call) {#call}
@z

@x
    Same as [`build --call`](/reference/cli/docker/buildx/build/#call).
@y
    Same as [`build --call`](__SUBDIR__/reference/cli/docker/buildx/build/#call).
@z

@x
    #### Call: check (--check) {#check}
@y
    #### Call: check (--check) {#check}
@z

@x
    Same as [`build --check`](/reference/cli/docker/buildx/build/#check).
@y
    Same as [`build --check`](__SUBDIR__/reference/cli/docker/buildx/build/#check).
@z

@x
    ### Specify a build definition file (-f, --file) {#file}
@y
    ### Specify a build definition file (-f, --file) {#file}
@z

@x
    Use the `-f` / `--file` option to specify the build definition file to use.
    The file can be an HCL, JSON or Compose file. If multiple files are specified,
    all are read and the build configurations are combined.
@y
    Use the `-f` / `--file` option to specify the build definition file to use.
    The file can be an HCL, JSON or Compose file. If multiple files are specified,
    all are read and the build configurations are combined.
@z

@x
    You can pass the names of the targets to build, to build only specific target(s).
    The following example builds the `db` and `webapp-release` targets that are
    defined in the `docker-bake.dev.hcl` file:
@y
    You can pass the names of the targets to build, to build only specific target(s).
    The following example builds the `db` and `webapp-release` targets that are
    defined in the `docker-bake.dev.hcl` file:
@z

% snip code...
% snip command...

@x
    See the [Bake file reference](/build/bake/reference/)
    for more details.
@y
    See the [Bake file reference](__SUBDIR__/build/bake/reference/)
    for more details.
@z

@x
    ### List targets and variables (--list) {#list}
@y
    ### List targets and variables (--list) {#list}
@z

@x
    The `--list` flag displays all available targets or variables in the Bake
    configuration, along with a description (if set using the `description`
    property in the Bake file).
@y
    The `--list` flag displays all available targets or variables in the Bake
    configuration, along with a description (if set using the `description`
    property in the Bake file).
@z

@x
    To list all targets:
@y
    To list all targets:
@z

% snip command...

@x
    To list variables:
@y
    To list variables:
@z

% snip command...

@x
    By default, the output of `docker buildx bake --list` is presented in a table
    format. Alternatively, you can use a long-form CSV syntax and specify a
    `format` attribute to output the list in JSON.
@y
    By default, the output of `docker buildx bake --list` is presented in a table
    format. Alternatively, you can use a long-form CSV syntax and specify a
    `format` attribute to output the list in JSON.
@z

% snip command...

@x
    ### Write build results metadata to a file (--metadata-file) {#metadata-file}
@y
    ### Write build results metadata to a file (--metadata-file) {#metadata-file}
@z

@x
    Similar to [`buildx build --metadata-file`](/reference/cli/docker/buildx/build/#metadata-file) but
    writes a map of results for each target such as:
@y
    Similar to [`buildx build --metadata-file`](__SUBDIR__/reference/cli/docker/buildx/build/#metadata-file) but
    writes a map of results for each target such as:
@z

% snip code...
% snip command...
% snip code...

@x
    > [!NOTE]
    > Build record [provenance](/build/metadata/attestations/slsa-provenance/#provenance-attestation-example)
    > (`buildx.build.provenance`) includes minimal provenance by default. Set the
    > `BUILDX_METADATA_PROVENANCE` environment variable to customize this behavior:
    > * `min` sets minimal provenance (default).
    > * `max` sets full provenance.
    > * `disabled`, `false` or `0` does not set any provenance.
@y
    > [!NOTE]
    > Build record [provenance](__SUBDIR__/build/metadata/attestations/slsa-provenance/#provenance-attestation-example)
    > (`buildx.build.provenance`) includes minimal provenance by default. Set the
    > `BUILDX_METADATA_PROVENANCE` environment variable to customize this behavior:
    > * `min` sets minimal provenance (default).
    > * `max` sets full provenance.
    > * `disabled`, `false` or `0` does not set any provenance.
@z

@x
    > [!NOTE]
    > Build warnings (`buildx.build.warnings`) are not included by default. Set the
    > `BUILDX_METADATA_WARNINGS` environment variable to `1` or `true` to
    > include them.
@y
    > [!NOTE]
    > Build warnings (`buildx.build.warnings`) are not included by default. Set the
    > `BUILDX_METADATA_WARNINGS` environment variable to `1` or `true` to
    > include them.
@z

@x
    ### Don't use cache when building the image (--no-cache) {#no-cache}
@y
    ### Don't use cache when building the image (--no-cache) {#no-cache}
@z

@x
    Same as `build --no-cache`. Don't use cache when building the image.
@y
    Same as `build --no-cache`. Don't use cache when building the image.
@z

@x
    ### Print the options without building (--print) {#print}
@y
    ### Print the options without building (--print) {#print}
@z

@x
    Prints the resulting options of the targets desired to be built, in a JSON
    format, without starting a build.
@y
    Prints the resulting options of the targets desired to be built, in a JSON
    format, without starting a build.
@z

% snip command...

@x
    ### Set type of progress output (--progress) {#progress}
@y
    ### Set type of progress output (--progress) {#progress}
@z

@x
    Same as [`build --progress`](/reference/cli/docker/buildx/build/#progress).
@y
    Same as [`build --progress`](__SUBDIR__/reference/cli/docker/buildx/build/#progress).
@z

@x
    ### Create provenance attestations (--provenance) {#provenance}
@y
    ### Create provenance attestations (--provenance) {#provenance}
@z

@x
    Same as [`build --provenance`](/reference/cli/docker/buildx/build/#provenance).
@y
    Same as [`build --provenance`](__SUBDIR__/reference/cli/docker/buildx/build/#provenance).
@z

@x
    ### Always attempt to pull a newer version of the image (--pull) {#pull}
@y
    ### Always attempt to pull a newer version of the image (--pull) {#pull}
@z

@x
    Same as `build --pull`.
@y
    Same as `build --pull`.
@z

@x
    ### Create SBOM attestations (--sbom) {#sbom}
@y
    ### Create SBOM attestations (--sbom) {#sbom}
@z

@x
    Same as [`build --sbom`](/reference/cli/docker/buildx/build/#sbom).
@y
    Same as [`build --sbom`](__SUBDIR__/reference/cli/docker/buildx/build/#sbom).
@z

@x
    ### Override target configurations from command line (--set) {#set}
@y
    ### Override target configurations from command line (--set) {#set}
@z

% snip code...

@x
    Override target configurations from command line. The pattern matching syntax
    is defined in https://golang.org/pkg/path/#Match.
@y
    Override target configurations from command line. The pattern matching syntax
    is defined in https://golang.org/pkg/path/#Match.
@z

@x
    ```console
    $ docker buildx bake --set target.args.mybuildarg=value
    $ docker buildx bake --set target.platform=linux/arm64
    $ docker buildx bake --set foo*.args.mybuildarg=value   # overrides build arg for all targets starting with 'foo'
    $ docker buildx bake --set *.platform=linux/arm64       # overrides platform for all targets
    $ docker buildx bake --set foo*.no-cache                # bypass caching only for targets starting with 'foo'
    $ docker buildx bake --set target.platform+=linux/arm64 # appends 'linux/arm64' to the platform list
    $ docker buildx bake --set target.contexts.bar=../bar   # overrides 'bar' named context
    ```
@y
    ```console
    $ docker buildx bake --set target.args.mybuildarg=value
    $ docker buildx bake --set target.platform=linux/arm64
    $ docker buildx bake --set foo*.args.mybuildarg=value   # overrides build arg for all targets starting with 'foo'
    $ docker buildx bake --set *.platform=linux/arm64       # overrides platform for all targets
    $ docker buildx bake --set foo*.no-cache                # bypass caching only for targets starting with 'foo'
    $ docker buildx bake --set target.platform+=linux/arm64 # appends 'linux/arm64' to the platform list
    $ docker buildx bake --set target.contexts.bar=../bar   # overrides 'bar' named context
    ```
@z

@x
    You can override the following fields:
@y
    You can override the following fields:
@z

% snip fields...
% snip directives...
