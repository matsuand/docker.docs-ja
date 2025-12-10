%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model bench
short: Benchmark a model's performance at different concurrency levels
long: |-
    Benchmark a model's performance showing tokens per second at different concurrency levels.

    This command runs a series of benchmarks with 1, 2, 4, and 8 concurrent requests by default,
    measuring the tokens per second (TPS) that the model can generate.
@y
command: docker model bench
short: Benchmark a model's performance at different concurrency levels
long: |-
    Benchmark a model's performance showing tokens per second at different concurrency levels.

    This command runs a series of benchmarks with 1, 2, 4, and 8 concurrent requests by default,
    measuring the tokens per second (TPS) that the model can generate.
@z

@x
usage: docker model bench [MODEL]
@y
usage: docker model bench [MODEL]
@z

% options:

@x concurrency
      description: Concurrency levels to test
@y
      description: Concurrency levels to test
@z

@x duration
      description: Duration to run each concurrency test
@y
      description: Duration to run each concurrency test
@z

@x json
      description: Output results in JSON format
@y
      description: Output results in JSON format
@z

@x prompt
      description: Prompt to use for benchmarking
@y
      description: Prompt to use for benchmarking
@z

@x timeout
      description: Timeout for each individual request
@y
      description: Timeout for each individual request
@z

% snip directives...
