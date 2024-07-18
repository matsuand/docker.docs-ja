%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose push
@y
# docker compose push
@z

@x
<!---MARKER_GEN_START-->
Pushes images for services to their respective registry/repository.
@y
<!---MARKER_GEN_START-->
Pushes images for services to their respective registry/repository.
@z

@x
The following assumptions are made:
- You are pushing an image you have built locally
- You have access to the build key
@y
The following assumptions are made:
- You are pushing an image you have built locally
- You have access to the build key
@z

@x
Examples
@y
Examples
@z

@x
```yaml
services:
  service1:
    build: .
    image: localhost:5000/yourimage  ## goes to local registry
@y
```yaml
services:
  service1:
    build: .
    image: localhost:5000/yourimage  ## goes to local registry
@z

@x
  service2:
    build: .
    image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
```
@y
  service2:
    build: .
    image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
```
@z

@x
### Options
@y
### Options
@z

@x
| Name                     | Type   | Default | Description                                            |
|:-------------------------|:-------|:--------|:-------------------------------------------------------|
| `--dry-run`              | `bool` |         | Execute command in dry run mode                        |
| `--ignore-push-failures` | `bool` |         | Push what it can and ignores images with push failures |
| `--include-deps`         | `bool` |         | Also push images of services declared as dependencies  |
| `-q`, `--quiet`          | `bool` |         | Push without printing progress information             |
@y
| Name                     | Type   | Default | Description                                            |
|:-------------------------|:-------|:--------|:-------------------------------------------------------|
| `--dry-run`              | `bool` |         | Execute command in dry run mode                        |
| `--ignore-push-failures` | `bool` |         | Push what it can and ignores images with push failures |
| `--include-deps`         | `bool` |         | Also push images of services declared as dependencies  |
| `-q`, `--quiet`          | `bool` |         | Push without printing progress information             |
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
Pushes images for services to their respective registry/repository.
@y
Pushes images for services to their respective registry/repository.
@z

@x
The following assumptions are made:
- You are pushing an image you have built locally
- You have access to the build key
@y
The following assumptions are made:
- You are pushing an image you have built locally
- You have access to the build key
@z

@x
Examples
@y
Examples
@z

@x
```yaml
services:
  service1:
    build: .
    image: localhost:5000/yourimage  ## goes to local registry
@y
```yaml
services:
  service1:
    build: .
    image: localhost:5000/yourimage  ## goes to local registry
@z

@x
  service2:
    build: .
    image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
```
@y
  service2:
    build: .
    image: your-dockerid/yourimage  ## goes to your repository on Docker Hub
```
@z
