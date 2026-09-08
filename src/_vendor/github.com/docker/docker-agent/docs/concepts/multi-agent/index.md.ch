%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Multi-Agent Systems"
description: "Build teams of specialized agents that collaborate and delegate tasks to each other."
keywords: docker agent, ai agents, concepts, multi-agent systems
linkTitle: "Multi-Agent"
@y
title: "Multi-Agent Systems"
description: "Build teams of specialized agents that collaborate and delegate tasks to each other."
keywords: docker agent, ai agents, concepts, multi-agent systems
linkTitle: "Multi-Agent"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/multi-agent/
@y
canonical: __SUBDIR__/ai/docker-agent/concepts/multi-agent/
@z

@x
_Build teams of specialized agents that collaborate and delegate tasks to each other._
@y
_Build teams of specialized agents that collaborate and delegate tasks to each other._
@z

@x
## Why Multi-Agent?
@y
## Why Multi-Agent?
@z

@x
Complex tasks benefit from specialization. Instead of one monolithic agent trying to do everything, you can create a **team** of focused agents:
@y
Complex tasks benefit from specialization. Instead of one monolithic agent trying to do everything, you can create a **team** of focused agents:
@z

@x
- A **coordinator** that understands the overall goal and delegates
- A **developer** that writes code with filesystem and shell access
- A **reviewer** that checks code quality
- A **researcher** that searches the web for information
@y
- A **coordinator** that understands the overall goal and delegates
- A **developer** that writes code with filesystem and shell access
- A **reviewer** that checks code quality
- A **researcher** that searches the web for information
@z

@x
Each agent has its own model, tools, and instructions — optimized for its specific role.
@y
Each agent has its own model, tools, and instructions — optimized for its specific role.
@z

@x
## Two Patterns: Delegation vs. Handoffs
@y
## Two Patterns: Delegation vs. Handoffs
@z

@x
Docker Agent supports two multi-agent patterns:
@y
Docker Agent supports two multi-agent patterns:
@z

@x
| | **Delegation** (`sub_agents`) | **Handoffs** (`handoffs`) |
|---|---|---|
| **Topology** | Hierarchical (parent → child → parent) | Peer-to-peer graph (A → B → C → A) |
| **Session** | Child runs in a **sub-session** | Conversation stays in the **same session** |
| **Context** | Child gets a clean task description | Next agent sees the **full conversation history** |
| **Control flow** | Parent blocks until child finishes, then continues | Active agent switches — previous agent is no longer in the loop |
| **Tool** | `transfer_task` | `handoff` |
| **Best for** | Task delegation to specialists | Pipeline workflows, conversational routing |
@y
| | **Delegation** (`sub_agents`) | **Handoffs** (`handoffs`) |
|---|---|---|
| **Topology** | Hierarchical (parent → child → parent) | Peer-to-peer graph (A → B → C → A) |
| **Session** | Child runs in a **sub-session** | Conversation stays in the **same session** |
| **Context** | Child gets a clean task description | Next agent sees the **full conversation history** |
| **Control flow** | Parent blocks until child finishes, then continues | Active agent switches — previous agent is no longer in the loop |
| **Tool** | `transfer_task` | `handoff` |
| **Best for** | Task delegation to specialists | Pipeline workflows, conversational routing |
@z

@x
You can combine both patterns in the same configuration — an agent can have both `sub_agents` and `handoffs`.
@y
You can combine both patterns in the same configuration — an agent can have both `sub_agents` and `handoffs`.
@z

@x
> [!TIP]
> **When to use which**
>
> **`sub_agents`** — Use when a coordinator needs to send tasks to specialists and synthesize their results.
>
> **`handoffs`** — Use when agents should take turns processing the same conversation (pipelines, routing).
>
> **`background_agents`** — Use when multiple independent tasks can run simultaneously.
@y
> [!TIP]
> **When to use which**
>
> **`sub_agents`** — Use when a coordinator needs to send tasks to specialists and synthesize their results.
>
> **`handoffs`** — Use when agents should take turns processing the same conversation (pipelines, routing).
>
> **`background_agents`** — Use when multiple independent tasks can run simultaneously.
@z

@x
## Delegation with `sub_agents`
@y
## Delegation with `sub_agents`
@z

@x
Agents delegate tasks using the built-in `transfer_task` tool, which is automatically available to any agent with `sub_agents`. The parent agent sends a task to a child agent, waits for the result, and then continues.
@y
Agents delegate tasks using the built-in `transfer_task` tool, which is automatically available to any agent with `sub_agents`. The parent agent sends a task to a child agent, waits for the result, and then continues.
@z

@x
1. **User** sends a message to the root agent
2. **Root agent** analyzes the request and decides which sub-agent should handle it
3. **Root agent** calls `transfer_task` with the target agent, task description, and expected output
4. **Sub-agent** processes the task in its own agentic loop using its tools
5. **Results** flow back to the root agent, which responds to the user
@y
1. **User** sends a message to the root agent
2. **Root agent** analyzes the request and decides which sub-agent should handle it
3. **Root agent** calls `transfer_task` with the target agent, task description, and expected output
4. **Sub-agent** processes the task in its own agentic loop using its tools
5. **Results** flow back to the root agent, which responds to the user
@z

@x
```bash
# The transfer_task tool call looks like:
transfer_task(
  agent="developer",
  task="Create a REST API endpoint for user authentication",
  expected_output="Working Go code with tests"
)
```
@y
```bash
# The transfer_task tool call looks like:
transfer_task(
  agent="developer",
  task="Create a REST API endpoint for user authentication",
  expected_output="Working Go code with tests"
)
```
@z

@x
> [!NOTE]
> **Auto-Approved**
>
> Unlike other tools, `transfer_task` is always auto-approved — no user confirmation needed. This allows seamless delegation between agents.
@y
> [!NOTE]
> **Auto-Approved**
>
> Unlike other tools, `transfer_task` is always auto-approved — no user confirmation needed. This allows seamless delegation between agents.
@z

@x
## Handoffs Routing
@y
## Handoffs Routing
@z

@x
Handoffs are a peer-to-peer routing pattern where agents **hand off the entire conversation** to another agent. Unlike delegation, there is no sub-session — the conversation stays in a single session and the active agent simply switches.
@y
Handoffs are a peer-to-peer routing pattern where agents **hand off the entire conversation** to another agent. Unlike delegation, there is no sub-session — the conversation stays in a single session and the active agent simply switches.
@z

@x
This pattern is ideal for:
@y
This pattern is ideal for:
@z

@x
- **Pipeline workflows** — data flows through a chain of specialized agents
- **Conversational routing** — a coordinator routes the user to the right specialist, who can route back when done
- **Graph topologies** — agents can form cycles (A → B → C → A), enabling iterative workflows
@y
- **Pipeline workflows** — data flows through a chain of specialized agents
- **Conversational routing** — a coordinator routes the user to the right specialist, who can route back when done
- **Graph topologies** — agents can form cycles (A → B → C → A), enabling iterative workflows
@z

@x
### How It Works
@y
### How It Works
@z

@x
1. **User** sends a message to the starting agent
2. **Agent A** processes the message, then calls `handoff` to route to **Agent B**
3. **Agent B** becomes the active agent and sees the **full conversation history**
4. **Agent B** can respond, use its own tools, or hand off to another agent
5. This continues until an agent responds directly without handing off
@y
1. **User** sends a message to the starting agent
2. **Agent A** processes the message, then calls `handoff` to route to **Agent B**
3. **Agent B** becomes the active agent and sees the **full conversation history**
4. **Agent B** can respond, use its own tools, or hand off to another agent
5. This continues until an agent responds directly without handing off
@z

@x
```bash
# The handoff tool call looks like:
handoff(
  agent="summarizer"
)
```
@y
```bash
# The handoff tool call looks like:
handoff(
  agent="summarizer"
)
```
@z

@x
> [!NOTE]
> **Scoped Handoff Targets**
>
> Each agent can only hand off to agents listed in its own `handoffs` array. The `handoff` tool is automatically injected — you don't need to add it manually.
@y
> [!NOTE]
> **Scoped Handoff Targets**
>
> Each agent can only hand off to agents listed in its own `handoffs` array. The `handoff` tool is automatically injected — you don't need to add it manually.
@z

@x
### Example
@y
### Example
@z

@x
A coordinator routes to a researcher, who hands off to a summarizer, who returns to the coordinator:
@y
A coordinator routes to a researcher, who hands off to a summarizer, who returns to the coordinator:
@z

@x
```text
Root ──→ Researcher ──→ Summarizer ──→ Root
```
@y
```text
Root ──→ Researcher ──→ Summarizer ──→ Root
```
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Coordinator that routes queries
    instruction: |
      Route research queries to the researcher.
    handoffs:
      - researcher
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Coordinator that routes queries
    instruction: |
      Route research queries to the researcher.
    handoffs:
      - researcher
@z

@x
  researcher:
    model: openai/gpt-5
    description: Web researcher
    instruction: |
      Search the web, then hand off to the summarizer.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
    handoffs:
      - summarizer
@y
  researcher:
    model: openai/gpt-5
    description: Web researcher
    instruction: |
      Search the web, then hand off to the summarizer.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
    handoffs:
      - summarizer
@z

@x
  summarizer:
    model: openai/gpt-5
    description: Summarizes findings
    instruction: |
      Summarize the research results, then hand off
      back to root.
    handoffs:
      - root
```
@y
  summarizer:
    model: openai/gpt-5
    description: Summarizes findings
    instruction: |
      Summarize the research results, then hand off
      back to root.
    handoffs:
      - root
```
@z

@x
> [!TIP]
> **Full pipeline example**
>
> For a more complex handoff graph with branching and multiple processing stages, see [`examples/handoff.yaml`](https://github.com/docker/docker-agent/blob/main/examples/handoff.yaml).
@y
> [!TIP]
> **Full pipeline example**
>
> For a more complex handoff graph with branching and multiple processing stages, see [`examples/handoff.yaml`](https://github.com/docker/docker-agent/blob/main/examples/handoff.yaml).
@z

@x
### Forced Handoffs
@y
### Forced Handoffs
@z

@x
With `handoffs`, the **model decides** whether to call the `handoff` tool — which means it can forget to, breaking pipelines that depend on a strict order. `force_handoff` removes that uncertainty: whenever the agent produces a final response, the **runtime itself** routes the conversation to the named agent, bypassing the LLM's tool-calling entirely. The full conversation context carries over.
@y
With `handoffs`, the **model decides** whether to call the `handoff` tool — which means it can forget to, breaking pipelines that depend on a strict order. `force_handoff` removes that uncertainty: whenever the agent produces a final response, the **runtime itself** routes the conversation to the named agent, bypassing the LLM's tool-calling entirely. The full conversation context carries over.
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Extracts key facts from the input
    instruction: |
      Extract the key facts from the user's input as a bullet list.
    force_handoff: summarizer
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Extracts key facts from the input
    instruction: |
      Extract the key facts from the user's input as a bullet list.
    force_handoff: summarizer
@z

@x
  summarizer:
    model: anthropic/claude-sonnet-4-5
    description: Produces the final summary
    instruction: |
      Summarize the extracted facts for the user.
```
@y
  summarizer:
    model: anthropic/claude-sonnet-4-5
    description: Produces the final summary
    instruction: |
      Summarize the extracted facts for the user.
```
@z

@x
Rules enforced at config load time:
@y
Rules enforced at config load time:
@z

@x
- The target must be an agent defined in the config (or an external reference)
- An agent cannot `force_handoff` to itself
- Chains of `force_handoff` edges must not form a cycle (A → B → A is rejected)
@y
- The target must be an agent defined in the config (or an external reference)
- An agent cannot `force_handoff` to itself
- Chains of `force_handoff` edges must not form a cycle (A → B → A is rejected)
@z

@x
See [`examples/force_handoff.yaml`](https://github.com/docker/docker-agent/blob/main/examples/force_handoff.yaml) for a runnable example.
@y
See [`examples/force_handoff.yaml`](https://github.com/docker/docker-agent/blob/main/examples/force_handoff.yaml) for a runnable example.
@z

@x
## Parallel Delegation with Background Agents
@y
## Parallel Delegation with Background Agents
@z

@x
`transfer_task` is **sequential** — the coordinator waits for the sub-agent to finish before continuing. When you need to fan out work to multiple agents at the same time, use the `background_agents` toolset instead.
@y
`transfer_task` is **sequential** — the coordinator waits for the sub-agent to finish before continuing. When you need to fan out work to multiple agents at the same time, use the `background_agents` toolset instead.
@z

@x
Add it to your coordinator's toolsets:
@y
Add it to your coordinator's toolsets:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research coordinator
    sub_agents: [researcher, analyst, writer]
    toolsets:
      - type: think
      - type: background_agents
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research coordinator
    sub_agents: [researcher, analyst, writer]
    toolsets:
      - type: think
      - type: background_agents
```
@z

@x
The coordinator can then:
@y
The coordinator can then:
@z

@x
1. **Dispatch** several tasks at once with `run_background_agent` — each returns a task ID immediately
2. **Monitor** progress with `list_background_agents` or `view_background_agent`
3. **Collect** results once tasks complete
4. **Cancel** tasks that are no longer needed with `stop_background_agent`
@y
1. **Dispatch** several tasks at once with `run_background_agent` — each returns a task ID immediately
2. **Monitor** progress with `list_background_agents` or `view_background_agent`
3. **Collect** results once tasks complete
4. **Cancel** tasks that are no longer needed with `stop_background_agent`
@z

@x
```bash
# Start two tasks in parallel
run_background_agent(agent="researcher", task="Find recent papers on LLM agents")
run_background_agent(agent="analyst", task="Analyze our current architecture")
@y
```bash
# Start two tasks in parallel
run_background_agent(agent="researcher", task="Find recent papers on LLM agents")
run_background_agent(agent="analyst", task="Analyze our current architecture")
@z

@x
# Check on all tasks
list_background_agents()
@y
# Check on all tasks
list_background_agents()
@z

@x
# Read results when ready
view_background_agent(task_id="agent_task_abc123")
```
@y
# Read results when ready
view_background_agent(task_id="agent_task_abc123")
```
@z

@x
## External Sub-Agents from Registries
@y
## External Sub-Agents from Registries
@z

@x
Sub-agents don't have to be defined locally — you can reference agents from any OCI-compatible registry directly in your `sub_agents` list. This lets you compose teams using shared agents without duplicating their configuration.
@y
Sub-agents don't have to be defined locally — you can reference agents from any OCI-compatible registry directly in your `sub_agents` list. This lets you compose teams using shared agents without duplicating their configuration.
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator that delegates to local and external sub-agents
    instruction: |
      Delegate tasks to the most appropriate sub-agent.
    sub_agents:
      - local_helper
      - myorg/agent:tag # pulled from registry automatically
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator that delegates to local and external sub-agents
    instruction: |
      Delegate tasks to the most appropriate sub-agent.
    sub_agents:
      - local_helper
      - myorg/agent:tag # pulled from registry automatically
@z

@x
  local_helper:
    model: openai/gpt-5
    description: A local helper agent for simple tasks
    instruction: You are a helpful assistant.
```
@y
  local_helper:
    model: openai/gpt-5
    description: A local helper agent for simple tasks
    instruction: You are a helpful assistant.
```
@z

@x
External sub-agents are automatically named after their last path segment (without the tag) — for example, `myorg/agent:tag` becomes `agent`. You can also give them an explicit name using the `name:reference` syntax:
@y
External sub-agents are automatically named after their last path segment (without the tag) — for example, `myorg/agent:tag` becomes `agent`. You can also give them an explicit name using the `name:reference` syntax:
@z

@x
```yaml
    sub_agents:
      - my_agent:myorg/agent:tag  # available as "my_agent"
      - reviewer:docker.io/myorg/review-agent:latest
```
@y
```yaml
    sub_agents:
      - my_agent:myorg/agent:tag  # available as "my_agent"
      - reviewer:docker.io/myorg/review-agent:latest
```
@z

@x
### Pin external sub-agents to a digest
@y
### Pin external sub-agents to a digest
@z

@x
External references use a tag by default: `myorg/agent` is shorthand for `myorg/agent:latest`. Tag references are re-resolved against the registry on **every** `docker agent run`: each unpinned external sub-agent triggers a digest lookup at startup, even when that sub-agent is never invoked in the session. On a healthy connection this typically adds a second or two per reference (it depends on your network and registry), and it is one of the paths that can stall if the registry or credential helper misbehaves.
@y
External references use a tag by default: `myorg/agent` is shorthand for `myorg/agent:latest`. Tag references are re-resolved against the registry on **every** `docker agent run`: each unpinned external sub-agent triggers a digest lookup at startup, even when that sub-agent is never invoked in the session. On a healthy connection this typically adds a second or two per reference (it depends on your network and registry), and it is one of the paths that can stall if the registry or credential helper misbehaves.
@z

@x
Pinning a reference to an immutable digest (`@sha256:…`) makes the runtime serve it straight from the local cache with no network round-trip, so startup stays fast and your team is fully reproducible:
@y
Pinning a reference to an immutable digest (`@sha256:…`) makes the runtime serve it straight from the local cache with no network round-trip, so startup stays fast and your team is fully reproducible:
@z

@x
```yaml
    sub_agents:
      - reviewer:docker.io/myorg/review-agent@sha256:44117e73263afa5c861bdf3730dae7925918ffdd146827eee5bcff20bc55e8fa
```
@y
```yaml
    sub_agents:
      - reviewer:docker.io/myorg/review-agent@sha256:44117e73263afa5c861bdf3730dae7925918ffdd146827eee5bcff20bc55e8fa
```
@z

@x
Copy the digest from your registry (Docker Hub shows it next to the tag) or read it with a standard OCI tool such as `docker buildx imagetools inspect <reference>`. Docker Agent logs a startup warning for any external OCI reference that still uses a tag instead of a digest.
@y
Copy the digest from your registry (Docker Hub shows it next to the tag) or read it with a standard OCI tool such as `docker buildx imagetools inspect <reference>`. Docker Agent logs a startup warning for any external OCI reference that still uses a tag instead of a digest.
@z

@x
External references in `handoffs` and `force_handoff` carry the same per-run cost, so pin those to a digest too.
@y
External references in `handoffs` and `force_handoff` carry the same per-run cost, so pin those to a digest too.
@z

@x
> [!TIP]
> External sub-agents work with any OCI-compatible registry. See [Agent Distribution](../distribution/index.md) for more on registry references.
>
> See [`examples/sub-agents-from-registry.yaml`](https://github.com/docker/docker-agent/blob/main/examples/sub-agents-from-registry.yaml) for a complete example mixing local and external sub-agents.
@y
> [!TIP]
> External sub-agents work with any OCI-compatible registry. See [Agent Distribution](../distribution/index.md) for more on registry references.
>
> See [`examples/sub-agents-from-registry.yaml`](https://github.com/docker/docker-agent/blob/main/examples/sub-agents-from-registry.yaml) for a complete example mixing local and external sub-agents.
@z

@x
## Harness-Backed Sub-Agents
@y
## Harness-Backed Sub-Agents
@z

@x
Sub-agents can be backed by external coding CLIs — Claude Code, Codex, opencode, or pi — instead of a model API. Add a `harness:` block in place of a `model:` field to create a harness sub-agent:
@y
Sub-agents can be backed by external coding CLIs — Claude Code, Codex, opencode, or pi — instead of a model API. Add a `harness:` block in place of a `model:` field to create a harness sub-agent:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Orchestrator that plans and delegates
    instruction: |
      Break down coding tasks and delegate to the coding agents.
    sub_agents:
      - claude-coder
      - codex-coder
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Orchestrator that plans and delegates
    instruction: |
      Break down coding tasks and delegate to the coding agents.
    sub_agents:
      - claude-coder
      - codex-coder
@z

@x
  claude-coder:
    description: Claude Code specialist
    harness:
      type: claude-code
      effort: high
@y
  claude-coder:
    description: Claude Code specialist
    harness:
      type: claude-code
      effort: high
@z

@x
  codex-coder:
    description: Codex specialist
    harness:
      type: codex
```
@y
  codex-coder:
    description: Codex specialist
    harness:
      type: codex
```
@z

@x
The orchestrator uses `transfer_task` to send work to a harness sub-agent just like any other sub-agent. Docker Agent handles the orchestration and hooks; the external CLI drives the coding loop.
@y
The orchestrator uses `transfer_task` to send work to a harness sub-agent just like any other sub-agent. Docker Agent handles the orchestration and hooks; the external CLI drives the coding loop.
@z

@x
> [!TIP]
> **Learn more**
>
> See [Coding Harnesses](../../features/harnesses/index.md) for the full field reference, parallel dispatch patterns, and what does not work inside harness agents.
@y
> [!TIP]
> **Learn more**
>
> See [Coding Harnesses](../../features/harnesses/index.md) for the full field reference, parallel dispatch patterns, and what does not work inside harness agents.
@z

@x
## Example: Development Team
@y
## Example: Development Team
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Technical lead coordinating development
    instruction: |
      You are a technical lead managing a development team.
      Analyze requests and delegate to the right specialist.
      Ensure quality by reviewing results before responding.
    sub_agents: [developer, reviewer, tester]
    toolsets:
      - type: think
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Technical lead coordinating development
    instruction: |
      You are a technical lead managing a development team.
      Analyze requests and delegate to the right specialist.
      Ensure quality by reviewing results before responding.
    sub_agents: [developer, reviewer, tester]
    toolsets:
      - type: think
@z

@x
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: |
      You are an expert developer. Write clean, efficient code
      and follow best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
@y
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: |
      You are an expert developer. Write clean, efficient code
      and follow best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
@z

@x
  reviewer:
    model: openai/gpt-5
    description: Code review specialist
    instruction: |
      You review code for quality, security, and maintainability.
      Provide actionable feedback.
    toolsets:
      - type: filesystem
@y
  reviewer:
    model: openai/gpt-5
    description: Code review specialist
    instruction: |
      You review code for quality, security, and maintainability.
      Provide actionable feedback.
    toolsets:
      - type: filesystem
@z

@x
  tester:
    model: openai/gpt-5
    description: Quality assurance engineer
    instruction: |
      You write tests and ensure software quality. Run tests
      and report results.
    toolsets:
      - type: shell
      - type: todo
```
@y
  tester:
    model: openai/gpt-5
    description: Quality assurance engineer
    instruction: |
      You write tests and ensure software quality. Run tests
      and report results.
    toolsets:
      - type: shell
      - type: todo
```
@z

@x
## Example: Research Team
@y
## Example: Research Team
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research coordinator
    instruction: |
      Coordinate research tasks. Delegate web searches to
      the researcher and writing to the writer.
    sub_agents: [researcher, writer]
    toolsets:
      - type: think
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Research coordinator
    instruction: |
      Coordinate research tasks. Delegate web searches to
      the researcher and writing to the writer.
    sub_agents: [researcher, writer]
    toolsets:
      - type: think
@z

@x
  researcher:
    model: openai/gpt-5
    description: Web researcher
    instruction: Search the web and gather information.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: memory
        path: ./research.db
@y
  researcher:
    model: openai/gpt-5
    description: Web researcher
    instruction: Search the web and gather information.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: memory
        path: ./research.db
@z

@x
  writer:
    model: anthropic/claude-sonnet-4-5
    description: Content writer
    instruction: Write clear, well-structured content.
    toolsets:
      - type: filesystem
```
@y
  writer:
    model: anthropic/claude-sonnet-4-5
    description: Content writer
    instruction: Write clear, well-structured content.
    toolsets:
      - type: filesystem
```
@z

@x
## Multi-Model Teams
@y
## Multi-Model Teams
@z

@x
A key advantage of multi-agent systems is using different models for different roles — picking the best model for each job:
@y
A key advantage of multi-agent systems is using different models for different roles — picking the best model for each job:
@z

@x
```yaml
models:
  fast:
    provider: openai
    model: gpt-5-mini
    temperature: 0.2 # precise
@y
```yaml
models:
  fast:
    provider: openai
    model: gpt-5-mini
    temperature: 0.2 # precise
@z

@x
  creative:
    provider: openai
    model: gpt-5
    temperature: 0.8 # creative
@y
  creative:
    provider: openai
    model: gpt-5
    temperature: 0.8 # creative
@z

@x
  local:
    provider: dmr
    model: ai/qwen3 # runs locally, no API cost
@y
  local:
    provider: dmr
    model: ai/qwen3 # runs locally, no API cost
@z

@x
agents:
  analyst:
    model: fast # cheap and fast for analysis
  writer:
    model: creative # creative for content
  helper:
    model: local # free for simple tasks
```
@y
agents:
  analyst:
    model: fast # cheap and fast for analysis
  writer:
    model: creative # creative for content
  helper:
    model: local # free for simple tasks
```
@z

@x
## Shared Tools
@y
## Shared Tools
@z

@x
Tools like `todo` can be shared between agents for collaborative task tracking:
@y
Tools like `todo` can be shared between agents for collaborative task tracking:
@z

@x
```yaml
toolsets:
  - type: todo
    shared: true # all agents see the same todo list
```
@y
```yaml
toolsets:
  - type: todo
    shared: true # all agents see the same todo list
```
@z

@x
## Best Practices
@y
## Best Practices
@z

@x
- **Keep agents focused** — Each agent should have a clear, narrow role
- **Write clear descriptions** — The coordinator uses descriptions to decide who to delegate to
- **Give minimal tools** — Only give each agent the tools it needs for its specific role
- **Use the think tool when needed** — For models without native reasoning, give coordinators the think tool so they reason about delegation. Models with built-in thinking (e.g., via `thinking_budget`) don't need it
- **Use the right model** — Use capable models for complex reasoning, cheap models for simple tasks
- **Choose the right pattern** — Use `sub_agents` for hierarchical task delegation, `handoffs` for pipeline workflows and conversational routing
@y
- **Keep agents focused** — Each agent should have a clear, narrow role
- **Write clear descriptions** — The coordinator uses descriptions to decide who to delegate to
- **Give minimal tools** — Only give each agent the tools it needs for its specific role
- **Use the think tool when needed** — For models without native reasoning, give coordinators the think tool so they reason about delegation. Models with built-in thinking (e.g., via `thinking_budget`) don't need it
- **Use the right model** — Use capable models for complex reasoning, cheap models for simple tasks
- **Choose the right pattern** — Use `sub_agents` for hierarchical task delegation, `handoffs` for pipeline workflows and conversational routing
@z

@x
> [!NOTE]
> **Beyond Docker Agent**
>
> For interoperability with other agent frameworks, Docker Agent supports the [A2A protocol](../../features/a2a/index.md) and can expose agents via [MCP Mode](../../features/mcp-mode/index.md).
@y
> [!NOTE]
> **Beyond Docker Agent**
>
> For interoperability with other agent frameworks, Docker Agent supports the [A2A protocol](../../features/a2a/index.md) and can expose agents via [MCP Mode](../../features/mcp-mode/index.md).
@z
