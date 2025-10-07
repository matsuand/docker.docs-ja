%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model run
short: Run a model and interact with it using a submitted prompt or chat mode
long: |-
    When you run a model, Docker calls an inference server API endpoint hosted by the Model Runner through Docker Desktop. The model stays in memory until another model is requested, or until a pre-defined inactivity timeout is reached (currently 5 minutes).
@y
command: docker model run
short: Run a model and interact with it using a submitted prompt or chat mode
long: |-
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
usage: docker model run MODEL [PROMPT]
@y
usage: docker model run MODEL [PROMPT]
@z

% options:

@x backend
      description: Specify the backend to use (llama.cpp, openai)
@y
      description: Specify the backend to use (llama.cpp, openai)
@z

@x color
      description: Use colored output (auto|yes|no)
@y
      description: Use colored output (auto|yes|no)
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x ignore-runtime-memory-check
      description: |
        Do not block pull if estimated runtime memory for model exceeds system resources.
@y
      description: |
        Do not block pull if estimated runtime memory for model exceeds system resources.
@z

@x
examples: |-
    ### One-time prompt
@y
examples: |-
    ### One-time prompt
@z

% snip command...

@x
    Output:
@y
    Output:
@z

% snip output...

@x
    ### Interactive chat
@y
    ### Interactive chat
@z

% snip command...

@x
    Output:
@y
    Output:
@z

% snip output...

% snip directives...
