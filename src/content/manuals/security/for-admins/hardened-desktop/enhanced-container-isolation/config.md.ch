%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Advanced Configuration for Enhanced Container Isolation
title: Advanced configuration options for ECI
linkTitle: Advanced configuration
keywords: enhanced container isolation, Docker Desktop, Docker socket, bind mount, configuration
@y
description: Advanced Configuration for Enhanced Container Isolation
title: Advanced configuration options for ECI
linkTitle: Advanced configuration
keywords: enhanced container isolation, Docker Desktop, Docker socket, bind mount, configuration
@z

@x
## Docker socket mount permissions
@y
## Docker socket mount permissions
@z

@x
By default, when Enhanced Container Isolation (ECI) is enabled, Docker Desktop does not allow bind-mounting the
Docker Engine socket into containers:
@y
By default, when Enhanced Container Isolation (ECI) is enabled, Docker Desktop does not allow bind-mounting the
Docker Engine socket into containers:
@z

@x
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker:cli
docker: Error response from daemon: enhanced container isolation: docker socket mount denied for container with image "docker.io/library/docker"; image is not in the allowed list; if you wish to allow it, configure the docker socket image list in the Docker Desktop settings.
```
This prevents malicious containers from gaining access to the Docker Engine, as
such access could allow them to perform supply chain attacks. For example, build and
push malicious images into the organization's repositories or similar.
@y
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker:cli
docker: Error response from daemon: enhanced container isolation: docker socket mount denied for container with image "docker.io/library/docker"; image is not in the allowed list; if you wish to allow it, configure the docker socket image list in the Docker Desktop settings.
```
This prevents malicious containers from gaining access to the Docker Engine, as
such access could allow them to perform supply chain attacks. For example, build and
push malicious images into the organization's repositories or similar.
@z

@x
However, some legitimate use cases require containers to have access to the
Docker Engine socket. For example, the popular [Testcontainers](https://testcontainers.com/)
framework sometimes bind-mounts the Docker Engine socket into containers to
manage them or perform post-test cleanup. Similarly, some Buildpack frameworks,
for example [Paketo](https://paketo.io/), require Docker socket bind-mounts into
containers.
@y
However, some legitimate use cases require containers to have access to the
Docker Engine socket. For example, the popular [Testcontainers](https://testcontainers.com/)
framework sometimes bind-mounts the Docker Engine socket into containers to
manage them or perform post-test cleanup. Similarly, some Buildpack frameworks,
for example [Paketo](https://paketo.io/), require Docker socket bind-mounts into
containers.
@z

@x
Administrators can optionally configure ECI to allow
bind mounting the Docker Engine socket into containers, but in a controlled way.
@y
Administrators can optionally configure ECI to allow
bind mounting the Docker Engine socket into containers, but in a controlled way.
@z

@x
This can be done via the Docker Socket mount permissions section in the
[`admin-settings.json`](../settings-management/configure-json-file.md) file. For example:
@y
This can be done via the Docker Socket mount permissions section in the
[`admin-settings.json`](../settings-management/configure-json-file.md) file. For example:
@z

@x
```json
{
  "configurationFileVersion": 2,
  "enhancedContainerIsolation": {
    "locked": true,
    "value": true,
    "dockerSocketMount": {
      "imageList": {
        "images": [
          "docker.io/localstack/localstack:*",
          "docker.io/testcontainers/ryuk:*",
          "docker:cli"
        ]
      },
      "commandList": {
        "type": "deny",
        "commands": ["push"]
      }
    }
  }
}
```
@y
```json
{
  "configurationFileVersion": 2,
  "enhancedContainerIsolation": {
    "locked": true,
    "value": true,
    "dockerSocketMount": {
      "imageList": {
        "images": [
          "docker.io/localstack/localstack:*",
          "docker.io/testcontainers/ryuk:*",
          "docker:cli"
        ]
      },
      "commandList": {
        "type": "deny",
        "commands": ["push"]
      }
    }
  }
}
```
@z

@x
> [!TIP]
>
> You can now also configure these settings in the [Docker Admin Console](/manuals/security/for-admins/hardened-desktop/settings-management/configure-admin-console.md).
@y
> [!TIP]
>
> You can now also configure these settings in the [Docker Admin Console](manuals/security/for-admins/hardened-desktop/settings-management/configure-admin-console.md).
@z

@x
As shown above, there are two configurations for bind-mounting the Docker
socket into containers: the `imageList` and the `commandList`. These are
described below.
@y
As shown above, there are two configurations for bind-mounting the Docker
socket into containers: the `imageList` and the `commandList`. These are
described below.
@z

@x
### Image list
@y
### Image list
@z

@x
The `imageList` is a list of container images that are allowed to bind-mount the
Docker socket. By default the list is empty, no containers are allowed to
bind-mount the Docker socket when ECI is enabled. However, an administrator can add
images to the list, using either of these formats:
@y
The `imageList` is a list of container images that are allowed to bind-mount the
Docker socket. By default the list is empty, no containers are allowed to
bind-mount the Docker socket when ECI is enabled. However, an administrator can add
images to the list, using either of these formats:
@z

@x
| Image Reference Format  | Description |
| :---------------------- | :---------- |
| `<image_name>[:<tag>]`  | Name of the image, with optional tag. If the tag is omitted, the `:latest` tag is used. If the tag is the wildcard `*`, then it means "any tag for that image." |
| `<image_name>@<digest>` | Name of the image, with a specific repository digest (e.g., as reported by `docker buildx imagetools inspect <image>`). This means only the image that matches that name and digest is allowed. |
@y
| Image Reference Format  | Description |
| :---------------------- | :---------- |
| `<image_name>[:<tag>]`  | Name of the image, with optional tag. If the tag is omitted, the `:latest` tag is used. If the tag is the wildcard `*`, then it means "any tag for that image." |
| `<image_name>@<digest>` | Name of the image, with a specific repository digest (e.g., as reported by `docker buildx imagetools inspect <image>`). This means only the image that matches that name and digest is allowed. |
@z

@x
The image name follows the standard convention, so it can point to any registry
and repository.
@y
The image name follows the standard convention, so it can point to any registry
and repository.
@z

@x
In the previous example, the image list was configured with three images:
@y
In the previous example, the image list was configured with three images:
@z

@x
```json
"imageList": {
  "images": [
    "docker.io/localstack/localstack:*",
    "docker.io/testcontainers/ryuk:*",
    "docker:cli"
  ]
}
```
@y
```json
"imageList": {
  "images": [
    "docker.io/localstack/localstack:*",
    "docker.io/testcontainers/ryuk:*",
    "docker:cli"
  ]
}
```
@z

@x
This means that containers that use either the `docker.io/localstack/localstack`
or the `docker.io/testcontainers/ryuk` image (with any tag), or the `docker:cli`
image, are allowed to bind-mount the Docker socket when ECI is enabled. Thus,
the following works:
@y
This means that containers that use either the `docker.io/localstack/localstack`
or the `docker.io/testcontainers/ryuk` image (with any tag), or the `docker:cli`
image, are allowed to bind-mount the Docker socket when ECI is enabled. Thus,
the following works:
@z

@x
```console
$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock docker:cli sh
/ #
```
@y
```console
$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock docker:cli sh
/ #
```
@z

@x
> [!TIP]
>
> Be restrictive with the images you allow, as described in [Recommendations](#recommendations).
@y
> [!TIP]
>
> Be restrictive with the images you allow, as described in [Recommendations](#recommendations).
@z

@x
In general, it's easier to specify the image using the tag wildcard format, for example `<image-name>:*`, because then `imageList` doesn't need to be updated whenever a new version of the
image is used. Alternatively, you can use an immutable tag, for example `:latest`,
but it does not always work as well as the wildcard because, for example,
Testcontainers uses specific versions of the image, not necessarily the latest
one.
@y
In general, it's easier to specify the image using the tag wildcard format, for example `<image-name>:*`, because then `imageList` doesn't need to be updated whenever a new version of the
image is used. Alternatively, you can use an immutable tag, for example `:latest`,
but it does not always work as well as the wildcard because, for example,
Testcontainers uses specific versions of the image, not necessarily the latest
one.
@z

@x
When ECI is enabled, Docker Desktop periodically downloads the image digests
for the allowed images from the appropriate registry and stores them in
memory. Then, when a container is started with a Docker socket bind-mount,
Docker Desktop checks if the container's image digest matches one of the allowed
digests. If so, the container is allowed to start, otherwise it's blocked.
@y
When ECI is enabled, Docker Desktop periodically downloads the image digests
for the allowed images from the appropriate registry and stores them in
memory. Then, when a container is started with a Docker socket bind-mount,
Docker Desktop checks if the container's image digest matches one of the allowed
digests. If so, the container is allowed to start, otherwise it's blocked.
@z

@x
Due to the digest comparison, it's not possible to bypass the Docker socket mount permissions by re-tagging a
disallowed image to the name of an allowed one. In other words, if a user
does:
@y
Due to the digest comparison, it's not possible to bypass the Docker socket mount permissions by re-tagging a
disallowed image to the name of an allowed one. In other words, if a user
does:
@z

@x
```console
$ docker image rm <allowed_image>
$ docker tag <disallowed_image> <allowed_image>
$ docker run -v /var/run/docker.sock:/var/run/docker.sock <allowed_image>
```
@y
```console
$ docker image rm <allowed_image>
$ docker tag <disallowed_image> <allowed_image>
$ docker run -v /var/run/docker.sock:/var/run/docker.sock <allowed_image>
```
@z

@x
then the tag operation succeeds, but the `docker run` command fails
because the image digest of the disallowed image won't match that of the allowed
ones in the repository.
@y
then the tag operation succeeds, but the `docker run` command fails
because the image digest of the disallowed image won't match that of the allowed
ones in the repository.
@z

@x
### Docker Socket Mount Permissions for derived images
@y
### Docker Socket Mount Permissions for derived images
@z

@x
{{ introduced desktop 4.34.0 "../../../../desktop/release-notes.md#4340" }}
@y
{{ introduced desktop 4.34.0 "../../../../desktop/release-notes.md#4340" }}
@z

@x
As described in the prior section, administrators can configure the list of container
images that are allowed to mount the Docker socket via the `imageList`.
@y
As described in the prior section, administrators can configure the list of container
images that are allowed to mount the Docker socket via the `imageList`.
@z

@x
This works for most scenarios, but not always, because it requires knowing upfront
the name of the image(s) on which the Docker socket mounts should be allowed.
Some container tools such as [Paketo](https://paketo.io/) buildpacks,
build ephemeral local images that require Docker socket bind mounts. Since the name of
those ephemeral images is not known upfront, the `imageList` is not sufficient.
@y
This works for most scenarios, but not always, because it requires knowing upfront
the name of the image(s) on which the Docker socket mounts should be allowed.
Some container tools such as [Paketo](https://paketo.io/) buildpacks,
build ephemeral local images that require Docker socket bind mounts. Since the name of
those ephemeral images is not known upfront, the `imageList` is not sufficient.
@z

@x
To overcome this, starting with Docker Desktop version 4.34, the Docker Socket
mount permissions not only apply to the images listed in the `imageList`; they
also apply to any local images derived (i.e., built from) an image in the
`imageList`.
@y
To overcome this, starting with Docker Desktop version 4.34, the Docker Socket
mount permissions not only apply to the images listed in the `imageList`; they
also apply to any local images derived (i.e., built from) an image in the
`imageList`.
@z

@x
That is, if a local image called "myLocalImage" is built from "myBaseImage"
(i.e., has a Dockerfile with a `FROM myBaseImage`), then if "myBaseImage" is in
the `imageList`, both "myBaseImage" and "myLocalImage" are allowed to mount the
Docker socket.
@y
That is, if a local image called "myLocalImage" is built from "myBaseImage"
(i.e., has a Dockerfile with a `FROM myBaseImage`), then if "myBaseImage" is in
the `imageList`, both "myBaseImage" and "myLocalImage" are allowed to mount the
Docker socket.
@z

@x
For example, to enable Paketo buildpacks to work with Docker Desktop and ECI,
simply add the following image to the `imageList`:
@y
For example, to enable Paketo buildpacks to work with Docker Desktop and ECI,
simply add the following image to the `imageList`:
@z

@x
```json
"imageList": {
  "images": [
    "paketobuildpacks/builder:base",
  ],
  "allowDerivedImages": true
}
```
@y
```json
"imageList": {
  "images": [
    "paketobuildpacks/builder:base",
  ],
  "allowDerivedImages": true
}
```
@z

@x
When the buildpack runs, it will create an ephemeral image derived from
`paketobuildpacks/builder:base` and mount the Docker socket to it. ECI will
allow this because it will notice that the ephemeral image is derived from an
allowed image.
@y
When the buildpack runs, it will create an ephemeral image derived from
`paketobuildpacks/builder:base` and mount the Docker socket to it. ECI will
allow this because it will notice that the ephemeral image is derived from an
allowed image.
@z

@x
The behavior is enabled by default. It can be disabled by setting
`allowDerivedImages=false` in the `admin-settings.json` file. In general it is
not recommended that you disable this setting unless you know it won't be
required.
@y
The behavior is enabled by default. It can be disabled by setting
`allowDerivedImages=false` in the `admin-settings.json` file. In general it is
not recommended that you disable this setting unless you know it won't be
required.
@z

@x
A couple of caveats:
@y
A couple of caveats:
@z

@x
* The `allowDerivedImages` setting only applies to local-only images built from
  an allowed image. That is, the derived image must not be present in a remote
  repository because if it were, you would just list its name in the `imageList`.
@y
* The `allowDerivedImages` setting only applies to local-only images built from
  an allowed image. That is, the derived image must not be present in a remote
  repository because if it were, you would just list its name in the `imageList`.
@z

@x
* For derived image checking to work, the parent image (i.e., the image in the
  `imageList`) must be present locally (i.e., must have been explicitly pulled
  from a repository). This is usually not a problem as the tools that need this
  feature (e.g., Paketo buildpacks) will do the pre-pull of the parent image.
@y
* For derived image checking to work, the parent image (i.e., the image in the
  `imageList`) must be present locally (i.e., must have been explicitly pulled
  from a repository). This is usually not a problem as the tools that need this
  feature (e.g., Paketo buildpacks) will do the pre-pull of the parent image.
@z

@x
* For Docker Desktop versions 4.34 and 4.35 only: The `allowDerivedImages` setting
  applies to all images in the `imageList` specified with an explicit tag (e.g.,
  `<name>:<tag>`). It does not apply to images specified using the tag wildcard
  (e.g., `<name>:*`) described in the prior section. In Docker Desktop 4.36 and
  later, this caveat no longer applies, meaning that the `allowDerivedImages`
  settings applies to images specified with or without a wildcard tag. This
  makes it easier to manage the ECI Docker socket image list.
@y
* For Docker Desktop versions 4.34 and 4.35 only: The `allowDerivedImages` setting
  applies to all images in the `imageList` specified with an explicit tag (e.g.,
  `<name>:<tag>`). It does not apply to images specified using the tag wildcard
  (e.g., `<name>:*`) described in the prior section. In Docker Desktop 4.36 and
  later, this caveat no longer applies, meaning that the `allowDerivedImages`
  settings applies to images specified with or without a wildcard tag. This
  makes it easier to manage the ECI Docker socket image list.
@z

@x
### Allowing all containers to mount the Docker socket
@y
### Allowing all containers to mount the Docker socket
@z

@x
In Docker Desktop version 4.36 and later, it's possible to configure the image
list to allow any container to mount the Docker socket. You do this by adding
`"*"` to the `imageList`:
@y
In Docker Desktop version 4.36 and later, it's possible to configure the image
list to allow any container to mount the Docker socket. You do this by adding
`"*"` to the `imageList`:
@z

@x
```json
"imageList": {
  "images": [
    "*"
  ]
}
```
@y
```json
"imageList": {
  "images": [
    "*"
  ]
}
```
@z

@x
It is recommended that you use this only in scenarios where explicitly listing
allowed container images is not flexible enough.
@y
It is recommended that you use this only in scenarios where explicitly listing
allowed container images is not flexible enough.
@z

@x
### Command list
@y
### Command list
@z

@x
In addition to the `imageList` described in the prior sections, ECI can further
restrict the commands that a container can issue via a bind mounted Docker
socket. This is done via the Docker socket mount permission `commandList`, and
acts as a complementary security mechanism to the `imageList` (i.e., like a
second line of defense).
@y
In addition to the `imageList` described in the prior sections, ECI can further
restrict the commands that a container can issue via a bind mounted Docker
socket. This is done via the Docker socket mount permission `commandList`, and
acts as a complementary security mechanism to the `imageList` (i.e., like a
second line of defense).
@z

@x
For example, say the `imageList` is configured to allow image `docker:cli` to
mount the Docker socket, and a container is started with it:
@y
For example, say the `imageList` is configured to allow image `docker:cli` to
mount the Docker socket, and a container is started with it:
@z

@x
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock sh
/ #
```
@y
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock sh
/ #
```
@z

@x
By default, this allows the container to issue any command via that Docker
socket (e.g., build and push images to the organization's repositories), which
is generally not desirable.
@y
By default, this allows the container to issue any command via that Docker
socket (e.g., build and push images to the organization's repositories), which
is generally not desirable.
@z

@x
To improve security, the `commandList` can be configured to restrict the
commands that the processes inside the container can issue on the bind-mounted
Docker socket. The `commandList` can be configured as a "deny" list (default) or
an "allow" list, depending on your preference.
@y
To improve security, the `commandList` can be configured to restrict the
commands that the processes inside the container can issue on the bind-mounted
Docker socket. The `commandList` can be configured as a "deny" list (default) or
an "allow" list, depending on your preference.
@z

@x
Each command in the list is specified by its name, as reported by `docker
--help` (e.g., "ps", "build", "pull", "push", etc.) In addition, the following
command wildcards are allowed to block an entire group of commands:
@y
Each command in the list is specified by its name, as reported by `docker
--help` (e.g., "ps", "build", "pull", "push", etc.) In addition, the following
command wildcards are allowed to block an entire group of commands:
@z

@x
| Command wildcard  | Description |
| :---------------- | :---------- |
| "container\*"     | Refers to all "docker container ..." commands |
| "image\*"         | Refers to all "docker image ..." commands |
| "volume\*"        | Refers to all "docker volume ..." commands |
| "network\*"       | Refers to all "docker network ..." commands |
| "build\*"         | Refers to all "docker build ..." commands |
| "system\*"        | Refers to all "docker system ..." commands |
@y
| Command wildcard  | Description |
| :---------------- | :---------- |
| "container\*"     | Refers to all "docker container ..." commands |
| "image\*"         | Refers to all "docker image ..." commands |
| "volume\*"        | Refers to all "docker volume ..." commands |
| "network\*"       | Refers to all "docker network ..." commands |
| "build\*"         | Refers to all "docker build ..." commands |
| "system\*"        | Refers to all "docker system ..." commands |
@z

@x
For example, the following configuration blocks the `build` and `push` commands
on the Docker socket:
@y
For example, the following configuration blocks the `build` and `push` commands
on the Docker socket:
@z

@x
```json
"commandList": {
  "type": "deny",
  "commands": ["build", "push"]
}
```
@y
```json
"commandList": {
  "type": "deny",
  "commands": ["build", "push"]
}
```
@z

@x
Thus, if inside the container, you issue either of those commands on the
bind-mounted Docker socket, they will be blocked:
@y
Thus, if inside the container, you issue either of those commands on the
bind-mounted Docker socket, they will be blocked:
@z

@x
```console
/ # docker push myimage
Error response from daemon: enhanced container isolation: docker command "/v1.43/images/myimage/push?tag=latest" is blocked; if you wish to allow it, configure the docker socket command list in the Docker Desktop settings or admin-settings.
```
@y
```console
/ # docker push myimage
Error response from daemon: enhanced container isolation: docker command "/v1.43/images/myimage/push?tag=latest" is blocked; if you wish to allow it, configure the docker socket command list in the Docker Desktop settings or admin-settings.
```
@z

@x
Similarly:
@y
Similarly:
@z

@x
```console
/ # curl --unix-socket /var/run/docker.sock -XPOST http://localhost/v1.43/images/myimage/push?tag=latest
Error response from daemon: enhanced container isolation: docker command "/v1.43/images/myimage/push?tag=latest" is blocked; if you wish to allow it, configure the docker socket command list in the Docker Desktop settings or admin-settings.
```
@y
```console
/ # curl --unix-socket /var/run/docker.sock -XPOST http://localhost/v1.43/images/myimage/push?tag=latest
Error response from daemon: enhanced container isolation: docker command "/v1.43/images/myimage/push?tag=latest" is blocked; if you wish to allow it, configure the docker socket command list in the Docker Desktop settings or admin-settings.
```
@z

@x
Note that if the `commandList` had been configured as an "allow" list, then the
effect would be the opposite: only the listed commands would have been allowed.
Whether to configure the list as an allow or deny list depends on the use case.
@y
Note that if the `commandList` had been configured as an "allow" list, then the
effect would be the opposite: only the listed commands would have been allowed.
Whether to configure the list as an allow or deny list depends on the use case.
@z

@x
### Recommendations
@y
### Recommendations
@z

@x
* Be restrictive on the list of container images for which you allow bind-mounting
  of the Docker socket (i.e., the `imageList`). Generally, only allow this for
  images that are absolutely needed and that you trust.
@y
* Be restrictive on the list of container images for which you allow bind-mounting
  of the Docker socket (i.e., the `imageList`). Generally, only allow this for
  images that are absolutely needed and that you trust.
@z

@x
* Use the tag wildcard format if possible in the `imageList`
  (e.g., `<image_name>:*`), as this eliminates the need to update the
  `admin-settings.json` file due to image tag changes.
@y
* Use the tag wildcard format if possible in the `imageList`
  (e.g., `<image_name>:*`), as this eliminates the need to update the
  `admin-settings.json` file due to image tag changes.
@z

@x
* In the `commandList`, block commands that you don't expect the container to
  execute. For example, for local testing (e.g., Testcontainers), containers
  that bind-mount the Docker socket typically create / run / remove containers,
  volumes, and networks, but don't typically build images or push them into
  repositories (though some may legitimately do this). What commands to allow or
  block depends on the use case.
@y
* In the `commandList`, block commands that you don't expect the container to
  execute. For example, for local testing (e.g., Testcontainers), containers
  that bind-mount the Docker socket typically create / run / remove containers,
  volumes, and networks, but don't typically build images or push them into
  repositories (though some may legitimately do this). What commands to allow or
  block depends on the use case.
@z

@x
  - Note that all "docker" commands issued by the container via the bind-mounted
    Docker socket will also execute under enhanced container isolation (i.e.,
    the resulting container uses a the Linux user-namespace, sensitive system
    calls are vetted, etc.)
@y
  - Note that all "docker" commands issued by the container via the bind-mounted
    Docker socket will also execute under enhanced container isolation (i.e.,
    the resulting container uses a the Linux user-namespace, sensitive system
    calls are vetted, etc.)
@z

@x
### Caveats and limitations
@y
### Caveats and limitations
@z

@x
* When Docker Desktop is restarted, it's possible that an image that is allowed
  to mount the Docker socket is unexpectedly blocked from doing so. This can
  happen when the image digest changes in the remote repository (e.g., a
  ":latest" image was updated) and the local copy of that image (e.g., from a
  prior `docker pull`) no longer matches the digest in the remote repository. In
  this case, remove the local image and pull it again (e.g., `docker rm <image>`
  and `docker pull <image>`).
@y
* When Docker Desktop is restarted, it's possible that an image that is allowed
  to mount the Docker socket is unexpectedly blocked from doing so. This can
  happen when the image digest changes in the remote repository (e.g., a
  ":latest" image was updated) and the local copy of that image (e.g., from a
  prior `docker pull`) no longer matches the digest in the remote repository. In
  this case, remove the local image and pull it again (e.g., `docker rm <image>`
  and `docker pull <image>`).
@z

@x
* It's not possible to allow Docker socket bind-mounts on containers using
  local-only images (i.e., images that are not on a registry) unless they are
  [derived from an allowed image](#docker-socket-mount-permissions-for-derived-images)
  or you've [allowed all containers to mount the Docker socket](#allowing-all-containers-to-mount-the-docker-socket).
  That is because Docker Desktop pulls the digests for the allowed images from
  the registry, and then uses that to compare against the local copy of the
  image.
@y
* It's not possible to allow Docker socket bind-mounts on containers using
  local-only images (i.e., images that are not on a registry) unless they are
  [derived from an allowed image](#docker-socket-mount-permissions-for-derived-images)
  or you've [allowed all containers to mount the Docker socket](#allowing-all-containers-to-mount-the-docker-socket).
  That is because Docker Desktop pulls the digests for the allowed images from
  the registry, and then uses that to compare against the local copy of the
  image.
@z

@x
* The `commandList` configuration applies to all containers that are allowed to
  bind-mount the Docker socket. Therefore it can't be configured differently per
  container.
@y
* The `commandList` configuration applies to all containers that are allowed to
  bind-mount the Docker socket. Therefore it can't be configured differently per
  container.
@z

@x
* The following commands are not yet supported in the `commandList`:
@y
* The following commands are not yet supported in the `commandList`:
@z

@x
| Unsupported command  | Description |
| :------------------- | :---------- |
| `compose`              | Docker Compose |
| `dev`                  | Dev environments |
| `extension`            | Manages Docker Extensions |
| `feedback`             | Send feedback to Docker |
| `init`                 | Creates Docker-related starter files |
| `manifest`             | Manages Docker image manifests |
| `plugin`              | Manages plugins |
| `sbom`                 | View Software Bill of Materials (SBOM) |
| `scout`                | Docker Scout |
| `trust`                | Manage trust on Docker images |
@y
| Unsupported command  | Description |
| :------------------- | :---------- |
| `compose`              | Docker Compose |
| `dev`                  | Dev environments |
| `extension`            | Manages Docker Extensions |
| `feedback`             | Send feedback to Docker |
| `init`                 | Creates Docker-related starter files |
| `manifest`             | Manages Docker image manifests |
| `plugin`              | Manages plugins |
| `sbom`                 | View Software Bill of Materials (SBOM) |
| `scout`                | Docker Scout |
| `trust`                | Manage trust on Docker images |
@z

@x
> [!NOTE]
>
> Docker socket mount permissions do not apply when running "true"
> Docker-in-Docker (i.e., when running the Docker Engine inside a container). In
> this case there's no bind-mount of the host's Docker socket into the
> container, and therefore no risk of the container leveraging the configuration
> and credentials of the host's Docker Engine to perform malicious activity.
> Enhanced Container Isolation is capable of running Docker-in-Docker securely,
> without giving the outer container true root permissions in the Docker Desktop
> VM.
@y
> [!NOTE]
>
> Docker socket mount permissions do not apply when running "true"
> Docker-in-Docker (i.e., when running the Docker Engine inside a container). In
> this case there's no bind-mount of the host's Docker socket into the
> container, and therefore no risk of the container leveraging the configuration
> and credentials of the host's Docker Engine to perform malicious activity.
> Enhanced Container Isolation is capable of running Docker-in-Docker securely,
> without giving the outer container true root permissions in the Docker Desktop
> VM.
@z
