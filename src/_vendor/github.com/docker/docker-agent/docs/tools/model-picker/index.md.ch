%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Model Picker Tool"
description: "Let the agent pick between several models per turn."
keywords: docker agent, ai agents, tools, toolsets, model picker tool
linkTitle: "Model Picker"
@y
title: "Model Picker Tool"
description: "Let the agent pick between several models per turn."
keywords: docker agent, ai agents, tools, toolsets, model picker tool
linkTitle: "Model Picker"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/model-picker/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/model-picker/
@z

@x
_Let the agent pick between several models per turn._
@y
_Let the agent pick between several models per turn._
@z

@x
## Overview
@y
## Overview
@z

@x
The model picker tool gives an agent the ability to dynamically choose which model to use for each turn of the conversation. This is useful when you want the agent to route different types of requests to different models — for example, using a fast, inexpensive model for simple queries and a more capable model for complex reasoning tasks.
@y
The model picker tool gives an agent the ability to dynamically choose which model to use for each turn of the conversation. This is useful when you want the agent to route different types of requests to different models — for example, using a fast, inexpensive model for simple queries and a more capable model for complex reasoning tasks.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: model_picker
    models:
      - openai/gpt-5-mini
      - anthropic/claude-sonnet-4-5
      - openai/gpt-5
```
@y
```yaml
toolsets:
  - type: model_picker
    models:
      - openai/gpt-5-mini
      - anthropic/claude-sonnet-4-5
      - openai/gpt-5
```
@z

@x
### Options
@y
### Options
@z

@x
| Property | Type           | Required | Description                                                  |
| -------- | -------------- | -------- | ------------------------------------------------------------ |
| `models` | array[string]  | ✓        | List of model references the agent can choose from. Use `provider/model` format. |
@y
| Property | Type           | Required | Description                                                  |
| -------- | -------------- | -------- | ------------------------------------------------------------ |
| `models` | array[string]  | ✓        | List of model references the agent can choose from. Use `provider/model` format. |
@z

@x
## How It Works
@y
## How It Works
@z

@x
When the model picker toolset is enabled, the agent gets two tools: `change_model` to switch to one of the configured models, and `revert_model` to return to its default model. The agent decides which model to use based on the complexity of the task, cost considerations, or other factors you describe in its instruction.
@y
When the model picker toolset is enabled, the agent gets two tools: `change_model` to switch to one of the configured models, and `revert_model` to return to its default model. The agent decides which model to use based on the complexity of the task, cost considerations, or other factors you describe in its instruction.
@z

@x
## Example
@y
## Example
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini  # Default model
    instruction: |
      You are a helpful assistant. For simple questions, use gpt-5-mini.
      For complex reasoning or coding tasks, switch to claude-sonnet-4-5 or gpt-5.
    toolsets:
      - type: model_picker
        models:
          - openai/gpt-5-mini
          - anthropic/claude-sonnet-4-5
          - openai/gpt-5
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini  # Default model
    instruction: |
      You are a helpful assistant. For simple questions, use gpt-5-mini.
      For complex reasoning or coding tasks, switch to claude-sonnet-4-5 or gpt-5.
    toolsets:
      - type: model_picker
        models:
          - openai/gpt-5-mini
          - anthropic/claude-sonnet-4-5
          - openai/gpt-5
```
@z

@x
> [!TIP]
> **Cost optimization**
>
> The model picker tool is particularly useful for cost optimization: let the agent use a cheap model by default and only escalate to expensive models when necessary.
@y
> [!TIP]
> **Cost optimization**
>
> The model picker tool is particularly useful for cost optimization: let the agent use a cheap model by default and only escalate to expensive models when necessary.
@z

@x
## Tool Interface
@y
## Tool Interface
@z

@x
The toolset exposes two tools:
@y
The toolset exposes two tools:
@z

@x
### `change_model`
@y
### `change_model`
@z

@x
| Parameter | Type   | Required | Description                                                                 |
| --------- | ------ | -------- | --------------------------------------------------------------------------- |
| `model`   | string | ✓        | The model to switch to. Must be one of the configured models.               |
@y
| Parameter | Type   | Required | Description                                                                 |
| --------- | ------ | -------- | --------------------------------------------------------------------------- |
| `model`   | string | ✓        | The model to switch to. Must be one of the configured models.               |
@z

@x
### `revert_model`
@y
### `revert_model`
@z

@x
Takes no parameters. Reverts the agent to its original/default model.
@y
Takes no parameters. Reverts the agent to its original/default model.
@z

@x
The switch takes effect immediately: the next inference call — including the remainder of the current agentic loop — uses the new model.
@y
The switch takes effect immediately: the next inference call — including the remainder of the current agentic loop — uses the new model.
@z
