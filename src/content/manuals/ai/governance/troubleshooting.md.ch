%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Troubleshoot governance
linkTitle: Troubleshooting
@y
title: Troubleshoot governance
linkTitle: Troubleshooting
@z

@x
description: Resolve blocked requests, inactive rules, approval prompts, policy sync, and missing audit records for Docker Sandboxes governance.
keywords: docker sandboxes, governance, troubleshooting, network policy, sbx policy, approval, organization policy, audit logs
@y
description: Resolve blocked requests, inactive rules, approval prompts, policy sync, and missing audit records for Docker Sandboxes governance.
keywords: docker sandboxes, governance, troubleshooting, network policy, sbx policy, approval, organization policy, audit logs
@z

@x
These problems come from the governance rules that control what sandboxes can
reach and mount, and from the audit logs that record those decisions. For other
Docker Sandboxes problems, see
[Troubleshooting](../sandboxes/troubleshooting.md).
@y
These problems come from the governance rules that control what sandboxes can
reach and mount, and from the audit logs that record those decisions. For other
Docker Sandboxes problems, see
[Troubleshooting](../sandboxes/troubleshooting.md).
@z

@x
## A command fails with "global network policy has not been initialized"
@y
## A command fails with "global network policy has not been initialized"
@z

@x
No network preset is set, and the CLI can't prompt you to choose one because
it isn't running in an interactive terminal, for example in a CI pipeline or a
script. Commands that work with sandboxes, such as `sbx run`, `sbx create`, and
`sbx exec`, return this error until a preset is set. Set the preset first:
@y
No network preset is set, and the CLI can't prompt you to choose one because
it isn't running in an interactive terminal, for example in a CI pipeline or a
script. Commands that work with sandboxes, such as `sbx run`, `sbx create`, and
`sbx exec`, return this error until a preset is set. Set the preset first:
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
Available values are `allow-all` (Open), `balanced` (Balanced), and `deny-all`
(Locked Down). For more details, see
[Set the preset without the prompt](local/network-rules.md#set-the-preset-without-the-prompt).
@y
Available values are `allow-all` (Open), `balanced` (Balanced), and `deny-all`
(Locked Down). For more details, see
[Set the preset without the prompt](local/network-rules.md#set-the-preset-without-the-prompt).
@z

@x
## Agent can't install packages or reach an API
@y
## Agent can't install packages or reach an API
@z

@x
Docker Sandboxes uses [network rules](local/network-rules.md) to control
outbound traffic. If the agent fails to install packages or call an external
API, the destination probably isn't allowed. Check which requests are being
blocked:
@y
Docker Sandboxes uses [network rules](local/network-rules.md) to control
outbound traffic. If the agent fails to install packages or call an external
API, the destination probably isn't allowed. Check which requests are being
blocked:
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
Then allow the destinations your workflow needs:
@y
Then allow the destinations your workflow needs:
@z

@x
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org"
```
@y
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org"
```
@z

@x
To allow all outbound traffic instead:
@y
To allow all outbound traffic instead:
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
If `sbx policy allow` doesn't unblock the request, see
[A local allow rule has no effect](#a-local-allow-rule-has-no-effect).
@y
If `sbx policy allow` doesn't unblock the request, see
[A local allow rule has no effect](#a-local-allow-rule-has-no-effect).
@z

@x
## Every request from a sandbox is blocked
@y
## Every request from a sandbox is blocked
@z

@x
When policy enforcement can't get a valid organization policy, it fails closed
and blocks every network request and workspace mount, whatever your rules
allow. The message a blocked request returns tells you why:
@y
When policy enforcement can't get a valid organization policy, it fails closed
and blocks every network request and workspace mount, whatever your rules
allow. The message a blocked request returns tells you why:
@z

@x
- `Denied because governance could not be resolved`: run `sbx policy ls`. If
  the status line shows `Governance: Unresolved`, see
  [`sbx policy ls` shows Governance: Unresolved](#sbx-policy-ls-shows-governance-unresolved).
- `Denied because the policy snapshot is stale`: the daemon lost its connection
  to the governance service, or your Docker session expired. Check your network
  connection, then run `sbx login` to sign in again if the problem continues.
@y
- `Denied because governance could not be resolved`: run `sbx policy ls`. If
  the status line shows `Governance: Unresolved`, see
  [`sbx policy ls` shows Governance: Unresolved](#sbx-policy-ls-shows-governance-unresolved).
- `Denied because the policy snapshot is stale`: the daemon lost its connection
  to the governance service, or your Docker session expired. Check your network
  connection, then run `sbx login` to sign in again if the problem continues.
@z

@x
## A local allow rule has no effect
@y
## A local allow rule has no effect
@z

@x
If a destination is still blocked after you add a local allow rule, an
organization policy is probably enforced for you. Run `sbx policy ls` and check
for `Governance: Managed by <org>` in the status line. When an organization
policy is enforced, local allow rules are inactive and can't loosen what the
organization policy allows.
@y
If a destination is still blocked after you add a local allow rule, an
organization policy is probably enforced for you. Run `sbx policy ls` and check
for `Governance: Managed by <org>` in the status line. When an organization
policy is enforced, local allow rules are inactive and can't loosen what the
organization policy allows.
@z

@x
To confirm, run `sbx policy ls --wide --include-inactive` and check that your
rule shows `inactive` in the `STATUS` column.
@y
To confirm, run `sbx policy ls --wide --include-inactive` and check that your
rule shows `inactive` in the `STATUS` column.
@z

@x
Ask your administrator to update the organization policy if you need access to
another destination. For more details, see
[How organization policy relates to local and kit rules](organization/policies/_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@y
Ask your administrator to update the organization policy if you need access to
another destination. For more details, see
[How organization policy relates to local and kit rules](organization/policies/_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@z

@x
## `sbx policy ls` shows Governance: Unresolved
@y
## `sbx policy ls` shows Governance: Unresolved
@z

@x
Docker can't determine which organization governs your account. For example,
this happens when your account belongs to more than one organization with
governance enabled. A `Details` line below the status explains the cause.
@y
Docker can't determine which organization governs your account. For example,
this happens when your account belongs to more than one organization with
governance enabled. A `Details` line below the status explains the cause.
@z

@x
Policy enforcement fails closed until the conflict is resolved, so local allow
rules can't grant access. Contact an administrator for the affected
organizations to resolve the conflicting governance configuration.
@y
Policy enforcement fails closed until the conflict is resolved, so local allow
rules can't grant access. Contact an administrator for the affected
organizations to resolve the conflicting governance configuration.
@z

@x
## A request is blocked with "Approval required"
@y
## A request is blocked with "Approval required"
@z

@x
The destination needs your confirmation. Either no allow or deny rule matches
it and no organization policy is enforced for you, or an organization policy
allows it but requires approval first.
@y
The destination needs your confirmation. Either no allow or deny rule matches
it and no organization policy is enforced for you, or an organization policy
allows it but requires approval first.
@z

@x
Run `sbx policy approval ls` to see the pending request and respond to it with
`sbx policy approval respond`. Approving applies to later requests, not the one
that was blocked, so run the operation again afterward. For more details, see
[Respond to approval requests](local/approvals.md).
@y
Run `sbx policy approval ls` to see the pending request and respond to it with
`sbx policy approval respond`. Approving applies to later requests, not the one
that was blocked, so run the operation again afterward. For more details, see
[Respond to approval requests](local/approvals.md).
@z

@x
## An HTTP method or path is blocked on an allowed host
@y
## An HTTP method or path is blocked on an allowed host
@z

@x
A destination that a host rule allows can still have individual methods or
paths denied by an HTTP rule. Run `sbx policy ls --type http` to see which HTTP rules
apply. `sbx policy check network` reports the decision for the host only, so it
shows a host as allowed even when the specific request is denied. For more
details, see
[Allow or block HTTP methods and paths](local/network-rules.md#allow-or-block-http-methods-and-paths).
@y
A destination that a host rule allows can still have individual methods or
paths denied by an HTTP rule. Run `sbx policy ls --type http` to see which HTTP rules
apply. `sbx policy check network` reports the decision for the host only, so it
shows a host as allowed even when the specific request is denied. For more
details, see
[Allow or block HTTP methods and paths](local/network-rules.md#allow-or-block-http-methods-and-paths).
@z

@x
## A sandbox can't mount its workspace
@y
## A sandbox can't mount its workspace
@z

@x
If a sandbox fails to mount with a `mount policy denied` error, either an
organization filesystem policy doesn't allow the path, or Docker Sandboxes
couldn't resolve the path.
@y
If a sandbox fails to mount with a `mount policy denied` error, either an
organization filesystem policy doesn't allow the path, or Docker Sandboxes
couldn't resolve the path.
@z

@x
If a sandbox's workspace was denied when the daemon last loaded the sandbox or
when the sandbox last tried to start, `sbx ls` shows `(blocked by policy)`
after its workspace. The label doesn't update when a policy change syncs. A
blocked sandbox can't start until the policy allows the path, but you can
remove it with `sbx rm`.
@y
If a sandbox's workspace was denied when the daemon last loaded the sandbox or
when the sandbox last tried to start, `sbx ls` shows `(blocked by policy)`
after its workspace. The label doesn't update when a policy change syncs. A
blocked sandbox can't start until the policy allows the path, but you can
remove it with `sbx rm`.
@z

@x
When the policy denies the path, the `sbx` command on the developer's machine
returns an error that lists each denied path, the access that was denied, and
the reason. For example, if a deny rule named `block-ssh` denies a read-only
mount of `~/.ssh`, the error is:
@y
When the policy denies the path, the `sbx` command on the developer's machine
returns an error that lists each denied path, the access that was denied, and
the reason. For example, if a deny rule named `block-ssh` denies a read-only
mount of `~/.ssh`, the error is:
@z

@x
```text
mount policy denied: /Users/dev/.ssh: fs:mount:read denied: denied: rule "block-ssh" matched op(action=fs:mount:read, resource=fs:path:/Users/dev/.ssh)
```
@y
```text
mount policy denied: /Users/dev/.ssh: fs:mount:read denied: denied: rule "block-ssh" matched op(action=fs:mount:read, resource=fs:path:/Users/dev/.ssh)
```
@z

@x
| Part   | In the example                         | Description                                                                                                                                                             |
| ------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Path   | `/Users/dev/.ssh`                      | The resolved path the rules were checked against                                                                                                                        |
| Access | `fs:mount:read denied`                 | Which access was denied. A writable mount that lacks both lists `fs:mount:read` and `fs:mount:write` separately                                                         |
| Reason | `denied: rule "block-ssh" matched ...` | The deny rule that matched. A deny rule without a name appears as `rule ""`. When no allow rule covers the path, the reason starts with `no allow rule matched` instead |
@y
| Part   | In the example                         | Description                                                                                                                                                             |
| ------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Path   | `/Users/dev/.ssh`                      | The resolved path the rules were checked against                                                                                                                        |
| Access | `fs:mount:read denied`                 | Which access was denied. A writable mount that lacks both lists `fs:mount:read` and `fs:mount:write` separately                                                         |
| Reason | `denied: rule "block-ssh" matched ...` | The deny rule that matched. A deny rule without a name appears as `rule ""`. When no allow rule covers the path, the reason starts with `no allow rule matched` instead |
@z

@x
Administrators can find the same decision in audit logs, in a record with the
`filesystem_mount` action type. For more details, see
[Action types](reference/audit-records.md#action-types).
@y
Administrators can find the same decision in audit logs, in a record with the
`filesystem_mount` action type. For more details, see
[Action types](reference/audit-records.md#action-types).
@z

@x
Check for these common causes:
@y
Check for these common causes:
@z

@x
| Cause                                                                              | Why the mount is denied                                                                                                                                                  | Fix                                                             |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| The allow rule uses `*` rather than `**`                                           | A single `*` matches one path segment, so `~/*` matches `~/project` but not `~/project/src`                                                                              | Use `**` to match the whole directory tree, for example `~/**`  |
| The workspace is writable, but the policy allows only `read`                       | A writable workspace needs both `read` and `write`                                                                                                                       | Add `write` to the rule                                         |
| The rule uses an environment variable such as `%USERPROFILE%` or `$HOME`           | The policy engine expands only `~`, so the variable is matched as literal text                                                                                           | Replace the variable with `~`, for example `~/**`               |
| The rule uses a different operating system's path format                           | A macOS or Linux path such as `/data/**` doesn't match a Windows path such as `C:\data`, or a WSL path, which starts with `\\wsl.localhost\<distro>\`                    | Add a rule in the format of the developer's operating system    |
| The rule's capitalization doesn't match a macOS or Linux path                      | macOS and Linux paths are case sensitive, so `~/Projects/**` doesn't match `~/projects/app`                                                                              | Match the directory names' capitalization on disk               |
| The workspace is a symbolic link to a directory that no rule allows                | The policy checks the directory the link points to, not the link                                                                                                         | Allow the link's target directory, or mount the target directly |
@y
| Cause                                                                              | Why the mount is denied                                                                                                                                                  | Fix                                                             |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| The allow rule uses `*` rather than `**`                                           | A single `*` matches one path segment, so `~/*` matches `~/project` but not `~/project/src`                                                                              | Use `**` to match the whole directory tree, for example `~/**`  |
| The workspace is writable, but the policy allows only `read`                       | A writable workspace needs both `read` and `write`                                                                                                                       | Add `write` to the rule                                         |
| The rule uses an environment variable such as `%USERPROFILE%` or `$HOME`           | The policy engine expands only `~`, so the variable is matched as literal text                                                                                           | Replace the variable with `~`, for example `~/**`               |
| The rule uses a different operating system's path format                           | A macOS or Linux path such as `/data/**` doesn't match a Windows path such as `C:\data`, or a WSL path, which starts with `\\wsl.localhost\<distro>\`                    | Add a rule in the format of the developer's operating system    |
| The rule's capitalization doesn't match a macOS or Linux path                      | macOS and Linux paths are case sensitive, so `~/Projects/**` doesn't match `~/projects/app`                                                                              | Match the directory names' capitalization on disk               |
| The workspace is a symbolic link to a directory that no rule allows                | The policy checks the directory the link points to, not the link                                                                                                         | Allow the link's target directory, or mount the target directly |
@z

@x
For how paths are written and matched, see
[Filesystem mount rule syntax](reference/filesystem-rules.md).
@y
For how paths are written and matched, see
[Filesystem mount rule syntax](reference/filesystem-rules.md).
@z

@x
## Organization policy changes aren't taking effect
@y
## Organization policy changes aren't taking effect
@z

@x
After an administrator updates organization policies, changes take up to 5
minutes to reach developer machines. To apply them right away on a developer
machine, run `sbx policy refresh`. It fetches and applies the latest
organization policy without restarting the daemon or stopping running
sandboxes.
@y
After an administrator updates organization policies, changes take up to 5
minutes to reach developer machines. To apply them right away on a developer
machine, run `sbx policy refresh`. It fetches and applies the latest
organization policy without restarting the daemon or stopping running
sandboxes.
@z

@x
The refreshed policy applies to new connections only. A connection that a
sandbox opened while the previous policy allowed it stays open even if the new
policy denies it. Restart the sandbox to close those connections.
@y
The refreshed policy applies to new connections only. A connection that a
sandbox opened while the previous policy allowed it stays open even if the new
policy denies it. Restart the sandbox to close those connections.
@z

@x
When a synced change takes effect also depends on the policy type. For more
details, see
[When policy changes reach developers](organization/policies/_index.md#when-policy-changes-reach-developers).
@y
When a synced change takes effect also depends on the policy type. For more
details, see
[When policy changes reach developers](organization/policies/_index.md#when-policy-changes-reach-developers).
@z

@x
## Audit records are missing
@y
## Audit records are missing
@z

@x
If an organization's audit logs don't include records from a developer, check
the following:
@y
If an organization's audit logs don't include records from a developer, check
the following:
@z

@x
- The developer is governed. Records come only from signed-in users who have an
  AI Governance license and are governed by an enforced organization policy. On
  the developer's machine, run `sbx policy ls` and check for
  `Governance: Managed by <org>` in the status line.
- The developer runs Docker Sandboxes 0.39.0 or later. Run `sbx version` to
  check, and [install](../sandboxes/install.md) a newer version if needed.
- Cloud delivery is on. Records reach audit events in Docker Home and SIEM
  streaming only through cloud delivery. Organizations that used local audit
  logging before hosted audit logs were available start with cloud delivery
  off. For more details, see
  [Configure audit delivery](organization/audit/configure.md).
- Local files are finalized. With local delivery, the daemon writes records to
  a `.tmp` file and renames it to `.jsonl` after 5 minutes, 1000 events, or 50
  MiB, or when the daemon shuts down cleanly. For more details, see
  [Where records are stored](organization/audit/_index.md#where-records-are-stored).
@y
- The developer is governed. Records come only from signed-in users who have an
  AI Governance license and are governed by an enforced organization policy. On
  the developer's machine, run `sbx policy ls` and check for
  `Governance: Managed by <org>` in the status line.
- The developer runs Docker Sandboxes 0.39.0 or later. Run `sbx version` to
  check, and [install](../sandboxes/install.md) a newer version if needed.
- Cloud delivery is on. Records reach audit events in Docker Home and SIEM
  streaming only through cloud delivery. Organizations that used local audit
  logging before hosted audit logs were available start with cloud delivery
  off. For more details, see
  [Configure audit delivery](organization/audit/configure.md).
- Local files are finalized. With local delivery, the daemon writes records to
  a `.tmp` file and renames it to `.jsonl` after 5 minutes, 1000 events, or 50
  MiB, or when the daemon shuts down cleanly. For more details, see
  [Where records are stored](organization/audit/_index.md#where-records-are-stored).
@z
