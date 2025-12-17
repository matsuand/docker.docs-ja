%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Building a coding agent
description: Create a coding agent that can read, write, and validate code changes in your projects
keywords: [cagent, tutorial, coding agent, ai assistant]
@y
title: Building a coding agent
description: Create a coding agent that can read, write, and validate code changes in your projects
keywords: [cagent, tutorial, coding agent, ai assistant]
@z

@x
This tutorial teaches you how to build a coding agent that can help with
software development tasks. You'll start with a basic agent and progressively
add capabilities until you have a production-ready assistant that can read code,
make changes, run tests, and even look up documentation.
@y
This tutorial teaches you how to build a coding agent that can help with
software development tasks. You'll start with a basic agent and progressively
add capabilities until you have a production-ready assistant that can read code,
make changes, run tests, and even look up documentation.
@z

@x
By the end, you'll understand how to structure agent instructions, configure
tools, and compose multiple agents for complex workflows.
@y
By the end, you'll understand how to structure agent instructions, configure
tools, and compose multiple agents for complex workflows.
@z

@x
## What you'll build
@y
## What you'll build
@z

@x
A coding agent that can:
@y
A coding agent that can:
@z

@x
- Read and modify files in your project
- Run commands like tests and linters
- Follow a structured development workflow
- Look up documentation when needed
- Track progress through multi-step tasks
@y
- Read and modify files in your project
- Run commands like tests and linters
- Follow a structured development workflow
- Look up documentation when needed
- Track progress through multi-step tasks
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- How to configure cagent agents in YAML
- How to give agents access to tools (filesystem, shell, etc.)
- How to write effective agent instructions
- How to compose multiple agents for specialized tasks
- How to adapt agents for your own projects
@y
- How to configure cagent agents in YAML
- How to give agents access to tools (filesystem, shell, etc.)
- How to write effective agent instructions
- How to compose multiple agents for specialized tasks
- How to adapt agents for your own projects
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before starting, you need:
@y
Before starting, you need:
@z

@x
- **cagent installed** - See the [installation guide](_index.md#installation)
- **API key configured** - Set `ANTHROPIC_API_KEY` or `OPENAI_API_KEY` in your
  environment. Get keys from [Anthropic](https://console.anthropic.com/) or
  [OpenAI](https://platform.openai.com/api-keys)
- **A project to work with** - Any codebase where you want agent assistance
@y
- **cagent installed** - See the [installation guide](_index.md#installation)
- **API key configured** - Set `ANTHROPIC_API_KEY` or `OPENAI_API_KEY` in your
  environment. Get keys from [Anthropic](https://console.anthropic.com/) or
  [OpenAI](https://platform.openai.com/api-keys)
- **A project to work with** - Any codebase where you want agent assistance
@z

@x
## Creating your first agent
@y
## Creating your first agent
@z

@x
A cagent agent is defined in a YAML configuration file. The minimal agent needs
just a model and instructions that define its purpose.
@y
A cagent agent is defined in a YAML configuration file. The minimal agent needs
just a model and instructions that define its purpose.
@z

@x
Create a file named `agents.yml`:
@y
Create a file named `agents.yml`:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A basic coding assistant
    instruction: |
      You are a helpful coding assistant.
      Help me write and understand code.
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A basic coding assistant
    instruction: |
      You are a helpful coding assistant.
      Help me write and understand code.
```
@z

@x
Run your agent:
@y
Run your agent:
@z

@x
```console
$ cagent run agents.yml
```
@y
```console
$ cagent run agents.yml
```
@z

@x
Try asking it: "How do I read a file in Python?"
@y
Try asking it: "How do I read a file in Python?"
@z

@x
The agent can answer coding questions, but it can't see your files or run
commands yet. To make it useful for real development work, it needs access to
tools.
@y
The agent can answer coding questions, but it can't see your files or run
commands yet. To make it useful for real development work, it needs access to
tools.
@z

@x
## Adding tools
@y
## Adding tools
@z

@x
A coding agent needs to interact with your project files and run commands. You
enable these capabilities by adding toolsets.
@y
A coding agent needs to interact with your project files and run commands. You
enable these capabilities by adding toolsets.
@z

@x
Update `agents.yml` to add filesystem and shell access:
@y
Update `agents.yml` to add filesystem and shell access:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A coding assistant with filesystem access
    instruction: |
      You are a helpful coding assistant.
      You can read and write files to help me develop software.
      Always check if code works before finishing a task.
    toolsets:
      - type: filesystem
      - type: shell
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A coding assistant with filesystem access
    instruction: |
      You are a helpful coding assistant.
      You can read and write files to help me develop software.
      Always check if code works before finishing a task.
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
Run the updated agent and try: "Read the README.md file and summarize it."
@y
Run the updated agent and try: "Read the README.md file and summarize it."
@z

@x
Your agent can now:
@y
Your agent can now:
@z

@x
- Read and write files in the current directory
- Execute shell commands
- Explore your project structure
@y
- Read and write files in the current directory
- Execute shell commands
- Explore your project structure
@z

@x
> [!NOTE] By default, filesystem access is restricted to the current working
> directory. The agent will request permission if it needs to access other
> directories.
@y
> [!NOTE] By default, filesystem access is restricted to the current working
> directory. The agent will request permission if it needs to access other
> directories.
@z

@x
The agent can now interact with your code, but its behavior is still generic.
Next, you'll teach it how to work effectively.
@y
The agent can now interact with your code, but its behavior is still generic.
Next, you'll teach it how to work effectively.
@z

@x
## Structuring agent instructions
@y
## Structuring agent instructions
@z

@x
Generic instructions produce generic results. For production use, you want your
agent to follow a specific workflow and understand your project's conventions.
@y
Generic instructions produce generic results. For production use, you want your
agent to follow a specific workflow and understand your project's conventions.
@z

@x
Update your agent with structured instructions. This example shows a Go
development agent, but you can adapt the pattern for any language:
@y
Update your agent with structured instructions. This example shows a Go
development agent, but you can adapt the pattern for any language:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert Go developer
    instruction: |
      Your goal is to help with code-related tasks by examining, modifying,
      and validating code changes.
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert Go developer
    instruction: |
      Your goal is to help with code-related tasks by examining, modifying,
      and validating code changes.
@z

@x
      <TASK>
          # Workflow:
          # 1. Analyze: Understand requirements and identify relevant code.
          # 2. Examine: Search for files, analyze structure and dependencies.
          # 3. Modify: Make changes following best practices.
          # 4. Validate: Run linters/tests. If issues found, return to Modify.
      </TASK>
@y
      <TASK>
          # Workflow:
          # 1. Analyze: Understand requirements and identify relevant code.
          # 2. Examine: Search for files, analyze structure and dependencies.
          # 3. Modify: Make changes following best practices.
          # 4. Validate: Run linters/tests. If issues found, return to Modify.
      </TASK>
@z

@x
      Constraints:
      - Be thorough in examination before making changes
      - Always validate changes before considering the task complete
      - Write code to files, don't show it in chat
@y
      Constraints:
      - Be thorough in examination before making changes
      - Always validate changes before considering the task complete
      - Write code to files, don't show it in chat
@z

@x
      ## Development Workflow
      - `go build ./...` - Build the application
      - `go test ./...` - Run tests
      - `golangci-lint run` - Check code quality
@y
      ## Development Workflow
      - `go build ./...` - Build the application
      - `go test ./...` - Run tests
      - `golangci-lint run` - Check code quality
@z

@x
    add_date: true
    add_environment_info: true
    toolsets:
      - type: filesystem
      - type: shell
      - type: todo
```
@y
    add_date: true
    add_environment_info: true
    toolsets:
      - type: filesystem
      - type: shell
      - type: todo
```
@z

@x
Try asking: "Add error handling to the `parseConfig` function in main.go"
@y
Try asking: "Add error handling to the `parseConfig` function in main.go"
@z

@x
The structured instructions give your agent:
@y
The structured instructions give your agent:
@z

@x
- A clear workflow to follow (analyze, examine, modify, validate)
- Project-specific commands to run
- Constraints that prevent common mistakes
- Context about the environment (`add_date` and `add_environment_info`)
@y
- A clear workflow to follow (analyze, examine, modify, validate)
- Project-specific commands to run
- Constraints that prevent common mistakes
- Context about the environment (`add_date` and `add_environment_info`)
@z

@x
The `todo` toolset helps the agent track progress through multi-step tasks. When
you ask for complex changes, the agent will break down the work and update its
progress as it goes.
@y
The `todo` toolset helps the agent track progress through multi-step tasks. When
you ask for complex changes, the agent will break down the work and update its
progress as it goes.
@z

@x
## Composing multiple agents
@y
## Composing multiple agents
@z

@x
Complex tasks often benefit from specialized agents. You can add sub-agents that
handle specific responsibilities, like researching documentation while your main
agent stays focused on coding.
@y
Complex tasks often benefit from specialized agents. You can add sub-agents that
handle specific responsibilities, like researching documentation while your main
agent stays focused on coding.
@z

@x
Add a librarian agent that can search for documentation:
@y
Add a librarian agent that can search for documentation:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert Go developer
    instruction: |
      Your goal is to help with code-related tasks by examining, modifying,
      and validating code changes.
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert Go developer
    instruction: |
      Your goal is to help with code-related tasks by examining, modifying,
      and validating code changes.
@z

@x
      When you need to look up documentation or research how something works,
      ask the librarian agent.
@y
      When you need to look up documentation or research how something works,
      ask the librarian agent.
@z

@x
      (rest of instructions from previous section...)
    toolsets:
      - type: filesystem
      - type: shell
      - type: todo
    sub_agents:
      - librarian
@y
      (rest of instructions from previous section...)
    toolsets:
      - type: filesystem
      - type: shell
      - type: todo
    sub_agents:
      - librarian
@z

@x
  librarian:
    model: anthropic/claude-haiku-4-5
    description: Documentation researcher
    instruction: |
      You are the librarian. Your job is to find relevant documentation,
      articles, or resources to help the developer agent.
@y
  librarian:
    model: anthropic/claude-haiku-4-5
    description: Documentation researcher
    instruction: |
      You are the librarian. Your job is to find relevant documentation,
      articles, or resources to help the developer agent.
@z

@x
      Search the internet and fetch web pages as needed.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: fetch
```
@y
      Search the internet and fetch web pages as needed.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: fetch
```
@z

@x
Try asking: "How do I use `context.Context` in Go? Then add it to my server
code."
@y
Try asking: "How do I use `context.Context` in Go? Then add it to my server
code."
@z

@x
Your main agent will delegate the research to the librarian, then use that
information to modify your code. This keeps the main agent's context focused on
the coding task while still having access to up-to-date documentation.
@y
Your main agent will delegate the research to the librarian, then use that
information to modify your code. This keeps the main agent's context focused on
the coding task while still having access to up-to-date documentation.
@z

@x
Using a smaller, faster model (Haiku) for the librarian saves costs since
documentation lookup doesn't need the same reasoning depth as code changes.
@y
Using a smaller, faster model (Haiku) for the librarian saves costs since
documentation lookup doesn't need the same reasoning depth as code changes.
@z

@x
## Adapting for your project
@y
## Adapting for your project
@z

@x
Now that you understand the core concepts, adapt the agent for your specific
project:
@y
Now that you understand the core concepts, adapt the agent for your specific
project:
@z

@x
### Update the development commands
@y
### Update the development commands
@z

@x
Replace the Go commands with your project's workflow:
@y
Replace the Go commands with your project's workflow:
@z

@x
```yaml
## Development Workflow
- `npm test` - Run tests
- `npm run lint` - Check code quality
- `npm run build` - Build the application
```
@y
```yaml
## Development Workflow
- `npm test` - Run tests
- `npm run lint` - Check code quality
- `npm run build` - Build the application
```
@z

@x
### Add project-specific constraints
@y
### Add project-specific constraints
@z

@x
If your agent keeps making the same mistakes, add explicit constraints:
@y
If your agent keeps making the same mistakes, add explicit constraints:
@z

@x
```yaml
Constraints:
  - Always run tests before considering a task complete
  - Follow the existing code style in src/ directories
  - Never modify files in the generated/ directory
  - Use TypeScript strict mode for new files
```
@y
```yaml
Constraints:
  - Always run tests before considering a task complete
  - Follow the existing code style in src/ directories
  - Never modify files in the generated/ directory
  - Use TypeScript strict mode for new files
```
@z

@x
### Choose the right models
@y
### Choose the right models
@z

@x
For coding tasks, use reasoning-focused models:
@y
For coding tasks, use reasoning-focused models:
@z

@x
- `anthropic/claude-sonnet-4-5` - Strong reasoning, good for complex code
- `openai/gpt-5` - Fast, good general coding ability
@y
- `anthropic/claude-sonnet-4-5` - Strong reasoning, good for complex code
- `openai/gpt-5` - Fast, good general coding ability
@z

@x
For auxiliary tasks like documentation lookup, smaller models work well:
@y
For auxiliary tasks like documentation lookup, smaller models work well:
@z

@x
- `anthropic/claude-haiku-4-5` - Fast and cost-effective
- `openai/gpt-5-mini` - Good for simple tasks
@y
- `anthropic/claude-haiku-4-5` - Fast and cost-effective
- `openai/gpt-5-mini` - Good for simple tasks
@z

@x
### Iterate based on usage
@y
### Iterate based on usage
@z

@x
The best way to improve your agent is to use it. When you notice issues:
@y
The best way to improve your agent is to use it. When you notice issues:
@z

@x
1. Add specific instructions to prevent the problem
2. Update constraints to guide behavior
3. Add relevant commands to the development workflow
4. Consider adding specialized sub-agents for complex areas
@y
1. Add specific instructions to prevent the problem
2. Update constraints to guide behavior
3. Add relevant commands to the development workflow
4. Consider adding specialized sub-agents for complex areas
@z

@x
## What you learned
@y
## What you learned
@z

@x
You now know how to:
@y
You now know how to:
@z

@x
- Create a basic cagent configuration
- Add tools to enable agent capabilities
- Write structured instructions for consistent behavior
- Compose multiple agents for specialized tasks
- Adapt agents for different programming languages and workflows
@y
- Create a basic cagent configuration
- Add tools to enable agent capabilities
- Write structured instructions for consistent behavior
- Compose multiple agents for specialized tasks
- Adapt agents for different programming languages and workflows
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Learn [best practices](best-practices.md) for handling large outputs,
  structuring agent teams, and optimizing performance
- Integrate cagent with your [editor](integrations/acp.md) or use agents as
  [tools in MCP clients](integrations/mcp.md)
- Review the [Configuration reference](reference/config.md) for all available
  options
- Explore the [Tools reference](reference/toolsets.md) to see what capabilities
  you can enable
- Check out [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  different use cases
- See the full
  [golang_developer.yaml](https://github.com/docker/cagent/blob/main/golang_developer.yaml)
  that the Docker team uses to develop cagent
@y
- Learn [best practices](best-practices.md) for handling large outputs,
  structuring agent teams, and optimizing performance
- Integrate cagent with your [editor](integrations/acp.md) or use agents as
  [tools in MCP clients](integrations/mcp.md)
- Review the [Configuration reference](reference/config.md) for all available
  options
- Explore the [Tools reference](reference/toolsets.md) to see what capabilities
  you can enable
- Check out [example
  configurations](https://github.com/docker/cagent/tree/main/examples) for
  different use cases
- See the full
  [golang_developer.yaml](https://github.com/docker/cagent/blob/main/golang_developer.yaml)
  that the Docker team uses to develop cagent
@z
