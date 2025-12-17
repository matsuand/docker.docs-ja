%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Best practices
description: Patterns and techniques for building effective cagent agents
keywords: [cagent, best practices, patterns, agent design, optimization]
@y
title: Best practices
description: Patterns and techniques for building effective cagent agents
keywords: [cagent, best practices, patterns, agent design, optimization]
@z

@x
Patterns you learn from building and running cagent agents. These aren't
features or configuration options - they're approaches that work well in
practice.
@y
Patterns you learn from building and running cagent agents. These aren't
features or configuration options - they're approaches that work well in
practice.
@z

@x
## Handling large command outputs
@y
## Handling large command outputs
@z

@x
Shell commands that produce large output can overflow your agent's context
window. Validation tools, test suites, and build logs often generate thousands
of lines. If you capture this output directly, it consumes all available context
and the agent fails.
@y
Shell commands that produce large output can overflow your agent's context
window. Validation tools, test suites, and build logs often generate thousands
of lines. If you capture this output directly, it consumes all available context
and the agent fails.
@z

@x
The solution: redirect output to a file, then read the file. The Read tool
automatically truncates large files to 2000 lines, and your agent can navigate
through it if needed.
@y
The solution: redirect output to a file, then read the file. The Read tool
automatically truncates large files to 2000 lines, and your agent can navigate
through it if needed.
@z

@x
**Don't do this:**
@y
**Don't do this:**
@z

@x
```yaml
reviewer:
  instruction: |
    Run validation: `docker buildx bake validate`
    Check the output for errors.
  toolsets:
    - type: shell
```
@y
```yaml
reviewer:
  instruction: |
    Run validation: `docker buildx bake validate`
    Check the output for errors.
  toolsets:
    - type: shell
```
@z

@x
The validation output goes directly into context. If it's large, the agent fails
with a context overflow error.
@y
The validation output goes directly into context. If it's large, the agent fails
with a context overflow error.
@z

@x
**Do this:**
@y
**Do this:**
@z

@x
```yaml
reviewer:
  instruction: |
    Run validation and save output:
    `docker buildx bake validate > validation.log 2>&1`
@y
```yaml
reviewer:
  instruction: |
    Run validation and save output:
    `docker buildx bake validate > validation.log 2>&1`
@z

@x
    Read validation.log to check for errors.
    The file can be large - read the first 2000 lines.
    Errors usually appear at the beginning.
  toolsets:
    - type: filesystem
    - type: shell
```
@y
    Read validation.log to check for errors.
    The file can be large - read the first 2000 lines.
    Errors usually appear at the beginning.
  toolsets:
    - type: filesystem
    - type: shell
```
@z

@x
The output goes to a file, not context. The agent reads what it needs using the
filesystem toolset.
@y
The output goes to a file, not context. The agent reads what it needs using the
filesystem toolset.
@z

@x
## Structuring agent teams
@y
## Structuring agent teams
@z

@x
A single agent handling multiple responsibilities makes instructions complex and
behavior unpredictable. Breaking work across specialized agents produces better
results.
@y
A single agent handling multiple responsibilities makes instructions complex and
behavior unpredictable. Breaking work across specialized agents produces better
results.
@z

@x
The coordinator pattern works well: a root agent understands the overall task
and delegates to specialists. Each specialist focuses on one thing.
@y
The coordinator pattern works well: a root agent understands the overall task
and delegates to specialists. Each specialist focuses on one thing.
@z

@x
**Example: Documentation writing team**
@y
**Example: Documentation writing team**
@z

@x
```yaml
agents:
  root:
    description: Technical writing coordinator
    instruction: |
      Coordinate documentation work:
      1. Delegate to writer for content creation
      2. Delegate to editor for formatting polish
      3. Delegate to reviewer for validation
      4. Loop back through editor if reviewer finds issues
    sub_agents: [writer, editor, reviewer]
    toolsets: [filesystem, todo]
@y
```yaml
agents:
  root:
    description: Technical writing coordinator
    instruction: |
      Coordinate documentation work:
      1. Delegate to writer for content creation
      2. Delegate to editor for formatting polish
      3. Delegate to reviewer for validation
      4. Loop back through editor if reviewer finds issues
    sub_agents: [writer, editor, reviewer]
    toolsets: [filesystem, todo]
@z

@x
  writer:
    description: Creates and edits documentation content
    instruction: |
      Write clear, practical documentation.
      Focus on content quality - the editor handles formatting.
    toolsets: [filesystem, think]
@y
  writer:
    description: Creates and edits documentation content
    instruction: |
      Write clear, practical documentation.
      Focus on content quality - the editor handles formatting.
    toolsets: [filesystem, think]
@z

@x
  editor:
    description: Polishes formatting and style
    instruction: |
      Fix formatting issues, wrap lines, run prettier.
      Remove AI-isms and polish style.
      Don't change meaning or add content.
    toolsets: [filesystem, shell]
@y
  editor:
    description: Polishes formatting and style
    instruction: |
      Fix formatting issues, wrap lines, run prettier.
      Remove AI-isms and polish style.
      Don't change meaning or add content.
    toolsets: [filesystem, shell]
@z

@x
  reviewer:
    description: Runs validation tools
    instruction: |
      Run validation suite, report failures.
    toolsets: [filesystem, shell]
```
@y
  reviewer:
    description: Runs validation tools
    instruction: |
      Run validation suite, report failures.
    toolsets: [filesystem, shell]
```
@z

@x
Each agent has clear responsibilities. The writer doesn't worry about line
wrapping. The editor doesn't generate content. The reviewer just runs tools.
@y
Each agent has clear responsibilities. The writer doesn't worry about line
wrapping. The editor doesn't generate content. The reviewer just runs tools.
@z

@x
**When to use teams:**
@y
**When to use teams:**
@z

@x
- Multiple distinct steps in your workflow
- Different skills required (writing ↔ editing ↔ testing)
- One step might need to retry based on later feedback
@y
- Multiple distinct steps in your workflow
- Different skills required (writing ↔ editing ↔ testing)
- One step might need to retry based on later feedback
@z

@x
**When to use a single agent:**
@y
**When to use a single agent:**
@z

@x
- Simple, focused tasks
- All work happens in one step
- Adding coordination overhead doesn't help
@y
- Simple, focused tasks
- All work happens in one step
- Adding coordination overhead doesn't help
@z

@x
## Optimizing RAG performance
@y
## Optimizing RAG performance
@z

@x
RAG indexing takes time when you have many files. A configuration that indexes
your entire codebase might take minutes to start. Optimize for what your agent
actually needs.
@y
RAG indexing takes time when you have many files. A configuration that indexes
your entire codebase might take minutes to start. Optimize for what your agent
actually needs.
@z

@x
**Narrow the scope:**
@y
**Narrow the scope:**
@z

@x
Don't index everything. Index what's relevant for the agent's work.
@y
Don't index everything. Index what's relevant for the agent's work.
@z

@x
```yaml
# Too broad - indexes entire codebase
rag:
  codebase:
    docs: [./]
@y
```yaml
# Too broad - indexes entire codebase
rag:
  codebase:
    docs: [./]
@z

@x
# Better - indexes only relevant directories
rag:
  codebase:
    docs: [./src/api, ./docs, ./examples]
```
@y
# Better - indexes only relevant directories
rag:
  codebase:
    docs: [./src/api, ./docs, ./examples]
```
@z

@x
If your agent only works with API code, don't index tests, vendor directories,
or generated files.
@y
If your agent only works with API code, don't index tests, vendor directories,
or generated files.
@z

@x
**Increase batching and concurrency:**
@y
**Increase batching and concurrency:**
@z

@x
Process more chunks per API call and make parallel requests.
@y
Process more chunks per API call and make parallel requests.
@z

@x
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    batch_size: 50 # More chunks per API call
    max_embedding_concurrency: 10 # Parallel requests
    chunking:
      size: 2000 # Larger chunks = fewer total chunks
      overlap: 150
```
@y
```yaml
strategies:
  - type: chunked-embeddings
    embedding_model: openai/text-embedding-3-small
    batch_size: 50 # More chunks per API call
    max_embedding_concurrency: 10 # Parallel requests
    chunking:
      size: 2000 # Larger chunks = fewer total chunks
      overlap: 150
```
@z

@x
This reduces both API calls and indexing time.
@y
This reduces both API calls and indexing time.
@z

@x
**Consider BM25 for fast local search:**
@y
**Consider BM25 for fast local search:**
@z

@x
If you need exact term matching (function names, error messages, identifiers),
BM25 is fast and runs locally without API calls.
@y
If you need exact term matching (function names, error messages, identifiers),
BM25 is fast and runs locally without API calls.
@z

@x
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    chunking:
      size: 1500
```
@y
```yaml
strategies:
  - type: bm25
    database: ./bm25.db
    chunking:
      size: 1500
```
@z

@x
Combine with embeddings using hybrid retrieval when you need both semantic
understanding and exact matching.
@y
Combine with embeddings using hybrid retrieval when you need both semantic
understanding and exact matching.
@z

@x
## Preserving document scope
@y
## Preserving document scope
@z

@x
When building agents that update documentation, a common problem: the agent
transforms minimal guides into tutorials. It adds prerequisites,
troubleshooting, best practices, examples, and detailed explanations to
everything.
@y
When building agents that update documentation, a common problem: the agent
transforms minimal guides into tutorials. It adds prerequisites,
troubleshooting, best practices, examples, and detailed explanations to
everything.
@z

@x
These additions might individually be good, but they change the document's
character. A focused 90-line how-to becomes a 200-line reference.
@y
These additions might individually be good, but they change the document's
character. A focused 90-line how-to becomes a 200-line reference.
@z

@x
**Build this into instructions:**
@y
**Build this into instructions:**
@z

@x
```yaml
writer:
  instruction: |
    When updating documentation:
@y
```yaml
writer:
  instruction: |
    When updating documentation:
@z

@x
    1. Understand the current document's scope and length
    2. Match that character - don't transform minimal guides into tutorials
    3. Add only what's genuinely missing
    4. Value brevity - not every topic needs comprehensive coverage
@y
    1. Understand the current document's scope and length
    2. Match that character - don't transform minimal guides into tutorials
    3. Add only what's genuinely missing
    4. Value brevity - not every topic needs comprehensive coverage
@z

@x
    Good additions fill gaps. Bad additions change the document's character.
    When in doubt, add less rather than more.
```
@y
    Good additions fill gaps. Bad additions change the document's character.
    When in doubt, add less rather than more.
```
@z

@x
Tell your agents explicitly to preserve the existing document's scope. Without
this guidance, they default to being comprehensive.
@y
Tell your agents explicitly to preserve the existing document's scope. Without
this guidance, they default to being comprehensive.
@z

@x
## Model selection
@y
## Model selection
@z

@x
Choose models based on the agent's role and complexity.
@y
Choose models based on the agent's role and complexity.
@z

@x
**Use larger models (Sonnet, GPT-5) for:**
@y
**Use larger models (Sonnet, GPT-5) for:**
@z

@x
- Complex reasoning and planning
- Writing and editing content
- Coordinating multiple agents
- Tasks requiring judgment and creativity
@y
- Complex reasoning and planning
- Writing and editing content
- Coordinating multiple agents
- Tasks requiring judgment and creativity
@z

@x
**Use smaller models (Haiku, GPT-5 Mini) for:**
@y
**Use smaller models (Haiku, GPT-5 Mini) for:**
@z

@x
- Running validation tools
- Simple structured tasks
- Reading logs and reporting errors
- High-volume, low-complexity work
@y
- Running validation tools
- Simple structured tasks
- Reading logs and reporting errors
- High-volume, low-complexity work
@z

@x
Example from the documentation writing team:
@y
Example from the documentation writing team:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5 # Complex coordination
  writer:
    model: anthropic/claude-sonnet-4-5 # Creative content work
  editor:
    model: anthropic/claude-sonnet-4-5 # Judgment about style
  reviewer:
    model: anthropic/claude-haiku-4-5 # Just runs validation
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5 # Complex coordination
  writer:
    model: anthropic/claude-sonnet-4-5 # Creative content work
  editor:
    model: anthropic/claude-sonnet-4-5 # Judgment about style
  reviewer:
    model: anthropic/claude-haiku-4-5 # Just runs validation
```
@z

@x
The reviewer uses Haiku because it runs commands and checks for errors. No
complex reasoning needed, and Haiku is faster and cheaper.
@y
The reviewer uses Haiku because it runs commands and checks for errors. No
complex reasoning needed, and Haiku is faster and cheaper.
@z

@x
## What's next
@y
## What's next
@z

@x
- Review [configuration reference](./reference/config.md) for all available
  options
- Check [toolsets reference](./reference/toolsets.md) to understand what tools
  agents can use
- See [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  complete working agents
- Read the [RAG guide](./rag.md) for detailed retrieval optimization
@y
- Review [configuration reference](./reference/config.md) for all available
  options
- Check [toolsets reference](./reference/toolsets.md) to understand what tools
  agents can use
- See [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  complete working agents
- Read the [RAG guide](./rag.md) for detailed retrieval optimization
@z
