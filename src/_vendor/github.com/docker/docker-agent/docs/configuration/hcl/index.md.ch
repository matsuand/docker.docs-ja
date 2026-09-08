%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "HCL Configuration"
description: "Write Docker Agent configs in HCL instead of YAML, using labeled blocks, heredocs, and the same underlying schema."
keywords: docker agent, ai agents, configuration, yaml, hcl configuration
@y
title: "HCL Configuration"
description: "Write Docker Agent configs in HCL instead of YAML, using labeled blocks, heredocs, and the same underlying schema."
keywords: docker agent, ai agents, configuration, yaml, hcl configuration
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/hcl/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/hcl/
@z

@x
_Write Docker Agent configs in HCL instead of YAML. It maps to the same Docker Agent schema and validation rules._
@y
_Write Docker Agent configs in HCL instead of YAML. It maps to the same Docker Agent schema and validation rules._
@z

@x
`docker-agent` supports `.hcl` config files anywhere it supports `.yaml` or `.yml` files. HCL is useful if you prefer labeled blocks, less punctuation, and heredocs for long prompts.
@y
`docker-agent` supports `.hcl` config files anywhere it supports `.yaml` or `.yml` files. HCL is useful if you prefer labeled blocks, less punctuation, and heredocs for long prompts.
@z

@x
> [!TIP]
> **Same config model, different syntax**
>
> YAML and HCL are just two syntaxes for the same Docker Agent configuration model. Docker Agent converts HCL to the equivalent YAML structure internally, then runs the normal schema validation and loading pipeline.
@y
> [!TIP]
> **Same config model, different syntax**
>
> YAML and HCL are just two syntaxes for the same Docker Agent configuration model. Docker Agent converts HCL to the equivalent YAML structure internally, then runs the normal schema validation and loading pipeline.
@z

@x
## Minimal Example
@y
## Minimal Example
@z

@x
```hcl
#!/usr/bin/env docker agent run
@y
```hcl
#!/usr/bin/env docker agent run
@z

@x
agent "root" {
  model       = "openai/gpt-5"
  description = "A helpful assistant"
  instruction = <<-EOT
  You are a helpful assistant.
  EOT
@y
agent "root" {
  model       = "openai/gpt-5"
  description = "A helpful assistant"
  instruction = <<-EOT
  You are a helpful assistant.
  EOT
@z

@x
  toolset "think" {}
}
```
@y
  toolset "think" {}
}
```
@z

@x
Run it exactly like a YAML config:
@y
Run it exactly like a YAML config:
@z

@x
```bash
$ docker agent run agent.hcl
$ docker agent run --exec agent.hcl "Summarize this repository"
$ docker agent serve api ./agents/   # directories may mix .yaml, .yml, and .hcl files
```
@y
```bash
$ docker agent run agent.hcl
$ docker agent run --exec agent.hcl "Summarize this repository"
$ docker agent serve api ./agents/   # directories may mix .yaml, .yml, and .hcl files
```
@z

@x
> [!TIP]
> **See also**
>
> HCL changes the syntax, not the meaning of fields. For what each field does, see [Agent Config](../agents/index.md), [Model Config](../models/index.md), and [Tool Config](../tools/index.md).
@y
> [!TIP]
> **See also**
>
> HCL changes the syntax, not the meaning of fields. For what each field does, see [Agent Config](../agents/index.md), [Model Config](../models/index.md), and [Tool Config](../tools/index.md).
@z

@x
## YAML vs HCL
@y
## YAML vs HCL
@z

@x
These two configs are equivalent:
@y
These two configs are equivalent:
@z

@x
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
@y
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
@z

@x
agents:
  root:
    model: claude
    description: Coding assistant
    instruction: You help with software development.
    toolsets:
      - type: filesystem
      - type: shell
```
@y
agents:
  root:
    model: claude
    description: Coding assistant
    instruction: You help with software development.
    toolsets:
      - type: filesystem
      - type: shell
```
@z

@x
```hcl
model "claude" {
  provider = "anthropic"
  model    = "claude-sonnet-4-5"
}
@y
```hcl
model "claude" {
  provider = "anthropic"
  model    = "claude-sonnet-4-5"
}
@z

@x
agent "root" {
  model       = "claude"
  description = "Coding assistant"
  instruction = "You help with software development."
@y
agent "root" {
  model       = "claude"
  description = "Coding assistant"
  instruction = "You help with software development."
@z

@x
  toolset "filesystem" {}
  toolset "shell" {}
}
```
@y
  toolset "filesystem" {}
  toolset "shell" {}
}
```
@z

@x
## Core Conventions
@y
## Core Conventions
@z

@x
HCL follows a few simple mapping rules:
@y
HCL follows a few simple mapping rules:
@z

@x
| HCL syntax | YAML shape |
| --- | --- |
| `agent "root" { ... }` | `agents.root` |
| `model "claude" { ... }` | `models.claude` |
| `provider "team" { ... }` | `providers.team` |
| `mcp "github" { ... }` | `mcps.github` |
| `rag "docs" { ... }` | `rag.docs` |
| `command "fix" { ... }` inside an agent | `commands.fix` |
| `toolset "shell" {}` | list item in `toolsets` with `type: shell` |
| `metadata { ... }`, `permissions { ... }` | singleton blocks with the same top-level name |
@y
| HCL syntax | YAML shape |
| --- | --- |
| `agent "root" { ... }` | `agents.root` |
| `model "claude" { ... }` | `models.claude` |
| `provider "team" { ... }` | `providers.team` |
| `mcp "github" { ... }` | `mcps.github` |
| `rag "docs" { ... }` | `rag.docs` |
| `command "fix" { ... }` inside an agent | `commands.fix` |
| `toolset "shell" {}` | list item in `toolsets` with `type: shell` |
| `metadata { ... }`, `permissions { ... }` | singleton blocks with the same top-level name |
@z

@x
### Top-level keyed maps become labeled blocks
@y
### Top-level keyed maps become labeled blocks
@z

@x
In YAML, several sections are maps keyed by name. In HCL, those become labeled blocks:
@y
In YAML, several sections are maps keyed by name. In HCL, those become labeled blocks:
@z

@x
```hcl
model "claude" {
  provider = "anthropic"
  model    = "claude-sonnet-4-5"
}
@y
```hcl
model "claude" {
  provider = "anthropic"
  model    = "claude-sonnet-4-5"
}
@z

@x
agent "root" {
  model       = "claude"
  description = "Primary assistant"
  instruction = "You are helpful."
}
```
@y
agent "root" {
  model       = "claude"
  description = "Primary assistant"
  instruction = "You are helpful."
}
```
@z

@x
The supported top-level labeled blocks are:
@y
The supported top-level labeled blocks are:
@z

@x
- `agent`
- `model`
- `provider`
- `mcp`
- `rag`
@y
- `agent`
- `model`
- `provider`
- `mcp`
- `rag`
@z

@x
The supported top-level singleton blocks are:
@y
The supported top-level singleton blocks are:
@z

@x
- `metadata`
- `permissions`
@y
- `metadata`
- `permissions`
@z

@x
### Toolsets use the block label as `type`
@y
### Toolsets use the block label as `type`
@z

@x
Instead of writing list entries with `type: ...`, HCL uses a `toolset` block whose label becomes the tool type:
@y
Instead of writing list entries with `type: ...`, HCL uses a `toolset` block whose label becomes the tool type:
@z

@x
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Dev assistant"
  instruction = "You can inspect and modify code."
@y
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Dev assistant"
  instruction = "You can inspect and modify code."
@z

@x
  toolset "filesystem" {}
@y
  toolset "filesystem" {}
@z

@x
  toolset "mcp" {
    ref = "docker:github-official"
  }
}
```
@y
  toolset "mcp" {
    ref = "docker:github-official"
  }
}
```
@z

@x
### Commands use labeled blocks too
@y
### Commands use labeled blocks too
@z

@x
Agent commands are often nicer to write in HCL because each command gets its own block:
@y
Agent commands are often nicer to write in HCL because each command gets its own block:
@z

@x
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Build helper"
  instruction = "You help with builds."
@y
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Build helper"
  instruction = "You help with builds."
@z

@x
  command "fix-lint" {
    description = "Fix lint issues"
    instruction = "Run the linter, then fix any problems."
  }
}
```
@y
  command "fix-lint" {
    description = "Fix lint issues"
    instruction = "Run the linter, then fix any problems."
  }
}
```
@z

@x
## Strings and Heredocs
@y
## Strings and Heredocs
@z

@x
Use quoted strings for short values and heredocs for long prompts, welcome messages, or embedded JSON.
@y
Use quoted strings for short values and heredocs for long prompts, welcome messages, or embedded JSON.
@z

@x
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Friendly assistant"
@y
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Friendly assistant"
@z

@x
  instruction = <<-EOT
  You are a helpful assistant.
@y
  instruction = <<-EOT
  You are a helpful assistant.
@z

@x
  Keep answers concise and practical.
  EOT
}
```
@y
  Keep answers concise and practical.
  EOT
}
```
@z

@x
### Escaping literal `${...}`
@y
### Escaping literal `${...}`
@z

@x
HCL treats `${...}` inside strings and heredocs as template interpolation. If you need the literal text `${...}` in your prompt, escape it as `$${...}`.
@y
HCL treats `${...}` inside strings and heredocs as template interpolation. If you need the literal text `${...}` in your prompt, escape it as `$${...}`.
@z

@x
This matters for command prompts that intentionally show Docker Agent template snippets:
@y
This matters for command prompts that intentionally show Docker Agent template snippets:
@z

@x
```hcl
command "fix-lint" {
  instruction = <<-EOT
  Run the linter and inspect the result:
@y
```hcl
command "fix-lint" {
  instruction = <<-EOT
  Run the linter and inspect the result:
@z

@x
  $${shell({cmd: "task lint"})}
  EOT
}
```
@y
  $${shell({cmd: "task lint"})}
  EOT
}
```
@z

@x
The model will receive the literal `${shell({cmd: "task lint"})}` text.
@y
The model will receive the literal `${shell({cmd: "task lint"})}` text.
@z

@x
## Loading Files with `file()`
@y
## Loading Files with `file()`
@z

@x
The `file()` function reads a UTF-8 text file and returns its contents as a string. Relative paths are resolved from the HCL config file's directory, and reads are restricted to that directory.
@y
The `file()` function reads a UTF-8 text file and returns its contents as a string. Relative paths are resolved from the HCL config file's directory, and reads are restricted to that directory.
@z

@x
This keeps long prompts out of the config:
@y
This keeps long prompts out of the config:
@z

@x
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Coding assistant"
  instruction = file("prompts/coding.md")
}
```
@y
```hcl
agent "root" {
  model       = "openai/gpt-5"
  description = "Coding assistant"
  instruction = file("prompts/coding.md")
}
```
@z

@x
With a single argument, the file contents are returned exactly as written — any `${...}` in the file stays literal, so runtime snippets like `${shell({cmd: "..."})}` pass through untouched.
@y
With a single argument, the file contents are returned exactly as written — any `${...}` in the file stays literal, so runtime snippets like `${shell({cmd: "..."})}` pass through untouched.
@z

@x
### Rendering files as templates
@y
### Rendering files as templates
@z

@x
Pass an object as the second argument to render the file as an HCL template. Each key becomes a variable available inside the file:
@y
Pass an object as the second argument to render the file as an HCL template. Each key becomes a variable available inside the file:
@z

@x
```hcl
agent "reviewer" {
  model       = "openai/gpt-5"
  description = "Go reviewer"
  instruction = file("prompts/reviewer.md", {
    language   = "Go"
    strictness = "high"
  })
}
@y
```hcl
agent "reviewer" {
  model       = "openai/gpt-5"
  description = "Go reviewer"
  instruction = file("prompts/reviewer.md", {
    language   = "Go"
    strictness = "high"
  })
}
@z

@x
agent "py_reviewer" {
  model       = "openai/gpt-5"
  description = "Python reviewer"
  instruction = file("prompts/reviewer.md", {
    language   = "Python"
    strictness = "relaxed"
  })
}
```
@y
agent "py_reviewer" {
  model       = "openai/gpt-5"
  description = "Python reviewer"
  instruction = file("prompts/reviewer.md", {
    language   = "Python"
    strictness = "relaxed"
  })
}
```
@z

@x
With `prompts/reviewer.md` containing:
@y
With `prompts/reviewer.md` containing:
@z

@x
```markdown
You review ${language} code with ${strictness} strictness.
```
@y
```markdown
You review ${language} code with ${strictness} strictness.
```
@z

@x
Templates support the full HCL template syntax, including `%{ for }` and `%{ if }` directives:
@y
Templates support the full HCL template syntax, including `%{ for }` and `%{ if }` directives:
@z

@x
```markdown
Rules:
%{ for rule in rules ~}
- ${rule}
%{ endfor ~}
```
@y
```markdown
Rules:
%{ for rule in rules ~}
- ${rule}
%{ endfor ~}
```
@z

@x
Two things to keep in mind:
@y
Two things to keep in mind:
@z

@x
- Referencing a variable that is not in the object is an error.
- No functions are available inside templates, so a template cannot call `file()` again. If the file needs a literal `${...}` while being rendered as a template, escape it as `$${...}` inside the file.
@y
- Referencing a variable that is not in the object is an error.
- No functions are available inside templates, so a template cannot call `file()` again. If the file needs a literal `${...}` while being rendered as a template, escape it as `$${...}` inside the file.
@z

@x
## Repeated Blocks Become Lists
@y
## Repeated Blocks Become Lists
@z

@x
Some YAML sections are lists. In HCL, those are written as repeated blocks.
@y
Some YAML sections are lists. In HCL, those are written as repeated blocks.
@z

@x
For example, model routing rules become repeated `routing { ... }` blocks:
@y
For example, model routing rules become repeated `routing { ... }` blocks:
@z

@x
```hcl
model "smart_router" {
  provider = "openai"
  model    = "gpt-5"
@y
```hcl
model "smart_router" {
  provider = "openai"
  model    = "gpt-5"
@z

@x
  routing {
    model    = "anthropic/claude-sonnet-4-5"
    examples = [
      "Write a detailed technical document",
      "Review this code for security issues",
    ]
  }
@y
  routing {
    model    = "anthropic/claude-sonnet-4-5"
    examples = [
      "Write a detailed technical document",
      "Review this code for security issues",
    ]
  }
@z

@x
  routing {
    model    = "openai/gpt-5"
    examples = [
      "Generate some creative ideas",
      "Help me brainstorm",
    ]
  }
}
```
@y
  routing {
    model    = "openai/gpt-5"
    examples = [
      "Generate some creative ideas",
      "Help me brainstorm",
    ]
  }
}
```
@z

@x
The same idea applies to other list-shaped sections such as RAG `strategy` blocks and hook event entries.
@y
The same idea applies to other list-shaped sections such as RAG `strategy` blocks and hook event entries.
@z

@x
## Important Differences from Terraform
@y
## Important Differences from Terraform
@z

@x
Docker Agent uses HCL as a configuration syntax, not as Terraform:
@y
Docker Agent uses HCL as a configuration syntax, not as Terraform:
@z

@x
- There are no modules, `locals`, or `variable` blocks.
- The only function available in expressions is [`file()`](#loading-files-with-file); Terraform's function library (including `templatefile()`, which `file()` with a vars object replaces) is not available.
- Prefer normal literal values: strings, numbers, booleans, lists, objects, and nested blocks.
- After conversion, the result is validated exactly like the equivalent YAML config.
@y
- There are no modules, `locals`, or `variable` blocks.
- The only function available in expressions is [`file()`](#loading-files-with-file); Terraform's function library (including `templatefile()`, which `file()` with a vars object replaces) is not available.
- Prefer normal literal values: strings, numbers, booleans, lists, objects, and nested blocks.
- After conversion, the result is validated exactly like the equivalent YAML config.
@z

@x
If you already know Terraform, think of Docker Agent HCL as a thin block-based syntax over the existing config schema.
@y
If you already know Terraform, think of Docker Agent HCL as a thin block-based syntax over the existing config schema.
@z

@x
## Examples
@y
## Examples
@z

@x
See these real configs in the repository:
@y
See these real configs in the repository:
@z

@x
- [`examples/pirate.hcl`](https://github.com/docker/docker-agent/blob/main/examples/pirate.hcl)
- [`examples/gopher.hcl`](https://github.com/docker/docker-agent/blob/main/examples/gopher.hcl)
- [`examples/instructions_from_file.hcl`](https://github.com/docker/docker-agent/blob/main/examples/instructions_from_file.hcl)
@y
- [`examples/pirate.hcl`](https://github.com/docker/docker-agent/blob/main/examples/pirate.hcl)
- [`examples/gopher.hcl`](https://github.com/docker/docker-agent/blob/main/examples/gopher.hcl)
- [`examples/instructions_from_file.hcl`](https://github.com/docker/docker-agent/blob/main/examples/instructions_from_file.hcl)
@z
