%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: How it works
description: Understand how Docker Projects works 
keywords: docker projects
@y
title: How it works
description: Understand how Docker Projects works 
keywords: docker projects
@z

@x
Docker Projects requires a Compose file (`compose.yml`) to define your application's services, networks, and configurations. When you open a project, Docker Projects automatically detects the Compose file, allowing you to configure and run services with pre-set commands. 
@y
Docker Projects requires a Compose file (`compose.yml`) to define your application's services, networks, and configurations. When you open a project, Docker Projects automatically detects the Compose file, allowing you to configure and run services with pre-set commands. 
@z

@x
By integrating with Docker Compose, Docker Projects ensures a consistent, easy-to-manage workflow for both individual developers and teams. Whether you're starting a new project, configuring it, or collaborating with a team, Docker Projects keeps the process simple.
@y
By integrating with Docker Compose, Docker Projects ensures a consistent, easy-to-manage workflow for both individual developers and teams. Whether you're starting a new project, configuring it, or collaborating with a team, Docker Projects keeps the process simple.
@z

@x
Docker Projects works as follows:
@y
Docker Projects works as follows:
@z

@x
1. Create or open a project. You can:
@y
1. Create or open a project. You can:
@z

@x
   - Open a local project: Select a folder on your machine that contains your project code.
   - Clone a Git repository: Provide a repository URL and clone the project into a local directory.
@y
   - Open a local project: Select a folder on your machine that contains your project code.
   - Clone a Git repository: Provide a repository URL and clone the project into a local directory.
@z

@x
   Once a project is opened, Docker Desktop detects the Compose file and prepares the project for execution.
@y
   Once a project is opened, Docker Desktop detects the Compose file and prepares the project for execution.
@z

@x
2. Configure and run your project with pre-configured commands. These commands:
@y
2. Configure and run your project with pre-configured commands. These commands:
@z

@x
   - Work like `docker compose up`, launching services based on the Compose file.
   - Can be customized with additional flags, multiple Compose files, and environment variables.
   - Enable pre-run tasks, such as executing scripts before starting the services.
@y
   - Work like `docker compose up`, launching services based on the Compose file.
   - Can be customized with additional flags, multiple Compose files, and environment variables.
   - Enable pre-run tasks, such as executing scripts before starting the services.
@z

@x
   All of which means you can fine-tune your configurations without manually running complex CLI commands.
@y
   All of which means you can fine-tune your configurations without manually running complex CLI commands.
@z

@x
3. Collaborate and share with teams. For projects linked to a Git repository, Docker Projects stores artifacts in the cloud, enabling easy collaboration:
@y
3. Collaborate and share with teams. For projects linked to a Git repository, Docker Projects stores artifacts in the cloud, enabling easy collaboration:
@z

@x
   - Work across devices: Open a project from any machine and instantly access stored configurations.
   - Share configurations: Team members can access pre-defined run commands, reducing setup time.
@y
   - Work across devices: Open a project from any machine and instantly access stored configurations.
   - Share configurations: Team members can access pre-defined run commands, reducing setup time.
@z

@x
   Collaboration is easy — new developers can join a team, open a project, and start working without complex setup steps.
@y
   Collaboration is easy — new developers can join a team, open a project, and start working without complex setup steps.
@z

@x
4. Manage and iterate. Once a project is up and running, Docker Projects makes it easy to monitor, update, and troubleshoot:
@y
4. Manage and iterate. Once a project is up and running, Docker Projects makes it easy to monitor, update, and troubleshoot:
@z

@x
   - View logs to debug issues and track service activity.
   - Edit configurations and run commands as requirements change.
@y
   - View logs to debug issues and track service activity.
   - Edit configurations and run commands as requirements change.
@z

@x
## What's next
@y
## What's next
@z

@x
 - [Learn how to open a new project](/manuals/projects/open.md)
 - [Explore common FAQs](/manuals/projects/faq.md)
@y
 - [Learn how to open a new project](manuals/projects/open.md)
 - [Explore common FAQs](manuals/projects/faq.md)
@z
