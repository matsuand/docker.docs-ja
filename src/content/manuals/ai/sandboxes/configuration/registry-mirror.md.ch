%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure a registry mirror
linkTitle: Registry mirror
description: Route Docker Hub template, kit, and in-sandbox Docker image pulls through an organization's registry mirror.
keywords: docker sandboxes, sbx, registry mirror, docker hub, templates, kits, image pulls
@y
title: Configure a registry mirror
linkTitle: Registry mirror
description: Route Docker Hub template, kit, and in-sandbox Docker image pulls through an organization's registry mirror.
keywords: docker sandboxes, sbx, registry mirror, docker hub, templates, kits, image pulls
@z

@x
{{% include "sandboxes-local-scope.md" %}}
@y
{{% include "sandboxes-local-scope.md" %}}
@z

@x
A registry mirror routes Docker Hub pulls for sandbox templates and OCI kits
through your organization's registry infrastructure. If the mirror meets
Docker Engine's requirements, Docker inside the sandbox uses it too.
@y
A registry mirror routes Docker Hub pulls for sandbox templates and OCI kits
through your organization's registry infrastructure. If the mirror meets
Docker Engine's requirements, Docker inside the sandbox uses it too.
@z

@x
## Configure the mirror
@y
## Configure the mirror
@z

@x
Set [`platform.images.registryMirror`](settings.md#platformimagesregistrymirror)
to the mirror host. Include a port when needed, but omit the URL scheme:
@y
Set [`platform.images.registryMirror`](settings.md#platformimagesregistrymirror)
to the mirror host. Include a port when needed, but omit the URL scheme:
@z

@x
```console
$ sbx settings set platform.images.registryMirror registry.example.com
```
@y
```console
$ sbx settings set platform.images.registryMirror registry.example.com
```
@z

@x
You can include a path prefix for registries that store mirrored Docker Hub
content below a repository path:
@y
You can include a path prefix for registries that store mirrored Docker Hub
content below a repository path:
@z

@x
```console
$ sbx settings set platform.images.registryMirror registry.example.com/docker-remote
```
@y
```console
$ sbx settings set platform.images.registryMirror registry.example.com/docker-remote
```
@z

@x
Docker Sandboxes redirects image references that resolve to Docker Hub and
preserves their repository path, tag, and digest. References that explicitly
name another registry remain unchanged.
@y
Docker Sandboxes redirects image references that resolve to Docker Hub and
preserves their repository path, tag, and digest. References that explicitly
name another registry remain unchanged.
@z

@x
If the mirror requires authentication, configure
[registry credentials](credentials.md#registry-credentials) for the mirror
host.
@y
If the mirror requires authentication, configure
[registry credentials](credentials.md#registry-credentials) for the mirror
host.
@z

@x
## Mirror Docker pulls inside the sandbox
@y
## Mirror Docker pulls inside the sandbox
@z

@x
Docker Sandboxes configures Docker Engine inside a sandbox to use the same
mirror when the setting contains a non-loopback host without a path prefix.
@y
Docker Sandboxes configures Docker Engine inside a sandbox to use the same
mirror when the setting contains a non-loopback host without a path prefix.
@z

@x
| Mirror setting                         | Template and OCI kit pulls | Docker pulls inside the sandbox |
| -------------------------------------- | -------------------------- | ------------------------------- |
| `registry.example.com`                 | Mirrored                   | Mirrored                        |
| `registry.example.com:5000`            | Mirrored                   | Mirrored                        |
| `registry.example.com/docker-remote`   | Mirrored                   | Not mirrored                    |
| `localhost:5000` or `127.0.0.1`        | Mirrored                   | Not mirrored                    |
@y
| Mirror setting                         | Template and OCI kit pulls | Docker pulls inside the sandbox |
| -------------------------------------- | -------------------------- | ------------------------------- |
| `registry.example.com`                 | Mirrored                   | Mirrored                        |
| `registry.example.com:5000`            | Mirrored                   | Mirrored                        |
| `registry.example.com/docker-remote`   | Mirrored                   | Not mirrored                    |
| `localhost:5000` or `127.0.0.1`        | Mirrored                   | Not mirrored                    |
@z

@x
Loopback addresses refer to the sandbox itself from inside its network
namespace, so Docker Sandboxes doesn't add them to the sandbox's Docker Engine
configuration. A path prefix is also excluded because Docker Engine interprets
mirror URL paths differently from image repository prefixes.
@y
Loopback addresses refer to the sandbox itself from inside its network
namespace, so Docker Sandboxes doesn't add them to the sandbox's Docker Engine
configuration. A path prefix is also excluded because Docker Engine interprets
mirror URL paths differently from image repository prefixes.
@z

@x
Docker Engine connects to the mirror over HTTPS, so the sandbox must trust the
certificate that the mirror presents. For a mirror that uses an internal
certificate authority, add the CA to the sandbox's system trust store. See
[Install an internal CA certificate](../customize/kits-v2.md#install-an-internal-ca-certificate).
@y
Docker Engine connects to the mirror over HTTPS, so the sandbox must trust the
certificate that the mirror presents. For a mirror that uses an internal
certificate authority, add the CA to the sandbox's system trust store. See
[Install an internal CA certificate](../customize/kits-v2.md#install-an-internal-ca-certificate).
@z

@x
Template and kit pulls use the changed setting immediately. Existing sandboxes
retain the Docker Engine mirror configuration with which they were created.
Recreate a sandbox to apply a changed mirror to Docker inside it.
@y
Template and kit pulls use the changed setting immediately. Existing sandboxes
retain the Docker Engine mirror configuration with which they were created.
Recreate a sandbox to apply a changed mirror to Docker inside it.
@z

@x
## Disable the mirror
@y
## Disable the mirror
@z

@x
Unset the setting to disable mirroring:
@y
Unset the setting to disable mirroring:
@z

@x
```console
$ sbx settings unset platform.images.registryMirror
```
@y
```console
$ sbx settings unset platform.images.registryMirror
```
@z

@x
An empty setting value also disables mirroring. Recreate existing sandboxes to
remove a mirror from their Docker Engine configuration.
@y
An empty setting value also disables mirroring. Recreate existing sandboxes to
remove a mirror from their Docker Engine configuration.
@z
