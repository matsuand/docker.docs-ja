%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
@y
command: docker container commit
aliases: docker container commit, docker commit
short: コンテナーの変更内容からイメージを新たに生成します。
@z

@x
long: |-
    It can be useful to commit a container's file changes or settings into a new
    image. This lets you debug a container by running an interactive shell, or
    export a working dataset to another server.
@y
long: |-
    これはコンテナー内のファイルに対してのファイル変更や設定を、新たなイメージにコミットするために用います。
    この機能を使うと、コンテナーのデバッグ作業を対話型シェルを実行して行うことができます。
    または作業中のデータセットを別のコンテナーにエクスポートすることができます。
@z

@x
    Commits do not include any data contained in mounted volumes.
@y
    コミットには、マウントされているボリューム内のデータは含まれません。
@z

@x
    By default, the container being committed and its processes will be paused
    while the image is committed. This reduces the likelihood of encountering data
    corruption during the process of creating the commit. If this behavior is
    undesired, set the `--pause` option to false.
@y
    イメージをコミットする際には、デフォルトではコンテナーおよびそのプロセスは一時停止します。
    停止することで、コミット処理を行う過程におけるデータ破損の可能性を減らすものです。
    この動作が不要である場合は `--pause` オプションに false を設定します。
@z

@x
    The `--change` option will apply `Dockerfile` instructions to the image that's
    created. Supported `Dockerfile` instructions:
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`LABEL`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
@y
    `--change` オプションは、生成されるイメージに `Dockerfile` 命令を適用します。
    サポートされる `Dockerfile` 命令は以下のものです。
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`LABEL`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
@z

@x
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
@y
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
@z

% options:

@x author
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
@y
      description: 作者。(たとえば `John Hannibal Smith <hannibal@a-team.com>`)
@z

@x change
      description: Apply Dockerfile instruction to the created image
@y
      description: Dockerfile 命令を生成イメージに適用します。
@z

@x message
      description: Commit message
@y
      description: コミットメッセージ。
@z

@x no-pause
      description: Disable pausing container during commit
@y
      description: コミット時のコンテナー一時停止を無効にします。
@z

@x pause
      description: 'Pause container during commit (deprecated: use --no-pause instead)'
@y
      description: 'コミット中はコンテナーを一時停止します (廃止予定: 代わりに --no-pause を使ってください)。'
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Commit a container
@y
examples: |-
    ### コンテナーのコミット {#commit-a-container}
@z

% snip command...

@x
    ### Commit a container with new configurations (--change) {#change}
@y
    ### 新たな設定を使ったコンテナーのコミット (--change) {#change}
@z

% snip command...

@x
    ### Commit a container with new `CMD` and `EXPOSE` instructions
@y
    ### 新たな `CMD`、`EXPOSE` 命令を使ったコンテナーのコミット {#commit-a-container-with-new-cmd-and-expose-instructions}
@z

% snip command...
% snip directives...
