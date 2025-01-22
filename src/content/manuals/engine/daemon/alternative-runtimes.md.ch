%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Alternative container runtimes
description: |
  Docker Engine uses runc as the default container runtime, but you
  can specify alternative runtimes using the CLI or by configuring
  the daemon
keywords: engine, runtime, containerd, runtime v2, shim
@y
title: Alternative container runtimes
description: |
  Docker Engine uses runc as the default container runtime, but you
  can specify alternative runtimes using the CLI or by configuring
  the daemon
keywords: engine, runtime, containerd, runtime v2, shim
@z

@x
Docker Engine uses containerd for managing the container lifecycle,
which includes creating, starting, and stopping containers.
By default, containerd uses runc as its container runtime.
@y
Docker Engine uses containerd for managing the container lifecycle,
which includes creating, starting, and stopping containers.
By default, containerd uses runc as its container runtime.
@z

@x
## What runtimes can I use?
@y
## What runtimes can I use?
@z

@x
You can use any runtime that implements the containerd 
[shim API](https://github.com/containerd/containerd/blob/main/core/runtime/v2/README.md).
Such runtimes ship with a containerd shim, and you can use them without any
additional configuration. See [Use containerd shims](#use-containerd-shims).
@y
You can use any runtime that implements the containerd 
[shim API](https://github.com/containerd/containerd/blob/main/core/runtime/v2/README.md).
Such runtimes ship with a containerd shim, and you can use them without any
additional configuration. See [Use containerd shims](#use-containerd-shims).
@z

@x
Examples of runtimes that implement their own containerd shims include:
@y
Examples of runtimes that implement their own containerd shims include:
@z

@x
- [Wasmtime](https://wasmtime.dev/)
- [gVisor](https://github.com/google/gvisor)
- [Kata Containers](https://katacontainers.io/)
@y
- [Wasmtime](https://wasmtime.dev/)
- [gVisor](https://github.com/google/gvisor)
- [Kata Containers](https://katacontainers.io/)
@z

@x
You can also use runtimes designed as drop-in replacements for runc. Such
runtimes depend on the runc containerd shim for invoking the runtime binary.
You must manually register such runtimes in the daemon configuration.
@y
You can also use runtimes designed as drop-in replacements for runc. Such
runtimes depend on the runc containerd shim for invoking the runtime binary.
You must manually register such runtimes in the daemon configuration.
@z

@x
[youki](https://github.com/youki-dev/youki)
is one example of a runtime that can function as a runc drop-in replacement.
Refer to the [youki example](#youki) explaining the setup.
@y
[youki](https://github.com/youki-dev/youki)
is one example of a runtime that can function as a runc drop-in replacement.
Refer to the [youki example](#youki) explaining the setup.
@z

@x
## Use containerd shims
@y
## Use containerd shims
@z

@x
containerd shims let you use alternative runtimes without having to change the
configuration of the Docker daemon. To use a containerd shim, install the shim
binary on `PATH` on the system where the Docker daemon is running.
@y
containerd shims let you use alternative runtimes without having to change the
configuration of the Docker daemon. To use a containerd shim, install the shim
binary on `PATH` on the system where the Docker daemon is running.
@z

@x
To use a shim with `docker run`, specify the fully qualified name of the
runtime as the value to the `--runtime` flag:
@y
To use a shim with `docker run`, specify the fully qualified name of the
runtime as the value to the `--runtime` flag:
@z

@x
```console
$ docker run --runtime io.containerd.kata.v2 hello-world
```
@y
```console
$ docker run --runtime io.containerd.kata.v2 hello-world
```
@z

@x
### Use a containerd shim without installing on PATH
@y
### Use a containerd shim without installing on PATH
@z

@x
You can use a shim without installing it on `PATH`, in which case you need to
register the shim in the daemon configuration as follows:
@y
You can use a shim without installing it on `PATH`, in which case you need to
register the shim in the daemon configuration as follows:
@z

@x
```json
{
  "runtimes": {
    "foo": {
      "runtimeType": "/path/to/containerd-shim-foobar-v1"
    }
  }
}
```
@y
```json
{
  "runtimes": {
    "foo": {
      "runtimeType": "/path/to/containerd-shim-foobar-v1"
    }
  }
}
```
@z

@x
To use the shim, specify the name that you assigned to it:
@y
To use the shim, specify the name that you assigned to it:
@z

@x
```console
$ docker run --runtime foo hello-world
```
@y
```console
$ docker run --runtime foo hello-world
```
@z

@x
### Configure shims
@y
### Configure shims
@z

@x
If you need to pass additional configuration for a containerd shim, you can
use the `runtimes` option in the daemon configuration file.
@y
If you need to pass additional configuration for a containerd shim, you can
use the `runtimes` option in the daemon configuration file.
@z

@x
1. Edit the daemon configuration file by adding a `runtimes` entry for the
   shim you want to configure.
@y
1. Edit the daemon configuration file by adding a `runtimes` entry for the
   shim you want to configure.
@z

@x
   - Specify the fully qualified name for the runtime in `runtimeType` key
   - Add your runtime configuration under the `options` key
@y
   - Specify the fully qualified name for the runtime in `runtimeType` key
   - Add your runtime configuration under the `options` key
@z

@x
   ```json
   {
     "runtimes": {
       "gvisor": {
         "runtimeType": "io.containerd.runsc.v1",
         "options": {
           "TypeUrl": "io.containerd.runsc.v1.options",
           "ConfigPath": "/etc/containerd/runsc.toml"
         }
       }
     }
   }
   ```
@y
   ```json
   {
     "runtimes": {
       "gvisor": {
         "runtimeType": "io.containerd.runsc.v1",
         "options": {
           "TypeUrl": "io.containerd.runsc.v1.options",
           "ConfigPath": "/etc/containerd/runsc.toml"
         }
       }
     }
   }
   ```
@z

@x
2. Reload the daemon's configuration.
@y
2. Reload the daemon's configuration.
@z

@x
   ```console
   # systemctl reload docker
   ```
@y
   ```console
   # systemctl reload docker
   ```
@z

@x
3. Use the customized runtime using the `--runtime` flag for `docker run`.
@y
3. Use the customized runtime using the `--runtime` flag for `docker run`.
@z

@x
   ```console
   $ docker run --runtime gvisor hello-world
   ```
@y
   ```console
   $ docker run --runtime gvisor hello-world
   ```
@z

@x
For more information about the configuration options for containerd shims, see
[Configure containerd shims](/reference/cli/dockerd.md#configure-containerd-shims).
@y
For more information about the configuration options for containerd shims, see
[Configure containerd shims](reference/cli/dockerd.md#configure-containerd-shims).
@z

@x
## Examples
@y
## Examples
@z

@x
The following examples show you how to set up and use alternative container
runtimes with Docker Engine.
@y
The following examples show you how to set up and use alternative container
runtimes with Docker Engine.
@z

@x
- [youki](#youki)
- [Wasmtime](#wasmtime)
@y
- [youki](#youki)
- [Wasmtime](#wasmtime)
@z

@x
### youki
@y
### youki
@z

@x
youki is a container runtime written in Rust.
youki claims to be faster and use less memory than runc,
making it a good choice for resource-constrained environments.
@y
youki is a container runtime written in Rust.
youki claims to be faster and use less memory than runc,
making it a good choice for resource-constrained environments.
@z

@x
youki functions as a drop-in replacement for runc, meaning it relies on the
runc shim to invoke the runtime binary. When you register runtimes acting as
runc replacements, you configure the path to the runtime executable, and
optionally a set of runtime arguments. For more information, see
[Configure runc drop-in replacements](/reference/cli/dockerd.md#configure-runc-drop-in-replacements).
@y
youki functions as a drop-in replacement for runc, meaning it relies on the
runc shim to invoke the runtime binary. When you register runtimes acting as
runc replacements, you configure the path to the runtime executable, and
optionally a set of runtime arguments. For more information, see
[Configure runc drop-in replacements](reference/cli/dockerd.md#configure-runc-drop-in-replacements).
@z

@x
To add youki as a container runtime:
@y
To add youki as a container runtime:
@z

@x
1. Install youki and its dependencies.
@y
1. Install youki and its dependencies.
@z

@x
   For instructions, refer to the
   [official setup guide](https://youki-dev.github.io/youki/user/basic_setup.html).
@y
   For instructions, refer to the
   [official setup guide](https://youki-dev.github.io/youki/user/basic_setup.html).
@z

@x
2. Register youki as a runtime for Docker by editing the Docker daemon
   configuration file, located at `/etc/docker/daemon.json` by default.
@y
2. Register youki as a runtime for Docker by editing the Docker daemon
   configuration file, located at `/etc/docker/daemon.json` by default.
@z

@x
   The `path` key should specify the path to wherever you installed youki.
@y
   The `path` key should specify the path to wherever you installed youki.
@z

@x
   ```console
   # cat > /etc/docker/daemon.json <<EOF
   {
     "runtimes": {
       "youki": {
         "path": "/usr/local/bin/youki"
       }
     }
   }
   EOF
   ```
@y
   ```console
   # cat > /etc/docker/daemon.json <<EOF
   {
     "runtimes": {
       "youki": {
         "path": "/usr/local/bin/youki"
       }
     }
   }
   EOF
   ```
@z

@x
3. Reload the daemon's configuration.
@y
3. Reload the daemon's configuration.
@z

@x
   ```console
   # systemctl reload docker
   ```
@y
   ```console
   # systemctl reload docker
   ```
@z

@x
Now you can run containers that use youki as a runtime.
@y
Now you can run containers that use youki as a runtime.
@z

@x
```console
$ docker run --rm --runtime youki hello-world
```
@y
```console
$ docker run --rm --runtime youki hello-world
```
@z

@x
### Wasmtime
@y
### Wasmtime
@z

@x
Wasmtime is a
[Bytecode Alliance](https://bytecodealliance.org/)
project, and a Wasm runtime that lets you run Wasm containers.
Running Wasm containers with Docker provides two layers of security.
You get all the benefits from container isolation,
plus the added sandboxing provided by the Wasm runtime environment.
@y
Wasmtime is a
[Bytecode Alliance](https://bytecodealliance.org/)
project, and a Wasm runtime that lets you run Wasm containers.
Running Wasm containers with Docker provides two layers of security.
You get all the benefits from container isolation,
plus the added sandboxing provided by the Wasm runtime environment.
@z

@x
To add Wasmtime as a container runtime, follow these steps:
@y
To add Wasmtime as a container runtime, follow these steps:
@z

@x
1. Turn on the [containerd image store](/manuals/engine/storage/containerd.md)
   feature in the daemon configuration file.
@y
1. Turn on the [containerd image store](manuals/engine/storage/containerd.md)
   feature in the daemon configuration file.
@z

@x
   ```json
   {
     "features": {
       "containerd-snapshotter": true
     }
   }
   ```
@y
   ```json
   {
     "features": {
       "containerd-snapshotter": true
     }
   }
   ```
@z

@x
2. Restart the Docker daemon.
@y
2. Restart the Docker daemon.
@z

@x
   ```console
   # systemctl restart docker
   ```
@y
   ```console
   # systemctl restart docker
   ```
@z

@x
3. Install the Wasmtime containerd shim on `PATH`.
@y
3. Install the Wasmtime containerd shim on `PATH`.
@z

@x
   The following command Dockerfile builds the Wasmtime binary from source
   and exports it to `./containerd-shim-wasmtime-v1`.
@y
   The following command Dockerfile builds the Wasmtime binary from source
   and exports it to `./containerd-shim-wasmtime-v1`.
@z

@x
   ```console
   $ docker build --output . - <<EOF
   FROM rust:latest as build
   RUN cargo install \
       --git https://github.com/containerd/runwasi.git \
       --bin containerd-shim-wasmtime-v1 \
       --root /out \
       containerd-shim-wasmtime
   FROM scratch
   COPY --from=build /out/bin /
   EOF
   ```
@y
   ```console
   $ docker build --output . - <<EOF
   FROM rust:latest as build
   RUN cargo install \
       --git https://github.com/containerd/runwasi.git \
       --bin containerd-shim-wasmtime-v1 \
       --root /out \
       containerd-shim-wasmtime
   FROM scratch
   COPY --from=build /out/bin /
   EOF
   ```
@z

@x
   Put the binary in a directory on `PATH`.
@y
   Put the binary in a directory on `PATH`.
@z

@x
   ```console
   $ mv ./containerd-shim-wasmtime-v1 /usr/local/bin
   ```
@y
   ```console
   $ mv ./containerd-shim-wasmtime-v1 /usr/local/bin
   ```
@z

@x
Now you can run containers that use Wasmtime as a runtime.
@y
Now you can run containers that use Wasmtime as a runtime.
@z

@x
```console
$ docker run --rm \
 --runtime io.containerd.wasmtime.v1 \
 --platform wasi/wasm32 \
 michaelirwin244/wasm-example
```
@y
```console
$ docker run --rm \
 --runtime io.containerd.wasmtime.v1 \
 --platform wasi/wasm32 \
 michaelirwin244/wasm-example
```
@z

@x
## Related information
@y
## Related information
@z

@x
- To learn more about the configuration options for container runtimes,
  see [Configure container runtimes](/reference/cli/dockerd.md#configure-container-runtimes).
- You can configure which runtime that the daemon should use as its default.
  Refer to [Configure the default container runtime](/reference/cli/dockerd.md#configure-the-default-container-runtime).
@y
- To learn more about the configuration options for container runtimes,
  see [Configure container runtimes](reference/cli/dockerd.md#configure-container-runtimes).
- You can configure which runtime that the daemon should use as its default.
  Refer to [Configure the default container runtime](reference/cli/dockerd.md#configure-the-default-container-runtime).
@z
