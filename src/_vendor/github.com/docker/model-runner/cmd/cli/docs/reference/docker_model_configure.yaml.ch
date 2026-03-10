%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model configure
@y
command: docker model configure
@z

@x
short: Manage model runtime configurations
long: Manage model runtime configurations
usage: docker model configure [--context-size=<n>] [--speculative-draft-model=<model>] [--hf_overrides=<json>] [--gpu-memory-utilization=<float>] [--mode=<mode>] [--think] [--keep-alive=<duration>] MODEL [-- <runtime-flags...>]
@y
short: Manage model runtime configurations
long: Manage model runtime configurations
usage: docker model configure [--context-size=<n>] [--speculative-draft-model=<model>] [--hf_overrides=<json>] [--gpu-memory-utilization=<float>] [--mode=<mode>] [--think] [--keep-alive=<duration>] MODEL [-- <runtime-flags...>]
@z

% cname
% clink
% options

@x context-size
      description: context size (in tokens)
@y
      description: context size (in tokens)
@z

@x gpu-memory-utilization
      description: |
        fraction of GPU memory to use for the model executor (0.0-1.0) - vLLM only
@y
      description: |
        fraction of GPU memory to use for the model executor (0.0-1.0) - vLLM only
@z

@x hf_overrides
      description: HuggingFace model config overrides (JSON) - vLLM only
@y
      description: HuggingFace model config overrides (JSON) - vLLM only
@z

@x keep-alive
      description: |
        duration to keep model loaded (e.g., '5m', '1h', '0' to unload immediately, '-1' to never unload)
@y
      description: |
        duration to keep model loaded (e.g., '5m', '1h', '0' to unload immediately, '-1' to never unload)
@z

@x mode
      description: |
        backend operation mode (completion, embedding, reranking, image-generation)
@y
      description: |
        backend operation mode (completion, embedding, reranking, image-generation)
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

@x think
      description: enable reasoning mode for thinking models
@y
      description: enable reasoning mode for thinking models
@z

% snip directives...
