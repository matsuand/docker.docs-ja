%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Compute sizes and limits
description: Choose a Cloud Sandboxes compute size and plan for account quotas and request rate limits.
keywords: cloud sandboxes, compute sizes, CPU, memory, quotas, rate limits
@y
title: Compute sizes and limits
description: Choose a Cloud Sandboxes compute size and plan for account quotas and request rate limits.
keywords: cloud sandboxes, compute sizes, CPU, memory, quotas, rate limits
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
Choose a compute size for each sandbox and keep your application's resource
usage within your account's quotas. Request rate limits also constrain how
quickly your application can send API requests.
@y
Choose a compute size for each sandbox and keep your application's resource
usage within your account's quotas. Request rate limits also constrain how
quickly your application can send API requests.
@z

@x
## Compute sizes
@y
## Compute sizes
@z

@x
Cloud Sandboxes supports these CPU and memory pairs:
@y
Cloud Sandboxes supports these CPU and memory pairs:
@z

@x
| SDK size name | CPUs | Memory | Memory in MiB |
| --- | ---: | ---: | ---: |
| `micro` | 1 | 2 GiB | 2048 |
| `small` | 2 | 4 GiB | 4096 |
| `medium` | 4 | 8 GiB | 8192 |
| `large` | 8 | 16 GiB | 16384 |
| `xl` | 16 | 32 GiB | 32768 |
@y
| SDK size name | CPUs | Memory | Memory in MiB |
| --- | ---: | ---: | ---: |
| `micro` | 1 | 2 GiB | 2048 |
| `small` | 2 | 4 GiB | 4096 |
| `medium` | 4 | 8 GiB | 8192 |
| `large` | 8 | 16 GiB | 16384 |
| `xl` | 16 | 32 GiB | 32768 |
@z

@x
The kit launch helpers default to `small` when you omit `resources`. To select
another size, pass its name:
@y
The kit launch helpers default to `small` when you omit `resources`. To select
another size, pass its name:
@z

@x
```typescript
const sandbox = await client.kits.launchAndWait('shell', {
  resources: 'medium',
});
```
@y
```typescript
const sandbox = await client.kits.launchAndWait('shell', {
  resources: 'medium',
});
```
@z

@x
For a registry image, specify a size in `client.create()`, such as
`resources: 'small'`. You can also pass an explicit CPU and memory pair:
`resources: { cpus: 2, memoryMib: 4096 }`.
@y
For a registry image, specify a size in `client.create()`, such as
`resources: 'small'`. You can also pass an explicit CPU and memory pair:
`resources: { cpus: 2, memoryMib: 4096 }`.
@z

@x
Named sizes are an SDK convenience. In direct REST requests, supply both
`resources.cpus` and `resources.memoryMib`. CPU and memory aren't independent
settings: for example, 1 CPU with 1024 MiB is not a supported pair.
@y
Named sizes are an SDK convenience. In direct REST requests, supply both
`resources.cpus` and `resources.memoryMib`. CPU and memory aren't independent
settings: for example, 1 CPU with 1024 MiB is not a supported pair.
@z

@x
When creating from an existing image resource with `image`, omit resource
settings because the image supplies them.
@y
When creating from an existing image resource with `image`, omit resource
settings because the image supplies them.
@z

@x
Your account access and available capacity determine whether a request can
be accepted. See [Billing](/manuals/agentic-platform/signup.md#billing) for
pricing and usage information.
@y
Your account access and available capacity determine whether a request can
be accepted. See [Billing](manuals/agentic-platform/signup.md#billing) for
pricing and usage information.
@z

@x
## Account quotas
@y
## Account quotas
@z

@x
The default quotas apply across an account:
@y
The default quotas apply across an account:
@z

@x
| Resource | Default limit |
| --- | ---: |
| Concurrent sandboxes | 10 |
| Stored sandboxes | 50 |
| Volumes | 100 |
| Secrets | 100 |
| Images being prepared at the same time | 3 |
@y
| Resource | Default limit |
| --- | ---: |
| Concurrent sandboxes | 10 |
| Stored sandboxes | 50 |
| Volumes | 100 |
| Secrets | 100 |
| Images being prepared at the same time | 3 |
@z

@x
Your account can have different quotas. Confirm your account's limits with
Docker before planning a workload that depends on a particular allowance.
@y
Your account can have different quotas. Confirm your account's limits with
Docker before planning a workload that depends on a particular allowance.
@z

@x
Stopping a sandbox releases its concurrency slot unless the sandbox is
configured as always-on. Restarting a stopped sandbox requires a concurrency
slot. A stopped sandbox still counts toward the stored sandbox quota.
Delete sandboxes you no longer need to reduce stored usage.
@y
Stopping a sandbox releases its concurrency slot unless the sandbox is
configured as always-on. Restarting a stopped sandbox requires a concurrency
slot. A stopped sandbox still counts toward the stored sandbox quota.
Delete sandboxes you no longer need to reduce stored usage.
@z

@x
Handle quota errors even if you checked usage before creating a resource.
Other applications can consume the remaining allowance between requests.
Reduce concurrency or remove unused resources before retrying.
@y
Handle quota errors even if you checked usage before creating a resource.
Other applications can consume the remaining allowance between requests.
Reduce concurrency or remove unused resources before retrying.
@z

@x
## Request rate limits
@y
## Request rate limits
@z

@x
Rate limits control how quickly you can send requests and can vary by
operation. When a request reaches a rate limit, wait before retrying and
honor any delay specified by the server. Limit concurrent requests and set
bounds on retry attempts and elapsed time.
@y
Rate limits control how quickly you can send requests and can vary by
operation. When a request reaches a rate limit, wait before retrying and
honor any delay specified by the server. Limit concurrent requests and set
bounds on retry attempts and elapsed time.
@z

@x
Check the error details to distinguish a rate limit from a resource quota.
Waiting can resolve a rate limit, but exceeding a quota requires reducing
resource usage. See [Errors and retries](errors.md) for how to retry without
duplicating work.
@y
Check the error details to distinguish a rate limit from a resource quota.
Waiting can resolve a rate limit, but exceeding a quota requires reducing
resource usage. See [Errors and retries](errors.md) for how to retry without
duplicating work.
@z
