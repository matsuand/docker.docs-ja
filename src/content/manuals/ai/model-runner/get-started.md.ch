%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get started with DMR
description: How to install, enable, and use Docker Model Runner to manage and run AI models.
@y
title: Get started with DMR
description: How to install, enable, and use Docker Model Runner to manage and run AI models.
@z

@x
keywords: Docker, ai, model runner, setup, installation, getting started
@y
keywords: Docker, ai, model runner, setup, installation, getting started
@z

@x
Get started with [Docker Model Runner](_index.md).
@y
Get started with [Docker Model Runner](_index.md).
@z

@x
## Enable Docker Model Runner
@y
## Enable Docker Model Runner
@z

@x
### Enable DMR in Docker Desktop
@y
### Enable DMR in Docker Desktop
@z

@x
1. In the settings view, go to the **AI** tab.
1. Select the **Enable Docker Model Runner** setting.
1. If you use Windows with a supported NVIDIA GPU, you also see and can select
   **Enable GPU-backed inference**.
1. Optional: To enable TCP support, select **Enable host-side TCP support**.
   1. In the **Port** field, type the port you want to use.
   1. If you interact with Model Runner from a local frontend web app, in
      **CORS Allows Origins**, select the origins that Model Runner should
      accept requests from. An origin is the URL where your web app runs, for
      example `http://localhost:3131`.
@y
1. In the settings view, go to the **AI** tab.
1. Select the **Enable Docker Model Runner** setting.
1. If you use Windows with a supported NVIDIA GPU, you also see and can select
   **Enable GPU-backed inference**.
1. Optional: To enable TCP support, select **Enable host-side TCP support**.
   1. In the **Port** field, type the port you want to use.
   1. If you interact with Model Runner from a local frontend web app, in
      **CORS Allows Origins**, select the origins that Model Runner should
      accept requests from. An origin is the URL where your web app runs, for
      example `http://localhost:3131`.
@z

@x
You can now use the `docker model` command in the CLI and view and interact
with your local models in the **Models** tab in the Docker Desktop Dashboard.
@y
You can now use the `docker model` command in the CLI and view and interact
with your local models in the **Models** tab in the Docker Desktop Dashboard.
@z

@x
> [!IMPORTANT]
>
> For Docker Desktop versions 4.45 and earlier, this setting was under the
> **Beta features** tab.
@y
> [!IMPORTANT]
>
> For Docker Desktop versions 4.45 and earlier, this setting was under the
> **Beta features** tab.
@z

@x
### Enable DMR in Docker Engine
@y
### Enable DMR in Docker Engine
@z

@x
1. Ensure you have installed [Docker Engine](/engine/install/).
1. Docker Model Runner is available as a package. To install it, run:
@y
1. Ensure you have installed [Docker Engine](__SUBDIR__/engine/install/).
1. Docker Model Runner is available as a package. To install it, run:
@z

@x
   {{< tabs >}}
   {{< tab name="Ubuntu/Debian">}}
@y
   {{< tabs >}}
   {{< tab name="Ubuntu/Debian">}}
@z

@x
   ```bash
   $ sudo apt-get update
   $ sudo apt-get install docker-model-plugin
   ```
@y
   ```bash
   $ sudo apt-get update
   $ sudo apt-get install docker-model-plugin
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="RPM-base distributions">}}
@y
   {{< /tab >}}
   {{< tab name="RPM-base distributions">}}
@z

@x
   ```bash
   $ sudo dnf update
   $ sudo dnf install docker-model-plugin
   ```
@y
   ```bash
   $ sudo dnf update
   $ sudo dnf install docker-model-plugin
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
1. Test the installation:
@y
1. Test the installation:
@z

@x
   ```bash
   $ docker model version
   $ docker model run ai/smollm2
   ```
@y
   ```bash
   $ docker model version
   $ docker model run ai/smollm2
   ```
@z

@x
> [!NOTE]
> TCP support is enabled by default for Docker Engine on port `12434`.
@y
> [!NOTE]
> TCP support is enabled by default for Docker Engine on port `12434`.
@z

@x
### Update DMR in Docker Engine
@y
### Update DMR in Docker Engine
@z

@x
To update Docker Model Runner in Docker Engine, uninstall it with
[`docker model uninstall-runner`](/reference/cli/docker/model/uninstall-runner/)
then reinstall it:
@y
To update Docker Model Runner in Docker Engine, uninstall it with
[`docker model uninstall-runner`](__SUBDIR__/reference/cli/docker/model/uninstall-runner/)
then reinstall it:
@z

@x
```bash
docker model uninstall-runner --images && docker model install-runner
```
@y
```bash
docker model uninstall-runner --images && docker model install-runner
```
@z

@x
> [!NOTE]
> With the above command, local models are preserved.
> To delete the models during the upgrade, add the `--models` option to the
> `uninstall-runner` command.
@y
> [!NOTE]
> With the above command, local models are preserved.
> To delete the models during the upgrade, add the `--models` option to the
> `uninstall-runner` command.
@z

@x
## Pull a model
@y
## Pull a model
@z

@x
Models are cached locally.
@y
Models are cached locally.
@z

@x
> [!NOTE]
>
> When you use the Docker CLI, you can also pull models directly from
> [HuggingFace](https://huggingface.co/).
@y
> [!NOTE]
>
> When you use the Docker CLI, you can also pull models directly from
> [HuggingFace](https://huggingface.co/).
@z

@x
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@y
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@z

@x
1. Select **Models** and select the **Docker Hub** tab.
1. Find the model you want and select **Pull**.
@y
1. Select **Models** and select the **Docker Hub** tab.
1. Find the model you want and select **Pull**.
@z

@x
![Screenshot showing the Docker Hub view.](./images/dmr-catalog.png)
@y
![Screenshot showing the Docker Hub view.](./images/dmr-catalog.png)
@z

@x
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@y
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@z

@x
Use the [`docker model pull` command](/reference/cli/docker/model/pull/).
For example:
@y
Use the [`docker model pull` command](__SUBDIR__/reference/cli/docker/model/pull/).
For example:
@z

@x
```bash {title="Pulling from Docker Hub"}
docker model pull ai/smollm2:360M-Q4_K_M
```
@y
```bash {title="Pulling from Docker Hub"}
docker model pull ai/smollm2:360M-Q4_K_M
```
@z

@x
```bash {title="Pulling from HuggingFace"}
docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF
```
@y
```bash {title="Pulling from HuggingFace"}
docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Run a model
@y
## Run a model
@z

@x
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@y
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@z

@x
1. Select **Models** and select the **Local** tab.
1. Select the play button. The interactive chat screen opens.
@y
1. Select **Models** and select the **Local** tab.
1. Select the play button. The interactive chat screen opens.
@z

@x
![Screenshot showing the Local view.](./images/dmr-run.png)
@y
![Screenshot showing the Local view.](./images/dmr-run.png)
@z

@x
{{< /tab >}}
{{< tab name="From the Docker CLI" >}}
@y
{{< /tab >}}
{{< tab name="From the Docker CLI" >}}
@z

@x
Use the [`docker model run` command](/reference/cli/docker/model/run/).
@y
Use the [`docker model run` command](__SUBDIR__/reference/cli/docker/model/run/).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure a model
@y
## Configure a model
@z

@x
You can configure a model, such as its maximum token limit and more,
use Docker Compose.
See [Models and Compose - Model configuration options](../compose/models-and-compose.md#model-configuration-options).
@y
You can configure a model, such as its maximum token limit and more,
use Docker Compose.
See [Models and Compose - Model configuration options](../compose/models-and-compose.md#model-configuration-options).
@z

@x
## Publish a model
@y
## Publish a model
@z

@x
> [!NOTE]
>
> This works for any Container Registry supporting OCI Artifacts, not only
> Docker Hub.
@y
> [!NOTE]
>
> This works for any Container Registry supporting OCI Artifacts, not only
> Docker Hub.
@z

@x
You can tag existing models with a new name and publish them under a different
namespace and repository:
@y
You can tag existing models with a new name and publish them under a different
namespace and repository:
@z

@x
```bash
# Tag a pulled model under a new name
$ docker model tag ai/smollm2 myorg/smollm2
@y
```bash
# Tag a pulled model under a new name
$ docker model tag ai/smollm2 myorg/smollm2
@z

@x
# Push it to Docker Hub
$ docker model push myorg/smollm2
```
@y
# Push it to Docker Hub
$ docker model push myorg/smollm2
```
@z

@x
For more details, see the [`docker model tag`](/reference/cli/docker/model/tag)
and [`docker model push`](/reference/cli/docker/model/push) command
documentation.
@y
For more details, see the [`docker model tag`](__SUBDIR__/reference/cli/docker/model/tag)
and [`docker model push`](__SUBDIR__/reference/cli/docker/model/push) command
documentation.
@z

@x
You can also package a model file in GGUF format as an OCI Artifact and publish
it to Docker Hub.
@y
You can also package a model file in GGUF format as an OCI Artifact and publish
it to Docker Hub.
@z

@x
```bash
# Download a model file in GGUF format, for example from HuggingFace
$ curl -L -o model.gguf https://huggingface.co/TheBloke/Mistral-7B-v0.1-GGUF/resolve/main/mistral-7b-v0.1.Q4_K_M.gguf
@y
```bash
# Download a model file in GGUF format, for example from HuggingFace
$ curl -L -o model.gguf https://huggingface.co/TheBloke/Mistral-7B-v0.1-GGUF/resolve/main/mistral-7b-v0.1.Q4_K_M.gguf
@z

@x
# Package it as OCI Artifact and push it to Docker Hub
$ docker model package --gguf "$(pwd)/model.gguf" --push myorg/mistral-7b-v0.1:Q4_K_M
```
@y
# Package it as OCI Artifact and push it to Docker Hub
$ docker model package --gguf "$(pwd)/model.gguf" --push myorg/mistral-7b-v0.1:Q4_K_M
```
@z

@x
For more details, see the
[`docker model package`](/reference/cli/docker/model/package/) command
documentation.
@y
For more details, see the
[`docker model package`](__SUBDIR__/reference/cli/docker/model/package/) command
documentation.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Display the logs
@y
### Display the logs
@z

@x
To troubleshoot issues, display the logs:
@y
To troubleshoot issues, display the logs:
@z

@x
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@y
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@z

@x
Select **Models** and select the **Logs** tab.
@y
Select **Models** and select the **Logs** tab.
@z

@x
![Screenshot showing the Models view.](./images/dmr-logs.png)
@y
![Screenshot showing the Models view.](./images/dmr-logs.png)
@z

@x
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@y
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@z

@x
Use the [`docker model logs` command](/reference/cli/docker/model/logs/).
@y
Use the [`docker model logs` command](__SUBDIR__/reference/cli/docker/model/logs/).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Inspect requests and responses
@y
### Inspect requests and responses
@z

@x
Inspecting requests and responses helps you diagnose model-related issues.
For example, you can evaluate context usage to verify you stay within the model's context
window or display the full body of a request to control the parameters you are passing to your models
when developing with a framework.
@y
Inspecting requests and responses helps you diagnose model-related issues.
For example, you can evaluate context usage to verify you stay within the model's context
window or display the full body of a request to control the parameters you are passing to your models
when developing with a framework.
@z

@x
In Docker Desktop, to inspect the requests and responses for each model:
@y
In Docker Desktop, to inspect the requests and responses for each model:
@z

@x
1. Select **Models** and select the **Requests** tab. This view displays all the requests to all models:
   - The time the request was sent.
   - The model name and version
   - The prompt/request
   - The context usage
   - The time it took for the response to be generated.
1. Select one of the requests to display further details:
   - In the **Overview** tab, view the token usage, response metadata and generation speed, and the actual prompt and response.
   - In the **Request**  and **Response** tabs, view the full JSON payload of the request and the response.
@y
1. Select **Models** and select the **Requests** tab. This view displays all the requests to all models:
   - The time the request was sent.
   - The model name and version
   - The prompt/request
   - The context usage
   - The time it took for the response to be generated.
1. Select one of the requests to display further details:
   - In the **Overview** tab, view the token usage, response metadata and generation speed, and the actual prompt and response.
   - In the **Request**  and **Response** tabs, view the full JSON payload of the request and the response.
@z

@x
> [!NOTE]
> You can also display the requests for a specific model when you select a model and then select the **Requests** tab.
@y
> [!NOTE]
> You can also display the requests for a specific model when you select a model and then select the **Requests** tab.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Interact with your model programmatically](./api-reference.md)
- [Models and Compose](../compose/models-and-compose.md)
- [Docker Model Runner CLI reference documentation](/reference/cli/docker/model)
@y
- [Interact with your model programmatically](./api-reference.md)
- [Models and Compose](../compose/models-and-compose.md)
- [Docker Model Runner CLI reference documentation](__SUBDIR__/reference/cli/docker/model)
@z
