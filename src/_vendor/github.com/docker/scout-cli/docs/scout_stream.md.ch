%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout stream
@y
# docker scout stream
@z

@x
<!---MARKER_GEN_START-->
Manage streams (experimental)
@y
<!---MARKER_GEN_START-->
Manage streams (experimental)
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
The `docker scout stream` command lists the deployment streams and records an image to it.
@y
The `docker scout stream` command lists the deployment streams and records an image to it.
@z

@x
Once recorded, streams can be referred to by their name, eg. in the `docker scout compare` command using `--to-stream`.
@y
Once recorded, streams can be referred to by their name, eg. in the `docker scout compare` command using `--to-stream`.
@z

@x
## Examples
@y
## Examples
@z

@x
### List existing streams
@y
### List existing streams
@z

@x
```console
$ %[1]s %[2]s
prod-cluster-123
stage-cluster-234
```
@y
```console
$ %[1]s %[2]s
prod-cluster-123
stage-cluster-234
```
@z

@x
### List images of a stream
@y
### List images of a stream
@z

@x
```console
$ %[1]s %[2]s prod-cluster-123
namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
```
@y
```console
$ %[1]s %[2]s prod-cluster-123
namespace/repo:tag@sha256:9a4df4fadc9bbd44c345e473e0688c2066a6583d4741679494ba9228cfd93e1b
namespace/other-repo:tag@sha256:0001d6ce124855b0a158569c584162097fe0ca8d72519067c2c8e3ce407c580f
```
@z

@x
### Record an image to a stream, for a specific platform
@y
### Record an image to a stream, for a specific platform
@z

@x
```console
$ %[1]s %[2]s stage-cluster-234 namespace/repo:stage-latest --platform linux/amd64
✓ Pulled
✓ Successfully recorded namespace/repo:stage-latest in stream stage-cluster-234
```
@y
```console
$ %[1]s %[2]s stage-cluster-234 namespace/repo:stage-latest --platform linux/amd64
✓ Pulled
✓ Successfully recorded namespace/repo:stage-latest in stream stage-cluster-234
```
@z
