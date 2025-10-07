%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: JSONArgsRecommended
description: >-
  JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
@y
title: JSONArgsRecommended
description: >-
  ENTRYPOINT/CMD に対する JSON 引数は OS シグナルを起こすような意図しない動作は避けるべきです。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
```
@y
```text
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
```
(訳： ENTRYPOINT/CMD に対する JSON 引数は OS シグナルを起こすような意図しない動作は避けるべきです)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
`ENTRYPOINT` and `CMD` instructions both support two different syntaxes for
arguments:
@y
`ENTRYPOINT` および `CMD` は、引数に関して 2 つの文法をサポートしています。
@z

@x
- Shell form: `CMD my-cmd start`
- Exec form: `CMD ["my-cmd", "start"]`
@y
- シェル形式: `CMD my-cmd start`
- exec 形式: `CMD ["my-cmd", "start"]`
@z

@x
When you use shell form, the executable runs as a child process to a shell,
which doesn't pass signals. This means that the program running in the
container can't detect OS signals like `SIGTERM` and `SIGKILL` and respond to
them correctly.
@y
シェル形式を用いた場合、実行モジュールはシェルに対する子プロセスとして実行されます。
これはシグナルを送信しません。
これが何を意味するかと言えば、コンテナー内において実行されるプログラムが `SIGTERM` や `SIGKILL` といった OS シグナルを検出できないため、それらに適切に対処できないということです。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: the `ENTRYPOINT` command doesn't receive OS signals.
@y
❌ 不可: `ENTRYPOINT` コマンドは OS シグナルを受け取りません。
@z

@x within code
# entrypoint becomes: /bin/sh -c my-program start
@y
# entrypoint は /bin/sh -c my-program start となります
@z

@x
To make sure the executable can receive OS signals, use the exec form for `CMD`
and `ENTRYPOINT`, which lets you run the executable as the main process (`PID
1`) in the container, avoiding a shell parent process.
@y
実行ファイルが OS シグナルを受け取れるようにするには、`CMD` や`ENTRYPOINT` では exec 形式を使ってください。
これはコンテナー内においてメインプロセス (`PID 1`) として、シェルの親プロセスをうまく避けながら実行ファイルを実行します。
@z

@x
✅ Good: the `ENTRYPOINT` receives OS signals.
@y
✅ 可: `ENTRYPOINT` は OS シグナルを受け取ります。
@z

@x within code
# entrypoint becomes: my-program start
@y
# entrypoint は my-program start となります
@z

@x
Note that running programs as PID 1 means the program now has the special
responsibilities and behaviors associated with PID 1 in Linux, such as reaping
child processes.
@y
PID 1 としてプログラム起動を行うということは、Linux 上の PID 1 に求められるそれ相応の責任と動作が求められます。
たとえば子プロセスの終了を検出することなどです。
@z

@x
### Workarounds
@y
### 回避策 {#workarounds}
@z

@x
There might still be cases when you want to run your containers under a shell.
When using exec form, shell features such as variable expansion, piping (`|`)
and command chaining (`&&`, `||`, `;`), are not available. To use such
features, you need to use shell form.
@y
シェルの元でコンテナーを実行したいというケースがあるかもしれません。
exec 形式を用いた場合、シェル機能として変数展開、パイプ (`|`)、コマンド連結 (`&&`, `||`, `;`) は利用できません。
そういった機能を利用したいならシェル形式を用いなければなりません。
@z

@x
Here are some ways you can achieve that. Note that this still means that
executables run as child-processes of a shell.
@y
以下に示すのはそれを実現する方法です。
これは、シェルの子プロセスとして実行ファイルを実行することに変わりはありません。
@z

@x
#### Create a wrapper script
@y
#### ラッパースクリプトの生成 {#create-a-wrapper-script}
@z

@x
You can create an entrypoint script that wraps your startup commands, and
execute that script with a JSON-formatted `ENTRYPOINT` command.
@y
エントリーポイント用のスクリプトを用意して、起動コマンドをラップするようにします。
そしてそのスクリプトを実行しつつ `ENTRYPOINT` コマンドは JSON 形式とします。
@z

@x
✅ Good: the `ENTRYPOINT` uses JSON format.
@y
✅ 可: `ENTRYPOINT` は JSON 形式を使っています。
@z

% snip code...

@x
#### Explicitly specify the shell
@y
#### シェルの明示的な指定 {#explicitly-specify-the-shell}
@z

@x
You can use the [`SHELL`](https://docs.docker.com/reference/dockerfile/#shell)
Dockerfile instruction to explicitly specify a shell to use. This will suppress
the warning since setting the `SHELL` instruction indicates that using shell
form is a conscious decision.
@y
Dockerfile の命令として [`SHELL`](https://docs.docker.com/reference/dockerfile/#shell) があります。
利用したいシェルを明示的に指定するものです。
`SHELL` 命令を利用するということは、シェル形式を意図的に利用することを表しているため、警告メッセージは出力されなくなります。
@z

@x
✅ Good: shell is explicitly defined.
@y
✅ 可: シェルが明示的に定義されています。
@z

% snip code...
