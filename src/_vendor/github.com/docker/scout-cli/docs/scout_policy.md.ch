%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout policy
@y
# docker scout policy
@z

@x
<!---MARKER_GEN_START-->
Evaluate policies against an image and display the policy evaluation results (experimental)
@y
<!---MARKER_GEN_START-->
Evaluate policies against an image and display the policy evaluation results (experimental)
@z

@x
### Options
@y
### Options
@z

@x
| Name                | Type     | Default | Description                                                 |
|:--------------------|:---------|:--------|:------------------------------------------------------------|
| `-e`, `--exit-code` |          |         | Return exit code '2' if policies are not met, '0' otherwise |
| `--org`             | `string` |         | Namespace of the Docker organization                        |
| `-o`, `--output`    | `string` |         | Write the report to a file                                  |
| `--platform`        | `string` |         | Platform of image to pull policy results from               |
| `--to-env`          | `string` |         | Name of the environment to compare to                       |
| `--to-latest`       |          |         | Latest image processed to compare to                        |
@y
| Name                | Type     | Default | Description                                                 |
|:--------------------|:---------|:--------|:------------------------------------------------------------|
| `-e`, `--exit-code` |          |         | Return exit code '2' if policies are not met, '0' otherwise |
| `--org`             | `string` |         | Namespace of the Docker organization                        |
| `-o`, `--output`    | `string` |         | Write the report to a file                                  |
| `--platform`        | `string` |         | Platform of image to pull policy results from               |
| `--to-env`          | `string` |         | Name of the environment to compare to                       |
| `--to-latest`       |          |         | Latest image processed to compare to                        |
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
The `docker scout policy` command evaluates policies against an image.
The image analysis is uploaded to Docker Scout where policies get evaluated.
@y
The `docker scout policy` command evaluates policies against an image.
The image analysis is uploaded to Docker Scout where policies get evaluated.
@z

@x
The policy evaluation results may take a few minutes to become available.
@y
The policy evaluation results may take a few minutes to become available.
@z

@x
## Examples
@y
## Examples
@z

@x
### Evaluate policies against an image and display the results
@y
### Evaluate policies against an image and display the results
@z

@x
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1
```
@y
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1
```
@z

@x
### Evaluate policies against an image for a specific organization
@y
### Evaluate policies against an image for a specific organization
@z

@x
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --org dockerscoutpolicy
```
@y
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --org dockerscoutpolicy
```
@z

@x
### Evaluate policies against an image with a specific platform
@y
### Evaluate policies against an image with a specific platform
@z

@x
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --platform linux/amd64
```
@y
```console
$ docker scout policy dockerscoutpolicy/customers-api-service:0.0.1 --platform linux/amd64
```
@z

@x
### Compare policy results for a repository in a specific environment
@y
### Compare policy results for a repository in a specific environment
@z

@x
```console
$ docker scout policy dockerscoutpolicy/customers-api-service --to-env production
```
@y
```console
$ docker scout policy dockerscoutpolicy/customers-api-service --to-env production
```
@z
