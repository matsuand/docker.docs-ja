%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Model Providers"
description: "Docker Agent supports multiple AI model providers. Choose the right one for your use case, or use multiple providers in the same configuration."
keywords: docker agent, ai agents, model providers, llm
linkTitle: "Overview"
@y
title: "Model Providers"
description: "Docker Agent supports multiple AI model providers. Choose the right one for your use case, or use multiple providers in the same configuration."
keywords: docker agent, ai agents, model providers, llm
linkTitle: "Overview"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/overview/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/overview/
@z

@x
_Docker Agent supports multiple AI model providers. Choose the right one for your use case, or use multiple providers in the same configuration._
@y
_Docker Agent supports multiple AI model providers. Choose the right one for your use case, or use multiple providers in the same configuration._
@z

@x
## Supported Providers
@y
## Supported Providers
@z

@x
- [**OpenAI**](../openai/index.md) — GPT-5, GPT-5-mini, GPT-4o. The most widely used AI models.
- [**Anthropic**](../anthropic/index.md) — Claude Sonnet 4.5, Claude Opus 4.7. Excellent for coding and analysis.
- [**Google Gemini**](../google/index.md) — Gemini 2.5 Flash, Gemini 3 Pro. Fast and cost-effective.
- [**AWS Bedrock**](../bedrock/index.md) — access Claude, Nova, Llama, and more through AWS infrastructure.
- [**Docker Model Runner**](../dmr/index.md) — run models locally with Docker. No API keys, no costs.
- [**Local Models**](../local/index.md) — run Ollama, vLLM, or LocalAI locally. No API key required.
- [**Provider Definitions**](../custom/index.md) — define reusable provider configurations with shared defaults for any provider type.
@y
- [**OpenAI**](../openai/index.md) — GPT-5, GPT-5-mini, GPT-4o. The most widely used AI models.
- [**Anthropic**](../anthropic/index.md) — Claude Sonnet 4.5, Claude Opus 4.7. Excellent for coding and analysis.
- [**Google Gemini**](../google/index.md) — Gemini 2.5 Flash, Gemini 3 Pro. Fast and cost-effective.
- [**AWS Bedrock**](../bedrock/index.md) — access Claude, Nova, Llama, and more through AWS infrastructure.
- [**Docker Model Runner**](../dmr/index.md) — run models locally with Docker. No API keys, no costs.
- [**Local Models**](../local/index.md) — run Ollama, vLLM, or LocalAI locally. No API key required.
- [**Provider Definitions**](../custom/index.md) — define reusable provider configurations with shared defaults for any provider type.
@z

@x
## Quick Comparison
@y
## Quick Comparison
@z

@x
| Provider            | Key              | Local? | Strengths                                             |
| ------------------- | ---------------- | ------ | ----------------------------------------------------- |
| OpenAI              | `openai`         | No     | Broad model selection, tool calling, multimodal       |
| Anthropic           | `anthropic`      | No     | Strong coding, extended thinking, large context       |
| Google              | `google`         | No     | Fast inference, competitive pricing, multimodal       |
| AWS Bedrock         | `amazon-bedrock` | No     | Enterprise features, multiple models, AWS integration |
| Docker Model Runner | `dmr`            | Yes    | No API costs, data privacy, offline capable           |
| Local Models (Ollama / vLLM) | `ollama` / custom | Yes | No API costs, full data privacy, any OpenAI-compatible server |
@y
| Provider            | Key              | Local? | Strengths                                             |
| ------------------- | ---------------- | ------ | ----------------------------------------------------- |
| OpenAI              | `openai`         | No     | Broad model selection, tool calling, multimodal       |
| Anthropic           | `anthropic`      | No     | Strong coding, extended thinking, large context       |
| Google              | `google`         | No     | Fast inference, competitive pricing, multimodal       |
| AWS Bedrock         | `amazon-bedrock` | No     | Enterprise features, multiple models, AWS integration |
| Docker Model Runner | `dmr`            | Yes    | No API costs, data privacy, offline capable           |
| Local Models (Ollama / vLLM) | `ollama` / custom | Yes | No API costs, full data privacy, any OpenAI-compatible server |
@z

@x
## Additional Built-in Providers
@y
## Additional Built-in Providers
@z

@x
Docker Agent also includes built-in aliases for these providers:
@y
Docker Agent also includes built-in aliases for these providers:
@z

@x
| Provider       | Alias            | API Key / Env Variable              |
| -------------- | ---------------- | ----------------------------------- |
| ChatGPT (OpenAI account) | [`chatgpt`](../chatgpt/index.md) | None (sign in via `docker agent setup`) |
| OpenCode Zen   | `opencode-zen`   | `OPENCODE_API_KEY`                  |
| OpenCode Go    | `opencode-go`    | `OPENCODE_API_KEY`                  |
| Mistral        | `mistral`        | `MISTRAL_API_KEY`                   |
| xAI (Grok)     | `xai`            | `XAI_API_KEY`                       |
| Nebius         | `nebius`         | `NEBIUS_API_KEY`                    |
| NVIDIA NIM     | `nvidia`         | `NVIDIA_API_KEY`                    |
| MiniMax        | `minimax`        | `MINIMAX_API_KEY`                   |
| Baseten        | `baseten`        | `BASETEN_API_KEY`                   |
| OVHcloud       | `ovhcloud`       | `OVH_AI_ENDPOINTS_ACCESS_TOKEN`     |
| Groq           | `groq`           | `GROQ_API_KEY`                      |
| Fireworks AI   | `fireworks`      | `FIREWORKS_API_KEY`                 |
| DeepSeek       | `deepseek`       | `DEEPSEEK_API_KEY`                  |
| Cerebras       | `cerebras`       | `CEREBRAS_API_KEY`                  |
| Together AI    | `together`       | `TOGETHER_API_KEY`                  |
| Hugging Face   | `huggingface`    | `HF_TOKEN`                          |
| Cloudflare Workers AI | `cloudflare-workers-ai` | `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` |
| Moonshot AI    | `moonshot`       | `MOONSHOT_API_KEY`                  |
| Vercel AI Gateway | `vercel`      | `AI_GATEWAY_API_KEY`                |
| Cloudflare AI Gateway | `cloudflare-ai-gateway` | `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` + `CLOUDFLARE_GATEWAY_ID` |
| Requesty       | `requesty`       | `REQUESTY_API_KEY`                  |
| OpenRouter     | `openrouter`     | `OPENROUTER_API_KEY`                |
| Azure OpenAI   | `azure`          | `AZURE_API_KEY` + `base_url`        |
| [Ollama](../local/index.md) | `ollama` | None (local; optional `base_url`) |
| GitHub Copilot | `github-copilot` | `GITHUB_TOKEN` (PAT with `copilot` scope) |
@y
| Provider       | Alias            | API Key / Env Variable              |
| -------------- | ---------------- | ----------------------------------- |
| ChatGPT (OpenAI account) | [`chatgpt`](../chatgpt/index.md) | None (sign in via `docker agent setup`) |
| OpenCode Zen   | `opencode-zen`   | `OPENCODE_API_KEY`                  |
| OpenCode Go    | `opencode-go`    | `OPENCODE_API_KEY`                  |
| Mistral        | `mistral`        | `MISTRAL_API_KEY`                   |
| xAI (Grok)     | `xai`            | `XAI_API_KEY`                       |
| Nebius         | `nebius`         | `NEBIUS_API_KEY`                    |
| NVIDIA NIM     | `nvidia`         | `NVIDIA_API_KEY`                    |
| MiniMax        | `minimax`        | `MINIMAX_API_KEY`                   |
| Baseten        | `baseten`        | `BASETEN_API_KEY`                   |
| OVHcloud       | `ovhcloud`       | `OVH_AI_ENDPOINTS_ACCESS_TOKEN`     |
| Groq           | `groq`           | `GROQ_API_KEY`                      |
| Fireworks AI   | `fireworks`      | `FIREWORKS_API_KEY`                 |
| DeepSeek       | `deepseek`       | `DEEPSEEK_API_KEY`                  |
| Cerebras       | `cerebras`       | `CEREBRAS_API_KEY`                  |
| Together AI    | `together`       | `TOGETHER_API_KEY`                  |
| Hugging Face   | `huggingface`    | `HF_TOKEN`                          |
| Cloudflare Workers AI | `cloudflare-workers-ai` | `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` |
| Moonshot AI    | `moonshot`       | `MOONSHOT_API_KEY`                  |
| Vercel AI Gateway | `vercel`      | `AI_GATEWAY_API_KEY`                |
| Cloudflare AI Gateway | `cloudflare-ai-gateway` | `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` + `CLOUDFLARE_GATEWAY_ID` |
| Requesty       | `requesty`       | `REQUESTY_API_KEY`                  |
| OpenRouter     | `openrouter`     | `OPENROUTER_API_KEY`                |
| Azure OpenAI   | `azure`          | `AZURE_API_KEY` + `base_url`        |
| [Ollama](../local/index.md) | `ollama` | None (local; optional `base_url`) |
| GitHub Copilot | `github-copilot` | `GITHUB_TOKEN` (PAT with `copilot` scope) |
@z

@x
```bash
# Use built-in providers inline
agents:
  root:
    model: mistral/mistral-large-latest
```
@y
```bash
# Use built-in providers inline
agents:
  root:
    model: mistral/mistral-large-latest
```
@z

@x
> [!TIP]
> **Multi-provider teams**
>
> Use expensive models for complex reasoning and cheaper/local models for routine tasks. See the example below.
@y
> [!TIP]
> **Multi-provider teams**
>
> Use expensive models for complex reasoning and cheaper/local models for routine tasks. See the example below.
@z

@x
## Using Multiple Providers
@y
## Using Multiple Providers
@z

@x
Different agents can use different providers in the same configuration:
@y
Different agents can use different providers in the same configuration:
@z

@x
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
  gpt:
    provider: openai
    model: gpt-5
  local:
    provider: dmr
    model: ai/qwen3
@y
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
  gpt:
    provider: openai
    model: gpt-5
  local:
    provider: dmr
    model: ai/qwen3
@z

@x
agents:
  root:
    model: claude # coordinator uses Claude
    sub_agents: [coder, helper]
  coder:
    model: gpt # coder uses GPT-5
  helper:
    model: local # helper runs locally for free
```
@y
agents:
  root:
    model: claude # coordinator uses Claude
    sub_agents: [coder, helper]
  coder:
    model: gpt # coder uses GPT-5
  helper:
    model: local # helper runs locally for free
```
@z
