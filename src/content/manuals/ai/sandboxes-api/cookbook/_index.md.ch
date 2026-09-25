%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Sandboxes SDK cookbook
linkTitle: Cookbook
description: Build agent workflows with the Docker Sandboxes SDK for TypeScript.
keywords: cloud sandboxes, sandboxes sdk, typescript, agent kits
@y
title: Docker Sandboxes SDK cookbook
linkTitle: Cookbook
description: Build agent workflows with the Docker Sandboxes SDK for TypeScript.
keywords: cloud sandboxes, sandboxes sdk, typescript, agent kits
@z

@x
Use these recipes to add file transfers, processes, storage, and other sandbox
operations to your application. Each recipe shows the relevant SDK calls and
an expandable complete TypeScript example.
@y
Use these recipes to add file transfers, processes, storage, and other sandbox
operations to your application. Each recipe shows the relevant SDK calls and
an expandable complete TypeScript example.
@z

@x
Start with [Get started](../get-started.md) to run your first sandbox, or
[install the SDK](../install.md) to use these examples in an existing project.
For HTTP operations and request fields, see the
[API reference](/reference/api/sandboxes/latest/).
@y
Start with [Get started](../get-started.md) to run your first sandbox, or
[install the SDK](../install.md) to use these examples in an existing project.
For HTTP operations and request fields, see the
[API reference](__SUBDIR__/reference/api/sandboxes/latest/).
@z

@x
## Get started
@y
## Get started
@z

@x
Authenticate and launch a kit before exploring individual SDK operations.
@y
Authenticate and launch a kit before exploring individual SDK operations.
@z

@x
{{< recipe-list group="Get started" >}}
@y
{{< recipe-list group="Get started" >}}
@z

@x
## Working in a sandbox
@y
## Working in a sandbox
@z

@x
Use a running sandbox for commands, project files, and web applications.
@y
Use a running sandbox for commands, project files, and web applications.
@z

@x
{{< recipe-list group="Working in a sandbox" >}}
@y
{{< recipe-list group="Working in a sandbox" >}}
@z

@x
## Packaging and state
@y
## Packaging and state
@z

@x
Keep an environment or its state for later work.
@y
Keep an environment or its state for later work.
@z

@x
{{< recipe-list group="Packaging and state" >}}
@y
{{< recipe-list group="Packaging and state" >}}
@z

@x
## Security and policy
@y
## Security and policy
@z

@x
Give agents the access they need without embedding credentials in application code.
@y
Give agents the access they need without embedding credentials in application code.
@z

@x
{{< recipe-list group="Security and policy" >}}
@y
{{< recipe-list group="Security and policy" >}}
@z

@x
## Connect and configure
@y
## Connect and configure
@z

@x
Choose a different image, control lifetime, or connect additional storage and clients.
@y
Choose a different image, control lifetime, or connect additional storage and clients.
@z

@x
{{< recipe-list group="Connect and configure" >}}
@y
{{< recipe-list group="Connect and configure" >}}
@z

@x
## Requests and responses
@y
## Requests and responses
@z

@x
Handle request options and failures deliberately.
@y
Handle request options and failures deliberately.
@z

@x
{{< recipe-list group="Requests and responses" >}}
@y
{{< recipe-list group="Requests and responses" >}}
@z

@x
## Long-running work
@y
## Long-running work
@z

@x
Continue work across lost connections or coordinate several sandboxes.
@y
Continue work across lost connections or coordinate several sandboxes.
@z

@x
{{< recipe-list group="Long-running work" >}}
@y
{{< recipe-list group="Long-running work" >}}
@z
