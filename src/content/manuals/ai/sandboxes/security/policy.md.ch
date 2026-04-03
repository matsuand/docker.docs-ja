%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Policies
@y
title: Policies
@z

@x
description: Configure network access and filesystem rules for sandboxes.
@y
description: Configure network access and filesystem rules for sandboxes.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Sandboxes are [network-isolated](isolation.md) from your host and from each
other. A policy system controls what a sandbox can access — which external
hosts it can reach over the network, and which host paths it can mount as
workspaces.
@y
Sandboxes are [network-isolated](isolation.md) from your host and from each
other. A policy system controls what a sandbox can access — which external
hosts it can reach over the network, and which host paths it can mount as
workspaces.
@z

@x
Policies can be set at two levels:
@y
Policies can be set at two levels:
@z

@x
- **Organization policies** {{< badge color=blue text="Limited Access" >}} — configured by admins in the
  [Docker Admin Console](https://app.docker.com/admin) under AI governance
  settings. These apply to all sandboxes across the organization.
- **Local policies** — configured by individual users with the `sbx policy`
  command. These apply to all sandboxes on the local machine.
@y
- **Organization policies** {{< badge color=blue text="Limited Access" >}} — configured by admins in the
  [Docker Admin Console](https://app.docker.com/admin) under AI governance
  settings. These apply to all sandboxes across the organization.
- **Local policies** — configured by individual users with the `sbx policy`
  command. These apply to all sandboxes on the local machine.
@z

@x
If your organization has enabled governance, organization policies replace
local rules — local `sbx policy` rules are not evaluated unless an admin
also turns on the **User defined** setting. See [Precedence](#precedence)
for details.
@y
If your organization has enabled governance, organization policies replace
local rules — local `sbx policy` rules are not evaluated unless an admin
also turns on the **User defined** setting. See [Precedence](#precedence)
for details.
@z

@x
## Organization policies {tier="Limited Access"}
@y
## Organization policies {tier="Limited Access"}
@z

@x
> [!NOTE]
> Organization governance is a Limited Access feature. Contact your Docker
> account team to request access.
@y
> [!NOTE]
> Organization governance is a Limited Access feature. Contact your Docker
> account team to request access.
@z

@x
Organization admins can centrally manage policies through the
[Docker Admin Console](https://app.docker.com/admin). Navigate to your
organization settings and enable **Manage AI governance**.
@y
Organization admins can centrally manage policies through the
[Docker Admin Console](https://app.docker.com/admin). Navigate to your
organization settings and enable **Manage AI governance**.
@z

@x
Once enabled, the policies defined in the Admin Console apply to all
sandboxes across the organization.
@y
Once enabled, the policies defined in the Admin Console apply to all
sandboxes across the organization.
@z

@x
### Local extensions to organization policy
@y
### Local extensions to organization policy
@z

@x
When organization governance is active, local rules are ignored by default.
Admins can optionally let users extend the organization policy by turning on
the **User defined** setting in AI governance settings. When turned on,
local `sbx policy` rules are evaluated alongside organization rules, letting
users add hosts to the allowlist from their own machine using
`sbx policy allow network`.
@y
When organization governance is active, local rules are ignored by default.
Admins can optionally let users extend the organization policy by turning on
the **User defined** setting in AI governance settings. When turned on,
local `sbx policy` rules are evaluated alongside organization rules, letting
users add hosts to the allowlist from their own machine using
`sbx policy allow network`.
@z

@x
Local extensions can expand access for domains the organization hasn't
explicitly denied, but can't override organization-level deny rules. This
applies to exact matches and wildcard matches alike — if the organization
denies `*.example.com`, a local allow for `api.example.com` has no effect
because the org-level wildcard deny covers it.
@y
Local extensions can expand access for domains the organization hasn't
explicitly denied, but can't override organization-level deny rules. This
applies to exact matches and wildcard matches alike — if the organization
denies `*.example.com`, a local allow for `api.example.com` has no effect
because the org-level wildcard deny covers it.
@z

@x
For example, given an organization policy that allows `api.anthropic.com`
and denies `*.corp.internal`:
@y
For example, given an organization policy that allows `api.anthropic.com`
and denies `*.corp.internal`:
@z

@x
- `sbx policy allow network api.example.com` — works, because the
  organization hasn't denied `api.example.com`
- `sbx policy allow network build.corp.internal` — no effect, because the
  organization denies `*.corp.internal`
@y
- `sbx policy allow network api.example.com` — works, because the
  organization hasn't denied `api.example.com`
- `sbx policy allow network build.corp.internal` — no effect, because the
  organization denies `*.corp.internal`
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
> [!NOTE]
> If your organization manages AI governance policies, organization rules
> take precedence over the policy you select here. See
> [Organization policies](#organization-policies).
@y
> [!NOTE]
> If your organization manages AI governance policies, organization rules
> take precedence over the policy you select here. See
> [Organization policies](#organization-policies).
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
Organization admins can modify or remove these defaults when configuring
[organization policies](#organization-policies).
@y
Organization admins can modify or remove these defaults when configuring
[organization policies](#organization-policies).
@z

@x
### Managing local rules
@y
### Managing local rules
@z

@x
Use [`sbx policy allow`](/reference/cli/sbx/policy/allow/) and
[`sbx policy deny`](/reference/cli/sbx/policy/deny/) to add network access
rules. Changes take effect immediately and apply to all sandboxes:
@y
Use [`sbx policy allow`](__SUBDIR__/reference/cli/sbx/policy/allow/) and
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
### Org-level rules {tier="Limited Access"}
@y
### Org-level rules {tier="Limited Access"}
@z

@x
Define network allow and deny rules in the Admin Console under
**AI governance > Network access**. Each rule takes a network target (domain,
wildcard, or CIDR range) and an action (allow or deny). You can add multiple
entries at once, one per line.
@y
Define network allow and deny rules in the Admin Console under
**AI governance > Network access**. Each rule takes a network target (domain,
wildcard, or CIDR range) and an action (allow or deny). You can add multiple
entries at once, one per line.
@z

@x
Organization-level rules use the same [wildcard syntax](#wildcard-syntax) as
local rules.
@y
Organization-level rules use the same [wildcard syntax](#wildcard-syntax) as
local rules.
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
| Value         | Description                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------------- |
| `forward`     | Routed through the forward proxy. Supports [credential injection](credentials.md).                  |
| `transparent` | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available. |
| `network`     | Non-HTTP traffic (raw TCP, UDP, ICMP). Always blocked.                                              |
@y
| Value         | Description                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------------- |
| `forward`     | Routed through the forward proxy. Supports [credential injection](credentials.md).                  |
| `transparent` | Intercepted by the transparent proxy. Policy is enforced but credential injection is not available. |
| `network`     | Non-HTTP traffic (raw TCP, UDP, ICMP). Always blocked.                                              |
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
## Filesystem policies
@y
## Filesystem policies
@z

@x
Filesystem policies control which host paths a sandbox can mount as
workspaces. By default, sandboxes can mount any directory the user has
access to.
@y
Filesystem policies control which host paths a sandbox can mount as
workspaces. By default, sandboxes can mount any directory the user has
access to.
@z

@x
### Org-level restrictions {tier="Limited Access"}
@y
### Org-level restrictions {tier="Limited Access"}
@z

@x
Admins can restrict which paths are mountable by defining filesystem allow
and deny rules in the Admin Console under **AI governance > Filesystem access**.
Each rule takes a path pattern and an action (allow or deny).
@y
Admins can restrict which paths are mountable by defining filesystem allow
and deny rules in the Admin Console under **AI governance > Filesystem access**.
Each rule takes a path pattern and an action (allow or deny).
@z

@x
> [!CAUTION]
> Use `**` (double wildcard) rather than `*` (single wildcard) when writing
> path patterns to match path segments recursively. A single `*` only matches
> within a single path segment. For example, `~/**` matches all paths under the
> user's home directory, whereas `~/*` matches only paths directly under `~`.
@y
> [!CAUTION]
> Use `**` (double wildcard) rather than `*` (single wildcard) when writing
> path patterns to match path segments recursively. A single `*` only matches
> within a single path segment. For example, `~/**` matches all paths under the
> user's home directory, whereas `~/*` matches only paths directly under `~`.
@z

@x
## Precedence
@y
## Precedence
@z

@x
Within any layer, deny rules beat allow rules — if a domain matches both,
it's blocked regardless of specificity.
@y
Within any layer, deny rules beat allow rules — if a domain matches both,
it's blocked regardless of specificity.
@z

@x
All outbound traffic is blocked by default unless an explicit rule allows it.
How rules are evaluated depends on whether organization governance is active.
@y
All outbound traffic is blocked by default unless an explicit rule allows it.
How rules are evaluated depends on whether organization governance is active.
@z

@x
Without organization governance, local rules (`sbx policy`) are the only
rules evaluated against this default-deny baseline.
@y
Without organization governance, local rules (`sbx policy`) are the only
rules evaluated against this default-deny baseline.
@z

@x
With organization governance, local rules are not evaluated. Only
organization rules (Docker Admin Console) determine what is allowed or
denied. Organization-level denials can't be overridden locally.
@y
With organization governance, local rules are not evaluated. Only
organization rules (Docker Admin Console) determine what is allowed or
denied. Organization-level denials can't be overridden locally.
@z

@x
If the admin turns on the **User defined** setting, local rules are also
evaluated alongside organization rules. Local rules can expand access for
domains the organization hasn't explicitly denied, but can't override
organization-level denials.
@y
If the admin turns on the **User defined** setting, local rules are also
evaluated alongside organization rules. Local rules can expand access for
domains the organization hasn't explicitly denied, but can't override
organization-level denials.
@z

@x
The same model applies to filesystem policies: organization-level rules take
precedence over local behavior.
@y
The same model applies to filesystem policies: organization-level rules take
precedence over local behavior.
@z

@x
To unblock a domain, identify where the deny rule comes from. For local rules,
remove it with `sbx policy rm`. For organization-level rules, contact your
organization admin.
@y
To unblock a domain, identify where the deny rule comes from. For local rules,
remove it with `sbx policy rm`. For organization-level rules, contact your
organization admin.
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
choose a new network policy, and the latest organization policies are pulled if
governance is enabled.
@y
If policy changes aren't taking effect, run `sbx policy reset` to wipe the
local policy store and restart the daemon. On next start, you are prompted to
choose a new network policy, and the latest organization policies are pulled if
governance is enabled.
@z

@x
### Sandbox cannot mount workspace
@y
### Sandbox cannot mount workspace
@z

@x
If a sandbox fails to mount with a `mount policy denied` error, verify that
the filesystem allow rule uses `**` rather than `*`. A single `*` doesn't
match across directory separators.
@y
If a sandbox fails to mount with a `mount policy denied` error, verify that
the filesystem allow rule uses `**` rather than `*`. A single `*` doesn't
match across directory separators.
@z
