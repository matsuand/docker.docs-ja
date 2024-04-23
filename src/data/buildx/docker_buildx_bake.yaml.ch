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
    > **Note**
    >
    > `buildx bake` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
@y
    > **メモ**
    >
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

@x file
      description: Build definition file
@y
      description: ビルド定義ファイル。
@z

@x load
      description: Shorthand for `--set=*.output=type=docker`
@y
      description: "`--set=*.output=type=docker` の短縮形。"
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
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
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
      description: Shorthand for `--set=*.output=type=registry`
@y
      description: "`--set=*.output=type=registry` の短縮形。"
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
    $ docker buildx bake --set foo*.args.mybuildarg=value # overrides build arg for all targets starting with 'foo'
    $ docker buildx bake --set *.platform=linux/arm64     # overrides platform for all targets
    $ docker buildx bake --set foo*.no-cache              # bypass caching only for targets starting with 'foo'
    ```
@y
    ```console
    $ docker buildx bake --set target.args.mybuildarg=value
    $ docker buildx bake --set target.platform=linux/arm64
    $ docker buildx bake --set foo*.args.mybuildarg=value # overrides build arg for all targets starting with 'foo'
    $ docker buildx bake --set *.platform=linux/arm64     # overrides platform for all targets
    $ docker buildx bake --set foo*.no-cache              # bypass caching only for targets starting with 'foo'
    ```
@z

@x
    You can override the following fields:
@y
    You can override the following fields:
@z

@x
    * `args`
    * `cache-from`
    * `cache-to`
    * `context`
    * `dockerfile`
    * `labels`
    * `load`
    * `no-cache`
    * `no-cache-filter`
    * `output`
    * `platform`
    * `pull`
    * `push`
    * `secrets`
    * `ssh`
    * `tags`
    * `target`
@y
    * `args`
    * `cache-from`
    * `cache-to`
    * `context`
    * `dockerfile`
    * `labels`
    * `load`
    * `no-cache`
    * `no-cache-filter`
    * `output`
    * `platform`
    * `pull`
    * `push`
    * `secrets`
    * `ssh`
    * `tags`
    * `target`
@z
