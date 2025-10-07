%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker model pull
@y
# docker model pull
@z

@x
<!---MARKER_GEN_START-->
Pull a model from Docker Hub or HuggingFace to your local environment
@y
<!---MARKER_GEN_START-->
Pull a model from Docker Hub or HuggingFace to your local environment
@z

@x
### Options
@y
### Options
@z

@x
| Name                            | Type   | Default | Description                                                                       |
|:--------------------------------|:-------|:--------|:----------------------------------------------------------------------------------|
| `--ignore-runtime-memory-check` | `bool` |         | Do not block pull if estimated runtime memory for model exceeds system resources. |
@y
| Name                            | Type   | Default | Description                                                                       |
|:--------------------------------|:-------|:--------|:----------------------------------------------------------------------------------|
| `--ignore-runtime-memory-check` | `bool` |         | Do not block pull if estimated runtime memory for model exceeds system resources. |
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
Pull a model to your local environment. Downloaded models also appear in the Docker Desktop Dashboard.
@y
Pull a model to your local environment. Downloaded models also appear in the Docker Desktop Dashboard.
@z

@x
## Examples
@y
## Examples
@z

@x
### Pulling a model from Docker Hub
@y
### Pulling a model from Docker Hub
@z

@x
```console
docker model pull ai/smollm2
```
@y
```console
docker model pull ai/smollm2
```
@z

@x
### Pulling from HuggingFace
@y
### Pulling from HuggingFace
@z

@x
You can pull GGUF models directly from [Hugging Face](https://huggingface.co/models?library=gguf).
@y
You can pull GGUF models directly from [Hugging Face](https://huggingface.co/models?library=gguf).
@z

@x
**Note about quantization:** If no tag is specified, the command tries to pull the `Q4_K_M` version of the model.
If `Q4_K_M` doesn't exist, the command pulls the first GGUF found in the **Files** view of the model on HuggingFace.
To specify the quantization, provide it as a tag, for example:
`docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_S`
@y
**Note about quantization:** If no tag is specified, the command tries to pull the `Q4_K_M` version of the model.
If `Q4_K_M` doesn't exist, the command pulls the first GGUF found in the **Files** view of the model on HuggingFace.
To specify the quantization, provide it as a tag, for example:
`docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_S`
@z

@x
```console
docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF
```
@y
```console
docker model pull hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF
```
@z
