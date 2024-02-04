%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout environment
@y
# docker scout environment
@z

@x
<!---MARKER_GEN_START-->
Manage environments (experimental)
@y
<!---MARKER_GEN_START-->
Manage environments (experimental)
@z

@x
### Aliases
@y
### Aliases
@z

@x
`docker scout environment`, `docker scout env`
@y
`docker scout environment`, `docker scout env`
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                          |
|:-----------------|:---------|:--------|:-------------------------------------|
| `--org`          | `string` |         | Namespace of the Docker organization |
| `-o`, `--output` | `string` |         | Write the report to a file           |
| `--platform`     | `string` |         | Platform of image to record          |
@y
| Name             | Type     | Default | Description                          |
|:-----------------|:---------|:--------|:-------------------------------------|
| `--org`          | `string` |         | Namespace of the Docker organization |
| `-o`, `--output` | `string` |         | Write the report to a file           |
| `--platform`     | `string` |         | Platform of image to record          |
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
The `docker scout environment` command lists the environments.
If you pass an image reference, the image is recorded to the specified environment.
@y
The `docker scout environment` command lists the environments.
If you pass an image reference, the image is recorded to the specified environment.
@z

@x
Once recorded, environments can be referred to by their name. For example,
you can refer to the `production` environment with the `docker scout compare`
command as follows:
@y
Once recorded, environments can be referred to by their name. For example,
you can refer to the `production` environment with the `docker scout compare`
command as follows:
@z

@x
```console
$ docker scout compare --to-env production
```
@y
```console
$ docker scout compare --to-env production
```
@z

@x
## Examples
@y
## Examples
@z

@x
### List existing environments
@y
### List existing environments
@z

@x
```console
$ docker scout environment
prod
staging
```
@y
```console
$ docker scout environment
prod
staging
```
@z

@x
### List images of an environment
@y
### List images of an environment
@z

@x
```console
$ docker scout environment staging
namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
```
@y
```console
$ docker scout environment staging
namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
```
@z

@x
### Record an image to an environment, for a specific platform
@y
### Record an image to an environment, for a specific platform
@z

@x
```console
$ docker scout environment staging namespace/repo:stage-latest --platform linux/amd64
✓ Pulled
✓ Successfully recorded namespace/repo:stage-latest in environment staging
```
@y
```console
$ docker scout environment staging namespace/repo:stage-latest --platform linux/amd64
✓ Pulled
✓ Successfully recorded namespace/repo:stage-latest in environment staging
```
@z
