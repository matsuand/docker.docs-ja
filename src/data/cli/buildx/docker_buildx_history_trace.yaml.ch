%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history trace
short: Show the OpenTelemetry trace of a build record
long: |-
    View the OpenTelemetry trace for a completed build. This command loads the
    trace into a Jaeger UI viewer and opens it in your browser.

    This helps analyze build performance, step timing, and internal execution flows.
usage: docker buildx history trace [OPTIONS] [REF]
@y
command: docker buildx history trace
short: Show the OpenTelemetry trace of a build record
long: |-
    View the OpenTelemetry trace for a completed build. This command loads the
    trace into a Jaeger UI viewer and opens it in your browser.

    This helps analyze build performance, step timing, and internal execution flows.
usage: docker buildx history trace [OPTIONS] [REF]
@z

% options:

@x addr
      description: Address to bind the UI server
@y
      description: Address to bind the UI server
@z

@x compare
      description: Compare with another build record
@y
      description: Compare with another build record
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

% snip directives...
