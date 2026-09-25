%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run agents with kits"
linkTitle: "Run agents with kits"
description: "Discover the available kits, launch an agent sandbox, and run work inside it."
keywords: "cloud sandboxes, sandboxes api, run agents with kits"
@y
title: "Run agents with kits"
linkTitle: "Run agents with kits"
description: "Discover the available kits, launch an agent sandbox, and run work inside it."
keywords: "cloud sandboxes, sandboxes api, run agents with kits"
@z

@x
A kit supplies an agent's image and configuration, including tools and the settings they need. Launching a kit gives you a repeatable starting point without assembling those settings in every application.
@y
A kit supplies an agent's image and configuration, including tools and the settings they need. Launching a kit gives you a repeatable starting point without assembling those settings in every application.
@z

@x
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Agent workloads also need credentials for their model provider. Docker authentication gives access to sandboxes; it does not sign you in to Anthropic, OpenAI, or another agent provider.
@y
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Agent workloads also need credentials for their model provider. Docker authentication gives access to sandboxes; it does not sign you in to Anthropic, OpenAI, or another agent provider.
@z

@x
## Discover available kits {#1-discover-available-kits}
@y
## Discover available kits {#1-discover-available-kits}
@z

@x
List the kits bundled with your installed SDK. Use an entry's name when launching it. Listing the catalog does not create a sandbox.
@y
List the kits bundled with your installed SDK. Use an entry's name when launching it. Listing the catalog does not create a sandbox.
@z

@x
The SDK's launch-by-name helper includes these starting points:
@y
The SDK's launch-by-name helper includes these starting points:
@z

@x
| Kit name | Environment |
| --- | --- |
| `claude` | Claude Code |
| `codex` | Codex |
| `cursor` | Cursor |
| `devin` | Devin |
| `docker-agent` | Docker Agent |
| `gemini` | Gemini CLI |
| `opencode` | OpenCode |
| `shell` | A shell environment for your own commands |
@y
| Kit name | Environment |
| --- | --- |
| `claude` | Claude Code |
| `codex` | Codex |
| `cursor` | Cursor |
| `devin` | Devin |
| `docker-agent` | Docker Agent |
| `gemini` | Gemini CLI |
| `opencode` | OpenCode |
| `shell` | A shell environment for your own commands |
@z

@x
Use the catalog result as the list for your installed version. Upgrading the SDK can update the bundled kits.
@y
Use the catalog result as the list for your installed version. Upgrading the SDK can update the bundled kits.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return client.kits.list();
```
@y
```typescript
return client.kits.list();
```
@z

@x
<details>
<summary>Complete TypeScript example: kits/catalog.ts</summary>
@y
<details>
<summary>Complete TypeScript example: kits/catalog.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export function listKits(client: Sandboxes) {
  return client.kits.list();
}
```
@y
export function listKits(client: Sandboxes) {
  return client.kits.list();
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Launch a kit {#2-launch-a-kit}
@y
## Launch a kit {#2-launch-a-kit}
@z

@x
To run Claude Code, choose `claude` and attach a stored `anthropic` secret containing your Anthropic API key. [Store the provider credential](get-a-stored-secret-into-a-sandbox.md) first, then pass the stored secret's resource name to the launch example. Keep credentials out of command arguments and plain environment values.
@y
To run Claude Code, choose `claude` and attach a stored `anthropic` secret containing your Anthropic API key. [Store the provider credential](get-a-stored-secret-into-a-sandbox.md) first, then pass the stored secret's resource name to the launch example. Keep credentials out of command arguments and plain environment values.
@z

@x
Pass a catalog name, a display name, and any stored secret names the agent needs. The example selects Small (2 vCPUs, 4 GiB) and uses the launch-and-wait helper to return a running sandbox under one deadline. Small is also the default when you omit kit resources. See [compute sizes](work-within-the-limits.md) for the other choices.
@y
Pass a catalog name, a display name, and any stored secret names the agent needs. The example selects Small (2 vCPUs, 4 GiB) and uses the launch-and-wait helper to return a running sandbox under one deadline. Small is also the default when you omit kit resources. See [compute sizes](work-within-the-limits.md) for the other choices.
@z

@x
Use `launch` when you want the accepted handle immediately and will wait separately. If the wait fails, inspect the accepted sandbox retained by the error before launching another one.
@y
Use `launch` when you want the accepted handle immediately and will wait separately. If the wait fails, inspect the accepted sandbox retained by the error before launching another one.
@z

@x
`launchAndWait()` waits for the sandbox to reach the running state. A kit can still be installing tools or cloning a repository at that point. The SDK has no helper that waits for all kit setup to finish.
@y
`launchAndWait()` waits for the sandbox to reach the running state. A kit can still be installing tools or cloning a repository at that point. The SDK has no helper that waits for all kit setup to finish.
@z

@x
If your work depends on that setup, check the result it needs before starting. For example, a kit can write a completion marker after cloning a repository, or a service can expose a health check. Poll with a delay between checks and a timeout so failed setup does not leave your application waiting indefinitely.
@y
If your work depends on that setup, check the result it needs before starting. For example, a kit can write a completion marker after cloning a repository, or a service can expose a health check. Poll with a delay between checks and a timeout so failed setup does not leave your application waiting indefinitely.
@z

@x
The launch helper accepts only names returned by the bundled catalog, not community repository URLs or registry references. Account network policies still apply to kit sandboxes.
@y
The launch helper accepts only names returned by the bundled catalog, not community repository URLs or registry references. Account network policies still apply to kit sandboxes.
@z

@x
Use `shell` when you need an environment for scripts, builds, or your own executable. To use a container image directly, see [Run your own container image](run-your-own-container-image.md).
@y
Use `shell` when you need an environment for scripts, builds, or your own executable. To use a container image directly, see [Run your own container image](run-your-own-container-image.md).
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return client.kits.launchAndWait(kitName, {
  displayName,
  resources: 'small',
  storage: { secrets },
});
```
@y
```typescript
return client.kits.launchAndWait(kitName, {
  displayName,
  resources: 'small',
  storage: { secrets },
});
```
@z

@x
<details>
<summary>Complete TypeScript example: kits/launch.ts</summary>
@y
<details>
<summary>Complete TypeScript example: kits/launch.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function launchKit(
  client: Sandboxes,
  kitName: string,
  displayName: string,
  secrets: string[] = [],
) {
  return client.kits.launchAndWait(kitName, {
    displayName,
    resources: 'small',
    storage: { secrets },
  });
}
```
@y
export async function launchKit(
  client: Sandboxes,
  kitName: string,
  displayName: string,
  secrets: string[] = [],
) {
  return client.kits.launchAndWait(kitName, {
    displayName,
    resources: 'small',
    storage: { secrets },
  });
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Run the agent {#3-run-the-agent}
@y
## Run the agent {#3-run-the-agent}
@z

@x
Pass the sandbox handle returned by the launch example and your prompt to the run helper. It runs `claude -p` and waits for the response. Launching a kit alone does not submit an agent task.
@y
Pass the sandbox handle returned by the launch example and your prompt to the run helper. It runs `claude -p` and waits for the response. Launching a kit alone does not submit an agent task.
@z

@x
The example returns captured output and an exit code. Check both when diagnosing an agent failure. For a long task, [stream output](run-something-that-produces-real-output.md); for a conversation in a terminal, [open an interactive session](run-an-interactive-shell-in-a-cloud-sandbox.md).
@y
The example returns captured output and an exit code. Check both when diagnosing an agent failure. For a long task, [stream output](run-something-that-produces-real-output.md); for a conversation in a terminal, [open an interactive session](run-an-interactive-shell-in-a-cloud-sandbox.md).
@z

@x
Save the sandbox name if you will resume the work later. [Delete the sandbox](delete-a-cloud-sandbox.md) when you no longer need its files or running processes.
@y
Save the sandbox name if you will resume the work later. [Delete the sandbox](delete-a-cloud-sandbox.md) when you no longer need its files or running processes.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return sandbox.processes.run(
  { args: ['claude', '-p', prompt] },
  { timeoutMs: 300_000 },
);
```
@y
```typescript
return sandbox.processes.run(
  { args: ['claude', '-p', prompt] },
  { timeoutMs: 300_000 },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: kits/run.ts</summary>
@y
<details>
<summary>Complete TypeScript example: kits/run.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function runKitAgent(sandbox: Sandbox, prompt: string) {
  return sandbox.processes.run(
    { args: ['claude', '-p', prompt] },
    { timeoutMs: 300_000 },
  );
}
```
@y
export async function runKitAgent(sandbox: Sandbox, prompt: string) {
  return sandbox.processes.run(
    { args: ['claude', '-p', prompt] },
    { timeoutMs: 300_000 },
  );
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Explore the wider kit catalog {#4-explore-the-wider-kit-catalog}
@y
## Explore the wider kit catalog {#4-explore-the-wider-kit-catalog}
@z

@x
The [community kit catalog](https://github.com/docker/sbx-kits-contrib) includes agents such as Aider, Amp, Copilot, Kiro, and OpenHands, plus development tools, browser automation, source control, and security scanning. For example, Code Server adds a browser-based editor and Playwright adds browser automation.
@y
The [community kit catalog](https://github.com/docker/sbx-kits-contrib) includes agents such as Aider, Amp, Copilot, Kiro, and OpenHands, plus development tools, browser automation, source control, and security scanning. For example, Code Server adds a browser-based editor and Playwright adds browser automation.
@z

@x
Some kits define a complete sandbox environment; others add tools or configuration to an existing agent environment. These are not all bundled SDK launch targets. See the [Docker kits guide](https://docs.docker.com/ai/sandboxes/customize/kits/) for the catalog's usage instructions.
@y
Some kits define a complete sandbox environment; others add tools or configuration to an existing agent environment. These are not all bundled SDK launch targets. See the [Docker kits guide](https://docs.docker.com/ai/sandboxes/customize/kits/) for the catalog's usage instructions.
@z
