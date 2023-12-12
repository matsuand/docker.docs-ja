%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build secrets
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens
---
@y
---
title: Build secrets
description: Manage credentials and other secrets securely
keywords: build, secrets, credentials, passwords, tokens
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
instructions](../../engine/reference/builder.md#run---mounttypesecret) that
need to access them, similar to how you would define a bind mount or cache
mount.
@y
Secret mounts expose secrets to the build containers as files. You [mount the
secrets to the `RUN`
instructions](../../engine/reference/builder.md#run---mounttypesecret) that
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
flag](../../engine/reference/commandline/buildx_build.md#secret), or the
equivalent options for [Bake](../bake/reference.md#targetsecret).
@y
To pass a secret to a build, use the [`docker build --secret`
flag](../../engine/reference/commandline/buildx_build.md#secret), or the
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
[file](../../engine/reference/commandline/buildx_build.md#file) or an
[environment variable](../../engine/reference/commandline/buildx_build.md#env).
When you use the CLI or Bake, the type can be detected automatically. You can
also specify it explicitly with `type=file` or `type=env`.
@y
The source of a secret can be either a
[file](../../engine/reference/commandline/buildx_build.md#file) or an
[environment variable](../../engine/reference/commandline/buildx_build.md#env).
When you use the CLI or Bake, the type can be detected automatically. You can
also specify it explicitly with `type=file` or `type=env`.
@z

@x
The following example mounts the environment variable `KUBECONFIG` to secret ID
`kube`.
@y
The following example mounts the environment variable `KUBECONFIG` to secret ID
`kube`.
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
The following example maps an environment variable directly to a secret ID.
@y
The following example maps an environment variable directly to a secret ID.
@z

@x
```console
$ docker build --secret env=KUBECONFIG .
```
@y
```console
$ docker build --secret env=KUBECONFIG .
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
SSH mount](../../engine/reference/builder.md#run---mounttypessh).
@y
The following example clones a private GitHub repository using a [Dockerfile
SSH mount](../../engine/reference/builder.md#run---mounttypessh).
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
flag](../../engine/reference/commandline/buildx_build.md#ssh), or equivalent
options for [Bake](../bake/reference.md#targetssh).
@y
To pass an SSH socket the build, you use the [`docker build --ssh`
flag](../../engine/reference/commandline/buildx_build.md#ssh), or equivalent
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
