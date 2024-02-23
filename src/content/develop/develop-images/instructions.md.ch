%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Hints, tips and guidelines for writing clean, reliable Dockerfile instructions
keywords: parent image, images, dockerfile, best practices, hub, official image
title: Best practices for Dockerfile instructions 
---
@y
---
description: Hints, tips and guidelines for writing clean, reliable Dockerfile instructions
keywords: parent image, images, dockerfile, best practices, hub, official image
title: Best practices for Dockerfile instructions 
---
@z

@x
These recommendations are designed to help you create an efficient and
maintainable Dockerfile.
@y
These recommendations are designed to help you create an efficient and
maintainable Dockerfile.
@z

@x
### FROM
@y
### FROM
@z

@x
Whenever possible, use current official images as the basis for your
images. Docker recommends the [Alpine image](https://hub.docker.com/_/alpine/) as it
is tightly controlled and small in size (currently under 6 MB), while still
being a full Linux distribution.
@y
Whenever possible, use current official images as the basis for your
images. Docker recommends the [Alpine image](https://hub.docker.com/_/alpine/) as it
is tightly controlled and small in size (currently under 6 MB), while still
being a full Linux distribution.
@z

@x
For more information about the `FROM` instruction, see [Dockerfile reference for the FROM instruction](../../reference/dockerfile.md#from).
@y
For more information about the `FROM` instruction, see [Dockerfile reference for the FROM instruction](../../reference/dockerfile.md#from).
@z

@x
### LABEL
@y
### LABEL
@z

@x
You can add labels to your image to help organize images by project, record
licensing information, to aid in automation, or for other reasons. For each
label, add a line beginning with `LABEL` with one or more key-value pairs.
The following examples show the different acceptable formats. Explanatory comments are included inline.
@y
You can add labels to your image to help organize images by project, record
licensing information, to aid in automation, or for other reasons. For each
label, add a line beginning with `LABEL` with one or more key-value pairs.
The following examples show the different acceptable formats. Explanatory comments are included inline.
@z

@x
Strings with spaces must be quoted or the spaces must be escaped. Inner
quote characters (`"`), must also be escaped. For example:
@y
Strings with spaces must be quoted or the spaces must be escaped. Inner
quote characters (`"`), must also be escaped. For example:
@z

@x
```dockerfile
# Set one or more individual labels
LABEL com.example.version="0.0.1-beta"
LABEL vendor1="ACME Incorporated"
LABEL vendor2=ZENITH\ Incorporated
LABEL com.example.release-date="2015-02-12"
LABEL com.example.version.is-production=""
```
@y
```dockerfile
# Set one or more individual labels
LABEL com.example.version="0.0.1-beta"
LABEL vendor1="ACME Incorporated"
LABEL vendor2=ZENITH\ Incorporated
LABEL com.example.release-date="2015-02-12"
LABEL com.example.version.is-production=""
```
@z

@x
An image can have more than one label. Prior to Docker 1.10, it was recommended
to combine all labels into a single `LABEL` instruction, to prevent extra layers
from being created. This is no longer necessary, but combining labels is still
supported. For example:
@y
An image can have more than one label. Prior to Docker 1.10, it was recommended
to combine all labels into a single `LABEL` instruction, to prevent extra layers
from being created. This is no longer necessary, but combining labels is still
supported. For example:
@z

@x
```dockerfile
# Set multiple labels on one line
LABEL com.example.version="0.0.1-beta" com.example.release-date="2015-02-12"
```
@y
```dockerfile
# Set multiple labels on one line
LABEL com.example.version="0.0.1-beta" com.example.release-date="2015-02-12"
```
@z

@x
The above example can also be written as:
@y
The above example can also be written as:
@z

@x
```dockerfile
# Set multiple labels at once, using line-continuation characters to break long lines
LABEL vendor=ACME\ Incorporated \
      com.example.is-beta= \
      com.example.is-production="" \
      com.example.version="0.0.1-beta" \
      com.example.release-date="2015-02-12"
```
@y
```dockerfile
# Set multiple labels at once, using line-continuation characters to break long lines
LABEL vendor=ACME\ Incorporated \
      com.example.is-beta= \
      com.example.is-production="" \
      com.example.version="0.0.1-beta" \
      com.example.release-date="2015-02-12"
```
@z

@x
See [Understanding object labels](../../config/labels-custom-metadata.md)
for guidelines about acceptable label keys and values. For information about
querying labels, refer to the items related to filtering in
[Managing labels on objects](../../config/labels-custom-metadata.md#manage-labels-on-objects).
See also [LABEL](../../reference/dockerfile.md#label) in the Dockerfile reference.
@y
See [Understanding object labels](../../config/labels-custom-metadata.md)
for guidelines about acceptable label keys and values. For information about
querying labels, refer to the items related to filtering in
[Managing labels on objects](../../config/labels-custom-metadata.md#manage-labels-on-objects).
See also [LABEL](../../reference/dockerfile.md#label) in the Dockerfile reference.
@z

@x
### RUN
@y
### RUN
@z

@x
Split long or complex `RUN` statements on multiple lines separated with
backslashes to make your Dockerfile more readable, understandable, and
maintainable.
@y
Split long or complex `RUN` statements on multiple lines separated with
backslashes to make your Dockerfile more readable, understandable, and
maintainable.
@z

@x
For more information about `RUN`, see [Dockerfile reference for the RUN instruction](../../reference/dockerfile.md#run).
@y
For more information about `RUN`, see [Dockerfile reference for the RUN instruction](../../reference/dockerfile.md#run).
@z

@x
#### apt-get
@y
#### apt-get
@z

@x
Probably the most common use case for `RUN` is an application of `apt-get`.
Because it installs packages, the `RUN apt-get` command has several counter-intuitive behaviors to
look out for.
@y
Probably the most common use case for `RUN` is an application of `apt-get`.
Because it installs packages, the `RUN apt-get` command has several counter-intuitive behaviors to
look out for.
@z

@x
Always combine `RUN apt-get update` with `apt-get install` in the same `RUN`
statement. For example:
@y
Always combine `RUN apt-get update` with `apt-get install` in the same `RUN`
statement. For example:
@z

@x
```dockerfile
RUN apt-get update && apt-get install -y \
    package-bar \
    package-baz \
    package-foo  \
    && rm -rf /var/lib/apt/lists/*
```
@y
```dockerfile
RUN apt-get update && apt-get install -y \
    package-bar \
    package-baz \
    package-foo  \
    && rm -rf /var/lib/apt/lists/*
```
@z

@x
Using `apt-get update` alone in a `RUN` statement causes caching issues and
subsequent `apt-get install` instructions to fail. For example, this issue will occur in the following Dockerfile:
@y
Using `apt-get update` alone in a `RUN` statement causes caching issues and
subsequent `apt-get install` instructions to fail. For example, this issue will occur in the following Dockerfile:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl
```
@y
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl
```
@z

@x
After building the image, all layers are in the Docker cache. Suppose you later
modify `apt-get install` by adding an extra package as shown in the following Dockerfile:
@y
After building the image, all layers are in the Docker cache. Suppose you later
modify `apt-get install` by adding an extra package as shown in the following Dockerfile:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl nginx
```
@y
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl nginx
```
@z

@x
Docker sees the initial and modified instructions as identical and reuses the
cache from previous steps. As a result the `apt-get update` isn't executed
because the build uses the cached version. Because the `apt-get update` isn't
run, your build can potentially get an outdated version of the `curl` and
`nginx` packages.
@y
Docker sees the initial and modified instructions as identical and reuses the
cache from previous steps. As a result the `apt-get update` isn't executed
because the build uses the cached version. Because the `apt-get update` isn't
run, your build can potentially get an outdated version of the `curl` and
`nginx` packages.
@z

@x
Using `RUN apt-get update && apt-get install -y` ensures your Dockerfile
installs the latest package versions with no further coding or manual
intervention. This technique is known as cache busting. You can also achieve
cache busting by specifying a package version. This is known as version pinning.
For example:
@y
Using `RUN apt-get update && apt-get install -y` ensures your Dockerfile
installs the latest package versions with no further coding or manual
intervention. This technique is known as cache busting. You can also achieve
cache busting by specifying a package version. This is known as version pinning.
For example:
@z

@x
```dockerfile
RUN apt-get update && apt-get install -y \
    package-bar \
    package-baz \
    package-foo=1.3.*
```
@y
```dockerfile
RUN apt-get update && apt-get install -y \
    package-bar \
    package-baz \
    package-foo=1.3.*
```
@z

@x
Version pinning forces the build to retrieve a particular version regardless of
what’s in the cache. This technique can also reduce failures due to unanticipated changes
in required packages.
@y
Version pinning forces the build to retrieve a particular version regardless of
what’s in the cache. This technique can also reduce failures due to unanticipated changes
in required packages.
@z

@x
Below is a well-formed `RUN` instruction that demonstrates all the `apt-get`
recommendations.
@y
Below is a well-formed `RUN` instruction that demonstrates all the `apt-get`
recommendations.
@z

@x
```dockerfile
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && rm -rf /var/lib/apt/lists/*
```
@y
```dockerfile
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && rm -rf /var/lib/apt/lists/*
```
@z

@x
The `s3cmd` argument specifies a version `1.1.*`. If the image previously
used an older version, specifying the new one causes a cache bust of `apt-get
update` and ensures the installation of the new version. Listing packages on
each line can also prevent mistakes in package duplication.
@y
The `s3cmd` argument specifies a version `1.1.*`. If the image previously
used an older version, specifying the new one causes a cache bust of `apt-get
update` and ensures the installation of the new version. Listing packages on
each line can also prevent mistakes in package duplication.
@z

@x
In addition, when you clean up the apt cache by removing `/var/lib/apt/lists` it
reduces the image size, since the apt cache isn't stored in a layer. Since the
`RUN` statement starts with `apt-get update`, the package cache is always
refreshed prior to `apt-get install`.
@y
In addition, when you clean up the apt cache by removing `/var/lib/apt/lists` it
reduces the image size, since the apt cache isn't stored in a layer. Since the
`RUN` statement starts with `apt-get update`, the package cache is always
refreshed prior to `apt-get install`.
@z

@x
Official Debian and Ubuntu images [automatically run `apt-get clean`](https://github.com/moby/moby/blob/03e2923e42446dbb830c654d0eec323a0b4ef02a/contrib/mkimage/debootstrap#L82-L105), so explicit invocation is not required.
@y
Official Debian and Ubuntu images [automatically run `apt-get clean`](https://github.com/moby/moby/blob/03e2923e42446dbb830c654d0eec323a0b4ef02a/contrib/mkimage/debootstrap#L82-L105), so explicit invocation is not required.
@z

@x
#### Using pipes
@y
#### Using pipes
@z

@x
Some `RUN` commands depend on the ability to pipe the output of one command into another, using the pipe character (`|`), as in the following example:
@y
Some `RUN` commands depend on the ability to pipe the output of one command into another, using the pipe character (`|`), as in the following example:
@z

@x
```dockerfile
RUN wget -O - https://some.site | wc -l > /number
```
@y
```dockerfile
RUN wget -O - https://some.site | wc -l > /number
```
@z

@x
Docker executes these commands using the `/bin/sh -c` interpreter, which only
evaluates the exit code of the last operation in the pipe to determine success.
In the example above, this build step succeeds and produces a new image so long
as the `wc -l` command succeeds, even if the `wget` command fails.
@y
Docker executes these commands using the `/bin/sh -c` interpreter, which only
evaluates the exit code of the last operation in the pipe to determine success.
In the example above, this build step succeeds and produces a new image so long
as the `wc -l` command succeeds, even if the `wget` command fails.
@z

@x
If you want the command to fail due to an error at any stage in the pipe,
prepend `set -o pipefail &&` to ensure that an unexpected error prevents the
build from inadvertently succeeding. For example:
@y
If you want the command to fail due to an error at any stage in the pipe,
prepend `set -o pipefail &&` to ensure that an unexpected error prevents the
build from inadvertently succeeding. For example:
@z

@x
```dockerfile
RUN set -o pipefail && wget -O - https://some.site | wc -l > /number
```
@y
```dockerfile
RUN set -o pipefail && wget -O - https://some.site | wc -l > /number
```
@z

@x
> **Note**
>
> Not all shells support the `-o pipefail` option.
>
> In cases such as the `dash` shell on
> Debian-based images, consider using the _exec_ form of `RUN` to explicitly
> choose a shell that does support the `pipefail` option. For example:
>
> ```dockerfile
> RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://some.site | wc -l > /number"]
> ```
@y
> **Note**
>
> Not all shells support the `-o pipefail` option.
>
> In cases such as the `dash` shell on
> Debian-based images, consider using the _exec_ form of `RUN` to explicitly
> choose a shell that does support the `pipefail` option. For example:
>
> ```dockerfile
> RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://some.site | wc -l > /number"]
> ```
@z

@x
### CMD
@y
### CMD
@z

@x
The `CMD` instruction should be used to run the software contained in your
image, along with any arguments. `CMD` should almost always be used in the form
of `CMD ["executable", "param1", "param2"]`. Thus, if the image is for a
service, such as Apache and Rails, you would run something like `CMD
["apache2","-DFOREGROUND"]`. Indeed, this form of the instruction is recommended
for any service-based image.
@y
The `CMD` instruction should be used to run the software contained in your
image, along with any arguments. `CMD` should almost always be used in the form
of `CMD ["executable", "param1", "param2"]`. Thus, if the image is for a
service, such as Apache and Rails, you would run something like `CMD
["apache2","-DFOREGROUND"]`. Indeed, this form of the instruction is recommended
for any service-based image.
@z

@x
In most other cases, `CMD` should be given an interactive shell, such as bash,
python and perl. For example, `CMD ["perl", "-de0"]`, `CMD ["python"]`, or `CMD
["php", "-a"]`. Using this form means that when you execute something like
`docker run -it python`, you’ll get dropped into a usable shell, ready to go.
`CMD` should rarely be used in the manner of `CMD ["param", "param"]` in
conjunction with [`ENTRYPOINT`](../../reference/dockerfile.md#entrypoint), unless
you and your expected users are already quite familiar with how `ENTRYPOINT`
works.
@y
In most other cases, `CMD` should be given an interactive shell, such as bash,
python and perl. For example, `CMD ["perl", "-de0"]`, `CMD ["python"]`, or `CMD
["php", "-a"]`. Using this form means that when you execute something like
`docker run -it python`, you’ll get dropped into a usable shell, ready to go.
`CMD` should rarely be used in the manner of `CMD ["param", "param"]` in
conjunction with [`ENTRYPOINT`](../../reference/dockerfile.md#entrypoint), unless
you and your expected users are already quite familiar with how `ENTRYPOINT`
works.
@z

@x
For more information about `CMD`, see [Dockerfile reference for the CMD instruction](../../reference/dockerfile.md#cmd).
@y
For more information about `CMD`, see [Dockerfile reference for the CMD instruction](../../reference/dockerfile.md#cmd).
@z

@x
### EXPOSE
@y
### EXPOSE
@z

@x
The `EXPOSE` instruction indicates the ports on which a container listens
for connections. Consequently, you should use the common, traditional port for
your application. For example, an image containing the Apache web server would
use `EXPOSE 80`, while an image containing MongoDB would use `EXPOSE 27017` and
so on.
@y
The `EXPOSE` instruction indicates the ports on which a container listens
for connections. Consequently, you should use the common, traditional port for
your application. For example, an image containing the Apache web server would
use `EXPOSE 80`, while an image containing MongoDB would use `EXPOSE 27017` and
so on.
@z

@x
For external access, your users can execute `docker run` with a flag indicating
how to map the specified port to the port of their choice.
For container linking, Docker provides environment variables for the path from
the recipient container back to the source (for example, `MYSQL_PORT_3306_TCP`).
@y
For external access, your users can execute `docker run` with a flag indicating
how to map the specified port to the port of their choice.
For container linking, Docker provides environment variables for the path from
the recipient container back to the source (for example, `MYSQL_PORT_3306_TCP`).
@z

@x
For more information about `EXPOSE`, see [Dockerfile reference for the EXPOSE instruction](../../reference/dockerfile.md#expose).
@y
For more information about `EXPOSE`, see [Dockerfile reference for the EXPOSE instruction](../../reference/dockerfile.md#expose).
@z

@x
### ENV
@y
### ENV
@z

@x
To make new software easier to run, you can use `ENV` to update the
`PATH` environment variable for the software your container installs. For
example, `ENV PATH=/usr/local/nginx/bin:$PATH` ensures that `CMD ["nginx"]`
just works.
@y
To make new software easier to run, you can use `ENV` to update the
`PATH` environment variable for the software your container installs. For
example, `ENV PATH=/usr/local/nginx/bin:$PATH` ensures that `CMD ["nginx"]`
just works.
@z

@x
The `ENV` instruction is also useful for providing the required environment
variables specific to services you want to containerize, such as Postgres’s
`PGDATA`.
@y
The `ENV` instruction is also useful for providing the required environment
variables specific to services you want to containerize, such as Postgres’s
`PGDATA`.
@z

@x
Lastly, `ENV` can also be used to set commonly used version numbers so that
version bumps are easier to maintain, as seen in the following example:
@y
Lastly, `ENV` can also be used to set commonly used version numbers so that
version bumps are easier to maintain, as seen in the following example:
@z

@x
```dockerfile
ENV PG_MAJOR=9.3
ENV PG_VERSION=9.3.4
RUN curl -SL https://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgres && …
ENV PATH=/usr/local/postgres-$PG_MAJOR/bin:$PATH
```
@y
```dockerfile
ENV PG_MAJOR=9.3
ENV PG_VERSION=9.3.4
RUN curl -SL https://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgres && …
ENV PATH=/usr/local/postgres-$PG_MAJOR/bin:$PATH
```
@z

@x
Similar to having constant variables in a program, as opposed to hard-coding
values, this approach lets you change a single `ENV` instruction to
automatically bump the version of the software in your container.
@y
Similar to having constant variables in a program, as opposed to hard-coding
values, this approach lets you change a single `ENV` instruction to
automatically bump the version of the software in your container.
@z

@x
Each `ENV` line creates a new intermediate layer, just like `RUN` commands. This
means that even if you unset the environment variable in a future layer, it
still persists in this layer and its value can be dumped. You can test this by
creating a Dockerfile like the following, and then building it.
@y
Each `ENV` line creates a new intermediate layer, just like `RUN` commands. This
means that even if you unset the environment variable in a future layer, it
still persists in this layer and its value can be dumped. You can test this by
creating a Dockerfile like the following, and then building it.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ENV ADMIN_USER="mark"
RUN echo $ADMIN_USER > ./mark
RUN unset ADMIN_USER
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ENV ADMIN_USER="mark"
RUN echo $ADMIN_USER > ./mark
RUN unset ADMIN_USER
```
@z

@x
```console
$ docker run --rm test sh -c 'echo $ADMIN_USER'
@y
```console
$ docker run --rm test sh -c 'echo $ADMIN_USER'
@z

@x
mark
```
@y
mark
```
@z

@x
To prevent this, and really unset the environment variable, use a `RUN` command
with shell commands, to set, use, and unset the variable all in a single layer.
You can separate your commands with `;` or `&&`. If you use the second method,
and one of the commands fails, the `docker build` also fails. This is usually a
good idea. Using `\` as a line continuation character for Linux Dockerfiles
improves readability. You could also put all of the commands into a shell script
and have the `RUN` command just run that shell script.
@y
To prevent this, and really unset the environment variable, use a `RUN` command
with shell commands, to set, use, and unset the variable all in a single layer.
You can separate your commands with `;` or `&&`. If you use the second method,
and one of the commands fails, the `docker build` also fails. This is usually a
good idea. Using `\` as a line continuation character for Linux Dockerfiles
improves readability. You could also put all of the commands into a shell script
and have the `RUN` command just run that shell script.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN export ADMIN_USER="mark" \
    && echo $ADMIN_USER > ./mark \
    && unset ADMIN_USER
CMD sh
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN export ADMIN_USER="mark" \
    && echo $ADMIN_USER > ./mark \
    && unset ADMIN_USER
CMD sh
```
@z

@x
```console
$ docker run --rm test sh -c 'echo $ADMIN_USER'
@y
```console
$ docker run --rm test sh -c 'echo $ADMIN_USER'
@z

@x
```
@y
```
@z

@x
For more information about `ENV`, see [Dockerfile reference for the ENV instruction](../../reference/dockerfile.md#env).
@y
For more information about `ENV`, see [Dockerfile reference for the ENV instruction](../../reference/dockerfile.md#env).
@z

@x
### ADD or COPY
@y
### ADD or COPY
@z

@x
`ADD` and `COPY` are functionally similar. `COPY` supports basic copying of
files into the container, from the [build context](../../build/building/context.md)
or from a stage in a [multi-stage build](../../build/building/multi-stage.md).
`ADD` supports features for fetching files from remote HTTPS and Git URLs, and
extracting tar files automatically when adding files from the build context.
@y
`ADD` and `COPY` are functionally similar. `COPY` supports basic copying of
files into the container, from the [build context](../../build/building/context.md)
or from a stage in a [multi-stage build](../../build/building/multi-stage.md).
`ADD` supports features for fetching files from remote HTTPS and Git URLs, and
extracting tar files automatically when adding files from the build context.
@z

@x
You'll mostly want to use `COPY` for copying files from one stage to another in
a multi-stage build. If you need to add files from the build context to the
container temporarily to execute a `RUN` instruction, you can often substitute
the `COPY` instruction with a bind mount instead. For example, to temporarily
add a `requirements.txt` file for a `RUN pip install` instruction:
@y
You'll mostly want to use `COPY` for copying files from one stage to another in
a multi-stage build. If you need to add files from the build context to the
container temporarily to execute a `RUN` instruction, you can often substitute
the `COPY` instruction with a bind mount instead. For example, to temporarily
add a `requirements.txt` file for a `RUN pip install` instruction:
@z

@x
```dockerfile
RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip install --requirement /tmp/requirements.txt
```
@y
```dockerfile
RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip install --requirement /tmp/requirements.txt
```
@z

@x
Bind mounts are more efficient than `COPY` for including files from the build
context in the container. Note that bind-mounted files are only added
temporarily for a single `RUN` instruction, and don't persist in the final
image. If you need to include files from the build context in the final image,
use `COPY`.
@y
Bind mounts are more efficient than `COPY` for including files from the build
context in the container. Note that bind-mounted files are only added
temporarily for a single `RUN` instruction, and don't persist in the final
image. If you need to include files from the build context in the final image,
use `COPY`.
@z

@x
The `ADD` instruction is best for when you need to download a remote artifact
as part of your build. `ADD` is better than manually adding files using
something like `wget` and `tar`, because it ensures a more precise build cache.
`ADD` also has built-in support for checksum validation of the remote
resources, and a protocol for parsing branches, tags, and subdirectories from
[Git URLs](../../reference/cli/docker/image/build.md#git-repositories).
@y
The `ADD` instruction is best for when you need to download a remote artifact
as part of your build. `ADD` is better than manually adding files using
something like `wget` and `tar`, because it ensures a more precise build cache.
`ADD` also has built-in support for checksum validation of the remote
resources, and a protocol for parsing branches, tags, and subdirectories from
[Git URLs](../../reference/cli/docker/image/build.md#git-repositories).
@z

@x
The following example uses `ADD` to download a .NET installer. Combined with
multi-stage builds, only the .NET runtime remains in the final stage, no
intermediate files.
@y
The following example uses `ADD` to download a .NET installer. Combined with
multi-stage builds, only the .NET runtime remains in the final stage, no
intermediate files.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM scratch AS src
ARG DOTNET_VERSION=8.0.0-preview.6.23329.7
ADD --checksum=sha256:270d731bd08040c6a3228115de1f74b91cf441c584139ff8f8f6503447cebdbb \
    https://dotnetcli.azureedge.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-arm64.tar.gz /dotnet.tar.gz
@y
FROM scratch AS src
ARG DOTNET_VERSION=8.0.0-preview.6.23329.7
ADD --checksum=sha256:270d731bd08040c6a3228115de1f74b91cf441c584139ff8f8f6503447cebdbb \
    https://dotnetcli.azureedge.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-arm64.tar.gz /dotnet.tar.gz
@z

@x
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.0-preview.6-bookworm-slim-arm64v8 AS installer
@y
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.0-preview.6-bookworm-slim-arm64v8 AS installer
@z

@x
# Retrieve .NET Runtime
RUN --mount=from=src,target=/src <<EOF
mkdir -p /dotnet
tar -oxzf /src/dotnet.tar.gz -C /dotnet
EOF
@y
# Retrieve .NET Runtime
RUN --mount=from=src,target=/src <<EOF
mkdir -p /dotnet
tar -oxzf /src/dotnet.tar.gz -C /dotnet
EOF
@z

@x
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.0-preview.6-bookworm-slim-arm64v8
@y
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.0-preview.6-bookworm-slim-arm64v8
@z

@x
COPY --from=installer /dotnet /usr/share/dotnet
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
```
@y
COPY --from=installer /dotnet /usr/share/dotnet
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
```
@z

@x
For more information about `ADD` or `COPY`, see the following:
- [Dockerfile reference for the ADD instruction](../../reference/dockerfile.md#add)
- [Dockerfile reference for the COPY instruction](../../reference/dockerfile.md#copy)
@y
For more information about `ADD` or `COPY`, see the following:
- [Dockerfile reference for the ADD instruction](../../reference/dockerfile.md#add)
- [Dockerfile reference for the COPY instruction](../../reference/dockerfile.md#copy)
@z

@x
### ENTRYPOINT
@y
### ENTRYPOINT
@z

@x
The best use for `ENTRYPOINT` is to set the image's main command, allowing that
image to be run as though it was that command, and then use `CMD` as the
default flags.
@y
The best use for `ENTRYPOINT` is to set the image's main command, allowing that
image to be run as though it was that command, and then use `CMD` as the
default flags.
@z

@x
The following is an example of an image for the command line tool `s3cmd`:
@y
The following is an example of an image for the command line tool `s3cmd`:
@z

@x
```dockerfile
ENTRYPOINT ["s3cmd"]
CMD ["--help"]
```
@y
```dockerfile
ENTRYPOINT ["s3cmd"]
CMD ["--help"]
```
@z

@x
You can use the following command to run the image and show the command's help:
@y
You can use the following command to run the image and show the command's help:
@z

@x
```console
$ docker run s3cmd
```
@y
```console
$ docker run s3cmd
```
@z

@x
Or, you can use the right parameters to execute a command, like in the following example:
@y
Or, you can use the right parameters to execute a command, like in the following example:
@z

@x
```console
$ docker run s3cmd ls s3://mybucket
```
@y
```console
$ docker run s3cmd ls s3://mybucket
```
@z

@x
This is useful because the image name can double as a reference to the binary as
shown in the command above.
@y
This is useful because the image name can double as a reference to the binary as
shown in the command above.
@z

@x
The `ENTRYPOINT` instruction can also be used in combination with a helper
script, allowing it to function in a similar way to the command above, even
when starting the tool may require more than one step.
@y
The `ENTRYPOINT` instruction can also be used in combination with a helper
script, allowing it to function in a similar way to the command above, even
when starting the tool may require more than one step.
@z

@x
For example, the [Postgres Official Image](https://hub.docker.com/_/postgres/)
uses the following script as its `ENTRYPOINT`:
@y
For example, the [Postgres Official Image](https://hub.docker.com/_/postgres/)
uses the following script as its `ENTRYPOINT`:
@z

@x
```bash
#!/bin/bash
set -e
@y
```bash
#!/bin/bash
set -e
@z

@x
if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"
@y
if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"
@z

@x
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi
@y
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi
@z

@x
    exec gosu postgres "$@"
fi
@y
    exec gosu postgres "$@"
fi
@z

@x
exec "$@"
```
@y
exec "$@"
```
@z

@x
This script uses [the `exec` Bash command](https://wiki.bash-hackers.org/commands/builtin/exec) so that the final running application becomes the container's PID 1. This allows the application to receive any Unix signals sent to the container. For more information, see the [`ENTRYPOINT` reference](../../reference/dockerfile.md#entrypoint).
@y
This script uses [the `exec` Bash command](https://wiki.bash-hackers.org/commands/builtin/exec) so that the final running application becomes the container's PID 1. This allows the application to receive any Unix signals sent to the container. For more information, see the [`ENTRYPOINT` reference](../../reference/dockerfile.md#entrypoint).
@z

@x
In the following example, a helper script is copied into the container and run via `ENTRYPOINT` on
container start:
@y
In the following example, a helper script is copied into the container and run via `ENTRYPOINT` on
container start:
@z

@x
```dockerfile
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
```
@y
```dockerfile
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
```
@z

@x
This script lets you interact with Postgres in several ways.
@y
This script lets you interact with Postgres in several ways.
@z

@x
It can simply start Postgres:
@y
It can simply start Postgres:
@z

@x
```console
$ docker run postgres
```
@y
```console
$ docker run postgres
```
@z

@x
Or, you can use it to run Postgres and pass parameters to the server:
@y
Or, you can use it to run Postgres and pass parameters to the server:
@z

@x
```console
$ docker run postgres postgres --help
```
@y
```console
$ docker run postgres postgres --help
```
@z

@x
Lastly, you can use it to start a totally different tool, such as Bash:
@y
Lastly, you can use it to start a totally different tool, such as Bash:
@z

@x
```console
$ docker run --rm -it postgres bash
```
@y
```console
$ docker run --rm -it postgres bash
```
@z

@x
For more information about `ENTRYPOINT`, see [Dockerfile reference for the ENTRYPOINT instruction](../../reference/dockerfile.md#entrypoint).
@y
For more information about `ENTRYPOINT`, see [Dockerfile reference for the ENTRYPOINT instruction](../../reference/dockerfile.md#entrypoint).
@z

@x
### VOLUME
@y
### VOLUME
@z

@x
You should use the `VOLUME` instruction to expose any database storage area,
configuration storage, or files and folders created by your Docker container. You
are strongly encouraged to use `VOLUME` for any combination of mutable or user-serviceable
parts of your image.
@y
You should use the `VOLUME` instruction to expose any database storage area,
configuration storage, or files and folders created by your Docker container. You
are strongly encouraged to use `VOLUME` for any combination of mutable or user-serviceable
parts of your image.
@z

@x
For more information about `VOLUME`, see [Dockerfile reference for the VOLUME instruction](../../reference/dockerfile.md#volume).
@y
For more information about `VOLUME`, see [Dockerfile reference for the VOLUME instruction](../../reference/dockerfile.md#volume).
@z

@x
### USER
@y
### USER
@z

@x
If a service can run without privileges, use `USER` to change to a non-root
user. Start by creating the user and group in the Dockerfile with something
like the following example:
@y
If a service can run without privileges, use `USER` to change to a non-root
user. Start by creating the user and group in the Dockerfile with something
like the following example:
@z

@x
```dockerfile
RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres
```
@y
```dockerfile
RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres
```
@z

@x
> **Note**
>
> Consider an explicit UID/GID.
>
> Users and groups in an image are assigned a non-deterministic UID/GID in that
> the "next" UID/GID is assigned regardless of image rebuilds. So, if it’s
> critical, you should assign an explicit UID/GID.
@y
> **Note**
>
> Consider an explicit UID/GID.
>
> Users and groups in an image are assigned a non-deterministic UID/GID in that
> the "next" UID/GID is assigned regardless of image rebuilds. So, if it’s
> critical, you should assign an explicit UID/GID.
@z

@x
> **Note**
>
> Due to an [unresolved bug](https://github.com/golang/go/issues/13548) in the
> Go archive/tar package's handling of sparse files, attempting to create a user
> with a significantly large UID inside a Docker container can lead to disk
> exhaustion because `/var/log/faillog` in the container layer is filled with
> NULL (\0) characters. A workaround is to pass the `--no-log-init` flag to
> useradd. The Debian/Ubuntu `adduser` wrapper does not support this flag.
@y
> **Note**
>
> Due to an [unresolved bug](https://github.com/golang/go/issues/13548) in the
> Go archive/tar package's handling of sparse files, attempting to create a user
> with a significantly large UID inside a Docker container can lead to disk
> exhaustion because `/var/log/faillog` in the container layer is filled with
> NULL (\0) characters. A workaround is to pass the `--no-log-init` flag to
> useradd. The Debian/Ubuntu `adduser` wrapper does not support this flag.
@z

@x
Avoid installing or using `sudo` as it has unpredictable TTY and
signal-forwarding behavior that can cause problems. If you absolutely need
functionality similar to `sudo`, such as initializing the daemon as `root` but
running it as non-`root`, consider using [“gosu”](https://github.com/tianon/gosu).
@y
Avoid installing or using `sudo` as it has unpredictable TTY and
signal-forwarding behavior that can cause problems. If you absolutely need
functionality similar to `sudo`, such as initializing the daemon as `root` but
running it as non-`root`, consider using [“gosu”](https://github.com/tianon/gosu).
@z

@x
Lastly, to reduce layers and complexity, avoid switching `USER` back and forth
frequently.
@y
Lastly, to reduce layers and complexity, avoid switching `USER` back and forth
frequently.
@z

@x
For more information about `USER`, see [Dockerfile reference for the USER instruction](../../reference/dockerfile.md#user).
@y
For more information about `USER`, see [Dockerfile reference for the USER instruction](../../reference/dockerfile.md#user).
@z

@x
### WORKDIR
@y
### WORKDIR
@z

@x
For clarity and reliability, you should always use absolute paths for your
`WORKDIR`. Also, you should use `WORKDIR` instead of  proliferating instructions
like `RUN cd … && do-something`, which are hard to read, troubleshoot, and
maintain.
@y
For clarity and reliability, you should always use absolute paths for your
`WORKDIR`. Also, you should use `WORKDIR` instead of  proliferating instructions
like `RUN cd … && do-something`, which are hard to read, troubleshoot, and
maintain.
@z

@x
For more information about `WORKDIR`, see [Dockerfile reference for the WORKDIR instruction](../../reference/dockerfile.md#workdir).
@y
For more information about `WORKDIR`, see [Dockerfile reference for the WORKDIR instruction](../../reference/dockerfile.md#workdir).
@z

@x
### ONBUILD
@y
### ONBUILD
@z

@x
An `ONBUILD` command executes after the current Dockerfile build completes.
`ONBUILD` executes in any child image derived `FROM` the current image. Think
of the `ONBUILD` command as an instruction that the parent Dockerfile gives
to the child Dockerfile.
@y
An `ONBUILD` command executes after the current Dockerfile build completes.
`ONBUILD` executes in any child image derived `FROM` the current image. Think
of the `ONBUILD` command as an instruction that the parent Dockerfile gives
to the child Dockerfile.
@z

@x
A Docker build executes `ONBUILD` commands before any command in a child
Dockerfile.
@y
A Docker build executes `ONBUILD` commands before any command in a child
Dockerfile.
@z

@x
`ONBUILD` is useful for images that are going to be built `FROM` a given
image. For example, you would use `ONBUILD` for a language stack image that
builds arbitrary user software written in that language within the
Dockerfile, as you can see in [Ruby’s `ONBUILD` variants](https://github.com/docker-library/ruby/blob/c43fef8a60cea31eb9e7d960a076d633cb62ba8d/2.4/jessie/onbuild/Dockerfile).
@y
`ONBUILD` is useful for images that are going to be built `FROM` a given
image. For example, you would use `ONBUILD` for a language stack image that
builds arbitrary user software written in that language within the
Dockerfile, as you can see in [Ruby’s `ONBUILD` variants](https://github.com/docker-library/ruby/blob/c43fef8a60cea31eb9e7d960a076d633cb62ba8d/2.4/jessie/onbuild/Dockerfile).
@z

@x
Images built with `ONBUILD` should get a separate tag. For example,
`ruby:1.9-onbuild` or `ruby:2.0-onbuild`.
@y
Images built with `ONBUILD` should get a separate tag. For example,
`ruby:1.9-onbuild` or `ruby:2.0-onbuild`.
@z

@x
Be careful when putting `ADD` or `COPY` in `ONBUILD`. The onbuild image
fails catastrophically if the new build's context is missing the resource being
added. Adding a separate tag, as recommended above, helps mitigate this by
allowing the Dockerfile author to make a choice.
@y
Be careful when putting `ADD` or `COPY` in `ONBUILD`. The onbuild image
fails catastrophically if the new build's context is missing the resource being
added. Adding a separate tag, as recommended above, helps mitigate this by
allowing the Dockerfile author to make a choice.
@z

@x
For more information about `ONBUILD`, see [Dockerfile reference for the ONBUILD instruction](../../reference/dockerfile.md#onbuild).
@y
For more information about `ONBUILD`, see [Dockerfile reference for the ONBUILD instruction](../../reference/dockerfile.md#onbuild).
@z
