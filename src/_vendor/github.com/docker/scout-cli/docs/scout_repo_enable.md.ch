%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout repo enable
@y
# docker scout repo enable
@z

@x
<!---MARKER_GEN_START-->
Enable Docker Scout
@y
<!---MARKER_GEN_START-->
Enable Docker Scout
@z

@x
### Options
@y
### Options
@z

@x
| Name            | Type     | Default | Description                                                                 |
|:----------------|:---------|:--------|:----------------------------------------------------------------------------|
| `--all`         |          |         | Enable all repositories of the organization. Can not be used with --filter. |
| `--filter`      | `string` |         | Regular expression to filter repositories by name                           |
| `--integration` | `string` |         | Name of the integration to use for enabling an image                        |
| `--org`         | `string` |         | Namespace of the Docker organization                                        |
| `--registry`    | `string` |         | Container Registry                                                          |
@y
| Name            | Type     | Default | Description                                                                 |
|:----------------|:---------|:--------|:----------------------------------------------------------------------------|
| `--all`         |          |         | Enable all repositories of the organization. Can not be used with --filter. |
| `--filter`      | `string` |         | Regular expression to filter repositories by name                           |
| `--integration` | `string` |         | Name of the integration to use for enabling an image                        |
| `--org`         | `string` |         | Namespace of the Docker organization                                        |
| `--registry`    | `string` |         | Container Registry                                                          |
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
### Enable a specific repository
@y
### Enable a specific repository
@z

@x
```console
$ docker scout repo enable my/repository
```
@y
```console
$ docker scout repo enable my/repository
```
@z

@x
### Enable all repositories of the organization
@y
### Enable all repositories of the organization
@z

@x
```console
$ docker scout repo enable --all
```
@y
```console
$ docker scout repo enable --all
```
@z

@x
### Enable some repositories based on a filter
@y
### Enable some repositories based on a filter
@z

@x
```console
$ docker scout repo enable --filter namespace/backend
```
@y
```console
$ docker scout repo enable --filter namespace/backend
```
@z

@x
### Enable a repository from a specific registry
@y
### Enable a repository from a specific registry
@z

@x
```console
$ docker scout repo enable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
```
@y
```console
$ docker scout repo enable my/repository --registry 123456.dkr.ecr.us-east-1.amazonaws.com
```
@z
