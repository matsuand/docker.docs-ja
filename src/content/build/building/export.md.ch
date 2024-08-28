%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Export binaries
description: Using Docker builds to create and export executable binaries
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
@y
title: Export binaries
description: Using Docker builds to create and export executable binaries
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
@z

@x
Did you know that you can use Docker to build your application to standalone
binaries? Sometimes, you don’t want to package and distribute your application
as a Docker image. Use Docker to build your application, and use exporters to
save the output to disk.
@y
Did you know that you can use Docker to build your application to standalone
binaries? Sometimes, you don’t want to package and distribute your application
as a Docker image. Use Docker to build your application, and use exporters to
save the output to disk.
@z

@x
The default output format for `docker build` is a container image. That image is
automatically loaded to your local image store, where you can run a container
from that image, or push it to a registry. Under the hood, this uses the default
exporter, called the `docker` exporter.
@y
The default output format for `docker build` is a container image. That image is
automatically loaded to your local image store, where you can run a container
from that image, or push it to a registry. Under the hood, this uses the default
exporter, called the `docker` exporter.
@z

@x
To export your build results as files instead, you can use the `--output` flag,
or `-o` for short. the `--output` flag lets you change the output format of
your build.
@y
To export your build results as files instead, you can use the `--output` flag,
or `-o` for short. the `--output` flag lets you change the output format of
your build.
@z

@x
## Export binaries from a build
@y
## Export binaries from a build
@z

@x
If you specify a filepath to the `docker build --output` flag, Docker exports
the contents of the build container at the end of the build to the specified
location on your host's filesystem. This uses the `local`
[exporter](/build/exporters/local-tar.md).
@y
If you specify a filepath to the `docker build --output` flag, Docker exports
the contents of the build container at the end of the build to the specified
location on your host's filesystem. This uses the `local`
[exporter](build/exporters/local-tar.md).
@z

@x
The neat thing about this is that you can use Docker's powerful isolation and
build features to create standalone binaries. This
works well for Go, Rust, and other languages that can compile to a single
binary.
@y
The neat thing about this is that you can use Docker's powerful isolation and
build features to create standalone binaries. This
works well for Go, Rust, and other languages that can compile to a single
binary.
@z

@x
The following example creates a simple Rust program that prints "Hello,
World!", and exports the binary to the host filesystem.
@y
The following example creates a simple Rust program that prints "Hello,
World!", and exports the binary to the host filesystem.
@z

@x
1. Create a new directory for this example, and navigate to it:
@y
1. Create a new directory for this example, and navigate to it:
@z

@x
   ```console
   $ mkdir hello-world-bin
   $ cd hello-world-bin
   ```
@y
   ```console
   $ mkdir hello-world-bin
   $ cd hello-world-bin
   ```
@z

@x
2. Create a Dockerfile with the following contents:
@y
2. Create a Dockerfile with the following contents:
@z

@x
   ```Dockerfile
   # syntax=docker/dockerfile:1
   FROM rust:alpine AS build
   WORKDIR /src
   COPY <<EOT hello.rs
   fn main() {
       println!("Hello World!");
   }
   EOT
   RUN rustc -o /bin/hello hello.rs
@y
   ```Dockerfile
   # syntax=docker/dockerfile:1
   FROM rust:alpine AS build
   WORKDIR /src
   COPY <<EOT hello.rs
   fn main() {
       println!("Hello World!");
   }
   EOT
   RUN rustc -o /bin/hello hello.rs
@z

@x
   FROM scratch
   COPY --from=build /bin/hello /
   ENTRYPOINT ["/hello"]
   ```
@y
   FROM scratch
   COPY --from=build /bin/hello /
   ENTRYPOINT ["/hello"]
   ```
@z

@x
   > [!TIP]
   > The `COPY <<EOT` syntax is a [here-document](/reference/dockerfile.md#here-documents).
   > It lets you write multi-line strings in a Dockerfile. Here it's used to
   > create a simple Rust program inline in the Dockerfile.
@y
   > [!TIP]
   > The `COPY <<EOT` syntax is a [here-document](reference/dockerfile.md#here-documents).
   > It lets you write multi-line strings in a Dockerfile. Here it's used to
   > create a simple Rust program inline in the Dockerfile.
@z

@x
   This Dockerfile uses a multi-stage build to compile the program in the first
   stage, and then copies the binary to a scratch image in the second. The
   final image is a minimal image that only contains the binary. This use case
   for the `scratch` image is common for creating minimal build artifacts for
   programs that don't require a full operating system to run.
@y
   This Dockerfile uses a multi-stage build to compile the program in the first
   stage, and then copies the binary to a scratch image in the second. The
   final image is a minimal image that only contains the binary. This use case
   for the `scratch` image is common for creating minimal build artifacts for
   programs that don't require a full operating system to run.
@z

@x
3. Build the Dockerfile and export the binary to the current working directory:
@y
3. Build the Dockerfile and export the binary to the current working directory:
@z

@x
   ```console
   $ docker build --output=. .
   ```
@y
   ```console
   $ docker build --output=. .
   ```
@z

@x
   This command builds the Dockerfile and exports the binary to the current
   working directory. The binary is named `hello`, and it's created in the
   current working directory.
@y
   This command builds the Dockerfile and exports the binary to the current
   working directory. The binary is named `hello`, and it's created in the
   current working directory.
@z

@x
## Exporting multi-platform builds
@y
## Exporting multi-platform builds
@z

@x
You use the `local` exporter to export binaries in combination with
[multi-platform builds](/build/building/multi-platform.md). This lets you
compile multiple binaries at once, that can be run on any machine of any
architecture, provided that the target platform is supported by the compiler
you use.
@y
You use the `local` exporter to export binaries in combination with
[multi-platform builds](build/building/multi-platform.md). This lets you
compile multiple binaries at once, that can be run on any machine of any
architecture, provided that the target platform is supported by the compiler
you use.
@z

@x
Continuing on the example Dockerfile in the
[Export binaries from a build](#export-binaries-from-a-build) section:
@y
Continuing on the example Dockerfile in the
[Export binaries from a build](#export-binaries-from-a-build) section:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM rust:alpine AS build
WORKDIR /src
COPY <<EOT hello.rs
fn main() {
    println!("Hello World!");
}
EOT
RUN rustc -o /bin/hello hello.rs
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM rust:alpine AS build
WORKDIR /src
COPY <<EOT hello.rs
fn main() {
    println!("Hello World!");
}
EOT
RUN rustc -o /bin/hello hello.rs
@z

@x
FROM scratch
COPY --from=build /bin/hello /
ENTRYPOINT ["/hello"]
```
@y
FROM scratch
COPY --from=build /bin/hello /
ENTRYPOINT ["/hello"]
```
@z

@x
You can build this Rust program for multiple platforms using the `--platform`
flag with the `docker build` command. In combination with the `--output` flag,
the build exports the binaries for each target to the specified directory.
@y
You can build this Rust program for multiple platforms using the `--platform`
flag with the `docker build` command. In combination with the `--output` flag,
the build exports the binaries for each target to the specified directory.
@z

@x
For example, to build the program for both `linux/amd64` and `linux/arm64`:
@y
For example, to build the program for both `linux/amd64` and `linux/arm64`:
@z

@x
```console
$ docker build --platform=linux/amd64,linux/arm64 --output=out .
$ tree out/
out/
├── linux_amd64
│   └── hello
└── linux_arm64
    └── hello
@y
```console
$ docker build --platform=linux/amd64,linux/arm64 --output=out .
$ tree out/
out/
├── linux_amd64
│   └── hello
└── linux_arm64
    └── hello
@z

@x
3 directories, 2 files
```
@y
3 directories, 2 files
```
@z

@x
## Additional information
@y
## Additional information
@z

@x
In addition to the `local` exporter, there are other exporters available. To
learn more about the available exporters and how to use them, see the
[exporters](/build/exporters/_index.md) documentation.
@y
In addition to the `local` exporter, there are other exporters available. To
learn more about the available exporters and how to use them, see the
[exporters](build/exporters/_index.md) documentation.
@z
