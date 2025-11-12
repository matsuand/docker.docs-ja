%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Sandboxes
description: Run AI agents in isolated environments
@y
title: Docker Sandboxes
description: Run AI agents in isolated environments
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Docker Sandboxes simplifies running AI agents securely on your local machine.
Designed for developers building with coding agents like Claude Code, Sandboxes
isolate your agents from your local machine while preserving a familiar
development experience. With Docker Sandboxes, agents can execute commands,
install packages, and modify files inside a containerized workspace that
mirrors your local directory. This gives you full agent autonomy without
compromising safety.
@y
Docker Sandboxes simplifies running AI agents securely on your local machine.
Designed for developers building with coding agents like Claude Code, Sandboxes
isolate your agents from your local machine while preserving a familiar
development experience. With Docker Sandboxes, agents can execute commands,
install packages, and modify files inside a containerized workspace that
mirrors your local directory. This gives you full agent autonomy without
compromising safety.
@z

@x
## How it works
@y
## How it works
@z

@x
When you run `docker sandbox run <agent>`:
@y
When you run `docker sandbox run <agent>`:
@z

@x
1. Docker creates a container from a template image and mounts your current
   working directory into the container at the same path.
@y
1. Docker creates a container from a template image and mounts your current
   working directory into the container at the same path.
@z

@x
2. Docker discovers your Git `user.name` and `user.email` configuration and
   injects it into the container so commits made by the agent are attributed
   to you.
@y
2. Docker discovers your Git `user.name` and `user.email` configuration and
   injects it into the container so commits made by the agent are attributed
   to you.
@z

@x
3. On first run, you're prompted to authenticate. Credentials are stored in a
   Docker volume and reused for future sandboxed agents.
@y
3. On first run, you're prompted to authenticate. Credentials are stored in a
   Docker volume and reused for future sandboxed agents.
@z

@x
4. The agent starts inside the container with bypass permissions enabled.
@y
4. The agent starts inside the container with bypass permissions enabled.
@z

@x
### Workspace mounting
@y
### Workspace mounting
@z

@x
Your workspace directory is mounted into the container at the same absolute path
(on macOS and Linux). For example, `/Users/alice/projects/myapp` on your host
is also `/Users/alice/projects/myapp` in the container. This means:
@y
Your workspace directory is mounted into the container at the same absolute path
(on macOS and Linux). For example, `/Users/alice/projects/myapp` on your host
is also `/Users/alice/projects/myapp` in the container. This means:
@z

@x
- File paths in error messages match your host
- Scripts with hard-coded paths work as expected
- Changes to workspace files are immediately visible on both host and container
@y
- File paths in error messages match your host
- Scripts with hard-coded paths work as expected
- Changes to workspace files are immediately visible on both host and container
@z

@x
### One sandbox per workspace
@y
### One sandbox per workspace
@z

@x
Docker enforces one sandbox per workspace. When you run `docker sandbox run
<agent>` in the same directory, Docker reuses the existing container. This
means state (installed packages, temporary files) persists across agent sessions
in that workspace.
@y
Docker enforces one sandbox per workspace. When you run `docker sandbox run
<agent>` in the same directory, Docker reuses the existing container. This
means state (installed packages, temporary files) persists across agent sessions
in that workspace.
@z

@x
> [!NOTE]
> To change a sandbox's configuration (environment variables, mounted volumes,
> etc.), you need to remove and recreate it. See
> [Managing sandboxes](advanced-config.md#managing-sandboxes) for details.
@y
> [!NOTE]
> To change a sandbox's configuration (environment variables, mounted volumes,
> etc.), you need to remove and recreate it. See
> [Managing sandboxes](advanced-config.md#managing-sandboxes) for details.
@z

@x
## Release status
@y
## Release status
@z

@x
Docker Sandboxes is an experimental feature. Features and setup are subject to
change.
@y
Docker Sandboxes is an experimental feature. Features and setup are subject to
change.
@z

@x
Report issues on [GitHub](https://github.com/docker/desktop-feedback).
@y
Report issues on [GitHub](https://github.com/docker/desktop-feedback).
@z

@x
## Get started
@y
## Get started
@z

@x
Head to the [Get started guide](get-started.md) to run your first sandboxed agent.
@y
Head to the [Get started guide](get-started.md) to run your first sandboxed agent.
@z
