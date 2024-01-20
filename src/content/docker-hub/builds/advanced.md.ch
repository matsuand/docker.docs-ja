%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automated builds
keywords: automated, build, images
title: Advanced options for Autobuild and Autotest
aliases:
- /docker-cloud/builds/advanced/
---
@y
---
description: Automated builds
keywords: automated, build, images
title: Advanced options for Autobuild and Autotest
aliases:
- /docker-cloud/builds/advanced/
---
@z

@x
> **Note**
>
> Automated builds require a
> [Docker Pro, Team, or Business subscription](../../subscription/index.md).
@y
> **Note**
>
> Automated builds require a
> [Docker Pro, Team, or Business subscription](../../subscription/index.md).
@z

@x
The following options allow you to customize your automated build and automated
test processes.
@y
The following options allow you to customize your automated build and automated
test processes.
@z

@x
## Environment variables for building and testing
@y
## Environment variables for building and testing
@z

@x
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
@y
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
@z

@x
> **Note**
>
> These environment variables are only available to the build and test
processes and don't affect your service's run environment.
@y
> **Note**
>
> These environment variables are only available to the build and test
processes and don't affect your service's run environment.
@z

@x
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
@y
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
@z

@x
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
@y
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
@z

@x
```yaml
services:
  sut:
    build: .
    command: run_tests.sh
    environment:
      - SOURCE_BRANCH
```
@y
```yaml
services:
  sut:
    build: .
    command: run_tests.sh
    environment:
      - SOURCE_BRANCH
```
@z

@x
## Override build, test or push commands
@y
## Override build, test or push commands
@z

@x
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. You can also set up [custom build phase hooks](#custom-build-phase-hooks)
to perform actions in between these commands.
@y
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. You can also set up [custom build phase hooks](#custom-build-phase-hooks)
to perform actions in between these commands.
@z

@x
> **Important**
>
>Use these hooks with caution. The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
{ .important }
@y
> **Important**
>
>Use these hooks with caution. The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
{ .important }
@z

@x
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed
appropriately with `#!/bin/bash`).
@y
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed
appropriately with `#!/bin/bash`).
@z

@x
These hooks run on an instance of [Ubuntu](https://releases.ubuntu.com/),
which includes interpreters
such as Perl or Python, and utilities such as `git` or `curl`. Refer to the
[Ubuntu documentation](https://ubuntu.com/)
for the full list of available interpreters and utilities.
@y
These hooks run on an instance of [Ubuntu](https://releases.ubuntu.com/),
which includes interpreters
such as Perl or Python, and utilities such as `git` or `curl`. Refer to the
[Ubuntu documentation](https://ubuntu.com/)
for the full list of available interpreters and utilities.
@z

@x
## Custom build phase hooks
@y
## Custom build phase hooks
@z

@x
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
@y
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
@z

@x
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as
long as they are prefixed appropriately with `#!/bin/bash`. The builder executes
the commands in the files before and after each step.
@y
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as
long as they are prefixed appropriately with `#!/bin/bash`. The builder executes
the commands in the files before and after each step.
@z

@x
The following hooks are available:
@y
The following hooks are available:
@z

@x
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [Automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [Automated build](index.md) )
@y
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [Automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [Automated build](index.md) )
@z

@x
### Build hook examples
@y
### Build hook examples
@z

@x
#### Override the "build" phase to set variables
@y
#### Override the "build" phase to set variables
@z

@x
Docker Hub allows you to define build environment variables either in the hook
files, or from the automated build interface, which you can then reference in hooks.
@y
Docker Hub allows you to define build environment variables either in the hook
files, or from the automated build interface, which you can then reference in hooks.
@z

@x
The following example defines a build hook that uses `docker build` arguments to
set the variable `CUSTOM` based on the value of variable defined using the
Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that you provide
with the name of the Dockerfile you want to build, and `$IMAGE_NAME` is the name
of the image being built.
@y
The following example defines a build hook that uses `docker build` arguments to
set the variable `CUSTOM` based on the value of variable defined using the
Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that you provide
with the name of the Dockerfile you want to build, and `$IMAGE_NAME` is the name
of the image being built.
@z

@x
```console
$ docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@y
```console
$ docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@z

@x
> **Important**
>
> A `hooks/build` file overrides the basic [docker build](../../engine/reference/commandline/image_build.md) command used by the builder, so you must include a similar build command in the hook or
the automated build fails.
{ .important }
@y
> **Important**
>
> A `hooks/build` file overrides the basic [docker build](../../engine/reference/commandline/image_build.md) command used by the builder, so you must include a similar build command in the hook or
the automated build fails.
{ .important }
@z

@x
Refer to the [docker build documentation](../../engine/reference/commandline/image_build.md#build-arg)
to learn more about Docker build-time variables.
@y
Refer to the [docker build documentation](../../engine/reference/commandline/image_build.md#build-arg)
to learn more about Docker build-time variables.
@z

@x
#### Push to multiple repositories
@y
#### Push to multiple repositories
@z

@x
By default the build process pushes the image only to the repository where the
build settings are configured. If you need to push the same image to multiple
repositories, you can set up a `post_push` hook to add additional tags and push
to more repositories.
@y
By default the build process pushes the image only to the repository where the
build settings are configured. If you need to push the same image to multiple
repositories, you can set up a `post_push` hook to add additional tags and push
to more repositories.
@z

@x
```console
$ docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
$ docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@y
```console
$ docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
$ docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@z

@x
## Source repository or branch clones
@y
## Source repository or branch clones
@z

@x
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone, it clones only the tip of the specified branch. This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
@y
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone, it clones only the tip of the specified branch. This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
@z

@x
As a result, if you need to perform a custom action that relies on a different
branch, such as a `post_push` hook, you can't checkout that branch unless
you do one of the following:
@y
As a result, if you need to perform a custom action that relies on a different
branch, such as a `post_push` hook, you can't checkout that branch unless
you do one of the following:
@z

@x
* You can get a shallow checkout of the target branch by doing the following:
@y
* You can get a shallow checkout of the target branch by doing the following:
@z

@x
    ```console
    $ git fetch origin branch:mytargetbranch --depth 1
    ```
@y
    ```console
    $ git fetch origin branch:mytargetbranch --depth 1
    ```
@z

@x
* You can also "unshallow" the clone, which fetches the whole Git history (and
  potentially takes a long time / moves a lot of data) by using the `--unshallow`
  flag on the fetch:
@y
* You can also "unshallow" the clone, which fetches the whole Git history (and
  potentially takes a long time / moves a lot of data) by using the `--unshallow`
  flag on the fetch:
@z

@x
    ```console
    $ git fetch --unshallow origin
    ```
@y
    ```console
    $ git fetch --unshallow origin
    ```
@z
