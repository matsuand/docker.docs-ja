%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model gateway
@y
# docker model gateway
@z

@x
<!---MARKER_GEN_START-->
Run an OpenAI-compatible LLM gateway that routes requests to configured providers.
@y
<!---MARKER_GEN_START-->
Run an OpenAI-compatible LLM gateway that routes requests to configured providers.
@z

@x
Supported providers include Docker Model Runner, Ollama, OpenAI, Anthropic,
Groq, Mistral, Azure OpenAI, and many more OpenAI-compatible endpoints.
@y
Supported providers include Docker Model Runner, Ollama, OpenAI, Anthropic,
Groq, Mistral, Azure OpenAI, and many more OpenAI-compatible endpoints.
@z

@x
### Options
@y
### Options
@z

@x
| Name              | Type     | Default   | Description                         |
|:------------------|:---------|:----------|:------------------------------------|
| `-c`, `--config`  | `string` |           | Path to the YAML configuration file |
| `--host`          | `string` | `0.0.0.0` | Host address to bind to             |
| `-p`, `--port`    | `uint16` | `4000`    | Port to listen on                   |
| `-v`, `--verbose` | `bool`   |           | Enable verbose (debug) logging      |
@y
| Name              | Type     | Default   | Description                         |
|:------------------|:---------|:----------|:------------------------------------|
| `-c`, `--config`  | `string` |           | Path to the YAML configuration file |
| `--host`          | `string` | `0.0.0.0` | Host address to bind to             |
| `-p`, `--port`    | `uint16` | `4000`    | Port to listen on                   |
| `-v`, `--verbose` | `bool`   |           | Enable verbose (debug) logging      |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
`docker model gateway` starts a local OpenAI-compatible HTTP gateway that routes
requests to one or more configured LLM providers. It supports Docker Model Runner
as a first-class provider, alongside Ollama, OpenAI, Anthropic, Groq, Mistral,
Azure OpenAI, and many other OpenAI-compatible endpoints.
@y
`docker model gateway` starts a local OpenAI-compatible HTTP gateway that routes
requests to one or more configured LLM providers. It supports Docker Model Runner
as a first-class provider, alongside Ollama, OpenAI, Anthropic, Groq, Mistral,
Azure OpenAI, and many other OpenAI-compatible endpoints.
@z

@x
The gateway is configured through a YAML file that declares the model list,
provider routing, load-balancing, retries, and fallbacks.
@y
The gateway is configured through a YAML file that declares the model list,
provider routing, load-balancing, retries, and fallbacks.
@z

@x
### Configuration file format
@y
### Configuration file format
@z

@x
```yaml
model_list:
  - model_name: <alias exposed to clients>
    params:
      model: <provider>/<upstream-model-name>
      api_base: <optional base URL override>
      api_key: <optional key or os.environ/VAR_NAME>
@y
```yaml
model_list:
  - model_name: <alias exposed to clients>
    params:
      model: <provider>/<upstream-model-name>
      api_base: <optional base URL override>
      api_key: <optional key or os.environ/VAR_NAME>
@z

@x
general_settings:
  master_key: <optional API key required by clients>
  num_retries: <optional integer, default 0>
  fallbacks:
    - <primary-alias>: [<fallback-alias>, ...]
```
@y
general_settings:
  master_key: <optional API key required by clients>
  num_retries: <optional integer, default 0>
  fallbacks:
    - <primary-alias>: [<fallback-alias>, ...]
```
@z

@x
The `model` field under `params` uses the format `provider/model-name`.
Supported provider prefixes include: `docker_model_runner`, `openai`,
`anthropic`, `ollama`, `groq`, `mistral`, `together_ai`, `deepseek`,
`fireworks_ai`, `openrouter`, `perplexity`, `xai`, `nvidia_nim`,
`cerebras`, `sambanova`, `deepinfra`, `azure`, `azure_ai`, `vllm`,
`lm_studio`, `huggingface`.
@y
The `model` field under `params` uses the format `provider/model-name`.
Supported provider prefixes include: `docker_model_runner`, `openai`,
`anthropic`, `ollama`, `groq`, `mistral`, `together_ai`, `deepseek`,
`fireworks_ai`, `openrouter`, `perplexity`, `xai`, `nvidia_nim`,
`cerebras`, `sambanova`, `deepinfra`, `azure`, `azure_ai`, `vllm`,
`lm_studio`, `huggingface`.
@z

@x
API keys can be supplied inline, as `os.environ/VAR_NAME` references, or as
`${VAR_NAME}` references. The gateway resolves well-known environment variables
automatically (for example, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`).
@y
API keys can be supplied inline, as `os.environ/VAR_NAME` references, or as
`${VAR_NAME}` references. The gateway resolves well-known environment variables
automatically (for example, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`).
@z

@x
## Examples
@y
## Examples
@z

@x
### Route requests to Docker Model Runner
@y
### Route requests to Docker Model Runner
@z

@x
```yaml
model_list:
  - model_name: smollm2
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
```
@y
```yaml
model_list:
  - model_name: smollm2
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
```
@z

@x
```console
$ docker model gateway --config config.yaml
```
@y
```console
$ docker model gateway --config config.yaml
```
@z

@x
The gateway starts on `http://0.0.0.0:4000`. Send requests using any
OpenAI-compatible client:
@y
The gateway starts on `http://0.0.0.0:4000`. Send requests using any
OpenAI-compatible client:
@z

@x
```console
$ curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
      "model": "smollm2",
      "messages": [{"role": "user", "content": "Hello"}]
    }'
```
@y
```console
$ curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
      "model": "smollm2",
      "messages": [{"role": "user", "content": "Hello"}]
    }'
```
@z

@x
### Route requests to multiple providers with fallback
@y
### Route requests to multiple providers with fallback
@z

@x
```yaml
model_list:
  - model_name: fast
    params:
      model: groq/llama-3.1-8b-instant
      api_key: os.environ/GROQ_API_KEY
  - model_name: smart
    params:
      model: openai/gpt-4o
      api_key: os.environ/OPENAI_API_KEY
  - model_name: local
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
@y
```yaml
model_list:
  - model_name: fast
    params:
      model: groq/llama-3.1-8b-instant
      api_key: os.environ/GROQ_API_KEY
  - model_name: smart
    params:
      model: openai/gpt-4o
      api_key: os.environ/OPENAI_API_KEY
  - model_name: local
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
@z

@x
general_settings:
  num_retries: 2
  fallbacks:
    - fast: [local]
    - smart: [fast, local]
```
@y
general_settings:
  num_retries: 2
  fallbacks:
    - fast: [local]
    - smart: [fast, local]
```
@z

@x
```console
$ docker model gateway --config config.yaml --port 8080
```
@y
```console
$ docker model gateway --config config.yaml --port 8080
```
@z

@x
### Secure the gateway with an API key
@y
### Secure the gateway with an API key
@z

@x
```yaml
model_list:
  - model_name: smollm2
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
@y
```yaml
model_list:
  - model_name: smollm2
    params:
      model: docker_model_runner/ai/smollm2
      api_base: http://localhost:12434/engines/llama.cpp/v1
@z

@x
general_settings:
  master_key: os.environ/GATEWAY_API_KEY
```
@y
general_settings:
  master_key: os.environ/GATEWAY_API_KEY
```
@z

@x
```console
$ GATEWAY_API_KEY=my-secret docker model gateway --config config.yaml
```
@y
```console
$ GATEWAY_API_KEY=my-secret docker model gateway --config config.yaml
```
@z

@x
Clients must then pass the key as a Bearer token or via the `x-api-key` header:
@y
Clients must then pass the key as a Bearer token or via the `x-api-key` header:
@z

@x
```console
$ curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{"model": "smollm2", "messages": [{"role": "user", "content": "Hi"}]}'
```
@y
```console
$ curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{"model": "smollm2", "messages": [{"role": "user", "content": "Hi"}]}'
```
@z

@x
### Use a custom host and port
@y
### Use a custom host and port
@z

@x
```console
$ docker model gateway --config config.yaml --host 127.0.0.1 --port 9000
```
@y
```console
$ docker model gateway --config config.yaml --host 127.0.0.1 --port 9000
```
@z

@x
### Enable debug logging
@y
### Enable debug logging
@z

@x
```console
$ docker model gateway --config config.yaml --verbose
```
@y
```console
$ docker model gateway --config config.yaml --verbose
```
@z
