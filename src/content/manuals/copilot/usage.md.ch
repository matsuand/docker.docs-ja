%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Using the Docker for GitHub Copilot extension
linkTitle: Usage
description: |
  Learn how to use the Docker for GitHub Copilot extension to interact with the
  Docker agent, get help Dockerizing projects, and ask Docker-related questions
  directly from your IDE or GitHub.com.
@y
title: Using the Docker for GitHub Copilot extension
linkTitle: Usage
description: |
  Learn how to use the Docker for GitHub Copilot extension to interact with the
  Docker agent, get help Dockerizing projects, and ask Docker-related questions
  directly from your IDE or GitHub.com.
@z

@x
{{% restricted title="Early Access" %}}
The Docker for GitHub Copilot extension is an [early access](/release-lifecycle#early-access-ea) product.
{{% /restricted %}}
@y
{{% restricted title="Early Access" %}}
The Docker for GitHub Copilot extension is an [early access](__SUBDIR__/release-lifecycle#early-access-ea) product.
{{% /restricted %}}
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
## Setup
@y
## Setup
@z

@x
Before you can start interacting with the Docker agent, make sure you've
[installed](./install.md) the extension for your organization.
@y
Before you can start interacting with the Docker agent, make sure you've
[installed](./install.md) the extension for your organization.
@z

@x
### Enable GitHub Copilot chat in your editor or IDE
@y
### Enable GitHub Copilot chat in your editor or IDE
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
### Verify the setup
@y
### Verify the setup
@z

@x
You can verify that the extension has been properly installed by typing
`@docker` in the Copilot Chat window. As you type, you should see the Docker
agent appear in the chat interface.
@y
You can verify that the extension has been properly installed by typing
`@docker` in the Copilot Chat window. As you type, you should see the Docker
agent appear in the chat interface.
@z

@x
![Docker agent in chat](images/docker-agent-copilot.png)
@y
![Docker agent in chat](images/docker-agent-copilot.png)
@z

@x
The first time you interact with the agent, you're prompted to sign in and
authorize the Copilot extension with your Docker account.
@y
The first time you interact with the agent, you're prompted to sign in and
authorize the Copilot extension with your Docker account.
@z

@x
## Asking Docker questions in your editor
@y
## Asking Docker questions in your editor
@z

@x
To interact with the Docker agent from within your editor or IDE:
@y
To interact with the Docker agent from within your editor or IDE:
@z

@x
1. Open your project in your editor.
2. Open the Copilot chat interface.
3. Interact with the Docker agent by tagging `@docker`, followed by your question.
@y
1. Open your project in your editor.
2. Open the Copilot chat interface.
3. Interact with the Docker agent by tagging `@docker`, followed by your question.
@z

@x
## Asking Docker questions on GitHub.com
@y
## Asking Docker questions on GitHub.com
@z

@x
To interact with the Docker agent from the GitHub web interface:
@y
To interact with the Docker agent from the GitHub web interface:
@z

@x
1. Go to [github.com](https://github.com/) and sign in to your account.
2. Go to any repository.
3. Select the Copilot logo in the site menu, or select the floating Copilot widget, to open the chat interface.
@y
1. Go to [github.com](https://github.com/) and sign in to your account.
2. Go to any repository.
3. Select the Copilot logo in the site menu, or select the floating Copilot widget, to open the chat interface.
@z

@x
   ![Copilot chat button](images/copilot-button.png?w=400px)
@y
   ![Copilot chat button](images/copilot-button.png?w=400px)
@z

@x
4. Interact with the Docker agent by tagging `@docker`, followed by your question.
@y
4. Interact with the Docker agent by tagging `@docker`, followed by your question.
@z
