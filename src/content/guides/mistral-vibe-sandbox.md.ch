%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run Mistral Vibe in a Docker Sandbox
description: Package Mistral's Vibe coding agent as a Docker Sandbox kit so it runs in an isolated microVM and reaches the Mistral API through the sandbox proxy, keeping your API key off the VM.
summary: |
  Build a pinned, reusable image for Mistral's Vibe CLI and wire it into a
  Docker Sandbox agent kit. Vibe runs in an isolated microVM and reaches the
  Mistral API through the sandbox proxy, so your API key never enters the VM.
keywords: ai, mistral, vibe, docker sandboxes, sbx, coding agent, microvm, security, kits, uv
@y
title: Run Mistral Vibe in a Docker Sandbox
description: Package Mistral's Vibe coding agent as a Docker Sandbox kit so it runs in an isolated microVM and reaches the Mistral API through the sandbox proxy, keeping your API key off the VM.
summary: |
  Build a pinned, reusable image for Mistral's Vibe CLI and wire it into a
  Docker Sandbox agent kit. Vibe runs in an isolated microVM and reaches the
  Mistral API through the sandbox proxy, so your API key never enters the VM.
keywords: ai, mistral, vibe, docker sandboxes, sbx, coding agent, microvm, security, kits, uv
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
Mistral Vibe is Mistral's open source coding agent. This guide shows how to
package it as a Docker Sandbox agent so it runs in an isolated microVM instead
of directly on your host. The agent reaches the Mistral API through the
sandbox proxy, so your API key stays on the host and never enters the VM.
@y
Mistral Vibe is Mistral's open source coding agent. This guide shows how to
package it as a Docker Sandbox agent so it runs in an isolated microVM instead
of directly on your host. The agent reaches the Mistral API through the
sandbox proxy, so your API key stays on the host and never enters the VM.
@z

@x
Rather than install the agent fresh on every run, you'll bake a pinned image
once and reuse it. Pinning the agent version and building a dedicated image
gives you reproducible sandboxes and faster startups, and it's the approach
Docker recommends for building your own agent.
@y
Rather than install the agent fresh on every run, you'll bake a pinned image
once and reuse it. Pinning the agent version and building a dedicated image
gives you reproducible sandboxes and faster startups, and it's the approach
Docker recommends for building your own agent.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Store your Mistral API key on the host as a sandbox secret
- Build a pinned, multi-architecture image that ships Vibe on the `shell` template
- Write an agent kit that wires Vibe to the Mistral API through the proxy
- Validate, launch, and iterate on the sandbox
@y
- Store your Mistral API key on the host as a sandbox secret
- Build a pinned, multi-architecture image that ships Vibe on the `shell` template
- Write an agent kit that wires Vibe to the Mistral API through the proxy
- Validate, launch, and iterate on the sandbox
@z

@x
This guide uses the v2 format. For its reference and migration
guidance, see [Kits v2](../manuals/ai/sandboxes/customize/kits-v2.md).
@y
This guide uses the v2 format. For its reference and migration
guidance, see [Kits v2](../manuals/ai/sandboxes/customize/kits-v2.md).
@z

@x
## How isolation works
@y
## How isolation works
@z

@x
Every outbound request from a sandbox passes through a proxy that runs on
your host. The proxy enforces network policy and injects credentials, so the
agent inside the VM never handles the real key.
@y
Every outbound request from a sandbox passes through a proxy that runs on
your host. The proxy enforces network policy and injects credentials, so the
agent inside the VM never handles the real key.
@z

@x
Mistral is a
[built-in service](../manuals/ai/sandboxes/configuration/credentials.md#built-in-services):
`sbx` already maps the `mistral` service name to the `MISTRAL_API_KEY`
environment variable and the `api.mistral.ai` domain. Inside the VM, Vibe
sees only a sentinel value for `MISTRAL_API_KEY`. The proxy swaps in the real
key, and only for requests to `api.mistral.ai`. If the agent reads the
variable for any other purpose, it gets the sentinel.
@y
Mistral is a
[built-in service](../manuals/ai/sandboxes/configuration/credentials.md#built-in-services):
`sbx` already maps the `mistral` service name to the `MISTRAL_API_KEY`
environment variable and the `api.mistral.ai` domain. Inside the VM, Vibe
sees only a sentinel value for `MISTRAL_API_KEY`. The proxy swaps in the real
key, and only for requests to `api.mistral.ai`. If the agent reads the
variable for any other purpose, it gets the sentinel.
@z

@x
Built-in doesn't mean automatic. The kit you write in
[Step 4](#step-4-write-the-agent-kit) still declares where the key comes from
and how the proxy attaches it to requests.
@y
Built-in doesn't mean automatic. The kit you write in
[Step 4](#step-4-write-the-agent-kit) still declares where the key comes from
and how the proxy attaches it to requests.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you start, make sure you have:
@y
Before you start, make sure you have:
@z

@x
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Sandboxes (`sbx`) installed and signed in](../manuals/ai/sandboxes/install.md)
- A [Mistral API key](https://console.mistral.ai/)
- A Docker Hub namespace, or another registry, to publish the image to
@y
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Sandboxes (`sbx`) installed and signed in](../manuals/ai/sandboxes/install.md)
- A [Mistral API key](https://console.mistral.ai/)
- A Docker Hub namespace, or another registry, to publish the image to
@z

@x
## Step 1: Store the Mistral key on the host
@y
## Step 1: Store the Mistral key on the host
@z

@x
Provide the key once on the host. Because Mistral is a built-in service,
`sbx` resolves it under the `mistral` name without any extra wiring:
@y
Provide the key once on the host. Because Mistral is a built-in service,
`sbx` resolves it under the `mistral` name without any extra wiring:
@z

@x
```console
$ sbx secret set mistral
```
@y
```console
$ sbx secret set mistral
```
@z

@x
Service secrets are global by default, so any sandbox that declares the
`mistral` service can use it. Use `--sandbox` to scope a secret to a single
sandbox instead. For how the proxy resolves and injects credentials, see
[Credentials](../manuals/ai/sandboxes/configuration/credentials.md).
@y
Service secrets are global by default, so any sandbox that declares the
`mistral` service can use it. Use `--sandbox` to scope a secret to a single
sandbox instead. For how the proxy resolves and injects credentials, see
[Credentials](../manuals/ai/sandboxes/configuration/credentials.md).
@z

@x
## Step 2: Write a pinned Vibe image
@y
## Step 2: Write a pinned Vibe image
@z

@x
Vibe is a Python application. The official `shell` template already ships
`uv`, `git`, `ripgrep`, and Python, so build on top of it and install a
pinned Vibe version with `uv`.
@y
Vibe is a Python application. The official `shell` template already ships
`uv`, `git`, `ripgrep`, and Python, so build on top of it and install a
pinned Vibe version with `uv`.
@z

@x
Create a `Dockerfile`:
@y
Create a `Dockerfile`:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
ARG BASE_IMAGE=docker/sandbox-templates:shell
FROM ${BASE_IMAGE}
@y
```dockerfile
# syntax=docker/dockerfile:1
ARG BASE_IMAGE=docker/sandbox-templates:shell
FROM ${BASE_IMAGE}
@z

@x
# Pin the agent version for reproducible sandboxes.
# Check https://pypi.org/project/mistral-vibe/ and bump as needed.
ARG VIBE_VERSION=2.24.5
@y
# Pin the agent version for reproducible sandboxes.
# Check https://pypi.org/project/mistral-vibe/ and bump as needed.
ARG VIBE_VERSION=2.24.5
@z

@x
# Install Vibe as the non-root agent user. The socks extra is installed
# explicitly so the agent works through the sandbox proxy.
USER agent
RUN uv tool install "mistral-vibe==${VIBE_VERSION}" --with "httpx[socks]" \
    && vibe --version
@y
# Install Vibe as the non-root agent user. The socks extra is installed
# explicitly so the agent works through the sandbox proxy.
USER agent
RUN uv tool install "mistral-vibe==${VIBE_VERSION}" --with "httpx[socks]" \
    && vibe --version
@z

@x
CMD ["vibe", "--agent", "auto-approve"]
```
@y
CMD ["vibe", "--agent", "auto-approve"]
```
@z

@x
Three choices are worth calling out:
@y
Three choices are worth calling out:
@z

@x
- Pinning `mistral-vibe` to an explicit version keeps the image
  reproducible. To move to a newer release, change `VIBE_VERSION` and rebuild.
- Installing the `httpx[socks]` extra explicitly avoids a startup failure
  when the agent runs behind the sandbox proxy. Some Vibe releases don't pull
  it in on their own.
- The `CMD` launches Vibe with `--agent auto-approve`, so the agent approves
  tool executions automatically. Baking the flags into the image keeps the
  kit's launch behavior in one place, so the kit doesn't override the
  entrypoint.
@y
- Pinning `mistral-vibe` to an explicit version keeps the image
  reproducible. To move to a newer release, change `VIBE_VERSION` and rebuild.
- Installing the `httpx[socks]` extra explicitly avoids a startup failure
  when the agent runs behind the sandbox proxy. Some Vibe releases don't pull
  it in on their own.
- The `CMD` launches Vibe with `--agent auto-approve`, so the agent approves
  tool executions automatically. Baking the flags into the image keeps the
  kit's launch behavior in one place, so the kit doesn't override the
  entrypoint.
@z

@x
## Step 3: Build and publish the image
@y
## Step 3: Build and publish the image
@z

@x
Build for both common architectures and publish to your namespace. The
build attaches provenance and SBOM attestations, which record how the image
was built and what it contains. Replace `YOUR_NAMESPACE` with your Docker Hub
username:
@y
Build for both common architectures and publish to your namespace. The
build attaches provenance and SBOM attestations, which record how the image
was built and what it contains. Replace `YOUR_NAMESPACE` with your Docker Hub
username:
@z

@x
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --provenance=true \
  --sbom=true \
  -t YOUR_NAMESPACE/sbx-mistral-vibe:0.1.0 \
  --push .
```
@y
```console
$ docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --provenance=true \
  --sbom=true \
  -t YOUR_NAMESPACE/sbx-mistral-vibe:0.1.0 \
  --push .
```
@z

@x
Tag the image with a real version rather than a moving tag, so the kit in the
next step always resolves to the same build.
@y
Tag the image with a real version rather than a moving tag, so the kit in the
next step always resolves to the same build.
@z

@x
## Step 4: Write the agent kit
@y
## Step 4: Write the agent kit
@z

@x
The kit ties the image, network policy, and credentials together. The image
already sets the launch command in its `CMD`. Create a directory for the kit
with a `spec.yaml` inside. Replace
`YOUR_NAMESPACE` with the namespace you published to:
@y
The kit ties the image, network policy, and credentials together. The image
already sets the launch command in its `CMD`. Create a directory for the kit
with a `spec.yaml` inside. Replace
`YOUR_NAMESPACE` with the namespace you published to:
@z

@x
```yaml {title="mistral-vibe/spec.yaml"}
schemaVersion: "2"
kind: sandbox
name: mistral-vibe
displayName: Mistral Vibe
@y
```yaml {title="mistral-vibe/spec.yaml"}
schemaVersion: "2"
kind: sandbox
name: mistral-vibe
displayName: Mistral Vibe
@z

@x
sandbox:
  image: docker.io/YOUR_NAMESPACE/sbx-mistral-vibe:0.1.0
@y
sandbox:
  image: docker.io/YOUR_NAMESPACE/sbx-mistral-vibe:0.1.0
@z

@x
agentInstructions:
  filename: AGENTS.md
  content: |
    You are running inside an isolated Docker Sandbox microVM.
    Network access is restricted to the Mistral API. Prefer tools and
    packages already available in the workspace.
@y
agentInstructions:
  filename: AGENTS.md
  content: |
    You are running inside an isolated Docker Sandbox microVM.
    Network access is restricted to the Mistral API. Prefer tools and
    packages already available in the workspace.
@z

@x
permissions:
  network:
    allow:
      - "api.mistral.ai:443"
@y
permissions:
  network:
    allow:
      - "api.mistral.ai:443"
@z

@x
credentials:
  - service: mistral
    apiKey:
      name: MISTRAL_API_KEY
      inject:
        - domain: api.mistral.ai
          scheme: bearer
```
@y
credentials:
  - service: mistral
    apiKey:
      name: MISTRAL_API_KEY
      inject:
        - domain: api.mistral.ai
          scheme: bearer
```
@z

@x
Each field does the following:
@y
Each field does the following:
@z

@x
| Field                       | Purpose                                                                                                        |
| --------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `kind: sandbox`             | Declares a sandbox agent: a complete image plus its launch configuration.                                      |
| `name`                      | The kit's identifier. Pass the kit directory to `sbx run`.                                                         |
| `sandbox.image`             | The pinned image you published in Step 3. Its `CMD` launches Vibe, so the kit doesn't set an entrypoint.       |
| `agentInstructions.filename`| The instructions file Vibe reads in the project.                                                               |
| `agentInstructions.content` | Markdown appended to `AGENTS.md` at creation to prime the agent about its environment.                         |
| `permissions.network.allow` | The hosts the sandbox may reach. Without it, requests are blocked by the default deny policy.                  |
| `credentials[].service`     | The built-in service that supplies the key. `mistral` maps to `MISTRAL_API_KEY` and `api.mistral.ai`.          |
| `credentials[].apiKey.name` | The environment variable the proxy manages. Vibe sees a sentinel value; the proxy swaps in the real key.       |
| `credentials[].apiKey.inject`| Where and how the proxy attaches the key. `scheme: bearer` sets `Authorization: Bearer <key>` for the domain. |
@y
| Field                       | Purpose                                                                                                        |
| --------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `kind: sandbox`             | Declares a sandbox agent: a complete image plus its launch configuration.                                      |
| `name`                      | The kit's identifier. Pass the kit directory to `sbx run`.                                                         |
| `sandbox.image`             | The pinned image you published in Step 3. Its `CMD` launches Vibe, so the kit doesn't set an entrypoint.       |
| `agentInstructions.filename`| The instructions file Vibe reads in the project.                                                               |
| `agentInstructions.content` | Markdown appended to `AGENTS.md` at creation to prime the agent about its environment.                         |
| `permissions.network.allow` | The hosts the sandbox may reach. Without it, requests are blocked by the default deny policy.                  |
| `credentials[].service`     | The built-in service that supplies the key. `mistral` maps to `MISTRAL_API_KEY` and `api.mistral.ai`.          |
| `credentials[].apiKey.name` | The environment variable the proxy manages. Vibe sees a sentinel value; the proxy swaps in the real key.       |
| `credentials[].apiKey.inject`| Where and how the proxy attaches the key. `scheme: bearer` sets `Authorization: Bearer <key>` for the domain. |
@z

@x
> [!WARNING]
> `--agent auto-approve` runs Vibe in a mode that approves every tool
> execution without prompting. The sandbox isolates the agent from your host,
> but review the agent's actions before you run it against sensitive
> workspaces.
@y
> [!WARNING]
> `--agent auto-approve` runs Vibe in a mode that approves every tool
> execution without prompting. The sandbox isolates the agent from your host,
> but review the agent's actions before you run it against sensitive
> workspaces.
@z

@x
## Step 5: Validate and run
@y
## Step 5: Validate and run
@z

@x
Validate the kit before you launch it:
@y
Validate the kit before you launch it:
@z

@x
```console
$ sbx kit validate ./mistral-vibe
```
@y
```console
$ sbx kit validate ./mistral-vibe
```
@z

@x
Then, from your project directory, launch the agent with the kit:
@y
Then, from your project directory, launch the agent with the kit:
@z

% snip command...

@x
- `./mistral-vibe` is the sandbox kit reference, pointing to the folder that
  contains `spec.yaml`.
- `--name mistral-vibe` names the sandbox. Without it, `sbx` derives a name
  from the agent and the working directory, and the commands below won't match.
- `.` is the project directory to mount in the sandbox.
@y
- `./mistral-vibe` is the sandbox kit reference, pointing to the folder that
  contains `spec.yaml`.
- `--name mistral-vibe` names the sandbox. Without it, `sbx` derives a name
  from the agent and the working directory, and the commands below won't match.
- `.` is the project directory to mount in the sandbox.
@z

@x
Vibe starts in an isolated microVM, talks to the Mistral API through the
proxy, and the real key never touches the container.
@y
Vibe starts in an isolated microVM, talks to the Mistral API through the
proxy, and the real key never touches the container.
@z

@x
## Iterate on the kit
@y
## Iterate on the kit
@z

@x
If the agent can't reach a domain it needs, or a request behaves
unexpectedly, inspect what the proxy saw:
@y
If the agent can't reach a domain it needs, or a request behaves
unexpectedly, inspect what the proxy saw:
@z

@x
```console
$ sbx policy log
```
@y
```console
$ sbx policy log
```
@z

@x
Each entry shows the request, the rule it matched, and how the proxy handled
it. Use it to spot a host missing from `permissions.network.allow`. After you
change `spec.yaml`, recreate the sandbox for a clean start:
@y
Each entry shows the request, the rule it matched, and how the proxy handled
it. Use it to spot a host missing from `permissions.network.allow`. After you
change `spec.yaml`, recreate the sandbox for a clean start:
@z

% snip command...

@x
## Clean up
@y
## Clean up
@z

@x
Sandboxes persist after Vibe exits. To stop one without deleting it:
@y
Sandboxes persist after Vibe exits. To stop one without deleting it:
@z

@x
```console
$ sbx stop mistral-vibe
```
@y
```console
$ sbx stop mistral-vibe
```
@z

@x
To remove the sandbox and everything inside it:
@y
To remove the sandbox and everything inside it:
@z

@x
```console
$ sbx rm mistral-vibe
```
@y
```console
$ sbx rm mistral-vibe
```
@z

@x
Files in your workspace are unaffected.
@y
Files in your workspace are unaffected.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Get started with Docker Sandboxes](../manuals/ai/sandboxes/get-started.md)
- [Build a v3 agent workload](/manuals/ai/sandboxes/customize/author/build-an-agent.md)
- [Customize sandboxes with kits](/manuals/ai/sandboxes/customize/_index.md)
- [Credentials and built-in services](../manuals/ai/sandboxes/configuration/credentials.md#built-in-services)
- [Mistral Vibe](https://github.com/mistralai/mistral-vibe)
@y
- [Get started with Docker Sandboxes](../manuals/ai/sandboxes/get-started.md)
- [Build a v3 agent workload](/manuals/ai/sandboxes/customize/author/build-an-agent.md)
- [Customize sandboxes with kits](/manuals/ai/sandboxes/customize/_index.md)
- [Credentials and built-in services](../manuals/ai/sandboxes/configuration/credentials.md#built-in-services)
- [Mistral Vibe](https://github.com/mistralai/mistral-vibe)
@z
