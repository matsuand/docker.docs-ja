%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Local policy
@y
title: Local policy
@z

@x
description: Configure local network access rules for sandboxes on your machine.
keywords: docker sandboxes, local policy, network access, allow rules, deny rules, sbx policy
@y
description: Configure local network access rules for sandboxes on your machine.
keywords: docker sandboxes, local policy, network access, allow rules, deny rules, sbx policy
@z

@x
The `sbx policy` command manages the local policy on your machine. The local
policy contains network access rules. Rules apply to all sandboxes on the
machine when you use the global scope, or to a single sandbox when scoped by
name.
@y
The `sbx policy` command manages the local policy on your machine. The local
policy contains network access rules. Rules apply to all sandboxes on the
machine when you use the global scope, or to a single sandbox when scoped by
name.
@z

@x
Local policy interacts with organization governance as follows:
@y
Local policy interacts with organization governance as follows:
@z

@x
- **No org governance**: the local policy controls what sandboxes can access.
- **Org governance active**: only organization allow rules grant access, so
  local allow rules are inactive and can't expand what the organization permits.
  Local deny rules are still evaluated, so you can restrict access further than
  the organization policy does. To list inactive rules, run
  `sbx policy ls --include-inactive`. See
  [Monitoring](../monitor-and-enforce/monitoring.md#showing-inactive-rules).
@y
- **No org governance**: the local policy controls what sandboxes can access.
- **Org governance active**: only organization allow rules grant access, so
  local allow rules are inactive and can't expand what the organization permits.
  Local deny rules are still evaluated, so you can restrict access further than
  the organization policy does. To list inactive rules, run
  `sbx policy ls --include-inactive`. See
  [Monitoring](../monitor-and-enforce/monitoring.md#showing-inactive-rules).
@z

@x
See [Organization policies](organization.md) for how organization governance
works.
@y
See [Organization policies](organization.md) for how organization governance
works.
@z

@x
For domain patterns, wildcards, CIDR ranges, and filesystem path syntax, see
[Policy concepts](../concepts.md#rule-syntax).
@y
For domain patterns, wildcards, CIDR ranges, and filesystem path syntax, see
[Policy concepts](../concepts.md#rule-syntax).
@z

@x
## Default preset
@y
## Default preset
@z

@x
Outbound TCP traffic passes through a proxy on your host, which enforces access
rules on every connection. Non-HTTP TCP traffic, including SSH, can be allowed
with a hostname rule (for example, `sbx policy allow network "myhost:22"`) or an
address-based rule. UDP and ICMP are blocked at the network layer and can't be
unblocked with policy rules.
@y
Outbound TCP traffic passes through a proxy on your host, which enforces access
rules on every connection. Non-HTTP TCP traffic, including SSH, can be allowed
with a hostname rule (for example, `sbx policy allow network "myhost:22"`) or an
address-based rule. UDP and ICMP are blocked at the network layer and can't be
unblocked with policy rules.
@z

@x
If you haven't chosen a default preset, the CLI prompts you before it runs a
sandbox. Running `sbx policy reset` clears the preset and prompts you to choose
again:
@y
If you haven't chosen a default preset, the CLI prompts you before it runs a
sandbox. Running `sbx policy reset` clears the preset and prompts you to choose
again:
@z

@x
```plaintext
Initialize the global network policy for your sandboxes:
@y
```plaintext
Initialize the global network policy for your sandboxes:
@z

@x
  Applies to all sandboxes, current and future — change it later with
  "sbx policy allow/deny/rm". Kits, including built-in agent kits, may
  also add per-sandbox rules.
@y
  Applies to all sandboxes, current and future — change it later with
  "sbx policy allow/deny/rm". Kits, including built-in agent kits, may
  also add per-sandbox rules.
@z

@x
     1. Open         — All network traffic allowed, no restrictions.
  ❯  2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@y
     1. Open         — All network traffic allowed, no restrictions.
  ❯  2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@z

@x
  Use ↑/↓ or 1–3 to navigate, Enter to confirm, Esc to cancel.
```
@y
  Use ↑/↓ or 1–3 to navigate, Enter to confirm, Esc to cancel.
```
@z

@x
| Preset      | Description                                                                                                                                       |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Open        | All outbound traffic is allowed. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`.                                 |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. |
| Locked Down | All outbound traffic is blocked, including model provider APIs (for example, `api.anthropic.com`). You must explicitly allow everything you need. |
@y
| Preset      | Description                                                                                                                                       |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Open        | All outbound traffic is allowed. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`.                                 |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. |
| Locked Down | All outbound traffic is blocked, including model provider APIs (for example, `api.anthropic.com`). You must explicitly allow everything you need. |
@z

@x
The **Balanced** preset's baseline allowlist is a good starting point for most
workflows. Run `sbx policy ls` to see exactly which rules it includes. As of
v0.35.0, the Balanced preset also allows VS Code domains, Azure Blob Storage
(`*.blob.core.windows.net`), and `dhi.io` over HTTP.
@y
The **Balanced** preset's baseline allowlist is a good starting point for most
workflows. Run `sbx policy ls` to see exactly which rules it includes. As of
v0.35.0, the Balanced preset also allows VS Code domains, Azure Blob Storage
(`*.blob.core.windows.net`), and `dhi.io` over HTTP.
@z

@x
> [!NOTE]
> If your organization manages sandbox policies centrally, organization rules
> take precedence over the preset you select here. See
> [Organization policies](organization.md).
@y
> [!NOTE]
> If your organization manages sandbox policies centrally, organization rules
> take precedence over the preset you select here. See
> [Organization policies](organization.md).
@z

@x
### Non-interactive environments
@y
### Non-interactive environments
@z

@x
In non-interactive environments such as CI pipelines or headless servers, the
interactive prompt can't be displayed. Use `sbx policy init` to set the
preset before running any other `sbx` commands:
@y
In non-interactive environments such as CI pipelines or headless servers, the
interactive prompt can't be displayed. Use `sbx policy init` to set the
preset before running any other `sbx` commands:
@z

@x
```console
$ sbx policy init balanced
```
@y
```console
$ sbx policy init balanced
```
@z

@x
Available values are `allow-all`, `balanced`, and `deny-all`.
@y
Available values are `allow-all`, `balanced`, and `deny-all`.
@z

@x
## Managing rules
@y
## Managing rules
@z

@x
Use [`sbx policy allow`](/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](/reference/cli/sbx/policy/deny/) to add or restrict access
on top of the active preset. Changes take effect immediately. Rules apply to
all sandboxes by default:
@y
Use [`sbx policy allow`](__SUBDIR__/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](__SUBDIR__/reference/cli/sbx/policy/deny/) to add or restrict access
on top of the active preset. Changes take effect immediately. Rules apply to
all sandboxes by default:
@z

@x
```console
$ sbx policy allow network api.anthropic.com
$ sbx policy deny network ads.example.com
```
@y
```console
$ sbx policy allow network api.anthropic.com
$ sbx policy deny network ads.example.com
```
@z

@x
Pass `--sandbox <name>` to scope a rule to one sandbox:
@y
Pass `--sandbox <name>` to scope a rule to one sandbox:
@z

@x
```console
$ sbx policy allow network --sandbox my-sandbox api.example.com
$ sbx policy deny network --sandbox my-sandbox ads.example.com
```
@y
```console
$ sbx policy allow network --sandbox my-sandbox api.example.com
$ sbx policy deny network --sandbox my-sandbox ads.example.com
```
@z

@x
As of v0.38.0, you can also set per-sandbox deny rules at creation time with
`--deny-network` on `sbx create` or `sbx run`, instead of adding them after the
fact:
@y
As of v0.38.0, you can also set per-sandbox deny rules at creation time with
`--deny-network` on `sbx create` or `sbx run`, instead of adding them after the
fact:
@z

@x
```console
$ sbx create --deny-network ads.example.com claude .
$ sbx run --deny-network ads.example.com claude
```
@y
```console
$ sbx create --deny-network ads.example.com claude .
$ sbx run --deny-network ads.example.com claude
```
@z

@x
Pass the flag multiple times to deny more than one host. Rules added this way
appear in `sbx policy ls <name>` and can be removed with
`sbx policy rm network --sandbox <name> --resource <host>`.
@y
Pass the flag multiple times to deny more than one host. Rules added this way
appear in `sbx policy ls <name>` and can be removed with
`sbx policy rm network --sandbox <name> --resource <host>`.
@z

@x
Specify multiple hosts in one command with a comma-separated list:
@y
Specify multiple hosts in one command with a comma-separated list:
@z

@x
```console
$ sbx policy allow network "api.anthropic.com,*.npmjs.org,*.pypi.org"
```
@y
```console
$ sbx policy allow network "api.anthropic.com,*.npmjs.org,*.pypi.org"
```
@z

@x
Remove a rule by resource or by rule ID:
@y
Remove a rule by resource or by rule ID:
@z

@x
```console
$ sbx policy rm network --resource ads.example.com
$ sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
```
@y
```console
$ sbx policy rm network --resource ads.example.com
$ sbx policy rm network --id 2d3c1f0e-4a73-4e05-bc9d-f2f9a4b50d67
```
@z

@x
To remove a sandbox-scoped rule, pass `--sandbox <name>`:
@y
To remove a sandbox-scoped rule, pass `--sandbox <name>`:
@z

@x
```console
$ sbx policy rm network --sandbox my-sandbox --resource api.example.com
```
@y
```console
$ sbx policy rm network --sandbox my-sandbox --resource api.example.com
```
@z

@x
To inspect which policies are active and where they come from, use
`sbx policy ls`. Use `--source` to filter by origin (`local`, `org`, `kit`),
`--decision` to filter by outcome (`allow`, `deny`), and `--wide` for
rule-level detail including rule IDs. To inspect a single policy or rule in
full, use `sbx policy inspect`. See
[Monitoring](../monitor-and-enforce/monitoring.md).
@y
To inspect which policies are active and where they come from, use
`sbx policy ls`. Use `--source` to filter by origin (`local`, `org`, `kit`),
`--decision` to filter by outcome (`allow`, `deny`), and `--wide` for
rule-level detail including rule IDs. To inspect a single policy or rule in
full, use `sbx policy inspect`. See
[Monitoring](../monitor-and-enforce/monitoring.md).
@z

@x
## Testing policy
@y
## Testing policy
@z

@x
Before running a sandbox, you can check whether the current policy would allow
a network request with `sbx policy check network`:
@y
Before running a sandbox, you can check whether the current policy would allow
a network request with `sbx policy check network`:
@z

@x
```console
$ sbx policy check network api.anthropic.com
Allowed: api.anthropic.com
@y
```console
$ sbx policy check network api.anthropic.com
Allowed: api.anthropic.com
@z

@x
$ sbx policy check network blocked.example.com
Denied: blocked.example.com
```
@y
$ sbx policy check network blocked.example.com
Denied: blocked.example.com
```
@z

@x
The target can be a hostname, a `host:port` pair, an IP address, or a URL.
Bare hostnames and IP addresses are evaluated against port 443. This is useful
for verifying custom rules or checking what the Locked Down preset blocks
before you start an agent.
@y
The target can be a hostname, a `host:port` pair, an IP address, or a URL.
Bare hostnames and IP addresses are evaluated against port 443. This is useful
for verifying custom rules or checking what the Locked Down preset blocks
before you start an agent.
@z

@x
To check policy in the context of a specific sandbox:
@y
To check policy in the context of a specific sandbox:
@z

@x
```console
$ sbx policy check network --sandbox my-sandbox api.example.com
```
@y
```console
$ sbx policy check network --sandbox my-sandbox api.example.com
```
@z

@x
### Resetting
@y
### Resetting
@z

@x
To remove all custom rules and start fresh with a new preset, use
`sbx policy reset`:
@y
To remove all custom rules and start fresh with a new preset, use
`sbx policy reset`:
@z

@x
```console
$ sbx policy reset
```
@y
```console
$ sbx policy reset
```
@z

@x
This deletes the local policy store, restarts the daemon, and prompts you to
choose a new preset. Running sandboxes stop when the daemon shuts down. Pass
`--force` to skip the confirmation prompt:
@y
This deletes the local policy store, restarts the daemon, and prompts you to
choose a new preset. Running sandboxes stop when the daemon shuts down. Pass
`--force` to skip the confirmation prompt:
@z

@x
```console
$ sbx policy reset --force
```
@y
```console
$ sbx policy reset --force
```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Local allow rules have no effect
@y
### Local allow rules have no effect
@z

@x
If rules you add with `sbx policy allow` don't change sandbox behavior, your
organization likely has governance enabled. Run `sbx policy ls` to check: if
the output starts with a `Governance:` status line showing `Managed by <org>`,
org governance is active. When it's active, local allow rules are inactive.
You can't use them to loosen restrictions the org policy imposes.
@y
If rules you add with `sbx policy allow` don't change sandbox behavior, your
organization likely has governance enabled. Run `sbx policy ls` to check: if
the output starts with a `Governance:` status line showing `Managed by <org>`,
org governance is active. When it's active, local allow rules are inactive.
You can't use them to loosen restrictions the org policy imposes.
@z

@x
Inactive allow rules are hidden from `sbx policy ls` by default; run
`sbx policy ls --include-inactive` to see them with an `inactive` status in
the `STATUS` column.
@y
Inactive allow rules are hidden from `sbx policy ls` by default; run
`sbx policy ls --include-inactive` to see them with an `inactive` status in
the `STATUS` column.
@z

@x
When organization governance is active, only organization allow rules can grant
access. Ask your admin to update the organization policy if you need access to
an additional resource. Local deny rules remain active, so you can use
`sbx policy deny` to restrict access further.
@y
When organization governance is active, only organization allow rules can grant
access. Ask your admin to update the organization policy if you need access to
an additional resource. Local deny rules remain active, so you can use
`sbx policy deny` to restrict access further.
@z

@x
### A domain is still blocked after adding an allow rule
@y
### A domain is still blocked after adding an allow rule
@z

@x
If a domain remains blocked after you add a local allow rule, your organization
likely enforces governance, which makes local allow rules inactive. Run `sbx
policy ls` to check whether org governance is active; if the output starts with
a `Governance:` status line showing `Managed by <org>`, it is. Add
`--include-inactive` to confirm your rule shows an `inactive` status. If so,
the block can only be lifted by updating the org policy in Docker Home or via
the [API](/reference/api/ai-governance/).
@y
If a domain remains blocked after you add a local allow rule, your organization
likely enforces governance, which makes local allow rules inactive. Run `sbx
policy ls` to check whether org governance is active; if the output starts with
a `Governance:` status line showing `Managed by <org>`, it is. Add
`--include-inactive` to confirm your rule shows an `inactive` status. If so,
the block can only be lifted by updating the org policy in Docker Home or via
the [API](__SUBDIR__/reference/api/ai-governance/).
@z
