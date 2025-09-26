%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model run
@y
# docker model run
@z

@x
<!---MARKER_GEN_START-->
Run a model and interact with it using a submitted prompt or chat mode
@y
<!---MARKER_GEN_START-->
Run a model and interact with it using a submitted prompt or chat mode
@z

@x
### Options
@y
### Options
@z

@x
| Name                            | Type     | Default | Description                                                                       |
|:--------------------------------|:---------|:--------|:----------------------------------------------------------------------------------|
| `--color`                       | `string` | `auto`  | Use colored output (auto\|yes\|no)                                                |
| `--debug`                       | `bool`   |         | Enable debug logging                                                              |
| `--ignore-runtime-memory-check` | `bool`   |         | Do not block pull if estimated runtime memory for model exceeds system resources. |
@y
| Name                            | Type     | Default | Description                                                                       |
|:--------------------------------|:---------|:--------|:----------------------------------------------------------------------------------|
| `--color`                       | `string` | `auto`  | Use colored output (auto\|yes\|no)                                                |
| `--debug`                       | `bool`   |         | Enable debug logging                                                              |
| `--ignore-runtime-memory-check` | `bool`   |         | Do not block pull if estimated runtime memory for model exceeds system resources. |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
When you run a model, Docker calls an inference server API endpoint hosted by the Model Runner through Docker Desktop. The model stays in memory until another model is requested, or until a pre-defined inactivity timeout is reached (currently 5 minutes).
@y
When you run a model, Docker calls an inference server API endpoint hosted by the Model Runner through Docker Desktop. The model stays in memory until another model is requested, or until a pre-defined inactivity timeout is reached (currently 5 minutes).
@z

@x
You do not have to use Docker model run before interacting with a specific model from a host process or from within a container. Model Runner transparently loads the requested model on-demand, assuming it has been pulled and is locally available.
@y
You do not have to use Docker model run before interacting with a specific model from a host process or from within a container. Model Runner transparently loads the requested model on-demand, assuming it has been pulled and is locally available.
@z

@x
You can also use chat mode in the Docker Desktop Dashboard when you select the model in the **Models** tab.
@y
You can also use chat mode in the Docker Desktop Dashboard when you select the model in the **Models** tab.
@z

@x
## Examples
@y
## Examples
@z

@x
### One-time prompt
@y
### One-time prompt
@z

@x
```console
docker model run ai/smollm2 "Hi"
```
@y
```console
docker model run ai/smollm2 "Hi"
```
@z

@x
Output:
@y
Output:
@z

@x
```console
Hello! How can I assist you today?
```
@y
```console
Hello! How can I assist you today?
```
@z

@x
### Interactive chat
@y
### Interactive chat
@z

@x
```console
docker model run ai/smollm2
```
@y
```console
docker model run ai/smollm2
```
@z

@x
Output:
@y
Output:
@z

@x
```console
Interactive chat mode started. Type '/bye' to exit.
> Hi
Hi there! It's SmolLM, AI assistant. How can I help you today?
> /bye
Chat session ended.
```
@y
```console
Interactive chat mode started. Type '/bye' to exit.
> Hi
Hi there! It's SmolLM, AI assistant. How can I help you today?
> /bye
Chat session ended.
```
@z
