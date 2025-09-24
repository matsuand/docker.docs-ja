%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Models
description: Learn about the models top-level element
keywords: compose, compose specification, models, compose file reference
@y
title: Models
description: Learn about the models top-level element
keywords: compose, compose specification, models, compose file reference
@z

@x
{{< summary-bar feature_name="Compose models" >}}
@y
{{< summary-bar feature_name="Compose models" >}}
@z

@x
The top-level `models` section declares AI models that are used by your Compose application. These models are typically pulled as OCI artifacts, run by a model runner, and exposed as an API that your service containers can consume.
@y
The top-level `models` section declares AI models that are used by your Compose application. These models are typically pulled as OCI artifacts, run by a model runner, and exposed as an API that your service containers can consume.
@z

@x
Services can only access models when explicitly granted by a [`models` attribute](services.md#models) within the `services` top-level element.
@y
Services can only access models when explicitly granted by a [`models` attribute](services.md#models) within the `services` top-level element.
@z

@x
## Examples
@y
## Examples
@z

@x
### Example 1
@y
### Example 1
@z

@x
```yaml
services:
  app:
    image: app
    models:
      - ai_model
@y
```yaml
services:
  app:
    image: app
    models:
      - ai_model
@z

@x
models:
  ai_model:
    model: ai/model
```
@y
models:
  ai_model:
    model: ai/model
```
@z

@x
In this basic example:
@y
In this basic example:
@z

@x
 - The app service uses the `ai_model`.
 - The `ai_model` is defined as an OCI artifact (`ai/model`) that is pulled and served by the model runner.
 - Docker Compose injects connection info, for example `AI_MODEL_URL`, into the container. 
@y
 - The app service uses the `ai_model`.
 - The `ai_model` is defined as an OCI artifact (`ai/model`) that is pulled and served by the model runner.
 - Docker Compose injects connection info, for example `AI_MODEL_URL`, into the container. 
@z

@x
### Example 2
@y
### Example 2
@z

@x
```yaml
services:
  app:
    image: app
    models:
      my_model:
        endpoint_var: MODEL_URL
@y
```yaml
services:
  app:
    image: app
    models:
      my_model:
        endpoint_var: MODEL_URL
@z

@x
models:
  my_model:
    model: ai/model
    context_size: 1024
    runtime_flags: 
      - "--a-flag"
      - "--another-flag=42"
```
@y
models:
  my_model:
    model: ai/model
    context_size: 1024
    runtime_flags: 
      - "--a-flag"
      - "--another-flag=42"
```
@z

@x
In this advanced setup:
@y
In this advanced setup:
@z

@x
 - The service app references `my_model` using the long syntax.
 - Compose injects the model runner's URL as the environment variable `MODEL_URL`.
@y
 - The service app references `my_model` using the long syntax.
 - Compose injects the model runner's URL as the environment variable `MODEL_URL`.
@z

@x
## Attributes
@y
## Attributes
@z

@x
- `model` (required): The OCI artifact identifier for the model. This is what Compose pulls and runs via the model runner. 
- `context_size`: Defines the maximum token context size for the model.
- `runtime_flags`: A list of raw command-line flags passed to the inference engine when the model is started.
@y
- `model` (required): The OCI artifact identifier for the model. This is what Compose pulls and runs via the model runner. 
- `context_size`: Defines the maximum token context size for the model.
- `runtime_flags`: A list of raw command-line flags passed to the inference engine when the model is started.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
For more examples and information on using `model`, see [Use AI models in Compose](/manuals/ai/compose/models-and-compose.md)
@y
For more examples and information on using `model`, see [Use AI models in Compose](manuals/ai/compose/models-and-compose.md)
@z
