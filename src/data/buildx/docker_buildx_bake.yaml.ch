%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
    Read [High-level build options with Bake](/build/bake/)
    guide for introduction to writing bake files.
@z

@x
    > **Note**
    >
    > `buildx bake` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
usage: docker buildx bake [OPTIONS] [TARGET...]
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Build definition file
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: load
      value_type: bool
      default_value: "false"
      description: Shorthand for `--set=*.output=type=docker`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata-file
      value_type: string
      description: Write build result metadata to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      details_url: '#no-cache'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: print
      value_type: bool
      default_value: "false"
      description: Print the options without building
      details_url: '#print'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      details_url: '#progress'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: provenance
      value_type: string
      description: Shorthand for `--set=*.attest=type=provenance`
      details_url: '#provenance'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull all referenced images
      details_url: '#pull'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Shorthand for `--set=*.output=type=registry`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: string
      description: Shorthand for `--set=*.attest=type=sbom`
      details_url: '#sbom'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: set
      value_type: stringArray
      default_value: '[]'
      description: Override target value (e.g., `targetpattern.key=value`)
      details_url: '#set'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@y
    > **Note**
    >
    > `buildx bake` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
usage: docker buildx bake [OPTIONS] [TARGET...]
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Build definition file
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: load
      value_type: bool
      default_value: "false"
      description: Shorthand for `--set=*.output=type=docker`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata-file
      value_type: string
      description: Write build result metadata to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      details_url: '#no-cache'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: print
      value_type: bool
      default_value: "false"
      description: Print the options without building
      details_url: '#print'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      details_url: '#progress'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: provenance
      value_type: string
      description: Shorthand for `--set=*.attest=type=provenance`
      details_url: '#provenance'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull all referenced images
      details_url: '#pull'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Shorthand for `--set=*.output=type=registry`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: string
      description: Shorthand for `--set=*.attest=type=sbom`
      details_url: '#sbom'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: set
      value_type: stringArray
      default_value: '[]'
      description: Override target value (e.g., `targetpattern.key=value`)
      details_url: '#set'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](buildx.md#builder).
@y
    Same as [`buildx --builder`](buildx.md#builder).
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
    See the [Bake file reference](/build/bake/reference/)
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
    Same as [`build --progress`](buildx_build.md#progress).
@y
    Same as [`build --progress`](buildx_build.md#progress).
@z

@x
    ### Create provenance attestations (--provenance) {#provenance}
@y
    ### Create provenance attestations (--provenance) {#provenance}
@z

@x
    Same as [`build --provenance`](buildx_build.md#provenance).
@y
    Same as [`build --provenance`](buildx_build.md#provenance).
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
    Same as [`build --sbom`](buildx_build.md#sbom).
@y
    Same as [`build --sbom`](buildx_build.md#sbom).
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    * `args`
    * `cache-from`
    * `cache-to`
    * `context`
    * `dockerfile`
    * `labels`
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
