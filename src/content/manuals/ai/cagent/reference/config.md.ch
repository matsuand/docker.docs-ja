%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configuration file reference
linkTitle: Configuration file
description: Complete reference for the cagent YAML configuration file format
keywords: [ai, agent, cagent, configuration, yaml]
@y
title: Configuration file reference
linkTitle: Configuration file
description: Complete reference for the cagent YAML configuration file format
keywords: [ai, agent, cagent, configuration, yaml]
@z

@x
This reference documents the YAML configuration file format for cagent agents.
It covers file structure, agent parameters, model configuration, toolset setup,
and RAG sources.
@y
This reference documents the YAML configuration file format for cagent agents.
It covers file structure, agent parameters, model configuration, toolset setup,
and RAG sources.
@z

@x
For detailed documentation of each toolset's capabilities and specific options,
see the [Toolsets reference](./toolsets.md).
@y
For detailed documentation of each toolset's capabilities and specific options,
see the [Toolsets reference](./toolsets.md).
@z

@x
## File structure
@y
## File structure
@z

@x
A configuration file has four top-level sections:
@y
A configuration file has four top-level sections:
@z

@x
```yaml
agents: # Required - agent definitions
  root:
    model: anthropic/claude-sonnet-4-5
    description: What this agent does
    instruction: How it should behave
@y
```yaml
agents: # Required - agent definitions
  root:
    model: anthropic/claude-sonnet-4-5
    description: What this agent does
    instruction: How it should behave
@z

@x
models: # Optional - model configurations
  custom_model:
    provider: openai
    model: gpt-5
@y
models: # Optional - model configurations
  custom_model:
    provider: openai
    model: gpt-5
@z

@x
rag: # Optional - RAG sources
  docs:
    docs: [./documents]
    strategies: [...]
@y
rag: # Optional - RAG sources
  docs:
    docs: [./documents]
    strategies: [...]
@z

@x
metadata: # Optional - author, license, readme
  author: Your Name
```
@y
metadata: # Optional - author, license, readme
  author: Your Name
```
@z

@x
## Agents
@y
## Agents
@z

@x
| Property               | Type    | Description                                    | Required |
| ---------------------- | ------- | ---------------------------------------------- | -------- |
| `model`                | string  | Model reference or name                        | Yes      |
| `description`          | string  | Brief description of agent's purpose           | No       |
| `instruction`          | string  | Detailed behavior instructions                 | Yes      |
| `sub_agents`           | array   | Agent names for task delegation                | No       |
| `handoffs`             | array   | Agent names for conversation handoff           | No       |
| `toolsets`             | array   | Available tools                                | No       |
| `welcome_message`      | string  | Message displayed on start                     | No       |
| `add_date`             | boolean | Include current date in context                | No       |
| `add_environment_info` | boolean | Include working directory, OS, Git info        | No       |
| `add_prompt_files`     | array   | Prompt file paths to include                   | No       |
| `max_iterations`       | integer | Maximum tool call loops (unlimited if not set) | No       |
| `num_history_items`    | integer | Conversation history limit                     | No       |
| `code_mode_tools`      | boolean | Enable Code Mode for tools                     | No       |
| `commands`             | object  | Named prompts accessible via `/command_name`   | No       |
| `structured_output`    | object  | JSON schema for structured responses           | No       |
| `rag`                  | array   | RAG source names                               | No       |
@y
| Property               | Type    | Description                                    | Required |
| ---------------------- | ------- | ---------------------------------------------- | -------- |
| `model`                | string  | Model reference or name                        | Yes      |
| `description`          | string  | Brief description of agent's purpose           | No       |
| `instruction`          | string  | Detailed behavior instructions                 | Yes      |
| `sub_agents`           | array   | Agent names for task delegation                | No       |
| `handoffs`             | array   | Agent names for conversation handoff           | No       |
| `toolsets`             | array   | Available tools                                | No       |
| `welcome_message`      | string  | Message displayed on start                     | No       |
| `add_date`             | boolean | Include current date in context                | No       |
| `add_environment_info` | boolean | Include working directory, OS, Git info        | No       |
| `add_prompt_files`     | array   | Prompt file paths to include                   | No       |
| `max_iterations`       | integer | Maximum tool call loops (unlimited if not set) | No       |
| `num_history_items`    | integer | Conversation history limit                     | No       |
| `code_mode_tools`      | boolean | Enable Code Mode for tools                     | No       |
| `commands`             | object  | Named prompts accessible via `/command_name`   | No       |
| `structured_output`    | object  | JSON schema for structured responses           | No       |
| `rag`                  | array   | RAG source names                               | No       |
@z

@x
### Task delegation versus conversation handoff
@y
### Task delegation versus conversation handoff
@z

@x
Agents support two different delegation mechanisms. Choose based on whether you
need task results or conversation control.
@y
Agents support two different delegation mechanisms. Choose based on whether you
need task results or conversation control.
@z

@x
#### Sub_agents: Hierarchical task delegation
@y
#### Sub_agents: Hierarchical task delegation
@z

@x
Use `sub_agents` for hierarchical task delegation. The parent agent assigns a
specific task to a child agent using the `transfer_task` tool. The child
executes in its own context and returns results. The parent maintains control
and can delegate to multiple agents in sequence.
@y
Use `sub_agents` for hierarchical task delegation. The parent agent assigns a
specific task to a child agent using the `transfer_task` tool. The child
executes in its own context and returns results. The parent maintains control
and can delegate to multiple agents in sequence.
@z

@x
This works well for structured workflows where you need to combine results from
specialists, or when tasks have clear boundaries. Each delegated task runs
independently and reports back to the parent.
@y
This works well for structured workflows where you need to combine results from
specialists, or when tasks have clear boundaries. Each delegated task runs
independently and reports back to the parent.
@z

@x
**Example:**
@y
**Example:**
@z

@x
```yaml
agents:
  root:
    sub_agents: [researcher, analyst]
    instruction: |
      Delegate research to researcher.
      Delegate analysis to analyst.
      Combine results and present findings.
```
@y
```yaml
agents:
  root:
    sub_agents: [researcher, analyst]
    instruction: |
      Delegate research to researcher.
      Delegate analysis to analyst.
      Combine results and present findings.
```
@z

@x
Root calls: `transfer_task(agent="researcher", task="Find pricing data")`. The
researcher completes the task and returns results to root.
@y
Root calls: `transfer_task(agent="researcher", task="Find pricing data")`. The
researcher completes the task and returns results to root.
@z

@x
#### Handoffs: Conversation transfer
@y
#### Handoffs: Conversation transfer
@z

@x
Use `handoffs` to transfer conversation control to a different agent. When an
agent uses the `handoff` tool, the new agent takes over completely. The
original agent steps back until someone hands back to it.
@y
Use `handoffs` to transfer conversation control to a different agent. When an
agent uses the `handoff` tool, the new agent takes over completely. The
original agent steps back until someone hands back to it.
@z

@x
This works well when different agents should own different parts of an ongoing
conversation, or when specialists need to collaborate as peers without a
coordinator managing every step.
@y
This works well when different agents should own different parts of an ongoing
conversation, or when specialists need to collaborate as peers without a
coordinator managing every step.
@z

@x
**Example:**
@y
**Example:**
@z

@x
```yaml
agents:
  generalist:
    handoffs: [database_expert, security_expert]
    instruction: |
      Help with general development questions.
      If the conversation moves to database optimization,
      hand off to database_expert.
      If security concerns arise, hand off to security_expert.
@y
```yaml
agents:
  generalist:
    handoffs: [database_expert, security_expert]
    instruction: |
      Help with general development questions.
      If the conversation moves to database optimization,
      hand off to database_expert.
      If security concerns arise, hand off to security_expert.
@z

@x
  database_expert:
    handoffs: [generalist, security_expert]
    instruction: Handle database design and optimization.
@y
  database_expert:
    handoffs: [generalist, security_expert]
    instruction: Handle database design and optimization.
@z

@x
  security_expert:
    handoffs: [generalist, database_expert]
    instruction: Review code for security vulnerabilities.
```
@y
  security_expert:
    handoffs: [generalist, database_expert]
    instruction: Review code for security vulnerabilities.
```
@z

@x
When the user asks about query performance, generalist executes:
`handoff(agent="database_expert")`. The database expert now owns the
conversation and can continue working with the user directly, or hand off to
security_expert if the discussion shifts to SQL injection concerns.
@y
When the user asks about query performance, generalist executes:
`handoff(agent="database_expert")`. The database expert now owns the
conversation and can continue working with the user directly, or hand off to
security_expert if the discussion shifts to SQL injection concerns.
@z

@x
### Commands
@y
### Commands
@z

@x
Named prompts users invoke with `/command_name`. Supports JavaScript template
literals with `${env.VARIABLE}` for environment variables:
@y
Named prompts users invoke with `/command_name`. Supports JavaScript template
literals with `${env.VARIABLE}` for environment variables:
@z

@x
```yaml
commands:
  greet: "Say hello to ${env.USER}"
  analyze: "Analyze ${env.PROJECT_NAME || 'demo'}"
```
@y
```yaml
commands:
  greet: "Say hello to ${env.USER}"
  analyze: "Analyze ${env.PROJECT_NAME || 'demo'}"
```
@z

@x
Run with: `cagent run config.yaml /greet`
@y
Run with: `cagent run config.yaml /greet`
@z

@x
### Structured output
@y
### Structured output
@z

@x
Constrain responses to a JSON schema (OpenAI and Gemini only):
@y
Constrain responses to a JSON schema (OpenAI and Gemini only):
@z

@x
```yaml
structured_output:
  name: code_analysis
  strict: true
  schema:
    type: object
    properties:
      issues:
        type: array
        items: { ... }
    required: [issues]
```
@y
```yaml
structured_output:
  name: code_analysis
  strict: true
  schema:
    type: object
    properties:
      issues:
        type: array
        items: { ... }
    required: [issues]
```
@z

@x
## Models
@y
## Models
@z

@x
| Property              | Type    | Description                                    | Required |
| --------------------- | ------- | ---------------------------------------------- | -------- |
| `provider`            | string  | `openai`, `anthropic`, `google`, `dmr`         | Yes      |
| `model`               | string  | Model name                                     | Yes      |
| `temperature`         | float   | Randomness (0.0-2.0)                           | No       |
| `max_tokens`          | integer | Maximum response length                        | No       |
| `top_p`               | float   | Nucleus sampling (0.0-1.0)                     | No       |
| `frequency_penalty`   | float   | Repetition penalty (-2.0 to 2.0, OpenAI only)  | No       |
| `presence_penalty`    | float   | Topic penalty (-2.0 to 2.0, OpenAI only)       | No       |
| `base_url`            | string  | Custom API endpoint                            | No       |
| `parallel_tool_calls` | boolean | Enable parallel tool execution (default: true) | No       |
| `token_key`           | string  | Authentication token key                       | No       |
| `track_usage`         | boolean | Track token usage                              | No       |
| `thinking_budget`     | mixed   | Reasoning effort (provider-specific)           | No       |
| `provider_opts`       | object  | Provider-specific options                      | No       |
@y
| Property              | Type    | Description                                    | Required |
| --------------------- | ------- | ---------------------------------------------- | -------- |
| `provider`            | string  | `openai`, `anthropic`, `google`, `dmr`         | Yes      |
| `model`               | string  | Model name                                     | Yes      |
| `temperature`         | float   | Randomness (0.0-2.0)                           | No       |
| `max_tokens`          | integer | Maximum response length                        | No       |
| `top_p`               | float   | Nucleus sampling (0.0-1.0)                     | No       |
| `frequency_penalty`   | float   | Repetition penalty (-2.0 to 2.0, OpenAI only)  | No       |
| `presence_penalty`    | float   | Topic penalty (-2.0 to 2.0, OpenAI only)       | No       |
| `base_url`            | string  | Custom API endpoint                            | No       |
| `parallel_tool_calls` | boolean | Enable parallel tool execution (default: true) | No       |
| `token_key`           | string  | Authentication token key                       | No       |
| `track_usage`         | boolean | Track token usage                              | No       |
| `thinking_budget`     | mixed   | Reasoning effort (provider-specific)           | No       |
| `provider_opts`       | object  | Provider-specific options                      | No       |
@z

@x
### Alloy models
@y
### Alloy models
@z

@x
Use multiple models in rotation by separating names with commas:
@y
Use multiple models in rotation by separating names with commas:
@z

@x
```yaml
model: anthropic/claude-sonnet-4-5,openai/gpt-5
```
@y
```yaml
model: anthropic/claude-sonnet-4-5,openai/gpt-5
```
@z

@x
### Thinking budget
@y
### Thinking budget
@z

@x
Controls reasoning depth. Configuration varies by provider:
@y
Controls reasoning depth. Configuration varies by provider:
@z

@x
- **OpenAI**: String values - `minimal`, `low`, `medium`, `high`
- **Anthropic**: Integer token budget (1024-32768, must be less than
  `max_tokens`)
  - Set `provider_opts.interleaved_thinking: true` for tool use during reasoning
- **Gemini**: Integer token budget (0 to disable, -1 for dynamic, max 24576)
  - Gemini 2.5 Pro: 128-32768, cannot disable (minimum 128)
@y
- **OpenAI**: String values - `minimal`, `low`, `medium`, `high`
- **Anthropic**: Integer token budget (1024-32768, must be less than
  `max_tokens`)
  - Set `provider_opts.interleaved_thinking: true` for tool use during reasoning
- **Gemini**: Integer token budget (0 to disable, -1 for dynamic, max 24576)
  - Gemini 2.5 Pro: 128-32768, cannot disable (minimum 128)
@z

@x
```yaml
# OpenAI
thinking_budget: low
@y
```yaml
# OpenAI
thinking_budget: low
@z

@x
# Anthropic
thinking_budget: 8192
provider_opts:
  interleaved_thinking: true
@y
# Anthropic
thinking_budget: 8192
provider_opts:
  interleaved_thinking: true
@z

@x
# Gemini
thinking_budget: 8192    # Fixed
thinking_budget: -1      # Dynamic
thinking_budget: 0       # Disabled
```
@y
# Gemini
thinking_budget: 8192    # Fixed
thinking_budget: -1      # Dynamic
thinking_budget: 0       # Disabled
```
@z

@x
### Docker Model Runner (DMR)
@y
### Docker Model Runner (DMR)
@z

@x
Run local models. If `base_url` is omitted, cagent auto-discovers via Docker
Model plugin.
@y
Run local models. If `base_url` is omitted, cagent auto-discovers via Docker
Model plugin.
@z

@x
```yaml
provider: dmr
model: ai/qwen3
max_tokens: 8192
base_url: http://localhost:12434/engines/llama.cpp/v1 # Optional
```
@y
```yaml
provider: dmr
model: ai/qwen3
max_tokens: 8192
base_url: http://localhost:12434/engines/llama.cpp/v1 # Optional
```
@z

@x
Pass llama.cpp options via `provider_opts.runtime_flags` (array, string, or
multiline):
@y
Pass llama.cpp options via `provider_opts.runtime_flags` (array, string, or
multiline):
@z

@x
```yaml
provider_opts:
  runtime_flags: ["--ngl=33", "--threads=8"]
  # or: runtime_flags: "--ngl=33 --threads=8"
```
@y
```yaml
provider_opts:
  runtime_flags: ["--ngl=33", "--threads=8"]
  # or: runtime_flags: "--ngl=33 --threads=8"
```
@z

@x
Model config fields auto-map to runtime flags:
@y
Model config fields auto-map to runtime flags:
@z

@x
- `temperature` → `--temp`
- `top_p` → `--top-p`
- `max_tokens` → `--context-size`
@y
- `temperature` → `--temp`
- `top_p` → `--top-p`
- `max_tokens` → `--context-size`
@z

@x
Explicit `runtime_flags` override auto-mapped flags.
@y
Explicit `runtime_flags` override auto-mapped flags.
@z

@x
Speculative decoding for faster inference:
@y
Speculative decoding for faster inference:
@z

@x
```yaml
provider_opts:
  speculative_draft_model: ai/qwen3:0.6B-F16
  speculative_num_tokens: 16
  speculative_acceptance_rate: 0.8
```
@y
```yaml
provider_opts:
  speculative_draft_model: ai/qwen3:0.6B-F16
  speculative_num_tokens: 16
  speculative_acceptance_rate: 0.8
```
@z

@x
## Tools
@y
## Tools
@z

@x
Configure tools in the `toolsets` array. Three types: built-in, MCP
(local/remote), and Docker Gateway.
@y
Configure tools in the `toolsets` array. Three types: built-in, MCP
(local/remote), and Docker Gateway.
@z

@x
> [!NOTE] This section covers toolset configuration syntax. For detailed
> documentation of each toolset's capabilities, available tools, and specific
> configuration options, see the [Toolsets reference](./toolsets.md).
@y
> [!NOTE] This section covers toolset configuration syntax. For detailed
> documentation of each toolset's capabilities, available tools, and specific
> configuration options, see the [Toolsets reference](./toolsets.md).
@z

@x
All toolsets support common properties like `tools` (whitelist), `defer`
(deferred loading), `toon` (output compression), `env` (environment variables),
and `instruction` (usage guidance). See the [Toolsets reference](./toolsets.md)
for details on these properties and what each toolset does.
@y
All toolsets support common properties like `tools` (whitelist), `defer`
(deferred loading), `toon` (output compression), `env` (environment variables),
and `instruction` (usage guidance). See the [Toolsets reference](./toolsets.md)
for details on these properties and what each toolset does.
@z

@x
### Built-in tools
@y
### Built-in tools
@z

@x
```yaml
toolsets:
  - type: filesystem
  - type: shell
  - type: think
  - type: todo
    shared: true
  - type: memory
    path: ./memory.db
```
@y
```yaml
toolsets:
  - type: filesystem
  - type: shell
  - type: think
  - type: todo
    shared: true
  - type: memory
    path: ./memory.db
```
@z

@x
### MCP tools
@y
### MCP tools
@z

@x
Local process:
@y
Local process:
@z

@x
```yaml
- type: mcp
  command: npx
  args:
    ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/files"]
  tools: ["read_file", "write_file"] # Optional: limit to specific tools
  env:
    NODE_OPTIONS: "--max-old-space-size=8192"
```
@y
```yaml
- type: mcp
  command: npx
  args:
    ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/files"]
  tools: ["read_file", "write_file"] # Optional: limit to specific tools
  env:
    NODE_OPTIONS: "--max-old-space-size=8192"
```
@z

@x
Remote server:
@y
Remote server:
@z

@x
```yaml
- type: mcp
  remote:
    url: https://mcp-server.example.com
    transport_type: sse
    headers:
      Authorization: Bearer token
```
@y
```yaml
- type: mcp
  remote:
    url: https://mcp-server.example.com
    transport_type: sse
    headers:
      Authorization: Bearer token
```
@z

@x
### Docker MCP Gateway
@y
### Docker MCP Gateway
@z

@x
Containerized tools from [Docker MCP
Catalog](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md):
@y
Containerized tools from [Docker MCP
Catalog](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md):
@z

@x
```yaml
- type: mcp
  ref: docker:duckduckgo
```
@y
```yaml
- type: mcp
  ref: docker:duckduckgo
```
@z

@x
## RAG
@y
## RAG
@z

@x
Retrieval-augmented generation for document knowledge bases. Define sources at
the top level, reference in agents.
@y
Retrieval-augmented generation for document knowledge bases. Define sources at
the top level, reference in agents.
@z

@x
```yaml
rag:
  docs:
    docs: [./documents, ./README.md]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./embeddings.db
@y
```yaml
rag:
  docs:
    docs: [./documents, ./README.md]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./embeddings.db
@z

@x
agents:
  root:
    rag: [docs]
```
@y
agents:
  root:
    rag: [docs]
```
@z

@x
### Retrieval strategies
@y
### Retrieval strategies
@z

@x
All strategies support chunking configuration. Chunk size and overlap are
measured in characters (Unicode code points), not tokens.
@y
All strategies support chunking configuration. Chunk size and overlap are
measured in characters (Unicode code points), not tokens.
@z

@x
#### Chunked-embeddings
@y
#### Chunked-embeddings
@z

@x
Direct semantic search using vector embeddings. Best for understanding intent,
synonyms, and paraphrasing.
@y
Direct semantic search using vector embeddings. Best for understanding intent,
synonyms, and paraphrasing.
@z

@x
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `embedding_model`                  | string  | -       |
| `database`                         | string  | -       |
| `vector_dimensions`                | integer | -       |
| `similarity_metric`                | string  | cosine  |
| `threshold`                        | float   | 0.5     |
| `limit`                            | integer | 5       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@y
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `embedding_model`                  | string  | -       |
| `database`                         | string  | -       |
| `vector_dimensions`                | integer | -       |
| `similarity_metric`                | string  | cosine  |
| `threshold`                        | float   | 0.5     |
| `limit`                            | integer | 5       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@z

@x
```yaml
- type: chunked-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  database: ./vector.db
  similarity_metric: cosine_similarity
  threshold: 0.5
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@y
```yaml
- type: chunked-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  database: ./vector.db
  similarity_metric: cosine_similarity
  threshold: 0.5
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@z

@x
#### Semantic-embeddings
@y
#### Semantic-embeddings
@z

@x
LLM-enhanced semantic search. Uses a language model to generate rich semantic
summaries of each chunk before embedding, capturing deeper meaning.
@y
LLM-enhanced semantic search. Uses a language model to generate rich semantic
summaries of each chunk before embedding, capturing deeper meaning.
@z

@x
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `embedding_model`                  | string  | -       |
| `chat_model`                       | string  | -       |
| `database`                         | string  | -       |
| `vector_dimensions`                | integer | -       |
| `similarity_metric`                | string  | cosine  |
| `threshold`                        | float   | 0.5     |
| `limit`                            | integer | 5       |
| `ast_context`                      | boolean | false   |
| `semantic_prompt`                  | string  | -       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@y
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `embedding_model`                  | string  | -       |
| `chat_model`                       | string  | -       |
| `database`                         | string  | -       |
| `vector_dimensions`                | integer | -       |
| `similarity_metric`                | string  | cosine  |
| `threshold`                        | float   | 0.5     |
| `limit`                            | integer | 5       |
| `ast_context`                      | boolean | false   |
| `semantic_prompt`                  | string  | -       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@z

@x
```yaml
- type: semantic-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  chat_model: openai/gpt-5-mini
  database: ./semantic.db
  threshold: 0.3
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@y
```yaml
- type: semantic-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  chat_model: openai/gpt-5-mini
  database: ./semantic.db
  threshold: 0.3
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@z

@x
#### BM25
@y
#### BM25
@z

@x
Keyword-based search using BM25 algorithm. Best for exact terms, technical
jargon, and code identifiers.
@y
Keyword-based search using BM25 algorithm. Best for exact terms, technical
jargon, and code identifiers.
@z

@x
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `database`                         | string  | -       |
| `k1`                               | float   | 1.5     |
| `b`                                | float   | 0.75    |
| `threshold`                        | float   | 0.0     |
| `limit`                            | integer | 5       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@y
| Field                              | Type    | Default |
| ---------------------------------- | ------- | ------- |
| `database`                         | string  | -       |
| `k1`                               | float   | 1.5     |
| `b`                                | float   | 0.75    |
| `threshold`                        | float   | 0.0     |
| `limit`                            | integer | 5       |
| `chunking.size`                    | integer | 1000    |
| `chunking.overlap`                 | integer | 75      |
| `chunking.respect_word_boundaries` | boolean | true    |
| `chunking.code_aware`              | boolean | false   |
@z

@x
```yaml
- type: bm25
  database: ./bm25.db
  k1: 1.5
  b: 0.75
  threshold: 0.3
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@y
```yaml
- type: bm25
  database: ./bm25.db
  k1: 1.5
  b: 0.75
  threshold: 0.3
  limit: 10
  chunking:
    size: 1000
    overlap: 100
```
@z

@x
### Hybrid retrieval
@y
### Hybrid retrieval
@z

@x
Combine multiple strategies with fusion:
@y
Combine multiple strategies with fusion:
@z

@x
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    database: ./vector.db
    limit: 20
  - type: bm25
    database: ./bm25.db
    limit: 15
@y
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    vector_dimensions: 1536
    database: ./vector.db
    limit: 20
  - type: bm25
    database: ./bm25.db
    limit: 15
@z

@x
results:
  fusion:
    strategy: rrf # Options: rrf, weighted, max
    k: 60 # RRF smoothing parameter
  deduplicate: true
  limit: 5
```
@y
results:
  fusion:
    strategy: rrf # Options: rrf, weighted, max
    k: 60 # RRF smoothing parameter
  deduplicate: true
  limit: 5
```
@z

@x
Fusion strategies:
@y
Fusion strategies:
@z

@x
- `rrf`: Reciprocal Rank Fusion (recommended, rank-based, no normalization
  needed)
- `weighted`: Weighted combination (`fusion.weights: {chunked-embeddings: 0.7,
bm25: 0.3}`)
- `max`: Maximum score across strategies
@y
- `rrf`: Reciprocal Rank Fusion (recommended, rank-based, no normalization
  needed)
- `weighted`: Weighted combination (`fusion.weights: {chunked-embeddings: 0.7,
bm25: 0.3}`)
- `max`: Maximum score across strategies
@z

@x
### Reranking
@y
### Reranking
@z

@x
Re-score results with a specialized model for improved relevance:
@y
Re-score results with a specialized model for improved relevance:
@z

@x
```yaml
results:
  reranking:
    model: openai/gpt-5-mini
    top_k: 10 # Only rerank top K (0 = all)
    threshold: 0.3 # Minimum score after reranking
    criteria: | # Optional domain-specific guidance
      Prioritize official docs over blog posts
  limit: 5
```
@y
```yaml
results:
  reranking:
    model: openai/gpt-5-mini
    top_k: 10 # Only rerank top K (0 = all)
    threshold: 0.3 # Minimum score after reranking
    criteria: | # Optional domain-specific guidance
      Prioritize official docs over blog posts
  limit: 5
```
@z

@x
DMR native reranking:
@y
DMR native reranking:
@z

@x
```yaml
models:
  reranker:
    provider: dmr
    model: hf.co/ggml-org/qwen3-reranker-0.6b-q8_0-gguf
@y
```yaml
models:
  reranker:
    provider: dmr
    model: hf.co/ggml-org/qwen3-reranker-0.6b-q8_0-gguf
@z

@x
results:
  reranking:
    model: reranker
```
@y
results:
  reranking:
    model: reranker
```
@z

@x
### Code-aware chunking
@y
### Code-aware chunking
@z

@x
For source code, use AST-based chunking. With semantic-embeddings, you can
include AST metadata in the LLM prompts:
@y
For source code, use AST-based chunking. With semantic-embeddings, you can
include AST metadata in the LLM prompts:
@z

@x
```yaml
- type: semantic-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  chat_model: openai/gpt-5-mini
  database: ./code.db
  ast_context: true # Include AST metadata in semantic prompts
  chunking:
    size: 2000
    code_aware: true # Enable AST-based chunking
```
@y
```yaml
- type: semantic-embeddings
  embedding_model: openai/text-embedding-3-small
  vector_dimensions: 1536
  chat_model: openai/gpt-5-mini
  database: ./code.db
  ast_context: true # Include AST metadata in semantic prompts
  chunking:
    size: 2000
    code_aware: true # Enable AST-based chunking
```
@z

@x
### RAG properties
@y
### RAG properties
@z

@x
Top-level RAG source:
@y
Top-level RAG source:
@z

@x
| Field        | Type     | Description                                                     |
| ------------ | -------- | --------------------------------------------------------------- |
| `docs`       | []string | Document paths (suppports glob patterns, respects `.gitignore`) |
| `tool`       | object   | Customize RAG tool name/description/instruction                 |
| `strategies` | []object | Retrieval strategies (see above for strategy-specific fields)   |
| `results`    | object   | Post-processing (fusion, reranking, limits)                     |
@y
| Field        | Type     | Description                                                     |
| ------------ | -------- | --------------------------------------------------------------- |
| `docs`       | []string | Document paths (suppports glob patterns, respects `.gitignore`) |
| `tool`       | object   | Customize RAG tool name/description/instruction                 |
| `strategies` | []object | Retrieval strategies (see above for strategy-specific fields)   |
| `results`    | object   | Post-processing (fusion, reranking, limits)                     |
@z

@x
Results:
@y
Results:
@z

@x
| Field                 | Type    | Default |
| --------------------- | ------- | ------- |
| `limit`               | integer | 15      |
| `deduplicate`         | boolean | true    |
| `include_score`       | boolean | false   |
| `fusion.strategy`     | string  | -       |
| `fusion.k`            | integer | 60      |
| `fusion.weights`      | object  | -       |
| `reranking.model`     | string  | -       |
| `reranking.top_k`     | integer | 0       |
| `reranking.threshold` | float   | 0.5     |
| `reranking.criteria`  | string  | ""      |
| `return_full_content` | boolean | false   |
@y
| Field                 | Type    | Default |
| --------------------- | ------- | ------- |
| `limit`               | integer | 15      |
| `deduplicate`         | boolean | true    |
| `include_score`       | boolean | false   |
| `fusion.strategy`     | string  | -       |
| `fusion.k`            | integer | 60      |
| `fusion.weights`      | object  | -       |
| `reranking.model`     | string  | -       |
| `reranking.top_k`     | integer | 0       |
| `reranking.threshold` | float   | 0.5     |
| `reranking.criteria`  | string  | ""      |
| `return_full_content` | boolean | false   |
@z

@x
## Metadata
@y
## Metadata
@z

@x
Documentation and sharing information:
@y
Documentation and sharing information:
@z

@x
| Property  | Type   | Description                     |
| --------- | ------ | ------------------------------- |
| `author`  | string | Author name                     |
| `license` | string | License (e.g., MIT, Apache-2.0) |
| `readme`  | string | Usage documentation             |
@y
| Property  | Type   | Description                     |
| --------- | ------ | ------------------------------- |
| `author`  | string | Author name                     |
| `license` | string | License (e.g., MIT, Apache-2.0) |
| `readme`  | string | Usage documentation             |
@z

@x
```yaml
metadata:
  author: Your Name
  license: MIT
  readme: |
    Description and usage instructions
```
@y
```yaml
metadata:
  author: Your Name
  license: MIT
  readme: |
    Description and usage instructions
```
@z

@x
## Example configuration
@y
## Example configuration
@z

@x
Complete configuration demonstrating key features:
@y
Complete configuration demonstrating key features:
@z

@x
```yaml
agents:
  root:
    model: claude
    description: Technical lead
    instruction: Coordinate development tasks and delegate to specialists
    sub_agents: [developer, reviewer]
    toolsets:
      - type: filesystem
      - type: mcp
        ref: docker:duckduckgo
    rag: [readmes]
    commands:
      status: "Check project status"
@y
```yaml
agents:
  root:
    model: claude
    description: Technical lead
    instruction: Coordinate development tasks and delegate to specialists
    sub_agents: [developer, reviewer]
    toolsets:
      - type: filesystem
      - type: mcp
        ref: docker:duckduckgo
    rag: [readmes]
    commands:
      status: "Check project status"
@z

@x
  developer:
    model: gpt
    description: Software developer
    instruction: Write clean, maintainable code
    toolsets:
      - type: filesystem
      - type: shell
@y
  developer:
    model: gpt
    description: Software developer
    instruction: Write clean, maintainable code
    toolsets:
      - type: filesystem
      - type: shell
@z

@x
  reviewer:
    model: claude
    description: Code reviewer
    instruction: Review for quality and security
    toolsets:
      - type: filesystem
@y
  reviewer:
    model: claude
    description: Code reviewer
    instruction: Review for quality and security
    toolsets:
      - type: filesystem
@z

@x
models:
  gpt:
    provider: openai
    model: gpt-5
@y
models:
  gpt:
    provider: openai
    model: gpt-5
@z

@x
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
@y
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
@z

@x
rag:
  readmes:
    docs: ["**/README.md"]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./embeddings.db
        limit: 10
      - type: bm25
        database: ./bm25.db
        limit: 10
    results:
      fusion:
        strategy: rrf
        k: 60
      limit: 5
```
@y
rag:
  readmes:
    docs: ["**/README.md"]
    strategies:
      - type: chunked-embeddings
        embedding_model: openai/text-embedding-3-small
        vector_dimensions: 1536
        database: ./embeddings.db
        limit: 10
      - type: bm25
        database: ./bm25.db
        limit: 10
    results:
      fusion:
        strategy: rrf
        k: 60
      limit: 5
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Read the [Toolsets reference](./toolsets.md) for detailed toolset
  documentation
- Review the [CLI reference](./cli.md) for command-line options
- Browse [example
  configurations](https://github.com/docker/cagent/tree/main/examples)
- Learn about [sharing agents](../sharing-agents.md)
@y
- Read the [Toolsets reference](./toolsets.md) for detailed toolset
  documentation
- Review the [CLI reference](./cli.md) for command-line options
- Browse [example
  configurations](https://github.com/docker/cagent/tree/main/examples)
- Learn about [sharing agents](../sharing-agents.md)
@z
