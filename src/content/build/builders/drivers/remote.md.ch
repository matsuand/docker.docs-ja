%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Remote driver
description: |
  The remote driver lets you connect to a remote BuildKit instance
  that you set up and configure manually.
keywords: build, buildx, driver, builder, remote
aliases:
  - /build/buildx/drivers/remote/
  - /build/building/drivers/remote/
  - /build/drivers/remote/
---
@y
---
title: Remote driver
description: |
  The remote driver lets you connect to a remote BuildKit instance
  that you set up and configure manually.
keywords: build, buildx, driver, builder, remote
aliases:
  - /build/buildx/drivers/remote/
  - /build/building/drivers/remote/
  - /build/drivers/remote/
---
@z

@x
The Buildx remote driver allows for more complex custom build workloads,
allowing you to connect to externally managed BuildKit instances. This is useful
for scenarios that require manual management of the BuildKit daemon, or where a
BuildKit daemon is exposed from another source.
@y
The Buildx remote driver allows for more complex custom build workloads,
allowing you to connect to externally managed BuildKit instances. This is useful
for scenarios that require manual management of the BuildKit daemon, or where a
BuildKit daemon is exposed from another source.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
$ docker buildx create \
  --name remote \
  --driver remote \
  tcp://localhost:1234
```
@y
```console
$ docker buildx create \
  --name remote \
  --driver remote \
  tcp://localhost:1234
```
@z

@x
The following table describes the available driver-specific options that you can
pass to `--driver-opt`:
@y
The following table describes the available driver-specific options that you can
pass to `--driver-opt`:
@z

@x
| Parameter      | Type    | Default            | Description                                                            |
| -------------- | ------- | ------------------ | ---------------------------------------------------------------------- |
| `key`          | String  |                    | Sets the TLS client key.                                               |
| `cert`         | String  |                    | Absolute path to the TLS client certificate to present to `buildkitd`. |
| `cacert`       | String  |                    | Absolute path to the TLS certificate authority used for validation.    |
| `servername`   | String  | Endpoint hostname. | TLS server name used in requests.                                      |
| `default-load` | Boolean | `false`            | Automatically load images to the Docker Engine image store.            |
@y
| Parameter      | Type    | Default            | Description                                                            |
| -------------- | ------- | ------------------ | ---------------------------------------------------------------------- |
| `key`          | String  |                    | Sets the TLS client key.                                               |
| `cert`         | String  |                    | Absolute path to the TLS client certificate to present to `buildkitd`. |
| `cacert`       | String  |                    | Absolute path to the TLS certificate authority used for validation.    |
| `servername`   | String  | Endpoint hostname. | TLS server name used in requests.                                      |
| `default-load` | Boolean | `false`            | Automatically load images to the Docker Engine image store.            |
@z

@x
## Example: Remote BuildKit over Unix sockets
@y
## Example: Remote BuildKit over Unix sockets
@z

@x
This guide shows you how to create a setup with a BuildKit daemon listening on a
Unix socket, and have Buildx connect through it.
@y
This guide shows you how to create a setup with a BuildKit daemon listening on a
Unix socket, and have Buildx connect through it.
@z

@x
1. Ensure that [BuildKit](https://github.com/moby/buildkit) is installed.
@y
1. Ensure that [BuildKit](https://github.com/moby/buildkit) is installed.
@z

@x
   For example, you can launch an instance of buildkitd with:
@y
   For example, you can launch an instance of buildkitd with:
@z

@x
   ```console
   $ sudo ./buildkitd --group $(id -gn) --addr unix://$HOME/buildkitd.sock
   ```
@y
   ```console
   $ sudo ./buildkitd --group $(id -gn) --addr unix://$HOME/buildkitd.sock
   ```
@z

@x
   Alternatively, [see here](https://github.com/moby/buildkit/blob/master/docs/rootless.md)
   for running buildkitd in rootless mode or [here](https://github.com/moby/buildkit/tree/master/examples/systemd)
   for examples of running it as a systemd service.
@y
   Alternatively, [see here](https://github.com/moby/buildkit/blob/master/docs/rootless.md)
   for running buildkitd in rootless mode or [here](https://github.com/moby/buildkit/tree/master/examples/systemd)
   for examples of running it as a systemd service.
@z

@x
2. Check that you have a Unix socket that you can connect to.
@y
2. Check that you have a Unix socket that you can connect to.
@z

@x
   ```console
   $ ls -lh /home/user/buildkitd.sock
   srw-rw---- 1 root user 0 May  5 11:04 /home/user/buildkitd.sock
   ```
@y
   ```console
   $ ls -lh /home/user/buildkitd.sock
   srw-rw---- 1 root user 0 May  5 11:04 /home/user/buildkitd.sock
   ```
@z

@x
3. Connect Buildx to it using the remote driver:
@y
3. Connect Buildx to it using the remote driver:
@z

@x
   ```console
   $ docker buildx create \
     --name remote-unix \
     --driver remote \
     unix://$HOME/buildkitd.sock
   ```
@y
   ```console
   $ docker buildx create \
     --name remote-unix \
     --driver remote \
     unix://$HOME/buildkitd.sock
   ```
@z

@x
4. List available builders with `docker buildx ls`. You should then see
   `remote-unix` among them:
@y
4. List available builders with `docker buildx ls`. You should then see
   `remote-unix` among them:
@z

@x
   ```console
   $ docker buildx ls
   NAME/NODE           DRIVER/ENDPOINT                        STATUS  PLATFORMS
   remote-unix         remote
     remote-unix0      unix:///home/.../buildkitd.sock        running linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
   default *           docker
     default           default                                running linux/amd64, linux/386
   ```
@y
   ```console
   $ docker buildx ls
   NAME/NODE           DRIVER/ENDPOINT                        STATUS  PLATFORMS
   remote-unix         remote
     remote-unix0      unix:///home/.../buildkitd.sock        running linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
   default *           docker
     default           default                                running linux/amd64, linux/386
   ```
@z

@x
You can switch to this new builder as the default using
`docker buildx use remote-unix`, or specify it per build using `--builder`:
@y
You can switch to this new builder as the default using
`docker buildx use remote-unix`, or specify it per build using `--builder`:
@z

@x
```console
$ docker buildx build --builder=remote-unix -t test --load .
```
@y
```console
$ docker buildx build --builder=remote-unix -t test --load .
```
@z

@x
Remember that you need to use the `--load` flag if you want to load the build
result into the Docker daemon.
@y
Remember that you need to use the `--load` flag if you want to load the build
result into the Docker daemon.
@z

@x
## Example: Remote BuildKit in Docker container
@y
## Example: Remote BuildKit in Docker container
@z

@x
This guide will show you how to create setup similar to the `docker-container`
driver, by manually booting a BuildKit Docker container and connecting to it
using the Buildx remote driver. This procedure will manually create a container
and access it via it's exposed port. (You'd probably be better of just using the
`docker-container` driver that connects to BuildKit through the Docker daemon,
but this is for illustration purposes.)
@y
This guide will show you how to create setup similar to the `docker-container`
driver, by manually booting a BuildKit Docker container and connecting to it
using the Buildx remote driver. This procedure will manually create a container
and access it via it's exposed port. (You'd probably be better of just using the
`docker-container` driver that connects to BuildKit through the Docker daemon,
but this is for illustration purposes.)
@z

@x
1.  Generate certificates for BuildKit.
@y
1.  Generate certificates for BuildKit.
@z

@x
    You can use this [bake definition](https://github.com/moby/buildkit/blob/master/examples/create-certs)
    as a starting point:
@y
    You can use this [bake definition](https://github.com/moby/buildkit/blob/master/examples/create-certs)
    as a starting point:
@z

@x
    ```console
    SAN="localhost 127.0.0.1" docker buildx bake "https://github.com/moby/buildkit.git#master:examples/create-certs"
    ```
@y
    ```console
    SAN="localhost 127.0.0.1" docker buildx bake "https://github.com/moby/buildkit.git#master:examples/create-certs"
    ```
@z

@x
    Note that while it's possible to expose BuildKit over TCP without using
    TLS, it's not recommended. Doing so allows arbitrary access to BuildKit
    without credentials.
@y
    Note that while it's possible to expose BuildKit over TCP without using
    TLS, it's not recommended. Doing so allows arbitrary access to BuildKit
    without credentials.
@z

@x
2.  With certificates generated in `.certs/`, startup the container:
@y
2.  With certificates generated in `.certs/`, startup the container:
@z

@x
    ```console
    $ docker run -d --rm \
      --name=remote-buildkitd \
      --privileged \
      -p 1234:1234 \
      -v $PWD/.certs:/etc/buildkit/certs \
      moby/buildkit:latest \
      --addr tcp://0.0.0.0:1234 \
      --tlscacert /etc/buildkit/certs/daemon/ca.pem \
      --tlscert /etc/buildkit/certs/daemon/cert.pem \
      --tlskey /etc/buildkit/certs/daemon/key.pem
    ```
@y
    ```console
    $ docker run -d --rm \
      --name=remote-buildkitd \
      --privileged \
      -p 1234:1234 \
      -v $PWD/.certs:/etc/buildkit/certs \
      moby/buildkit:latest \
      --addr tcp://0.0.0.0:1234 \
      --tlscacert /etc/buildkit/certs/daemon/ca.pem \
      --tlscert /etc/buildkit/certs/daemon/cert.pem \
      --tlskey /etc/buildkit/certs/daemon/key.pem
    ```
@z

@x
    This command starts a BuildKit container and exposes the daemon's port 1234
    to localhost.
@y
    This command starts a BuildKit container and exposes the daemon's port 1234
    to localhost.
@z

@x
3.  Connect to this running container using Buildx:
@y
3.  Connect to this running container using Buildx:
@z

@x
    ```console
    $ docker buildx create \
      --name remote-container \
      --driver remote \
      --driver-opt cacert=${PWD}/.certs/client/ca.pem,cert=${PWD}/.certs/client/cert.pem,key=${PWD}/.certs/client/key.pem,servername=<TLS_SERVER_NAME> \
      tcp://localhost:1234
    ```
@y
    ```console
    $ docker buildx create \
      --name remote-container \
      --driver remote \
      --driver-opt cacert=${PWD}/.certs/client/ca.pem,cert=${PWD}/.certs/client/cert.pem,key=${PWD}/.certs/client/key.pem,servername=<TLS_SERVER_NAME> \
      tcp://localhost:1234
    ```
@z

@x
    Alternatively, use the `docker-container://` URL scheme to connect to the
    BuildKit container without specifying a port:
@y
    Alternatively, use the `docker-container://` URL scheme to connect to the
    BuildKit container without specifying a port:
@z

@x
    ```console
    $ docker buildx create \
      --name remote-container \
      --driver remote \
      docker-container://remote-container
    ```
@y
    ```console
    $ docker buildx create \
      --name remote-container \
      --driver remote \
      docker-container://remote-container
    ```
@z

@x
## Example: Remote BuildKit in Kubernetes
@y
## Example: Remote BuildKit in Kubernetes
@z

@x
This guide will show you how to create a setup similar to the `kubernetes`
driver by manually creating a BuildKit `Deployment`. While the `kubernetes`
driver will do this under-the-hood, it might sometimes be desirable to scale
BuildKit manually. Additionally, when executing builds from inside Kubernetes
pods, the Buildx builder will need to be recreated from within each pod or
copied between them.
@y
This guide will show you how to create a setup similar to the `kubernetes`
driver by manually creating a BuildKit `Deployment`. While the `kubernetes`
driver will do this under-the-hood, it might sometimes be desirable to scale
BuildKit manually. Additionally, when executing builds from inside Kubernetes
pods, the Buildx builder will need to be recreated from within each pod or
copied between them.
@z

@x
1. Create a Kubernetes deployment of `buildkitd`, as per the instructions
   [here](https://github.com/moby/buildkit/tree/master/examples/kubernetes).
@y
1. Create a Kubernetes deployment of `buildkitd`, as per the instructions
   [here](https://github.com/moby/buildkit/tree/master/examples/kubernetes).
@z

@x
   Following the guide, create certificates for the BuildKit daemon and client
   using [create-certs.sh](https://github.com/moby/buildkit/blob/master/examples/kubernetes/create-certs.sh),
   and create a deployment of BuildKit pods with a service that connects to
   them.
@y
   Following the guide, create certificates for the BuildKit daemon and client
   using [create-certs.sh](https://github.com/moby/buildkit/blob/master/examples/kubernetes/create-certs.sh),
   and create a deployment of BuildKit pods with a service that connects to
   them.
@z

@x
2. Assuming that the service is called `buildkitd`, create a remote builder in
   Buildx, ensuring that the listed certificate files are present:
@y
2. Assuming that the service is called `buildkitd`, create a remote builder in
   Buildx, ensuring that the listed certificate files are present:
@z

@x
   ```console
   $ docker buildx create \
     --name remote-kubernetes \
     --driver remote \
     --driver-opt cacert=${PWD}/.certs/client/ca.pem,cert=${PWD}/.certs/client/cert.pem,key=${PWD}/.certs/client/key.pem \
     tcp://buildkitd.default.svc:1234
   ```
@y
   ```console
   $ docker buildx create \
     --name remote-kubernetes \
     --driver remote \
     --driver-opt cacert=${PWD}/.certs/client/ca.pem,cert=${PWD}/.certs/client/cert.pem,key=${PWD}/.certs/client/key.pem \
     tcp://buildkitd.default.svc:1234
   ```
@z

@x
Note that this only works internally, within the cluster, since the BuildKit
setup guide only creates a `ClusterIP` service. To access a builder remotely,
you can set up and use an ingress, which is outside the scope of this guide.
@y
Note that this only works internally, within the cluster, since the BuildKit
setup guide only creates a `ClusterIP` service. To access a builder remotely,
you can set up and use an ingress, which is outside the scope of this guide.
@z

@x
### Debug a remote builder in Kubernetes
@y
### Debug a remote builder in Kubernetes
@z

@x
If you're having trouble accessing a remote builder deployed in Kubernetes, you
can use the `kube-pod://` URL scheme to connect directly to a BuildKit pod
through the Kubernetes API. Note that this method only connects to a single pod
in the deployment.
@y
If you're having trouble accessing a remote builder deployed in Kubernetes, you
can use the `kube-pod://` URL scheme to connect directly to a BuildKit pod
through the Kubernetes API. Note that this method only connects to a single pod
in the deployment.
@z

@x
```console
$ kubectl get pods --selector=app=buildkitd -o json | jq -r '.items[].metadata.name'
buildkitd-XXXXXXXXXX-xxxxx
$ docker buildx create \
  --name remote-container \
  --driver remote \
  kube-pod://buildkitd-XXXXXXXXXX-xxxxx
```
@y
```console
$ kubectl get pods --selector=app=buildkitd -o json | jq -r '.items[].metadata.name'
buildkitd-XXXXXXXXXX-xxxxx
$ docker buildx create \
  --name remote-container \
  --driver remote \
  kube-pod://buildkitd-XXXXXXXXXX-xxxxx
```
@z

@x
Alternatively, use the port forwarding mechanism of `kubectl`:
@y
Alternatively, use the port forwarding mechanism of `kubectl`:
@z

@x
```console
$ kubectl port-forward svc/buildkitd 1234:1234
```
@y
```console
$ kubectl port-forward svc/buildkitd 1234:1234
```
@z

@x
Then you can point the remote driver at `tcp://localhost:1234`.
@y
Then you can point the remote driver at `tcp://localhost:1234`.
@z
