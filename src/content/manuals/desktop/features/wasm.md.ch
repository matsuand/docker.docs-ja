%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Wasm workloads 
@y
title: Wasm workloads 
@z

@x
description: How to run Wasm workloads with Docker Desktop
keywords: Docker, WebAssembly, wasm, containerd, engine
@y
description: How to run Wasm workloads with Docker Desktop
keywords: Docker, WebAssembly, wasm, containerd, engine
@z

@x
{{< summary-bar feature_name="Wasm workloads" >}}
@y
{{< summary-bar feature_name="Wasm workloads" >}}
@z

@x
WebAssembly (Wasm) is a fast, light alternative to Linux and
Windows containers.  With Docker Desktop, you can now run Wasm workloads side by side with traditional containers.
@y
WebAssembly (Wasm) is a fast, light alternative to Linux and
Windows containers.  With Docker Desktop, you can now run Wasm workloads side by side with traditional containers.
@z

@x
This page provides information about the ability to run Wasm applications
alongside your Linux containers in Docker.
@y
This page provides information about the ability to run Wasm applications
alongside your Linux containers in Docker.
@z

@x
> [!TIP]
>
> Learn more about Wasm use cases and tradeoffs in the [Docker Wasm technical preview blog post](https://www.docker.com/blog/docker-wasm-technical-preview/).
@y
> [!TIP]
>
> Learn more about Wasm use cases and tradeoffs in the [Docker Wasm technical preview blog post](https://www.docker.com/blog/docker-wasm-technical-preview/).
@z

@x
## Turn on Wasm workloads
@y
## Turn on Wasm workloads
@z

@x
Wasm workloads require the [containerd image store](containerd.md)
feature to be turned on. If you’re not already using the containerd image store,
then pre-existing images and containers will be inaccessible.
@y
Wasm workloads require the [containerd image store](containerd.md)
feature to be turned on. If you’re not already using the containerd image store,
then pre-existing images and containers will be inaccessible.
@z

@x
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Go to **Features in development** and check the **Enable Wasm** option.
4. Select **Apply & restart** to save the settings.
5. In the confirmation dialog, select **Install** to install the Wasm runtimes.
@y
1. Navigate to **Settings** in Docker Desktop.
2. In the **General** tab, check **Use containerd for pulling and storing images**.
3. Go to **Features in development** and check the **Enable Wasm** option.
4. Select **Apply & restart** to save the settings.
5. In the confirmation dialog, select **Install** to install the Wasm runtimes.
@z

@x
Docker Desktop downloads and installs the following runtimes: 
- `io.containerd.slight.v1`
- `io.containerd.spin.v2`
- `io.containerd.wasmedge.v1`
- `io.containerd.wasmtime.v1`
- `io.containerd.lunatic.v1`
- `io.containerd.wws.v1`
- `io.containerd.wasmer.v1`
@y
Docker Desktop downloads and installs the following runtimes: 
- `io.containerd.slight.v1`
- `io.containerd.spin.v2`
- `io.containerd.wasmedge.v1`
- `io.containerd.wasmtime.v1`
- `io.containerd.lunatic.v1`
- `io.containerd.wws.v1`
- `io.containerd.wasmer.v1`
@z

@x
## Usage examples
@y
## Usage examples
@z

@x
### Running a Wasm application with `docker run`
@y
### Running a Wasm application with `docker run`
@z

@x
The following `docker run` command starts a Wasm container on your system:
@y
The following `docker run` command starts a Wasm container on your system:
@z

@x
```console
$ docker run \
  --runtime=io.containerd.wasmedge.v1 \
  --platform=wasi/wasm \
  secondstate/rust-example-hello
```
@y
```console
$ docker run \
  --runtime=io.containerd.wasmedge.v1 \
  --platform=wasi/wasm \
  secondstate/rust-example-hello
```
@z

@x
After running this command, you can visit [http://localhost:8080/](http://localhost:8080/) to see the "Hello world" output from this example module.
@y
After running this command, you can visit [http://localhost:8080/](http://localhost:8080/) to see the "Hello world" output from this example module.
@z

@x
If you are receiving an error message, see the [troubleshooting section](#troubleshooting) for help.
@y
If you are receiving an error message, see the [troubleshooting section](#troubleshooting) for help.
@z

@x
Note the `--runtime` and `--platform` flags used in this command:
@y
Note the `--runtime` and `--platform` flags used in this command:
@z

@x
- `--runtime=io.containerd.wasmedge.v1`: Informs the Docker engine that you want
  to use the Wasm containerd shim instead of the standard Linux container
  runtime
- `--platform=wasi/wasm`: Specifies the architecture of the image you want to
  use. By leveraging a Wasm architecture, you don’t need to build separate
  images for the different machine architectures. The Wasm runtime takes care of
  the final step of converting the Wasm binary to machine instructions.
@y
- `--runtime=io.containerd.wasmedge.v1`: Informs the Docker engine that you want
  to use the Wasm containerd shim instead of the standard Linux container
  runtime
- `--platform=wasi/wasm`: Specifies the architecture of the image you want to
  use. By leveraging a Wasm architecture, you don’t need to build separate
  images for the different machine architectures. The Wasm runtime takes care of
  the final step of converting the Wasm binary to machine instructions.
@z

@x
### Running a Wasm application with Docker Compose
@y
### Running a Wasm application with Docker Compose
@z

@x
The same application can be run using the following Docker Compose file:
@y
The same application can be run using the following Docker Compose file:
@z

@x
```yaml
services:
  app:
    image: secondstate/rust-example-hello
    platform: wasi/wasm
    runtime: io.containerd.wasmedge.v1
```
@y
```yaml
services:
  app:
    image: secondstate/rust-example-hello
    platform: wasi/wasm
    runtime: io.containerd.wasmedge.v1
```
@z

@x
Start the application using the normal Docker Compose commands:
@y
Start the application using the normal Docker Compose commands:
@z

@x
   ```console
   $ docker compose up
   ```
@y
   ```console
   $ docker compose up
   ```
@z

@x
### Running a multi-service application with Wasm
@y
### Running a multi-service application with Wasm
@z

@x
Networking works the same as you'd expect with Linux containers, giving you the
flexibility to combine Wasm applications with other containerized workloads,
such as a database, in a single application stack.
@y
Networking works the same as you'd expect with Linux containers, giving you the
flexibility to combine Wasm applications with other containerized workloads,
such as a database, in a single application stack.
@z

@x
In the following example, the Wasm application leverages a MariaDB database
running in a container.
@y
In the following example, the Wasm application leverages a MariaDB database
running in a container.
@z

@x
1. Clone the repository.
@y
1. Clone the repository.
@z

@x
   ```console
   $ git clone https://github.com/second-state/microservice-rust-mysql.git
   Cloning into 'microservice-rust-mysql'...
   remote: Enumerating objects: 75, done.
   remote: Counting objects: 100% (75/75), done.
   remote: Compressing objects: 100% (42/42), done.
   remote: Total 75 (delta 29), reused 48 (delta 14), pack-reused 0
   Receiving objects: 100% (75/75), 19.09 KiB | 1.74 MiB/s, done.
   Resolving deltas: 100% (29/29), done.
   ```
@y
   ```console
   $ git clone https://github.com/second-state/microservice-rust-mysql.git
   Cloning into 'microservice-rust-mysql'...
   remote: Enumerating objects: 75, done.
   remote: Counting objects: 100% (75/75), done.
   remote: Compressing objects: 100% (42/42), done.
   remote: Total 75 (delta 29), reused 48 (delta 14), pack-reused 0
   Receiving objects: 100% (75/75), 19.09 KiB | 1.74 MiB/s, done.
   Resolving deltas: 100% (29/29), done.
   ```
@z

@x
2. Navigate into the cloned project and start the project using Docker Compose.
@y
2. Navigate into the cloned project and start the project using Docker Compose.
@z

@x
   ```console
   $ cd microservice-rust-mysql
   $ docker compose up
   [+] Running 0/1
   ⠿ server Warning                                                                                                  0.4s
   [+] Building 4.8s (13/15)
   ...
   microservice-rust-mysql-db-1      | 2022-10-19 19:54:45 0 [Note] mariadbd: ready for connections.
   microservice-rust-mysql-db-1      | Version: '10.9.3-MariaDB-1:10.9.3+maria~ubu2204'  socket: '/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution
   ```
@y
   ```console
   $ cd microservice-rust-mysql
   $ docker compose up
   [+] Running 0/1
   ⠿ server Warning                                                                                                  0.4s
   [+] Building 4.8s (13/15)
   ...
   microservice-rust-mysql-db-1      | 2022-10-19 19:54:45 0 [Note] mariadbd: ready for connections.
   microservice-rust-mysql-db-1      | Version: '10.9.3-MariaDB-1:10.9.3+maria~ubu2204'  socket: '/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution
   ```
@z

@x
   If you run `docker image ls` from another terminal window, you can see the
   Wasm image in your image store.
@y
   If you run `docker image ls` from another terminal window, you can see the
   Wasm image in your image store.
@z

@x
   ```console
   $ docker image ls
   REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
   server       latest    2c798ddecfa1   2 minutes ago   3MB
   ```
@y
   ```console
   $ docker image ls
   REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
   server       latest    2c798ddecfa1   2 minutes ago   3MB
   ```
@z

@x
   Inspecting the image shows the image has a `wasi/wasm` platform, a
   combination of OS and architecture:
@y
   Inspecting the image shows the image has a `wasi/wasm` platform, a
   combination of OS and architecture:
@z

@x
   ```console
   $ docker image inspect server | grep -A 3 "Architecture"
           "Architecture": "wasm",
           "Os": "wasi",
           "Size": 3001146,
           "VirtualSize": 3001146,
   ```
@y
   ```console
   $ docker image inspect server | grep -A 3 "Architecture"
           "Architecture": "wasm",
           "Os": "wasi",
           "Size": 3001146,
           "VirtualSize": 3001146,
   ```
@z

@x
3. Open the URL `http://localhost:8090` in a browser and create a few sample
   orders. All of these are interacting with the Wasm server.
@y
3. Open the URL `http://localhost:8090` in a browser and create a few sample
   orders. All of these are interacting with the Wasm server.
@z

@x
4. When you're all done, tear everything down by hitting `Ctrl+C` in the
   terminal you launched the application.
@y
4. When you're all done, tear everything down by hitting `Ctrl+C` in the
   terminal you launched the application.
@z

@x
### Building and pushing a Wasm module
@y
### Building and pushing a Wasm module
@z

@x
1. Create a Dockerfile that builds your Wasm application.
@y
1. Create a Dockerfile that builds your Wasm application.
@z

@x
   Exactly how to do this varies depending on the programming language you use.
@y
   Exactly how to do this varies depending on the programming language you use.
@z

@x
2. In a separate stage in your `Dockerfile`, extract the module and set it as
   the `ENTRYPOINT`.
@y
2. In a separate stage in your `Dockerfile`, extract the module and set it as
   the `ENTRYPOINT`.
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM scratch
   COPY --from=build /build/hello_world.wasm /hello_world.wasm
   ENTRYPOINT [ "/hello_world.wasm" ]
   ```
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM scratch
   COPY --from=build /build/hello_world.wasm /hello_world.wasm
   ENTRYPOINT [ "/hello_world.wasm" ]
   ```
@z

@x
3. Build and push the image specifying the `wasi/wasm` architecture. Buildx
   makes this easy to do in a single command.
@y
3. Build and push the image specifying the `wasi/wasm` architecture. Buildx
   makes this easy to do in a single command.
@z

@x
   ```console
   $ docker buildx build --platform wasi/wasm -t username/hello-world .
   ...
   => exporting to image                                                                             0.0s
   => => exporting layers                                                                            0.0s
   => => exporting manifest sha256:2ca02b5be86607511da8dc688234a5a00ab4d58294ab9f6beaba48ab3ba8de56  0.0s
   => => exporting config sha256:a45b465c3b6760a1a9fd2eda9112bc7e3169c9722bf9e77cf8c20b37295f954b    0.0s
   => => naming to docker.io/username/hello-world:latest                                            0.0s
   => => unpacking to docker.io/username/hello-world:latest                                         0.0s
   $ docker push username/hello-world
   ```
@y
   ```console
   $ docker buildx build --platform wasi/wasm -t username/hello-world .
   ...
   => exporting to image                                                                             0.0s
   => => exporting layers                                                                            0.0s
   => => exporting manifest sha256:2ca02b5be86607511da8dc688234a5a00ab4d58294ab9f6beaba48ab3ba8de56  0.0s
   => => exporting config sha256:a45b465c3b6760a1a9fd2eda9112bc7e3169c9722bf9e77cf8c20b37295f954b    0.0s
   => => naming to docker.io/username/hello-world:latest                                            0.0s
   => => unpacking to docker.io/username/hello-world:latest                                         0.0s
   $ docker push username/hello-world
   ```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
This section contains instructions on how to resolve common issues.
@y
This section contains instructions on how to resolve common issues.
@z

@x
### Unknown runtime specified
@y
### Unknown runtime specified
@z

@x
If you try to run a Wasm container without the [containerd image
store](./containerd.md), an error similar to the following displays:
@y
If you try to run a Wasm container without the [containerd image
store](./containerd.md), an error similar to the following displays:
@z

@x
```text
docker: Error response from daemon: Unknown runtime specified io.containerd.wasmedge.v1.
```
@y
```text
docker: Error response from daemon: Unknown runtime specified io.containerd.wasmedge.v1.
```
@z

@x
[Turn on the containerd feature](./containerd.md#enable-the-containerd-image-store)
in Docker Desktop settings and try again.
@y
[Turn on the containerd feature](./containerd.md#enable-the-containerd-image-store)
in Docker Desktop settings and try again.
@z

@x
### Failed to start shim: failed to resolve runtime path
@y
### Failed to start shim: failed to resolve runtime path
@z

@x
If you use an older version of Docker Desktop that doesn't support running Wasm
workloads, you will see an error message similar to the following:
@y
If you use an older version of Docker Desktop that doesn't support running Wasm
workloads, you will see an error message similar to the following:
@z

@x
```text
docker: Error response from daemon: failed to start shim: failed to resolve runtime path: runtime "io.containerd.wasmedge.v1" binary not installed "containerd-shim-wasmedge-v1": file does not exist: unknown.
```
@y
```text
docker: Error response from daemon: failed to start shim: failed to resolve runtime path: runtime "io.containerd.wasmedge.v1" binary not installed "containerd-shim-wasmedge-v1": file does not exist: unknown.
```
@z

@x
Update your Docker Desktop to the latest version and try again.
@y
Update your Docker Desktop to the latest version and try again.
@z

@x
## Known issues
@y
## Known issues
@z

@x
- Docker Compose may not exit cleanly when interrupted. As a workaround, clean up `docker-compose` processes by sending them a SIGKILL (`killall -9 docker-compose`).
- Pushes to Docker Hub might give an error stating `server message: insufficient_scope: authorization failed`, even after signing in through Docker Desktop. As a workaround, run `docker login` in the CLI
@y
- Docker Compose may not exit cleanly when interrupted. As a workaround, clean up `docker-compose` processes by sending them a SIGKILL (`killall -9 docker-compose`).
- Pushes to Docker Hub might give an error stating `server message: insufficient_scope: authorization failed`, even after signing in through Docker Desktop. As a workaround, run `docker login` in the CLI
@z
