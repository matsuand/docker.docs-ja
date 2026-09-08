%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Filesystem access policies
linkTitle: Filesystem access
@y
title: Filesystem access policies
linkTitle: Filesystem access
@z

@x
description: Control which host paths Docker Sandboxes can mount as workspaces with organization filesystem policies.
keywords: docker sandboxes, filesystem access, filesystem rules, workspace mount, organization policy, governance
@y
description: Control which host paths Docker Sandboxes can mount as workspaces with organization filesystem policies.
keywords: docker sandboxes, filesystem access, filesystem rules, workspace mount, organization policy, governance
@z

@x
Filesystem access policies control which host paths a sandbox can mount as a
workspace. Each policy contains one or more rules that restrict sandbox
workspaces to approved directories.
@y
Filesystem access policies control which host paths a sandbox can mount as a
workspace. Each policy contains one or more rules that restrict sandbox
workspaces to approved directories.
@z

@x
Filesystem access is managed with [organization policies](organization.md). When
organization governance is active, organization rules determine which paths a
sandbox can mount, and the local filesystem allow rules from the default preset
become inactive. `sbx policy deny` applies to network access only, so there are
no local filesystem deny rules to layer on top. See
[Precedence](../concepts.md#precedence).
@y
Filesystem access is managed with [organization policies](organization.md). When
organization governance is active, organization rules determine which paths a
sandbox can mount, and the local filesystem allow rules from the default preset
become inactive. `sbx policy deny` applies to network access only, so there are
no local filesystem deny rules to layer on top. See
[Precedence](../concepts.md#precedence).
@z

@x
## Rule syntax
@y
## Rule syntax
@z

@x
Filesystem rules use the actions `read` and `write`. Resources are host path
patterns.
@y
Filesystem rules use the actions `read` and `write`. Resources are host path
patterns.
@z

@x
A writable workspace mount must be allowed by both a `read` rule and a `write`
rule. A read-only workspace needs only `read`.
@y
A writable workspace mount must be allowed by both a `read` rule and a `write`
rule. A read-only workspace needs only `read`.
@z

@x
Examples:
@y
Examples:
@z

@x
- `~/**`
- `/data/project/**`
- `C:\data\project\**`
- `\\wsl.localhost\<distro>\data\project\**`
@y
- `~/**`
- `/data/project/**`
- `C:\data\project\**`
- `\\wsl.localhost\<distro>\data\project\**`
@z

@x
Use `**` to match a directory tree recursively. A single `*` matches only one
path segment. For exact path matching behavior across macOS, Linux, Windows,
and WSL, see [Filesystem rules](../concepts.md#filesystem-rules).
@y
Use `**` to match a directory tree recursively. A single `*` matches only one
path segment. For exact path matching behavior across macOS, Linux, Windows,
and WSL, see [Filesystem rules](../concepts.md#filesystem-rules).
@z

@x
## Organization filesystem rules
@y
## Organization filesystem rules
@z

@x
Organization filesystem rules belong to policies that can apply to the whole
organization or to selected teams. For setup steps and team scoping, see
[Organization policies](organization.md).
@y
Organization filesystem rules belong to policies that can apply to the whole
organization or to selected teams. For setup steps and team scoping, see
[Organization policies](organization.md).
@z

@x
Filesystem policy is checked when a workspace is mounted, which happens when a
sandbox is created. To apply a filesystem policy change to a running workflow,
remove the sandbox and create a new one.
@y
Filesystem policy is checked when a workspace is mounted, which happens when a
sandbox is created. To apply a filesystem policy change to a running workflow,
remove the sandbox and create a new one.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Sandbox cannot mount workspace
@y
### Sandbox cannot mount workspace
@z

@x
If a sandbox fails to mount with a `mount policy denied` error, verify that the
filesystem allow rule uses `**` rather than `*`. A single `*` doesn't match
across directory separators.
@y
If a sandbox fails to mount with a `mount policy denied` error, verify that the
filesystem allow rule uses `**` rather than `*`. A single `*` doesn't match
across directory separators.
@z
