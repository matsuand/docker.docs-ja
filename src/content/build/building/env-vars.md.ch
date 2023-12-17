%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Environment variables for Docker Build
description: Use environment variables to configure builds
keywords: docker build, buildx, buildkit, env, environment variables, config
aliases:
- /build/buildkit/color-output-controls/
---
@y
---
title: Environment variables for Docker Build
description: Use environment variables to configure builds
keywords: docker build, buildx, buildkit, env, environment variables, config
aliases:
- /build/buildkit/color-output-controls/
---
@z

@x
You can set the following environment variables to enable, disable, or change
the behavior of features related to building:
@y
You can set the following environment variables to enable, disable, or change
the behavior of features related to building:
@z

@x
| Variable                                                                    | Type              | Description                                          |
| --------------------------------------------------------------------------- | ----------------- | ---------------------------------------------------- |
| [BUILDKIT_COLORS](#buildkit_colors)                                         | String            | Configure text color for the terminal output.        |
| [BUILDKIT_HOST](#buildkit_host)                                             | String            | Specify host to use for remote builders.             |
| [BUILDKIT_PROGRESS](#buildkit_progress)                                     | String            | Configure type of progress output.                   |
| [BUILDKIT_TTY_LOG_LINES](#buildkit_tty_log_lines)                           | String            | Number of log lines (for active steps in tty mode).  |
| [BUILDX_BUILDER](#buildx_builder)                                           | String            | Specify the builder instance to use.                 |
| [BUILDX_CONFIG](#buildx_config)                                             | String            | Specify location for configuration, state, and logs. |
| [BUILDX_EXPERIMENTAL](#buildx_experimental)                                 | Boolean           | Turn on experimental features.                       |
| [BUILDX_GIT_CHECK_DIRTY](#buildx_git_check_dirty)                           | Boolean           | Enable dirty Git checkout detection.                 |
| [BUILDX_GIT_INFO](#buildx_git_info)                                         | Boolean           | Remove Git information in provenance attestations.   |
| [BUILDX_GIT_LABELS](#buildx_git_labels)                                     | String \| Boolean | Add Git provenance labels to images.                 |
| [BUILDX_NO_DEFAULT_ATTESTATIONS](#buildx_no_default_attestations)           | Boolean           | Turn off default provenance attestations.            |
| [BUILDX_NO_DEFAULT_LOAD](#buildx_no_default_load)                           | Boolean           | Turn off loading images to image store by default.   |
| [EXPERIMENTAL_BUILDKIT_SOURCE_POLICY](#experimental_buildkit_source_policy) | String            | Specify a BuildKit source policy file.               |
@y
| Variable                                                                    | Type              | Description                                          |
| --------------------------------------------------------------------------- | ----------------- | ---------------------------------------------------- |
| [BUILDKIT_COLORS](#buildkit_colors)                                         | String            | Configure text color for the terminal output.        |
| [BUILDKIT_HOST](#buildkit_host)                                             | String            | Specify host to use for remote builders.             |
| [BUILDKIT_PROGRESS](#buildkit_progress)                                     | String            | Configure type of progress output.                   |
| [BUILDKIT_TTY_LOG_LINES](#buildkit_tty_log_lines)                           | String            | Number of log lines (for active steps in tty mode).  |
| [BUILDX_BUILDER](#buildx_builder)                                           | String            | Specify the builder instance to use.                 |
| [BUILDX_CONFIG](#buildx_config)                                             | String            | Specify location for configuration, state, and logs. |
| [BUILDX_EXPERIMENTAL](#buildx_experimental)                                 | Boolean           | Turn on experimental features.                       |
| [BUILDX_GIT_CHECK_DIRTY](#buildx_git_check_dirty)                           | Boolean           | Enable dirty Git checkout detection.                 |
| [BUILDX_GIT_INFO](#buildx_git_info)                                         | Boolean           | Remove Git information in provenance attestations.   |
| [BUILDX_GIT_LABELS](#buildx_git_labels)                                     | String \| Boolean | Add Git provenance labels to images.                 |
| [BUILDX_NO_DEFAULT_ATTESTATIONS](#buildx_no_default_attestations)           | Boolean           | Turn off default provenance attestations.            |
| [BUILDX_NO_DEFAULT_LOAD](#buildx_no_default_load)                           | Boolean           | Turn off loading images to image store by default.   |
| [EXPERIMENTAL_BUILDKIT_SOURCE_POLICY](#experimental_buildkit_source_policy) | String            | Specify a BuildKit source policy file.               |
@z

@x
See also
[BuildKit built-in build args](../../engine/reference/builder.md#buildkit-built-in-build-args).
@y
See also
[BuildKit built-in build args](../../engine/reference/builder.md#buildkit-built-in-build-args).
@z

@x
You can express Boolean values for environment variables in different ways. For
example, `true`, `1`, and `T` all evaluate to true. Evaluation is done using the
`strconv.ParseBool` function in the Go standard library. See the
[reference documentation](https://pkg.go.dev/strconv#ParseBool)
for details.
@y
You can express Boolean values for environment variables in different ways. For
example, `true`, `1`, and `T` all evaluate to true. Evaluation is done using the
`strconv.ParseBool` function in the Go standard library. See the
[reference documentation](https://pkg.go.dev/strconv#ParseBool)
for details.
@z

@x
## BUILDKIT_COLORS
@y
## BUILDKIT_COLORS
@z

@x
Changes the colors of the terminal output. Set `BUILDKIT_COLORS` to a CSV string
in the following format:
@y
Changes the colors of the terminal output. Set `BUILDKIT_COLORS` to a CSV string
in the following format:
@z

@x
```console
$ export BUILDKIT_COLORS="run=123,20,245:error=yellow:cancel=blue:warning=white"
```
@y
```console
$ export BUILDKIT_COLORS="run=123,20,245:error=yellow:cancel=blue:warning=white"
```
@z

@x
Color values can be any valid RGB hex code, or one of the
[BuildKit predefined colors](https://github.com/moby/buildkit/blob/master/util/progress/progressui/colors.go).
@y
Color values can be any valid RGB hex code, or one of the
[BuildKit predefined colors](https://github.com/moby/buildkit/blob/master/util/progress/progressui/colors.go).
@z

@x
Setting `NO_COLOR` to anything turns off colorized output, as recommended by
[no-color.org](https://no-color.org/).
@y
Setting `NO_COLOR` to anything turns off colorized output, as recommended by
[no-color.org](https://no-color.org/).
@z

@x
## BUILDKIT_HOST
@y
## BUILDKIT_HOST
@z

@x
_Introduced in [Buildx v0.9.0](../release-notes.md#090)_
@y
_Introduced in [Buildx v0.9.0](../release-notes.md#090)_
@z

@x
You use the `BUILDKIT_HOST` to specify the address of a BuildKit daemon to use
as a remote builder. This is the same as specifying the address as a positional
argument to `docker buildx create`.
@y
You use the `BUILDKIT_HOST` to specify the address of a BuildKit daemon to use
as a remote builder. This is the same as specifying the address as a positional
argument to `docker buildx create`.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDKIT_HOST=tcp://localhost:1234
$ docker buildx create --name=remote --driver=remote
```
@y
```console
$ export BUILDKIT_HOST=tcp://localhost:1234
$ docker buildx create --name=remote --driver=remote
```
@z

@x
If you specify both the `BUILDKIT_HOST` environment variable and a positional
argument, the argument takes priority.
@y
If you specify both the `BUILDKIT_HOST` environment variable and a positional
argument, the argument takes priority.
@z

@x
## BUILDKIT_PROGRESS
@y
## BUILDKIT_PROGRESS
@z

@x
Sets the type of the BuildKit progress output. Valid values are:
@y
Sets the type of the BuildKit progress output. Valid values are:
@z

@x
- `auto` (default)
- `plain`
- `tty`
@y
- `auto` (default)
- `plain`
- `tty`
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDKIT_PROGRESS=plain
```
@y
```console
$ export BUILDKIT_PROGRESS=plain
```
@z

@x
## BUILDKIT_TTY_LOG_LINES
@y
## BUILDKIT_TTY_LOG_LINES
@z

@x
You can change how many log lines are visible for active steps in tty mode by
setting `BUILDKIT_TTY_LOG_LINES` to a number (default to `6`).
@y
You can change how many log lines are visible for active steps in tty mode by
setting `BUILDKIT_TTY_LOG_LINES` to a number (default to `6`).
@z

@x
```console
$ export BUILDKIT_TTY_LOG_LINES=8
```
@y
```console
$ export BUILDKIT_TTY_LOG_LINES=8
```
@z

@x
## EXPERIMENTAL_BUILDKIT_SOURCE_POLICY
@y
## EXPERIMENTAL_BUILDKIT_SOURCE_POLICY
@z

@x
Lets you specify a
[BuildKit source policy](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#reproducing-the-pinned-dependencies)
file for creating reproducible builds with pinned dependencies.
@y
Lets you specify a
[BuildKit source policy](https://github.com/moby/buildkit/blob/master/docs/build-repro.md#reproducing-the-pinned-dependencies)
file for creating reproducible builds with pinned dependencies.
@z

@x
```console
$ export EXPERIMENTAL_BUILDKIT_SOURCE_POLICY=./policy.json
```
@y
```console
$ export EXPERIMENTAL_BUILDKIT_SOURCE_POLICY=./policy.json
```
@z

@x
Example:
@y
Example:
@z

@x
```json
{
  "rules": [
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "docker-image://docker.io/library/alpine:latest"
      },
      "updates": {
        "identifier": "docker-image://docker.io/library/alpine:latest@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454"
      }
    },
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "https://raw.githubusercontent.com/moby/buildkit/v0.10.1/README.md"
      },
      "updates": {
        "attrs": {"http.checksum": "sha256:6e4b94fc270e708e1068be28bd3551dc6917a4fc5a61293d51bb36e6b75c4b53"}
      }
    },
    {
      "action": "DENY",
      "selector": {
        "identifier": "docker-image://docker.io/library/golang*"
      }
    }
  ]
}
```
@y
```json
{
  "rules": [
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "docker-image://docker.io/library/alpine:latest"
      },
      "updates": {
        "identifier": "docker-image://docker.io/library/alpine:latest@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454"
      }
    },
    {
      "action": "CONVERT",
      "selector": {
        "identifier": "https://raw.githubusercontent.com/moby/buildkit/v0.10.1/README.md"
      },
      "updates": {
        "attrs": {"http.checksum": "sha256:6e4b94fc270e708e1068be28bd3551dc6917a4fc5a61293d51bb36e6b75c4b53"}
      }
    },
    {
      "action": "DENY",
      "selector": {
        "identifier": "docker-image://docker.io/library/golang*"
      }
    }
  ]
}
```
@z

@x
## BUILDX_BUILDER
@y
## BUILDX_BUILDER
@z

@x
Overrides the configured builder instance. Same as the `docker buildx --builder`
CLI flag.
@y
Overrides the configured builder instance. Same as the `docker buildx --builder`
CLI flag.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_BUILDER=my-builder
```
@y
```console
$ export BUILDX_BUILDER=my-builder
```
@z

@x
## BUILDX_CONFIG
@y
## BUILDX_CONFIG
@z

@x
You can use `BUILDX_CONFIG` to specify the directory to use for build
configuration, state, and logs. The lookup order for this directory is as
follows:
@y
You can use `BUILDX_CONFIG` to specify the directory to use for build
configuration, state, and logs. The lookup order for this directory is as
follows:
@z

@x
- `$BUILDX_CONFIG`
- `$DOCKER_CONFIG/buildx`
- `~/.docker/buildx` (default)
@y
- `$BUILDX_CONFIG`
- `$DOCKER_CONFIG/buildx`
- `~/.docker/buildx` (default)
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_CONFIG=/usr/local/etc
```
@y
```console
$ export BUILDX_CONFIG=/usr/local/etc
```
@z

@x
## BUILDX_EXPERIMENTAL
@y
## BUILDX_EXPERIMENTAL
@z

@x
Enables experimental build features.
@y
Enables experimental build features.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_EXPERIMENTAL=1
```
@y
```console
$ export BUILDX_EXPERIMENTAL=1
```
@z

@x
## BUILDX_GIT_CHECK_DIRTY
@y
## BUILDX_GIT_CHECK_DIRTY
@z

@x
_Introduced in [Buildx v0.10.4](../release-notes.md#0104)_
@y
_Introduced in [Buildx v0.10.4](../release-notes.md#0104)_
@z

@x
When set to true, checks for dirty state in source control information for
[provenance attestations](../attestations/slsa-provenance.md).
@y
When set to true, checks for dirty state in source control information for
[provenance attestations](../attestations/slsa-provenance.md).
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_GIT_CHECK_DIRTY=1
```
@y
```console
$ export BUILDX_GIT_CHECK_DIRTY=1
```
@z

@x
## BUILDX_GIT_INFO
@y
## BUILDX_GIT_INFO
@z

@x
_Introduced in [Buildx v0.10.0](../release-notes.md#0100)_
@y
_Introduced in [Buildx v0.10.0](../release-notes.md#0100)_
@z

@x
When set to false, removes source control information from
[provenance attestations](../attestations/slsa-provenance.md).
@y
When set to false, removes source control information from
[provenance attestations](../attestations/slsa-provenance.md).
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_GIT_INFO=0
```
@y
```console
$ export BUILDX_GIT_INFO=0
```
@z

@x
## BUILDX_GIT_LABELS
@y
## BUILDX_GIT_LABELS
@z

@x
_Introduced in [Buildx v0.10.0](../release-notes.md#0100)_
@y
_Introduced in [Buildx v0.10.0](../release-notes.md#0100)_
@z

@x
Adds provenance labels, based on Git information, to images that you build. The
labels are:
@y
Adds provenance labels, based on Git information, to images that you build. The
labels are:
@z

@x
- `com.docker.image.source.entrypoint`: Location of the Dockerfile relative to
  the project root
- `org.opencontainers.image.revision`: Git commit revision
- `org.opencontainers.image.source`: SSH or HTTPS address of the repository
@y
- `com.docker.image.source.entrypoint`: Location of the Dockerfile relative to
  the project root
- `org.opencontainers.image.revision`: Git commit revision
- `org.opencontainers.image.source`: SSH or HTTPS address of the repository
@z

@x
Example:
@y
Example:
@z

@x
```json
  "Labels": {
    "com.docker.image.source.entrypoint": "Dockerfile",
    "org.opencontainers.image.revision": "5734329c6af43c2ae295010778cd308866b95d9b",
    "org.opencontainers.image.source": "git@github.com:foo/bar.git"
  }
```
@y
```json
  "Labels": {
    "com.docker.image.source.entrypoint": "Dockerfile",
    "org.opencontainers.image.revision": "5734329c6af43c2ae295010778cd308866b95d9b",
    "org.opencontainers.image.source": "git@github.com:foo/bar.git"
  }
```
@z

@x
Usage:
@y
Usage:
@z

@x
- Set `BUILDX_GIT_LABELS=1` to include the `entrypoint` and `revision` labels.
- Set `BUILDX_GIT_LABELS=full` to include all labels.
@y
- Set `BUILDX_GIT_LABELS=1` to include the `entrypoint` and `revision` labels.
- Set `BUILDX_GIT_LABELS=full` to include all labels.
@z

@x
If the repository is in a dirty state, the `revision` gets a `-dirty` suffix.
@y
If the repository is in a dirty state, the `revision` gets a `-dirty` suffix.
@z

@x
## BUILDX_NO_DEFAULT_ATTESTATIONS
@y
## BUILDX_NO_DEFAULT_ATTESTATIONS
@z

@x
_Introduced in [Buildx v0.10.4](../release-notes.md#0104)_
@y
_Introduced in [Buildx v0.10.4](../release-notes.md#0104)_
@z

@x
By default, BuildKit v0.11 and later adds
[provenance attestations](../attestations/slsa-provenance.md) to images you
build. Set `BUILDX_NO_DEFAULT_ATTESTATIONS=1` to disable the default provenance
attestations.
@y
By default, BuildKit v0.11 and later adds
[provenance attestations](../attestations/slsa-provenance.md) to images you
build. Set `BUILDX_NO_DEFAULT_ATTESTATIONS=1` to disable the default provenance
attestations.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_NO_DEFAULT_ATTESTATIONS=1
```
@y
```console
$ export BUILDX_NO_DEFAULT_ATTESTATIONS=1
```
@z

@x
## BUILDX_NO_DEFAULT_LOAD
@y
## BUILDX_NO_DEFAULT_LOAD
@z

@x
When you build an image using the `docker` driver, the image is automatically
loaded to the image store when the build finishes. Set `BUILDX_NO_DEFAULT_LOAD`
to disable automatic loading of images to the local container store.
@y
When you build an image using the `docker` driver, the image is automatically
loaded to the image store when the build finishes. Set `BUILDX_NO_DEFAULT_LOAD`
to disable automatic loading of images to the local container store.
@z

@x
Usage:
@y
Usage:
@z

@x
```console
$ export BUILDX_NO_DEFAULT_LOAD=1
```
@y
```console
$ export BUILDX_NO_DEFAULT_LOAD=1
```
@z
