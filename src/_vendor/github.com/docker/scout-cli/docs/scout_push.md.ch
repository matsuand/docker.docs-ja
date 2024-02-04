%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout push
@y
# docker scout push
@z

@x
<!---MARKER_GEN_START-->
Push an image or image index to Docker Scout (experimental)
@y
<!---MARKER_GEN_START-->
Push an image or image index to Docker Scout (experimental)
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                                                        |
|:-----------------|:---------|:--------|:-------------------------------------------------------------------|
| `--author`       | `string` |         | Name of the author of the image                                    |
| `--org`          | `string` |         | Namespace of the Docker organization to which image will be pushed |
| `-o`, `--output` | `string` |         | Write the report to a file                                         |
| `--sbom`         |          |         | Create and upload SBOMs                                            |
| `--timestamp`    | `string` |         | Timestamp of image or tag creation                                 |
@y
| Name             | Type     | Default | Description                                                        |
|:-----------------|:---------|:--------|:-------------------------------------------------------------------|
| `--author`       | `string` |         | Name of the author of the image                                    |
| `--org`          | `string` |         | Namespace of the Docker organization to which image will be pushed |
| `-o`, `--output` | `string` |         | Write the report to a file                                         |
| `--sbom`         |          |         | Create and upload SBOMs                                            |
| `--timestamp`    | `string` |         | Timestamp of image or tag creation                                 |
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
The `docker scout push` command lets you push an image or analysis result to Docker Scout.
@y
The `docker scout push` command lets you push an image or analysis result to Docker Scout.
@z

@x
## Examples
@y
## Examples
@z

@x
### Push an image to Docker Scout
@y
### Push an image to Docker Scout
@z

@x
```console
$ docker scout push --org my-org registry.example.com/repo:tag
```
@y
```console
$ docker scout push --org my-org registry.example.com/repo:tag
```
@z
