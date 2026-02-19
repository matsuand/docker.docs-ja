%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gordon
description: AI agent for Docker workflows - execute tasks, debug issues, and
  manage containers with intelligent assistance
@y
title: Gordon
description: AI agent for Docker workflows - execute tasks, debug issues, and
  manage containers with intelligent assistance
@z

@x
      text: Beta
@y
      text: ベータ
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon is an AI agent that takes action on your Docker workflows. It analyzes
your environment, proposes solutions, and executes commands with your
permission. Available in Docker Desktop and via the `docker ai` CLI command.
@y
Gordon is an AI agent that takes action on your Docker workflows. It analyzes
your environment, proposes solutions, and executes commands with your
permission. Available in Docker Desktop and via the `docker ai` CLI command.
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
- Docker Desktop 4.61.0 or later
- Sign in to your Docker account
@y
- Docker Desktop 4.61.0 or later
- Sign in to your Docker account
@z

@x
> [!NOTE]
> Gordon is enabled by default for Personal, Pro, and Team subscriptions. For
> Business subscriptions, an administrator must enable Gordon for the
> organization before users can access it.
@y
> [!NOTE]
> Gordon is enabled by default for Personal, Pro, and Team subscriptions. For
> Business subscriptions, an administrator must enable Gordon for the
> organization before users can access it.
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
2. Select **Ask Gordon** in the sidebar.
3. Select your project directory.
4. Type a question: "What containers are running?"
@y
1. Open Docker Desktop.
2. Select **Ask Gordon** in the sidebar.
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
   ![Gordon running in the terminal](./images/gordon_tui.avif?border=true)
@y
   ![Gordon running in the terminal](./images/gordon_tui.avif?border=true)
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
![Gordon permission request](./images/permissions.avif)
@y
![Gordon permission request](./images/permissions.avif)
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

@x
## Usage and availability
@y
## Usage and availability
@z

@x
Gordon is available with all Docker subscriptions. Usage limits vary by tier:
@y
Gordon is available with all Docker subscriptions. Usage limits vary by tier:
@z

@x
- Personal: Baseline usage
- Pro and Team: 3x more usage than Personal
- Business: 6x more usage than Personal
@y
- Personal: Baseline usage
- Pro and Team: 3x more usage than Personal
- Business: 6x more usage than Personal
@z

@x
For details, see [Usage and limits](./usage-and-limits/).
@y
For details, see [Usage and limits](./usage-and-limits/).
@z
