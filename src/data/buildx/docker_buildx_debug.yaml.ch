%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx debug
short: Start debugger
long: Start debugger
usage: docker buildx debug
@y
command: docker buildx debug
short: デバッガーの開始
long: デバッガーの開始。
usage: docker buildx debug
@z

% cname:
% clink:
% options:

@x detach
      description: Detach buildx server for the monitor (supported only on linux)
@y
      description: Detach buildx server for the monitor (supported only on linux)
@z

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

@x progress
      description: |
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`) for the monitor. Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`) for the monitor. Use plain to show container output
@z

@x root
      description: Specify root directory of server to connect for the monitor
@y
      description: Specify root directory of server to connect for the monitor
@z

@x server-config
      description: |
        Specify buildx server config file for the monitor (used only when launching new server)
@y
      description: |
        Specify buildx server config file for the monitor (used only when launching new server)
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

% snip directives...
