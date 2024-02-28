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
@y
command: docker context show
short: カレントなコンテキスト名を表示します。
long: |-
    カレントなコンテキスト名を表示します。
    そのコンテキスト名は、通常は環境変数 `DOCKER_CONTEXT` に設定されるか、グローバルオプション `--context` にて設定されます。
usage: docker context show
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Print the current context
@y
examples: |-
    ### カレントなコンテキストの表示 {#print-the-current-context}
@z

@x
    The following example prints the currently used [`docker context`](/reference/cli/docker/context/):
@y
    以下の例は [`docker context`](__SUBDIR__/reference/cli/docker/context/) が利用しているカレントなコンテキストを出力します。
@z

% snip command...

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

% snip command...

@x
    After reloading the `~/.bashrc`, the prompt now shows the currently selected
    `docker context`:
@y
    After reloading the `~/.bashrc`, the prompt now shows the currently selected
    `docker context`:
@z

% snip command...

% snip directives...
