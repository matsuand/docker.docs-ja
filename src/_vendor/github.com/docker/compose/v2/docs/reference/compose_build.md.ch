%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose build
@y
# docker compose build
@z

@x
Build or rebuild services
@y
Build or rebuild services
@z

@x
### Options
@y
### オプション {#options}
@z

@x
| Name                  | Type          | Default | Description                                                                                                 |
|:----------------------|:--------------|:--------|:------------------------------------------------------------------------------------------------------------|
| `--build-arg`         | `stringArray` |         | Set build-time variables for services                                                                       |
| `--builder`           | `string`      |         | Set builder to use                                                                                          |
| `--dry-run`           |               |         | Execute command in dry run mode                                                                             |
| `-m`, `--memory`      | `bytes`       | `0`     | Set memory limit for the build container. Not supported by BuildKit.                                        |
| `--no-cache`          |               |         | Do not use cache when building the image                                                                    |
| `--pull`              |               |         | Always attempt to pull a newer version of the image                                                         |
| `--push`              |               |         | Push service images                                                                                         |
| `-q`, `--quiet`       |               |         | Don't print anything to STDOUT                                                                              |
| `--ssh`               | `string`      |         | Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent) |
| `--with-dependencies` |               |         | Also build dependencies (transitively)                                                                      |
@y
| Name                  | Type          | Default | Description                                                                                                 |
|:----------------------|:--------------|:--------|:------------------------------------------------------------------------------------------------------------|
| `--build-arg`         | `stringArray` |         | Set build-time variables for services                                                                       |
| `--builder`           | `string`      |         | Set builder to use                                                                                          |
| `--dry-run`           |               |         | Execute command in dry run mode                                                                             |
| `-m`, `--memory`      | `bytes`       | `0`     | Set memory limit for the build container. Not supported by BuildKit.                                        |
| `--no-cache`          |               |         | Do not use cache when building the image                                                                    |
| `--pull`              |               |         | Always attempt to pull a newer version of the image                                                         |
| `--push`              |               |         | Push service images                                                                                         |
| `-q`, `--quiet`       |               |         | Don't print anything to STDOUT                                                                              |
| `--ssh`               | `string`      |         | Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent) |
| `--with-dependencies` |               |         | Also build dependencies (transitively)                                                                      |
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Services are built once and then tagged, by default as `project-service`.
@y
Services are built once and then tagged, by default as `project-service`.
@z

@x
If the Compose file specifies an
[image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
the image is tagged with that name, substituting any variables beforehand. See
[variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).
@y
If the Compose file specifies an
[image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
the image is tagged with that name, substituting any variables beforehand. See
[variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).
@z

@x
If you change a service's `Dockerfile` or the contents of its build directory,
run `docker compose build` to rebuild it.
@y
If you change a service's `Dockerfile` or the contents of its build directory,
run `docker compose build` to rebuild it.
@z
