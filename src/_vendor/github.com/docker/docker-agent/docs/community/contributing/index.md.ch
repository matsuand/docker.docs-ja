%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Contributing"
description: "Docker Agent is open source. Here's how to set up your development environment and contribute."
keywords: docker agent, ai agents, community, contributing
@y
title: "Contributing"
description: "Docker Agent is open source. Here's how to set up your development environment and contribute."
keywords: docker agent, ai agents, community, contributing
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/community/contributing/
@y
canonical: __SUBDIR__/ai/docker-agent/community/contributing/
@z

@x
_Docker Agent is open source. Here's how to set up your development environment and contribute._
@y
_Docker Agent is open source. Here's how to set up your development environment and contribute._
@z

@x
## Development Setup
@y
## Development Setup
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- [Go 1.26](https://go.dev/dl/) or higher
- API key(s) for your chosen AI provider
- [Task](https://taskfile.dev/installation/)
- [golangci-lint](https://golangci-lint.run/docs/welcome/install/local/)
@y
- [Go 1.26](https://go.dev/dl/) or higher
- API key(s) for your chosen AI provider
- [Task](https://taskfile.dev/installation/)
- [golangci-lint](https://golangci-lint.run/docs/welcome/install/local/)
@z

@x
> [!NOTE]
> **Platform Support**
>
> macOS and Linux are fully supported for development. On Windows, use `task build-local` to build via Docker.
@y
> [!NOTE]
> **Platform Support**
>
> macOS and Linux are fully supported for development. On Windows, use `task build-local` to build via Docker.
@z

@x
### Build from Source
@y
### Build from Source
@z

@x
```bash
# Clone and build
git clone https://github.com/docker/docker-agent.git
cd docker-agent
task build
@y
```bash
# Clone and build
git clone https://github.com/docker/docker-agent.git
cd docker-agent
task build
@z

@x
# Set API keys
export OPENAI_API_KEY=your_key_here
export ANTHROPIC_API_KEY=your_key_here
@y
# Set API keys
export OPENAI_API_KEY=your_key_here
export ANTHROPIC_API_KEY=your_key_here
@z

@x
# Run an example
./bin/docker-agent run examples/code.yaml
```
@y
# Run an example
./bin/docker-agent run examples/code.yaml
```
@z

@x
### Development Commands
@y
### Development Commands
@z

@x
| Command            | Description                                     |
| ------------------ | ----------------------------------------------- |
| `task build`       | Build the binary to `./bin/docker-agent`        |
| `task test`        | Run all tests (clears API keys for determinism) |
| `task lint`        | Run golangci-lint                               |
| `task format`      | Format code                                     |
| `task dev`         | Run lint, test, and build in sequence           |
| `task build-local` | Build for local platform via Docker             |
| `task cross`       | Cross-platform builds (all architectures)       |
@y
| Command            | Description                                     |
| ------------------ | ----------------------------------------------- |
| `task build`       | Build the binary to `./bin/docker-agent`        |
| `task test`        | Run all tests (clears API keys for determinism) |
| `task lint`        | Run golangci-lint                               |
| `task format`      | Format code                                     |
| `task dev`         | Run lint, test, and build in sequence           |
| `task build-local` | Build for local platform via Docker             |
| `task cross`       | Cross-platform builds (all architectures)       |
@z

@x
## Dogfooding
@y
## Dogfooding
@z

@x
Use Docker Agent to work on Docker Agent! The project includes a specialized developer agent:
@y
Use Docker Agent to work on Docker Agent! The project includes a specialized developer agent:
@z

@x
```bash
cd docker-agent
docker agent run ./golang_developer.yaml
```
@y
```bash
cd docker-agent
docker agent run ./golang_developer.yaml
```
@z

@x
This agent is an expert Go developer that understands the Docker Agent codebase. Ask it questions, request fixes, or have it implement features.
@y
This agent is an expert Go developer that understands the Docker Agent codebase. Ask it questions, request fixes, or have it implement features.
@z

@x
## Core Concepts
@y
## Core Concepts
@z

@x
- **Root Agent** — Main entry point that coordinates the system
- **Sub-Agents** — Specialized agents for specific domains
- **Tools** — External capabilities via MCP
- **Models** — AI provider configurations
@y
- **Root Agent** — Main entry point that coordinates the system
- **Sub-Agents** — Specialized agents for specific domains
- **Tools** — External capabilities via MCP
- **Models** — AI provider configurations
@z

@x
## Code Style
@y
## Code Style
@z

@x
The project uses `golangci-lint` with strict rules. As long as `task lint` passes, the code is stylistically acceptable.
@y
The project uses `golangci-lint` with strict rules. As long as `task lint` passes, the code is stylistically acceptable.
@z

@x
Key conventions:
@y
Key conventions:
@z

@x
- Use `fmt.Errorf("context: %w", err)` for error wrapping
- Always pass `context.Context` as the first parameter
- Use `slog` for structured logging
- Use functional options pattern for constructors
- In tests: use `t.Context()`, `t.TempDir()`, `t.Setenv()`, and `t.Parallel()`
@y
- Use `fmt.Errorf("context: %w", err)` for error wrapping
- Always pass `context.Context` as the first parameter
- Use `slog` for structured logging
- Use functional options pattern for constructors
- In tests: use `t.Context()`, `t.TempDir()`, `t.Setenv()`, and `t.Parallel()`
@z

@x
## Opening Issues
@y
## Opening Issues
@z

@x
File issues on the [GitHub issue tracker](https://github.com/docker/docker-agent/issues). Please:
@y
File issues on the [GitHub issue tracker](https://github.com/docker/docker-agent/issues). Please:
@z

@x
> [!NOTE]
> **See also**
>
> [Troubleshooting](../troubleshooting/index.md) — Common issues and debug mode. [Telemetry](../telemetry/index.md) — What data is collected and how to opt out.
@y
> [!NOTE]
> **See also**
>
> [Troubleshooting](../troubleshooting/index.md) — Common issues and debug mode. [Telemetry](../telemetry/index.md) — What data is collected and how to opt out.
@z

@x
- Use the included issue template
- Search for existing issues before creating new ones
- Only use issues for bugs and feature requests (not support)
@y
- Use the included issue template
- Search for existing issues before creating new ones
- Only use issues for bugs and feature requests (not support)
@z

@x
## Submitting Pull Requests
@y
## Submitting Pull Requests
@z

@x
1. **Fork** the repository and create a branch for your changes
2. **Write** your code following the style and testing guidelines above
3. **Test** your changes: run `task lint` and `task test`
4. **Sign** your commits with `git commit -s` (DCO required)
5. **Open a pull request** against the `main` branch
@y
1. **Fork** the repository and create a branch for your changes
2. **Write** your code following the style and testing guidelines above
3. **Test** your changes: run `task lint` and `task test`
4. **Sign** your commits with `git commit -s` (DCO required)
5. **Open a pull request** against the `main` branch
@z

@x
> [!TIP]
> Use the dogfooding agent (`docker agent run ./golang_developer.yaml`) to help write and review your changes before submitting.
@y
> [!TIP]
> Use the dogfooding agent (`docker agent run ./golang_developer.yaml`) to help write and review your changes before submitting.
@z

@x
## Sign Your Work
@y
## Sign Your Work
@z

@x
All contributions require a Developer Certificate of Origin (DCO) sign-off:
@y
All contributions require a Developer Certificate of Origin (DCO) sign-off:
@z

@x
```bash
# Sign commits automatically
git config user.name "Your Name"
git config user.email "your.email@example.com"
git commit -s -m "Your commit message"
```
@y
```bash
# Sign commits automatically
git config user.name "Your Name"
git config user.email "your.email@example.com"
git commit -s -m "Your commit message"
```
@z

@x
## Community
@y
## Community
@z

@x
Find us on [Slack](https://dockercommunity.slack.com/archives/C09DASHHRU4) for questions and discussions.
@y
Find us on [Slack](https://dockercommunity.slack.com/archives/C09DASHHRU4) for questions and discussions.
@z

@x
## Code of Conduct
@y
## Code of Conduct
@z

@x
We want to keep the Docker Agent community welcoming, inclusive, and collaborative. Key guidelines:
@y
We want to keep the Docker Agent community welcoming, inclusive, and collaborative. Key guidelines:
@z

@x
- **Be nice** — Be courteous, respectful, and polite. No abuse of any kind will be tolerated.
- **Encourage diversity** — Make everyone feel welcome regardless of background.
- **Keep it legal** — Share only content you own and don't break the law.
- **Stay on topic** — Post to the correct channel and avoid off-topic discussions.
@y
- **Be nice** — Be courteous, respectful, and polite. No abuse of any kind will be tolerated.
- **Encourage diversity** — Make everyone feel welcome regardless of background.
- **Keep it legal** — Share only content you own and don't break the law.
- **Stay on topic** — Post to the correct channel and avoid off-topic discussions.
@z

@x
The governance for this repository is handled by Docker Inc.
@y
The governance for this repository is handled by Docker Inc.
@z
