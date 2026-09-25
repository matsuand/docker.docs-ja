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
address-based rule. UDP requires the experimental feature and policy rules
described in [Allow outbound UDP](#allow-outbound-udp). ICMP is blocked.
@y
Outbound TCP traffic passes through a proxy on your host, which enforces access
rules on every connection. Non-HTTP TCP traffic, including SSH, can be allowed
with a hostname rule (for example, `sbx policy allow network "myhost:22"`) or an
address-based rule. UDP requires the experimental feature and policy rules
described in [Allow outbound UDP](#allow-outbound-udp). ICMP is blocked.
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
| Open        | All outbound TCP traffic is allowed. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`. |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. |
| Locked Down | No baseline allow rules. Destinations need an allow rule from you or a kit. |
@y
| Preset      | Description                                                                                                                                       |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Open        | All outbound TCP traffic is allowed. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`. |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. |
| Locked Down | No baseline allow rules. Destinations need an allow rule from you or a kit. |
@z

@x
Presets initialize the global policy. Built-in agent kits and other kits can
add per-sandbox allow rules, including under **Locked Down** (`deny-all`). The
preset isn't an explicit deny rule that overrides those allowances. To inspect
the rules a kit adds to a sandbox, run:
@y
Presets initialize the global policy. Built-in agent kits and other kits can
add per-sandbox allow rules, including under **Locked Down** (`deny-all`). The
preset isn't an explicit deny rule that overrides those allowances. To inspect
the rules a kit adds to a sandbox, run:
@z

@x
```console
$ sbx policy ls my-sandbox --source kit --type network --wide
```
@y
```console
$ sbx policy ls my-sandbox --source kit --type network --wide
```
@z

@x
To block a destination allowed by a kit, add an explicit deny rule:
@y
To block a destination allowed by a kit, add an explicit deny rule:
@z

@x
```console
$ sbx policy deny network --sandbox my-sandbox openrouter.ai
```
@y
```console
$ sbx policy deny network --sandbox my-sandbox openrouter.ai
```
@z

@x
Deny rules take precedence over allow rules. See
[Policy precedence](../concepts.md#precedence).
@y
Deny rules take precedence over allow rules. See
[Policy precedence](../concepts.md#precedence).
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
A rule covers a destination host. It can also name HTTP methods and paths to
narrow the match to part of that host.
@y
A rule covers a destination host. It can also name HTTP methods and paths to
narrow the match to part of that host.
@z

@x
### Network rules
@y
### Network rules
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
### HTTP method and path rules
@y
### HTTP method and path rules
@z

@x
Add `--method` to an allow or deny rule to match specific HTTP methods on a
host, and `--path` to restrict it to part of the host's URL space:
@y
Add `--method` to an allow or deny rule to match specific HTTP methods on a
host, and `--path` to restrict it to part of the host's URL space:
@z

@x
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/org/project/**'
```
@y
```console
$ sbx policy allow network api.github.com --method GET --path '/repos/org/project/**'
```
@z

@x
Quote the path so your shell doesn't expand the wildcard. Pass several methods
as a comma-separated list:
@y
Quote the path so your shell doesn't expand the wildcard. Pass several methods
as a comma-separated list:
@z

@x
```console
$ sbx policy allow network api.github.com --method GET,HEAD
```
@y
```console
$ sbx policy allow network api.github.com --method GET,HEAD
```
@z

@x
`--method ANY` matches every HTTP method, and `--path` defaults to `/**` when
you omit it:
@y
`--method ANY` matches every HTTP method, and `--path` defaults to `/**` when
you omit it:
@z

@x
```console
$ sbx policy allow network api.github.com --method ANY
```
@y
```console
$ sbx policy allow network api.github.com --method ANY
```
@z

@x
`ANY` can't be combined with specific methods, and a path without a method is
rejected. Pass a method, or use `ANY` when you mean every method.
@y
`ANY` can't be combined with specific methods, and a path without a method is
rejected. Pass a method, or use `ANY` when you mean every method.
@z

@x
Method names are case-insensitive. The accepted values are `GET`, `HEAD`,
`POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS`, `CONNECT`, and `TRACE`.
@y
Method names are case-insensitive. The accepted values are `GET`, `HEAD`,
`POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS`, `CONNECT`, and `TRACE`.
@z

@x
A path must start with `/` and be canonical. It can't contain a query string, a
fragment, percent-encoding, control characters, surrounding whitespace,
repeated or trailing slashes, or dot segments such as `.` and `..`. Each rule
takes one path.
@y
A path must start with `/` and be canonical. It can't contain a query string, a
fragment, percent-encoding, control characters, surrounding whitespace,
repeated or trailing slashes, or dot segments such as `.` and `..`. Each rule
takes one path.
@z

@x
Hosts follow the same patterns as network rules and can include a port. Write
the host on its own, without a scheme, so an HTTP rule takes `api.example.com`
rather than `https://api.example.com`.
@y
Hosts follow the same patterns as network rules and can include a port. Write
the host on its own, without a scheme, so an HTTP rule takes `api.example.com`
rather than `https://api.example.com`.
@z

@x
A local HTTP rule takes a hostname. To match an IP address or a CIDR range,
add a plain network rule for that destination instead.
@y
A local HTTP rule takes a hostname. To match an IP address or a CIDR range,
add a plain network rule for that destination instead.
@z

@x
Deny rules take the same flags, which is the usual way to carve a method or
path out of a broader allow:
@y
Deny rules take the same flags, which is the usual way to carve a method or
path out of a broader allow:
@z

@x
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network api.example.com --method POST --path '/admin/**'
```
@y
```console
$ sbx policy allow network api.example.com
$ sbx policy deny network api.example.com --method POST --path '/admin/**'
```
@z

@x
For how the two layers combine, see
[HTTP rules](../concepts.md#http-method-and-path).
@y
For how the two layers combine, see
[HTTP rules](../concepts.md#http-method-and-path).
@z

@x
Remove an HTTP rule by naming the same qualifiers you added it with, or by
rule ID:
@y
Remove an HTTP rule by naming the same qualifiers you added it with, or by
rule ID:
@z

@x
```console
$ sbx policy rm network --resource api.github.com --method GET --path '/repos/org/project/**'
$ sbx policy rm network --id 7f3a1c2e-4a73-4e05-bc9d-f2f9a4b50d67
```
@y
```console
$ sbx policy rm network --resource api.github.com --method GET --path '/repos/org/project/**'
$ sbx policy rm network --id 7f3a1c2e-4a73-4e05-bc9d-f2f9a4b50d67
```
@z

@x
List HTTP rules with `--type http`, or see them alongside network rules in a
wide listing, where the `METHOD` and `PATH` columns are empty for rules that
match a whole host:
@y
List HTTP rules with `--type http`, or see them alongside network rules in a
wide listing, where the `METHOD` and `PATH` columns are empty for rules that
match a whole host:
@z

@x
```console
$ sbx policy ls --wide
TYPE      METHOD   PATH
network   -        -
http      GET      /repos/org/project/**
```
@y
```console
$ sbx policy ls --wide
TYPE      METHOD   PATH
network   -        -
http      GET      /repos/org/project/**
```
@z

@x
> [!NOTE]
> `sbx policy check network` and `sbx policy log` don't evaluate or display
> HTTP methods and paths. A check reports the decision for the host, which can
> differ from the decision for a specific method and path on that host.
@y
> [!NOTE]
> `sbx policy check network` and `sbx policy log` don't evaluate or display
> HTTP methods and paths. A check reports the decision for the host, which can
> differ from the decision for a specific method and path on that host.
@z

@x
## Inspecting rules
@y
## Inspecting rules
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
### Allow outbound UDP
@y
### Allow outbound UDP
@z

@x
Outbound UDP is experimental and disabled by default. Turn on experimental
features and UDP egress before adding UDP allow rules:
@y
Outbound UDP is experimental and disabled by default. Turn on experimental
features and UDP egress before adding UDP allow rules:
@z

@x
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.udp-egress true
$ sbx policy allow network --protocol udp api.example.com:443
```
@y
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.udp-egress true
$ sbx policy allow network --protocol udp api.example.com:443
```
@z

@x
Local allow rules apply to TCP by default. Use `--protocol udp` for UDP or
`--protocol tcp,udp` for both. Deny rules apply to both protocols by default.
Use `--protocol` to restrict a deny rule to one protocol.
@y
Local allow rules apply to TCP by default. Use `--protocol udp` for UDP or
`--protocol tcp,udp` for both. Deny rules apply to both protocols by default.
Use `--protocol` to restrict a deny rule to one protocol.
@z

@x
UDP follows the same organization and local policy precedence as TCP. It is
refused when the destination requires an HTTP, SOCKS5, system, or PAC-selected
proxy, because those proxies can't carry UDP. ICMP remains blocked.
@y
UDP follows the same organization and local policy precedence as TCP. It is
refused when the destination requires an HTTP, SOCKS5, system, or PAC-selected
proxy, because those proxies can't carry UDP. ICMP remains blocked.
@z

@x
Inspect UDP rules or check a destination:
@y
Inspect UDP rules or check a destination:
@z

@x
```console
$ sbx policy ls --protocol udp
$ sbx policy check network --protocol udp api.example.com:443
```
@y
```console
$ sbx policy ls --protocol udp
$ sbx policy check network --protocol udp api.example.com:443
```
@z

@x
The CLI warns if you save a UDP rule while UDP egress is disabled.
@y
The CLI warns if you save a UDP rule while UDP egress is disabled.
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

@x
### An HTTP method or path is blocked on an allowed host
@y
### An HTTP method or path is blocked on an allowed host
@z

@x
A host that a network rule allows can still have individual methods or paths
denied by an HTTP rule. Run `sbx policy ls --type http` to see which HTTP rules
apply. `sbx policy check network` reports the decision for the host only, so it
shows a host as allowed even when the specific request is denied. See
[HTTP method and path rules](#http-method-and-path-rules).
@y
A host that a network rule allows can still have individual methods or paths
denied by an HTTP rule. Run `sbx policy ls --type http` to see which HTTP rules
apply. `sbx policy check network` reports the decision for the host only, so it
shows a host as allowed even when the specific request is denied. See
[HTTP method and path rules](#http-method-and-path-rules).
@z
