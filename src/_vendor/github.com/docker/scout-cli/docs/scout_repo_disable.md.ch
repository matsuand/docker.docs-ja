%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout repo disable
@y
# docker scout repo disable
@z

@x
<!---MARKER_GEN_START-->
Disable Docker Scout
@y
<!---MARKER_GEN_START-->
Disable Docker Scout
@z

@x
### Options
@y
### Options
@z

@x
| Name            | Type     | Default | Description                                                                  |
|:----------------|:---------|:--------|:-----------------------------------------------------------------------------|
| `--all`         |          |         | Disable all repositories of the organization. Can not be used with --filter. |
| `--filter`      | `string` |         | Regular expression to filter repositories by name                            |
| `--integration` | `string` |         | Name of the integration to use for enabling an image                         |
| `--org`         | `string` |         | Namespace of the Docker organization                                         |
| `--registry`    | `string` |         | Container Registry                                                           |
@y
| Name            | Type     | Default | Description                                                                  |
|:----------------|:---------|:--------|:-----------------------------------------------------------------------------|
| `--all`         |          |         | Disable all repositories of the organization. Can not be used with --filter. |
| `--filter`      | `string` |         | Regular expression to filter repositories by name                            |
| `--integration` | `string` |         | Name of the integration to use for enabling an image                         |
| `--org`         | `string` |         | Namespace of the Docker organization                                         |
| `--registry`    | `string` |         | Container Registry                                                           |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Examples
@y
## Examples
@z

@x
### Disable a specific repository
@y
### Disable a specific repository
@z

@x
```console
$ docker scout repo disable my/repository
```
@y
```console
$ docker scout repo disable my/repository
```
@z

@x
### Disable all repositories of the organization
@y
### Disable all repositories of the organization
@z

@x
```console
$ docker scout repo disable --all
```
@y
```console
$ docker scout repo disable --all
```
@z

@x
### Disable some repositories based on a filter
@y
### Disable some repositories based on a filter
@z

@x
```console
$ docker scout repo disable --filter namespace/backend
```
@y
```console
$ docker scout repo disable --filter namespace/backend
```
@z

@x
### Disable a repository from a specific registry
@y
### Disable a repository from a specific registry
@z

@x
```console
$ docker scout repo disable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
```
@y
```console
$ docker scout repo disable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
```
@z
