%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Policies
@y
title: Policies
@z

@x
description: Configure network access rules for sandboxes.
@y
description: Configure network access rules for sandboxes.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Sandboxes are [network-isolated](isolation.md) from your host and from each
other. A policy system controls what a sandbox can access over the network.
@y
Sandboxes are [network-isolated](isolation.md) from your host and from each
other. A policy system controls what a sandbox can access over the network.
@z

@x
Use the `sbx policy` command to configure network access rules. Rules apply
to all sandboxes on the machine.
@y
Use the `sbx policy` command to configure network access rules. Rules apply
to all sandboxes on the machine.
@z

@x
## Network policies
@y
## Network policies
@z

@x
The only way traffic can leave a sandbox is through an HTTP/HTTPS proxy on
your host, which enforces access rules on every outbound request.
@y
The only way traffic can leave a sandbox is through an HTTP/HTTPS proxy on
your host, which enforces access rules on every outbound request.
@z

@x
Non-HTTP TCP traffic, including SSH, can be allowed by adding a policy rule
for the destination IP address and port (for example,
`sbx policy allow network "10.1.2.3:22"`). UDP and ICMP traffic is blocked
at the network layer and can't be unblocked with policy rules.
@y
Non-HTTP TCP traffic, including SSH, can be allowed by adding a policy rule
for the destination IP address and port (for example,
`sbx policy allow network "10.1.2.3:22"`). UDP and ICMP traffic is blocked
at the network layer and can't be unblocked with policy rules.
@z

@x
### Initial policy selection
@y
### Initial policy selection
@z

@x
On first start, and after running `sbx policy reset`, the daemon prompts you to
choose a network policy:
@y
On first start, and after running `sbx policy reset`, the daemon prompts you to
choose a network policy:
@z

@x
```plaintext
Choose a default network policy:
@y
```plaintext
Choose a default network policy:
@z

@x
     1. Open         — All network traffic allowed, no restrictions.
     2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@y
     1. Open         — All network traffic allowed, no restrictions.
     2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@z

@x
  Use ↑/↓ to navigate, Enter to select, or press 1–3.
```
@y
  Use ↑/↓ to navigate, Enter to select, or press 1–3.
```
@z

@x
| Policy      | Description                                                                                                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Open        | All outbound traffic is allowed. No restrictions. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`.                                                             |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. You can extend this with `sbx policy allow`. |
| Locked Down | All outbound traffic is blocked, including model provider APIs (for example, `api.anthropic.com`). You must explicitly allow everything you need.                                              |
@y
| Policy      | Description                                                                                                                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Open        | All outbound traffic is allowed. No restrictions. Equivalent to adding a wildcard allow rule with `sbx policy allow network "**"`.                                                             |
| Balanced    | Default deny, with a baseline allowlist covering AI provider APIs, package managers, code hosts, container registries, and common cloud services. You can extend this with `sbx policy allow`. |
| Locked Down | All outbound traffic is blocked, including model provider APIs (for example, `api.anthropic.com`). You must explicitly allow everything you need.                                              |
@z

@x
You can change your effective policy at any time using `sbx policy allow` and
`sbx policy deny`, or start over by running `sbx policy reset`.
@y
You can change your effective policy at any time using `sbx policy allow` and
`sbx policy deny`, or start over by running `sbx policy reset`.
@z

@x
### Non-interactive environments
@y
### Non-interactive environments
@z

@x
In non-interactive environments such as CI pipelines or headless servers, the
interactive prompt can't be displayed. Use `sbx policy set-default` to set the
default network policy before running any other `sbx` commands:
@y
In non-interactive environments such as CI pipelines or headless servers, the
interactive prompt can't be displayed. Use `sbx policy set-default` to set the
default network policy before running any other `sbx` commands:
@z

@x
```console
$ sbx policy set-default balanced
```
@y
```console
$ sbx policy set-default balanced
```
@z

@x
Available values are `allow-all`, `balanced`, and `deny-all`. After setting the
default, you can customize further with `sbx policy allow` and
`sbx policy deny` as usual.
@y
Available values are `allow-all`, `balanced`, and `deny-all`. After setting the
default, you can customize further with `sbx policy allow` and
`sbx policy deny` as usual.
@z

@x
### Default policy
@y
### Default policy
@z

@x
All outbound HTTP/HTTPS traffic is blocked by default unless an explicit rule
allows it. The **Balanced** policy ships with a baseline allowlist covering AI provider
APIs, package managers, code hosts, container registries, and common cloud
services. Run `sbx policy ls` to see the active rules for your installation.
@y
All outbound HTTP/HTTPS traffic is blocked by default unless an explicit rule
allows it. The **Balanced** policy ships with a baseline allowlist covering AI provider
APIs, package managers, code hosts, container registries, and common cloud
services. Run `sbx policy ls` to see the active rules for your installation.
@z

@x
### Managing rules
@y
### Managing rules
@z

@x
Use [`sbx policy allow`](/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](/reference/cli/sbx/policy/deny/) to add network access
rules. Changes take effect immediately and apply to all sandboxes:
@y
Use [`sbx policy allow`](__SUBDIR__/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](__SUBDIR__/reference/cli/sbx/policy/deny/) to add network access
rules. Changes take effect immediately and apply to all sandboxes:
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
List all active policy rules with `sbx policy ls`:
@y
List all active policy rules with `sbx policy ls`:
@z

@x
```console
$ sbx policy ls
ID                                     TYPE      DECISION   RESOURCES
a1b2c3d4-e5f6-7890-abcd-ef1234567890   network   allow      api.anthropic.com, *.npmjs.org
f9e8d7c6-b5a4-3210-fedc-ba0987654321   network   deny       ads.example.com
```
@y
```console
$ sbx policy ls
ID                                     TYPE      DECISION   RESOURCES
a1b2c3d4-e5f6-7890-abcd-ef1234567890   network   allow      api.anthropic.com, *.npmjs.org
f9e8d7c6-b5a4-3210-fedc-ba0987654321   network   deny       ads.example.com
```
@z

@x
Use `--type network` to show only network policies.
@y
Use `--type network` to show only network policies.
@z

@x
Remove a policy by resource or by rule ID:
@y
Remove a policy by resource or by rule ID:
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
### Resetting to defaults
@y
### Resetting to defaults
@z

@x
To remove all custom policies and restore the default policy, use
`sbx policy reset`:
@y
To remove all custom policies and restore the default policy, use
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
This deletes the local policy store and stops the daemon. When the daemon
restarts on the next command, you are prompted to choose a new network policy.
If sandboxes are running, they stop when the daemon shuts down. You are prompted for
confirmation unless you pass `--force`:
@y
This deletes the local policy store and stops the daemon. When the daemon
restarts on the next command, you are prompted to choose a new network policy.
If sandboxes are running, they stop when the daemon shuts down. You are prompted for
confirmation unless you pass `--force`:
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
### Switching to allow-by-default
@y
### Switching to allow-by-default
@z

@x
If you prefer a permissive policy where all outbound traffic is allowed, add
a wildcard allow rule:
@y
If you prefer a permissive policy where all outbound traffic is allowed, add
a wildcard allow rule:
@z

@x
```console
$ sbx policy allow network "**"
```
@y
```console
$ sbx policy allow network "**"
```
@z

@x
This lets agents install packages and call any external API without additional
configuration. You can still deny specific hosts with `sbx policy deny`.
@y
This lets agents install packages and call any external API without additional
configuration. You can still deny specific hosts with `sbx policy deny`.
@z

@x
### Wildcard syntax
@y
### Wildcard syntax
@z

@x
Rules support exact domains (`example.com`), wildcard subdomains
(`*.example.com`), and optional port suffixes (`example.com:443`).
@y
Rules support exact domains (`example.com`), wildcard subdomains
(`*.example.com`), and optional port suffixes (`example.com:443`).
@z

@x
Note that `example.com` doesn't match subdomains, and `*.example.com` doesn't
match the root domain. Specify both to cover both.
@y
Note that `example.com` doesn't match subdomains, and `*.example.com` doesn't
match the root domain. Specify both to cover both.
@z

@x
### Common patterns
@y
### Common patterns
@z

@x
Allow access to package managers so agents can install dependencies:
@y
Allow access to package managers so agents can install dependencies:
@z

@x
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org,github.com"
```
@y
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org,github.com"
```
@z

@x
The **Balanced** policy already includes AI provider APIs, package managers,
code hosts, and container registries. You only need to add allow rules for
additional domains your workflow requires. If you chose **Locked Down**, you
must explicitly allow everything.
@y
The **Balanced** policy already includes AI provider APIs, package managers,
code hosts, and container registries. You only need to add allow rules for
additional domains your workflow requires. If you chose **Locked Down**, you
must explicitly allow everything.
@z

@x
> [!WARNING]
> Allowing broad domains like `github.com` permits access to any content on
> that domain, including user-generated content. Only allow domains you trust
> with your data.
@y
> [!WARNING]
> Allowing broad domains like `github.com` permits access to any content on
> that domain, including user-generated content. Only allow domains you trust
> with your data.
@z

@x
### Monitoring
@y
### Monitoring
@z

@x
Use `sbx policy log` to see which hosts your sandboxes have contacted:
@y
Use `sbx policy log` to see which hosts your sandboxes have contacted:
@z

@x
```console
$ sbx policy log
Blocked requests:
SANDBOX      TYPE     HOST                   PROXY        RULE       LAST SEEN        COUNT
my-sandbox   network  blocked.example.com    transparent  policykit  10:15:25 29-Jan  1
@y
```console
$ sbx policy log
Blocked requests:
SANDBOX      TYPE     HOST                   PROXY        RULE       LAST SEEN        COUNT
my-sandbox   network  blocked.example.com    transparent  policykit  10:15:25 29-Jan  1
@z

@x
Allowed requests:
SANDBOX      TYPE     HOST                   PROXY        RULE       LAST SEEN        COUNT
my-sandbox   network  api.anthropic.com      forward      policykit  10:15:23 29-Jan  42
my-sandbox   network  registry.npmjs.org     transparent  policykit  10:15:20 29-Jan  18
```
@y
Allowed requests:
SANDBOX      TYPE     HOST                   PROXY        RULE       LAST SEEN        COUNT
my-sandbox   network  api.anthropic.com      forward      policykit  10:15:23 29-Jan  42
my-sandbox   network  registry.npmjs.org     transparent  policykit  10:15:20 29-Jan  18
```
@z

@x
The **PROXY** column shows how the request left the sandbox:
@y
The **PROXY** column shows how the request left the sandbox:
@z

@x
| Value         | Description                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------- |
| `forward`     | Routed through the forward proxy. Supports [credential injection](credentials.md).                             |
| `transparent` | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available.            |
| `network`     | Non-HTTP traffic (raw TCP, UDP, ICMP). TCP can be allowed with a policy rule; UDP and ICMP are always blocked. |
@y
| Value         | Description                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------- |
| `forward`     | Routed through the forward proxy. Supports [credential injection](credentials.md).                             |
| `transparent` | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available.            |
| `network`     | Non-HTTP traffic (raw TCP, UDP, ICMP). TCP can be allowed with a policy rule; UDP and ICMP are always blocked. |
@z

@x
Filter by sandbox name by passing it as an argument:
@y
Filter by sandbox name by passing it as an argument:
@z

@x
```console
$ sbx policy log my-sandbox
```
@y
```console
$ sbx policy log my-sandbox
```
@z

@x
Use `--limit N` to show only the last `N` entries, `--json` for
machine-readable output, or `--type network` to filter by policy type.
@y
Use `--limit N` to show only the last `N` entries, `--json` for
machine-readable output, or `--type network` to filter by policy type.
@z

@x
## Precedence
@y
## Precedence
@z

@x
All outbound traffic is blocked by default unless an explicit rule allows it.
If a domain matches both an allow and a deny rule, the deny rule wins
regardless of specificity.
@y
All outbound traffic is blocked by default unless an explicit rule allows it.
If a domain matches both an allow and a deny rule, the deny rule wins
regardless of specificity.
@z

@x
To unblock a domain, find the deny rule with `sbx policy ls` and remove it
with `sbx policy rm`.
@y
To unblock a domain, find the deny rule with `sbx policy ls` and remove it
with `sbx policy rm`.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Policy changes not taking effect
@y
### Policy changes not taking effect
@z

@x
If policy changes aren't taking effect, run `sbx policy reset` to wipe the
local policy store and restart the daemon. On next start, you are prompted to
choose a new network policy.
@y
If policy changes aren't taking effect, run `sbx policy reset` to wipe the
local policy store and restart the daemon. On next start, you are prompted to
choose a new network policy.
@z
