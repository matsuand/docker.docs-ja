%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Google Gemini"
description: "Use Gemini 2.5 Flash, Gemini 3 Pro, and other Google models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, google gemini
@y
title: "Google Gemini"
description: "Use Gemini 2.5 Flash, Gemini 3 Pro, and other Google models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, google gemini
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/google/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/google/
@z

@x
_Use Gemini 2.5 Flash, Gemini 3 Pro, and other Google models with Docker Agent._
@y
_Use Gemini 2.5 Flash, Gemini 3 Pro, and other Google models with Docker Agent._
@z

@x
## Setup
@y
## Setup
@z

@x
Docker Agent reads the first credential it finds from these environment variables (see `pkg/model/provider/gemini/client.go`):
@y
Docker Agent reads the first credential it finds from these environment variables (see `pkg/model/provider/gemini/client.go`):
@z

@x
| Variable                    | Purpose                                                                             |
| --------------------------- | ----------------------------------------------------------------------------------- |
| `GOOGLE_API_KEY`            | Primary Gemini API key.                                                             |
| `GEMINI_API_KEY`            | Alternative name for the Gemini API key (also used by the official Google SDK).     |
| `GOOGLE_GENAI_USE_VERTEXAI` | When set (any value), routes through Vertex AI instead of the Gemini Developer API. |
| `GOOGLE_CLOUD_PROJECT`      | GCP project used when `GOOGLE_GENAI_USE_VERTEXAI` is set or for Vertex AI Model Garden. |
| `GOOGLE_CLOUD_LOCATION`     | GCP region for Vertex AI (defaults to the SDK default).                             |
@y
| Variable                    | Purpose                                                                             |
| --------------------------- | ----------------------------------------------------------------------------------- |
| `GOOGLE_API_KEY`            | Primary Gemini API key.                                                             |
| `GEMINI_API_KEY`            | Alternative name for the Gemini API key (also used by the official Google SDK).     |
| `GOOGLE_GENAI_USE_VERTEXAI` | When set (any value), routes through Vertex AI instead of the Gemini Developer API. |
| `GOOGLE_CLOUD_PROJECT`      | GCP project used when `GOOGLE_GENAI_USE_VERTEXAI` is set or for Vertex AI Model Garden. |
| `GOOGLE_CLOUD_LOCATION`     | GCP region for Vertex AI (defaults to the SDK default).                             |
@z

@x
```bash
# Gemini Developer API
export GOOGLE_API_KEY="AI..."   # or GEMINI_API_KEY
@y
```bash
# Gemini Developer API
export GOOGLE_API_KEY="AI..."   # or GEMINI_API_KEY
@z

@x
# Vertex AI (no API key; uses Application Default Credentials)
gcloud auth application-default login
export GOOGLE_GENAI_USE_VERTEXAI=1
export GOOGLE_CLOUD_PROJECT="my-gcp-project"
export GOOGLE_CLOUD_LOCATION="us-central1"
```
@y
# Vertex AI (no API key; uses Application Default Credentials)
gcloud auth application-default login
export GOOGLE_GENAI_USE_VERTEXAI=1
export GOOGLE_CLOUD_PROJECT="my-gcp-project"
export GOOGLE_CLOUD_LOCATION="us-central1"
```
@z

@x
## Configuration
@y
## Configuration
@z

@x
### Inline
@y
### Inline
@z

@x
```yaml
agents:
  root:
    model: google/gemini-3.5-flash
```
@y
```yaml
agents:
  root:
    model: google/gemini-3.5-flash
```
@z

@x
### Named Model
@y
### Named Model
@z

@x
```yaml
models:
  gemini:
    provider: google
    model: gemini-3.5-flash
    temperature: 0.5
```
@y
```yaml
models:
  gemini:
    provider: google
    model: gemini-3.5-flash
    temperature: 0.5
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
| Model              | Best For                        |
| ------------------ | ------------------------------- |
| `gemini-3-pro`     | Most capable Gemini model       |
| `gemini-3-flash`   | Fast, efficient, good balance   |
| `gemini-2.5-flash` | Fast inference, cost-effective  |
| `gemini-2.5-pro`   | Strong reasoning, large context |
@y
| Model              | Best For                        |
| ------------------ | ------------------------------- |
| `gemini-3-pro`     | Most capable Gemini model       |
| `gemini-3-flash`   | Fast, efficient, good balance   |
| `gemini-2.5-flash` | Fast inference, cost-effective  |
| `gemini-2.5-pro`   | Strong reasoning, large context |
@z

@x
## Thinking Budget
@y
## Thinking Budget
@z

@x
Gemini supports two approaches depending on the model version:
@y
Gemini supports two approaches depending on the model version:
@z

@x
> [!WARNING]
> **Different thinking formats**
>
> Gemini 2.5 uses **token-based** budgets (integers). Gemini 3 uses **level-based** budgets (strings like `low`, `high`). Make sure you use the right format for your model version.
@y
> [!WARNING]
> **Different thinking formats**
>
> Gemini 2.5 uses **token-based** budgets (integers). Gemini 3 uses **level-based** budgets (strings like `low`, `high`). Make sure you use the right format for your model version.
@z

@x
### Gemini 2.5 (Token-based)
@y
### Gemini 2.5 (Token-based)
@z

@x
```yaml
models:
  gemini-no-thinking:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: 0 # disable thinking
@y
```yaml
models:
  gemini-no-thinking:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: 0 # disable thinking
@z

@x
  gemini-dynamic:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: -1 # dynamic (model decides) — default
@y
  gemini-dynamic:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: -1 # dynamic (model decides) — default
@z

@x
  gemini-fixed:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: 8192 # fixed token budget
```
@y
  gemini-fixed:
    provider: google
    model: gemini-2.5-flash
    thinking_budget: 8192 # fixed token budget
```
@z

@x
### Gemini 3 (Level-based)
@y
### Gemini 3 (Level-based)
@z

@x
```yaml
models:
  gemini-3-pro:
    provider: google
    model: gemini-3-pro
    thinking_budget: high # default for Pro: low | high
@y
```yaml
models:
  gemini-3-pro:
    provider: google
    model: gemini-3-pro
    thinking_budget: high # default for Pro: low | high
@z

@x
  gemini-3-flash:
    provider: google
    model: gemini-3-flash
    thinking_budget: medium # default for Flash: minimal | low | medium | high
```
@y
  gemini-3-flash:
    provider: google
    model: gemini-3-flash
    thinking_budget: medium # default for Flash: minimal | low | medium | high
```
@z

@x
## Built-in Tools (Grounding)
@y
## Built-in Tools (Grounding)
@z

@x
Gemini models support built-in tools that let the model access Google Search and Google Maps
directly during generation. Enable them via `provider_opts`:
@y
Gemini models support built-in tools that let the model access Google Search and Google Maps
directly during generation. Enable them via `provider_opts`:
@z

@x
```yaml
models:
  gemini-grounded:
    provider: google
    model: gemini-2.5-flash
    provider_opts:
      google_search: true
      google_maps: true
      code_execution: true
```
@y
```yaml
models:
  gemini-grounded:
    provider: google
    model: gemini-2.5-flash
    provider_opts:
      google_search: true
      google_maps: true
      code_execution: true
```
@z

@x
| Option           | Description                                          |
| ---------------- | ---------------------------------------------------- |
| `google_search`  | Enables Google Search grounding for up-to-date info  |
| `google_maps`    | Enables Google Maps grounding for location queries   |
| `code_execution` | Enables server-side code execution for computations  |
@y
| Option           | Description                                          |
| ---------------- | ---------------------------------------------------- |
| `google_search`  | Enables Google Search grounding for up-to-date info  |
| `google_maps`    | Enables Google Maps grounding for location queries   |
| `code_execution` | Enables server-side code execution for computations  |
@z

@x
## Vertex AI Model Garden
@y
## Vertex AI Model Garden
@z

@x
You can use non-Gemini models (e.g. Claude, Llama) hosted on Google Cloud's
[Vertex AI Model Garden](https://cloud.google.com/vertex-ai/generative-ai/docs/partner-models/use-partner-models)
through the `google` provider. When a `publisher` is specified in `provider_opts`,
requests are routed through the appropriate Vertex AI endpoint instead of the
Gemini SDK:
@y
You can use non-Gemini models (e.g. Claude, Llama) hosted on Google Cloud's
[Vertex AI Model Garden](https://cloud.google.com/vertex-ai/generative-ai/docs/partner-models/use-partner-models)
through the `google` provider. When a `publisher` is specified in `provider_opts`,
requests are routed through the appropriate Vertex AI endpoint instead of the
Gemini SDK:
@z

@x
- **Anthropic Claude** (`publisher: anthropic`) uses the Anthropic-native
  `:rawPredict` / `:streamRawPredict` endpoints. Claude models on Vertex AI do
  not support the OpenAI `/chat/completions` path.
- **Other publishers** (e.g. `meta`, `mistral`) use Vertex AI's
  OpenAI-compatible `/chat/completions` endpoint.
@y
- **Anthropic Claude** (`publisher: anthropic`) uses the Anthropic-native
  `:rawPredict` / `:streamRawPredict` endpoints. Claude models on Vertex AI do
  not support the OpenAI `/chat/completions` path.
- **Other publishers** (e.g. `meta`, `mistral`) use Vertex AI's
  OpenAI-compatible `/chat/completions` endpoint.
@z

@x
### Authentication
@y
### Authentication
@z

@x
Vertex AI uses Google Cloud Application Default Credentials (ADC). Make sure you
are authenticated:
@y
Vertex AI uses Google Cloud Application Default Credentials (ADC). Make sure you
are authenticated:
@z

@x
```bash
gcloud auth application-default login
```
@y
```bash
gcloud auth application-default login
```
@z

@x
### Configuration
@y
### Configuration
@z

@x
```yaml
models:
  claude-on-vertex:
    provider: google
    model: claude-sonnet-4-20250514
    provider_opts:
      project: my-gcp-project       # GCP project ID (or set GOOGLE_CLOUD_PROJECT)
      location: us-east5             # GCP region (or set GOOGLE_CLOUD_LOCATION)
      publisher: anthropic           # Model publisher (anthropic, meta, etc.)
```
@y
```yaml
models:
  claude-on-vertex:
    provider: google
    model: claude-sonnet-4-20250514
    provider_opts:
      project: my-gcp-project       # GCP project ID (or set GOOGLE_CLOUD_PROJECT)
      location: us-east5             # GCP region (or set GOOGLE_CLOUD_LOCATION)
      publisher: anthropic           # Model publisher (anthropic, meta, etc.)
```
@z

@x
| Option      | Description                                                                          |
| ----------- | ------------------------------------------------------------------------------------ |
| `project`   | GCP project ID. Falls back to `GOOGLE_CLOUD_PROJECT` env var                         |
| `location`  | GCP region (e.g. `us-east5`, `us-central1`). Falls back to `GOOGLE_CLOUD_LOCATION`   |
| `publisher`  | Model publisher (e.g. `anthropic`, `meta`, `mistral`). Must not be `google`          |
@y
| Option      | Description                                                                          |
| ----------- | ------------------------------------------------------------------------------------ |
| `project`   | GCP project ID. Falls back to `GOOGLE_CLOUD_PROJECT` env var                         |
| `location`  | GCP region (e.g. `us-east5`, `us-central1`). Falls back to `GOOGLE_CLOUD_LOCATION`   |
| `publisher`  | Model publisher (e.g. `anthropic`, `meta`, `mistral`). Must not be `google`          |
@z

@x
> [!NOTE]
> **Gemini models on Vertex AI**
>
> Setting `publisher: google` (or omitting `publisher`) uses the native Gemini SDK path. The Model Garden endpoint is only used for non-Google publishers.
@y
> [!NOTE]
> **Gemini models on Vertex AI**
>
> Setting `publisher: google` (or omitting `publisher`) uses the native Gemini SDK path. The Model Garden endpoint is only used for non-Google publishers.
@z
