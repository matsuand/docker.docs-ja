%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context rm
aliases: docker context rm, docker context remove
short: Remove one or more contexts
long: Remove one or more contexts
usage: docker context rm CONTEXT [CONTEXT...]
@y
command: docker context rm
aliases: docker context rm, docker context remove
short: 1 つまたは複数のコンテキストを削除します。
long: 1 つまたは複数のコンテキストを削除します。
usage: docker context rm CONTEXT [CONTEXT...]
@z

% options:

@x force
      description: Force the removal of a context in use
@y
      description: 利用中のコンテキストを強制的に削除します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
