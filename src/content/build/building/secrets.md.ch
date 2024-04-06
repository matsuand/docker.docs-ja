%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build secrets
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens, ssh, git, auth, http
---
@y
---
title: Build secrets
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens, ssh, git, auth, http
---
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
to your build, because they persist in the final image. Instead, should use
secret mounts or SSH mounts, which expose secrets to your builds securely.
@y
Build arguments and environment variables are inappropriate for passing secrets
to your build, because they persist in the final image. Instead, should use
secret mounts or SSH mounts, which expose secrets to your builds securely.
@z

@x
## Secret mounts
@y
## Secret mounts
@z

@x
Secret mounts expose secrets to the build containers as files. You [mount the
secrets to the `RUN`
instructions](../../reference/dockerfile.md#run---mounttypesecret) that
need to access them, similar to how you would define a bind mount or cache
mount.
@y
Secret mounts expose secrets to the build containers as files. You [mount the
secrets to the `RUN`
instructions](../../reference/dockerfile.md#run---mounttypesecret) that
need to access them, similar to how you would define a bind mount or cache
mount.
@z

@x
```dockerfile
RUN --mount=type=secret,id=mytoken \
    TOKEN=$(cat /run/secrets/mytoken) ...
```
@y
```dockerfile
RUN --mount=type=secret,id=mytoken \
    TOKEN=$(cat /run/secrets/mytoken) ...
```
@z

@x
To pass a secret to a build, use the [`docker build --secret`
flag](../../reference/cli/docker/buildx/build.md#secret), or the
equivalent options for [Bake](../bake/reference.md#targetsecret).
@y
To pass a secret to a build, use the [`docker build --secret`
flag](../../reference/cli/docker/buildx/build.md#secret), or the
equivalent options for [Bake](../bake/reference.md#targetsecret).
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
```console
$ docker build --secret id=mytoken,src=$HOME/.aws/credentials .
```
@y
```console
$ docker build --secret id=mytoken,src=$HOME/.aws/credentials .
```
@z

@x
{{< /tab >}}
{{< tab name="Bake" >}}
@y
{{< /tab >}}
{{< tab name="Bake" >}}
@z

@x
```hcl
variable "HOME" {
  default = null
}
@y
```hcl
variable "HOME" {
  default = null
}
@z

@x
target "default" {
  secret = [
    "id=mytoken,src=${HOME}/.aws/credentials"
  ]
}
```
@y
target "default" {
  secret = [
    "id=mytoken,src=${HOME}/.aws/credentials"
  ]
}
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Sources
@y
### Sources
@z

@x
The source of a secret can be either a
[file](../../reference/cli/docker/buildx/build.md#file) or an
[environment variable](../../reference/cli/docker/buildx/build.md#env).
When you use the CLI or Bake, the type can be detected automatically. You can
also specify it explicitly with `type=file` or `type=env`.
@y
The source of a secret can be either a
[file](../../reference/cli/docker/buildx/build.md#file) or an
[environment variable](../../reference/cli/docker/buildx/build.md#env).
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

@x
```console
$ docker build --secret id=kube,env=KUBECONFIG .
```
@y
```console
$ docker build --secret id=kube,env=KUBECONFIG .
```
@z

@x
When you secrets from environment variables, you can omit the `id` parameter
to bind the secret to a file with the same name as the variable.
In the following example, the value of the `API_TOKEN` variable
is mounted to `/run/secrets/API_TOKEN` in the build container.
@y
When you secrets from environment variables, you can omit the `id` parameter
to bind the secret to a file with the same name as the variable.
In the following example, the value of the `API_TOKEN` variable
is mounted to `/run/secrets/API_TOKEN` in the build container.
@z

@x
```console
$ docker build --secret id=API_TOKEN .
```
@y
```console
$ docker build --secret id=API_TOKEN .
```
@z

@x
### Target
@y
### Target
@z

@x
By default, secrets are mounted to `/run/secrets/<id>`. You can customize the
mount point in the build container using the `target` option in the Dockerfile.
@y
By default, secrets are mounted to `/run/secrets/<id>`. You can customize the
mount point in the build container using the `target` option in the Dockerfile.
@z

@x
The following example mounts the secret to a `/root/.aws/credentials` file in
the build container.
@y
The following example mounts the secret to a `/root/.aws/credentials` file in
the build container.
@z

@x
```console
$ docker build --secret id=aws,src=/root/.aws/credentials .
```
@y
```console
$ docker build --secret id=aws,src=/root/.aws/credentials .
```
@z

@x
```dockerfile
RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
    aws s3 cp ...
```
@y
```dockerfile
RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
    aws s3 cp ...
```
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
SSH mount](../../reference/dockerfile.md#run---mounttypessh).
@y
The following example clones a private GitHub repository using a [Dockerfile
SSH mount](../../reference/dockerfile.md#run---mounttypessh).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD git@github.com:me/myprivaterepo.git /src/
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD git@github.com:me/myprivaterepo.git /src/
```
@z

@x
To pass an SSH socket the build, you use the [`docker build --ssh`
flag](../../reference/cli/docker/buildx/build.md#ssh), or equivalent
options for [Bake](../bake/reference.md#targetssh).
@y
To pass an SSH socket the build, you use the [`docker build --ssh`
flag](../../reference/cli/docker/buildx/build.md#ssh), or equivalent
options for [Bake](../bake/reference.md#targetssh).
@z

@x
```console
$ docker buildx build --ssh default .
```
@y
```console
$ docker buildx build --ssh default .
```
@z

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

@x
```console
$ docker build https://gitlab.com/example/todo-app.git
[+] Building 0.4s (1/1) FINISHED
 => ERROR [internal] load git source https://gitlab.com/dvdk/todo-app.git
------
 > [internal] load git source https://gitlab.com/dvdk/todo-app.git:
0.313 fatal: could not read Username for 'https://gitlab.com': terminal prompts disabled
------
```
@y
```console
$ docker build https://gitlab.com/example/todo-app.git
[+] Building 0.4s (1/1) FINISHED
 => ERROR [internal] load git source https://gitlab.com/dvdk/todo-app.git
------
 > [internal] load git source https://gitlab.com/dvdk/todo-app.git:
0.313 fatal: could not read Username for 'https://gitlab.com': terminal prompts disabled
------
```
@z

@x
To authenticate the builder to the Git server, set the `GIT_AUTH_TOKEN`
environment variable to contain a valid GitLab access token, and pass it as a
secret to the build:
@y
To authenticate the builder to the Git server, set the `GIT_AUTH_TOKEN`
environment variable to contain a valid GitLab access token, and pass it as a
secret to the build:
@z

@x
```console
$ GIT_AUTH_TOKEN=$(cat gitlab-token.txt) docker build \
  --secret id=GIT_AUTH_TOKEN \
  https://gitlab.com/example/todo-app.git
```
@y
```console
$ GIT_AUTH_TOKEN=$(cat gitlab-token.txt) docker build \
  --secret id=GIT_AUTH_TOKEN \
  https://gitlab.com/example/todo-app.git
```
@z

@x
The `GIT_AUTH_TOKEN` also works with `ADD` to fetch private Git repositories as
part of your build:
@y
The `GIT_AUTH_TOKEN` also works with `ADD` to fetch private Git repositories as
part of your build:
@z

@x
```dockerfile
FROM alpine
ADD https://gitlab.com/example/todo-app.git /src
```
@y
```dockerfile
FROM alpine
ADD https://gitlab.com/example/todo-app.git /src
```
@z

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

@x
```http
Authorization: Bearer <GIT_AUTH_TOKEN>
```
@y
```http
Authorization: Bearer <GIT_AUTH_TOKEN>
```
@z

@x
If you need to use a Basic scheme, with a username and password, you can set
the `GIT_AUTH_HEADER` build secret:
@y
If you need to use a Basic scheme, with a username and password, you can set
the `GIT_AUTH_HEADER` build secret:
@z

@x
```console
$ export GIT_AUTH_TOKEN=$(cat gitlab-token.txt)
$ export GIT_AUTH_HEADER=basic
$ docker build \
  --secret id=GIT_AUTH_TOKEN \
  --secret id=GIT_AUTH_HEADER \
  https://gitlab.com/example/todo-app.git
```
@y
```console
$ export GIT_AUTH_TOKEN=$(cat gitlab-token.txt)
$ export GIT_AUTH_HEADER=basic
$ docker build \
  --secret id=GIT_AUTH_TOKEN \
  --secret id=GIT_AUTH_HEADER \
  https://gitlab.com/example/todo-app.git
```
@z

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

@x
```console
$ export GITLAB_TOKEN=$(cat gitlab-token.txt)
$ export GERRIT_TOKEN=$(cat gerrit-username-password.txt)
$ export GERRIT_SCHEME=basic
$ docker build \
  --secret id=GIT_AUTH_TOKEN.gitlab.com,env=GITLAB_TOKEN \
  --secret id=GIT_AUTH_TOKEN.gerrit.internal.example,env=GERRIT_TOKEN \
  --secret id=GIT_AUTH_HEADER.gerrit.internal.example,env=GERRIT_SCHEME \
  https://gitlab.com/example/todo-app.git
```
@y
```console
$ export GITLAB_TOKEN=$(cat gitlab-token.txt)
$ export GERRIT_TOKEN=$(cat gerrit-username-password.txt)
$ export GERRIT_SCHEME=basic
$ docker build \
  --secret id=GIT_AUTH_TOKEN.gitlab.com,env=GITLAB_TOKEN \
  --secret id=GIT_AUTH_TOKEN.gerrit.internal.example,env=GERRIT_TOKEN \
  --secret id=GIT_AUTH_HEADER.gerrit.internal.example,env=GERRIT_SCHEME \
  https://gitlab.com/example/todo-app.git
```
@z
