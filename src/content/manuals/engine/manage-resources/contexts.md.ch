%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker contexts
description: Learn about managing multiple daemons from a single client with contexts
keywords: engine, context, cli, daemons, remote
aliases:
  - /engine/context/working-with-contexts/
---
@y
---
title: Docker contexts
description: Learn about managing multiple daemons from a single client with contexts
keywords: engine, context, cli, daemons, remote
aliases:
  - /engine/context/working-with-contexts/
---
@z

@x
## Introduction
@y
## Introduction
@z

@x
This guide shows how you can use contexts to manage Docker daemons from a single client.
@y
This guide shows how you can use contexts to manage Docker daemons from a single client.
@z

@x
Each context contains all information required to manage resources on the daemon.
The `docker context` command makes it easy to configure these contexts and switch between them.
@y
Each context contains all information required to manage resources on the daemon.
The `docker context` command makes it easy to configure these contexts and switch between them.
@z

@x
As an example, a single Docker client might be configured with two contexts:
@y
As an example, a single Docker client might be configured with two contexts:
@z

@x
- A default context running locally
- A remote, shared context
@y
- A default context running locally
- A remote, shared context
@z

@x
Once these contexts are configured,
you can use the `docker context use <context-name>` command
to switch between them.
@y
Once these contexts are configured,
you can use the `docker context use <context-name>` command
to switch between them.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To follow the examples in this guide, you'll need:
@y
To follow the examples in this guide, you'll need:
@z

@x
- A Docker client that supports the top-level `context` command
@y
- A Docker client that supports the top-level `context` command
@z

@x
Run `docker context` to verify that your Docker client supports contexts.
@y
Run `docker context` to verify that your Docker client supports contexts.
@z

@x
## The anatomy of a context
@y
## The anatomy of a context
@z

@x
A context is a combination of several properties. These include:
@y
A context is a combination of several properties. These include:
@z

@x
- Name and description
- Endpoint configuration
- TLS info
@y
- Name and description
- Endpoint configuration
- TLS info
@z

@x
To list available contexts, use the `docker context ls` command.
@y
To list available contexts, use the `docker context ls` command.
@z

@x
```console
$ docker context ls
NAME        DESCRIPTION                               DOCKER ENDPOINT               ERROR
default *                                             unix:///var/run/docker.sock
```
@y
```console
$ docker context ls
NAME        DESCRIPTION                               DOCKER ENDPOINT               ERROR
default *                                             unix:///var/run/docker.sock
```
@z

@x
This shows a single context called "default".
It's configured to talk to a daemon through the local `/var/run/docker.sock` Unix socket.
@y
This shows a single context called "default".
It's configured to talk to a daemon through the local `/var/run/docker.sock` Unix socket.
@z

@x
The asterisk in the `NAME` column indicates that this is the active context.
This means all `docker` commands run against this context,
unless overridden with environment variables such as `DOCKER_HOST` and `DOCKER_CONTEXT`,
or on the command-line with the `--context` and `--host` flags.
@y
The asterisk in the `NAME` column indicates that this is the active context.
This means all `docker` commands run against this context,
unless overridden with environment variables such as `DOCKER_HOST` and `DOCKER_CONTEXT`,
or on the command-line with the `--context` and `--host` flags.
@z

@x
Dig a bit deeper with `docker context inspect`.
The following example shows how to inspect the context called `default`.
@y
Dig a bit deeper with `docker context inspect`.
The following example shows how to inspect the context called `default`.
@z

@x
```console
$ docker context inspect default
[
    {
        "Name": "default",
        "Metadata": {},
        "Endpoints": {
            "docker": {
                "Host": "unix:///var/run/docker.sock",
                "SkipTLSVerify": false
            }
        },
        "TLSMaterial": {},
        "Storage": {
            "MetadataPath": "\u003cIN MEMORY\u003e",
            "TLSPath": "\u003cIN MEMORY\u003e"
        }
    }
]
```
@y
```console
$ docker context inspect default
[
    {
        "Name": "default",
        "Metadata": {},
        "Endpoints": {
            "docker": {
                "Host": "unix:///var/run/docker.sock",
                "SkipTLSVerify": false
            }
        },
        "TLSMaterial": {},
        "Storage": {
            "MetadataPath": "\u003cIN MEMORY\u003e",
            "TLSPath": "\u003cIN MEMORY\u003e"
        }
    }
]
```
@z

@x
### Create a new context
@y
### Create a new context
@z

@x
You can create new contexts with the `docker context create` command.
@y
You can create new contexts with the `docker context create` command.
@z

@x
The following example creates a new context called `docker-test` and specifies
the host endpoint of the context to TCP socket `tcp://docker:2375`.
@y
The following example creates a new context called `docker-test` and specifies
the host endpoint of the context to TCP socket `tcp://docker:2375`.
@z

@x
```console
$ docker context create docker-test --docker host=tcp://docker:2375
docker-test
Successfully created context "docker-test"
```
@y
```console
$ docker context create docker-test --docker host=tcp://docker:2375
docker-test
Successfully created context "docker-test"
```
@z

@x
The new context is stored in a `meta.json` file below `~/.docker/contexts/`.
Each new context you create gets its own `meta.json` stored in a dedicated sub-directory of `~/.docker/contexts/`.
@y
The new context is stored in a `meta.json` file below `~/.docker/contexts/`.
Each new context you create gets its own `meta.json` stored in a dedicated sub-directory of `~/.docker/contexts/`.
@z

@x
You can view the new context with `docker context ls` and `docker context inspect <context-name>`.
@y
You can view the new context with `docker context ls` and `docker context inspect <context-name>`.
@z

@x
```console
$ docker context ls
NAME          DESCRIPTION                             DOCKER ENDPOINT               ERROR
default *                                             unix:///var/run/docker.sock
docker-test                                           tcp://docker:2375
```
@y
```console
$ docker context ls
NAME          DESCRIPTION                             DOCKER ENDPOINT               ERROR
default *                                             unix:///var/run/docker.sock
docker-test                                           tcp://docker:2375
```
@z

@x
The current context is indicated with an asterisk ("\*").
@y
The current context is indicated with an asterisk ("\*").
@z

@x
## Use a different context
@y
## Use a different context
@z

@x
You can use `docker context use` to switch between contexts.
@y
You can use `docker context use` to switch between contexts.
@z

@x
The following command will switch the `docker` CLI to use the `docker-test` context.
@y
The following command will switch the `docker` CLI to use the `docker-test` context.
@z

@x
```console
$ docker context use docker-test
docker-test
Current context is now "docker-test"
```
@y
```console
$ docker context use docker-test
docker-test
Current context is now "docker-test"
```
@z

@x
Verify the operation by listing all contexts and ensuring the asterisk ("\*") is against the `docker-test` context.
@y
Verify the operation by listing all contexts and ensuring the asterisk ("\*") is against the `docker-test` context.
@z

@x
```console
$ docker context ls
NAME            DESCRIPTION                           DOCKER ENDPOINT               ERROR
default                                               unix:///var/run/docker.sock
docker-test *                                         tcp://docker:2375
```
@y
```console
$ docker context ls
NAME            DESCRIPTION                           DOCKER ENDPOINT               ERROR
default                                               unix:///var/run/docker.sock
docker-test *                                         tcp://docker:2375
```
@z

@x
`docker` commands will now target endpoints defined in the `docker-test` context.
@y
`docker` commands will now target endpoints defined in the `docker-test` context.
@z

@x
You can also set the current context using the `DOCKER_CONTEXT` environment variable.
The environment variable overrides the context set with `docker context use`.
@y
You can also set the current context using the `DOCKER_CONTEXT` environment variable.
The environment variable overrides the context set with `docker context use`.
@z

@x
Use the appropriate command below to set the context to `docker-test` using an environment variable.
@y
Use the appropriate command below to set the context to `docker-test` using an environment variable.
@z

@x
{{< tabs >}}
{{< tab name="PowerShell" >}}
@y
{{< tabs >}}
{{< tab name="PowerShell" >}}
@z

@x
```ps
> $env:DOCKER_CONTEXT='docker-test'
```
@y
```ps
> $env:DOCKER_CONTEXT='docker-test'
```
@z

@x
{{< /tab >}}
{{< tab name="Bash" >}}
@y
{{< /tab >}}
{{< tab name="Bash" >}}
@z

@x
```console
$ export DOCKER_CONTEXT=docker-test
```
@y
```console
$ export DOCKER_CONTEXT=docker-test
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Run `docker context ls` to verify that the `docker-test` context is now the
active context.
@y
Run `docker context ls` to verify that the `docker-test` context is now the
active context.
@z

@x
You can also use the global `--context` flag to override the context.
The following command uses a context called `production`.
@y
You can also use the global `--context` flag to override the context.
The following command uses a context called `production`.
@z

@x
```console
$ docker --context production container ls
```
@y
```console
$ docker --context production container ls
```
@z

@x
## Exporting and importing Docker contexts
@y
## Exporting and importing Docker contexts
@z

@x
You can use the `docker context export` and `docker context import` commands
to export and import contexts on different hosts.
@y
You can use the `docker context export` and `docker context import` commands
to export and import contexts on different hosts.
@z

@x
The `docker context export` command exports an existing context to a file.
The file can be imported on any host that has the `docker` client installed.
@y
The `docker context export` command exports an existing context to a file.
The file can be imported on any host that has the `docker` client installed.
@z

@x
### Exporting and importing a context
@y
### Exporting and importing a context
@z

@x
The following example exports an existing context called `docker-test`.
It will be written to a file called `docker-test.dockercontext`.
@y
The following example exports an existing context called `docker-test`.
It will be written to a file called `docker-test.dockercontext`.
@z

@x
```console
$ docker context export docker-test
Written file "docker-test.dockercontext"
```
@y
```console
$ docker context export docker-test
Written file "docker-test.dockercontext"
```
@z

@x
Check the contents of the export file.
@y
Check the contents of the export file.
@z

@x
```console
$ cat docker-test.dockercontext
```
@y
```console
$ cat docker-test.dockercontext
```
@z

@x
Import this file on another host using `docker context import`
to create context with the same configuration.
@y
Import this file on another host using `docker context import`
to create context with the same configuration.
@z

@x
```console
$ docker context import docker-test docker-test.dockercontext
docker-test
Successfully imported context "docker-test"
```
@y
```console
$ docker context import docker-test docker-test.dockercontext
docker-test
Successfully imported context "docker-test"
```
@z

@x
You can verify that the context was imported with `docker context ls`.
@y
You can verify that the context was imported with `docker context ls`.
@z

@x
The format of the import command is `docker context import <context-name> <context-file>`.
@y
The format of the import command is `docker context import <context-name> <context-file>`.
@z

@x
## Updating a context
@y
## Updating a context
@z

@x
You can use `docker context update` to update fields in an existing context.
@y
You can use `docker context update` to update fields in an existing context.
@z

@x
The following example updates the description field in the existing `docker-test` context.
@y
The following example updates the description field in the existing `docker-test` context.
@z

@x
```console
$ docker context update docker-test --description "Test context"
docker-test
Successfully updated context "docker-test"
```
@y
```console
$ docker context update docker-test --description "Test context"
docker-test
Successfully updated context "docker-test"
```
@z
