%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Installation"
description: "Get Docker Agent running on your system in minutes."
keywords: docker agent, ai agents, getting started, installation
@y
title: "Installation"
description: "Get Docker Agent running on your system in minutes."
keywords: docker agent, ai agents, getting started, installation
@z

@x
_Get Docker Agent running on your system in minutes._
@y
_Get Docker Agent running on your system in minutes._
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- An API key for at least one AI provider (OpenAI, Anthropic, Google, etc.)
- **Optional:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) — for running containerized MCP tools and Docker Model Runner
@y
- An API key for at least one AI provider (OpenAI, Anthropic, Google, etc.)
- **Optional:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) — for running containerized MCP tools and Docker Model Runner
@z

@x
## Docker Desktop (Pre-installed)
@y
## Docker Desktop (Pre-installed)
@z

@x
Starting with [Docker Desktop 4.63](https://docs.docker.com/desktop/release-notes/#4630), **Docker Agent is already available**. No separate installation needed — just open a terminal and run:
@y
Starting with [Docker Desktop 4.63](https://docs.docker.com/desktop/release-notes/#4630), **Docker Agent is already available**. No separate installation needed — just open a terminal and run:
@z

@x
```bash
$ docker agent version
```
@y
```bash
$ docker agent version
```
@z

@x
> [!TIP]
> Docker Desktop bundles Docker Agent and keeps it up to date. This is the easiest way to get started, especially if you want to use Docker MCP tools and Docker Model Runner.
@y
> [!TIP]
> Docker Desktop bundles Docker Agent and keeps it up to date. This is the easiest way to get started, especially if you want to use Docker MCP tools and Docker Model Runner.
@z

@x
## Homebrew (macOS / Linux)
@y
## Homebrew (macOS / Linux)
@z

@x
Install Docker Agent using [Homebrew](https://brew.sh/):
@y
Install Docker Agent using [Homebrew](https://brew.sh/):
@z

@x
```bash
# Install
$ brew install docker-agent
@y
```bash
# Install
$ brew install docker-agent
@z

@x
# Verify
$ docker-agent version
```
@y
# Verify
$ docker-agent version
```
@z

@x
You can also install Docker Agent as a docker CLI plugin, by copying the `docker-agent` binary in `~/.docker/cli-plugins`. You can then run `docker agent version`.
@y
You can also install Docker Agent as a docker CLI plugin, by copying the `docker-agent` binary in `~/.docker/cli-plugins`. You can then run `docker agent version`.
@z

@x
## Download Binary Releases
@y
## Download Binary Releases
@z

@x
Download [prebuilt binary releases](https://github.com/docker/docker-agent/releases) for Windows, macOS, and Linux from the GitHub Releases page.
@y
Download [prebuilt binary releases](https://github.com/docker/docker-agent/releases) for Windows, macOS, and Linux from the GitHub Releases page.
@z

@x
### macOS / Linux
@y
### macOS / Linux
@z

@x
```bash
# Download the latest release
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m); case "$ARCH" in x86_64) ARCH=amd64;; aarch64) ARCH=arm64;; esac
curl -L "https://github.com/docker/docker-agent/releases/latest/download/docker-agent-${OS}-${ARCH}" -o docker-agent
chmod +x docker-agent
sudo mv docker-agent /usr/local/bin/
docker-agent version
@y
```bash
# Download the latest release
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m); case "$ARCH" in x86_64) ARCH=amd64;; aarch64) ARCH=arm64;; esac
curl -L "https://github.com/docker/docker-agent/releases/latest/download/docker-agent-${OS}-${ARCH}" -o docker-agent
chmod +x docker-agent
sudo mv docker-agent /usr/local/bin/
docker-agent version
@z

@x
# or alternatively, instead of moving to /usr/local/bin:
mkdir -p ~/.docker/cli-plugins
sudo mv docker-agent ~/.docker/cli-plugins
docker agent version
```
@y
# or alternatively, instead of moving to /usr/local/bin:
mkdir -p ~/.docker/cli-plugins
sudo mv docker-agent ~/.docker/cli-plugins
docker agent version
```
@z

@x
### Windows
@y
### Windows
@z

@x
Download `docker-agent-windows-amd64.exe` from the [releases page](https://github.com/docker/docker-agent/releases), rename it to `docker-agent.exe` and add it to your PATH. Alternatively you can move it to `~/.docker/cli-plugins`
@y
Download `docker-agent-windows-amd64.exe` from the [releases page](https://github.com/docker/docker-agent/releases), rename it to `docker-agent.exe` and add it to your PATH. Alternatively you can move it to `~/.docker/cli-plugins`
@z

@x
## Optional Self-Updates
@y
## Optional Self-Updates
@z

@x
When Docker Agent is installed from a standalone GitHub release binary, you can opt in to automatic self-updates by setting `DOCKER_AGENT_AUTO_UPDATE` to a truthy value (`1`, `true`, `yes`, or `on`):
@y
When Docker Agent is installed from a standalone GitHub release binary, you can opt in to automatic self-updates by setting `DOCKER_AGENT_AUTO_UPDATE` to a truthy value (`1`, `true`, `yes`, or `on`):
@z

@x
```bash
# Enable for one command
DOCKER_AGENT_AUTO_UPDATE=1 docker agent run
@y
```bash
# Enable for one command
DOCKER_AGENT_AUTO_UPDATE=1 docker agent run
@z

@x
# Or enable for the current shell session
export DOCKER_AGENT_AUTO_UPDATE=1
docker agent run
```
@y
# Or enable for the current shell session
export DOCKER_AGENT_AUTO_UPDATE=1
docker agent run
```
@z

@x
With self-updates enabled, Docker Agent checks the latest GitHub release before normal commands run. If a newer release exists and your session is interactive, Docker Agent asks whether you want to install it or keep running your current version. When the answer is yes (or the session is non-interactive, such as CI or piped input, in which case the update proceeds automatically), it downloads the asset for your OS and architecture, verifies the release-provided SHA-256 digest/checksum, replaces the current binary, and restarts the command with the same arguments.
@y
With self-updates enabled, Docker Agent checks the latest GitHub release before normal commands run. If a newer release exists and your session is interactive, Docker Agent asks whether you want to install it or keep running your current version. When the answer is yes (or the session is non-interactive, such as CI or piped input, in which case the update proceeds automatically), it downloads the asset for your OS and architecture, verifies the release-provided SHA-256 digest/checksum, replaces the current binary, and restarts the command with the same arguments.
@z

@x
Self-updates are fail-safe: if checking, downloading, verifying, installing, or restarting fails, Docker Agent keeps running the current binary. Version/help/completion commands and Docker CLI plugin metadata handshakes do not trigger self-updates.
@y
Self-updates are fail-safe: if checking, downloading, verifying, installing, or restarting fails, Docker Agent keeps running the current binary. Version/help/completion commands and Docker CLI plugin metadata handshakes do not trigger self-updates.
@z

@x
> [!NOTE]
> **Package-manager installs**
>
> Docker Desktop and Homebrew already manage Docker Agent updates. Prefer those update mechanisms when you installed Docker Agent that way. Self-updates are mainly intended for standalone release binaries.
@y
> [!NOTE]
> **Package-manager installs**
>
> Docker Desktop and Homebrew already manage Docker Agent updates. Prefer those update mechanisms when you installed Docker Agent that way. Self-updates are mainly intended for standalone release binaries.
@z

@x
## Build from Source
@y
## Build from Source
@z

@x
For the latest features, or to contribute, build from source:
@y
For the latest features, or to contribute, build from source:
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- [Go 1.26](https://go.dev/dl/) or higher
- [Task](https://taskfile.dev/installation/) (build tool)
- [golangci-lint](https://golangci-lint.run/docs/welcome/install/local/) (for linting)
@y
- [Go 1.26](https://go.dev/dl/) or higher
- [Task](https://taskfile.dev/installation/) (build tool)
- [golangci-lint](https://golangci-lint.run/docs/welcome/install/local/) (for linting)
@z

@x
```bash
# Clone the repository
git clone https://github.com/docker/docker-agent.git
cd docker-agent
@y
```bash
# Clone the repository
git clone https://github.com/docker/docker-agent.git
cd docker-agent
@z

@x
# Build the binary
task build
@y
# Build the binary
task build
@z

@x
# The binary is at ./bin/docker-agent
./bin/docker-agent --help
```
@y
# The binary is at ./bin/docker-agent
./bin/docker-agent --help
```
@z

@x
> [!TIP]
> **Building on Windows**
>
> On Windows, use `task build-local` instead of `task build`. This builds the binary inside a Docker container using Docker Buildx, which avoids issues with Windows-specific toolchain setup and CGo cross-compilation. The output goes to the `./dist` directory.
@y
> [!TIP]
> **Building on Windows**
>
> On Windows, use `task build-local` instead of `task build`. This builds the binary inside a Docker container using Docker Buildx, which avoids issues with Windows-specific toolchain setup and CGo cross-compilation. The output goes to the `./dist` directory.
@z

@x
## Set Up API Keys
@y
## Set Up API Keys
@z

@x
Docker Agent needs API keys for the model providers you want to use. Set them as environment variables:
@y
Docker Agent needs API keys for the model providers you want to use. Set them as environment variables:
@z

@x
```bash
# Pick one (or more) depending on your provider
export OPENAI_API_KEY="sk-..."           # OpenAI
export ANTHROPIC_API_KEY="sk-ant-..."    # Anthropic
export GOOGLE_API_KEY="AI..."            # Google Gemini (or GEMINI_API_KEY)
export GITHUB_TOKEN="ghp-..."            # GitHub Copilot (PAT with copilot scope)
export MISTRAL_API_KEY="..."             # Mistral
export OPENROUTER_API_KEY="..."          # OpenRouter
```
@y
```bash
# Pick one (or more) depending on your provider
export OPENAI_API_KEY="sk-..."           # OpenAI
export ANTHROPIC_API_KEY="sk-ant-..."    # Anthropic
export GOOGLE_API_KEY="AI..."            # Google Gemini (or GEMINI_API_KEY)
export GITHUB_TOKEN="ghp-..."            # GitHub Copilot (PAT with copilot scope)
export MISTRAL_API_KEY="..."             # Mistral
export OPENROUTER_API_KEY="..."          # OpenRouter
```
@z

@x
See [Configuration Overview](../../configuration/overview/index.md#environment-variables) for the full list of supported providers and environment variables.
@y
See [Configuration Overview](../../configuration/overview/index.md#environment-variables) for the full list of supported providers and environment variables.
@z

@x
> [!NOTE]
> You only need the key(s) for the provider(s) you configure in your agent YAML. If you use Docker Model Runner (DMR), no API key is needed — models run locally.
@y
> [!NOTE]
> You only need the key(s) for the provider(s) you configure in your agent YAML. If you use Docker Model Runner (DMR), no API key is needed — models run locally.
@z

@x
## Verify Installation
@y
## Verify Installation
@z

@x
```bash
# Check the version
$ docker agent version
@y
```bash
# Check the version
$ docker agent version
@z

@x
# Run the default agent
$ docker agent run
@y
# Run the default agent
$ docker agent run
@z

@x
# Or run an agent from an OCI registry
$ docker agent run myorg/agent:tag
```
@y
# Or run an agent from an OCI registry
$ docker agent run myorg/agent:tag
```
@z

@x
## What's Next?
@y
## What's Next?
@z

@x
- [**Quick Start**](../quickstart/index.md) — create and run your first agent in under 5 minutes.
- [**Troubleshooting**](../../community/troubleshooting/index.md) — something not working? Debug mode, common issues, and solutions.
@y
- [**Quick Start**](../quickstart/index.md) — create and run your first agent in under 5 minutes.
- [**Troubleshooting**](../../community/troubleshooting/index.md) — something not working? Debug mode, common issues, and solutions.
@z
