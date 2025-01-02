%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Kubernetes driver
description: |
  The Kubernetes driver lets you run BuildKit in a Kubernetes cluster.
  You can connect to, and run your builds in, the cluster using Buildx.
keywords: build, buildx, driver, builder, kubernetes
@y
title: Kubernetes driver
description: |
  The Kubernetes driver lets you run BuildKit in a Kubernetes cluster.
  You can connect to, and run your builds in, the cluster using Buildx.
keywords: build, buildx, driver, builder, kubernetes
@z

@x
The Kubernetes driver lets you connect your local development or CI
environments to builders in a Kubernetes cluster to allow access to more
powerful compute resources, optionally on multiple native architectures.
@y
The Kubernetes driver lets you connect your local development or CI
environments to builders in a Kubernetes cluster to allow access to more
powerful compute resources, optionally on multiple native architectures.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Run the following command to create a new builder, named `kube`, that uses the
Kubernetes driver:
@y
Run the following command to create a new builder, named `kube`, that uses the
Kubernetes driver:
@z

@x
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=[key=value,...]
```
@y
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=[key=value,...]
```
@z

@x
The following table describes the available driver-specific options that you
can pass to `--driver-opt`:
@y
The following table describes the available driver-specific options that you
can pass to `--driver-opt`:
@z

@x
| Parameter                    | Type         | Default                                 | Description                                                                                                                          |
| ---------------------------- | ------------ | --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `image`                      | String       |                                         | Sets the image to use for running BuildKit.                                                                                          |
| `namespace`                  | String       | Namespace in current Kubernetes context | Sets the Kubernetes namespace.                                                                                                       |
| `default-load`               | Boolean      | `false`                                 | Automatically load images to the Docker Engine image store.                                                                          |
| `replicas`                   | Integer      | 1                                       | Sets the number of Pod replicas to create. See [scaling BuildKit][1]                                                                 |
| `requests.cpu`               | CPU units    |                                         | Sets the request CPU value specified in units of Kubernetes CPU. For example `requests.cpu=100m` or `requests.cpu=2`                 |
| `requests.memory`            | Memory size  |                                         | Sets the request memory value specified in bytes or with a valid suffix. For example `requests.memory=500Mi` or `requests.memory=4G` |
| `requests.ephemeral-storage` | Storage size |                                         | Sets the request ephemeral-storage value specified in bytes or with a valid suffix. For example `requests.ephemeral-storage=2Gi`     |
| `limits.cpu`                 | CPU units    |                                         | Sets the limit CPU value specified in units of Kubernetes CPU. For example `requests.cpu=100m` or `requests.cpu=2`                   |
| `limits.memory`              | Memory size  |                                         | Sets the limit memory value specified in bytes or with a valid suffix. For example `requests.memory=500Mi` or `requests.memory=4G`   |
| `limits.ephemeral-storage`   | Storage size |                                         | Sets the limit ephemeral-storage value specified in bytes or with a valid suffix. For example `requests.ephemeral-storage=100M`      |
| `nodeselector`               | CSV string   |                                         | Sets the pod's `nodeSelector` label(s). See [node assignment][2].                                                                    |
| `annotations`                | CSV string   |                                         | Sets additional annotations on the deployments and pods.                                                                             |
| `labels`                     | CSV string   |                                         | Sets additional labels on the deployments and pods.                                                                                  |
| `tolerations`                | CSV string   |                                         | Configures the pod's taint toleration. See [node assignment][2].                                                                     |
| `serviceaccount`             | String       |                                         | Sets the pod's `serviceAccountName`.                                                                                                 |
| `schedulername`              | String       |                                         | Sets the scheduler responsible for scheduling the pod.                                                                               |
| `timeout`                    | Time         | `120s`                                  | Set the timeout limit that determines how long Buildx will wait for pods to be provisioned before a build.                           |
| `rootless`                   | Boolean      | `false`                                 | Run the container as a non-root user. See [rootless mode][3].                                                                        |
| `loadbalance`                | String       | `sticky`                                | Load-balancing strategy (`sticky` or `random`). If set to `sticky`, the pod is chosen using the hash of the context path.            |
| `qemu.install`               | Boolean      | `false`                                 | Install QEMU emulation for multi platforms support. See [QEMU][4].                                                                   |
| `qemu.image`                 | String       | `tonistiigi/binfmt:latest`              | Sets the QEMU emulation image. See [QEMU][4].                                                                                        |
@y
| Parameter                    | Type         | Default                                 | Description                                                                                                                          |
| ---------------------------- | ------------ | --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `image`                      | String       |                                         | Sets the image to use for running BuildKit.                                                                                          |
| `namespace`                  | String       | Namespace in current Kubernetes context | Sets the Kubernetes namespace.                                                                                                       |
| `default-load`               | Boolean      | `false`                                 | Automatically load images to the Docker Engine image store.                                                                          |
| `replicas`                   | Integer      | 1                                       | Sets the number of Pod replicas to create. See [scaling BuildKit][1]                                                                 |
| `requests.cpu`               | CPU units    |                                         | Sets the request CPU value specified in units of Kubernetes CPU. For example `requests.cpu=100m` or `requests.cpu=2`                 |
| `requests.memory`            | Memory size  |                                         | Sets the request memory value specified in bytes or with a valid suffix. For example `requests.memory=500Mi` or `requests.memory=4G` |
| `requests.ephemeral-storage` | Storage size |                                         | Sets the request ephemeral-storage value specified in bytes or with a valid suffix. For example `requests.ephemeral-storage=2Gi`     |
| `limits.cpu`                 | CPU units    |                                         | Sets the limit CPU value specified in units of Kubernetes CPU. For example `requests.cpu=100m` or `requests.cpu=2`                   |
| `limits.memory`              | Memory size  |                                         | Sets the limit memory value specified in bytes or with a valid suffix. For example `requests.memory=500Mi` or `requests.memory=4G`   |
| `limits.ephemeral-storage`   | Storage size |                                         | Sets the limit ephemeral-storage value specified in bytes or with a valid suffix. For example `requests.ephemeral-storage=100M`      |
| `nodeselector`               | CSV string   |                                         | Sets the pod's `nodeSelector` label(s). See [node assignment][2].                                                                    |
| `annotations`                | CSV string   |                                         | Sets additional annotations on the deployments and pods.                                                                             |
| `labels`                     | CSV string   |                                         | Sets additional labels on the deployments and pods.                                                                                  |
| `tolerations`                | CSV string   |                                         | Configures the pod's taint toleration. See [node assignment][2].                                                                     |
| `serviceaccount`             | String       |                                         | Sets the pod's `serviceAccountName`.                                                                                                 |
| `schedulername`              | String       |                                         | Sets the scheduler responsible for scheduling the pod.                                                                               |
| `timeout`                    | Time         | `120s`                                  | Set the timeout limit that determines how long Buildx will wait for pods to be provisioned before a build.                           |
| `rootless`                   | Boolean      | `false`                                 | Run the container as a non-root user. See [rootless mode][3].                                                                        |
| `loadbalance`                | String       | `sticky`                                | Load-balancing strategy (`sticky` or `random`). If set to `sticky`, the pod is chosen using the hash of the context path.            |
| `qemu.install`               | Boolean      | `false`                                 | Install QEMU emulation for multi platforms support. See [QEMU][4].                                                                   |
| `qemu.image`                 | String       | `tonistiigi/binfmt:latest`              | Sets the QEMU emulation image. See [QEMU][4].                                                                                        |
@z

@x
[1]: #scaling-buildkit
[2]: #node-assignment
[3]: #rootless-mode
[4]: #qemu
@y
[1]: #scaling-buildkit
[2]: #node-assignment
[3]: #rootless-mode
[4]: #qemu
@z

@x
## Scaling BuildKit
@y
## Scaling BuildKit
@z

@x
One of the main advantages of the Kubernetes driver is that you can scale the
number of builder replicas up and down to handle increased build load. Scaling
is configurable using the following driver options:
@y
One of the main advantages of the Kubernetes driver is that you can scale the
number of builder replicas up and down to handle increased build load. Scaling
is configurable using the following driver options:
@z

@x
- `replicas=N`
@y
- `replicas=N`
@z

@x
  This scales the number of BuildKit pods to the desired size. By default, it
  only creates a single pod. Increasing the number of replicas lets you take
  advantage of multiple nodes in your cluster.
@y
  This scales the number of BuildKit pods to the desired size. By default, it
  only creates a single pod. Increasing the number of replicas lets you take
  advantage of multiple nodes in your cluster.
@z

@x
- `requests.cpu`, `requests.memory`, `requests.ephemeral-storage`, `limits.cpu`, `limits.memory`, `limits.ephemeral-storage`
@y
- `requests.cpu`, `requests.memory`, `requests.ephemeral-storage`, `limits.cpu`, `limits.memory`, `limits.ephemeral-storage`
@z

@x
  These options allow requesting and limiting the resources available to each
  BuildKit pod according to the official Kubernetes documentation
  [here](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
@y
  These options allow requesting and limiting the resources available to each
  BuildKit pod according to the official Kubernetes documentation
  [here](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
@z

@x
For example, to create 4 replica BuildKit pods:
@y
For example, to create 4 replica BuildKit pods:
@z

@x
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,replicas=4
```
@y
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,replicas=4
```
@z

@x
Listing the pods, you get this:
@y
Listing the pods, you get this:
@z

@x
```console
$ kubectl -n buildkit get deployments
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
kube0   4/4     4            4           8s
@y
```console
$ kubectl -n buildkit get deployments
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
kube0   4/4     4            4           8s
@z

@x
$ kubectl -n buildkit get pods
NAME                     READY   STATUS    RESTARTS   AGE
kube0-6977cdcb75-48ld2   1/1     Running   0          8s
kube0-6977cdcb75-rkc6b   1/1     Running   0          8s
kube0-6977cdcb75-vb4ks   1/1     Running   0          8s
kube0-6977cdcb75-z4fzs   1/1     Running   0          8s
```
@y
$ kubectl -n buildkit get pods
NAME                     READY   STATUS    RESTARTS   AGE
kube0-6977cdcb75-48ld2   1/1     Running   0          8s
kube0-6977cdcb75-rkc6b   1/1     Running   0          8s
kube0-6977cdcb75-vb4ks   1/1     Running   0          8s
kube0-6977cdcb75-z4fzs   1/1     Running   0          8s
```
@z

@x
Additionally, you can use the `loadbalance=(sticky|random)` option to control
the load-balancing behavior when there are multiple replicas. `random` selects
random nodes from the node pool, providing an even workload distribution across
replicas. `sticky` (the default) attempts to connect the same build performed
multiple times to the same node each time, ensuring better use of local cache.
@y
Additionally, you can use the `loadbalance=(sticky|random)` option to control
the load-balancing behavior when there are multiple replicas. `random` selects
random nodes from the node pool, providing an even workload distribution across
replicas. `sticky` (the default) attempts to connect the same build performed
multiple times to the same node each time, ensuring better use of local cache.
@z

@x
For more information on scalability, see the options for
[`docker buildx create`](/reference/cli/docker/buildx/create.md#driver-opt).
@y
For more information on scalability, see the options for
[`docker buildx create`](reference/cli/docker/buildx/create.md#driver-opt).
@z

@x
## Node assignment
@y
## Node assignment
@z

@x
The Kubernetes driver allows you to control the scheduling of BuildKit pods
using the `nodeSelector` and `tolerations` driver options.
You can also set the `schedulername` option if you want to use a custom scheduler altogether.
@y
The Kubernetes driver allows you to control the scheduling of BuildKit pods
using the `nodeSelector` and `tolerations` driver options.
You can also set the `schedulername` option if you want to use a custom scheduler altogether.
@z

@x
You can use the `annotations` and `labels` driver options to apply additional
metadata to the deployments and pods that's hosting your builders.
@y
You can use the `annotations` and `labels` driver options to apply additional
metadata to the deployments and pods that's hosting your builders.
@z

@x
The value of the `nodeSelector` parameter is a comma-separated string of
key-value pairs, where the key is the node label and the value is the label
text. For example: `"nodeselector=kubernetes.io/arch=arm64"`
@y
The value of the `nodeSelector` parameter is a comma-separated string of
key-value pairs, where the key is the node label and the value is the label
text. For example: `"nodeselector=kubernetes.io/arch=arm64"`
@z

@x
The `tolerations` parameter is a semicolon-separated list of taints. It accepts
the same values as the Kubernetes manifest. Each `tolerations` entry specifies
a taint key and the value, operator, or effect. For example:
`"tolerations=key=foo,value=bar;key=foo2,operator=exists;key=foo3,effect=NoSchedule"`
@y
The `tolerations` parameter is a semicolon-separated list of taints. It accepts
the same values as the Kubernetes manifest. Each `tolerations` entry specifies
a taint key and the value, operator, or effect. For example:
`"tolerations=key=foo,value=bar;key=foo2,operator=exists;key=foo3,effect=NoSchedule"`
@z

@x
These options accept CSV-delimited strings as values. Due to quoting rules for
shell commands, you must wrap the values in single quotes. You can even wrap all
of `--driver-opt` in single quotes, for example:
@y
These options accept CSV-delimited strings as values. Due to quoting rules for
shell commands, you must wrap the values in single quotes. You can even wrap all
of `--driver-opt` in single quotes, for example:
@z

@x
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  '--driver-opt="nodeselector=label1=value1,label2=value2","tolerations=key=key1,value=value1"'
```
@y
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  '--driver-opt="nodeselector=label1=value1,label2=value2","tolerations=key=key1,value=value1"'
```
@z

@x
## Multi-platform builds
@y
## Multi-platform builds
@z

@x
The Kubernetes driver has support for creating
[multi-platform images](/manuals/build/building/multi-platform.md),
either using QEMU or by leveraging the native architecture of nodes.
@y
The Kubernetes driver has support for creating
[multi-platform images](manuals/build/building/multi-platform.md),
either using QEMU or by leveraging the native architecture of nodes.
@z

@x
### QEMU
@y
### QEMU
@z

@x
Like the `docker-container` driver, the Kubernetes driver also supports using
[QEMU](https://www.qemu.org/) (user
mode) to build images for non-native platforms. Include the `--platform` flag
and specify which platforms you want to output to.
@y
Like the `docker-container` driver, the Kubernetes driver also supports using
[QEMU](https://www.qemu.org/) (user
mode) to build images for non-native platforms. Include the `--platform` flag
and specify which platforms you want to output to.
@z

@x
For example, to build a Linux image for `amd64` and `arm64`:
@y
For example, to build a Linux image for `amd64` and `arm64`:
@z

@x
```console
$ docker buildx build \
  --builder=kube \
  --platform=linux/amd64,linux/arm64 \
  -t <user>/<image> \
  --push .
```
@y
```console
$ docker buildx build \
  --builder=kube \
  --platform=linux/amd64,linux/arm64 \
  -t <user>/<image> \
  --push .
```
@z

@x
> [!WARNING]
>
> QEMU performs full-CPU emulation of non-native platforms, which is much
> slower than native builds. Compute-heavy tasks like compilation and
> compression/decompression will likely take a large performance hit.
@y
> [!WARNING]
>
> QEMU performs full-CPU emulation of non-native platforms, which is much
> slower than native builds. Compute-heavy tasks like compilation and
> compression/decompression will likely take a large performance hit.
@z

@x
Using a custom BuildKit image or invoking non-native binaries in builds may
require that you explicitly turn on QEMU using the `qemu.install` option when
creating the builder:
@y
Using a custom BuildKit image or invoking non-native binaries in builds may
require that you explicitly turn on QEMU using the `qemu.install` option when
creating the builder:
@z

@x
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,qemu.install=true
```
@y
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,qemu.install=true
```
@z

@x
### Native
@y
### Native
@z

@x
If you have access to cluster nodes of different architectures, the Kubernetes
driver can take advantage of these for native builds. To do this, use the
`--append` flag of `docker buildx create`.
@y
If you have access to cluster nodes of different architectures, the Kubernetes
driver can take advantage of these for native builds. To do this, use the
`--append` flag of `docker buildx create`.
@z

@x
First, create your builder with explicit support for a single architecture, for
example `amd64`:
@y
First, create your builder with explicit support for a single architecture, for
example `amd64`:
@z

@x
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --platform=linux/amd64 \
  --node=builder-amd64 \
  --driver-opt=namespace=buildkit,nodeselector="kubernetes.io/arch=amd64"
```
@y
```console
$ docker buildx create \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --platform=linux/amd64 \
  --node=builder-amd64 \
  --driver-opt=namespace=buildkit,nodeselector="kubernetes.io/arch=amd64"
```
@z

@x
This creates a Buildx builder named `kube`, containing a single builder node
named `builder-amd64`. Assigning a node name using `--node` is optional. Buildx
generates a random node name if you don't provide one.
@y
This creates a Buildx builder named `kube`, containing a single builder node
named `builder-amd64`. Assigning a node name using `--node` is optional. Buildx
generates a random node name if you don't provide one.
@z

@x
Note that the Buildx concept of a node isn't the same as the Kubernetes concept
of a node. A Buildx node in this case could connect multiple Kubernetes nodes of
the same architecture together.
@y
Note that the Buildx concept of a node isn't the same as the Kubernetes concept
of a node. A Buildx node in this case could connect multiple Kubernetes nodes of
the same architecture together.
@z

@x
With the `kube` builder created, you can now introduce another architecture into
the mix using `--append`. For example, to add `arm64`:
@y
With the `kube` builder created, you can now introduce another architecture into
the mix using `--append`. For example, to add `arm64`:
@z

@x
```console
$ docker buildx create \
  --append \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --platform=linux/arm64 \
  --node=builder-arm64 \
  --driver-opt=namespace=buildkit,nodeselector="kubernetes.io/arch=arm64"
```
@y
```console
$ docker buildx create \
  --append \
  --bootstrap \
  --name=kube \
  --driver=kubernetes \
  --platform=linux/arm64 \
  --node=builder-arm64 \
  --driver-opt=namespace=buildkit,nodeselector="kubernetes.io/arch=arm64"
```
@z

@x
Listing your builders shows both nodes for the `kube` builder:
@y
Listing your builders shows both nodes for the `kube` builder:
@z

@x
```console
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT                                         STATUS   PLATFORMS
kube            kubernetes
  builder-amd64 kubernetes:///kube?deployment=builder-amd64&kubeconfig= running  linux/amd64*, linux/amd64/v2, linux/amd64/v3, linux/386
  builder-arm64 kubernetes:///kube?deployment=builder-arm64&kubeconfig= running  linux/arm64*
```
@y
```console
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT                                         STATUS   PLATFORMS
kube            kubernetes
  builder-amd64 kubernetes:///kube?deployment=builder-amd64&kubeconfig= running  linux/amd64*, linux/amd64/v2, linux/amd64/v3, linux/386
  builder-arm64 kubernetes:///kube?deployment=builder-arm64&kubeconfig= running  linux/arm64*
```
@z

@x
You can now build multi-arch `amd64` and `arm64` images, by specifying those
platforms together in your build command:
@y
You can now build multi-arch `amd64` and `arm64` images, by specifying those
platforms together in your build command:
@z

@x
```console
$ docker buildx build --builder=kube --platform=linux/amd64,linux/arm64 -t <user>/<image> --push .
```
@y
```console
$ docker buildx build --builder=kube --platform=linux/amd64,linux/arm64 -t <user>/<image> --push .
```
@z

@x
You can repeat the `buildx create --append` command for as many architectures
that you want to support.
@y
You can repeat the `buildx create --append` command for as many architectures
that you want to support.
@z

@x
## Rootless mode
@y
## Rootless mode
@z

@x
The Kubernetes driver supports rootless mode. For more information on how
rootless mode works, and it's requirements, see
[here](https://github.com/moby/buildkit/blob/master/docs/rootless.md).
@y
The Kubernetes driver supports rootless mode. For more information on how
rootless mode works, and it's requirements, see
[here](https://github.com/moby/buildkit/blob/master/docs/rootless.md).
@z

@x
To turn it on in your cluster, you can use the `rootless=true` driver option:
@y
To turn it on in your cluster, you can use the `rootless=true` driver option:
@z

@x
```console
$ docker buildx create \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,rootless=true
```
@y
```console
$ docker buildx create \
  --name=kube \
  --driver=kubernetes \
  --driver-opt=namespace=buildkit,rootless=true
```
@z

@x
This will create your pods without `securityContext.privileged`.
@y
This will create your pods without `securityContext.privileged`.
@z

@x
Requires Kubernetes version 1.19 or later. Using Ubuntu as the host kernel is
recommended.
@y
Requires Kubernetes version 1.19 or later. Using Ubuntu as the host kernel is
recommended.
@z

@x
## Example: Creating a Buildx builder in Kubernetes
@y
## Example: Creating a Buildx builder in Kubernetes
@z

@x
This guide shows you how to:
@y
This guide shows you how to:
@z

@x
- Create a namespace for your Buildx resources
- Create a Kubernetes builder.
- List the available builders
- Build an image using your Kubernetes builders
@y
- Create a namespace for your Buildx resources
- Create a Kubernetes builder.
- List the available builders
- Build an image using your Kubernetes builders
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- You have an existing Kubernetes cluster. If you don't already have one, you
  can follow along by installing
  [minikube](https://minikube.sigs.k8s.io/docs/).
- The cluster you want to connect to is accessible via the `kubectl` command,
  with the `KUBECONFIG` environment variable
  [set appropriately](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/#set-the-kubeconfig-environment-variable) if necessary.
@y
- You have an existing Kubernetes cluster. If you don't already have one, you
  can follow along by installing
  [minikube](https://minikube.sigs.k8s.io/docs/).
- The cluster you want to connect to is accessible via the `kubectl` command,
  with the `KUBECONFIG` environment variable
  [set appropriately](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/#set-the-kubeconfig-environment-variable) if necessary.
@z

@x
1. Create a `buildkit` namespace.
@y
1. Create a `buildkit` namespace.
@z

@x
   Creating a separate namespace helps keep your Buildx resources separate from
   other resources in the cluster.
@y
   Creating a separate namespace helps keep your Buildx resources separate from
   other resources in the cluster.
@z

@x
   ```console
   $ kubectl create namespace buildkit
   namespace/buildkit created
   ```
@y
   ```console
   $ kubectl create namespace buildkit
   namespace/buildkit created
   ```
@z

@x
2. Create a new builder with the Kubernetes driver:
@y
2. Create a new builder with the Kubernetes driver:
@z

@x
   ```console
   $ docker buildx create \
     --bootstrap \
     --name=kube \
     --driver=kubernetes \
     --driver-opt=namespace=buildkit
   ```
@y
   ```console
   $ docker buildx create \
     --bootstrap \
     --name=kube \
     --driver=kubernetes \
     --driver-opt=namespace=buildkit
   ```
@z

@x
   > [!NOTE]
   >
   > Remember to specify the namespace in driver options.
@y
   > [!NOTE]
   >
   > Remember to specify the namespace in driver options.
@z

@x
3. List available builders using `docker buildx ls`
@y
3. List available builders using `docker buildx ls`
@z

@x
   ```console
   $ docker buildx ls
   NAME/NODE                DRIVER/ENDPOINT STATUS  PLATFORMS
   kube                     kubernetes
     kube0-6977cdcb75-k9h9m                 running linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
   default *                docker
     default                default         running linux/amd64, linux/386
   ```
@y
   ```console
   $ docker buildx ls
   NAME/NODE                DRIVER/ENDPOINT STATUS  PLATFORMS
   kube                     kubernetes
     kube0-6977cdcb75-k9h9m                 running linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
   default *                docker
     default                default         running linux/amd64, linux/386
   ```
@z

@x
4. Inspect the running pods created by the build driver with `kubectl`.
@y
4. Inspect the running pods created by the build driver with `kubectl`.
@z

@x
   ```console
   $ kubectl -n buildkit get deployments
   NAME    READY   UP-TO-DATE   AVAILABLE   AGE
   kube0   1/1     1            1           32s
@y
   ```console
   $ kubectl -n buildkit get deployments
   NAME    READY   UP-TO-DATE   AVAILABLE   AGE
   kube0   1/1     1            1           32s
@z

@x
   $ kubectl -n buildkit get pods
   NAME                     READY   STATUS    RESTARTS   AGE
   kube0-6977cdcb75-k9h9m   1/1     Running   0          32s
   ```
@y
   $ kubectl -n buildkit get pods
   NAME                     READY   STATUS    RESTARTS   AGE
   kube0-6977cdcb75-k9h9m   1/1     Running   0          32s
   ```
@z

@x
   The build driver creates the necessary resources on your cluster in the
   specified namespace (in this case, `buildkit`), while keeping your driver
   configuration locally.
@y
   The build driver creates the necessary resources on your cluster in the
   specified namespace (in this case, `buildkit`), while keeping your driver
   configuration locally.
@z

@x
5. Use your new builder by including the `--builder` flag when running buildx
   commands. For example: :
@y
5. Use your new builder by including the `--builder` flag when running buildx
   commands. For example: :
@z

@x
   ```console
   # Replace <registry> with your Docker username
   # and <image> with the name of the image you want to build
   docker buildx build \
     --builder=kube \
     -t <registry>/<image> \
     --push .
   ```
@y
   ```console
   # Replace <registry> with your Docker username
   # and <image> with the name of the image you want to build
   docker buildx build \
     --builder=kube \
     -t <registry>/<image> \
     --push .
   ```
@z

@x
That's it: you've now built an image from a Kubernetes pod, using Buildx.
@y
That's it: you've now built an image from a Kubernetes pod, using Buildx.
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information on the Kubernetes driver, see the
[buildx reference](/reference/cli/docker/buildx/create.md#driver).
@y
For more information on the Kubernetes driver, see the
[buildx reference](reference/cli/docker/buildx/create.md#driver).
@z
