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
Filesystem mount rules make up
[organization filesystem access policies](../organization/policies/filesystem.md).
Each rule lists host paths that sandboxes can mount as workspaces, and the
access it allows or denies on them: `read`, `write`, or both. To add rules to a
policy, see
[Create and manage organization policies](../organization/policies/create-manage.md).
@y
Filesystem mount rules make up
[organization filesystem access policies](../organization/policies/filesystem.md).
Each rule lists host paths that sandboxes can mount as workspaces, and the
access it allows or denies on them: `read`, `write`, or both. To add rules to a
policy, see
[Create and manage organization policies](../organization/policies/create-manage.md).
@z

@x
When a sandbox mounts a workspace, Docker Sandboxes checks the path against
these rules for the access the mount needs. A read-only workspace needs only
`read`. A writable workspace needs both `read` and `write`, so the path must be
allowed for both actions.
@y
When a sandbox mounts a workspace, Docker Sandboxes checks the path against
these rules for the access the mount needs. A read-only workspace needs only
`read`. A writable workspace needs both `read` and `write`, so the path must be
allowed for both actions.
@z

@x
## Path patterns
@y
## Path patterns
@z

@x
### Home directory
@y
### Home directory
@z

@x
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. Write `~` with a forward
slash, such as `~/**`, on every platform, including Windows. The policy engine
expands only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@y
`~` expands to the user's home directory on every platform, including Windows,
where it resolves to `%USERPROFILE%`. A single `~/**` rule therefore matches
each user's home tree on macOS, Linux, and Windows. Write `~` with a forward
slash, such as `~/**`, on every platform, including Windows. The policy engine
expands only `~`: it does not expand environment variables, so a pattern such as
`%USERPROFILE%\**` or `$HOME/**` matches nothing.
@z

@x
### Operating system formats
@y
### Operating system formats
@z

@x
For a path outside the home directory, write it in the format the user's
operating system uses. A macOS or Linux path doesn't match a Windows or WSL
path, so a location that several platforms share needs a rule for each:
@y
For a path outside the home directory, write it in the format the user's
operating system uses. A macOS or Linux path doesn't match a Windows or WSL
path, so a location that several platforms share needs a rule for each:
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
### Wildcards
@y
### Wildcards
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
For example, `~/**` matches all paths under the home directory, while `~/*`
matches only its direct children.
@y
For example, `~/**` matches all paths under the home directory, while `~/*`
matches only its direct children.
@z

@x
### Case and separators
@y
### Case and separators
@z

@x
Matching ignores some differences in how a path is written:
@y
Matching ignores some differences in how a path is written:
@z

@x
| Difference                                         | Ignored               | Example                                       |
| -------------------------------------------------- | --------------------- | --------------------------------------------- |
| Slash direction                                    | Yes, except after `~` | `C:/data/**` and `C:\data\**` are the same    |
| Case in Windows drive and UNC paths, including WSL | Yes                   | `C:\Data\**` matches `c:\data\project`        |
| Case in macOS and Linux paths                      | No                    | `/Data/**` doesn't match `/data/project`      |
| WSL prefix                                         | Yes                   | `\\wsl$\` and `\\wsl.localhost\` are the same |
@y
| Difference                                         | Ignored               | Example                                       |
| -------------------------------------------------- | --------------------- | --------------------------------------------- |
| Slash direction                                    | Yes, except after `~` | `C:/data/**` and `C:\data\**` are the same    |
| Case in Windows drive and UNC paths, including WSL | Yes                   | `C:\Data\**` matches `c:\data\project`        |
| Case in macOS and Linux paths                      | No                    | `/Data/**` doesn't match `/data/project`      |
| WSL prefix                                         | Yes                   | `\\wsl$\` and `\\wsl.localhost\` are the same |
@z

@x
macOS paths are case sensitive even on a case-insensitive volume, so write rules
with the directory names' capitalization on disk.
@y
macOS paths are case sensitive even on a case-insensitive volume, so write rules
with the directory names' capitalization on disk.
@z

@x
## How mount paths are resolved
@y
## How mount paths are resolved
@z

@x
Docker Sandboxes checks the rules against the resolved workspace path, not the
path a developer passes to `sbx run` or `sbx create`. It expands `~`, makes
the path absolute, removes `.` and `..` segments, and resolves the path as
follows:
@y
Docker Sandboxes checks the rules against the resolved workspace path, not the
path a developer passes to `sbx run` or `sbx create`. It expands `~`, makes
the path absolute, removes `.` and `..` segments, and resolves the path as
follows:
@z

@x
| Developer passes             | Path checked      |
| ---------------------------- | ----------------- |
| A relative path, such as `.` | The absolute path |
| A symbolic link              | The link's target |
@y
| Developer passes             | Path checked      |
| ---------------------------- | ----------------- |
| A relative path, such as `.` | The absolute path |
| A symbolic link              | The link's target |
@z

@x
Because symbolic links are followed, a link under an allowed path is denied
when it points to a directory that no rule allows.
@y
Because symbolic links are followed, a link under an allowed path is denied
when it points to a directory that no rule allows.
@z
