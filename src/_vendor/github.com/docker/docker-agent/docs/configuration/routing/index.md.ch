%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Model Routing"
description: "Route requests to different models based on the content of user messages."
keywords: docker agent, ai agents, configuration, yaml, model routing
@y
title: "Model Routing"
description: "Route requests to different models based on the content of user messages."
keywords: docker agent, ai agents, configuration, yaml, model routing
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/routing/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/routing/
@z

@x
_Route requests to different models based on the content of user messages._
@y
_Route requests to different models based on the content of user messages._
@z

@x
## Overview
@y
## Overview
@z

@x
Model routing lets you define a "router" model that automatically selects the best underlying model based on the user's message. This is useful for cost optimization, specialized handling, or load balancing across models.
@y
Model routing lets you define a "router" model that automatically selects the best underlying model based on the user's message. This is useful for cost optimization, specialized handling, or load balancing across models.
@z

@x
> [!NOTE]
> **How It Works**
>
> Docker Agent uses NLP-based text similarity (via Bleve full-text search) to match user messages against example phrases you define. The route with the best-matching examples wins, and that model handles the request.
@y
> [!NOTE]
> **How It Works**
>
> Docker Agent uses NLP-based text similarity (via Bleve full-text search) to match user messages against example phrases you define. The route with the best-matching examples wins, and that model handles the request.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Add `routing` rules to any model definition. The model's `provider`/`model` fields become the fallback when no route matches:
@y
Add `routing` rules to any model definition. The model's `provider`/`model` fields become the fallback when no route matches:
@z

@x
```yaml
models:
  smart_router:
    # Fallback model when no routing rule matches
    provider: openai
    model: gpt-5-mini
@y
```yaml
models:
  smart_router:
    # Fallback model when no routing rule matches
    provider: openai
    model: gpt-5-mini
@z

@x
    # Routing rules
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Write a detailed technical document"
          - "Help me architect this system"
          - "Review this code for security issues"
          - "Explain this complex algorithm"
@y
    # Routing rules
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Write a detailed technical document"
          - "Help me architect this system"
          - "Review this code for security issues"
          - "Explain this complex algorithm"
@z

@x
      - model: openai/gpt-5
        examples:
          - "Generate some creative ideas"
          - "Write a story about"
          - "Help me brainstorm"
          - "Come up with names for"
@y
      - model: openai/gpt-5
        examples:
          - "Generate some creative ideas"
          - "Write a story about"
          - "Help me brainstorm"
          - "Come up with names for"
@z

@x
      - model: openai/gpt-5-mini
        examples:
          - "What time is it"
          - "Convert this to JSON"
          - "Simple math calculation"
          - "Translate this word"
@y
      - model: openai/gpt-5-mini
        examples:
          - "What time is it"
          - "Convert this to JSON"
          - "Simple math calculation"
          - "Translate this word"
@z

@x
agents:
  root:
    model: smart_router
    description: Assistant with intelligent model routing
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: smart_router
    description: Assistant with intelligent model routing
    instruction: You are a helpful assistant.
```
@z

@x
## Routing Rules
@y
## Routing Rules
@z

@x
Each routing rule has:
@y
Each routing rule has:
@z

@x
| Field      | Type   | Required | Description                                                   |
| ---------- | ------ | -------- | ------------------------------------------------------------- |
| `model`    | string | ✓        | Target model (inline format or reference to `models` section) |
| `examples` | array  | ✓        | Example phrases that should route to this model               |
@y
| Field      | Type   | Required | Description                                                   |
| ---------- | ------ | -------- | ------------------------------------------------------------- |
| `model`    | string | ✓        | Target model (inline format or reference to `models` section) |
| `examples` | array  | ✓        | Example phrases that should route to this model               |
@z

@x
## Matching Behavior
@y
## Matching Behavior
@z

@x
The router:
@y
The router:
@z

@x
1. Extracts the last user message from the conversation
2. Searches all examples using full-text search
3. Aggregates match scores by route (best score per route wins)
4. Selects the route with the highest overall score
5. Falls back to the base model if no good match is found
@y
1. Extracts the last user message from the conversation
2. Searches all examples using full-text search
3. Aggregates match scores by route (best score per route wins)
4. Selects the route with the highest overall score
5. Falls back to the base model if no good match is found
@z

@x
> [!TIP]
> **Writing Good Examples**
>
> - Use diverse phrasing that captures the intent
> - Include keywords users actually use
> - Add 5-10 examples per route for best results
> - Examples don't need to be exact matches — the router uses semantic similarity
@y
> [!TIP]
> **Writing Good Examples**
>
> - Use diverse phrasing that captures the intent
> - Include keywords users actually use
> - Add 5-10 examples per route for best results
> - Examples don't need to be exact matches — the router uses semantic similarity
@z

@x
## Use Cases
@y
## Use Cases
@z

@x
### Cost Optimization
@y
### Cost Optimization
@z

@x
Route simple queries to cheaper models:
@y
Route simple queries to cheaper models:
@z

@x
```yaml
models:
  cost_optimizer:
    provider: openai
    model: gpt-5-mini # Cheap fallback
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Complex analysis"
          - "Detailed research"
          - "Multi-step reasoning"
```
@y
```yaml
models:
  cost_optimizer:
    provider: openai
    model: gpt-5-mini # Cheap fallback
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Complex analysis"
          - "Detailed research"
          - "Multi-step reasoning"
```
@z

@x
### Specialized Models
@y
### Specialized Models
@z

@x
Route coding tasks to code-specialized models:
@y
Route coding tasks to code-specialized models:
@z

@x
```yaml
models:
  task_router:
    provider: openai
    model: gpt-5-mini # General fallback
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Write code"
          - "Debug this function"
          - "Review my implementation"
          - "Fix this bug"
      - model: openai/gpt-5
        examples:
          - "Write a blog post"
          - "Help me with writing"
          - "Summarize this document"
```
@y
```yaml
models:
  task_router:
    provider: openai
    model: gpt-5-mini # General fallback
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "Write code"
          - "Debug this function"
          - "Review my implementation"
          - "Fix this bug"
      - model: openai/gpt-5
        examples:
          - "Write a blog post"
          - "Help me with writing"
          - "Summarize this document"
```
@z

@x
### Load Balancing
@y
### Load Balancing
@z

@x
Distribute load across equivalent models from different providers:
@y
Distribute load across equivalent models from different providers:
@z

@x
```yaml
models:
  load_balancer:
    provider: openai
    model: gpt-5-mini
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "First request pattern"
          - "Another request type"
      - model: google/gemini-2.5-flash
        examples:
          - "Different request pattern"
          - "Alternative query style"
```
@y
```yaml
models:
  load_balancer:
    provider: openai
    model: gpt-5-mini
    routing:
      - model: anthropic/claude-sonnet-4-5
        examples:
          - "First request pattern"
          - "Another request type"
      - model: google/gemini-2.5-flash
        examples:
          - "Different request pattern"
          - "Alternative query style"
```
@z

@x
## Debugging
@y
## Debugging
@z

@x
Enable debug logging to see routing decisions:
@y
Enable debug logging to see routing decisions:
@z

@x
```bash
$ docker agent run config.yaml --debug
```
@y
```bash
$ docker agent run config.yaml --debug
```
@z

@x
Look for log entries like:
@y
Look for log entries like:
@z

@x
```text
"Rule-based router selected model" router=smart_router selected_model=anthropic/claude-sonnet-4-5
"Route matched" model=anthropic/claude-sonnet-4-5 score=2.45
```
@y
```text
"Rule-based router selected model" router=smart_router selected_model=anthropic/claude-sonnet-4-5
"Route matched" model=anthropic/claude-sonnet-4-5 score=2.45
```
@z

@x
> [!WARNING]
> **Limitations**
>
> - Routing only considers the last user message, not full conversation context
> - Very short messages may not match well — consider your fallback carefully
> - Each routed model creates a separate provider connection
@y
> [!WARNING]
> **Limitations**
>
> - Routing only considers the last user message, not full conversation context
> - Very short messages may not match well — consider your fallback carefully
> - Each routed model creates a separate provider connection
@z
