%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Secrets
description: Save and manage API keys and tokens for your Docker Agentic Platform sandboxes.
keywords: docker agentic platform, secrets, api keys, service credentials, proxy
@y
title: Secrets
description: Save and manage API keys and tokens for your Docker Agentic Platform sandboxes.
keywords: docker agentic platform, secrets, api keys, service credentials, proxy
@z

@x
Save API keys and tokens under **Secrets** so your agents can use external
services without reading the credentials themselves. The values stay outside
the sandbox.
@y
Save API keys and tokens under **Secrets** so your agents can use external
services without reading the credentials themselves. The values stay outside
the sandbox.
@z

@x
You can save credentials for the following services:
@y
You can save credentials for the following services:
@z

@x
| Service       | Secret ID           | Used by                                           |
| ------------- | ------------------- | ------------------------------------------------- |
| Anthropic     | `ANTHROPIC_API_KEY` | Claude Code, OpenCode, and Hermes with Anthropic models |
| OpenAI        | `OPENAI_API_KEY`    | Codex, OpenCode, and Hermes with OpenAI models     |
| Google | `GEMINI_API_KEY` | Gemini CLI, Antigravity, and OpenCode with Google models |
| Groq          | `GROQ_API_KEY`      | OpenCode with Groq models                         |
| xAI           | `XAI_API_KEY`       | OpenCode with xAI models                          |
| GitHub        | `GITHUB_TOKEN`      | Copilot and kits that support GitHub access       |
@y
| Service       | Secret ID           | Used by                                           |
| ------------- | ------------------- | ------------------------------------------------- |
| Anthropic     | `ANTHROPIC_API_KEY` | Claude Code, OpenCode, and Hermes with Anthropic models |
| OpenAI        | `OPENAI_API_KEY`    | Codex, OpenCode, and Hermes with OpenAI models     |
| Google | `GEMINI_API_KEY` | Gemini CLI, Antigravity, and OpenCode with Google models |
| Groq          | `GROQ_API_KEY`      | OpenCode with Groq models                         |
| xAI           | `XAI_API_KEY`       | OpenCode with xAI models                          |
| GitHub        | `GITHUB_TOKEN`      | Copilot and kits that support GitHub access       |
@z

@x
Each kit supports a particular set of credentials. For example, a Codex
sandbox doesn't use your Anthropic key. OpenCode supports all the listed model
providers. Hermes needs at least one Anthropic or OpenAI key. The built-in
provider list doesn't include OpenRouter.
@y
Each kit supports a particular set of credentials. For example, a Codex
sandbox doesn't use your Anthropic key. OpenCode supports all the listed model
providers. Hermes needs at least one Anthropic or OpenAI key. The built-in
provider list doesn't include OpenRouter.
@z

@x
For custom kits, the launcher shows the supported credentials listed in the
kit's definition.
@y
For custom kits, the launcher shows the supported credentials listed in the
kit's definition.
@z

@x
## GitHub credential
@y
## GitHub credential
@z

@x
Use `GITHUB_TOKEN` for Copilot and for cloning private repositories or pushing
changes to GitHub. The token you enter in the launcher is also saved under
**Secrets**. All curated kits offer this option. Custom kits must declare a
GitHub credential to use it.
@y
Use `GITHUB_TOKEN` for Copilot and for cloning private repositories or pushing
changes to GitHub. The token you enter in the launcher is also saved under
**Secrets**. All curated kits offer this option. Custom kits must declare a
GitHub credential to use it.
@z

@x
For Copilot, the token you provide to run the agent also authenticates GitHub
repository access. You don't need to provide a separate token.
@y
For Copilot, the token you provide to run the agent also authenticates GitHub
repository access. You don't need to provide a separate token.
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
You can also add or edit credentials from **New** when you launch a sandbox.
For a single provider credential, select its prompt to enter the value inline.
For multiple provider credentials, open the provider control to add or edit
values in its panel. Use the **GitHub token** control for Copilot and GitHub
repository access.
@y
You can also add or edit credentials from **New** when you launch a sandbox.
For a single provider credential, select its prompt to enter the value inline.
For multiple provider credentials, open the provider control to add or edit
values in its panel. Use the **GitHub token** control for Copilot and GitHub
repository access.
@z

@x
By default, the launcher includes saved API keys and tokens that the kit
supports. You don't need to enter them again. You can deselect optional
credentials to exclude them from a sandbox. Required credentials stay selected.
For kits that need one of several providers, keep at least one available
provider credential selected.
@y
By default, the launcher includes saved API keys and tokens that the kit
supports. You don't need to enter them again. You can deselect optional
credentials to exclude them from a sandbox. Required credentials stay selected.
For kits that need one of several providers, keep at least one available
provider credential selected.
@z

@x
If you add a missing key or token in the launcher, it is included without a
separate selection step. If a required credential is missing when you select
**Run**, the launcher opens the missing credential's input so you can add it.
@y
If you add a missing key or token in the launcher, it is included without a
separate selection step. If a required credential is missing when you select
**Run**, the launcher opens the missing credential's input so you can add it.
@z

@x
## Add a custom secret
@y
## Add a custom secret
@z

@x
Use a custom secret for a service outside the built-in provider list.
@y
Use a custom secret for a service outside the built-in provider list.
@z

@x
1. Open **Secrets** and select **New secret** in the **Custom** section.
2. Enter the hosts that may receive the credential.
3. Set the request header and value format, such as `Authorization` and
   `Bearer %s`, then enter the secret value.
4. Optionally, set an environment variable name for the credential.
5. Name the secret and save it.
@y
1. Open **Secrets** and select **New secret** in the **Custom** section.
2. Enter the hosts that may receive the credential.
3. Set the request header and value format, such as `Authorization` and
   `Bearer %s`, then enter the secret value.
4. Optionally, set an environment variable name for the credential.
5. Name the secret and save it.
@z

@x
Expand the secret's row to copy its generated placeholder. Use that placeholder
where your client expects a credential. The sandbox proxy substitutes the real
value only for requests to the configured hosts. The value stays outside the
sandbox.
@y
Expand the secret's row to copy its generated placeholder. Use that placeholder
where your client expects a credential. The sandbox proxy substitutes the real
value only for requests to the configured hosts. The value stays outside the
sandbox.
@z

@x
The launcher includes all your custom secrets when you create a sandbox. To
edit a custom secret, enter its value again; saved values can't be retrieved.
You can also remove custom secrets from the **Custom** section.
@y
The launcher includes all your custom secrets when you create a sandbox. To
edit a custom secret, enter its value again; saved values can't be retrieved.
You can also remove custom secrets from the **Custom** section.
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
Agents see a secret ID instead of the actual key or token. For requests that
match the secret's configured service, the sandbox proxy substitutes the real
value. It doesn't expose that value inside the sandbox or send it to other
services.
@y
Agents see a secret ID instead of the actual key or token. For requests that
match the secret's configured service, the sandbox proxy substitutes the real
value. It doesn't expose that value inside the sandbox or send it to other
services.
@z

@x
Do not put API keys or tokens in prompts or files inside the sandbox. Rotate or
revoke a credential at its provider when it is no longer needed.
@y
Do not put API keys or tokens in prompts or files inside the sandbox. Rotate or
revoke a credential at its provider when it is no longer needed.
@z
