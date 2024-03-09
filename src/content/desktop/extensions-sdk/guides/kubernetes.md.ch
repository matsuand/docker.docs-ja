%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Interacting with Kubernetes from an extension
description: How to connect to a Kubernetes cluster from an extension
keywords: Docker, Extensions, sdk, Kubernetes
aliases:
- /desktop/extensions-sdk/dev/kubernetes/
---
@y
---
title: Interacting with Kubernetes from an extension
description: How to connect to a Kubernetes cluster from an extension
keywords: Docker, Extensions, sdk, Kubernetes
aliases:
- /desktop/extensions-sdk/dev/kubernetes/
---
@z

@x
The Extensions SDK does not provide any API methods to directly interact with the Docker Desktop managed Kubernetes cluster or any other created using other tools such as KinD. However, this page provides a way for you to use other SDK APIs to interact indirectly with a Kubernetes cluster from your extension.
@y
The Extensions SDK does not provide any API methods to directly interact with the Docker Desktop managed Kubernetes cluster or any other created using other tools such as KinD. However, this page provides a way for you to use other SDK APIs to interact indirectly with a Kubernetes cluster from your extension.
@z

@x
To request an API that directly interacts with Docker Desktop-managed Kubernetes, you can upvote [this issue](https://github.com/docker/extensions-sdk/issues/181) in the Extensions SDK GitHub repository.
@y
To request an API that directly interacts with Docker Desktop-managed Kubernetes, you can upvote [this issue](https://github.com/docker/extensions-sdk/issues/181) in the Extensions SDK GitHub repository.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
### Turn on Kubernetes
@y
### Turn on Kubernetes
@z

@x
You can use the built-in Kubernetes in Docker Desktop to start a Kubernetes single-node cluster.
A `kubeconfig` file is used to configure access to Kubernetes when used in conjunction with the `kubectl` command-line tool, or other clients.
Docker Desktop conveniently provides the user with a local preconfigured `kubeconfig` file and `kubectl` command within the user’s home area. It is a convenient way to fast-tracking access for those looking to leverage Kubernetes from Docker Desktop.
@y
You can use the built-in Kubernetes in Docker Desktop to start a Kubernetes single-node cluster.
A `kubeconfig` file is used to configure access to Kubernetes when used in conjunction with the `kubectl` command-line tool, or other clients.
Docker Desktop conveniently provides the user with a local preconfigured `kubeconfig` file and `kubectl` command within the user’s home area. It is a convenient way to fast-tracking access for those looking to leverage Kubernetes from Docker Desktop.
@z

@x
## Ship the `kubectl` as part of the extension
@y
## Ship the `kubectl` as part of the extension
@z

@x
If your extension needs to interact with Kubernetes clusters, it is recommended that you include the `kubectl` command line tool as part of your extension. By doing this, users who install your extension get `kubectl` installed on their host.
@y
If your extension needs to interact with Kubernetes clusters, it is recommended that you include the `kubectl` command line tool as part of your extension. By doing this, users who install your extension get `kubectl` installed on their host.
@z

@x
To find out how to ship the `kubectl` command line tool for multiple platforms as part of your Docker Extension image, see [Build multi-arch extensions](../../../desktop/extensions-sdk/extensions/multi-arch.md#adding-multi-arch-binaries).
@y
To find out how to ship the `kubectl` command line tool for multiple platforms as part of your Docker Extension image, see [Build multi-arch extensions](../../../desktop/extensions-sdk/extensions/multi-arch.md#adding-multi-arch-binaries).
@z

@x
## Examples
@y
## Examples
@z

@x
The following code snippets have been put together in the [Kubernetes Sample Extension](https://github.com/docker/extensions-sdk/tree/main/samples/kubernetes-sample-extension). It shows how to interact with a Kubernetes cluster by shipping the `kubectl` command-line tool.
@y
The following code snippets have been put together in the [Kubernetes Sample Extension](https://github.com/docker/extensions-sdk/tree/main/samples/kubernetes-sample-extension). It shows how to interact with a Kubernetes cluster by shipping the `kubectl` command-line tool.
@z

@x
### Check the Kubernetes API server is reachable
@y
### Check the Kubernetes API server is reachable
@z

@x
Once the `kubectl` command-line tool is added to the extension image in the `Dockerfile`, and defined in the `metadata.json`, the Extensions framework deploys `kubectl` to the users' host when the extension is installed.
@y
Once the `kubectl` command-line tool is added to the extension image in the `Dockerfile`, and defined in the `metadata.json`, the Extensions framework deploys `kubectl` to the users' host when the extension is installed.
@z

@x
You can use the JS API `ddClient.extension.host?.cli.exec` to issue `kubectl` commands to, for instance, check whether the Kubernetes API server is reachable given a specific context:
@y
You can use the JS API `ddClient.extension.host?.cli.exec` to issue `kubectl` commands to, for instance, check whether the Kubernetes API server is reachable given a specific context:
@z

@x
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "cluster-info",
  "--request-timeout",
  "2s",
  "--context",
  "docker-desktop",
]);
```
@y
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "cluster-info",
  "--request-timeout",
  "2s",
  "--context",
  "docker-desktop",
]);
```
@z

@x
### List Kubernetes contexts
@y
### List Kubernetes contexts
@z

@x
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "config",
  "view",
  "-o",
  "jsonpath='{.contexts}'",
]);
```
@y
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "config",
  "view",
  "-o",
  "jsonpath='{.contexts}'",
]);
```
@z

@x
### List Kubernetes namespaces
@y
### List Kubernetes namespaces
@z

@x
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "get",
  "namespaces",
  "--no-headers",
  "-o",
  'custom-columns=":metadata.name"',
  "--context",
  "docker-desktop",
]);
```
@y
```typescript
const output = await ddClient.extension.host?.cli.exec("kubectl", [
  "get",
  "namespaces",
  "--no-headers",
  "-o",
  'custom-columns=":metadata.name"',
  "--context",
  "docker-desktop",
]);
```
@z

@x
## Persisting the kubeconfig file
@y
## Persisting the kubeconfig file
@z

@x
Below there are different ways to persist and read the `kubeconfig` file from the host filesystem. Users can add, edit, or remove Kubernetes context to the `kubeconfig` file at any time.
@y
Below there are different ways to persist and read the `kubeconfig` file from the host filesystem. Users can add, edit, or remove Kubernetes context to the `kubeconfig` file at any time.
@z

@x
> Warning
>
> The `kubeconfig` file is very sensitive and if found can give an attacker administrative access to the Kubernetes Cluster.
{ .warning }
@y
> Warning
>
> The `kubeconfig` file is very sensitive and if found can give an attacker administrative access to the Kubernetes Cluster.
{ .warning }
@z

@x
### Extension's backend container
@y
### Extension's backend container
@z

@x
If you need your extension to persist the `kubeconfig` file after it's been read, you can have a backend container that exposes an HTTP POST endpoint to store the content of the file either in memory or somewhere within the container filesystem. This way, if the user navigates out of the extension to another part of Docker Desktop and then comes back, you don't need to read the `kubeconfig` file again.
@y
If you need your extension to persist the `kubeconfig` file after it's been read, you can have a backend container that exposes an HTTP POST endpoint to store the content of the file either in memory or somewhere within the container filesystem. This way, if the user navigates out of the extension to another part of Docker Desktop and then comes back, you don't need to read the `kubeconfig` file again.
@z

@x
```typescript
export const updateKubeconfig = async () => {
  const kubeConfig = await ddClient.extension.host?.cli.exec("kubectl", [
    "config",
    "view",
    "--raw",
    "--minify",
    "--context",
    "docker-desktop",
  ]);
  if (kubeConfig?.stderr) {
    console.log("error", kubeConfig?.stderr);
    return false;
  }
@y
```typescript
export const updateKubeconfig = async () => {
  const kubeConfig = await ddClient.extension.host?.cli.exec("kubectl", [
    "config",
    "view",
    "--raw",
    "--minify",
    "--context",
    "docker-desktop",
  ]);
  if (kubeConfig?.stderr) {
    console.log("error", kubeConfig?.stderr);
    return false;
  }
@z

@x
  // call backend container to store the kubeconfig retrieved into the container's memory or filesystem
  try {
    await ddClient.extension.vm?.service?.post("/store-kube-config", {
      data: kubeConfig?.stdout,
    });
  } catch (err) {
    console.log("error", JSON.stringify(err));
  }
};
```
@y
  // call backend container to store the kubeconfig retrieved into the container's memory or filesystem
  try {
    await ddClient.extension.vm?.service?.post("/store-kube-config", {
      data: kubeConfig?.stdout,
    });
  } catch (err) {
    console.log("error", JSON.stringify(err));
  }
};
```
@z

@x
### Docker volume
@y
### Docker volume
@z

@x
Volumes are the preferred mechanism for persisting data generated by and used by Docker containers. You can make use of them to persist the `kubeconfig` file.
By persisting the `kubeconfig` in a volume you won't need to read the `kubeconfig` file again when the extension pane closes. This makes it ideal for persisting data when navigating out of the extension to other parts of Docker Desktop.
@y
Volumes are the preferred mechanism for persisting data generated by and used by Docker containers. You can make use of them to persist the `kubeconfig` file.
By persisting the `kubeconfig` in a volume you won't need to read the `kubeconfig` file again when the extension pane closes. This makes it ideal for persisting data when navigating out of the extension to other parts of Docker Desktop.
@z

@x
```typescript
const kubeConfig = await ddClient.extension.host?.cli.exec("kubectl", [
  "config",
  "view",
  "--raw",
  "--minify",
  "--context",
  "docker-desktop",
]);
if (kubeConfig?.stderr) {
  console.log("error", kubeConfig?.stderr);
  return false;
}
@y
```typescript
const kubeConfig = await ddClient.extension.host?.cli.exec("kubectl", [
  "config",
  "view",
  "--raw",
  "--minify",
  "--context",
  "docker-desktop",
]);
if (kubeConfig?.stderr) {
  console.log("error", kubeConfig?.stderr);
  return false;
}
@z

@x
await ddClient.docker.cli.exec("run", [
  "--rm",
  "-v",
  "my-vol:/tmp",
  "alpine",
  "/bin/sh",
  "-c",
  `"touch /tmp/.kube/config && echo '${kubeConfig?.stdout}' > /tmp/.kube/config"`,
]);
```
@y
await ddClient.docker.cli.exec("run", [
  "--rm",
  "-v",
  "my-vol:/tmp",
  "alpine",
  "/bin/sh",
  "-c",
  `"touch /tmp/.kube/config && echo '${kubeConfig?.stdout}' > /tmp/.kube/config"`,
]);
```
@z

@x
### Extension's `localStorage`
@y
### Extension's `localStorage`
@z

@x
`localStorage` is one of the mechanisms of a browser's web storage. It allows users to save data as key-value pairs in the browser for later use.
`localStorage` does not clear data when the browser (the extension pane) closes. This makes it ideal for persisting data when navigating out of the extension to other parts of Docker Desktop.
@y
`localStorage` is one of the mechanisms of a browser's web storage. It allows users to save data as key-value pairs in the browser for later use.
`localStorage` does not clear data when the browser (the extension pane) closes. This makes it ideal for persisting data when navigating out of the extension to other parts of Docker Desktop.
@z

@x
```typescript
localStorage.setItem("kubeconfig", kubeConfig);
```
@y
```typescript
localStorage.setItem("kubeconfig", kubeConfig);
```
@z

@x
```typescript
localStorage.getItem("kubeconfig");
```
@y
```typescript
localStorage.getItem("kubeconfig");
```
@z
