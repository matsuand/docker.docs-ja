%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Model providers
description: Get API keys and configure cloud model providers for cagent
keywords: [cagent, model providers, api keys, anthropic, openai, google, gemini]
@y
title: Model providers
description: Get API keys and configure cloud model providers for cagent
keywords: [cagent, model providers, api keys, anthropic, openai, google, gemini]
@z

@x
To run cagent, you need a model provider. You can either use a cloud provider
with an API key or run models locally with [Docker Model
Runner](local-models.md).
@y
To run cagent, you need a model provider. You can either use a cloud provider
with an API key or run models locally with [Docker Model
Runner](local-models.md).
@z

@x
This guide covers cloud providers. For the local alternative, see [Local
models with Docker Model Runner](local-models.md).
@y
This guide covers cloud providers. For the local alternative, see [Local
models with Docker Model Runner](local-models.md).
@z

@x
## Supported providers
@y
## Supported providers
@z

@x
cagent supports these cloud model providers:
@y
cagent supports these cloud model providers:
@z

@x
- Anthropic - Claude models
- OpenAI - GPT models
- Google - Gemini models
@y
- Anthropic - Claude models
- OpenAI - GPT models
- Google - Gemini models
@z

@x
## Anthropic
@y
## Anthropic
@z

@x
Anthropic provides the Claude family of models, including Claude Sonnet and
Claude Opus.
@y
Anthropic provides the Claude family of models, including Claude Sonnet and
Claude Opus.
@z

@x
To get an API key:
@y
To get an API key:
@z

@x
1. Go to [console.anthropic.com](https://console.anthropic.com/).
2. Sign up or sign in to your account.
3. Navigate to the API Keys section.
4. Create a new API key.
5. Copy the key.
@y
1. Go to [console.anthropic.com](https://console.anthropic.com/).
2. Sign up or sign in to your account.
3. Navigate to the API Keys section.
4. Create a new API key.
5. Copy the key.
@z

@x
Set your API key as an environment variable:
@y
Set your API key as an environment variable:
@z

@x
```console
$ export ANTHROPIC_API_KEY=your_key_here
```
@y
```console
$ export ANTHROPIC_API_KEY=your_key_here
```
@z

@x
Use Anthropic models in your agent configuration:
@y
Use Anthropic models in your agent configuration:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: You are a helpful coding assistant
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: You are a helpful coding assistant
```
@z

@x
Available models include:
@y
Available models include:
@z

@x
- `anthropic/claude-sonnet-4-5`
- `anthropic/claude-opus-4-5`
- `anthropic/claude-haiku-4-5`
@y
- `anthropic/claude-sonnet-4-5`
- `anthropic/claude-opus-4-5`
- `anthropic/claude-haiku-4-5`
@z

@x
## OpenAI
@y
## OpenAI
@z

@x
OpenAI provides the GPT family of models, including GPT-5 and GPT-5 mini.
@y
OpenAI provides the GPT family of models, including GPT-5 and GPT-5 mini.
@z

@x
To get an API key:
@y
To get an API key:
@z

@x
1. Go to [platform.openai.com/api-keys](https://platform.openai.com/api-keys).
2. Sign up or sign in to your account.
3. Navigate to the API Keys section.
4. Create a new API key.
5. Copy the key.
@y
1. Go to [platform.openai.com/api-keys](https://platform.openai.com/api-keys).
2. Sign up or sign in to your account.
3. Navigate to the API Keys section.
4. Create a new API key.
5. Copy the key.
@z

@x
Set your API key as an environment variable:
@y
Set your API key as an environment variable:
@z

@x
```console
$ export OPENAI_API_KEY=your_key_here
```
@y
```console
$ export OPENAI_API_KEY=your_key_here
```
@z

@x
Use OpenAI models in your agent configuration:
@y
Use OpenAI models in your agent configuration:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful coding assistant
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful coding assistant
```
@z

@x
Available models include:
@y
Available models include:
@z

@x
- `openai/gpt-5`
- `openai/gpt-5-mini`
@y
- `openai/gpt-5`
- `openai/gpt-5-mini`
@z

@x
## Google Gemini
@y
## Google Gemini
@z

@x
Google provides the Gemini family of models.
@y
Google provides the Gemini family of models.
@z

@x
To get an API key:
@y
To get an API key:
@z

@x
1. Go to [aistudio.google.com/apikey](https://aistudio.google.com/apikey).
2. Sign in with your Google account.
3. Create an API key.
4. Copy the key.
@y
1. Go to [aistudio.google.com/apikey](https://aistudio.google.com/apikey).
2. Sign in with your Google account.
3. Create an API key.
4. Copy the key.
@z

@x
Set your API key as an environment variable:
@y
Set your API key as an environment variable:
@z

@x
```console
$ export GOOGLE_API_KEY=your_key_here
```
@y
```console
$ export GOOGLE_API_KEY=your_key_here
```
@z

@x
Use Gemini models in your agent configuration:
@y
Use Gemini models in your agent configuration:
@z

@x
```yaml
agents:
  root:
    model: google/gemini-2.5-flash
    instruction: You are a helpful coding assistant
```
@y
```yaml
agents:
  root:
    model: google/gemini-2.5-flash
    instruction: You are a helpful coding assistant
```
@z

@x
Available models include:
@y
Available models include:
@z

@x
- `google/gemini-2.5-flash`
- `google/gemini-2.5-pro`
@y
- `google/gemini-2.5-flash`
- `google/gemini-2.5-pro`
@z

@x
## OpenAI-compatible providers
@y
## OpenAI-compatible providers
@z

@x
You can use the `openai` provider type to connect to any model or provider that
implements the OpenAI API specification. This includes services like Azure
OpenAI, local inference servers, and other compatible endpoints.
@y
You can use the `openai` provider type to connect to any model or provider that
implements the OpenAI API specification. This includes services like Azure
OpenAI, local inference servers, and other compatible endpoints.
@z

@x
Configure an OpenAI-compatible provider by specifying the base URL:
@y
Configure an OpenAI-compatible provider by specifying the base URL:
@z

@x
```yaml
agents:
  root:
    model: openai/your-model-name
    instruction: You are a helpful coding assistant
    provider:
      base_url: https://your-provider.example.com/v1
```
@y
```yaml
agents:
  root:
    model: openai/your-model-name
    instruction: You are a helpful coding assistant
    provider:
      base_url: https://your-provider.example.com/v1
```
@z

@x
By default, cagent uses the `OPENAI_API_KEY` environment variable for
authentication. If your provider uses a different variable, specify it with
`token_key`:
@y
By default, cagent uses the `OPENAI_API_KEY` environment variable for
authentication. If your provider uses a different variable, specify it with
`token_key`:
@z

@x
```yaml
agents:
  root:
    model: openai/your-model-name
    instruction: You are a helpful coding assistant
    provider:
      base_url: https://your-provider.example.com/v1
      token_key: YOUR_PROVIDER_API_KEY
```
@y
```yaml
agents:
  root:
    model: openai/your-model-name
    instruction: You are a helpful coding assistant
    provider:
      base_url: https://your-provider.example.com/v1
      token_key: YOUR_PROVIDER_API_KEY
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Follow the [tutorial](tutorial.md) to build your first agent
- Learn about [local models with Docker Model Runner](local-models.md) as an
  alternative to cloud providers
- Review the [configuration reference](reference/config.md) for advanced model
  settings
@y
- Follow the [tutorial](tutorial.md) to build your first agent
- Learn about [local models with Docker Model Runner](local-models.md) as an
  alternative to cloud providers
- Review the [configuration reference](reference/config.md) for advanced model
  settings
@z
