%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Workspace trust
@y
title: Workspace trust
@z

@x
description: |
  How sandboxed agents interact with your workspace files and what to review
  after an agent session.
@y
description: |
  How sandboxed agents interact with your workspace files and what to review
  after an agent session.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Agents running in sandboxes have full access to the workspace directory without
prompting. With the default direct mount, changes the agent makes appear on
your host immediately. Treat sandbox-modified workspace files the same way
you would treat a pull request from an untrusted contributor: review before
you trust them on your host.
@y
Agents running in sandboxes have full access to the workspace directory without
prompting. With the default direct mount, changes the agent makes appear on
your host immediately. Treat sandbox-modified workspace files the same way
you would treat a pull request from an untrusted contributor: review before
you trust them on your host.
@z

@x
## What the agent can modify
@y
## What the agent can modify
@z

@x
The agent can create, modify, and delete any file in the workspace. This
includes:
@y
The agent can create, modify, and delete any file in the workspace. This
includes:
@z

@x
- Source code files
- Configuration files (`.eslintrc`, `pyproject.toml`, `.env`, etc.)
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- Hidden files and directories
- Shell scripts and executables
@y
- Source code files
- Configuration files (`.eslintrc`, `pyproject.toml`, `.env`, etc.)
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- Hidden files and directories
- Shell scripts and executables
@z

@x
> [!CAUTION]
> Files like Git hooks, CI configuration, IDE task configs, and build scripts
> execute code when triggered by normal development actions such as committing,
> building, or opening the project in an IDE. Review these files after any agent
> session before performing those actions.
@y
> [!CAUTION]
> Files like Git hooks, CI configuration, IDE task configs, and build scripts
> execute code when triggered by normal development actions such as committing,
> building, or opening the project in an IDE. Review these files after any agent
> session before performing those actions.
@z

@x
## Branch mode
@y
## Branch mode
@z

@x
The `--branch` flag lets the agent work on a separate branch. This is a
workflow convenience, not a security boundary: the agent still mounts the full
repository. See the [usage guide](../usage.md) for details.
@y
The `--branch` flag lets the agent work on a separate branch. This is a
workflow convenience, not a security boundary: the agent still mounts the full
repository. See the [usage guide](../usage.md) for details.
@z

@x
## Reviewing changes
@y
## Reviewing changes
@z

@x
After an agent session, review changes before executing any code the agent
touched.
@y
After an agent session, review changes before executing any code the agent
touched.
@z

@x
With the default direct mount, changes are in your working tree:
@y
With the default direct mount, changes are in your working tree:
@z

@x
```console
$ git diff
```
@y
```console
$ git diff
```
@z

@x
If you used `--branch`, the agent's changes are on a separate branch:
@y
If you used `--branch`, the agent's changes are on a separate branch:
@z

@x
```console
$ git diff main..my-feature
```
@y
```console
$ git diff main..my-feature
```
@z

@x
Pay particular attention to:
@y
Pay particular attention to:
@z

@x
- **Git hooks** (`.git/hooks/`): run on commit, push, and other Git actions.
  These are inside `.git/` and **do not appear in `git diff` output**. Check
  them separately with `ls -la .git/hooks/`.
- **CI configuration** (`.github/workflows/`, `.gitlab-ci.yml`): runs on push
- **Build files** (`Makefile`, `package.json` scripts, `Cargo.toml`): run
  during build or install steps
- **IDE configuration** (`.vscode/tasks.json`, `.idea/`): can run tasks when
  you open the project
- **Executable files and shell scripts**: can run directly
@y
- **Git hooks** (`.git/hooks/`): run on commit, push, and other Git actions.
  These are inside `.git/` and **do not appear in `git diff` output**. Check
  them separately with `ls -la .git/hooks/`.
- **CI configuration** (`.github/workflows/`, `.gitlab-ci.yml`): runs on push
- **Build files** (`Makefile`, `package.json` scripts, `Cargo.toml`): run
  during build or install steps
- **IDE configuration** (`.vscode/tasks.json`, `.idea/`): can run tasks when
  you open the project
- **Executable files and shell scripts**: can run directly
@z

@x
These files execute code without you explicitly running them. Review them before
committing, building, or opening the project in an IDE.
@y
These files execute code without you explicitly running them. Review them before
committing, building, or opening the project in an IDE.
@z
