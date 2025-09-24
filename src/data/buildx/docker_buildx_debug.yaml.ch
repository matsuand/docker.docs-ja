%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx debug
short: Start debugger
long: Start debugger
@y
command: docker buildx debug
short: デバッガーの開始
long: デバッガーの開始。
@z

% options:

@x invoke
      description: Launch a monitor with executing specified command
@y
      description: Launch a monitor with executing specified command
@z

@x "on"
      description: When to launch the monitor ([always, error])
@y
      description: When to launch the monitor ([always, error])
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
