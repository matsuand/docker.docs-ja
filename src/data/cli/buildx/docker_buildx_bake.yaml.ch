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
short: Build from a file
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
      description: Build definition file
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
      description: Shorthand for `--set=*.output=type=docker`. Conditional.
@z

@x metadata-file
      description: Write build result metadata to a file
@y
      description: Write build result metadata to a file
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: Do not use cache when building the image
@z

@x policy
      description: |
        Global policy evaluation options (format: `[disabled=true|false][,strict=true|false][,log-level=level]`)
@y
      description: |
        Global policy evaluation options (format: `[disabled=true|false][,strict=true|false][,log-level=level]`)
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
      description: Shorthand for `--set=*.attest=type=provenance`
@z

@x pull
      description: Always attempt to pull all referenced images
@y
      description: Always attempt to pull all referenced images
@z

@x push
      description: Shorthand for `--set=*.output=type=registry`. Conditional.
@y
      description: Shorthand for `--set=*.output=type=registry`. Conditional.
@z

@x sbom
      description: Shorthand for `--set=*.attest=type=sbom`
@y
      description: Shorthand for `--set=*.attest=type=sbom`
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

@x
    ```text
    --allow=ENTITLEMENT[=VALUE]
    ```
@y
    ```text
    --allow=ENTITLEMENT[=VALUE]
    ```
@z

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
    Bake also supports `--allow=buildx.local.delete` to grant local outputs
    permission to delete stale files when `mode=delete` is set.
@y
    Bake also supports `--allow=buildx.local.delete` to grant local outputs
    permission to delete stale files when `mode=delete` is set.
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

@x
    ```hcl
    target "app" {
      context = "../src"
    }
    ```
@y
    ```hcl
    target "app" {
      context = "../src"
    }
    ```
@z

@x
    Assuming `docker buildx bake app` is executed in the same directory as the
    `docker-bake.hcl` file, you would need to explicitly allow Bake to read from
    the `../src` directory. In this case, the following invocations all work:
@y
    Assuming `docker buildx bake app` is executed in the same directory as the
    `docker-bake.hcl` file, you would need to explicitly allow Bake to read from
    the `../src` directory. In this case, the following invocations all work:
@z

@x
    ```console
    $ docker buildx bake --allow fs.read=* app
    $ docker buildx bake --allow fs.read=../src app
    $ docker buildx bake --allow fs=* app
    ```
@y
    ```console
    $ docker buildx bake --allow fs.read=* app
    $ docker buildx bake --allow fs.read=../src app
    $ docker buildx bake --allow fs=* app
    ```
@z

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

@x
    ```hcl
    target "app" {
      output = "/tmp"
    }
    ```
@y
    ```hcl
    target "app" {
      output = "/tmp"
    }
    ```
@z

@x
    Assuming `docker buildx bake app` is executed outside of the `/tmp` directory,
    you would need to allow the `fs.write` entitlement, either by specifying the
    path or using a wildcard:
@y
    Assuming `docker buildx bake app` is executed outside of the `/tmp` directory,
    you would need to allow the `fs.write` entitlement, either by specifying the
    path or using a wildcard:
@z

@x
    ```console
    $ docker buildx bake --allow fs=/tmp app
    $ docker buildx bake --allow fs.write=/tmp app
    $ docker buildx bake --allow fs.write=* app
    ```
@y
    ```console
    $ docker buildx bake --allow fs=/tmp app
    $ docker buildx bake --allow fs.write=/tmp app
    $ docker buildx bake --allow fs.write=* app
    ```
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
    Alternatively, the environment variable `BUILDX_BAKE_FILE` can be used to specify the build definition to use.
    This is mutually exclusive with `-f` / `--file`; if both are specified, the environment variable is ignored.
    Multiple definitions can be specified by separating them with the system's path separator
    (typically `;` on Windows and `:` elsewhere), but can be changed with `BUILDX_BAKE_PATH_SEPARATOR`.
@y
    Alternatively, the environment variable `BUILDX_BAKE_FILE` can be used to specify the build definition to use.
    This is mutually exclusive with `-f` / `--file`; if both are specified, the environment variable is ignored.
    Multiple definitions can be specified by separating them with the system's path separator
    (typically `;` on Windows and `:` elsewhere), but can be changed with `BUILDX_BAKE_PATH_SEPARATOR`.
@z

@x
    By default, local directory build contexts in Bake files are resolved from the
    current working directory. To opt in to resolving local directory build contexts
    from the Bake file that defines each path, set
    `BUILDX_BAKE_FILE_RELATIVE_PATHS=1`. Compose files use the first Compose file
    directory as the base, which matches Compose project directory semantics. Use
    the `cwd://` prefix for paths that should remain relative to the current working
    directory.
@y
    By default, local directory build contexts in Bake files are resolved from the
    current working directory. To opt in to resolving local directory build contexts
    from the Bake file that defines each path, set
    `BUILDX_BAKE_FILE_RELATIVE_PATHS=1`. Compose files use the first Compose file
    directory as the base, which matches Compose project directory semantics. Use
    the `cwd://` prefix for paths that should remain relative to the current working
    directory.
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

@x
    ```hcl
    # docker-bake.dev.hcl
    group "default" {
      targets = ["db", "webapp-dev"]
    }
@y
    ```hcl
    # docker-bake.dev.hcl
    group "default" {
      targets = ["db", "webapp-dev"]
    }
@z

@x
    target "webapp-dev" {
      dockerfile = "Dockerfile.webapp"
      tags = ["docker.io/username/webapp"]
    }
@y
    target "webapp-dev" {
      dockerfile = "Dockerfile.webapp"
      tags = ["docker.io/username/webapp"]
    }
@z

@x
    target "webapp-release" {
      inherits = ["webapp-dev"]
      platforms = ["linux/amd64", "linux/arm64"]
    }
@y
    target "webapp-release" {
      inherits = ["webapp-dev"]
      platforms = ["linux/amd64", "linux/arm64"]
    }
@z

@x
    target "db" {
      dockerfile = "Dockerfile.db"
      tags = ["docker.io/username/db"]
    }
    ```
@y
    target "db" {
      dockerfile = "Dockerfile.db"
      tags = ["docker.io/username/db"]
    }
    ```
@z

@x
    ```console
    $ docker buildx bake -f docker-bake.dev.hcl db webapp-release
    ```
@y
    ```console
    $ docker buildx bake -f docker-bake.dev.hcl db webapp-release
    ```
@z

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

@x
    ```console {title="List targets"}
    $ docker buildx bake --list=targets
    TARGET              DESCRIPTION
    binaries
    default             binaries
    update-docs
    validate
    validate-golangci   Validate .golangci.yml schema (does not run Go linter)
    ```
@y
    ```console {title="List targets"}
    $ docker buildx bake --list=targets
    TARGET              DESCRIPTION
    binaries
    default             binaries
    update-docs
    validate
    validate-golangci   Validate .golangci.yml schema (does not run Go linter)
    ```
@z

@x
    To list variables:
@y
    To list variables:
@z

@x
    ```console
    $ docker buildx bake --list=variables
    VARIABLE      TYPE      VALUE                DESCRIPTION
    REGISTRY      string    docker.io/username   Registry and namespace
    IMAGE_NAME    string    my-app               Image name
    GO_VERSION              <null>
    DEBUG         bool      false                Add debug symbols
    ```
@y
    ```console
    $ docker buildx bake --list=variables
    VARIABLE      TYPE      VALUE                DESCRIPTION
    REGISTRY      string    docker.io/username   Registry and namespace
    IMAGE_NAME    string    my-app               Image name
    GO_VERSION              <null>
    DEBUG         bool      false                Add debug symbols
    ```
@z

@x
    Variable types will be shown when set using the `type` property in the Bake file.
@y
    Variable types will be shown when set using the `type` property in the Bake file.
@z

@x
    The `--list=variables` option displays variables defined in the Bake file, including their descriptions and default values.
@y
    The `--list=variables` option displays variables defined in the Bake file, including their descriptions and default values.
@z

@x
    ### Example: listing variables with descriptions
@y
    ### Example: listing variables with descriptions
@z

@x
    ```hcl
    variable "GO_VERSION" {
      default     = "1.22"
      description = "Go version used for building the application"
    }
    ```
@y
    ```hcl
    variable "GO_VERSION" {
      default     = "1.22"
      description = "Go version used for building the application"
    }
    ```
@z

@x
    ```console
    $ docker buildx bake --list=variables
@y
    ```console
    $ docker buildx bake --list=variables
@z

@x
    NAME          DESCRIPTION                                      DEFAULT
    GO_VERSION    Go version used for building the application     1.22
    ```
@y
    NAME          DESCRIPTION                                      DEFAULT
    GO_VERSION    Go version used for building the application     1.22
    ```
@z

@x
    By default, the output of `docker buildx bake --list` is presented in a table
    format. Alternatively, you can use a long-form CSV syntax and specify a
    `format` attribute to output the list in JSON.
@y
    By default, the output of `docker buildx bake --list` is presented in a table
    format. Alternatively, you can use a long-form CSV syntax and specify a
    `format` attribute to output the list in JSON.
@z

@x
    ```console
    $ docker buildx bake --list=type=targets,format=json
    ```
@y
    ```console
    $ docker buildx bake --list=type=targets,format=json
    ```
@z

@x
    ### Load images into Docker (--load) {#load}
@y
    ### Load images into Docker (--load) {#load}
@z

@x
    The `--load` flag is a convenience shorthand for adding an image export of type
    `docker`:
@y
    The `--load` flag is a convenience shorthand for adding an image export of type
    `docker`:
@z

@x
    ```console
    --load   ≈   --set=*.output=type=docker
    ```
@y
    ```console
    --load   ≈   --set=*.output=type=docker
    ```
@z

@x
    However, its behavior is conditional:
@y
    However, its behavior is conditional:
@z

@x
    - If the build definition has no output defined, `--load` adds
    `type=docker`.
    - If the build definition’s outputs are `docker`, `image`, `registry`,
    `oci`, `--load` will add a `type=docker` export if one is not already present.
    - If the build definition contains `local` or `tar` outputs,
    `--load` does nothing. It will not override those outputs.
@y
    - If the build definition has no output defined, `--load` adds
    `type=docker`.
    - If the build definition’s outputs are `docker`, `image`, `registry`,
    `oci`, `--load` will add a `type=docker` export if one is not already present.
    - If the build definition contains `local` or `tar` outputs,
    `--load` does nothing. It will not override those outputs.
@z

@x
    For example, with the following bake file:
@y
    For example, with the following bake file:
@z

@x
    ```hcl
    target "default" {
      output = ["type=tar,dest=hi.tar"]
    }
    ```
@y
    ```hcl
    target "default" {
      output = ["type=tar,dest=hi.tar"]
    }
    ```
@z

@x
    With `--load`:
@y
    With `--load`:
@z

@x
    ```console
    $ docker buildx bake --load --print
    ...
    "output": [
      {
        "dest": "hi.tar"
        "type": "tar",
       }
    ]
    ```
@y
    ```console
    $ docker buildx bake --load --print
    ...
    "output": [
      {
        "dest": "hi.tar"
        "type": "tar",
       }
    ]
    ```
@z

@x
    The `tar` output remains unchanged.
@y
    The `tar` output remains unchanged.
@z

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

@x
    ```hcl
    # docker-bake.hcl
    group "default" {
      targets = ["db", "webapp-dev"]
    }
@y
    ```hcl
    # docker-bake.hcl
    group "default" {
      targets = ["db", "webapp-dev"]
    }
@z

@x
    target "db" {
      dockerfile = "Dockerfile.db"
      tags = ["docker.io/username/db"]
    }
@y
    target "db" {
      dockerfile = "Dockerfile.db"
      tags = ["docker.io/username/db"]
    }
@z

@x
    target "webapp-dev" {
      dockerfile = "Dockerfile.webapp"
      tags = ["docker.io/username/webapp"]
    }
    ```
@y
    target "webapp-dev" {
      dockerfile = "Dockerfile.webapp"
      tags = ["docker.io/username/webapp"]
    }
    ```
@z

@x
    ```console
    $ docker buildx bake --load --metadata-file metadata.json .
    $ cat metadata.json
    ```
@y
    ```console
    $ docker buildx bake --load --metadata-file metadata.json .
    $ cat metadata.json
    ```
@z

@x
    ```json
    {
      "buildx.build.warnings": {},
      "db": {
        "buildx.build.provenance": {},
        "buildx.build.ref": "mybuilder/mybuilder0/0fjb6ubs52xx3vygf6fgdl611",
        "containerimage.config.digest": "sha256:2937f66a9722f7f4a2df583de2f8cb97fc9196059a410e7f00072fc918930e66",
        "containerimage.descriptor": {
          "annotations": {
            "config.digest": "sha256:2937f66a9722f7f4a2df583de2f8cb97fc9196059a410e7f00072fc918930e66",
            "org.opencontainers.image.created": "2022-02-08T21:28:03Z"
          },
          "digest": "sha256:19ffeab6f8bc9293ac2c3fdf94ebe28396254c993aea0b5a542cfb02e0883fa3",
          "mediaType": "application/vnd.oci.image.manifest.v1+json",
          "size": 506
        },
        "containerimage.digest": "sha256:19ffeab6f8bc9293ac2c3fdf94ebe28396254c993aea0b5a542cfb02e0883fa3"
      },
      "webapp-dev": {
        "buildx.build.provenance": {},
        "buildx.build.ref": "mybuilder/mybuilder0/kamngmcgyzebqxwu98b4lfv3n",
        "containerimage.config.digest": "sha256:9651cc2b3c508f697c9c43b67b64c8359c2865c019e680aac1c11f4b875b67e0",
        "containerimage.descriptor": {
          "annotations": {
            "config.digest": "sha256:9651cc2b3c508f697c9c43b67b64c8359c2865c019e680aac1c11f4b875b67e0",
            "org.opencontainers.image.created": "2022-02-08T21:28:15Z"
          },
          "digest": "sha256:6d9ac9237a84afe1516540f40a0fafdc86859b2141954b4d643af7066d598b74",
          "mediaType": "application/vnd.oci.image.manifest.v1+json",
          "size": 506
        },
        "containerimage.digest": "sha256:6d9ac9237a84afe1516540f40a0fafdc86859b2141954b4d643af7066d598b74"
      }
    }
    ```
@y
    ```json
    {
      "buildx.build.warnings": {},
      "db": {
        "buildx.build.provenance": {},
        "buildx.build.ref": "mybuilder/mybuilder0/0fjb6ubs52xx3vygf6fgdl611",
        "containerimage.config.digest": "sha256:2937f66a9722f7f4a2df583de2f8cb97fc9196059a410e7f00072fc918930e66",
        "containerimage.descriptor": {
          "annotations": {
            "config.digest": "sha256:2937f66a9722f7f4a2df583de2f8cb97fc9196059a410e7f00072fc918930e66",
            "org.opencontainers.image.created": "2022-02-08T21:28:03Z"
          },
          "digest": "sha256:19ffeab6f8bc9293ac2c3fdf94ebe28396254c993aea0b5a542cfb02e0883fa3",
          "mediaType": "application/vnd.oci.image.manifest.v1+json",
          "size": 506
        },
        "containerimage.digest": "sha256:19ffeab6f8bc9293ac2c3fdf94ebe28396254c993aea0b5a542cfb02e0883fa3"
      },
      "webapp-dev": {
        "buildx.build.provenance": {},
        "buildx.build.ref": "mybuilder/mybuilder0/kamngmcgyzebqxwu98b4lfv3n",
        "containerimage.config.digest": "sha256:9651cc2b3c508f697c9c43b67b64c8359c2865c019e680aac1c11f4b875b67e0",
        "containerimage.descriptor": {
          "annotations": {
            "config.digest": "sha256:9651cc2b3c508f697c9c43b67b64c8359c2865c019e680aac1c11f4b875b67e0",
            "org.opencontainers.image.created": "2022-02-08T21:28:15Z"
          },
          "digest": "sha256:6d9ac9237a84afe1516540f40a0fafdc86859b2141954b4d643af7066d598b74",
          "mediaType": "application/vnd.oci.image.manifest.v1+json",
          "size": 506
        },
        "containerimage.digest": "sha256:6d9ac9237a84afe1516540f40a0fafdc86859b2141954b4d643af7066d598b74"
      }
    }
    ```
@z

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

@x
    ```console
    $ docker buildx bake -f docker-bake.hcl --print db
    {
      "group": {
        "default": {
          "targets": [
            "db"
          ]
        }
      },
      "target": {
        "db": {
          "context": "./",
          "dockerfile": "Dockerfile",
          "tags": [
            "docker.io/tiborvass/db"
          ]
        }
      }
    }
    ```
@y
    ```console
    $ docker buildx bake -f docker-bake.hcl --print db
    {
      "group": {
        "default": {
          "targets": [
            "db"
          ]
        }
      },
      "target": {
        "db": {
          "context": "./",
          "dockerfile": "Dockerfile",
          "tags": [
            "docker.io/tiborvass/db"
          ]
        }
      }
    }
    ```
@z

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
    ### Push images to a registry (--push) {#push}
@y
    ### Push images to a registry (--push) {#push}
@z

@x
    The `--push` flag follows the same logic as `--load`:
@y
    The `--push` flag follows the same logic as `--load`:
@z

@x
    - If no outputs are defined, it adds a `type=image,push=true` export.
    - For existing `image` outputs, it sets `push=true`.
    - If outputs are set to `local` or `tar`, it does not override them.
@y
    - If no outputs are defined, it adds a `type=image,push=true` export.
    - For existing `image` outputs, it sets `push=true`.
    - If outputs are set to `local` or `tar`, it does not override them.
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

@x
    ```
    --set targetpattern.key[.subkey]=value
    ```
@y
    ```
    --set targetpattern.key[.subkey]=value
    ```
@z

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
    $ docker buildx bake --set target.resources.memory=2g   # overrides memory resource limit
    $ docker buildx bake --set target.secret.aws=env=AWS    # overrides source for an existing secret
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
    $ docker buildx bake --set target.resources.memory=2g   # overrides memory resource limit
    $ docker buildx bake --set target.secret.aws=env=AWS    # overrides source for an existing secret
    ```
@z

@x
    > [!NOTE]
    >
    > `--set` is a repeatable flag. For array fields such as `tags`, repeat `--set`
    > to provide multiple values or use the `+=` operator to append without
    > replacing. Array literal syntax like `--set target.tags=[a,b]` is not
    > supported.
@y
    > [!NOTE]
    >
    > `--set` is a repeatable flag. For array fields such as `tags`, repeat `--set`
    > to provide multiple values or use the `+=` operator to append without
    > replacing. Array literal syntax like `--set target.tags=[a,b]` is not
    > supported.
@z

@x
    You can override the following fields:
@y
    You can override the following fields:
@z

@x
    * `annotations`
    * `attest`
    * `args`
    * `cache-from`
    * `cache-to`
    * `call`
    * `context`
    * `contexts`
    * `dockerfile`
    * `entitlements`
    * `extra-hosts`
    * `labels`
    * `load`
    * `no-cache`
    * `no-cache-filter`
    * `output`
    * `platform`
    * `pull`
    * `push`
    * `resources`
    * `secret.<id>`
    * `secrets`
    * `ssh`
    * `tags`
    * `target`
@y
    * `annotations`
    * `attest`
    * `args`
    * `cache-from`
    * `cache-to`
    * `call`
    * `context`
    * `contexts`
    * `dockerfile`
    * `entitlements`
    * `extra-hosts`
    * `labels`
    * `load`
    * `no-cache`
    * `no-cache-filter`
    * `output`
    * `platform`
    * `pull`
    * `push`
    * `resources`
    * `secret.<id>`
    * `secrets`
    * `ssh`
    * `tags`
    * `target`
@z

@x
    You can append using `+=` operator for the following fields:
@y
    You can append using `+=` operator for the following fields:
@z

@x
    * `annotations`¹
    * `attest`¹
    * `cache-from`
    * `cache-to`
    * `entitlements`¹
    * `no-cache-filter`
    * `output`
    * `platform`
    * `secrets`
    * `ssh`
    * `tags`
@y
    * `annotations`¹
    * `attest`¹
    * `cache-from`
    * `cache-to`
    * `entitlements`¹
    * `no-cache-filter`
    * `output`
    * `platform`
    * `secrets`
    * `ssh`
    * `tags`
@z

@x
    > [!NOTE]
    > ¹ These fields already append by default.
@y
    > [!NOTE]
    > ¹ These fields already append by default.
@z

@x
    #### Inline values for composable attributes
@y
    #### Inline values for composable attributes
@z

@x
    Some fields, such as `ssh`, `secret`, `output`, `cache-to`, `cache-from`,
    `attest`, and `annotations`, are composable attributes that accept a list of
    object values in a Bake file. When you override these fields with `--set`, you
    provide each value using the same inline string syntax as the corresponding
    build flag, not the HCL object form. The `--set` override replaces or appends
    to the list as a whole; it doesn't address individual sub-fields with a
    sub-selector. Only the map-valued fields `args`, `contexts`, `labels`, and
    `extra-hosts` support targeting a specific entry with a sub-key (for example
    `--set target.args.MYARG=value`).
@y
    Some fields, such as `ssh`, `secret`, `output`, `cache-to`, `cache-from`,
    `attest`, and `annotations`, are composable attributes that accept a list of
    object values in a Bake file. When you override these fields with `--set`, you
    provide each value using the same inline string syntax as the corresponding
    build flag, not the HCL object form. The `--set` override replaces or appends
    to the list as a whole; it doesn't address individual sub-fields with a
    sub-selector. Only the map-valued fields `args`, `contexts`, `labels`, and
    `extra-hosts` support targeting a specific entry with a sub-key (for example
    `--set target.args.MYARG=value`).
@z

@x
    For example, to set the SSH agent socket or key for a target, use the same
    `id=path` form accepted by [`build --ssh`](/reference/cli/docker/buildx/build/#ssh):
@y
    For example, to set the SSH agent socket or key for a target, use the same
    `id=path` form accepted by [`build --ssh`](__SUBDIR__/reference/cli/docker/buildx/build/#ssh):
@z

@x
    ```console
    $ docker buildx bake --set "*.ssh=default=$HOME/.ssh/id_ed25519"
    ```
@y
    ```console
    $ docker buildx bake --set "*.ssh=default=$HOME/.ssh/id_ed25519"
    ```
@z

@x
    To expose multiple paths for the same `id`, separate them with commas in the
    second part:
@y
    To expose multiple paths for the same `id`, separate them with commas in the
    second part:
@z

@x
    ```console
    $ docker buildx bake --set "*.ssh=default=$HOME/.ssh/id_ed25519,$HOME/.ssh/id_rsa"
    ```
@y
    ```console
    $ docker buildx bake --set "*.ssh=default=$HOME/.ssh/id_ed25519,$HOME/.ssh/id_rsa"
    ```
@z

@x
    Your shell expands `$HOME` before buildx sees the value. The equivalent Bake
    file definition uses the
    [`homedir`](/build/bake/stdlib/#homedir) HCL function:
@y
    Your shell expands `$HOME` before buildx sees the value. The equivalent Bake
    file definition uses the
    [`homedir`](__SUBDIR__/build/bake/stdlib/#homedir) HCL function:
@z

@x
    ```hcl
    target "default" {
      ssh = [{ id = "default", paths = ["${homedir()}/.ssh/id_ed25519", "${homedir()}/.ssh/id_rsa"] }]
    }
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```hcl
    target "default" {
      ssh = [{ id = "default", paths = ["${homedir()}/.ssh/id_ed25519", "${homedir()}/.ssh/id_rsa"] }]
    }
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
