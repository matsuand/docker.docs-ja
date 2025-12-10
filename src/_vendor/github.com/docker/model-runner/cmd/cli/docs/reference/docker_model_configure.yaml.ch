%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model configure
short: Configure runtime options for a model
long: Configure runtime options for a model
usage: docker model configure [--context-size=<n>] [--speculative-draft-model=<model>] [--hf_overrides=<json>] [--reasoning-budget=<n>] MODEL
@y
command: docker model configure
short: Configure runtime options for a model
long: Configure runtime options for a model
usage: docker model configure [--context-size=<n>] [--speculative-draft-model=<model>] [--hf_overrides=<json>] [--reasoning-budget=<n>] MODEL
@z

% options:

@x context-size
      description: context size (in tokens)
@y
      description: context size (in tokens)
@z

@x hf_overrides
      description: HuggingFace model config overrides (JSON) - vLLM only
@y
      description: HuggingFace model config overrides (JSON) - vLLM only
@z

@x reasoning-budget
      description: reasoning budget for reasoning models - llama.cpp only
@y
      description: reasoning budget for reasoning models - llama.cpp only
@z

@x speculative-draft-model
      description: draft model for speculative decoding
@y
      description: draft model for speculative decoding
@z

@x speculative-min-acceptance-rate
      description: minimum acceptance rate for speculative decoding
@y
      description: minimum acceptance rate for speculative decoding
@z

@x speculative-num-tokens
      description: number of tokens to predict speculatively
@y
      description: number of tokens to predict speculatively
@z

% snip directives...
