%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Tips & Best Practices"
description: "Expert guidance for building effective, efficient, and secure agents."
keywords: docker agent, ai agents, guides, tips & best practices
@y
title: "Tips & Best Practices"
description: "Expert guidance for building effective, efficient, and secure agents."
keywords: docker agent, ai agents, guides, tips & best practices
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/guides/tips/
@y
canonical: __SUBDIR__/ai/docker-agent/guides/tips/
@z

@x
_Expert guidance for building effective, efficient, and secure agents._
@y
_Expert guidance for building effective, efficient, and secure agents._
@z

@x
## Configuration Tips
@y
## Configuration Tips
@z

@x
### Auto Mode for Quick Start
@y
### Auto Mode for Quick Start
@z

@x
Don't have a config file? Docker Agent can automatically detect your available API keys and use an appropriate model:
@y
Don't have a config file? Docker Agent can automatically detect your available API keys and use an appropriate model:
@z

@x
```bash
# Automatically uses the best available provider
$ docker agent run
@y
```bash
# Automatically uses the best available provider
$ docker agent run
@z

@x
# Provider priority: Anthropic → OpenAI → Google → Mistral → Amazon Bedrock → DMR
```
@y
# Provider priority: Anthropic → OpenAI → Google → Mistral → Amazon Bedrock → DMR
```
@z

@x
The special `auto` model value also works in configs:
@y
The special `auto` model value also works in configs:
@z

@x
```yaml
agents:
  root:
    model: auto # Uses best available provider
    description: Adaptive assistant
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: auto # Uses best available provider
    description: Adaptive assistant
    instruction: You are a helpful assistant.
```
@z

@x
### Environment Variable Interpolation
@y
### Environment Variable Interpolation
@z

@x
Commands support JavaScript template literal syntax for environment variables:
@y
Commands support JavaScript template literal syntax for environment variables:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Deployment assistant
    instruction: You help with deployments.
    commands:
      # Simple variable
      greet: "Hello ${env.USER}!"
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Deployment assistant
    instruction: You help with deployments.
    commands:
      # Simple variable
      greet: "Hello ${env.USER}!"
@z

@x
      # With default value
      deploy: "Deploy to ${env.ENV || 'staging'}"
@y
      # With default value
      deploy: "Deploy to ${env.ENV || 'staging'}"
@z

@x
      # Multiple variables
      release: "Release ${env.PROJECT} v${env.VERSION || '1.0.0'}"
```
@y
      # Multiple variables
      release: "Release ${env.PROJECT} v${env.VERSION || '1.0.0'}"
```
@z

@x
### Model Aliases Are Auto-Pinned
@y
### Model Aliases Are Auto-Pinned
@z

@x
Docker Agent automatically resolves model aliases to their latest pinned versions. This ensures reproducible behavior:
@y
Docker Agent automatically resolves model aliases to their latest pinned versions. This ensures reproducible behavior:
@z

@x
```yaml
# You write:
model: anthropic/claude-sonnet-4-5
@y
```yaml
# You write:
model: anthropic/claude-sonnet-4-5
@z

@x
# docker-agent resolves to:
# anthropic/claude-sonnet-4-5-20250929 (or latest available)
```
@y
# docker-agent resolves to:
# anthropic/claude-sonnet-4-5-20250929 (or latest available)
```
@z

@x
To use a specific version, specify it explicitly in your config.
@y
To use a specific version, specify it explicitly in your config.
@z

@x
## Performance Tips
@y
## Performance Tips
@z

@x
### Defer Tools for Faster Startup
@y
### Defer Tools for Faster Startup
@z

@x
Large MCP toolsets can slow down agent startup. Use `defer` to load tools on-demand:
@y
Large MCP toolsets can slow down agent startup. Use `defer` to load tools on-demand:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Multi-tool assistant
    instruction: You have many tools available.
    toolsets:
      - type: mcp
        ref: docker:github-official
        defer: true
      - type: mcp
        ref: docker:slack
        defer: true
      - type: mcp
        ref: docker:linear
        defer: true
```
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Multi-tool assistant
    instruction: You have many tools available.
    toolsets:
      - type: mcp
        ref: docker:github-official
        defer: true
      - type: mcp
        ref: docker:slack
        defer: true
      - type: mcp
        ref: docker:linear
        defer: true
```
@z

@x
Or defer specific tools within a toolset:
@y
Or defer specific tools within a toolset:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    defer:
      - "list_issues"
      - "search_repos"
  - type: mcp
    ref: docker:slack
    defer:
      - "list_channels"
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    defer:
      - "list_issues"
      - "search_repos"
  - type: mcp
    ref: docker:slack
    defer:
      - "list_channels"
```
@z

@x
### Filter MCP Tools
@y
### Filter MCP Tools
@z

@x
Many MCP servers expose dozens of tools. Filter to only what you need:
@y
Many MCP servers expose dozens of tools. Filter to only what you need:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    # Only expose these specific tools
    tools:
      - list_issues
      - create_issue
      - get_pull_request
      - create_pull_request
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    # Only expose these specific tools
    tools:
      - list_issues
      - create_issue
      - get_pull_request
      - create_pull_request
```
@z

@x
Fewer tools means faster tool selection and less confusion for the model.
@y
Fewer tools means faster tool selection and less confusion for the model.
@z

@x
### Set max_iterations
@y
### Set max_iterations
@z

@x
Always set `max_iterations` for agents with powerful tools to prevent infinite loops:
@y
Always set `max_iterations` for agents with powerful tools to prevent infinite loops:
@z

@x
```yaml
agents:
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Development assistant
    instruction: You are a developer.
    max_iterations: 30 # Reasonable limit for development tasks
    toolsets:
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Development assistant
    instruction: You are a developer.
    max_iterations: 30 # Reasonable limit for development tasks
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
Typical values: 20-30 for development agents, 10-15 for simple tasks.
@y
Typical values: 20-30 for development agents, 10-15 for simple tasks.
@z

@x
## Reliability Tips
@y
## Reliability Tips
@z

@x
### Use Fallback Models
@y
### Use Fallback Models
@z

@x
Configure fallback models for resilience against provider outages or rate limits:
@y
Configure fallback models for resilience against provider outages or rate limits:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Reliable assistant
    instruction: You are a helpful assistant.
    fallback:
      models:
        # Different provider for resilience
        - openai/gpt-4o
        # Cheaper model as last resort
        - openai/gpt-4o-mini
      retries: 2 # Retry 5xx errors twice
      cooldown: 1m # Stick with fallback for 1 min after rate limit
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Reliable assistant
    instruction: You are a helpful assistant.
    fallback:
      models:
        # Different provider for resilience
        - openai/gpt-4o
        # Cheaper model as last resort
        - openai/gpt-4o-mini
      retries: 2 # Retry 5xx errors twice
      cooldown: 1m # Stick with fallback for 1 min after rate limit
```
@z

@x
**Best practices for fallback chains:**
@y
**Best practices for fallback chains:**
@z

@x
- Use different providers for true redundancy
- Order by preference (best first)
- Include a cheaper/faster model as last resort
@y
- Use different providers for true redundancy
- Order by preference (best first)
- Include a cheaper/faster model as last resort
@z

@x
### Use Think Tool for Non-Reasoning Models
@y
### Use Think Tool for Non-Reasoning Models
@z

@x
The `think` tool provides a reasoning scratchpad for models that lack built-in thinking capabilities:
@y
The `think` tool provides a reasoning scratchpad for models that lack built-in thinking capabilities:
@z

@x
```yaml
toolsets:
  - type: think # Useful for models without native reasoning
```
@y
```yaml
toolsets:
  - type: think # Useful for models without native reasoning
```
@z

@x
The agent uses it as a scratchpad for planning and decision-making. If your model already supports a [thinking budget](../../configuration/models/index.md#thinking-budget) (e.g., Claude with extended thinking, OpenAI o-series, Gemini with thinking enabled), you don't need this tool — the model can reason internally.
@y
The agent uses it as a scratchpad for planning and decision-making. If your model already supports a [thinking budget](../../configuration/models/index.md#thinking-budget) (e.g., Claude with extended thinking, OpenAI o-series, Gemini with thinking enabled), you don't need this tool — the model can reason internally.
@z

@x
## Security Tips
@y
## Security Tips
@z

@x
### Use --yolo Mode Carefully
@y
### Use --yolo Mode Carefully
@z

@x
The `--yolo` flag auto-approves all tool calls without confirmation:
@y
The `--yolo` flag auto-approves all tool calls without confirmation:
@z

@x
```bash
# Auto-approve everything (use with caution!)
$ docker agent run agent.yaml --yolo
```
@y
```bash
# Auto-approve everything (use with caution!)
$ docker agent run agent.yaml --yolo
```
@z

@x
**When it's appropriate:**
@y
**When it's appropriate:**
@z

@x
- CI/CD pipelines with controlled inputs
- Automated testing
- Agents with only safe, read-only tools
@y
- CI/CD pipelines with controlled inputs
- Automated testing
- Agents with only safe, read-only tools
@z

@x
**When to avoid:**
@y
**When to avoid:**
@z

@x
- Interactive sessions with untested prompts
- Agents with shell or filesystem write access
- Any situation where unreviewed actions could cause harm
@y
- Interactive sessions with untested prompts
- Agents with shell or filesystem write access
- Any situation where unreviewed actions could cause harm
@z

@x
### Combine Permissions with Sandbox
@y
### Combine Permissions with Sandbox
@z

@x
For defense in depth, use both permissions and [sandbox mode](../../configuration/sandbox/index.md):
@y
For defense in depth, use both permissions and [sandbox mode](../../configuration/sandbox/index.md):
@z

@x
```yaml
agents:
  secure_dev:
    model: anthropic/claude-sonnet-4-5
    description: Secure development assistant
    instruction: You are a secure coding assistant.
    toolsets:
      - type: filesystem
      - type: shell
@y
```yaml
agents:
  secure_dev:
    model: anthropic/claude-sonnet-4-5
    description: Secure development assistant
    instruction: You are a secure coding assistant.
    toolsets:
      - type: filesystem
      - type: shell
@z

@x
permissions:
  allow:
    - "read_*"
    - "shell:cmd=go*"
    - "shell:cmd=npm*"
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*-rf*"
```
@y
permissions:
  allow:
    - "read_*"
    - "shell:cmd=go*"
    - "shell:cmd=npm*"
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*-rf*"
```
@z

@x
```bash
# Run with sandbox enabled
docker-agent run --sandbox agent.yaml
```
@y
```bash
# Run with sandbox enabled
docker-agent run --sandbox agent.yaml
```
@z

@x
### Set Global Permission Guardrails
@y
### Set Global Permission Guardrails
@z

@x
Use [global permissions](../../configuration/permissions/index.md#global-permissions) in your user config to enforce safety rules across every agent:
@y
Use [global permissions](../../configuration/permissions/index.md#global-permissions) in your user config to enforce safety rules across every agent:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  permissions:
    deny:
      - "shell:cmd=sudo*"
      - "shell:cmd=rm*-rf*"
      - "shell:cmd=git push --force*"
    allow:
      - "read_*"
      - "shell:cmd=ls*"
      - "shell:cmd=cat*"
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  permissions:
    deny:
      - "shell:cmd=sudo*"
      - "shell:cmd=rm*-rf*"
      - "shell:cmd=git push --force*"
    allow:
      - "read_*"
      - "shell:cmd=ls*"
      - "shell:cmd=cat*"
```
@z

@x
These rules merge with any agent-level permissions. Deny patterns from your global config cannot be overridden by agent configs, so you can trust that dangerous commands stay blocked regardless of which agent you run.
@y
These rules merge with any agent-level permissions. Deny patterns from your global config cannot be overridden by agent configs, so you can trust that dangerous commands stay blocked regardless of which agent you run.
@z

@x
### Use Hooks for Audit Logging
@y
### Use Hooks for Audit Logging
@z

@x
Log all tool calls for compliance or debugging:
@y
Log all tool calls for compliance or debugging:
@z

@x
```yaml
agents:
  audited:
    model: openai/gpt-4o
    description: Audited assistant
    instruction: You are a helpful assistant.
    hooks:
      post_tool_use:
        - matcher: "*"
          hooks:
            - type: command
              command: "./scripts/audit-log.sh"
```
@y
```yaml
agents:
  audited:
    model: openai/gpt-4o
    description: Audited assistant
    instruction: You are a helpful assistant.
    hooks:
      post_tool_use:
        - matcher: "*"
          hooks:
            - type: command
              command: "./scripts/audit-log.sh"
```
@z

@x
## Multi-Agent Tips
@y
## Multi-Agent Tips
@z

@x
### Handoffs vs Sub-Agents
@y
### Handoffs vs Sub-Agents
@z

@x
Understand the difference between `sub_agents` and `handoffs`:
@y
Understand the difference between `sub_agents` and `handoffs`:
@z

@x
- **`sub_agents` (transfer_task)** — delegates a task to a child in a sub-session, waits for the result, then continues. Hierarchical: the parent remains in control.
@y
- **`sub_agents` (transfer_task)** — delegates a task to a child in a sub-session, waits for the result, then continues. Hierarchical: the parent remains in control.
@z

@x
  ```yaml
  sub_agents: [researcher, writer]
  ```
@y
  ```yaml
  sub_agents: [researcher, writer]
  ```
@z

@x
- **`handoffs` (peer-to-peer)** — hands off the entire conversation to another agent in the same session. The active agent switches and sees the full history. Agents can form cycles.
@y
- **`handoffs` (peer-to-peer)** — hands off the entire conversation to another agent in the same session. The active agent switches and sees the full history. Agents can form cycles.
@z

@x
  ```yaml
  handoffs:
    - specialist
    - summarizer
  ```
@y
  ```yaml
  handoffs:
    - specialist
    - summarizer
  ```
@z

@x
See [Multi-Agent Systems](../../concepts/multi-agent/index.md) for a detailed comparison.
@y
See [Multi-Agent Systems](../../concepts/multi-agent/index.md) for a detailed comparison.
@z

@x
### Give Sub-Agents Clear Descriptions
@y
### Give Sub-Agents Clear Descriptions
@z

@x
The root agent uses descriptions to decide which sub-agent to delegate to:
@y
The root agent uses descriptions to decide which sub-agent to delegate to:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Technical lead
    instruction: Delegate to specialists based on the task.
    sub_agents: [frontend, backend, devops]
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Technical lead
    instruction: Delegate to specialists based on the task.
    sub_agents: [frontend, backend, devops]
@z

@x
  frontend:
    model: openai/gpt-4o
    # Good: specific and actionable
    description: |
      Frontend specialist. Handles React, TypeScript, CSS, 
      UI components, and browser-related issues.
@y
  frontend:
    model: openai/gpt-4o
    # Good: specific and actionable
    description: |
      Frontend specialist. Handles React, TypeScript, CSS, 
      UI components, and browser-related issues.
@z

@x
  backend:
    model: openai/gpt-4o
    # Good: clear domain boundaries
    description: |
      Backend specialist. Handles APIs, databases, 
      server logic, and Go/Python code.
@y
  backend:
    model: openai/gpt-4o
    # Good: clear domain boundaries
    description: |
      Backend specialist. Handles APIs, databases, 
      server logic, and Go/Python code.
@z

@x
  devops:
    model: openai/gpt-4o
    description: |
      DevOps specialist. Handles CI/CD, Docker, Kubernetes,
      infrastructure, and deployment pipelines.
```
@y
  devops:
    model: openai/gpt-4o
    description: |
      DevOps specialist. Handles CI/CD, Docker, Kubernetes,
      infrastructure, and deployment pipelines.
```
@z

@x
## Debugging Tips
@y
## Debugging Tips
@z

@x
### Enable Debug Logging
@y
### Enable Debug Logging
@z

@x
Use the `--debug` flag to see detailed execution logs:
@y
Use the `--debug` flag to see detailed execution logs:
@z

@x
```bash
# Default log location: ~/.cagent/cagent.debug.log
$ docker agent run agent.yaml --debug
@y
```bash
# Default log location: ~/.cagent/cagent.debug.log
$ docker agent run agent.yaml --debug
@z

@x
# Custom log location
$ docker agent run agent.yaml --debug --log-file ./debug.log
```
@y
# Custom log location
$ docker agent run agent.yaml --debug --log-file ./debug.log
```
@z

@x
### Check Token Usage
@y
### Check Token Usage
@z

@x
Use the `/cost` command during a session to see token consumption:
@y
Use the `/cost` command during a session to see token consumption:
@z

@x
```text
/cost
@y
```text
/cost
@z

@x
Token Usage:
  Input:  12,456 tokens
  Output:  3,789 tokens
  Total:  16,245 tokens
```
@y
Token Usage:
  Input:  12,456 tokens
  Output:  3,789 tokens
  Total:  16,245 tokens
```
@z

@x
### Compact Long Sessions
@y
### Compact Long Sessions
@z

@x
If a session gets too long, use `/compact` to summarize and reduce context:
@y
If a session gets too long, use `/compact` to summarize and reduce context:
@z

@x
```text
/compact
@y
```text
/compact
@z

@x
Session compacted. Summary generated and history trimmed.
```
@y
Session compacted. Summary generated and history trimmed.
```
@z

@x
## More Tips
@y
## More Tips
@z

@x
### User-Defined Default Model
@y
### User-Defined Default Model
@z

@x
Set your preferred default model in `~/.config/cagent/config.yaml`:
@y
Set your preferred default model in `~/.config/cagent/config.yaml`:
@z

@x
```yaml
settings:
  default_model: anthropic/claude-sonnet-4-5
```
@y
```yaml
settings:
  default_model: anthropic/claude-sonnet-4-5
```
@z

@x
This model is used by the built-in default agent when you run `docker agent run` without a config argument and no project-level `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` exists.
@y
This model is used by the built-in default agent when you run `docker agent run` without a config argument and no project-level `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` exists.
@z

@x
### Get Desktop Notifications with Hooks
@y
### Get Desktop Notifications with Hooks
@z

@x
Long-running agents shouldn't require staring at the terminal. Add [global hooks](../../configuration/hooks/index.md#global-user-level-hooks) to your user config so every agent notifies you when it needs attention or finishes:
@y
Long-running agents shouldn't require staring at the terminal. Add [global hooks](../../configuration/hooks/index.md#global-user-level-hooks) to your user config so every agent notifies you when it needs attention or finishes:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  hooks:
    # Agent is waiting for your input (question, approval prompt, ...)
    on_user_input:
      - type: command
        command: osascript -e 'display notification "Agent needs your input" with title "docker-agent"'
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  hooks:
    # Agent is waiting for your input (question, approval prompt, ...)
    on_user_input:
      - type: command
        command: osascript -e 'display notification "Agent needs your input" with title "docker-agent"'
@z

@x
    # Agent finished responding
    stop:
      - type: command
        command: osascript -e 'display notification "Task finished" with title "docker-agent"'
```
@y
    # Agent finished responding
    stop:
      - type: command
        command: osascript -e 'display notification "Task finished" with title "docker-agent"'
```
@z

@x
On Linux, replace `osascript` with `notify-send`:
@y
On Linux, replace `osascript` with `notify-send`:
@z

@x
```yaml
command: notify-send "docker-agent" "Agent needs your input"
```
@y
```yaml
command: notify-send "docker-agent" "Agent needs your input"
```
@z

@x
Hooks inherit Docker Agent's environment, so this works as-is from a desktop terminal. In detached contexts (SSH, tmux started outside your desktop session, containers), `notify-send` needs the session's `DISPLAY` and `DBUS_SESSION_BUS_ADDRESS` to reach the notification daemon, and fails silently without them. Pass them with the per-hook `env` option:
@y
Hooks inherit Docker Agent's environment, so this works as-is from a desktop terminal. In detached contexts (SSH, tmux started outside your desktop session, containers), `notify-send` needs the session's `DISPLAY` and `DBUS_SESSION_BUS_ADDRESS` to reach the notification daemon, and fails silently without them. Pass them with the per-hook `env` option:
@z

@x
```yaml
on_user_input:
  - type: command
    command: notify-send "docker-agent" "Agent needs your input"
    env:
      DISPLAY: ":0"
      DBUS_SESSION_BUS_ADDRESS: "unix:path=/run/user/1000/bus"
```
@y
```yaml
on_user_input:
  - type: command
    command: notify-send "docker-agent" "Agent needs your input"
    env:
      DISPLAY: ":0"
      DBUS_SESSION_BUS_ADDRESS: "unix:path=/run/user/1000/bus"
```
@z

@x
To also get alerted on errors and warnings, hook the `notification` event and read the message from the JSON payload on stdin:
@y
To also get alerted on errors and warnings, hook the `notification` event and read the message from the JSON payload on stdin:
@z

@x
```yaml
settings:
  hooks:
    notification:
      - type: command
        timeout: 10
        command: |
          MESSAGE=$(cat | jq -r '.notification_message // "Agent error"')
          osascript -e "display notification \"$MESSAGE\" with title \"docker-agent\""
```
@y
```yaml
settings:
  hooks:
    notification:
      - type: command
        timeout: 10
        command: |
          MESSAGE=$(cat | jq -r '.notification_message // "Agent error"')
          osascript -e "display notification \"$MESSAGE\" with title \"docker-agent\""
```
@z

@x
If a sound is enough, set `settings: { sound: true }` instead — Docker Agent plays a failure sound when a task errors, and a success sound when a task that ran longer than `sound_threshold` seconds (default 10) completes.
@y
If a sound is enough, set `settings: { sound: true }` instead — Docker Agent plays a failure sound when a task errors, and a success sound when a task that ran longer than `sound_threshold` seconds (default 10) completes.
@z

@x
See the [Hooks documentation](../../configuration/hooks/index.md) for the full list of events, their payloads, and per-hook options (`env`, `working_dir`, `timeout`).
@y
See the [Hooks documentation](../../configuration/hooks/index.md) for the full list of events, their payloads, and per-hook options (`env`, `working_dir`, `timeout`).
@z

@x
### GitHub PR Reviewer Example
@y
### GitHub PR Reviewer Example
@z

@x
Use Docker Agent as a GitHub Actions PR reviewer:
@y
Use Docker Agent as a GitHub Actions PR reviewer:
@z

@x
```yaml
# .github/workflows/pr-review.yml
name: PR Review
on:
  pull_request:
    types: [opened, synchronize]
@y
```yaml
# .github/workflows/pr-review.yml
name: PR Review
on:
  pull_request:
    types: [opened, synchronize]
@z

@x
jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run docker-agent review
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          # Install docker-agent
          curl -fsSL https://get.docker-agent.dev | sh
@y
jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run docker-agent review
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          # Install docker-agent
          curl -fsSL https://get.docker-agent.dev | sh
@z

@x
          # Run the review
          docker agent run --exec reviewer.yaml --yolo \
            "Review PR #${{ github.event.pull_request.number }}"
```
@y
          # Run the review
          docker agent run --exec reviewer.yaml --yolo \
            "Review PR #${{ github.event.pull_request.number }}"
```
@z

@x
With a simple reviewer agent:
@y
With a simple reviewer agent:
@z

@x
```yaml
# reviewer.yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: PR reviewer
    instruction: |
      Review pull requests for code quality, bugs, and security issues.
      Be constructive and specific in your feedback.
    toolsets:
      - type: mcp
        ref: docker:github-official
      - type: think
```
@y
```yaml
# reviewer.yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: PR reviewer
    instruction: |
      Review pull requests for code quality, bugs, and security issues.
      Be constructive and specific in your feedback.
    toolsets:
      - type: mcp
        ref: docker:github-official
      - type: think
```
@z
