%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout watch
@y
# docker scout watch
@z

@x
<!---MARKER_GEN_START-->
Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
@y
<!---MARKER_GEN_START-->
Watch repositories in a registry and push images and indexes to Docker Scout (experimental)
@z

@x
### Options
@y
### Options
@z

@x
| Name                 | Type          | Default | Description                                                                         |
|:---------------------|:--------------|:--------|:------------------------------------------------------------------------------------|
| `--all-images`       |               |         | Push all images instead of only the ones pushed during the watch command is running |
| `--dry-run`          |               |         | Watch images and prepare them, but do not push them                                 |
| `--interval`         | `int64`       | `60`    | Interval in seconds between checks                                                  |
| `--org`              | `string`      |         | Namespace of the Docker organization to which image will be pushed                  |
| `--refresh-registry` |               |         | Refresh the list of repositories of a registry at every run. Only with --registry.  |
| `--registry`         | `string`      |         | Registry to watch                                                                   |
| `--repository`       | `stringSlice` |         | Repository to watch                                                                 |
| `--sbom`             |               |         | Create and upload SBOMs                                                             |
| `--tag`              | `stringSlice` |         | Regular expression to match tags to watch                                           |
| `--workers`          | `int`         | `3`     | Number of concurrent workers                                                        |
@y
| Name                 | Type          | Default | Description                                                                         |
|:---------------------|:--------------|:--------|:------------------------------------------------------------------------------------|
| `--all-images`       |               |         | Push all images instead of only the ones pushed during the watch command is running |
| `--dry-run`          |               |         | Watch images and prepare them, but do not push them                                 |
| `--interval`         | `int64`       | `60`    | Interval in seconds between checks                                                  |
| `--org`              | `string`      |         | Namespace of the Docker organization to which image will be pushed                  |
| `--refresh-registry` |               |         | Refresh the list of repositories of a registry at every run. Only with --registry.  |
| `--registry`         | `string`      |         | Registry to watch                                                                   |
| `--repository`       | `stringSlice` |         | Repository to watch                                                                 |
| `--sbom`             |               |         | Create and upload SBOMs                                                             |
| `--tag`              | `stringSlice` |         | Regular expression to match tags to watch                                           |
| `--workers`          | `int`         | `3`     | Number of concurrent workers                                                        |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
The `docker scout watch` command watches repositories in a registry
and pushes images or analysis results to Docker Scout.
@y
The `docker scout watch` command watches repositories in a registry
and pushes images or analysis results to Docker Scout.
@z

@x
## Examples
@y
## Examples
@z

@x
### Watch for new images from two repositories and push them
@y
### Watch for new images from two repositories and push them
@z

@x
```console
$ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2
```
@y
```console
$ docker scout watch --org my-org --repository registry-1.example.com/repo-1 --repository registry-2.example.com/repo-2
```
@z

@x
### Only push images with a specific tag
@y
### Only push images with a specific tag
@z

@x
```console
$ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest
```
@y
```console
$ docker scout watch --org my-org --repository registry.example.com/my-service --tag latest
```
@z

@x
### Watch all repositories of a registry
@y
### Watch all repositories of a registry
@z

@x
```console
$ docker scout watch --org my-org --registry registry.example.com
```
@y
```console
$ docker scout watch --org my-org --registry registry.example.com
```
@z

@x
### Push all images and not just the new ones
@y
### Push all images and not just the new ones
@z

@x
```console
$ docker scout watch--org my-org --repository registry.example.com/my-service --all-images
```
@y
```console
$ docker scout watch--org my-org --repository registry.example.com/my-service --all-images
```
@z
