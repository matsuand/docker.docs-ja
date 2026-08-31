%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Gordon
description:
  AI assistant for Docker workflows - execute tasks, debug issues, and
  manage containers with intelligent assistance
@y
title: Gordon
description:
  AI assistant for Docker workflows - execute tasks, debug issues, and
  manage containers with intelligent assistance
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon is an AI-powered assistant that takes action on your Docker workflows.
It analyzes your environment, proposes solutions, and executes commands with
your permission.
@y
Gordon is an AI-powered assistant that takes action on your Docker workflows.
It analyzes your environment, proposes solutions, and executes commands with
your permission.
@z

@x
## What Gordon does
@y
## What Gordon does
@z

@x
Gordon takes action to help you with Docker tasks:
@y
Gordon takes action to help you with Docker tasks:
@z

@x
- Explains Docker concepts and commands
- Searches Docker documentation and web resources for solutions
- Writes and modifies Dockerfiles following best practices
- Debugs container failures by reading logs and proposing fixes
- Manages containers, images, volumes, and networks
@y
- Explains Docker concepts and commands
- Searches Docker documentation and web resources for solutions
- Writes and modifies Dockerfiles following best practices
- Debugs container failures by reading logs and proposing fixes
- Manages containers, images, volumes, and networks
@z

@x
Gordon proposes every action before executing. You approve what it does.
@y
Gordon proposes every action before executing. You approve what it does.
@z

@x
## Where to use Gordon
@y
## Where to use Gordon
@z

@x
Gordon is available on four surfaces:
@y
Gordon is available on four surfaces:
@z

@x
- Open the Gordon view from the Docker Desktop sidebar to run Docker commands
  with your approval. See [Using Gordon in Docker
  Desktop](./how-to/docker-desktop.md).
- Run `docker ai` in the terminal to use the full assistant from the command
  line. See [Using Gordon via CLI](./how-to/cli.md).
- Select the Gordon icon on any repository page at
  [hub.docker.com](https://hub.docker.com) to ask about a repository's
  images, tags, and metadata. Hand off to Docker Desktop to take action.
- Select the Gordon icon on any page at
  [docs.docker.com](https://docs.docker.com) to ask Docker questions.
@y
- Open the Gordon view from the Docker Desktop sidebar to run Docker commands
  with your approval. See [Using Gordon in Docker
  Desktop](./how-to/docker-desktop.md).
- Run `docker ai` in the terminal to use the full assistant from the command
  line. See [Using Gordon via CLI](./how-to/cli.md).
- Select the Gordon icon on any repository page at
  [hub.docker.com](https://hub.docker.com) to ask about a repository's
  images, tags, and metadata. Hand off to Docker Desktop to take action.
- Select the Gordon icon on any page at
  [docs.docker.com](https://docs.docker.com) to ask Docker questions.
@z

@x
Docker Desktop and the CLI count against your Gordon plan's [usage
limits](./usage-limits.md). Gordon on Docker Hub and docs.docker.com is free
and does not require a Docker account or a Docker Desktop install. It has
its own shared public usage limit and does not access your Docker
environment.
@y
Docker Desktop and the CLI count against your Gordon plan's [usage
limits](./usage-limits.md). Gordon on Docker Hub and docs.docker.com is free
and does not require a Docker account or a Docker Desktop install. It has
its own shared public usage limit and does not access your Docker
environment.
@z

@x
## Get started
@y
## Get started
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before you begin:
@y
Before you begin:
@z

@x
- Docker Desktop 4.74 or later
- Sign in to your Docker account
@y
- Docker Desktop 4.74 or later
- Sign in to your Docker account
@z

@x
> [!NOTE]
> Gordon is enabled by default for signed-in Docker users. If your account
> belongs to an organization with a Business subscription, access requires two
> additional steps:
>
> 1. Contact Docker Support to activate Gordon for your organization. Docker
>    will confirm when activation is complete.
> 2. Once confirmed, an organization administrator must turn on Gordon via
>    [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md).
>    Set **Enable Gordon** to **Enabled** or **Always enabled**. Ensure all
>    Settings Management prerequisites are met for the setting to take effect
>    on Docker Desktop clients.
@y
> [!NOTE]
> Gordon is enabled by default for signed-in Docker users. If your account
> belongs to an organization with a Business subscription, access requires two
> additional steps:
>
> 1. Contact Docker Support to activate Gordon for your organization. Docker
>    will confirm when activation is complete.
> 2. Once confirmed, an organization administrator must turn on Gordon via
>    [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md).
>    Set **Enable Gordon** to **Enabled** or **Always enabled**. Ensure all
>    Settings Management prerequisites are met for the setting to take effect
>    on Docker Desktop clients.
@z

@x
### Quick start
@y
### Quick start
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@z

@x
1. Open Docker Desktop.
2. Select **Gordon** in the sidebar.
3. Select your project directory.
4. Type a question: "What containers are running?"
@y
1. Open Docker Desktop.
2. Select **Gordon** in the sidebar.
3. Select your project directory.
4. Type a question: "What containers are running?"
@z

@x
   ![Gordon running in Docker Desktop](./images/gordon_gui.avif)
@y
   ![Gordon running in Docker Desktop](./images/gordon_gui.avif)
@z

@x
5. Review Gordon's proposed actions and approve.
@y
5. Review Gordon's proposed actions and approve.
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
1. Open your terminal and run:
@y
1. Open your terminal and run:
@z

@x
   ```console
   $ docker ai
   ```
@y
   ```console
   $ docker ai
   ```
@z

@x
   This opens the Terminal User Interface (TUI) for Gordon.
@y
   This opens the Terminal User Interface (TUI) for Gordon.
@z

@x
2. Type a question: "what containers are running?" and press <kbd>Enter</kbd>.
@y
2. Type a question: "what containers are running?" and press <kbd>Enter</kbd>.
@z

@x
   ![Gordon running in the terminal](./images/gordon_tui.avif)
@y
   ![Gordon running in the terminal](./images/gordon_tui.avif)
@z

@x
3. Review Gordon's proposed actions and approve by typing `y`.
@y
3. Review Gordon's proposed actions and approve by typing `y`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Permissions
@y
### Permissions
@z

@x
By default, Gordon asks for approval before executing actions. You can approve
individual actions or allow all actions for the current session.
@y
By default, Gordon asks for approval before executing actions. You can approve
individual actions or allow all actions for the current session.
@z

@x
![Gordon permission request](./images/gordon_permissions_prompt.avif)
@y
![Gordon permission request](./images/gordon_permissions_prompt.avif)
@z

@x
Permissions reset for each session. To configure default permissions or enable
auto-approve mode, see [Permissions](./how-to/permissions.md).
@y
Permissions reset for each session. To configure default permissions or enable
auto-approve mode, see [Permissions](./how-to/permissions.md).
@z

@x
### Try these examples
@y
### Try these examples
@z

@x
Container inspection:
@y
Container inspection:
@z

@x
```console
$ docker ai "show me logs from my nginx container"
```
@y
```console
$ docker ai "show me logs from my nginx container"
```
@z

@x
Dockerfile review:
@y
Dockerfile review:
@z

@x
```console
$ docker ai "review my Dockerfile for best practices"
```
@y
```console
$ docker ai "review my Dockerfile for best practices"
```
@z

@x
Image management:
@y
Image management:
@z

@x
```console
$ docker ai "list my local images and their sizes"
```
@y
```console
$ docker ai "list my local images and their sizes"
```
@z
