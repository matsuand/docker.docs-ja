%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Control what a sandbox can reach"
linkTitle: "Control what a sandbox can reach"
description: "Attach your account's network policies to a new sandbox, read the policy the service enforces, and review which destinations it allowed or blocked."
keywords: "cloud sandboxes, sandboxes api, control what a sandbox can reach"
@y
title: "Control what a sandbox can reach"
linkTitle: "Control what a sandbox can reach"
description: "Attach your account's network policies to a new sandbox, read the policy the service enforces, and review which destinations it allowed or blocked."
keywords: "cloud sandboxes, sandboxes api, control what a sandbox can reach"
@z

@x
Control which destinations an agent or command can reach. A sandbox's effective policy combines account rules with the policies attached to it.
@y
Control which destinations an agent or command can reach. A sandbox's effective policy combines account rules with the policies attached to it.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a managed image, and policy IDs from your account. Create policies in the Console or with [Manage network policies](manage-network-policies.md).
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a managed image, and policy IDs from your account. Create policies in the Console or with [Manage network policies](manage-network-policies.md).
@z

@x
## Attach policies at creation {#1-attach-policies-at-creation}
@y
## Attach policies at creation {#1-attach-policies-at-creation}
@z

@x
Pass the policy IDs when creating the sandbox. The example waits until the sandbox is running and returns its handle.
@y
Pass the policy IDs when creating the sandbox. The example waits until the sandbox is running and returns its handle.
@z

@x
Attachments refer to existing policies; they do not contain policy definitions. Keep the IDs distinct from display names. Attached policies restrict access alongside account policy, so they cannot grant access that your account denies.
@y
Attachments refer to existing policies; they do not contain policy definitions. Keep the IDs distinct from display names. Attached policies restrict access alongside account policy, so they cannot grant access that your account denies.
@z

@x
Include every destination the workload needs, including its model provider and package registries. A kit's network requirements do not override account restrictions.
@y
Include every destination the workload needs, including its model provider and package registries. A kit's network requirements do not override account restrictions.
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
const sandbox = await client.create(
  { displayName: name, image, network: { policyIds } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.create(
  { displayName: name, image, network: { policyIds } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: netpolicy/reference.ts</summary>
@y
<details>
<summary>Complete TypeScript example: netpolicy/reference.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithPolicyIds(
  client: Sandboxes,
  name: string,
  image: string,
  policyIds: string[],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, network: { policyIds } },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createWithPolicyIds(
  client: Sandboxes,
  name: string,
  image: string,
  policyIds: string[],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, network: { policyIds } },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
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
## Inspect the rules in force {#2-inspect-the-rules-in-force}
@y
## Inspect the rules in force {#2-inspect-the-rules-in-force}
@z

@x
Read the sandbox's effective policy before troubleshooting an application timeout. The result includes combined allow and deny rules, their origins, and an exact policy representation.
@y
Read the sandbox's effective policy before troubleshooting an application timeout. The result includes combined allow and deny rules, their origins, and an exact policy representation.
@z

@x
The effective view is the useful starting point for questions such as “can this sandbox reach api.anthropic.com?” Check the default mode as well as matching rules. A deny-by-default policy needs an explicit allowance for the destination.
@y
The effective view is the useful starting point for questions such as “can this sandbox reach api.anthropic.com?” Check the default mode as well as matching rules. A deny-by-default policy needs an explicit allowance for the destination.
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
return sandbox.networkPolicies.get();
```
@y
```typescript
return sandbox.networkPolicies.get();
```
@z

@x
<details>
<summary>Complete TypeScript example: netpolicy/effective.ts</summary>
@y
<details>
<summary>Complete TypeScript example: netpolicy/effective.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function getNetworkPolicies(sandbox: Sandbox) {
  return sandbox.networkPolicies.get();
}
```
@y
export async function getNetworkPolicies(sandbox: Sandbox) {
  return sandbox.networkPolicies.get();
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
## Check allowed and blocked traffic {#3-check-allowed-and-blocked-traffic}
@y
## Check allowed and blocked traffic {#3-check-allowed-and-blocked-traffic}
@z

@x
List policy log entries for the sandbox, using `domain=network` to select network decisions. The example follows pagination and returns all matching entries.
@y
List policy log entries for the sandbox, using `domain=network` to select network decisions. The example follows pagination and returns all matching entries.
@z

@x
Use each entry's destination, decision, reason, and count to identify blocked dependencies. An empty result means no matching entries were returned; it does not prove that a destination is reachable. The log records recent activity, not a permanent audit history.
@y
Use each entry's destination, decision, reason, and count to identify blocked dependencies. An empty result means no matching entries were returned; it does not prove that a destination is reachable. The log records recent activity, not a permanent audit history.
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
return sandbox.networkPolicies.logs.all({ filter }).collect();
```
@y
```typescript
return sandbox.networkPolicies.logs.all({ filter }).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: netpolicy/logs.ts</summary>
@y
<details>
<summary>Complete TypeScript example: netpolicy/logs.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function listPolicyLogEntries(
  client: Sandboxes,
  sandboxName: string,
  filter: string,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.networkPolicies.logs.all({ filter }).collect();
}
```
@y
export async function listPolicyLogEntries(
  client: Sandboxes,
  sandboxName: string,
  filter: string,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.networkPolicies.logs.all({ filter }).collect();
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
