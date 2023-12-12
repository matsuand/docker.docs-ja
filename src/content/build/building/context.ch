%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build context
description: Learn how to use the build context to access files from your Dockerfile
keywords: build, buildx, buildkit, context, git, tarball, stdin
---
@y
---
title: Build context
description: Learn how to use the build context to access files from your Dockerfile
keywords: build, buildx, buildkit, context, git, tarball, stdin
---
@z

@x
The `docker build` and `docker buildx build` commands build Docker images from
a [Dockerfile](../../engine/reference/builder.md) and a context.
@y
The `docker build` and `docker buildx build` commands build Docker images from
a [Dockerfile](../../engine/reference/builder.md) and a context.
@z

@x
## What is a build context?
@y
## What is a build context?
@z

@x
The build context is the set of files that your build can access.
The positional argument that you pass to the build command specifies the
context that you want to use for the build:
@y
The build context is the set of files that your build can access.
The positional argument that you pass to the build command specifies the
context that you want to use for the build:
@z

@x
```console
$ docker build [OPTIONS] PATH | URL | -
                         ^^^^^^^^^^^^^^
```
@y
```console
$ docker build [OPTIONS] PATH | URL | -
                         ^^^^^^^^^^^^^^
```
@z

@x
You can pass any of the following inputs as the context for a build:
@y
You can pass any of the following inputs as the context for a build:
@z

@x
- The relative or absolute path to a local directory
- A remote URL of a Git repository, tarball, or plain-text file
- A plain-text file or tarball piped to the `docker build` command through standard input
@y
- The relative or absolute path to a local directory
- A remote URL of a Git repository, tarball, or plain-text file
- A plain-text file or tarball piped to the `docker build` command through standard input
@z

@x
### Filesystem contexts
@y
### Filesystem contexts
@z

@x
When your build context is a local directory, a remote Git repository, or a tar
file, then that becomes the set of files that the builder can access during the
build. Build instructions such as `COPY` and `ADD` can refer to any of the
files and directories in the context.
@y
When your build context is a local directory, a remote Git repository, or a tar
file, then that becomes the set of files that the builder can access during the
build. Build instructions such as `COPY` and `ADD` can refer to any of the
files and directories in the context.
@z

@x
A filesystem build context is processed recursively:
@y
A filesystem build context is processed recursively:
@z

@x
- When you specify a local directory or a tarball, all subdirectories are included
- When you specify a remote Git repository, the repository and all submodules are included
@y
- When you specify a local directory or a tarball, all subdirectories are included
- When you specify a remote Git repository, the repository and all submodules are included
@z

@x
For more information about the different types of filesystem contexts that you
can use with your builds, see:
@y
For more information about the different types of filesystem contexts that you
can use with your builds, see:
@z

@x
- [Local files](#local-context)
- [Git repositories](#git-repositories)
- [Remote tarballs](#remote-tarballs)
@y
- [Local files](#local-context)
- [Git repositories](#git-repositories)
- [Remote tarballs](#remote-tarballs)
@z

@x
### Text file contexts
@y
### Text file contexts
@z

@x
When your build context is a plain-text file, the builder interprets the file
as a Dockerfile. With this approach, the build doesn't use a filesystem context.
@y
When your build context is a plain-text file, the builder interprets the file
as a Dockerfile. With this approach, the build doesn't use a filesystem context.
@z

@x
For more information, see [empty build context](#empty-context).
@y
For more information, see [empty build context](#empty-context).
@z

@x
## Local context
@y
## Local context
@z

@x
To use a local build context, you can specify a relative or absolute filepath
to the `docker build` command. The following example shows a build command that
uses the current directory (`.`) as a build context:
@y
To use a local build context, you can specify a relative or absolute filepath
to the `docker build` command. The following example shows a build command that
uses the current directory (`.`) as a build context:
@z

@x
```console
$ docker build .
...
#16 [internal] load build context
#16 sha256:23ca2f94460dcbaf5b3c3edbaaa933281a4e0ea3d92fe295193e4df44dc68f85
#16 transferring context: 13.16MB 2.2s done
...
```
@y
```console
$ docker build .
...
#16 [internal] load build context
#16 sha256:23ca2f94460dcbaf5b3c3edbaaa933281a4e0ea3d92fe295193e4df44dc68f85
#16 transferring context: 13.16MB 2.2s done
...
```
@z

@x
This makes files and directories in the current working directory available to
the builder. The builder loads the files it needs from the build context when
needed.
@y
This makes files and directories in the current working directory available to
the builder. The builder loads the files it needs from the build context when
needed.
@z

@x
You can also use local tarballs as build context, by piping the tarball
contents to the `docker build` command. See [Tarballs](#local-tarballs).
@y
You can also use local tarballs as build context, by piping the tarball
contents to the `docker build` command. See [Tarballs](#local-tarballs).
@z

@x
### Local directories
@y
### Local directories
@z

@x
Consider the following directory structure:
@y
Consider the following directory structure:
@z

@x
```text
.
├── index.ts
├── src/
├── Dockerfile
├── package.json
└── package-lock.json
```
@y
```text
.
├── index.ts
├── src/
├── Dockerfile
├── package.json
└── package-lock.json
```
@z

@x
Dockerfile instructions can reference and include these files in the build if
you pass this directory as a context.
@y
Dockerfile instructions can reference and include these files in the build if
you pass this directory as a context.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node:latest
WORKDIR /src
COPY package.json package-lock.json .
RUN npm ci
COPY index.ts src .
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node:latest
WORKDIR /src
COPY package.json package-lock.json .
RUN npm ci
COPY index.ts src .
```
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
### Local context with Dockerfile from stdin
@y
### Local context with Dockerfile from stdin
@z

@x
Use the following syntax to build an image using files on your local
filesystem, while using a Dockerfile from stdin.
@y
Use the following syntax to build an image using files on your local
filesystem, while using a Dockerfile from stdin.
@z

@x
```console
$ docker build -f- <PATH>
```
@y
```console
$ docker build -f- <PATH>
```
@z

@x
The syntax uses the -f (or --file) option to specify the Dockerfile to use, and
it uses a hyphen (-) as filename to instruct Docker to read the Dockerfile from
stdin.
@y
The syntax uses the -f (or --file) option to specify the Dockerfile to use, and
it uses a hyphen (-) as filename to instruct Docker to read the Dockerfile from
stdin.
@z

@x
The following example uses the current directory (.) as the build context, and
builds an image using a Dockerfile passed through stdin using a here-document.
@y
The following example uses the current directory (.) as the build context, and
builds an image using a Dockerfile passed through stdin using a here-document.
@z

@x
```bash
# create a directory to work in
mkdir example
cd example
@y
```bash
# create a directory to work in
mkdir example
cd example
@z

@x
# create an example file
touch somefile.txt
@y
# create an example file
touch somefile.txt
@z

@x
# build an image using the current directory as context
# and a Dockerfile passed through stdin
docker build -t myimage:latest -f- . <<EOF
FROM busybox
COPY somefile.txt ./
RUN cat /somefile.txt
EOF
```
@y
# build an image using the current directory as context
# and a Dockerfile passed through stdin
docker build -t myimage:latest -f- . <<EOF
FROM busybox
COPY somefile.txt ./
RUN cat /somefile.txt
EOF
```
@z

@x
### Local tarballs
@y
### Local tarballs
@z

@x
When you pipe a tarball to the build command, the build uses the contents of
the tarball as a filesystem context.
@y
When you pipe a tarball to the build command, the build uses the contents of
the tarball as a filesystem context.
@z

@x
For example, given the following project directory:
@y
For example, given the following project directory:
@z

@x
```text
.
├── Dockerfile
├── Makefile
├── README.md
├── main.c
├── scripts
├── src
└── test.Dockerfile
```
@y
```text
.
├── Dockerfile
├── Makefile
├── README.md
├── main.c
├── scripts
├── src
└── test.Dockerfile
```
@z

@x
You can create a tarball of the directory and pipe it to the build for use as
a context:
@y
You can create a tarball of the directory and pipe it to the build for use as
a context:
@z

@x
```console
$ tar czf foo.tar.gz *
$ docker build - < foo.tar.gz
```
@y
```console
$ tar czf foo.tar.gz *
$ docker build - < foo.tar.gz
```
@z

@x
The build resolves the Dockerfile from the tarball context. You can use the
`--file` flag to specify the name and location of the Dockerfile relative to
the root of the tarball. The following command builds using `test.Dockerfile`
in the tarball:
@y
The build resolves the Dockerfile from the tarball context. You can use the
`--file` flag to specify the name and location of the Dockerfile relative to
the root of the tarball. The following command builds using `test.Dockerfile`
in the tarball:
@z

@x
```console
$ docker build --file test.Dockerfile - < foo.tar.gz
```
@y
```console
$ docker build --file test.Dockerfile - < foo.tar.gz
```
@z

@x
## Remote context
@y
## Remote context
@z

@x
You can specify the address of a remote Git repository, tarball, or plain-text
file as your build context.
@y
You can specify the address of a remote Git repository, tarball, or plain-text
file as your build context.
@z

@x
- For Git repositories, the builder automatically clones the repository. See
  [Git repositories](#git-repositories).
- For tarballs, the builder downloads and extracts the contents of the tarball.
  See [Tarballs](#remote-tarballs).
@y
- For Git repositories, the builder automatically clones the repository. See
  [Git repositories](#git-repositories).
- For tarballs, the builder downloads and extracts the contents of the tarball.
  See [Tarballs](#remote-tarballs).
@z

@x
If the remote tarball is a text file, the builder receives no [filesystem
context](#filesystem-contexts), and instead assumes that the remote
file is a Dockerfile. See [Empty build context](#empty-context).
@y
If the remote tarball is a text file, the builder receives no [filesystem
context](#filesystem-contexts), and instead assumes that the remote
file is a Dockerfile. See [Empty build context](#empty-context).
@z

@x
### Git repositories
@y
### Git repositories
@z

@x
When you pass a URL pointing to the location of a Git repository as an argument
to `docker build`, the builder uses the repository as the build context.
@y
When you pass a URL pointing to the location of a Git repository as an argument
to `docker build`, the builder uses the repository as the build context.
@z

@x
The builder performs a shallow clone of the repository, downloading only
the HEAD commit, not the entire history.
@y
The builder performs a shallow clone of the repository, downloading only
the HEAD commit, not the entire history.
@z

@x
The builder recursively clones the repository and any submodules it contains.
@y
The builder recursively clones the repository and any submodules it contains.
@z

@x
```console
$ docker build https://github.com/user/myrepo.git
```
@y
```console
$ docker build https://github.com/user/myrepo.git
```
@z

@x
By default, the builder clones the latest commit on the default branch of the
repository that you specify.
@y
By default, the builder clones the latest commit on the default branch of the
repository that you specify.
@z

@x
#### URL fragments
@y
#### URL fragments
@z

@x
You can append URL fragments to the Git repository address to make the builder
clone a specific branch, tag, and subdirectory of a repository.
@y
You can append URL fragments to the Git repository address to make the builder
clone a specific branch, tag, and subdirectory of a repository.
@z

@x
The format of the URL fragment is `#ref:dir`, where:
@y
The format of the URL fragment is `#ref:dir`, where:
@z

@x
- `ref` is the name of the branch, tag, or remote reference
- `dir` is a subdirectory inside the repository
@y
- `ref` is the name of the branch, tag, or remote reference
- `dir` is a subdirectory inside the repository
@z

@x
For example, the following command uses the `container` branch,
and the `docker` subdirectory in that branch, as the build context:
@y
For example, the following command uses the `container` branch,
and the `docker` subdirectory in that branch, as the build context:
@z

@x
```console
$ docker build https://github.com/user/myrepo.git#container:docker
```
@y
```console
$ docker build https://github.com/user/myrepo.git#container:docker
```
@z

@x
The following table represents all the valid suffixes with their build
contexts:
@y
The following table represents all the valid suffixes with their build
contexts:
@z

@x
| Build Syntax Suffix            | Commit Used                   | Build Context Used |
| ------------------------------ | ----------------------------- | ------------------ |
| `myrepo.git`                   | `refs/heads/<default branch>` | `/`                |
| `myrepo.git#mytag`             | `refs/tags/mytag`             | `/`                |
| `myrepo.git#mybranch`          | `refs/heads/mybranch`         | `/`                |
| `myrepo.git#pull/42/head`      | `refs/pull/42/head`           | `/`                |
| `myrepo.git#:myfolder`         | `refs/heads/<default branch>` | `/myfolder`        |
| `myrepo.git#master:myfolder`   | `refs/heads/master`           | `/myfolder`        |
| `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`             | `/myfolder`        |
| `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch`         | `/myfolder`        |
@y
| Build Syntax Suffix            | Commit Used                   | Build Context Used |
| ------------------------------ | ----------------------------- | ------------------ |
| `myrepo.git`                   | `refs/heads/<default branch>` | `/`                |
| `myrepo.git#mytag`             | `refs/tags/mytag`             | `/`                |
| `myrepo.git#mybranch`          | `refs/heads/mybranch`         | `/`                |
| `myrepo.git#pull/42/head`      | `refs/pull/42/head`           | `/`                |
| `myrepo.git#:myfolder`         | `refs/heads/<default branch>` | `/myfolder`        |
| `myrepo.git#master:myfolder`   | `refs/heads/master`           | `/myfolder`        |
| `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`             | `/myfolder`        |
| `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch`         | `/myfolder`        |
@z

@x
#### Keep `.git` directory
@y
#### Keep `.git` directory
@z

@x
By default, BuildKit doesn't keep the `.git` directory when using Git contexts.
You can configure BuildKit to keep the directory by setting the
[`BUILDKIT_CONTEXT_KEEP_GIT_DIR` build argument](../../engine/reference/builder.md#buildkit-built-in-build-args).
This can be useful to if you want to retrieve Git information during your build:
@y
By default, BuildKit doesn't keep the `.git` directory when using Git contexts.
You can configure BuildKit to keep the directory by setting the
[`BUILDKIT_CONTEXT_KEEP_GIT_DIR` build argument](../../engine/reference/builder.md#buildkit-built-in-build-args).
This can be useful to if you want to retrieve Git information during your build:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
WORKDIR /src
RUN --mount=target=. \
  make REVISION=$(git rev-parse HEAD) build
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
WORKDIR /src
RUN --mount=target=. \
  make REVISION=$(git rev-parse HEAD) build
```
@z

@x
```console
$ docker build \
  --build-arg BUILDKIT_CONTEXT_KEEP_GIT_DIR=1
  https://github.com/user/myrepo.git#main
```
@y
```console
$ docker build \
  --build-arg BUILDKIT_CONTEXT_KEEP_GIT_DIR=1
  https://github.com/user/myrepo.git#main
```
@z

@x
#### Private repositories
@y
#### Private repositories
@z

@x
When you specify a Git context that's also a private repository, the builder
needs you to provide the necessary authentication credentials. You can use
either SSH or token-based authentication.
@y
When you specify a Git context that's also a private repository, the builder
needs you to provide the necessary authentication credentials. You can use
either SSH or token-based authentication.
@z

@x
Buildx automatically detects and uses SSH credentials if the Git context you
specify is an SSH or Git address. By default, this uses `$SSH_AUTH_SOCK`.
You can configure the SSH credentials to use with the
[`--ssh` flag](../../engine/reference/commandline/buildx_build.md#ssh).
@y
Buildx automatically detects and uses SSH credentials if the Git context you
specify is an SSH or Git address. By default, this uses `$SSH_AUTH_SOCK`.
You can configure the SSH credentials to use with the
[`--ssh` flag](../../engine/reference/commandline/buildx_build.md#ssh).
@z

@x
```console
$ docker buildx build --ssh default git@github.com:user/private.git
```
@y
```console
$ docker buildx build --ssh default git@github.com:user/private.git
```
@z

@x
If you want to use token-based authentication instead, you can pass the token
using the
[`--secret` flag](../../engine/reference/commandline/buildx_build.md#secret).
@y
If you want to use token-based authentication instead, you can pass the token
using the
[`--secret` flag](../../engine/reference/commandline/buildx_build.md#secret).
@z

@x
```console
$ GIT_AUTH_TOKEN=<token> docker buildx build \
  --secret id=GIT_AUTH_TOKEN \
  https://github.com/user/private.git
```
@y
```console
$ GIT_AUTH_TOKEN=<token> docker buildx build \
  --secret id=GIT_AUTH_TOKEN \
  https://github.com/user/private.git
```
@z

@x
> **Note**
>
> Don't use `--build-arg` for secrets.
@y
> **Note**
>
> Don't use `--build-arg` for secrets.
@z

@x
### Remote context with Dockerfile from stdin
@y
### Remote context with Dockerfile from stdin
@z

@x
Use the following syntax to build an image using files on your local
filesystem, while using a Dockerfile from stdin.
@y
Use the following syntax to build an image using files on your local
filesystem, while using a Dockerfile from stdin.
@z

@x
```console
$ docker build -f- <URL>
```
@y
```console
$ docker build -f- <URL>
```
@z

@x
The syntax uses the -f (or --file) option to specify the Dockerfile to use, and
it uses a hyphen (-) as filename to instruct Docker to read the Dockerfile from
stdin.
@y
The syntax uses the -f (or --file) option to specify the Dockerfile to use, and
it uses a hyphen (-) as filename to instruct Docker to read the Dockerfile from
stdin.
@z

@x
This can be useful in situations where you want to build an image from a
repository that doesn't contain a Dockerfile. Or if you want to build with a
custom Dockerfile, without maintaining your own fork of the repository.
@y
This can be useful in situations where you want to build an image from a
repository that doesn't contain a Dockerfile. Or if you want to build with a
custom Dockerfile, without maintaining your own fork of the repository.
@z

@x
The following example builds an image using a Dockerfile from stdin, and adds
the `hello.c` file from the [hello-world](https://github.com/docker-library/hello-world)
repository on GitHub.
@y
The following example builds an image using a Dockerfile from stdin, and adds
the `hello.c` file from the [hello-world](https://github.com/docker-library/hello-world)
repository on GitHub.
@z

@x
```bash
docker build -t myimage:latest -f- https://github.com/docker-library/hello-world.git <<EOF
FROM busybox
COPY hello.c ./
EOF
```
@y
```bash
docker build -t myimage:latest -f- https://github.com/docker-library/hello-world.git <<EOF
FROM busybox
COPY hello.c ./
EOF
```
@z

@x
### Remote tarballs
@y
### Remote tarballs
@z

@x
If you pass the URL to a remote tarball, the URL itself is sent to the builder.
@y
If you pass the URL to a remote tarball, the URL itself is sent to the builder.
@z

@x
```console
$ docker build http://server/context.tar.gz
#1 [internal] load remote build context
#1 DONE 0.2s
@y
```console
$ docker build http://server/context.tar.gz
#1 [internal] load remote build context
#1 DONE 0.2s
@z

@x
#2 copy /context /
#2 DONE 0.1s
...
```
@y
#2 copy /context /
#2 DONE 0.1s
...
```
@z

@x
The download operation will be performed on the host where the BuildKit daemon
is running. Note that if you're using a remote Docker context or a remote
builder, that's not necessarily the same machine as where you issue the build
command. BuildKit fetches the `context.tar.gz` and uses it as the build
context. Tarball contexts must be tar archives conforming to the standard `tar`
Unix format and can be compressed with any one of the `xz`, `bzip2`, `gzip` or
`identity` (no compression) formats.
@y
The download operation will be performed on the host where the BuildKit daemon
is running. Note that if you're using a remote Docker context or a remote
builder, that's not necessarily the same machine as where you issue the build
command. BuildKit fetches the `context.tar.gz` and uses it as the build
context. Tarball contexts must be tar archives conforming to the standard `tar`
Unix format and can be compressed with any one of the `xz`, `bzip2`, `gzip` or
`identity` (no compression) formats.
@z

@x
## Empty context
@y
## Empty context
@z

@x
When you use a text file as the build context, the builder interprets the file
as a Dockerfile. Using a text file as context means that the build has no
filesystem context.
@y
When you use a text file as the build context, the builder interprets the file
as a Dockerfile. Using a text file as context means that the build has no
filesystem context.
@z

@x
You can build with an empty build context when your Dockerfile doesn't depend
on any local files.
@y
You can build with an empty build context when your Dockerfile doesn't depend
on any local files.
@z

@x
### How to build without a context
@y
### How to build without a context
@z

@x
You can pass the text file using a standard input stream, or by pointing at the
URL of a remote text file.
@y
You can pass the text file using a standard input stream, or by pointing at the
URL of a remote text file.
@z

@x
{{< tabs >}}
{{< tab name="Unix pipe" >}}
@y
{{< tabs >}}
{{< tab name="Unix pipe" >}}
@z

@x
```console
$ docker build - < Dockerfile
```
@y
```console
$ docker build - < Dockerfile
```
@z

@x
{{< /tab >}}
{{< tab name="PowerShell" >}}
@y
{{< /tab >}}
{{< tab name="PowerShell" >}}
@z

@x
```powershell
Get-Content Dockerfile | docker build -
```
@y
```powershell
Get-Content Dockerfile | docker build -
```
@z

@x
{{< /tab >}}
{{< tab name="Heredocs" >}}
@y
{{< /tab >}}
{{< tab name="Heredocs" >}}
@z

@x
```bash
docker build -t myimage:latest - <<EOF
FROM busybox
RUN echo "hello world"
EOF
```
@y
```bash
docker build -t myimage:latest - <<EOF
FROM busybox
RUN echo "hello world"
EOF
```
@z

@x
{{< /tab >}}
{{< tab name="Remote file" >}}
@y
{{< /tab >}}
{{< tab name="Remote file" >}}
@z

@x
```console
$ docker build https://raw.githubusercontent.com/dvdksn/clockbox/main/Dockerfile
```
@y
```console
$ docker build https://raw.githubusercontent.com/dvdksn/clockbox/main/Dockerfile
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
When you build without a filesystem context, Dockerfile instructions such as
`COPY` can't refer to local files:
@y
When you build without a filesystem context, Dockerfile instructions such as
`COPY` can't refer to local files:
@z

@x
```console
$ ls
main.c
$ docker build -<<< $'FROM scratch\nCOPY main.c .'
[+] Building 0.0s (4/4) FINISHED
 => [internal] load build definition from Dockerfile       0.0s
 => => transferring dockerfile: 64B                        0.0s
 => [internal] load .dockerignore                          0.0s
 => => transferring context: 2B                            0.0s
 => [internal] load build context                          0.0s
 => => transferring context: 2B                            0.0s
 => ERROR [1/1] COPY main.c .                              0.0s
------
 > [1/1] COPY main.c .:
------
Dockerfile:2
--------------------
   1 |     FROM scratch
   2 | >>> COPY main.c .
   3 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref 7ab2bb61-0c28-432e-abf5-a4c3440bc6b6::4lgfpdf54n5uqxnv9v6ymg7ih: "/main.c": not found
```
@y
```console
$ ls
main.c
$ docker build -<<< $'FROM scratch\nCOPY main.c .'
[+] Building 0.0s (4/4) FINISHED
 => [internal] load build definition from Dockerfile       0.0s
 => => transferring dockerfile: 64B                        0.0s
 => [internal] load .dockerignore                          0.0s
 => => transferring context: 2B                            0.0s
 => [internal] load build context                          0.0s
 => => transferring context: 2B                            0.0s
 => ERROR [1/1] COPY main.c .                              0.0s
------
 > [1/1] COPY main.c .:
------
Dockerfile:2
--------------------
   1 |     FROM scratch
   2 | >>> COPY main.c .
   3 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref 7ab2bb61-0c28-432e-abf5-a4c3440bc6b6::4lgfpdf54n5uqxnv9v6ymg7ih: "/main.c": not found
```
@z

@x
## .dockerignore files
@y
## .dockerignore files
@z

@x
You can use a `.dockerignore` file to exclude files or directories from the
build context.
@y
You can use a `.dockerignore` file to exclude files or directories from the
build context.
@z

@x
```gitignore
# .dockerignore
node_modules
bar
```
@y
```gitignore
# .dockerignore
node_modules
bar
```
@z

@x
This helps avoid sending unwanted files and directories to the builder,
improving build speed, especially when using a remote builder.
@y
This helps avoid sending unwanted files and directories to the builder,
improving build speed, especially when using a remote builder.
@z

@x
### Filename and location
@y
### Filename and location
@z

@x
When you run a build command, the build client looks for a file named
`.dockerignore` in the root directory of the context. If this file exists, the
files and directories that match patterns in the files are removed from the
build context before it's sent to the builder.
@y
When you run a build command, the build client looks for a file named
`.dockerignore` in the root directory of the context. If this file exists, the
files and directories that match patterns in the files are removed from the
build context before it's sent to the builder.
@z

@x
If you use multiple Dockerfiles, you can use different ignore-files for each
Dockerfile. You do so using a special naming convention for the ignore-files.
Place your ignore-file in the same directory as the Dockerfile, and prefix the
ignore-file with the name of the Dockerfile, as shown in the following example.
@y
If you use multiple Dockerfiles, you can use different ignore-files for each
Dockerfile. You do so using a special naming convention for the ignore-files.
Place your ignore-file in the same directory as the Dockerfile, and prefix the
ignore-file with the name of the Dockerfile, as shown in the following example.
@z

@x
```text
.
├── index.ts
├── src/
├── docker
│   ├── build.Dockerfile
│   ├── build.Dockerfile.dockerignore
│   ├── lint.Dockerfile
│   ├── lint.Dockerfile.dockerignore
│   ├── test.Dockerfile
│   └── test.Dockerfile.dockerignore
├── package.json
└── package-lock.json
```
@y
```text
.
├── index.ts
├── src/
├── docker
│   ├── build.Dockerfile
│   ├── build.Dockerfile.dockerignore
│   ├── lint.Dockerfile
│   ├── lint.Dockerfile.dockerignore
│   ├── test.Dockerfile
│   └── test.Dockerfile.dockerignore
├── package.json
└── package-lock.json
```
@z

@x
A Dockerfile-specific ignore-file takes precedence over the `.dockerignore`
file at the root of the build context if both exist.
@y
A Dockerfile-specific ignore-file takes precedence over the `.dockerignore`
file at the root of the build context if both exist.
@z

@x
### Syntax
@y
### Syntax
@z

@x
The `.dockerignore` file is a newline-separated list of patterns similar to the
file globs of Unix shells. For the purposes of matching, the root of the
context is considered to be both the working and the root directory. For
example, the patterns `/foo/bar` and `foo/bar` both exclude a file or directory
named `bar` in the `foo` subdirectory of `PATH` or in the root of the Git
repository located at `URL`. Neither excludes anything else.
@y
The `.dockerignore` file is a newline-separated list of patterns similar to the
file globs of Unix shells. For the purposes of matching, the root of the
context is considered to be both the working and the root directory. For
example, the patterns `/foo/bar` and `foo/bar` both exclude a file or directory
named `bar` in the `foo` subdirectory of `PATH` or in the root of the Git
repository located at `URL`. Neither excludes anything else.
@z

@x
If a line in `.dockerignore` file starts with `#` in column 1, then this line
is considered as a comment and is ignored before interpreted by the CLI.
@y
If a line in `.dockerignore` file starts with `#` in column 1, then this line
is considered as a comment and is ignored before interpreted by the CLI.
@z

@x
If you're interested in learning the precise details of the `.dockerignore`
pattern matching logic, check out the
[moby/patternmatcher repository](https://github.com/moby/patternmatcher/tree/main/ignorefile)
on GitHub, which contains the source code.
@y
If you're interested in learning the precise details of the `.dockerignore`
pattern matching logic, check out the
[moby/patternmatcher repository](https://github.com/moby/patternmatcher/tree/main/ignorefile)
on GitHub, which contains the source code.
@z

@x
#### Matching
@y
#### Matching
@z

@x
The following code snippet shows an example `.dockerignore` file.
@y
The following code snippet shows an example `.dockerignore` file.
@z

@x
```gitignore
# comment
*/temp*
*/*/temp*
temp?
```
@y
```gitignore
# comment
*/temp*
*/*/temp*
temp?
```
@z

@x
This file causes the following build behavior:
@y
This file causes the following build behavior:
@z

@x
| Rule        | Behavior                                                                                                                                                                                                      |
| :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `# comment` | Ignored.                                                                                                                                                                                                      |
| `*/temp*`   | Exclude files and directories whose names start with `temp` in any immediate subdirectory of the root. For example, the plain file `/somedir/temporary.txt` is excluded, as is the directory `/somedir/temp`. |
| `*/*/temp*` | Exclude files and directories starting with `temp` from any subdirectory that is two levels below the root. For example, `/somedir/subdir/temporary.txt` is excluded.                                         |
| `temp?`     | Exclude files and directories in the root directory whose names are a one-character extension of `temp`. For example, `/tempa` and `/tempb` are excluded.                                                     |
@y
| Rule        | Behavior                                                                                                                                                                                                      |
| :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `# comment` | Ignored.                                                                                                                                                                                                      |
| `*/temp*`   | Exclude files and directories whose names start with `temp` in any immediate subdirectory of the root. For example, the plain file `/somedir/temporary.txt` is excluded, as is the directory `/somedir/temp`. |
| `*/*/temp*` | Exclude files and directories starting with `temp` from any subdirectory that is two levels below the root. For example, `/somedir/subdir/temporary.txt` is excluded.                                         |
| `temp?`     | Exclude files and directories in the root directory whose names are a one-character extension of `temp`. For example, `/tempa` and `/tempb` are excluded.                                                     |
@z

@x
Matching is done using Go's
[`filepath.Match` function](https://golang.org/pkg/path/filepath#Match) rules.
A preprocessing step uses Go's
[`filepath.Clean` function](https://golang.org/pkg/path/filepath/#Clean)
to trim whitespace and remove `.` and `..`.
Lines that are blank after preprocessing are ignored.
@y
Matching is done using Go's
[`filepath.Match` function](https://golang.org/pkg/path/filepath#Match) rules.
A preprocessing step uses Go's
[`filepath.Clean` function](https://golang.org/pkg/path/filepath/#Clean)
to trim whitespace and remove `.` and `..`.
Lines that are blank after preprocessing are ignored.
@z

@x
> **Note**
>
> For historical reasons, the pattern `.` is ignored.
@y
> **Note**
>
> For historical reasons, the pattern `.` is ignored.
@z

@x
Beyond Go's `filepath.Match` rules, Docker also supports a special wildcard
string `**` that matches any number of directories (including zero). For
example, `**/*.go` excludes all files that end with `.go` found anywhere in the
build context.
@y
Beyond Go's `filepath.Match` rules, Docker also supports a special wildcard
string `**` that matches any number of directories (including zero). For
example, `**/*.go` excludes all files that end with `.go` found anywhere in the
build context.
@z

@x
You can use the `.dockerignore` file to exclude the `Dockerfile` and
`.dockerignore` files. These files are still sent to the builder as they're
needed for running the build. But you can't copy the files into the image using
`ADD`, `COPY`, or bind mounts.
@y
You can use the `.dockerignore` file to exclude the `Dockerfile` and
`.dockerignore` files. These files are still sent to the builder as they're
needed for running the build. But you can't copy the files into the image using
`ADD`, `COPY`, or bind mounts.
@z

@x
#### Negating matches
@y
#### Negating matches
@z

@x
You can prepend lines with a `!` (exclamation mark) to make exceptions to
exclusions. The following is an example `.dockerignore` file that uses this
mechanism:
@y
You can prepend lines with a `!` (exclamation mark) to make exceptions to
exclusions. The following is an example `.dockerignore` file that uses this
mechanism:
@z

@x
```gitignore
*.md
!README.md
```
@y
```gitignore
*.md
!README.md
```
@z

@x
All markdown files right under the context directory _except_ `README.md` are
excluded from the context. Note that markdown files under subdirectories are
still included.
@y
All markdown files right under the context directory _except_ `README.md` are
excluded from the context. Note that markdown files under subdirectories are
still included.
@z

@x
The placement of `!` exception rules influences the behavior: the last line of
the `.dockerignore` that matches a particular file determines whether it's
included or excluded. Consider the following example:
@y
The placement of `!` exception rules influences the behavior: the last line of
the `.dockerignore` that matches a particular file determines whether it's
included or excluded. Consider the following example:
@z

@x
```gitignore
*.md
!README*.md
README-secret.md
```
@y
```gitignore
*.md
!README*.md
README-secret.md
```
@z

@x
No markdown files are included in the context except README files other than
`README-secret.md`.
@y
No markdown files are included in the context except README files other than
`README-secret.md`.
@z

@x
Now consider this example:
@y
Now consider this example:
@z

@x
```gitignore
*.md
README-secret.md
!README*.md
```
@y
```gitignore
*.md
README-secret.md
!README*.md
```
@z

@x
All of the README files are included. The middle line has no effect because
`!README*.md` matches `README-secret.md` and comes last.
@y
All of the README files are included. The middle line has no effect because
`!README*.md` matches `README-secret.md` and comes last.
@z
