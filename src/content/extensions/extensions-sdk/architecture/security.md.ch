%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Extension security
description: Aspects of the security model of extensions
keywords: Docker, extensions, sdk, security
@y
title: Extension security
description: Aspects of the security model of extensions
keywords: Docker, extensions, sdk, security
@z

@x
## Extension capabilities
@y
## Extension capabilities
@z

@x
An extension can have the following optional parts: 
* A user interface in HTML or JavaScript, displayed in Docker Desktop Dashboard
* A backend part that runs as a container
* Executables deployed on the host machine.
@y
An extension can have the following optional parts: 
* A user interface in HTML or JavaScript, displayed in Docker Desktop Dashboard
* A backend part that runs as a container
* Executables deployed on the host machine.
@z

@x
Extensions are executed with the same permissions as the Docker Desktop user. Extension capabilities include running any Docker commands (including running containers and mounting folders), running extension binaries, and accessing files on your machine that are accessible by the user running Docker Desktop.
@y
Extensions are executed with the same permissions as the Docker Desktop user. Extension capabilities include running any Docker commands (including running containers and mounting folders), running extension binaries, and accessing files on your machine that are accessible by the user running Docker Desktop.
@z

@x
The Extensions SDK provides a set of JavaScript APIs to invoke commands or invoke these binaries from the extension UI code. Extensions can also provide a backend part that starts a long-lived running container in the background.
@y
The Extensions SDK provides a set of JavaScript APIs to invoke commands or invoke these binaries from the extension UI code. Extensions can also provide a backend part that starts a long-lived running container in the background.
@z

@x
> **Important**
>
> Make sure you trust the publisher or author of the extension when you install it, as the extension has the same access rights as the user running Docker Desktop.
{ .important }
@y
> **Important**
>
> Make sure you trust the publisher or author of the extension when you install it, as the extension has the same access rights as the user running Docker Desktop.
{ .important }
@z
