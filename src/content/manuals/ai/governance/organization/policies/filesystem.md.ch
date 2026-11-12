%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Organization filesystem access policies
linkTitle: Filesystem
@y
title: Organization filesystem access policies
linkTitle: Filesystem
@z

@x
description: Control which host paths Docker Sandboxes can mount as workspaces with organization filesystem policies.
keywords: docker sandboxes, filesystem access, filesystem mount rules, workspace mount, organization policy, governance
@y
description: Control which host paths Docker Sandboxes can mount as workspaces with organization filesystem policies.
keywords: docker sandboxes, filesystem access, filesystem mount rules, workspace mount, organization policy, governance
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Filesystem access policies control which host paths a sandbox can mount as a
workspace. The rules decide only whether a path can be mounted. They don't
mount anything themselves, and once a path is mounted, they don't control which
files in it an agent can read or change.
@y
Filesystem access policies control which host paths a sandbox can mount as a
workspace. The rules decide only whether a path can be mounted. They don't
mount anything themselves, and once a path is mounted, they don't control which
files in it an agent can read or change.
@z

@x
When a developer is governed, they can mount a path into a sandbox only if your
filesystem mount rules allow the access the mount needs and none of them deny
it. Developers can't add filesystem mount
rules with local policy, and the built-in local rules described in the next
paragraph stop applying. For more details, see
[How organization policy relates to local and kit rules](_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@y
When a developer is governed, they can mount a path into a sandbox only if your
filesystem mount rules allow the access the mount needs and none of them deny
it. Developers can't add filesystem mount
rules with local policy, and the built-in local rules described in the next
paragraph stop applying. For more details, see
[How organization policy relates to local and kit rules](_index.md#how-organization-policy-relates-to-local-and-kit-rules).
@z

@x
When a developer isn't governed, for example because they don't hold an AI
Governance license, filesystem policy doesn't restrict which host paths they
can mount. Local policy
includes two built-in rules that allow read and write access to every path,
which developers see as `default-fs-*` rules in `sbx policy ls --wide`.
@y
When a developer isn't governed, for example because they don't hold an AI
Governance license, filesystem policy doesn't restrict which host paths they
can mount. Local policy
includes two built-in rules that allow read and write access to every path,
which developers see as `default-fs-*` rules in `sbx policy ls --wide`.
@z

@x
This page explains what a filesystem mount rule can match, example policies for
common tasks, and when your changes reach developers. To create a filesystem
access policy, see
[Create and manage organization policies](create-manage.md).
@y
This page explains what a filesystem mount rule can match, example policies for
common tasks, and when your changes reach developers. To create a filesystem
access policy, see
[Create and manage organization policies](create-manage.md).
@z

@x
## What a filesystem mount rule can match
@y
## What a filesystem mount rule can match
@z

@x
Each filesystem mount rule allows or denies `read`, `write`, or both on the
host paths it lists. Paths can use wildcards and `~`, and are written in the
format of the developer's operating system. For how to write paths on each
operating system and how they're matched, see
[Filesystem mount rule syntax](../../reference/filesystem-rules.md).
@y
Each filesystem mount rule allows or denies `read`, `write`, or both on the
host paths it lists. Paths can use wildcards and `~`, and are written in the
format of the developer's operating system. For how to write paths on each
operating system and how they're matched, see
[Filesystem mount rule syntax](../../reference/filesystem-rules.md).
@z

@x
## Example policies
@y
## Example policies
@z

@x
The following policies show common ways to allow host paths. Adapt the paths
to the directories your developers use.
@y
The following policies show common ways to allow host paths. Adapt the paths
to the directories your developers use.
@z

@x
### Allow home directories and a shared projects directory
@y
### Allow home directories and a shared projects directory
@z

@x
To let developers mount anything under their home directory or a shared
`projects` directory on any operating system, create one allow rule with the
`read` and `write` actions and the following paths:
@y
To let developers mount anything under their home directory or a shared
`projects` directory on any operating system, create one allow rule with the
`read` and `write` actions and the following paths:
@z

@x
| Path                            | Covers                               |
| ------------------------------- | ------------------------------------ |
| `~/**`                          | The home directory on every platform |
| `/projects/**`                  | macOS and Linux                      |
| `*:\projects\**`                | Windows, on any drive                |
| `\\wsl.localhost\*\projects\**` | WSL, in any distribution             |
@y
| Path                            | Covers                               |
| ------------------------------- | ------------------------------------ |
| `~/**`                          | The home directory on every platform |
| `/projects/**`                  | macOS and Linux                      |
| `*:\projects\**`                | Windows, on any drive                |
| `\\wsl.localhost\*\projects\**` | WSL, in any distribution             |
@z

@x
Because this rule allows `~/**`, a developer can mount their whole home
directory, and the agent can access every file in it, including `.ssh`
directories and `.env` files. For what an agent can access in a mounted
workspace, see [Isolation layers](../../../sandboxes/security/isolation.md).
@y
Because this rule allows `~/**`, a developer can mount their whole home
directory, and the agent can access every file in it, including `.ssh`
directories and `.env` files. For what an agent can access in a mounted
workspace, see [Isolation layers](../../../sandboxes/security/isolation.md).
@z

@x
A deny rule for `~/.ssh/**` stops a developer from mounting `~/.ssh` directly,
but not from mounting the home directory that contains it. To keep files like
these out of sandboxes, allow narrower paths, such as `~/src/**`, instead of
`~/**`.
@y
A deny rule for `~/.ssh/**` stops a developer from mounting `~/.ssh` directly,
but not from mounting the home directory that contains it. To keep files like
these out of sandboxes, allow narrower paths, such as `~/src/**`, instead of
`~/**`.
@z

@x
### Allow clone mode while blocking writable mounts
@y
### Allow clone mode while blocking writable mounts
@z

@x
To let agents work on repositories without applying their edits to the host
working tree, create an allow rule with only the `read` action for the
directories where developers keep repositories, such as `~/src/**`.
@y
To let agents work on repositories without applying their edits to the host
working tree, create an allow rule with only the `read` action for the
directories where developers keep repositories, such as `~/src/**`.
@z

@x
In clone mode, the sandbox mounts the repository read-only and the agent works
on a private clone inside the sandbox, so `read` access is enough:
@y
In clone mode, the sandbox mounts the repository read-only and the agent works
on a private clone inside the sandbox, so `read` access is enough:
@z

@x
```console
$ sbx run --clone claude ~/src/app
```
@y
```console
$ sbx run --clone claude ~/src/app
```
@z

@x
Using the repository as the primary workspace without `--clone` needs `write`
access as well. Default deny blocks it, because no rule allows `write`.
Read-only mounts of these directories, such as an additional workspace mounted
with `:ro`, are still allowed.
@y
Using the repository as the primary workspace without `--clone` needs `write`
access as well. Default deny blocks it, because no rule allows `write`.
Read-only mounts of these directories, such as an additional workspace mounted
with `:ro`, are still allowed.
@z

@x
If another policy allows `write` on these directories, for example a `~/**`
rule like the one in the previous example, also add a deny rule with the
`write` action. A deny takes precedence over any allow. For more details, see
[Clone mode](../../../sandboxes/usage.md#clone-mode).
@y
If another policy allows `write` on these directories, for example a `~/**`
rule like the one in the previous example, also add a deny rule with the
`write` action. A deny takes precedence over any allow. For more details, see
[Clone mode](../../../sandboxes/usage.md#clone-mode).
@z

@x
## When changes take effect
@y
## When changes take effect
@z

@x
Filesystem policy is checked when a sandbox is created and each time it starts.
Once a policy change has
[synced to the developer's machine](_index.md#when-policy-changes-reach-developers),
it applies the next time a sandbox starts. A sandbox that's already running
keeps its mount until it stops.
@y
Filesystem policy is checked when a sandbox is created and each time it starts.
Once a policy change has
[synced to the developer's machine](_index.md#when-policy-changes-reach-developers),
it applies the next time a sandbox starts. A sandbox that's already running
keeps its mount until it stops.
@z
