%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
title: Build and run agentic AI applications with Docker
linktitle: Agentic AI applications
keywords: AI, Docker, Model Runner, MCP Toolkit, AI agents, application development
summary: |
  Learn how to create AI agent applications using Docker Model Runner, and MCP Toolkit.
@y
title: Build and run agentic AI applications with Docker
linktitle: Agentic AI applications
keywords: AI, Docker, Model Runner, MCP Toolkit, AI agents, application development
summary: |
  Learn how to create AI agent applications using Docker Model Runner, and MCP Toolkit.
@z

@x
  time: 30 minutes
@y
  time: 30 •ª
@z

@x
> [!TIP]
>
> This guide uses the familiar Docker Compose workflow to orchestrate agentic AI
> applications. For a smoother development experience, check out [Docker
> cagent](../manuals/ai/cagent/_index.md), a purpose-built agent runtime that
> simplifies running and managing AI agents.
@y
> [!TIP]
>
> This guide uses the familiar Docker Compose workflow to orchestrate agentic AI
> applications. For a smoother development experience, check out [Docker
> cagent](../manuals/ai/cagent/_index.md), a purpose-built agent runtime that
> simplifies running and managing AI agents.
@z

@x
## Introduction
@y
## Introduction
@z

@x
Agentic applications are transforming how software gets built. These apps don't
just respond, they decide, plan, and act. They're powered by models,
orchestrated by agents, and integrated with APIs, tools, and services in real
time.
@y
Agentic applications are transforming how software gets built. These apps don't
just respond, they decide, plan, and act. They're powered by models,
orchestrated by agents, and integrated with APIs, tools, and services in real
time.
@z

@x
All these new agentic applications, no matter what they do, share a common
architecture. It's a new kind of stack, built from three core components:
@y
All these new agentic applications, no matter what they do, share a common
architecture. It's a new kind of stack, built from three core components:
@z

@x
- Models: These are your GPTs, CodeLlamas, Mistrals. They're doing the
  reasoning, writing, and planning. They're the engine behind the intelligence.
@y
- Models: These are your GPTs, CodeLlamas, Mistrals. They're doing the
  reasoning, writing, and planning. They're the engine behind the intelligence.
@z

@x
- Agent: This is where the logic lives. Agents take a goal, break it down, and
  figure out how to get it done. They orchestrate everything. They talk to the
  UI, the tools, the model, and the gateway.
@y
- Agent: This is where the logic lives. Agents take a goal, break it down, and
  figure out how to get it done. They orchestrate everything. They talk to the
  UI, the tools, the model, and the gateway.
@z

@x
- MCP gateway: This is what links your agents to the outside world, including
  APIs, tools, and services. It provides a standard way for agents to call
  capabilities via the Model Context Protocol (MCP).
@y
- MCP gateway: This is what links your agents to the outside world, including
  APIs, tools, and services. It provides a standard way for agents to call
  capabilities via the Model Context Protocol (MCP).
@z

@x
Docker makes this AI-powered stack simpler, faster, and more secure by unifying
models, and tool gateways into a developer-friendly workflow that uses Docker
Compose.
@y
Docker makes this AI-powered stack simpler, faster, and more secure by unifying
models, and tool gateways into a developer-friendly workflow that uses Docker
Compose.
@z

@x
![A diagram of the agentic stack](./images/agentic-ai-diagram.webp)
@y
![A diagram of the agentic stack](./images/agentic-ai-diagram.webp)
@z

@x
This guide walks you through the core components of agentic development and
shows how Docker ties them all together with the following tools:
@y
This guide walks you through the core components of agentic development and
shows how Docker ties them all together with the following tools:
@z

@x
- [Docker Model Runner](../manuals/ai/model-runner/_index.md) lets you run LLMs
  locally with simple command and OpenAI-compatible APIs.
- [Docker MCP Catalog and
  Toolkit](../manuals/ai/mcp-catalog-and-toolkit/_index.md) helps you discover
  and securely run external tools, like APIs and databases, using the Model
  Context Protocol (MCP).
- [Docker MCP Gateway](../manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) lets you orchestrate and manage MCP servers.
- [Docker Compose](/manuals/ai/compose/models-and-compose.md) is the tool that ties it all
  together, letting you define and run multi-container applications with a
  single file.
@y
- [Docker Model Runner](../manuals/ai/model-runner/_index.md) lets you run LLMs
  locally with simple command and OpenAI-compatible APIs.
- [Docker MCP Catalog and
  Toolkit](../manuals/ai/mcp-catalog-and-toolkit/_index.md) helps you discover
  and securely run external tools, like APIs and databases, using the Model
  Context Protocol (MCP).
- [Docker MCP Gateway](../manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md) lets you orchestrate and manage MCP servers.
- [Docker Compose](manuals/ai/compose/models-and-compose.md) is the tool that ties it all
  together, letting you define and run multi-container applications with a
  single file.
@z

@x
For this guide, you'll use the same Compose workflow you're already familiar
with. Then, you'll dig into the Compose file, Dockerfile, and app to see how it
all works together.
@y
For this guide, you'll use the same Compose workflow you're already familiar
with. Then, you'll dig into the Compose file, Dockerfile, and app to see how it
all works together.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To follow this guide, you need to:
@y
To follow this guide, you need to:
@z

@x
 - [Install Docker Desktop 4.43 or later](../get-started/get-docker.md)
 - [Enable Docker Model Runner](/manuals/ai/model-runner.md#enable-dmr-in-docker-desktop)
 - At least the following hardware specifications:
    - VRAM: 3.5 GB
    - Storage: 2.31 GB
@y
 - [Install Docker Desktop 4.43 or later](../get-started/get-docker.md)
 - [Enable Docker Model Runner](manuals/ai/model-runner.md#enable-dmr-in-docker-desktop)
 - At least the following hardware specifications:
    - VRAM: 3.5 GB
    - Storage: 2.31 GB
@z

@x
## Step 1: Clone the sample application
@y
## Step 1: Clone the sample application
@z

@x
You'll use an existing sample application that demonstrates how to connect a
model to an external tool using Docker's AI features.
@y
You'll use an existing sample application that demonstrates how to connect a
model to an external tool using Docker's AI features.
@z

@x
```console
$ git clone https://github.com/docker/compose-for-agents.git
$ cd compose-for-agents/adk/
```
@y
```console
$ git clone https://github.com/docker/compose-for-agents.git
$ cd compose-for-agents/adk/
```
@z

@x
## Step 2: Run the application locally
@y
## Step 2: Run the application locally
@z

@x
Your machine must meet the necessary hardware requirements to run the
entire application stack locally using Docker Compose. This lets you test the
application end-to-end, including the model and MCP gateway, without needing to
run in the cloud. This particular example uses the [Gemma 3 4B
model](https://hub.docker.com/r/ai/gemma3) with a context size of `10000`.
@y
Your machine must meet the necessary hardware requirements to run the
entire application stack locally using Docker Compose. This lets you test the
application end-to-end, including the model and MCP gateway, without needing to
run in the cloud. This particular example uses the [Gemma 3 4B
model](https://hub.docker.com/r/ai/gemma3) with a context size of `10000`.
@z

@x
Hardware requirements:
 - VRAM: 3.5 GB
 - Storage: 2.31 GB
@y
Hardware requirements:
 - VRAM: 3.5 GB
 - Storage: 2.31 GB
@z

@x
If your machine exceeds those requirements, consider running the application with a larger
context size or a larger model to improve the agents performance. You can easily
update model and context size in the `compose.yaml` file.
@y
If your machine exceeds those requirements, consider running the application with a larger
context size or a larger model to improve the agents performance. You can easily
update model and context size in the `compose.yaml` file.
@z

@x
To run the application locally, follow these steps:
@y
To run the application locally, follow these steps:
@z

@x
1. In the `adk/` directory of the cloned repository, run the following command in a
   terminal to build and run the application:
@y
1. In the `adk/` directory of the cloned repository, run the following command in a
   terminal to build and run the application:
@z

@x
   ```console
   $ docker compose up
   ```
@y
   ```console
   $ docker compose up
   ```
@z

@x
   The first time you run this command, Docker pulls the
   model from Docker Hub, which may take some time.
@y
   The first time you run this command, Docker pulls the
   model from Docker Hub, which may take some time.
@z

@x
2. Visit [http://localhost:8080](http://localhost:8080). Enter a correct or
   incorrect fact in the prompt and hit enter. An agent searches DuckDuckGo to
   verify it and another agent revises the output.
@y
2. Visit [http://localhost:8080](http://localhost:8080). Enter a correct or
   incorrect fact in the prompt and hit enter. An agent searches DuckDuckGo to
   verify it and another agent revises the output.
@z

@x
    ![Screenshot of the application](./images/agentic-ai-app.png)
@y
    ![Screenshot of the application](./images/agentic-ai-app.png)
@z

@x
3. Press ctrl-c in the terminal to stop the application when you're done.
@y
3. Press ctrl-c in the terminal to stop the application when you're done.
@z

@x
## Step 3: Review the application environment
@y
## Step 3: Review the application environment
@z

@x
You can find the `compose.yaml` file in the `adk/` directory. Open it in a text
editor to see how the services are defined.
@y
You can find the `compose.yaml` file in the `adk/` directory. Open it in a text
editor to see how the services are defined.
@z

@x
```yaml {collapse=true,title=compose.yaml}
services:
  adk:
    build:
      context: .
    ports:
      # expose port for web interface
      - "8080:8080"
    environment:
      # point adk at the MCP gateway
      - MCPGATEWAY_ENDPOINT=http://mcp-gateway:8811/sse
    depends_on:
      - mcp-gateway
    models:
      gemma3 :
        endpoint_var: MODEL_RUNNER_URL
        model_var: MODEL_RUNNER_MODEL
@y
```yaml {collapse=true,title=compose.yaml}
services:
  adk:
    build:
      context: .
    ports:
      # expose port for web interface
      - "8080:8080"
    environment:
      # point adk at the MCP gateway
      - MCPGATEWAY_ENDPOINT=http://mcp-gateway:8811/sse
    depends_on:
      - mcp-gateway
    models:
      gemma3 :
        endpoint_var: MODEL_RUNNER_URL
        model_var: MODEL_RUNNER_MODEL
@z

@x
  mcp-gateway:
    # mcp-gateway secures your MCP servers
    image: docker/mcp-gateway:latest
    use_api_socket: true
    command:
      - --transport=sse
      # add any MCP servers you want to use
      - --servers=duckduckgo
@y
  mcp-gateway:
    # mcp-gateway secures your MCP servers
    image: docker/mcp-gateway:latest
    use_api_socket: true
    command:
      - --transport=sse
      # add any MCP servers you want to use
      - --servers=duckduckgo
@z

@x
models:
  gemma3:
    # pre-pull the model when starting Docker Model Runner
    model: ai/gemma3:4B-Q4_0
    context_size: 10000 # 3.5 GB VRAM
    # increase context size to handle search results
    # context_size: 131000 # 7.6 GB VRAM
```
@y
models:
  gemma3:
    # pre-pull the model when starting Docker Model Runner
    model: ai/gemma3:4B-Q4_0
    context_size: 10000 # 3.5 GB VRAM
    # increase context size to handle search results
    # context_size: 131000 # 7.6 GB VRAM
```
@z

@x
The app consists of three main components:
@y
The app consists of three main components:
@z

@x
 - The `adk` service, which is the web application that runs the agentic AI
   application. This service talks to the MCP gateway and model.
 - The `mcp-gateway` service, which is the MCP gateway that connects the app
   to external tools and services.
 - The `models` block, which defines the model to use with the application.
@y
 - The `adk` service, which is the web application that runs the agentic AI
   application. This service talks to the MCP gateway and model.
 - The `mcp-gateway` service, which is the MCP gateway that connects the app
   to external tools and services.
 - The `models` block, which defines the model to use with the application.
@z

@x
When you examine the `compose.yaml` file, you'll notice two notable elements for the model:
@y
When you examine the `compose.yaml` file, you'll notice two notable elements for the model:
@z

@x
 - A serviceâ€‘level `models` block in the `adk` service
 - A top-level `models` block
@y
 - A serviceâ€‘level `models` block in the `adk` service
 - A top-level `models` block
@z

@x
These two blocks together let Docker Compose automatically start and connect
your ADK web app to the specified LLM.
@y
These two blocks together let Docker Compose automatically start and connect
your ADK web app to the specified LLM.
@z

@x
> [!TIP]
>
> Looking for more models to use? Check out the [Docker AI Model
> Catalog](https://hub.docker.com/catalogs/models/).
@y
> [!TIP]
>
> Looking for more models to use? Check out the [Docker AI Model
> Catalog](https://hub.docker.com/catalogs/models/).
@z

@x
When examining the `compose.yaml` file, you'll notice the gateway service is a
Docker-maintained image,
[`docker/mcp-gateway:latest`](https://hub.docker.com/r/docker/agents_gateway).
This image is Docker's open source [MCP
Gateway](https://github.com/docker/docker-mcp/) that enables your application to
connect to MCP servers, which expose tools that models can call. In this
example, it uses the [`duckduckgo` MCP
server](https://hub.docker.com/mcp/server/duckduckgo/overview) to perform web
searches.
@y
When examining the `compose.yaml` file, you'll notice the gateway service is a
Docker-maintained image,
[`docker/mcp-gateway:latest`](https://hub.docker.com/r/docker/agents_gateway).
This image is Docker's open source [MCP
Gateway](https://github.com/docker/docker-mcp/) that enables your application to
connect to MCP servers, which expose tools that models can call. In this
example, it uses the [`duckduckgo` MCP
server](https://hub.docker.com/mcp/server/duckduckgo/overview) to perform web
searches.
@z

@x
>  [!TIP]
>
> Looking for more MCP servers to use? Check out the [Docker MCP
> Catalog](https://hub.docker.com/catalogs/mcp/).
@y
>  [!TIP]
>
> Looking for more MCP servers to use? Check out the [Docker MCP
> Catalog](https://hub.docker.com/catalogs/mcp/).
@z

@x
With only a few lines of instructions in a Compose file, you're able to run and
connect all the necessary services of an agentic AI application.
@y
With only a few lines of instructions in a Compose file, you're able to run and
connect all the necessary services of an agentic AI application.
@z

@x
In addition to the Compose file, the Dockerfile and the
`entrypoint.sh` script it creates, play a role in wiring up the AI stack at build and
runtime. You can find the `Dockerfile` in the `adk/` directory. Open it in a
text editor.
@y
In addition to the Compose file, the Dockerfile and the
`entrypoint.sh` script it creates, play a role in wiring up the AI stack at build and
runtime. You can find the `Dockerfile` in the `adk/` directory. Open it in a
text editor.
@z

@x
```dockerfile {collapse=true,title=Dockerfile}
# Use Python 3.11 slim image as base
FROM python:3.13-slim
ENV PYTHONUNBUFFERED=1
@y
```dockerfile {collapse=true,title=Dockerfile}
# Use Python 3.11 slim image as base
FROM python:3.13-slim
ENV PYTHONUNBUFFERED=1
@z

@x
RUN pip install uv
@y
RUN pip install uv
@z

@x
WORKDIR /app
# Install system dependencies
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy \
    uv pip install --system .
# Copy application code
COPY agents/ ./agents/
RUN python -m compileall -q .
@y
WORKDIR /app
# Install system dependencies
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy \
    uv pip install --system .
# Copy application code
COPY agents/ ./agents/
RUN python -m compileall -q .
@z

@x
COPY <<EOF /entrypoint.sh
#!/bin/sh
set -e
@y
COPY <<EOF /entrypoint.sh
#!/bin/sh
set -e
@z

@x
if test -f /run/secrets/openai-api-key; then
    export OPENAI_API_KEY=$(cat /run/secrets/openai-api-key)
fi
@y
if test -f /run/secrets/openai-api-key; then
    export OPENAI_API_KEY=$(cat /run/secrets/openai-api-key)
fi
@z

@x
if test -n "\${OPENAI_API_KEY}"; then
    echo "Using OpenAI with \${OPENAI_MODEL_NAME}"
else
    echo "Using Docker Model Runner with \${MODEL_RUNNER_MODEL}"
    export OPENAI_BASE_URL=\${MODEL_RUNNER_URL}
    export OPENAI_MODEL_NAME=openai/\${MODEL_RUNNER_MODEL}
    export OPENAI_API_KEY=cannot_be_empty
fi
exec adk web --host 0.0.0.0 --port 8080 --log_level DEBUG
EOF
RUN chmod +x /entrypoint.sh
@y
if test -n "\${OPENAI_API_KEY}"; then
    echo "Using OpenAI with \${OPENAI_MODEL_NAME}"
else
    echo "Using Docker Model Runner with \${MODEL_RUNNER_MODEL}"
    export OPENAI_BASE_URL=\${MODEL_RUNNER_URL}
    export OPENAI_MODEL_NAME=openai/\${MODEL_RUNNER_MODEL}
    export OPENAI_API_KEY=cannot_be_empty
fi
exec adk web --host 0.0.0.0 --port 8080 --log_level DEBUG
EOF
RUN chmod +x /entrypoint.sh
@z

@x
# Create non-root user
RUN useradd --create-home --shell /bin/bash app \
    && chown -R app:app /app
USER app
@y
# Create non-root user
RUN useradd --create-home --shell /bin/bash app \
    && chown -R app:app /app
USER app
@z

@x
ENTRYPOINT [ "/entrypoint.sh" ]
```
@y
ENTRYPOINT [ "/entrypoint.sh" ]
```
@z

@x
The `entrypoint.sh` has five key environment variables:
@y
The `entrypoint.sh` has five key environment variables:
@z

@x
- `MODEL_RUNNER_URL`: Injected by Compose (via the service-level `models:`
  block) to point at your Docker Model Runner HTTP endpoint.
@y
- `MODEL_RUNNER_URL`: Injected by Compose (via the service-level `models:`
  block) to point at your Docker Model Runner HTTP endpoint.
@z

@x
- `MODEL_RUNNER_MODEL`: Injected by Compose to select which model to launch in
  Model Runner.
@y
- `MODEL_RUNNER_MODEL`: Injected by Compose to select which model to launch in
  Model Runner.
@z

@x
- `OPENAI_API_KEY`: If you define an `openai-api-key` secret in your Compose
  file, Compose will mount it at `/run/secrets/openai-api-key`. The entrypoint
  script reads that file and exports it as `OPENAI_API_KEY`, causing the app to
  use hosted OpenAI instead of Model Runner.
@y
- `OPENAI_API_KEY`: If you define an `openai-api-key` secret in your Compose
  file, Compose will mount it at `/run/secrets/openai-api-key`. The entrypoint
  script reads that file and exports it as `OPENAI_API_KEY`, causing the app to
  use hosted OpenAI instead of Model Runner.
@z

@x
- `OPENAI_BASE_URL`: When no real key is present, this is set to
  `MODEL_RUNNER_URL` so the ADK's OpenAI-compatible client sends requests to
  Docker Model Runner.
@y
- `OPENAI_BASE_URL`: When no real key is present, this is set to
  `MODEL_RUNNER_URL` so the ADK's OpenAI-compatible client sends requests to
  Docker Model Runner.
@z

@x
- `OPENAI_MODEL_NAME`: When falling back to Model Runner, the model is prefixed
  with `openai/` so the client picks up the right model alias.
@y
- `OPENAI_MODEL_NAME`: When falling back to Model Runner, the model is prefixed
  with `openai/` so the client picks up the right model alias.
@z

@x
Together, these variables let the same ADK web server code seamlessly target either:
@y
Together, these variables let the same ADK web server code seamlessly target either:
@z

@x
- Hosted OpenAI: if you supply `OPENAI_API_KEY` (and optionally `OPENAI_MODEL_NAME`)
- Model Runner: by remapping `MODEL_RUNNER_URL` and `MODEL_RUNNER_MODEL` into the OpenAI clientâ€™s expected variables
@y
- Hosted OpenAI: if you supply `OPENAI_API_KEY` (and optionally `OPENAI_MODEL_NAME`)
- Model Runner: by remapping `MODEL_RUNNER_URL` and `MODEL_RUNNER_MODEL` into the OpenAI clientâ€™s expected variables
@z

@x
## Step 4: Review the application
@y
## Step 4: Review the application
@z

@x
The `adk` web application is an agent implementation that connects to the MCP
gateway and a model through environment variables and API calls. It uses the
[ADK (Agent Development Kit)](https://github.com/google/adk-python) to define a
root agent named Auditor, which coordinates two sub-agents, Critic and Reviser,
to verify and refine model-generated answers.
@y
The `adk` web application is an agent implementation that connects to the MCP
gateway and a model through environment variables and API calls. It uses the
[ADK (Agent Development Kit)](https://github.com/google/adk-python) to define a
root agent named Auditor, which coordinates two sub-agents, Critic and Reviser,
to verify and refine model-generated answers.
@z

@x
The three agents are:
@y
The three agents are:
@z

@x
- Critic: Verifies factual claims using the toolset, such as DuckDuckGo.
- Reviser: Edits answers based on the verification verdicts provided by the Critic.
- Auditor: A higher-level agent that sequences the
  Critic and Reviser. It acts as the entry point, evaluating LLM-generated
  answers, verifying them, and refining the final output.
@y
- Critic: Verifies factual claims using the toolset, such as DuckDuckGo.
- Reviser: Edits answers based on the verification verdicts provided by the Critic.
- Auditor: A higher-level agent that sequences the
  Critic and Reviser. It acts as the entry point, evaluating LLM-generated
  answers, verifying them, and refining the final output.
@z

@x
All of the application's behavior is defined in Python under the `agents/`
directory. Here's a breakdown of the notable files:
@y
All of the application's behavior is defined in Python under the `agents/`
directory. Here's a breakdown of the notable files:
@z

@x
- `agents/agent.py`: Defines the Auditor, a SequentialAgent that chains together
  the Critic and Reviser agents. This agent is the main entry point of the
  application and is responsible for auditing LLM-generated content using
  real-world verification tools.
@y
- `agents/agent.py`: Defines the Auditor, a SequentialAgent that chains together
  the Critic and Reviser agents. This agent is the main entry point of the
  application and is responsible for auditing LLM-generated content using
  real-world verification tools.
@z

@x
- `agents/sub_agents/critic/agent.py`: Defines the Critic agent. It loads the
  language model (via Docker Model Runner), sets the agentâ€™s name and behavior,
  and connects to MCP tools (like DuckDuckGo).
@y
- `agents/sub_agents/critic/agent.py`: Defines the Critic agent. It loads the
  language model (via Docker Model Runner), sets the agentâ€™s name and behavior,
  and connects to MCP tools (like DuckDuckGo).
@z

@x
- `agents/sub_agents/critic/prompt.py`: Contains the Critic prompt, which
  instructs the agent to extract and verify claims using external tools.
@y
- `agents/sub_agents/critic/prompt.py`: Contains the Critic prompt, which
  instructs the agent to extract and verify claims using external tools.
@z

@x
- `agents/sub_agents/critic/tools.py`: Defines the MCP toolset configuration,
  including parsing `mcp/` strings, creating tool connections, and handling MCP
  gateway communication.
@y
- `agents/sub_agents/critic/tools.py`: Defines the MCP toolset configuration,
  including parsing `mcp/` strings, creating tool connections, and handling MCP
  gateway communication.
@z

@x
- `agents/sub_agents/reviser/agent.py`: Defines the Reviser agent, which takes
  the Criticâ€™s findings and minimally rewrites the original answer. It also
  includes callbacks to clean up the LLM output and ensure it's in the right
  format.
@y
- `agents/sub_agents/reviser/agent.py`: Defines the Reviser agent, which takes
  the Criticâ€™s findings and minimally rewrites the original answer. It also
  includes callbacks to clean up the LLM output and ensure it's in the right
  format.
@z

@x
- `agents/sub_agents/reviser/prompt.py`: Contains the Reviser prompt, which
  instructs the agent to revise the answer text based on the verified claim
  verdicts.
@y
- `agents/sub_agents/reviser/prompt.py`: Contains the Reviser prompt, which
  instructs the agent to revise the answer text based on the verified claim
  verdicts.
@z

@x
The MCP gateway is configured via the `MCPGATEWAY_ENDPOINT` environment
variable. In this case, `http://mcp-gateway:8811/sse`. This allows the app to
use Server-Sent Events (SSE) to communicate with the MCP gateway container,
which itself brokers access to external tool services like DuckDuckGo.
@y
The MCP gateway is configured via the `MCPGATEWAY_ENDPOINT` environment
variable. In this case, `http://mcp-gateway:8811/sse`. This allows the app to
use Server-Sent Events (SSE) to communicate with the MCP gateway container,
which itself brokers access to external tool services like DuckDuckGo.
@z

@x
## Summary
@y
## Summary
@z

@x
Agent-based AI applications are emerging as a powerful new software
architecture. In this guide, you explored a modular, chain-of-thought system
where an Auditor agent coordinates the work of a Critic and a Reviser to
fact-check and refine model-generated answers. This architecture shows how to
combine local model inference with external tool integrations in a structured,
modular way.
@y
Agent-based AI applications are emerging as a powerful new software
architecture. In this guide, you explored a modular, chain-of-thought system
where an Auditor agent coordinates the work of a Critic and a Reviser to
fact-check and refine model-generated answers. This architecture shows how to
combine local model inference with external tool integrations in a structured,
modular way.
@z

@x
You also saw how Docker simplifies this process by providing a suite of tools
that support agentic AI development:
@y
You also saw how Docker simplifies this process by providing a suite of tools
that support agentic AI development:
@z

@x
- [Docker Model Runner](../manuals/ai/model-runner/_index.md): Run and serve
  open-source models locally via OpenAI-compatible APIs.
- [Docker MCP Catalog and
  Toolkit](../manuals/ai/mcp-catalog-and-toolkit/_index.md): Launch and manage
  tool integrations that follow the Model Context Protocol (MCP) standard.
- [Docker MCP Gateway](../manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md): Orchestrate and manage
  MCP servers to connect agents to external tools and services.
- [Docker Compose](/manuals/ai/compose/models-and-compose.md): Define and run
  multi-container agentic AI applications with a single file, using the same
  workflow.
@y
- [Docker Model Runner](../manuals/ai/model-runner/_index.md): Run and serve
  open-source models locally via OpenAI-compatible APIs.
- [Docker MCP Catalog and
  Toolkit](../manuals/ai/mcp-catalog-and-toolkit/_index.md): Launch and manage
  tool integrations that follow the Model Context Protocol (MCP) standard.
- [Docker MCP Gateway](../manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md): Orchestrate and manage
  MCP servers to connect agents to external tools and services.
- [Docker Compose](manuals/ai/compose/models-and-compose.md): Define and run
  multi-container agentic AI applications with a single file, using the same
  workflow.
@z

@x
With these tools, you can develop and test agentic AI applications efficiently,
using the same consistent workflow throughout.
@y
With these tools, you can develop and test agentic AI applications efficiently,
using the same consistent workflow throughout.
@z
