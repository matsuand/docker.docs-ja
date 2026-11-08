%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Filesystem mount rule syntax
linkTitle: Filesystem mount rules
@y
title: Filesystem mount rule syntax
linkTitle: Filesystem mount rules
@z

@x
description: Syntax for sandbox filesystem mount rules, including path patterns across macOS, Linux, Windows, and WSL.
keywords: docker sandboxes, filesystem rules, path patterns, workspace mount, rule syntax
@y
description: Syntax for sandbox filesystem mount rules, including path patterns across macOS, Linux, Windows, and WSL.
keywords: docker sandboxes, filesystem rules, path patterns, workspace mount, rule syntax
@z

@x
Filesystem mount rules are written in
[organization filesystem access policies](../organization/policies/filesystem.md).
Developers can't add them with local policy. Filesystem mount rules use the
actions `read` and `write`. Resources are host paths that sandboxes can mount
as workspaces. The rules control which paths a sandbox can mount, not access to
individual files inside an allowed mount.
@y
Filesystem mount rules are written in
[organization filesystem access policies](../organization/policies/filesystem.md).
Developers can't add them with local policy. Filesystem mount rules use the
actions `read` and `write`. Resources are host paths that sandboxes can mount
as workspaces. The rules control which paths a sandbox can mount, not access to
individual files inside an allowed mount.
@z

@x
A workspace mounted with write access must be allowed by both a `read` and a
`write` rule. A read-only workspace needs only `read`. When default deny blocks
a mount, the denial reason names whether read or write access was missing.
@y
A workspace mounted with write access must be allowed by both a `read` and a
`write` rule. A read-only workspace needs only `read`. When default deny blocks
a mount, the denial reason names whether read or write access was missing.
@z

@x
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. The policy engine expands
only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@y
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. The policy engine expands
only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@z

@x
For a path outside the home directory, write it in the format the user's
operating system uses. A rule matches only the format it's written in, so a
location that several platforms share needs a rule for each:
@y
For a path outside the home directory, write it in the format the user's
operating system uses. A rule matches only the format it's written in, so a
location that several platforms share needs a rule for each:
@z

@x
| Operating system | Example path                               |
| ---------------- | ------------------------------------------ |
| macOS, Linux     | `/data/project/**`                         |
| Windows          | `C:\data\project\**`                       |
| WSL              | `\\wsl.localhost\<distro>\data\project\**` |
@y
| Operating system | Example path                               |
| ---------------- | ------------------------------------------ |
| macOS, Linux     | `/data/project/**`                         |
| Windows          | `C:\data\project\**`                       |
| WSL              | `\\wsl.localhost\<distro>\data\project\**` |
@z

@x
On Windows, `*:` matches any drive letter, so `*:\data\**` matches the path on
any drive.
@y
On Windows, `*:` matches any drive letter, so `*:\data\**` matches the path on
any drive.
@z

@x
Wildcards behave the same way in every path format:
@y
Wildcards behave the same way in every path format:
@z

@x
| Pattern            | Example    | Matches                                                    |
| ------------------ | ---------- | ---------------------------------------------------------- |
| Exact path         | `/data`    | `/data` only                                               |
| Segment wildcard   | `/data/*`  | `/data/project`, one path segment only, not subdirectories |
| Recursive wildcard | `/data/**` | `/data/project`, `/data/project/src`, any depth            |
@y
| Pattern            | Example    | Matches                                                    |
| ------------------ | ---------- | ---------------------------------------------------------- |
| Exact path         | `/data`    | `/data` only                                               |
| Segment wildcard   | `/data/*`  | `/data/project`, one path segment only, not subdirectories |
| Recursive wildcard | `/data/**` | `/data/project`, `/data/project/src`, any depth            |
@z

@x
Use `**` to match a directory tree recursively. A single `*` matches within one
path segment and won't cross a path separator. For example, `~/**` matches all
paths under the home directory, while `~/*` matches only its direct children.
@y
Use `**` to match a directory tree recursively. A single `*` matches within one
path segment and won't cross a path separator. For example, `~/**` matches all
paths under the home directory, while `~/*` matches only its direct children.
@z
