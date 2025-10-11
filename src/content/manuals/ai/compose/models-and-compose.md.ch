%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Define AI Models in Docker Compose applications
linkTitle: Use AI models in Compose
description: Learn how to define and use AI models in Docker Compose applications using the models top-level element
keywords: compose, docker compose, models, ai, machine learning, cloud providers, specification
@y
title: Define AI Models in Docker Compose applications
linkTitle: Use AI models in Compose
description: Learn how to define and use AI models in Docker Compose applications using the models top-level element
keywords: compose, docker compose, models, ai, machine learning, cloud providers, specification
@z

@x
{{< summary-bar feature_name="Compose models" >}}
@y
{{< summary-bar feature_name="Compose models" >}}
@z

@x
Compose lets you define AI models as core components of your application, so you can declare model dependencies alongside services and run the application on any platform that supports the Compose Specification.
@y
Compose lets you define AI models as core components of your application, so you can declare model dependencies alongside services and run the application on any platform that supports the Compose Specification.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Docker Compose v2.38 or later
- A platform that supports Compose models such as Docker Model Runner (DMR) or compatible cloud providers.
  If you are using DMR, see the [requirements](/manuals/ai/model-runner/_index.md#requirements).
@y
- Docker Compose v2.38 or later
- A platform that supports Compose models such as Docker Model Runner (DMR) or compatible cloud providers.
  If you are using DMR, see the [requirements](manuals/ai/model-runner/_index.md#requirements).
@z

@x
## What are Compose models?
@y
## What are Compose models?
@z

@x
Compose `models` are a standardized way to define AI model dependencies in your application. By using the [`models` top-level element](/reference/compose-file/models.md) in your Compose file, you can:
@y
Compose `models` are a standardized way to define AI model dependencies in your application. By using the [`models` top-level element](reference/compose-file/models.md) in your Compose file, you can:
@z

@x
- Declare which AI models your application needs
- Specify model configurations and requirements
- Make your application portable across different platforms
- Let the platform handle model provisioning and lifecycle management
@y
- Declare which AI models your application needs
- Specify model configurations and requirements
- Make your application portable across different platforms
- Let the platform handle model provisioning and lifecycle management
@z

@x
## Basic model definition
@y
## Basic model definition
@z

@x
To define models in your Compose application, use the `models` top-level element:
@y
To define models in your Compose application, use the `models` top-level element:
@z

@x
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      - llm
@y
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      - llm
@z

@x
models:
  llm:
    model: ai/smollm2
```
@y
models:
  llm:
    model: ai/smollm2
```
@z

@x
This example defines:
- A service called `chat-app` that uses a model named `llm`
- A model definition for `llm` that references the `ai/smollm2` model image
@y
This example defines:
- A service called `chat-app` that uses a model named `llm`
- A model definition for `llm` that references the `ai/smollm2` model image
@z

@x
## Model configuration options
@y
## Model configuration options
@z

@x
Models support various configuration options:
@y
Models support various configuration options:
@z

@x
```yaml
models:
  llm:
    model: ai/smollm2
    context_size: 1024
    runtime_flags:
      - "--a-flag"
      - "--another-flag=42"
```
@y
```yaml
models:
  llm:
    model: ai/smollm2
    context_size: 1024
    runtime_flags:
      - "--a-flag"
      - "--another-flag=42"
```
@z

@x
Common configuration options include:
- `model` (required): The OCI artifact identifier for the model. This is what Compose pulls and runs via the model runner.
- `context_size`: Defines the maximum token context size for the model.
@y
Common configuration options include:
- `model` (required): The OCI artifact identifier for the model. This is what Compose pulls and runs via the model runner.
- `context_size`: Defines the maximum token context size for the model.
@z

@x
   > [!NOTE]
   > Each model has its own maximum context size. When increasing the context length,
   > consider your hardware constraints. In general, try to keep context size
   > as small as feasible for your specific needs.
@y
   > [!NOTE]
   > Each model has its own maximum context size. When increasing the context length,
   > consider your hardware constraints. In general, try to keep context size
   > as small as feasible for your specific needs.
@z

@x
- `runtime_flags`: A list of raw command-line flags passed to the inference engine when the model is started.
   For example, if you use llama.cpp, you can pass any of [the available parameters](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md).
- Platform-specific options may also be available via extension attributes `x-*`
@y
- `runtime_flags`: A list of raw command-line flags passed to the inference engine when the model is started.
   For example, if you use llama.cpp, you can pass any of [the available parameters](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md).
- Platform-specific options may also be available via extension attributes `x-*`
@z

@x
> [!TIP]
> See more example in the [Common runtime configurations](#common-runtime-configurations) section.
@y
> [!TIP]
> See more example in the [Common runtime configurations](#common-runtime-configurations) section.
@z

@x
## Service model binding
@y
## Service model binding
@z

@x
Services can reference models in two ways: short syntax and long syntax.
@y
Services can reference models in two ways: short syntax and long syntax.
@z

@x
### Short syntax
@y
### Short syntax
@z

@x
The short syntax is the simplest way to bind a model to a service:
@y
The short syntax is the simplest way to bind a model to a service:
@z

@x
```yaml
services:
  app:
    image: my-app
    models:
      - llm
      - embedding-model
@y
```yaml
services:
  app:
    image: my-app
    models:
      - llm
      - embedding-model
@z

@x
models:
  llm:
    model: ai/smollm2
  embedding-model:
    model: ai/all-minilm
```
@y
models:
  llm:
    model: ai/smollm2
  embedding-model:
    model: ai/all-minilm
```
@z

@x
With short syntax, the platform automatically generates environment variables based on the model name:
- `LLM_URL` - URL to access the LLM model
- `LLM_MODEL` - Model identifier for the LLM model
- `EMBEDDING_MODEL_URL` - URL to access the embedding-model
- `EMBEDDING_MODEL_MODEL` - Model identifier for the embedding-model
@y
With short syntax, the platform automatically generates environment variables based on the model name:
- `LLM_URL` - URL to access the LLM model
- `LLM_MODEL` - Model identifier for the LLM model
- `EMBEDDING_MODEL_URL` - URL to access the embedding-model
- `EMBEDDING_MODEL_MODEL` - Model identifier for the embedding-model
@z

@x
### Long syntax
@y
### Long syntax
@z

@x
The long syntax allows you to customize environment variable names:
@y
The long syntax allows you to customize environment variable names:
@z

@x
```yaml
services:
  app:
    image: my-app
    models:
      llm:
        endpoint_var: AI_MODEL_URL
        model_var: AI_MODEL_NAME
      embedding-model:
        endpoint_var: EMBEDDING_URL
        model_var: EMBEDDING_NAME
@y
```yaml
services:
  app:
    image: my-app
    models:
      llm:
        endpoint_var: AI_MODEL_URL
        model_var: AI_MODEL_NAME
      embedding-model:
        endpoint_var: EMBEDDING_URL
        model_var: EMBEDDING_NAME
@z

@x
models:
  llm:
    model: ai/smollm2
  embedding-model:
    model: ai/all-minilm
```
@y
models:
  llm:
    model: ai/smollm2
  embedding-model:
    model: ai/all-minilm
```
@z

@x
With this configuration, your service receives:
- `AI_MODEL_URL` and `AI_MODEL_NAME` for the LLM model
- `EMBEDDING_URL` and `EMBEDDING_NAME` for the embedding model
@y
With this configuration, your service receives:
- `AI_MODEL_URL` and `AI_MODEL_NAME` for the LLM model
- `EMBEDDING_URL` and `EMBEDDING_NAME` for the embedding model
@z

@x
## Platform portability
@y
## Platform portability
@z

@x
One of the key benefits of using Compose models is portability across different platforms that support the Compose specification.
@y
One of the key benefits of using Compose models is portability across different platforms that support the Compose specification.
@z

@x
### Docker Model Runner
@y
### Docker Model Runner
@z

@x
When [Docker Model Runner is enabled](/manuals/ai/model-runner/_index.md):
@y
When [Docker Model Runner is enabled](manuals/ai/model-runner/_index.md):
@z

@x
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      llm:
        endpoint_var: AI_MODEL_URL
        model_var: AI_MODEL_NAME
@y
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      llm:
        endpoint_var: AI_MODEL_URL
        model_var: AI_MODEL_NAME
@z

@x
models:
  llm:
    model: ai/smollm2
    context_size: 4096
    runtime_flags:
      - "--no-prefill-assistant"
```
@y
models:
  llm:
    model: ai/smollm2
    context_size: 4096
    runtime_flags:
      - "--no-prefill-assistant"
```
@z

@x
Docker Model Runner will:
- Pull and run the specified model locally
- Provide endpoint URLs for accessing the model
- Inject environment variables into the service
@y
Docker Model Runner will:
- Pull and run the specified model locally
- Provide endpoint URLs for accessing the model
- Inject environment variables into the service
@z

@x
### Cloud providers
@y
### Cloud providers
@z

@x
The same Compose file can run on cloud providers that support Compose models:
@y
The same Compose file can run on cloud providers that support Compose models:
@z

@x
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      - llm
@y
```yaml
services:
  chat-app:
    image: my-chat-app
    models:
      - llm
@z

@x
models:
  llm:
    model: ai/smollm2
    # Cloud-specific configurations
    x-cloud-options:
      - "cloud.instance-type=gpu-small"
      - "cloud.region=us-west-2"
```
@y
models:
  llm:
    model: ai/smollm2
    # Cloud-specific configurations
    x-cloud-options:
      - "cloud.instance-type=gpu-small"
      - "cloud.region=us-west-2"
```
@z

@x
Cloud providers might:
- Use managed AI services instead of running models locally
- Apply cloud-specific optimizations and scaling
- Provide additional monitoring and logging capabilities
- Handle model versioning and updates automatically
@y
Cloud providers might:
- Use managed AI services instead of running models locally
- Apply cloud-specific optimizations and scaling
- Provide additional monitoring and logging capabilities
- Handle model versioning and updates automatically
@z

@x
## Common runtime configurations
@y
## Common runtime configurations
@z

@x
Below are some example configurations for various use cases.
@y
Below are some example configurations for various use cases.
@z

@x
### Development
@y
### Development
@z

@x
```yaml
services:
  app:
    image: app
    models:
      dev_model:
        endpoint_var: DEV_URL
        model_var: DEV_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      dev_model:
        endpoint_var: DEV_URL
        model_var: DEV_MODEL
@z

@x
models:
  dev_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--verbose"                       # Set verbosity level to infinity
      - "--verbose-prompt"                # Print a verbose prompt before generation
      - "--log-prefix"                    # Enable prefix in log messages
      - "--log-timestamps"                # Enable timestamps in log messages
      - "--log-colors"                    # Enable colored logging
```
@y
models:
  dev_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--verbose"                       # Set verbosity level to infinity
      - "--verbose-prompt"                # Print a verbose prompt before generation
      - "--log-prefix"                    # Enable prefix in log messages
      - "--log-timestamps"                # Enable timestamps in log messages
      - "--log-colors"                    # Enable colored logging
```
@z

@x
### Conservative with disabled reasoning
@y
### Conservative with disabled reasoning
@z

@x
```yaml
services:
  app:
    image: app
    models:
      conservative_model:
        endpoint_var: CONSERVATIVE_URL
        model_var: CONSERVATIVE_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      conservative_model:
        endpoint_var: CONSERVATIVE_URL
        model_var: CONSERVATIVE_MODEL
@z

@x
models:
  conservative_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0.1"
      - "--top-k"               # Top-k sampling
      - "1"
      - "--reasoning-budget"    # Disable reasoning
      - "0"
```
@y
models:
  conservative_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0.1"
      - "--top-k"               # Top-k sampling
      - "1"
      - "--reasoning-budget"    # Disable reasoning
      - "0"
```
@z

@x
### Creative with high randomness
@y
### Creative with high randomness
@z

@x
```yaml
services:
  app:
    image: app
    models:
      creative_model:
        endpoint_var: CREATIVE_URL
        model_var: CREATIVE_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      creative_model:
        endpoint_var: CREATIVE_URL
        model_var: CREATIVE_MODEL
@z

@x
models:
  creative_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "1"
      - "--top-p"               # Top-p sampling
      - "0.9"
```
@y
models:
  creative_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "1"
      - "--top-p"               # Top-p sampling
      - "0.9"
```
@z

@x
### Highly deterministic
@y
### Highly deterministic
@z

@x
```yaml
services:
  app:
    image: app
    models:
      deterministic_model:
        endpoint_var: DET_URL
        model_var: DET_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      deterministic_model:
        endpoint_var: DET_URL
        model_var: DET_MODEL
@z

@x
models:
  deterministic_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0"
      - "--top-k"               # Top-k sampling
      - "1"
```
@y
models:
  deterministic_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0"
      - "--top-k"               # Top-k sampling
      - "1"
```
@z

@x
### Concurrent processing
@y
### Concurrent processing
@z

@x
```yaml
services:
  app:
    image: app
    models:
      concurrent_model:
        endpoint_var: CONCURRENT_URL
        model_var: CONCURRENT_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      concurrent_model:
        endpoint_var: CONCURRENT_URL
        model_var: CONCURRENT_MODEL
@z

@x
models:
  concurrent_model:
    model: ai/model
    context_size: 2048
    runtime_flags:
      - "--threads"             # Number of threads to use during generation
      - "8"
      - "--mlock"               # Lock memory to prevent swapping
```
@y
models:
  concurrent_model:
    model: ai/model
    context_size: 2048
    runtime_flags:
      - "--threads"             # Number of threads to use during generation
      - "8"
      - "--mlock"               # Lock memory to prevent swapping
```
@z

@x
### Rich vocabulary model
@y
### Rich vocabulary model
@z

@x
```yaml
services:
  app:
    image: app
    models:
      rich_vocab_model:
        endpoint_var: RICH_VOCAB_URL
        model_var: RICH_VOCAB_MODEL
@y
```yaml
services:
  app:
    image: app
    models:
      rich_vocab_model:
        endpoint_var: RICH_VOCAB_URL
        model_var: RICH_VOCAB_MODEL
@z

@x
models:
  rich_vocab_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0.1"
      - "--top-p"               # Top-p sampling
      - "0.9"
```
@y
models:
  rich_vocab_model:
    model: ai/model
    context_size: 4096
    runtime_flags:
      - "--temp"                # Temperature
      - "0.1"
      - "--top-p"               # Top-p sampling
      - "0.9"
```
@z

@x
## Reference
@y
## Reference
@z

@x
- [`models` top-level element](/reference/compose-file/models.md)
- [`models` attribute](/reference/compose-file/services.md#models)
- [Docker Model Runner documentation](/manuals/ai/model-runner.md)
- [Compose Model Runner documentation](/manuals/ai/compose/models-and-compose.md)
@y
- [`models` top-level element](reference/compose-file/models.md)
- [`models` attribute](reference/compose-file/services.md#models)
- [Docker Model Runner documentation](manuals/ai/model-runner.md)
- [Compose Model Runner documentation](manuals/ai/compose/models-and-compose.md)
@z
