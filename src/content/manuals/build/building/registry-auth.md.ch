%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Registry authentication
description: Select registry credentials by repository and scope for builds
keywords: build, buildx, registry, authentication, credentials, login, scope
@y
title: Registry authentication
description: Select registry credentials by repository and scope for builds
keywords: build, buildx, registry, authentication, credentials, login, scope
@z

@x
Buildx uses Docker's credential configuration to authenticate when pulling
images for a build and pushing build results. Sign in to the registry before
building:
@y
Buildx uses Docker's credential configuration to authenticate when pulling
images for a build and pushing build results. Sign in to the registry before
building:
@z

@x
```console
$ docker login registry.example.com
```
@y
```console
$ docker login registry.example.com
```
@z

@x
See the [`docker login` reference](/reference/cli/docker/login/) for credential
stores and authentication methods.
@y
See the [`docker login` reference](__SUBDIR__/reference/cli/docker/login/) for credential
stores and authentication methods.
@z

@x
## Select credentials by repository and scope
@y
## Select credentials by repository and scope
@z

@x
Buildx can load separate Docker credential configurations for specific
registry repositories and token scopes. Use this when a build needs different
credentials for repositories on the same registry, or for pull and push
requests.
@y
Buildx can load separate Docker credential configurations for specific
registry repositories and token scopes. Use this when a build needs different
credentials for repositories on the same registry, or for pull and push
requests.
@z

@x
Store each Docker `config.json` in a directory under
`$BUILDX_CONFIG/config/<registry>[/<repository>][@<scope>[,<scope>...]]`.
If `BUILDX_CONFIG` isn't set, use the
[config directory lookup order](./variables.md#buildx_config). Repository
paths must match the full repository name. Scopes are registry token actions,
such as `pull` and `push`.
@y
Store each Docker `config.json` in a directory under
`$BUILDX_CONFIG/config/<registry>[/<repository>][@<scope>[,<scope>...]]`.
If `BUILDX_CONFIG` isn't set, use the
[config directory lookup order](./variables.md#buildx_config). Repository
paths must match the full repository name. Scopes are registry token actions,
such as `pull` and `push`.
@z

@x
For example, the default config directory can contain:
@y
For example, the default config directory can contain:
@z

@x
```text
~/.docker/buildx/config/
└── registry.example.com/
    └── team/
        ├── app@pull/
        │   └── config.json
        └── app@pull,push/
            └── config.json
```
@y
```text
~/.docker/buildx/config/
└── registry.example.com/
    └── team/
        ├── app@pull/
        │   └── config.json
        └── app@pull,push/
            └── config.json
```
@z

@x
Populate these files with Docker credential configurations. For example, use
the Docker CLI's `--config` flag to store credentials in the pull config
directory:
@y
Populate these files with Docker credential configurations. For example, use
the Docker CLI's `--config` flag to store credentials in the pull config
directory:
@z

@x
```console
$ docker --config \
    ~/.docker/buildx/config/registry.example.com/team/app@pull \
    login registry.example.com
```
@y
```console
$ docker --config \
    ~/.docker/buildx/config/registry.example.com/team/app@pull \
    login registry.example.com
```
@z

@x
Use a different config directory and credentials for the combined `pull,push`
scope. Buildx prefers repository-specific matches over registry-wide matches,
then prefers the match with more scope actions. Every action in a config's
directory suffix must be present in the requested scope.
@y
Use a different config directory and credentials for the combined `pull,push`
scope. Buildx prefers repository-specific matches over registry-wide matches,
then prefers the match with more scope actions. Every action in a config's
directory suffix must be present in the requested scope.
@z

@x
If no alternative matches, Buildx uses the normal Docker credential config.
Alternative matching applies when authentication requests contain a single
repository scope; requests involving multiple repositories use the normal
config.
@y
If no alternative matches, Buildx uses the normal Docker credential config.
Alternative matching applies when authentication requests contain a single
repository scope; requests involving multiple repositories use the normal
config.
@z

@x
This is a Buildx-specific compatibility mechanism. Docker commands don't
automatically select these configs by repository or scope. The `--config`
example only chooses where `docker login` stores credentials.
@y
This is a Buildx-specific compatibility mechanism. Docker commands don't
automatically select these configs by repository or scope. The `--config`
example only chooses where `docker login` stores credentials.
@z
