%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker Sandboxes API and SDK
linkTitle: Sandboxes API and SDK
description: Use the Docker Sandboxes API and TypeScript SDK to manage cloud sandboxes programmatically.
keywords: docker sandboxes API, cloud sandboxes API, sandbox SDK, TypeScript SDK, JavaScript
@y
title: Docker Sandboxes API and SDK
linkTitle: Sandboxes API and SDK
description: Use the Docker Sandboxes API and TypeScript SDK to manage cloud sandboxes programmatically.
keywords: docker sandboxes API, cloud sandboxes API, sandbox SDK, TypeScript SDK, JavaScript
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@y
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@z

@x
Use the Docker Sandboxes API to create cloud sandboxes, run commands, and
transfer files from your applications and automated workflows. You can also
manage related resources, including images, snapshots, volumes, and secrets.
@y
Use the Docker Sandboxes API to create cloud sandboxes, run commands, and
transfer files from your applications and automated workflows. You can also
manage related resources, including images, snapshots, volumes, and secrets.
@z

@x
To try it, [run your first cloud sandbox](get-started.md) with the TypeScript
SDK. The tutorial uses a bundled kit that supplies a shell environment for
running commands.
@y
To try it, [run your first cloud sandbox](get-started.md) with the TypeScript
SDK. The tutorial uses a bundled kit that supplies a shell environment for
running commands.
@z

@x
## Activate cloud access
@y
## Activate cloud access
@z

@x
To use the API or SDK, [activate a Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access).
Use the same Docker account to [authenticate your application](authentication.md).
@y
To use the API or SDK, [activate a Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access).
Use the same Docker account to [authenticate your application](authentication.md).
@z

@x
Cloud compute is billed separately from your Docker subscription. See
[Billing](/manuals/agentic-platform/signup.md#billing) for details.
@y
Cloud compute is billed separately from your Docker subscription. See
[Billing](manuals/agentic-platform/signup.md#billing) for details.
@z

@x
## Choose an interface
@y
## Choose an interface
@z

@x
Use the TypeScript SDK in your JavaScript or TypeScript application. The SDK
provides typed requests and responses, waits for sandboxes to start or stop,
and handles file transfers and interactive processes.
See [Install the SDK](install.md) for installation instructions.
@y
Use the TypeScript SDK in your JavaScript or TypeScript application. The SDK
provides typed requests and responses, waits for sandboxes to start or stop,
and handles file transfers and interactive processes.
See [Install the SDK](install.md) for installation instructions.
@z

@x
You can also call the REST API directly from any language or HTTP tool.
See the [API reference](/reference/api/sandboxes/latest/) for operations,
request fields, responses, and the downloadable OpenAPI specification.
@y
You can also call the REST API directly from any language or HTTP tool.
See the [API reference](__SUBDIR__/reference/api/sandboxes/latest/) for operations,
request fields, responses, and the downloadable OpenAPI specification.
@z

@x
To run agents from your terminal, see [Docker Sandboxes](../sandboxes/_index.md).
@y
To run agents from your terminal, see [Docker Sandboxes](../sandboxes/_index.md).
@z

@x
## Develop your application
@y
## Develop your application
@z

@x
- [SDK cookbook](cookbook/_index.md): follow examples for processes, files,
  storage, networking, and other sandbox operations.
- [API concepts](concepts.md): choose a kit or image, identify resources, and
  wait for actions to finish.
- [Authentication and authorization](authentication.md): authenticate requests
  and understand which permissions your application needs.
- [Errors and retries](errors.md): handle failures and retry requests without
  duplicating work.
- [Compute sizes and limits](limits.md): choose resources and handle account
  quotas and request rate limits.
@y
- [SDK cookbook](cookbook/_index.md): follow examples for processes, files,
  storage, networking, and other sandbox operations.
- [API concepts](concepts.md): choose a kit or image, identify resources, and
  wait for actions to finish.
- [Authentication and authorization](authentication.md): authenticate requests
  and understand which permissions your application needs.
- [Errors and retries](errors.md): handle failures and retry requests without
  duplicating work.
- [Compute sizes and limits](limits.md): choose resources and handle account
  quotas and request rate limits.
@z
