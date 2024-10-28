%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Extension architecture
linkTitle: Architecture
description: Docker extension architecture
keywords: Docker, extensions, sdk, metadata
@y
title: Extension architecture
linkTitle: Architecture
description: Docker extension architecture
keywords: Docker, extensions, sdk, metadata
@z

@x
Extensions are applications that run inside the Docker Desktop. They're packaged as Docker images, distributed
through Docker Hub, and installed by users either through the Marketplace within the Docker Desktop Dashboard or the
Docker Extensions CLI.
@y
Extensions are applications that run inside the Docker Desktop. They're packaged as Docker images, distributed
through Docker Hub, and installed by users either through the Marketplace within the Docker Desktop Dashboard or the
Docker Extensions CLI.
@z

@x
Extensions can be composed of three (optional) components:
- A frontend (or User Interface): A web application displayed in a tab of the dashboard in Docker Desktop
- A backend: One or many containerized services running in the Docker Desktop VM
- Executables: Shell scripts or binaries that Docker Desktop copies on the host when installing the extension
@y
Extensions can be composed of three (optional) components:
- A frontend (or User Interface): A web application displayed in a tab of the dashboard in Docker Desktop
- A backend: One or many containerized services running in the Docker Desktop VM
- Executables: Shell scripts or binaries that Docker Desktop copies on the host when installing the extension
@z

@x
![Overview of the three components of an extension](images/extensions-architecture.png?w=600h=400)
@y
![Overview of the three components of an extension](images/extensions-architecture.png?w=600h=400)
@z

@x
An extension doesn't necessarily need to have all these components, but at least one of them depending on the extension features. 
To configure and run those components, Docker Desktop uses a `metadata.json` file. See the
[metadata](metadata) section for more details.
@y
An extension doesn't necessarily need to have all these components, but at least one of them depending on the extension features. 
To configure and run those components, Docker Desktop uses a `metadata.json` file. See the
[metadata](metadata) section for more details.
@z

@x
## The frontend
@y
## The frontend
@z

@x
The frontend is basically a web application made from HTML, Javascript, and CSS. It can be built with a simple HTML
file, some vanilla Javascript or any frontend framework, such as React or Vue.js.
@y
The frontend is basically a web application made from HTML, Javascript, and CSS. It can be built with a simple HTML
file, some vanilla Javascript or any frontend framework, such as React or Vue.js.
@z

@x
When Docker Desktop installs the extension, it extracts the UI folder from the extension image, as defined by the 
`ui` section in the `metadata.json`. See the [ui metadata section](metadata.md#ui-section) for more details.
@y
When Docker Desktop installs the extension, it extracts the UI folder from the extension image, as defined by the 
`ui` section in the `metadata.json`. See the [ui metadata section](metadata.md#ui-section) for more details.
@z

@x
Every time users click on the **Extensions** tab, Docker Desktop initializes the extension's UI as if it was the first time. When they navigate away from the tab, both the UI itself and all the sub-processes started by it (if any) are terminated.
@y
Every time users click on the **Extensions** tab, Docker Desktop initializes the extension's UI as if it was the first time. When they navigate away from the tab, both the UI itself and all the sub-processes started by it (if any) are terminated.
@z

@x
The frontend can invoke `docker` commands, communicate with the extension backend, or invoke extension executables
deployed on the host, through the [Extensions SDK](https://www.npmjs.com/package/@docker/extension-api-client).
@y
The frontend can invoke `docker` commands, communicate with the extension backend, or invoke extension executables
deployed on the host, through the [Extensions SDK](https://www.npmjs.com/package/@docker/extension-api-client).
@z

@x
> [!TIP]
>
> The `docker extension init` generates a React based extension. But you can still use it as a starting point for
> your own extension and use any other frontend framework, like Vue, Angular, Svelte, etc. or event stay with
> vanilla Javascript.
@y
> [!TIP]
>
> The `docker extension init` generates a React based extension. But you can still use it as a starting point for
> your own extension and use any other frontend framework, like Vue, Angular, Svelte, etc. or event stay with
> vanilla Javascript.
@z

@x
Learn more about [building a frontend](/manuals/extensions/extensions-sdk/build/frontend-extension-tutorial.md) for your extension.
@y
Learn more about [building a frontend](manuals/extensions/extensions-sdk/build/frontend-extension-tutorial.md) for your extension.
@z

@x
## The backend
@y
## The backend
@z

@x
Alongside a frontend application, extensions can also contain one or many backend services. In most cases, the Extension does not need a backend, and features can be implemented just by invoking docker commands through the SDK. However, there are some cases when an extension requires a backend
	service, for example:
- To run long-running processes that must outlive the frontend
- To store data in a local database and serve them back with a REST API
- To store the extension state, like when a button starts a long-running process, so that if you navigate away
  from the extension and come back, the frontend can pick up where it left off
- To access specific resources in the Docker Desktop VM, for example by mounting folders in the compose
file
@y
Alongside a frontend application, extensions can also contain one or many backend services. In most cases, the Extension does not need a backend, and features can be implemented just by invoking docker commands through the SDK. However, there are some cases when an extension requires a backend
	service, for example:
- To run long-running processes that must outlive the frontend
- To store data in a local database and serve them back with a REST API
- To store the extension state, like when a button starts a long-running process, so that if you navigate away
  from the extension and come back, the frontend can pick up where it left off
- To access specific resources in the Docker Desktop VM, for example by mounting folders in the compose
file
@z

@x
> [!TIP]
>
> The `docker extension init` generates a Go backend. But you can still use it as a starting point for
> your own extension and use any other language like Node.js, Python, Java, .Net, or any other language and framework.
@y
> [!TIP]
>
> The `docker extension init` generates a Go backend. But you can still use it as a starting point for
> your own extension and use any other language like Node.js, Python, Java, .Net, or any other language and framework.
@z

@x
Usually, the backend is made of one container that runs within the Docker Desktop VM. Internally, Docker Desktop creates
a Docker Compose project, creates the container from the `image` option of the `vm` section of the `metadata.json`, and
attaches it to the Compose project. See the [ui metadata section](metadata.md#vm-section) for more details.
@y
Usually, the backend is made of one container that runs within the Docker Desktop VM. Internally, Docker Desktop creates
a Docker Compose project, creates the container from the `image` option of the `vm` section of the `metadata.json`, and
attaches it to the Compose project. See the [ui metadata section](metadata.md#vm-section) for more details.
@z

@x
In some cases, a `compose.yml` file can be used instead of an `image`. This is useful when the backend container
needs more specific options, such as mounting volumes or requesting [capabilities](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)
that can't be expressed just with a Docker image. The `compose.yml` file can also be used to add multiple containers
needed by the extension, like a database or a message broker. 
Note that, if the Compose file defines many services, the SDK can only contact the first of them.
@y
In some cases, a `compose.yml` file can be used instead of an `image`. This is useful when the backend container
needs more specific options, such as mounting volumes or requesting [capabilities](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)
that can't be expressed just with a Docker image. The `compose.yml` file can also be used to add multiple containers
needed by the extension, like a database or a message broker. 
Note that, if the Compose file defines many services, the SDK can only contact the first of them.
@z

@x
> [!NOTE]
>
> In some cases, it is useful to also interact with the Docker engine from the backend.
> See [How to use the Docker socket](../guides/use-docker-socket-from-backend.md) from the backend.
@y
> [!NOTE]
>
> In some cases, it is useful to also interact with the Docker engine from the backend.
> See [How to use the Docker socket](../guides/use-docker-socket-from-backend.md) from the backend.
@z

@x
To communicate with the backend, the Extension SDK provides [functions](../dev/api/backend.md#get) to make `GET`,
`POST`, `PUT`, `HEAD`, and `DELETE` requests from the frontend. Under the hood, the communication is done through a socket
or named pipe, depending on the operating system. If the backend was listening to a port, it would be difficult to
prevent collision with other applications running on the host or in a container already. Also, some users are
running Docker Desktop in constrained environments where they can't open ports on their machines.
@y
To communicate with the backend, the Extension SDK provides [functions](../dev/api/backend.md#get) to make `GET`,
`POST`, `PUT`, `HEAD`, and `DELETE` requests from the frontend. Under the hood, the communication is done through a socket
or named pipe, depending on the operating system. If the backend was listening to a port, it would be difficult to
prevent collision with other applications running on the host or in a container already. Also, some users are
running Docker Desktop in constrained environments where they can't open ports on their machines.
@z

@x
![Backend and frontend communication](images/extensions-arch-2.png?w=500h=300)
@y
![Backend and frontend communication](images/extensions-arch-2.png?w=500h=300)
@z

@x
Finally, the backend can be built with any technology, as long as it can run in a container and listen on a socket.
@y
Finally, the backend can be built with any technology, as long as it can run in a container and listen on a socket.
@z

@x
Learn more about [adding a backend](/manuals/extensions/extensions-sdk/build/backend-extension-tutorial.md) to your extension.
@y
Learn more about [adding a backend](manuals/extensions/extensions-sdk/build/backend-extension-tutorial.md) to your extension.
@z

@x
## Executables
@y
## Executables
@z

@x
In addition to the frontend and the backend, extensions can also contain executables. Executables are binaries or shell scripts
that are installed on the host when the extension is installed. The frontend can invoke them with [the extension SDK](../dev/api/backend.md#invoke-an-extension-binary-on-the-host).
@y
In addition to the frontend and the backend, extensions can also contain executables. Executables are binaries or shell scripts
that are installed on the host when the extension is installed. The frontend can invoke them with [the extension SDK](../dev/api/backend.md#invoke-an-extension-binary-on-the-host).
@z

@x
These executables are useful when the extension needs to interact with a third-party CLI tool, like AWS, `kubectl`, etc.
Shipping those executables with the extension ensure that the CLI tool is always available, at the right version, on
the users' machine.
@y
These executables are useful when the extension needs to interact with a third-party CLI tool, like AWS, `kubectl`, etc.
Shipping those executables with the extension ensure that the CLI tool is always available, at the right version, on
the users' machine.
@z

@x
When Docker Desktop installs the extension, it copies the executables on the host as defined by the `host` section in
the `metadata.json`. See the [ui metadata section](metadata.md#host-section) for more details.
@y
When Docker Desktop installs the extension, it copies the executables on the host as defined by the `host` section in
the `metadata.json`. See the [ui metadata section](metadata.md#host-section) for more details.
@z

@x
![Executable and frontend communication](images/extensions-arch-3.png?w=250h=300)
@y
![Executable and frontend communication](images/extensions-arch-3.png?w=250h=300)
@z

@x
However, since they're executed on the users' machine, they have to be available to the platform they're running on.
For example, if you want to ship the `kubectl` executable, you need to provide a different version for Windows, Mac,
and Linux. Multi arch images will also need to include binaries built for the right arch (AMD / ARM)
@y
However, since they're executed on the users' machine, they have to be available to the platform they're running on.
For example, if you want to ship the `kubectl` executable, you need to provide a different version for Windows, Mac,
and Linux. Multi arch images will also need to include binaries built for the right arch (AMD / ARM)
@z

@x
See the [host metadata section](metadata.md#host-section) for more details.
@y
See the [host metadata section](metadata.md#host-section) for more details.
@z

@x
Learn how to [invoke host binaries](../guides/invoke-host-binaries.md).
@y
Learn how to [invoke host binaries](../guides/invoke-host-binaries.md).
@z
