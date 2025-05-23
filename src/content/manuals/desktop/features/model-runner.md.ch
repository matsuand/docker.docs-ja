%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Docker Model Runner
@y
title: Docker Model Runner
@z

@x
description: Learn how to use Docker Model Runner to manage and run AI models. 
keywords: Docker, ai, model runner, docker deskotp, llm
@y
description: Learn how to use Docker Model Runner to manage and run AI models. 
keywords: Docker, ai, model runner, docker deskotp, llm
@z

@x
{{< summary-bar feature_name="Docker Model Runner" >}}
@y
{{< summary-bar feature_name="Docker Model Runner" >}}
@z

@x
The Docker Model Runner plugin lets you:
@y
The Docker Model Runner plugin lets you:
@z

@x
- [Pull models from Docker Hub](https://hub.docker.com/u/ai)
- Run AI models directly from the command line
- Manage local models (add, list, remove)
- Interact with models using a submitted prompt or in chat mode in the CLI or Docker Desktop Dashboard
- Push models to Docker Hub
@y
- [Pull models from Docker Hub](https://hub.docker.com/u/ai)
- Run AI models directly from the command line
- Manage local models (add, list, remove)
- Interact with models using a submitted prompt or in chat mode in the CLI or Docker Desktop Dashboard
- Push models to Docker Hub
@z

@x
Models are pulled from Docker Hub the first time they're used and stored locally. They're loaded into memory only at runtime when a request is made, and unloaded when not in use to optimize resources. Since models can be large, the initial pull may take some time — but after that, they're cached locally for faster access. You can interact with the model using [OpenAI-compatible APIs](#what-api-endpoints-are-available).
@y
Models are pulled from Docker Hub the first time they're used and stored locally. They're loaded into memory only at runtime when a request is made, and unloaded when not in use to optimize resources. Since models can be large, the initial pull may take some time — but after that, they're cached locally for faster access. You can interact with the model using [OpenAI-compatible APIs](#what-api-endpoints-are-available).
@z

@x
> [!TIP]
>
> Using Testcontainers or Docker Compose? [Testcontainers for Java](https://java.testcontainers.org/modules/docker_model_runner/) and [Go](https://golang.testcontainers.org/modules/dockermodelrunner/), and [Docker Compose](/manuals/compose/how-tos/model-runner.md) now support Docker Model Runner.
@y
> [!TIP]
>
> Using Testcontainers or Docker Compose? [Testcontainers for Java](https://java.testcontainers.org/modules/docker_model_runner/) and [Go](https://golang.testcontainers.org/modules/dockermodelrunner/), and [Docker Compose](manuals/compose/how-tos/model-runner.md) now support Docker Model Runner.
@z

@x
## Enable Docker Model Runner
@y
## Enable Docker Model Runner
@z

@x
1. Navigate to the **Features in development** tab in settings.
2. Under the **Experimental features** tab, select **Access experimental features**.
3. Select **Apply and restart**. 
4. Quit and reopen Docker Desktop to ensure the changes take effect. 
5. Open the **Settings** view in Docker Desktop.
6. Navigate to **Features in development**.
7. From the **Beta** tab, check the **Enable Docker Model Runner** setting.
@y
1. Navigate to the **Features in development** tab in settings.
2. Under the **Experimental features** tab, select **Access experimental features**.
3. Select **Apply and restart**. 
4. Quit and reopen Docker Desktop to ensure the changes take effect. 
5. Open the **Settings** view in Docker Desktop.
6. Navigate to **Features in development**.
7. From the **Beta** tab, check the **Enable Docker Model Runner** setting.
@z

@x
## Available commands
@y
## Available commands
@z

@x
### Model runner status
@y
### Model runner status
@z

@x
Check whether the Docker Model Runner is active:
@y
Check whether the Docker Model Runner is active:
@z

% snip command...

@x
### View all commands
@y
### View all commands
@z

@x
Displays help information and a list of available subcommands.
@y
Displays help information and a list of available subcommands.
@z

% snip command...

@x
Output:
@y
Output:
@z

% snip output...

@x
### Pull a model 
@y
### Pull a model 
@z

@x
Pulls a model from Docker Hub to your local environment.
@y
Pulls a model from Docker Hub to your local environment.
@z

% snip command...

@x
Example: 
@y
Example: 
@z

% snip command...

@x
Output:
@y
Output:
@z

% snip output...

@x
### List available models
@y
### List available models
@z

@x
Lists all models currently pulled to your local environment.
@y
Lists all models currently pulled to your local environment.
@z

% snip command...

@x
You will see something similar to:
@y
You will see something similar to:
@z

% snip output...

@x
### Run a model
@y
### Run a model
@z

@x
Run a model and interact with it using a submitted prompt or in chat mode.
@y
Run a model and interact with it using a submitted prompt or in chat mode.
@z

@x
#### One-time prompt
@y
#### One-time prompt
@z

% snip command...

@x
Output:
@y
Output:
@z

% snip output...

@x
#### Interactive chat
@y
#### Interactive chat
@z

% snip command...

@x
Output:
@y
Output:
@z

% snip output...

@x
### Remove a model
@y
### Remove a model
@z

@x
Removes a downloaded model from your system.
@y
Removes a downloaded model from your system.
@z

% snip command...

@x
Output:
@y
Output:
@z

% snip output...

@x
## Integrate the Docker Model Runner into your software development lifecycle
@y
## Integrate the Docker Model Runner into your software development lifecycle
@z

@x
You can now start building your Generative AI application powered by the Docker Model Runner.
@y
You can now start building your Generative AI application powered by the Docker Model Runner.
@z

@x
If you want to try an existing GenAI application, follow these instructions.
@y
If you want to try an existing GenAI application, follow these instructions.
@z

@x
1. Set up the sample app. Clone and run the following repository:
@y
1. Set up the sample app. Clone and run the following repository:
@z

% snip command...

@x
2. In your terminal, navigate to the `hello-genai` directory.
@y
2. In your terminal, navigate to the `hello-genai` directory.
@z

@x
3. Run `run.sh` for pulling the chosen model and run the app(s):
@y
3. Run `run.sh` for pulling the chosen model and run the app(s):
@z

@x
4. Open you app in the browser at the addresses specified in the repository [README](https://github.com/docker/hello-genai).
@y
4. Open you app in the browser at the addresses specified in the repository [README](https://github.com/docker/hello-genai).
@z

@x
You'll see the GenAI app's interface where you can start typing your prompts. 
@y
You'll see the GenAI app's interface where you can start typing your prompts. 
@z

@x
You can now interact with your own GenAI app, powered by a local model. Try a few prompts and notice how fast the responses are — all running on your machine with Docker.
@y
You can now interact with your own GenAI app, powered by a local model. Try a few prompts and notice how fast the responses are — all running on your machine with Docker.
@z

@x
## FAQs
@y
## FAQs
@z

@x
### What models are available?
@y
### What models are available?
@z

@x
All the available models are hosted in the [public Docker Hub namespace of `ai`](https://hub.docker.com/u/ai). 
@y
All the available models are hosted in the [public Docker Hub namespace of `ai`](https://hub.docker.com/u/ai). 
@z

@x
### What API endpoints are available?
@y
### What API endpoints are available?
@z

@x
Once the feature is enabled, the following new APIs are available:
@y
Once the feature is enabled, the following new APIs are available:
@z

% snip output...

@x
### How do I interact through the OpenAI API?
@y
### How do I interact through the OpenAI API?
@z

@x
#### From within a container
@y
#### From within a container
@z

@x
Examples of calling an OpenAI endpoint (`chat/completions`) from within another container using `curl`:
@y
Examples of calling an OpenAI endpoint (`chat/completions`) from within another container using `curl`:
@z

% snip code...

@x
#### From the host using a Unix socket
@y
#### From the host using a Unix socket
@z

@x
Examples of calling an OpenAI endpoint (`chat/completions`) through the Docker socket from the host using `curl`:
@y
Examples of calling an OpenAI endpoint (`chat/completions`) through the Docker socket from the host using `curl`:
@z

% snip code...

@x
#### From the host using TCP
@y
#### From the host using TCP
@z

@x
In case you want to interact with the API from the host, but use TCP instead of a Docker socket, you can enable the host-side TCP support from the Docker Desktop GUI, or via the [Docker Desktop CLI](/manuals/desktop/features/desktop-cli.md). For example, using `docker desktop enable model-runner --tcp <port>`.
@y
In case you want to interact with the API from the host, but use TCP instead of a Docker socket, you can enable the host-side TCP support from the Docker Desktop GUI, or via the [Docker Desktop CLI](manuals/desktop/features/desktop-cli.md). For example, using `docker desktop enable model-runner --tcp <port>`.
@z

@x
Afterwards, interact with it as previously documented using `localhost` and the chosen, or the default port.
@y
Afterwards, interact with it as previously documented using `localhost` and the chosen, or the default port.
@z

% snip code...

@x
## Known issues
@y
## Known issues
@z

@x
### `docker model` is not recognised
@y
### `docker model` is not recognised
@z

@x
If you run a Docker Model Runner command and see:
@y
If you run a Docker Model Runner command and see:
@z

% snip output...

@x
It means Docker can't find the plugin because it's not in the expected CLI plugins directory.
@y
It means Docker can't find the plugin because it's not in the expected CLI plugins directory.
@z

@x
To fix this, create a symlink so Docker can detect it:
@y
To fix this, create a symlink so Docker can detect it:
@z

% snip command...

@x
Once linked, re-run the command.
@y
Once linked, re-run the command.
@z

@x
### No safeguard for running oversized models
@y
### No safeguard for running oversized models
@z

@x
Currently, Docker Model Runner doesn't include safeguards to prevent you from launching models that exceed their system’s available resources. Attempting to run a model that is too large for the host machine may result in severe slowdowns or render the system temporarily unusable. This issue is particularly common when running LLMs models without sufficient GPU memory or system RAM. 
@y
Currently, Docker Model Runner doesn't include safeguards to prevent you from launching models that exceed their system’s available resources. Attempting to run a model that is too large for the host machine may result in severe slowdowns or render the system temporarily unusable. This issue is particularly common when running LLMs models without sufficient GPU memory or system RAM. 
@z

@x
### No consistent digest support in Model CLI
@y
### No consistent digest support in Model CLI
@z

@x
The Docker Model CLI currently lacks consistent support for specifying models by image digest. As a temporary workaround, you should refer to models by name instead of digest.
@y
The Docker Model CLI currently lacks consistent support for specifying models by image digest. As a temporary workaround, you should refer to models by name instead of digest.
@z

@x
## Share feedback
@y
## Share feedback
@z

@x
Thanks for trying out Docker Model Runner. Give feedback or report any bugs you may find through the **Give feedback** link next to the **Enable Docker Model Runner** setting. 
@y
Thanks for trying out Docker Model Runner. Give feedback or report any bugs you may find through the **Give feedback** link next to the **Enable Docker Model Runner** setting. 
@z

@x
## Disable the feature
@y
## Disable the feature
@z

@x
To disable Docker Model Runner:
@y
To disable Docker Model Runner:
@z

@x
1. Open the **Settings** view in Docker Desktop.
2. Navigate to the **Beta** tab in **Features in development**.
3. Clear the **Enable Docker Model Runner** checkbox.
4. Select **Apply & restart**.
@y
1. Open the **Settings** view in Docker Desktop.
2. Navigate to the **Beta** tab in **Features in development**.
3. Clear the **Enable Docker Model Runner** checkbox.
4. Select **Apply & restart**.
@z
