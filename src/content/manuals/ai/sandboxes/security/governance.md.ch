%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Organization governance
linkTitle: Org governance
@y
title: Organization governance
linkTitle: Org governance
@z

@x
description: Centrally manage sandbox network and filesystem policies for your organization.
keywords: docker sandboxes, governance, organization policy, AI governance, admin console, network access, filesystem access
@y
description: Centrally manage sandbox network and filesystem policies for your organization.
keywords: docker sandboxes, governance, organization policy, AI governance, admin console, network access, filesystem access
@z

@x
This page covers how to configure organization policies in the Docker Admin
Console under AI governance settings. For local sandbox policies that
individual users configure on their own machine, see [Policies](policy.md).
@y
This page covers how to configure organization policies in the Docker Admin
Console under AI governance settings. For local sandbox policies that
individual users configure on their own machine, see [Policies](policy.md).
@z

@x
Sandbox network and filesystem policies defined in the
[Docker Admin Console](https://app.docker.com/admin) apply uniformly to every
sandbox in the organization. Rules are enforced across all developers'
machines, take precedence over local `sbx policy` rules, and can't be
overridden by individual users. Admins can optionally
[delegate](#delegate-rules-to-local-policy) specific rule types back to local
control so developers can add additional allow rules.
@y
Sandbox network and filesystem policies defined in the
[Docker Admin Console](https://app.docker.com/admin) apply uniformly to every
sandbox in the organization. Rules are enforced across all developers'
machines, take precedence over local `sbx policy` rules, and can't be
overridden by individual users. Admins can optionally
[delegate](#delegate-rules-to-local-policy) specific rule types back to local
control so developers can add additional allow rules.
@z

@x
> [!NOTE]
> Sandbox organization governance is available on a separate paid
> subscription.
> [Contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
> to request access.
@y
> [!NOTE]
> Sandbox organization governance is available on a separate paid
> subscription.
> [Contact Docker Sales](https://www.docker.com/products/ai-governance/#contact-sales)
> to request access.
@z

@x
## Network policies
@y
## Network policies
@z

@x
### Configuring org-level network rules
@y
### Configuring org-level network rules
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
Rules support exact domains (`example.com`), wildcard subdomains
(`*.example.com`), and optional port suffixes (`example.com:443`).
@y
Rules support exact domains (`example.com`), wildcard subdomains
(`*.example.com`), and optional port suffixes (`example.com:443`).
@z

@x
`example.com` doesn't match subdomains, and `*.example.com` doesn't match
the root domain. Specify both to cover both.
@y
`example.com` doesn't match subdomains, and `*.example.com` doesn't match
the root domain. Specify both to cover both.
@z

@x
### Delegate rules to local policy
@y
### Delegate rules to local policy
@z

@x
When organization governance is active, local rules are ignored by default —
only the organization policy is in effect. Admins can delegate a rule type
back to local policy by turning on the **User defined** setting for that
rule type in AI governance settings. Turning the setting on delegates the
rule type: local `sbx policy` rules of that type are evaluated alongside
organization rules, letting users add hosts to the allowlist from their own
machine.
@y
When organization governance is active, local rules are ignored by default —
only the organization policy is in effect. Admins can delegate a rule type
back to local policy by turning on the **User defined** setting for that
rule type in AI governance settings. Turning the setting on delegates the
rule type: local `sbx policy` rules of that type are evaluated alongside
organization rules, letting users add hosts to the allowlist from their own
machine.
@z

@x
If a rule type isn't delegated, local rules of that type still appear in
`sbx policy ls` but with an `inactive` status and a note that the
organization hasn't delegated the rule type to local policy:
@y
If a rule type isn't delegated, local rules of that type still appear in
`sbx policy ls` but with an `inactive` status and a note that the
organization hasn't delegated the rule type to local policy:
@z

@x
```console
$ sbx policy ls
NAME                  TYPE      ORIGIN               DECISION   STATUS                                                  RESOURCES
balanced-dev          network   local                allow      inactive — corporate policy takes precedence and does   api.anthropic.com
                                                                not delegate this rule type to local policy.
allow AI services     network   remote               allow      active                                                  api.anthropic.com
                                                                                                                        api.openai.com
allow Docker services network   remote               allow      active                                                  *.docker.com
                                                                                                                        *.docker.io
```
@y
```console
$ sbx policy ls
NAME                  TYPE      ORIGIN               DECISION   STATUS                                                  RESOURCES
balanced-dev          network   local                allow      inactive — corporate policy takes precedence and does   api.anthropic.com
                                                                not delegate this rule type to local policy.
allow AI services     network   remote               allow      active                                                  api.anthropic.com
                                                                                                                        api.openai.com
allow Docker services network   remote               allow      active                                                  *.docker.com
                                                                                                                        *.docker.io
```
@z

@x
Organization rules show up with `remote` in the `ORIGIN` column.
@y
Organization rules show up with `remote` in the `ORIGIN` column.
@z

@x
Delegated local rules can expand access for domains the organization hasn't
explicitly denied, but can't override organization-level deny rules. This
applies to exact matches and wildcard matches alike; if the organization denies
`*.example.com`, a local allow for `api.example.com` has no effect because the
org-level wildcard deny covers it.
@y
Delegated local rules can expand access for domains the organization hasn't
explicitly denied, but can't override organization-level deny rules. This
applies to exact matches and wildcard matches alike; if the organization denies
`*.example.com`, a local allow for `api.example.com` has no effect because the
org-level wildcard deny covers it.
@z

@x
For example, given an organization policy that allows `api.anthropic.com`
and denies `*.corp.internal`:
@y
For example, given an organization policy that allows `api.anthropic.com`
and denies `*.corp.internal`:
@z

@x
- `sbx policy allow network -g api.example.com` — works, because the
  organization hasn't denied `api.example.com`
- `sbx policy allow network -g build.corp.internal` — no effect, because the
  organization denies `*.corp.internal`
@y
- `sbx policy allow network -g api.example.com` — works, because the
  organization hasn't denied `api.example.com`
- `sbx policy allow network -g build.corp.internal` — no effect, because the
  organization denies `*.corp.internal`
@z

@x
#### Blocked values in delegated rules
@y
#### Blocked values in delegated rules
@z

@x
To prevent overly broad rules from undermining the organization's policy,
certain catch-all values are blocked in delegated local rules:
@y
To prevent overly broad rules from undermining the organization's policy,
certain catch-all values are blocked in delegated local rules:
@z

@x
- Domain patterns: `*`, `**`, `*.com`, `**.com`, `*.*`, `**.**`
- CIDR ranges: `0.0.0.0/0`, `::/0`
@y
- Domain patterns: `*`, `**`, `*.com`, `**.com`, `*.*`, `**.**`
- CIDR ranges: `0.0.0.0/0`, `::/0`
@z

@x
Scoped wildcards like `*.example.com` are still allowed. If a user attempts
to use a blocked value, `sbx policy` returns an error immediately.
@y
Scoped wildcards like `*.example.com` are still allowed. If a user attempts
to use a blocked value, `sbx policy` returns an error immediately.
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
Admins can restrict which paths are mountable by defining filesystem allow
and deny rules in the Admin Console under **AI governance > Filesystem
access**. Each rule takes a path pattern and an action (allow or deny).
@y
Admins can restrict which paths are mountable by defining filesystem allow
and deny rules in the Admin Console under **AI governance > Filesystem
access**. Each rule takes a path pattern and an action (allow or deny).
@z

@x
> [!CAUTION]
> Use `**` (double wildcard) rather than `*` (single wildcard) when writing
> path patterns to match path segments recursively. A single `*` only matches
> within a single path segment. For example, `~/**` matches all paths under
> the user's home directory, whereas `~/*` matches only paths directly
> under `~`.
@y
> [!CAUTION]
> Use `**` (double wildcard) rather than `*` (single wildcard) when writing
> path patterns to match path segments recursively. A single `*` only matches
> within a single path segment. For example, `~/**` matches all paths under
> the user's home directory, whereas `~/*` matches only paths directly
> under `~`.
@z

@x
## Precedence
@y
## Precedence
@z

@x
Within any layer, deny rules beat allow rules. If a domain matches both, it's
blocked regardless of specificity. Outbound traffic is blocked unless a rule
allows it.
@y
Within any layer, deny rules beat allow rules. If a domain matches both, it's
blocked regardless of specificity. Outbound traffic is blocked unless a rule
allows it.
@z

@x
When organization governance is active, local rules are not evaluated. Only
organization rules set in the Admin Console determine what is allowed or
denied. Organization-level denials can't be overridden locally.
@y
When organization governance is active, local rules are not evaluated. Only
organization rules set in the Admin Console determine what is allowed or
denied. Organization-level denials can't be overridden locally.
@z

@x
If the admin [delegates](#delegate-rules-to-local-policy) a rule type to
local policy by turning on the **User defined** setting, local rules of
that type are also evaluated alongside organization rules. Delegated local
rules can expand access for domains the organization hasn't explicitly
denied, but can't override organization-level denials.
@y
If the admin [delegates](#delegate-rules-to-local-policy) a rule type to
local policy by turning on the **User defined** setting, local rules of
that type are also evaluated alongside organization rules. Delegated local
rules can expand access for domains the organization hasn't explicitly
denied, but can't override organization-level denials.
@z

@x
The same model applies to filesystem policies: organization-level rules take
precedence over local behavior.
@y
The same model applies to filesystem policies: organization-level rules take
precedence over local behavior.
@z

@x
To unblock a domain, identify where the deny rule comes from. For local
rules, remove it with `sbx policy rm`. For organization-level rules, update
the rule in the Admin Console.
@y
To unblock a domain, identify where the deny rule comes from. For local
rules, remove it with `sbx policy rm`. For organization-level rules, update
the rule in the Admin Console.
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
After updating organization policies in the Admin Console, changes take up
to 5 minutes to propagate to developer machines. To apply changes
immediately, users can run `sbx policy reset`, which stops the daemon and
forces it to pull the latest organization policies on the next `sbx`
command.
@y
After updating organization policies in the Admin Console, changes take up
to 5 minutes to propagate to developer machines. To apply changes
immediately, users can run `sbx policy reset`, which stops the daemon and
forces it to pull the latest organization policies on the next `sbx`
command.
@z

@x
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules. The command
> prompts for confirmation before proceeding.
@y
> [!WARNING]
> `sbx policy reset` deletes all locally configured policy rules. The command
> prompts for confirmation before proceeding.
@z

@x
### Sandbox cannot mount workspace
@y
### Sandbox cannot mount workspace
@z

@x
If a sandbox fails to mount with a `mount policy denied` error, verify that
the filesystem allow rule in the Admin Console uses `**` rather than `*`. A
single `*` doesn't match across directory separators.
@y
If a sandbox fails to mount with a `mount policy denied` error, verify that
the filesystem allow rule in the Admin Console uses `**` rather than `*`. A
single `*` doesn't match across directory separators.
@z
