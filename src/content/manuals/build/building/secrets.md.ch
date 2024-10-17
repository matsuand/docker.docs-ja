%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Build secrets
linkTitle: Secrets
@y
title: Build secrets
linkTitle: Secrets
@z

@x
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens, ssh, git, auth, http
@y
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens, ssh, git, auth, http
@z

@x
A build secret is any piece of sensitive information, such as a password or API
token, consumed as part of your application's build process.
@y
A build secret is any piece of sensitive information, such as a password or API
token, consumed as part of your application's build process.
@z

@x
Build arguments and environment variables are inappropriate for passing secrets
to your build, because they persist in the final image. Instead, you should use
secret mounts or SSH mounts, which expose secrets to your builds securely.
@y
Build arguments and environment variables are inappropriate for passing secrets
to your build, because they persist in the final image. Instead, you should use
secret mounts or SSH mounts, which expose secrets to your builds securely.
@z

@x
## Types of build secrets
@y
## Types of build secrets
@z

@x
- [Secret mounts](#secret-mounts) are general-purpose mounts for passing
  secrets into your build. A secret mount takes a secret from the build client
  and makes it temporarily available inside the build container, for the
  duration of the build instruction. This is useful if, for example, your build
  needs to communicate with a private artifact server or API.
- [SSH mounts](#ssh-mounts) are special-purpose mounts for making SSH sockets
  or keys available inside builds. They're commonly used when you need to fetch
  private Git repositories in your builds.
- [Git authentication for remote contexts](#git-authentication-for-remote-contexts)
  is a set of pre-defined secrets for when you build with a remote Git context
  that's also a private repository. These secrets are "pre-flight" secrets:
  they are not consumed within your build instruction, but they're used to
  provide the builder with the necessary credentials to fetch the context.
@y
- [Secret mounts](#secret-mounts) are general-purpose mounts for passing
  secrets into your build. A secret mount takes a secret from the build client
  and makes it temporarily available inside the build container, for the
  duration of the build instruction. This is useful if, for example, your build
  needs to communicate with a private artifact server or API.
- [SSH mounts](#ssh-mounts) are special-purpose mounts for making SSH sockets
  or keys available inside builds. They're commonly used when you need to fetch
  private Git repositories in your builds.
- [Git authentication for remote contexts](#git-authentication-for-remote-contexts)
  is a set of pre-defined secrets for when you build with a remote Git context
  that's also a private repository. These secrets are "pre-flight" secrets:
  they are not consumed within your build instruction, but they're used to
  provide the builder with the necessary credentials to fetch the context.
@z

@x
## Using build secrets
@y
## Using build secrets
@z

@x
For secret mounts and SSH mounts, using build secrets is a two-step process.
First you need to pass the secret into the `docker build` command, and then you
need to consume the secret in your Dockerfile.
@y
For secret mounts and SSH mounts, using build secrets is a two-step process.
First you need to pass the secret into the `docker build` command, and then you
need to consume the secret in your Dockerfile.
@z

@x
To pass a secret to a build, use the [`docker build --secret`
flag](/reference/cli/docker/buildx/build.md#secret), or the
equivalent options for [Bake](../bake/reference.md#targetsecret).
@y
To pass a secret to a build, use the [`docker build --secret`
flag](reference/cli/docker/buildx/build.md#secret), or the
equivalent options for [Bake](../bake/reference.md#targetsecret).
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Bake" >}}
@y
{{< /tab >}}
{{< tab name="Bake" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
To consume a secret in a build and make it accessible to the `RUN` instruction,
use the [`--mount=type=secret`](/reference/dockerfile.md#run---mounttypesecret)
flag in the Dockerfile.
@y
To consume a secret in a build and make it accessible to the `RUN` instruction,
use the [`--mount=type=secret`](reference/dockerfile.md#run---mounttypesecret)
flag in the Dockerfile.
@z

% snip code...

@x
## Secret mounts
@y
## Secret mounts
@z

@x
Secret mounts expose secrets to the build containers, as files or environment
variables. You can use secret mounts to pass sensitive information to your
builds, such as API tokens, passwords, or SSH keys.
@y
Secret mounts expose secrets to the build containers, as files or environment
variables. You can use secret mounts to pass sensitive information to your
builds, such as API tokens, passwords, or SSH keys.
@z

@x
### Sources
@y
### Sources
@z

@x
The source of a secret can be either a
[file](/reference/cli/docker/buildx/build.md#file) or an
[environment variable](/reference/cli/docker/buildx/build.md#env).
When you use the CLI or Bake, the type can be detected automatically. You can
also specify it explicitly with `type=file` or `type=env`.
@y
The source of a secret can be either a
[file](reference/cli/docker/buildx/build.md#file) or an
[environment variable](reference/cli/docker/buildx/build.md#env).
When you use the CLI or Bake, the type can be detected automatically. You can
also specify it explicitly with `type=file` or `type=env`.
@z

@x
The following example mounts the environment variable `KUBECONFIG` to secret ID `kube`,
as a file in the build container at `/run/secrets/kube`.
@y
The following example mounts the environment variable `KUBECONFIG` to secret ID `kube`,
as a file in the build container at `/run/secrets/kube`.
@z

% snip command...

@x
When you use secrets from environment variables, you can omit the `env` parameter
to bind the secret to a file with the same name as the variable.
In the following example, the value of the `API_TOKEN` variable
is mounted to `/run/secrets/API_TOKEN` in the build container.
@y
When you use secrets from environment variables, you can omit the `env` parameter
to bind the secret to a file with the same name as the variable.
In the following example, the value of the `API_TOKEN` variable
is mounted to `/run/secrets/API_TOKEN` in the build container.
@z

% snip command...

@x
### Target
@y
### Target
@z

@x
When consuming a secret in a Dockerfile, the secret is mounted to a file by
default. The default file path of the secret, inside the build container, is
`/run/secrets/<id>`. You can customize how the secrets get mounted in the build
container using the `target` and `env` options for the `RUN --mount` flag in
the Dockerfile.
@y
When consuming a secret in a Dockerfile, the secret is mounted to a file by
default. The default file path of the secret, inside the build container, is
`/run/secrets/<id>`. You can customize how the secrets get mounted in the build
container using the `target` and `env` options for the `RUN --mount` flag in
the Dockerfile.
@z

@x
The following example takes secret id `aws` and mounts it to a file at
`/run/secrets/aws` in the build container.
@y
The following example takes secret id `aws` and mounts it to a file at
`/run/secrets/aws` in the build container.
@z

% snip code...

@x
To mount a secret as a file with a different name, use the `target` option in
the `--mount` flag.
@y
To mount a secret as a file with a different name, use the `target` option in
the `--mount` flag.
@z

% snip code...

@x
To mount a secret as an environment variable instead of a file, use the
`env` option in the `--mount` flag.
@y
To mount a secret as an environment variable instead of a file, use the
`env` option in the `--mount` flag.
@z

% snip code...

@x
It's possible to use the `target` and `env` options together to mount a secret
as both a file and an environment variable.
@y
It's possible to use the `target` and `env` options together to mount a secret
as both a file and an environment variable.
@z

@x
## SSH mounts
@y
## SSH mounts
@z

@x
If the credential you want to use in your build is an SSH agent socket or key,
you can use the SSH mount instead of a secret mount. Cloning private Git
repositories is a common use case for SSH mounts.
@y
If the credential you want to use in your build is an SSH agent socket or key,
you can use the SSH mount instead of a secret mount. Cloning private Git
repositories is a common use case for SSH mounts.
@z

@x
The following example clones a private GitHub repository using a [Dockerfile
SSH mount](/reference/dockerfile.md#run---mounttypessh).
@y
The following example clones a private GitHub repository using a [Dockerfile
SSH mount](reference/dockerfile.md#run---mounttypessh).
@z

% snip code...

@x
To pass an SSH socket the build, you use the [`docker build --ssh`
flag](/reference/cli/docker/buildx/build.md#ssh), or equivalent
options for [Bake](../bake/reference.md#targetssh).
@y
To pass an SSH socket the build, you use the [`docker build --ssh`
flag](reference/cli/docker/buildx/build.md#ssh), or equivalent
options for [Bake](../bake/reference.md#targetssh).
@z

% snip command...

@x
## Git authentication for remote contexts
@y
## Git authentication for remote contexts
@z

@x
BuildKit supports two pre-defined build secrets, `GIT_AUTH_TOKEN` and
`GIT_AUTH_HEADER`. Use them to specify HTTP authentication parameters when
building with remote, private Git repositories, including:
@y
BuildKit supports two pre-defined build secrets, `GIT_AUTH_TOKEN` and
`GIT_AUTH_HEADER`. Use them to specify HTTP authentication parameters when
building with remote, private Git repositories, including:
@z

@x
- Building with a private Git repository as build context
- Fetching private Git repositories in a build with `ADD`
@y
- Building with a private Git repository as build context
- Fetching private Git repositories in a build with `ADD`
@z

@x
For example, say you have a private GitLab project at
`https://gitlab.com/example/todo-app.git`, and you want to run a build using
that repository as the build context. An unauthenticated `docker build` command
fails because the builder isn't authorized to pull the repository:
@y
For example, say you have a private GitLab project at
`https://gitlab.com/example/todo-app.git`, and you want to run a build using
that repository as the build context. An unauthenticated `docker build` command
fails because the builder isn't authorized to pull the repository:
@z

% snip command...

@x
To authenticate the builder to the Git server, set the `GIT_AUTH_TOKEN`
environment variable to contain a valid GitLab access token, and pass it as a
secret to the build:
@y
To authenticate the builder to the Git server, set the `GIT_AUTH_TOKEN`
environment variable to contain a valid GitLab access token, and pass it as a
secret to the build:
@z

% snip command...

@x
The `GIT_AUTH_TOKEN` also works with `ADD` to fetch private Git repositories as
part of your build:
@y
The `GIT_AUTH_TOKEN` also works with `ADD` to fetch private Git repositories as
part of your build:
@z

% snip code...

@x
### HTTP authentication scheme
@y
### HTTP authentication scheme
@z

@x
By default, Git authentication over HTTP uses the Bearer authentication scheme:
@y
By default, Git authentication over HTTP uses the Bearer authentication scheme:
@z

% snip code...

@x
If you need to use a Basic scheme, with a username and password, you can set
the `GIT_AUTH_HEADER` build secret:
@y
If you need to use a Basic scheme, with a username and password, you can set
the `GIT_AUTH_HEADER` build secret:
@z

% snip command...

@x
BuildKit currently only supports the Bearer and Basic schemes.
@y
BuildKit currently only supports the Bearer and Basic schemes.
@z

@x
### Multiple hosts
@y
### Multiple hosts
@z

@x
You can set the `GIT_AUTH_TOKEN` and `GIT_AUTH_HEADER` secrets on a per-host
basis, which lets you use different authentication parameters for different
hostnames. To specify a hostname, append the hostname as a suffix to the secret
ID:
@y
You can set the `GIT_AUTH_TOKEN` and `GIT_AUTH_HEADER` secrets on a per-host
basis, which lets you use different authentication parameters for different
hostnames. To specify a hostname, append the hostname as a suffix to the secret
ID:
@z

% snip command...
