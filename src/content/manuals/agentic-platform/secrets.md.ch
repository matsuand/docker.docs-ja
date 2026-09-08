%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Secrets
description: Manage model provider and service credentials for Docker Agentic Platform sandboxes.
keywords: docker agentic platform, secrets, api keys, service credentials, proxy
@y
title: Secrets
description: Manage model provider and service credentials for Docker Agentic Platform sandboxes.
keywords: docker agentic platform, secrets, api keys, service credentials, proxy
@z

@x
Secrets provide credentials to agents without placing their values in a
sandbox. Docker Agentic Platform stores each value outside sandboxes and uses
the sandbox proxy to apply it to matching requests.
@y
Secrets provide credentials to agents without placing their values in a
sandbox. Docker Agentic Platform stores each value outside sandboxes and uses
the sandbox proxy to apply it to matching requests.
@z

@x
Docker Agentic Platform supports the following credentials:
@y
Docker Agentic Platform supports the following credentials:
@z

@x
| Service       | Secret ID           | Used by                                           |
| ------------- | ------------------- | ------------------------------------------------- |
| Anthropic     | `ANTHROPIC_API_KEY` | Claude Code and OpenCode with Anthropic models    |
| OpenAI        | `OPENAI_API_KEY`    | Codex and OpenCode with OpenAI models             |
| Google Gemini | `GEMINI_API_KEY`    | Gemini CLI and OpenCode with Google models        |
| Groq          | `GROQ_API_KEY`      | OpenCode with Groq models                         |
| xAI           | `XAI_API_KEY`       | OpenCode with xAI models                          |
| GitHub        | `GITHUB_TOKEN`      | Copilot and any sandbox type that accesses GitHub |
@y
| Service       | Secret ID           | Used by                                           |
| ------------- | ------------------- | ------------------------------------------------- |
| Anthropic     | `ANTHROPIC_API_KEY` | Claude Code and OpenCode with Anthropic models    |
| OpenAI        | `OPENAI_API_KEY`    | Codex and OpenCode with OpenAI models             |
| Google Gemini | `GEMINI_API_KEY`    | Gemini CLI and OpenCode with Google models        |
| Groq          | `GROQ_API_KEY`      | OpenCode with Groq models                         |
| xAI           | `XAI_API_KEY`       | OpenCode with xAI models                          |
| GitHub        | `GITHUB_TOKEN`      | Copilot and any sandbox type that accesses GitHub |
@z

@x
Provider-specific credentials are applied only to matching requests from
compatible sandbox types. For example, an Anthropic credential is not applied
to requests from a Codex sandbox. OpenCode can use any configured provider that
it supports.
@y
Provider-specific credentials are applied only to matching requests from
compatible sandbox types. For example, an Anthropic credential is not applied
to requests from a Codex sandbox. OpenCode can use any configured provider that
it supports.
@z

@x
## GitHub credential
@y
## GitHub credential
@z

@x
`GITHUB_TOKEN` authenticates both Copilot and GitHub repository operations.
Entering it in the launcher stores it as the same GitHub secret shown under
**Secrets**. Any sandbox type can use it for matching GitHub requests, such as
cloning a private repository or pushing changes.
@y
`GITHUB_TOKEN` authenticates both Copilot and GitHub repository operations.
Entering it in the launcher stores it as the same GitHub secret shown under
**Secrets**. Any sandbox type can use it for matching GitHub requests, such as
cloning a private repository or pushing changes.
@z

@x
## Configure a secret
@y
## Configure a secret
@z

@x
To configure a credential before launching a sandbox:
@y
To configure a credential before launching a sandbox:
@z

@x
1. Open **Secrets** and find the service.
2. Select the edit icon for that service.
3. Enter its API key or token and save the value.
@y
1. Open **Secrets** and find the service.
2. Select the edit icon for that service.
3. Enter its API key or token and save the value.
@z

@x
You can also provide a required credential from **New** when you launch a
sandbox.
@y
You can also provide a required credential from **New** when you launch a
sandbox.
@z

@x
## Manage secrets
@y
## Manage secrets
@z

@x
The **Secrets** page shows each secret ID and the sandboxes that use it. Select
the copy icon to copy the secret ID, or select the edit icon to change the
stored value.
@y
The **Secrets** page shows each secret ID and the sandboxes that use it. Select
the copy icon to copy the secret ID, or select the edit icon to change the
stored value.
@z

@x
Agents see the secret ID, not the stored value. When an outbound request matches
the secret's service binding, the sandbox proxy applies the value to the
request. A secret for one service does not become a general-purpose credential
inside the sandbox.
@y
Agents see the secret ID, not the stored value. When an outbound request matches
the secret's service binding, the sandbox proxy applies the value to the
request. A secret for one service does not become a general-purpose credential
inside the sandbox.
@z

@x
Do not put API keys or tokens in prompts or files inside the sandbox. Rotate or
revoke a credential at its provider when it is no longer needed.
@y
Do not put API keys or tokens in prompts or files inside the sandbox. Rotate or
revoke a credential at its provider when it is no longer needed.
@z
