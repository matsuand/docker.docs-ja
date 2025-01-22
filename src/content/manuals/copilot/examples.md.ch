%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Example prompts for the Docker agent
linkTitle: Example prompts
description: |
  Discover example prompts to interact with the Docker agent and learn how to
  automate tasks like Dockerizing projects or opening pull requests.
@y
title: Example prompts for the Docker agent
linkTitle: Example prompts
description: |
  Discover example prompts to interact with the Docker agent and learn how to
  automate tasks like Dockerizing projects or opening pull requests.
@z

@x
{{< summary-bar feature_name="Docker GitHub Copilot" >}}
@y
{{< summary-bar feature_name="Docker GitHub Copilot" >}}
@z

@x
## Use cases
@y
## Use cases
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
- `@docker what is a Dockerfile?`
- `@docker how do I build a Docker image?`
- `@docker how do I run a Docker container?`
- `@docker what does 'docker buildx imagetools inspect' do?`
@y
- `@docker what is a Dockerfile?`
- `@docker how do I build a Docker image?`
- `@docker how do I run a Docker container?`
- `@docker what does 'docker buildx imagetools inspect' do?`
@z

@x
### Get help containerizing your project
@y
### Get help containerizing your project
@z

@x
You can ask the agent to help you containerize your existing project:
@y
You can ask the agent to help you containerize your existing project:
@z

@x
- `@docker can you help create a compose file for this project?`
- `@docker can you create a Dockerfile for this project?`
@y
- `@docker can you help create a compose file for this project?`
- `@docker can you create a Dockerfile for this project?`
@z

@x
#### Opening pull requests
@y
#### Opening pull requests
@z

@x
The Docker agent will analyze your project, generate the necessary files, and,
if applicable, offer to raise a pull request with the necessary Docker assets.
@y
The Docker agent will analyze your project, generate the necessary files, and,
if applicable, offer to raise a pull request with the necessary Docker assets.
@z

@x
Automatically opening pull requests against your repositories is only available
when the agent generates new Docker assets.
@y
Automatically opening pull requests against your repositories is only available
when the agent generates new Docker assets.
@z

@x
### Analyze a project for vulnerabilities
@y
### Analyze a project for vulnerabilities
@z

@x
The agent can help you improve your security posture with [Docker
Scout](/manuals/scout/_index.md):
@y
The agent can help you improve your security posture with [Docker
Scout](manuals/scout/_index.md):
@z

@x
- `@docker can you help me find vulnerabilities in my project?`
- `@docker does my project contain any insecure dependencies?`
@y
- `@docker can you help me find vulnerabilities in my project?`
- `@docker does my project contain any insecure dependencies?`
@z

@x
The agent will run use Docker Scout to analyze your project's dependencies, and
report whether you're vulnerable to any [known CVEs](/manuals/scout/deep-dive/advisory-db-sources.md).
@y
The agent will run use Docker Scout to analyze your project's dependencies, and
report whether you're vulnerable to any [known CVEs](manuals/scout/deep-dive/advisory-db-sources.md).
@z

@x
![Copilot vulnerabilities report](images/copilot-vuln-report.png?w=500px&border=1)
@y
![Copilot vulnerabilities report](images/copilot-vuln-report.png?w=500px&border=1)
@z

@x
## Limitations
@y
## Limitations
@z

@x
- The agent is currently not able to access specific files in your repository,
  such as the currently-opened file in your editor, or if you pass a file
  reference with your message in the chat message.
@y
- The agent is currently not able to access specific files in your repository,
  such as the currently-opened file in your editor, or if you pass a file
  reference with your message in the chat message.
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
