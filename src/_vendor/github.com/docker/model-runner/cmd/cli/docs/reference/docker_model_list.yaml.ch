%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model list
aliases: docker model list, docker model ls
short: List the models pulled to your local environment
long: List the models pulled to your local environment
usage: docker model list [OPTIONS] [MODEL]
@y
command: docker model list
aliases: docker model list, docker model ls
short: List the models pulled to your local environment
long: List the models pulled to your local environment
usage: docker model list [OPTIONS] [MODEL]
@z

% options:

@x json
      description: List models in a JSON format
@y
      description: List models in a JSON format
@z

@x openai
      description: List models in an OpenAI format
@y
      description: List models in an OpenAI format
@z

@x openaiurl
      description: OpenAI-compatible API endpoint URL to list models from
@y
      description: OpenAI-compatible API endpoint URL to list models from
@z

@x quiet
      description: Only show model IDs
@y
      description: Only show model IDs
@z

% snip directives...
