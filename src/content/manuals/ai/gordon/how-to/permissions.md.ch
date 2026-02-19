%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Gordon's permission model
linkTitle: Permissions
description: How Gordon's ask-first approach keeps you in control
@y
title: Gordon's permission model
linkTitle: Permissions
description: How Gordon's ask-first approach keeps you in control
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Before Gordon uses a tool or action that can modify your system, it proposes
the action and waits for your approval before executing.
@y
Before Gordon uses a tool or action that can modify your system, it proposes
the action and waits for your approval before executing.
@z

@x
## What requires approval
@y
## What requires approval
@z

@x
By default, the following actions require approval before Gordon can use them:
@y
By default, the following actions require approval before Gordon can use them:
@z

@x
- Commands executed in your shell
- Writing or changing files
- Fetching information from the internet
@y
- Commands executed in your shell
- Writing or changing files
- Fetching information from the internet
@z

@x
## What doesn't require approval
@y
## What doesn't require approval
@z

@x
- Reading files, listing directories (even outside Gordon's working directory)
- Searching the Docker documentation
- Analyzing code or explaining errors
@y
- Reading files, listing directories (even outside Gordon's working directory)
- Searching the Docker documentation
- Analyzing code or explaining errors
@z

@x
## Configuring permission settings
@y
## Configuring permission settings
@z

@x
To change the default permission settings for Gordon:
@y
To change the default permission settings for Gordon:
@z

@x
1. Open Docker Desktop.
2. Select **Ask Gordon** in the sidebar.
3. Select the settings icon at the bottom of text input.
@y
1. Open Docker Desktop.
2. Select **Ask Gordon** in the sidebar.
3. Select the settings icon at the bottom of text input.
@z

@x
   ![Session settings icon](../images/perm_settings.avif)
@y
   ![Session settings icon](../images/perm_settings.avif)
@z

@x
In the **Basic** tab you can configure whether Gordon should ask for permission
before using a tool.
@y
In the **Basic** tab you can configure whether Gordon should ask for permission
before using a tool.
@z

@x
You can also enable YOLO mode to bypass permission checking altogether.
@y
You can also enable YOLO mode to bypass permission checking altogether.
@z

@x
The new permission settings apply immediately to all sessions.
@y
The new permission settings apply immediately to all sessions.
@z

@x
## Session-level permissions
@y
## Session-level permissions
@z

@x
When you choose "Approve for this session" (Desktop) or "A" (CLI), Gordon can
use that specific tool without asking again during the current conversation.
@y
When you choose "Approve for this session" (Desktop) or "A" (CLI), Gordon can
use that specific tool without asking again during the current conversation.
@z

@x
Example:
@y
Example:
@z

@x
```console
$ docker ai "check my containers and clean up stopped ones"
@y
```console
$ docker ai "check my containers and clean up stopped ones"
@z

@x
Gordon proposes:
  docker ps -a
@y
Gordon proposes:
  docker ps -a
@z

@x
Approve? [Y/n/a]: a
@y
Approve? [Y/n/a]: a
@z

@x
[Gordon executes docker ps -a]
@y
[Gordon executes docker ps -a]
@z

@x
Gordon proposes:
  docker container prune -f
@y
Gordon proposes:
  docker container prune -f
@z

@x
[Executes automatically - you approved shell access for this session]
```
@y
[Executes automatically - you approved shell access for this session]
```
@z

@x
Session permissions reset when:
@y
Session permissions reset when:
@z

@x
- You close the Gordon view (Desktop)
- You exit `docker ai` (CLI)
- You start a new conversation
@y
- You close the Gordon view (Desktop)
- You exit `docker ai` (CLI)
- You start a new conversation
@z

@x
## Security considerations
@y
## Security considerations
@z

@x
Working directory
: The working directory sets the default context for file operations. It does
  not constrain Gordon's access to files or directories; Gordon can read files
  outside this directory.
@y
Working directory
: The working directory sets the default context for file operations. It does
  not constrain Gordon's access to files or directories; Gordon can read files
  outside this directory.
@z

@x
Verify before approving
: Gordon can make mistakes. Before approving:
@y
Verify before approving
: Gordon can make mistakes. Before approving:
@z

@x
  - Confirm commands match your intent
  - Check container names and image tags are correct
  - Verify volume mounts and port mappings
  - Review file changes for important logic
@y
  - Confirm commands match your intent
  - Check container names and image tags are correct
  - Verify volume mounts and port mappings
  - Review file changes for important logic
@z

@x
  If you don't understand an operation, ask Gordon to explain it or reject and
  request a different approach.
@y
  If you don't understand an operation, ask Gordon to explain it or reject and
  request a different approach.
@z

@x
Destructive operations
: Gordon warns about destructive operations but won't prevent them. Operations
  like `docker container rm`, `docker system prune`, and `docker volume rm` can
  cause permanent data loss. Back up important data first.
@y
Destructive operations
: Gordon warns about destructive operations but won't prevent them. Operations
  like `docker container rm`, `docker system prune`, and `docker volume rm` can
  cause permanent data loss. Back up important data first.
@z

@x
## Stopping and reverting
@y
## Stopping and reverting
@z

@x
Stop Gordon during execution by pressing `Ctrl+C` (CLI) or selecting **Cancel**
(Desktop).
@y
Stop Gordon during execution by pressing `Ctrl+C` (CLI) or selecting **Cancel**
(Desktop).
@z

@x
Revert Gordon's actions using Docker commands or version control:
@y
Revert Gordon's actions using Docker commands or version control:
@z

@x
- Restore files from Git
- Restart stopped containers
- Rebuild images
- Recreate volumes from backups
@y
- Restore files from Git
- Restart stopped containers
- Rebuild images
- Recreate volumes from backups
@z

@x
Use version control for all files in your working directory.
@y
Use version control for all files in your working directory.
@z

@x
## Organizational controls
@y
## Organizational controls
@z

@x
Administrators can control Gordon's capabilities at the organization level
using Settings Management.
@y
Administrators can control Gordon's capabilities at the organization level
using Settings Management.
@z

@x
Available controls:
@y
Available controls:
@z

@x
- Disable Gordon entirely
- Restrict tool capabilities
- Set working directory boundaries
@y
- Disable Gordon entirely
- Restrict tool capabilities
- Set working directory boundaries
@z

@x
For Business subscriptions, Gordon must be enabled by an administrator before
users can access it.
@y
For Business subscriptions, Gordon must be enabled by an administrator before
users can access it.
@z

@x
See [Settings Management](/enterprise/security/hardened-desktop/settings-management/)
for details.
@y
See [Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/)
for details.
@z
