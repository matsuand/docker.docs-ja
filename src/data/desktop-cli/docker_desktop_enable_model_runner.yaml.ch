%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker desktop enable model-runner
short: Manage Docker Model Runner settings
long: Enable and manage Docker Model Runner settings used by 'docker model'
usage: docker desktop enable model-runner [OPTIONS]
@y
command: docker desktop enable model-runner
short: Manage Docker Model Runner settings
long: Enable and manage Docker Model Runner settings used by 'docker model'
usage: docker desktop enable model-runner [OPTIONS]
@z

% options:

@x no-tcp
      description: Disable TCP connection. Cannot be used with --tcp.
@y
      description: Disable TCP connection. Cannot be used with --tcp.
@z

@x tcp
      description: |
        Enable or change TCP port for connection (1-65535). Cannot be used with --no-tcp.
@y
      description: |
@z

@x cors
      description: CORS configuration. Can be `all`, `none`, or comma-separated list of allowed origins.
@y
      description: CORS configuration. Can be `all`, `none`, or comma-separated list of allowed origins.
@z

@x gpu
      description: Enable GPU support for Model Runner (Windows only).
@y
      description: Enable GPU support for Model Runner (Windows only).
@z

% snip directives...
