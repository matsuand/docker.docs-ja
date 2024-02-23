%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker context show
short: Print the name of the current context
long: |-
    Print the name of the current context, possibly set by `DOCKER_CONTEXT` environment
    variable or `--context` global option.
usage: docker context show
pname: docker context
plink: docker_context.yaml
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Print the current context
@y
command: docker context show
short: Print the name of the current context
long: |-
    Print the name of the current context, possibly set by `DOCKER_CONTEXT` environment
    variable or `--context` global option.
usage: docker context show
pname: docker context
plink: docker_context.yaml
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Print the current context
@z

@x
    The following example prints the currently used [`docker context`](/reference/cli/docker/context/):
@y
    The following example prints the currently used [`docker context`](__SUBDIR__/reference/cli/docker/context/):
@z

@x
    ```console
    $ docker context show'
    default
    ```
@y
    ```console
    $ docker context show'
    default
    ```
@z

@x
    As an example, this output can be used to dynamically change your shell prompt
    to indicate your active context. The example below illustrates how this output
    could be used when using Bash as your shell.
@y
    As an example, this output can be used to dynamically change your shell prompt
    to indicate your active context. The example below illustrates how this output
    could be used when using Bash as your shell.
@z

@x
    Declare a function to obtain the current context in your `~/.bashrc`, and set
    this command as your `PROMPT_COMMAND`
@y
    Declare a function to obtain the current context in your `~/.bashrc`, and set
    this command as your `PROMPT_COMMAND`
@z

@x
    ```console
    function docker_context_prompt() {
            PS1="context: $(docker context show)> "
    }
@y
    ```console
    function docker_context_prompt() {
            PS1="context: $(docker context show)> "
    }
@z

@x
    PROMPT_COMMAND=docker_context_prompt
    ```
@y
    PROMPT_COMMAND=docker_context_prompt
    ```
@z

@x
    After reloading the `~/.bashrc`, the prompt now shows the currently selected
    `docker context`:
@y
    After reloading the `~/.bashrc`, the prompt now shows the currently selected
    `docker context`:
@z

@x
    ```console
    $ source ~/.bashrc
    context: default> docker context create --docker host=unix:///var/run/docker.sock my-context
    my-context
    Successfully created context "my-context"
    context: default> docker context use my-context
    my-context
    Current context is now "my-context"
    context: my-context> docker context use default
    default
    Current context is now "default"
    context: default>
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ source ~/.bashrc
    context: default> docker context create --docker host=unix:///var/run/docker.sock my-context
    my-context
    Successfully created context "my-context"
    context: default> docker context use my-context
    my-context
    Current context is now "my-context"
    context: my-context> docker context use default
    default
    Current context is now "default"
    context: default>
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
