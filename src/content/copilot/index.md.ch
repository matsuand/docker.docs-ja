%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker for GitHub Copilot
description: Learn how to use the Docker Extension for GitHub Copilot to streamline Docker-related tasks.
keywords: Docker, GitHub Copilot, extension, Visual Studio Code, chat, ai, containerization
---
@y
---
title: Docker for GitHub Copilot
description: Learn how to use the Docker Extension for GitHub Copilot to streamline Docker-related tasks.
keywords: Docker, GitHub Copilot, extension, Visual Studio Code, chat, ai, containerization
---
@z

@x
> **Early Access**
>
> The Docker for GitHub Copilot extension is a part of the [Limited Public Beta](https://github.blog/changelog/2024-05-21-copilot-extensions-now-in-limited-public-beta/)
> for GitHub Copilot Extensions. Only members of the beta program are eligible to use this extension.
{ .restricted }
@y
> **Early Access**
>
> The Docker for GitHub Copilot extension is a part of the [Limited Public Beta](https://github.blog/changelog/2024-05-21-copilot-extensions-now-in-limited-public-beta/)
> for GitHub Copilot Extensions. Only members of the beta program are eligible to use this extension.
{ .restricted }
@z

@x
The Docker Extension for GitHub Copilot integrates Docker's capabilities with
GitHub Copilot, providing assistance with containerizing applications and
generating Docker assets. This extension helps you streamline Docker-related
tasks wherever GitHub Copilot Chat is available.
@y
The Docker Extension for GitHub Copilot integrates Docker's capabilities with
GitHub Copilot, providing assistance with containerizing applications and
generating Docker assets. This extension helps you streamline Docker-related
tasks wherever GitHub Copilot Chat is available.
@z

@x
The key features are:
@y
The key features are:
@z

@x
- Ask questions and receive responses about containerization in any context
  when GitHub Copilot Chat is available, such as on GitHub.com and in Visual Studio Code.
- Automatically generate Dockerfiles, Docker Compose files, and .dockerignore
  files for a project.
- Open pull requests with generated Docker assets directly from the chat
  interface.
- Get summaries of project vulnerabilities from Docker Scout and receive next
  steps via CLI.
@y
- Ask questions and receive responses about containerization in any context
  when GitHub Copilot Chat is available, such as on GitHub.com and in Visual Studio Code.
- Automatically generate Dockerfiles, Docker Compose files, and .dockerignore
  files for a project.
- Open pull requests with generated Docker assets directly from the chat
  interface.
- Get summaries of project vulnerabilities from Docker Scout and receive next
  steps via CLI.
@z

@x
## Supported languages
@y
## Supported languages
@z

@x
The Docker Extension for GitHub Copilot supports the following
programming languages:
@y
The Docker Extension for GitHub Copilot supports the following
programming languages:
@z

@x
- Dockerfile
- Java
- JavaScript
- Python
- TypeScript
@y
- Dockerfile
- Java
- JavaScript
- Python
- TypeScript
@z

@x
## Get Started
@y
## Get Started
@z

@x
Here's how to get started with the Docker Extension for GitHub Copilot.
@y
Here's how to get started with the Docker Extension for GitHub Copilot.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before you start, ensure that:
@y
Before you start, ensure that:
@z

@x
- You have been granted access to GitHub's [limited public beta program](https://github.blog/changelog/2024-05-21-copilot-extensions-now-in-limited-public-beta/).
- The [Docker for GitHub Copilot](https://github.com/marketplace/docker-for-github-copilot)
  app is installed in your GitHub organization.
@y
- You have been granted access to GitHub's [limited public beta program](https://github.blog/changelog/2024-05-21-copilot-extensions-now-in-limited-public-beta/).
- The [Docker for GitHub Copilot](https://github.com/marketplace/docker-for-github-copilot)
  app is installed in your GitHub organization.
@z

@x
### Setup
@y
### Setup
@z

@x
Select where you want to use the Docker Extension for GitHub Copilot:
@y
Select where you want to use the Docker Extension for GitHub Copilot:
@z

@x
{{< tabs >}}
{{< tab name="Editor or IDE" >}}
@y
{{< tabs >}}
{{< tab name="Editor or IDE" >}}
@z

@x
For instructions on how to use the Docker Extension for GitHub Copilot in
your editor, see:
@y
For instructions on how to use the Docker Extension for GitHub Copilot in
your editor, see:
@z

@x
- [Visual Studio Code](https://docs.github.com/en/copilot/github-copilot-chat/copilot-chat-in-ides/using-github-copilot-chat-in-your-ide?tool=vscode)
- [Visual Studio](https://docs.github.com/en/copilot/github-copilot-chat/copilot-chat-in-ides/using-github-copilot-chat-in-your-ide?tool=visualstudio)
- [Codespaces](https://docs.github.com/en/codespaces/reference/using-github-copilot-in-github-codespaces)
@y
- [Visual Studio Code](https://docs.github.com/en/copilot/github-copilot-chat/copilot-chat-in-ides/using-github-copilot-chat-in-your-ide?tool=vscode)
- [Visual Studio](https://docs.github.com/en/copilot/github-copilot-chat/copilot-chat-in-ides/using-github-copilot-chat-in-your-ide?tool=visualstudio)
- [Codespaces](https://docs.github.com/en/codespaces/reference/using-github-copilot-in-github-codespaces)
@z

@x
{{< /tab >}}
{{< tab name="GitHub.com" >}}
@y
{{< /tab >}}
{{< tab name="GitHub.com" >}}
@z

@x
No setup is needed for the Docker Extension for GitHub Copilot on GitHub.com.
Simply go to any repository and start using the chat interface,
see [Using the extension](#using-the-extension).
@y
No setup is needed for the Docker Extension for GitHub Copilot on GitHub.com.
Simply go to any repository and start using the chat interface,
see [Using the extension](#using-the-extension).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Using the Extension
@y
## Using the Extension
@z

@x
The Docker Extension for GitHub Copilot provides a chat interface that you can
use to interact with the Docker agent. You can ask questions and get help
Dockerizing your project.
@y
The Docker Extension for GitHub Copilot provides a chat interface that you can
use to interact with the Docker agent. You can ask questions and get help
Dockerizing your project.
@z

@x
The Docker agent is trained to understand Docker-related questions, and provide
guidance on Dockerfiles, Docker Compose files, and other Docker assets.
@y
The Docker agent is trained to understand Docker-related questions, and provide
guidance on Dockerfiles, Docker Compose files, and other Docker assets.
@z

@x
### Editor
@y
### Editor
@z

@x
1. Open your project in your editor.
2. Open the Copilot extension or plugin.
3. Interact with the Docker agent using the `/docker` slash prompt, followed by your question.
@y
1. Open your project in your editor.
2. Open the Copilot extension or plugin.
3. Interact with the Docker agent using the `/docker` slash prompt, followed by your question.
@z

@x
### GitHub.com
@y
### GitHub.com
@z

@x
To use the Docker Extension in the GitHub web interface:
@y
To use the Docker Extension in the GitHub web interface:
@z

@x
1. Go to [github.com](https://github.com/) and sign in to your account.
2. Go to any repository.
3. Select the Copilot logo in the site menu to open the chat interface.
@y
1. Go to [github.com](https://github.com/) and sign in to your account.
2. Go to any repository.
3. Select the Copilot logo in the site menu to open the chat interface.
@z

@x
   ![Copilot chat button](/copilot/copilot-button.png?w=400px)
@y
   ![Copilot chat button](/copilot/copilot-button.png?w=400px)
@z

@x
4. Interact with the Docker agent by tagging `@docker`.
@y
4. Interact with the Docker agent by tagging `@docker`.
@z

@x
## Example prompts
@y
## Example prompts
@z

@x
Here are some examples of the types of questions you can ask the Docker agent:
@y
Here are some examples of the types of questions you can ask the Docker agent:
@z

@x
### Ask general Docker questions
@y
### Ask general Docker questions
@z

@x
You can ask general question about Docker. For example:
@y
You can ask general question about Docker. For example:
@z

@x
- `@docker what is a Dockerfile`
- `@docker how do I build a Docker image`
- `@docker how do I run a Docker container`
@y
- `@docker what is a Dockerfile`
- `@docker how do I build a Docker image`
- `@docker how do I run a Docker container`
@z

@x
### Ask questions about your project
@y
### Ask questions about your project
@z

@x
You can ask questions about your project, such as:
@y
You can ask questions about your project, such as:
@z

@x
- `@docker what is the best way to Dockerize this project`
- `@docker can you help me find vulnerabilities in my project?`
@y
- `@docker what is the best way to Dockerize this project`
- `@docker can you help me find vulnerabilities in my project?`
@z

@x
The Docker agent will analyze your project, generate the necessary files, and,
if applicable, offer to raise a pull request with the necessary Docker assets.
@y
The Docker agent will analyze your project, generate the necessary files, and,
if applicable, offer to raise a pull request with the necessary Docker assets.
@z

@x
## Performing actions on your behalf
@y
## Performing actions on your behalf
@z

@x
Before the agent performs any actions on your behalf, such as opening a pull
request for you, you're prompted to provide your consent to allow the
operation. You can always roll back or back out of the changes.
@y
Before the agent performs any actions on your behalf, such as opening a pull
request for you, you're prompted to provide your consent to allow the
operation. You can always roll back or back out of the changes.
@z

@x
![Copilot action prompt](/copilot/copilot-action-prompt.png?w=400px)
@y
![Copilot action prompt](/copilot/copilot-action-prompt.png?w=400px)
@z

@x
In the event that the agent encounters an error, for example during PR
creation, it handles timeouts and lack of responses gracefully.
@y
In the event that the agent encounters an error, for example during PR
creation, it handles timeouts and lack of responses gracefully.
@z

@x
## Feedback
@y
## Feedback
@z

@x
For issues or feedback, visit the [GitHub feedback repository](https://github.com/docker/copilot-issues).
@y
For issues or feedback, visit the [GitHub feedback repository](https://github.com/docker/copilot-issues).
@z
