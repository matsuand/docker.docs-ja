%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker scout config
@y
# docker scout config
@z

@x
<!---MARKER_GEN_START-->
Manage Docker Scout configuration
@y
<!---MARKER_GEN_START-->
Manage Docker Scout configuration
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
`docker scout config` allows you to list, get and set Docker Scout configuration.
@y
`docker scout config` allows you to list, get and set Docker Scout configuration.
@z

@x
Available configuration key:
@y
Available configuration key:
@z

@x
- `organization`: Namespace of the Docker organization to be used by default.
@y
- `organization`: Namespace of the Docker organization to be used by default.
@z

@x
## Examples
@y
## Examples
@z

@x
### List existing configuration
@y
### List existing configuration
@z

@x
```console
$ docker scout config
organization=my-org-namespace
```
@y
```console
$ docker scout config
organization=my-org-namespace
```
@z

@x
### Print configuration value
@y
### Print configuration value
@z

@x
```console
$ docker scout config organization
my-org-namespace
```
@y
```console
$ docker scout config organization
my-org-namespace
```
@z

@x
### Set configuration value
@y
### Set configuration value
@z

@x
```console
$ docker scout config organization my-org-namespace
    ✓ Successfully set organization to my-org-namespace
```
@y
```console
$ docker scout config organization my-org-namespace
    ✓ Successfully set organization to my-org-namespace
```
@z
