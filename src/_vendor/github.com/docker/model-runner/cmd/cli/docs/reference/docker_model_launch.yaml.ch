%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker model launch
short: Launch an app configured to use Docker Model Runner
long: |-
    Launch an app configured to use Docker Model Runner.
@y
command: docker model launch
short: Launch an app configured to use Docker Model Runner
long: |-
    Launch an app configured to use Docker Model Runner.
@z

@x
    Without arguments, lists all supported apps.
@y
    Without arguments, lists all supported apps.
@z

@x
    Supported apps: anythingllm, claude, codex, openclaw, opencode, openwebui
@y
    Supported apps: anythingllm, claude, codex, openclaw, opencode, openwebui
@z

@x
    Examples:
      docker model launch
      docker model launch opencode
      docker model launch claude -- --help
      docker model launch openwebui --port 3000
      docker model launch claude --config
@y
    Examples:
      docker model launch
      docker model launch opencode
      docker model launch claude -- --help
      docker model launch openwebui --port 3000
      docker model launch claude --config
@z

@x
usage: docker model launch [APP] [-- APP_ARGS...]
@y
usage: docker model launch [APP] [-- APP_ARGS...]
@z

% pname
% plink
% options

@x config
      description: Print configuration without launching
@y
      description: Print configuration without launching
@z

@x detach
      description: Run containerized app in background
@y
      description: Run containerized app in background
@z

@x dry-run
      description: Print what would be executed without running it
@y
      description: Print what would be executed without running it
@z

@x image
      description: Override container image for containerized apps
@y
      description: Override container image for containerized apps
@z

@x model
      description: Model to use (for opencode)
@y
      description: Model to use (for opencode)
@z

@x port
      description: Host port to expose (web UIs)
@y
      description: Host port to expose (web UIs)
@z

% snip directives...
