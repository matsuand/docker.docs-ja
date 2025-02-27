%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Dockerfile reference
@y
title: Dockerfile リファレンス
@z

@x
Docker can build images automatically by reading the instructions from a
Dockerfile. A Dockerfile is a text document that contains all the commands a
user could call on the command line to assemble an image. This page describes
the commands you can use in a Dockerfile.
@y
Docker は Dockerfile から命令を読み込んで、自動的にイメージをビルドします。
Dockerfile はテキストファイルであり、イメージを作り上げるために実行するコマンドラインコマンドを、すべてこのファイルに含めることができます。
このページでは Docker file 内で利用するコマンドについて説明します。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
The Dockerfile supports the following instructions:
@y
Dockerfile では以下の命令がサポートされています。
@z

@x
| Instruction                            | Description                                                 |
| :------------------------------------- | :---------------------------------------------------------- |
| [`ADD`](#add)                          | Add local or remote files and directories.                  |
| [`ARG`](#arg)                          | Use build-time variables.                                   |
| [`CMD`](#cmd)                          | Specify default commands.                                   |
| [`COPY`](#copy)                        | Copy files and directories.                                 |
| [`ENTRYPOINT`](#entrypoint)            | Specify default executable.                                 |
| [`ENV`](#env)                          | Set environment variables.                                  |
| [`EXPOSE`](#expose)                    | Describe which ports your application is listening on.      |
| [`FROM`](#from)                        | Create a new build stage from a base image.                 |
| [`HEALTHCHECK`](#healthcheck)          | Check a container's health on startup.                      |
| [`LABEL`](#label)                      | Add metadata to an image.                                   |
| [`MAINTAINER`](#maintainer-deprecated) | Specify the author of an image.                             |
| [`ONBUILD`](#onbuild)                  | Specify instructions for when the image is used in a build. |
| [`RUN`](#run)                          | Execute build commands.                                     |
| [`SHELL`](#shell)                      | Set the default shell of an image.                          |
| [`STOPSIGNAL`](#stopsignal)            | Specify the system call signal for exiting a container.     |
| [`USER`](#user)                        | Set user and group ID.                                      |
| [`VOLUME`](#volume)                    | Create volume mounts.                                       |
| [`WORKDIR`](#workdir)                  | Change working directory.                                   |
@y
| 命令                                   | 内容説明                                                    |
| :------------------------------------- | :---------------------------------------------------------- |
| [`ADD`](#add)                          | ローカルまたはリモートのファイルやディレクトリを追加します。|
| [`ARG`](#arg)                          | ビルド時の変数として利用します                              |
| [`CMD`](#cmd)                          | Specify default commands.                                   |
| [`COPY`](#copy)                        | Copy files and directories.                                 |
| [`ENTRYPOINT`](#entrypoint)            | Specify default executable.                                 |
| [`ENV`](#env)                          | Set environment variables.                                  |
| [`EXPOSE`](#expose)                    | Describe which ports your application is listening on.      |
| [`FROM`](#from)                        | Create a new build stage from a base image.                 |
| [`HEALTHCHECK`](#healthcheck)          | Check a container's health on startup.                      |
| [`LABEL`](#label)                      | Add metadata to an image.                                   |
| [`MAINTAINER`](#maintainer-deprecated) | Specify the author of an image.                             |
| [`ONBUILD`](#onbuild)                  | Specify instructions for when the image is used in a build. |
| [`RUN`](#run)                          | Execute build commands.                                     |
| [`SHELL`](#shell)                      | Set the default shell of an image.                          |
| [`STOPSIGNAL`](#stopsignal)            | Specify the system call signal for exiting a container.     |
| [`USER`](#user)                        | Set user and group ID.                                      |
| [`VOLUME`](#volume)                    | Create volume mounts.                                       |
| [`WORKDIR`](#workdir)                  | Change working directory.                                   |
@z

@x
## Format
@y
## フォーマット {#format}
@z

@x
Here is the format of the Dockerfile:
@y
Dockerfile のフォーマットは以下のとおりです。
@z

% snip code...

@x
The instruction is not case-sensitive. However, convention is for them to
be UPPERCASE to distinguish them from arguments more easily.
@y
命令 (instruction) は英字の大文字小文字を区別しません。
ただし慣習として大文字とします。
そうすることで引数（arguments）との区別をつけやすくします。
@z

@x
Docker runs instructions in a Dockerfile in order. A Dockerfile **must
begin with a `FROM` instruction**. This may be after [parser
directives](#parser-directives), [comments](#format), and globally scoped
[ARGs](#arg). The `FROM` instruction specifies the [base
image](https://docs.docker.com/glossary/#base-image) from which you are
building. `FROM` may only be preceded by one or more `ARG` instructions, which
declare arguments that are used in `FROM` lines in the Dockerfile.
@y
Docker は Dockerfile 内の命令を記述順に実行します。
Dockerfile は **必ず `FROM` 命令で始めなければなりません** 。
この命令より前に記述できるのは、[パーサーディレクティブ](#parser-directives)、[コメント](#format)、グローバル定義された [ARG](#arg) です。
`FROM` 命令は、ビルドするイメージに対しての [ベースイメージ]({{ site.BaseURL }}/reference/glossary.md#base-image) を指定するものです。
`FROM` よりも先に記述できる命令として `ARG` があります。
これは `FROM` において用いられる引数を宣言するものです。
@z

@x
BuildKit treats lines that begin with `#` as a comment, unless the line is
a valid [parser directive](#parser-directives). A `#` marker anywhere
else in a line is treated as an argument. This allows statements like:
@y
行頭が `#` で始まる行はコメントとして扱われます。
ただし例外として[パーサーディレクティブ](#parser-directives)があります。
行途中の `#` は単なる引数として扱われます。
以下のような行記述が可能です。
@z

% snip code...

@x
Comment lines are removed before the Dockerfile instructions are executed.
The comment in the following example is removed before the shell executes
the `echo` command.
@y
コメント行は Dockerfile 命令が実行される前に削除されます。
上の例で言えば、シェルが `echo` コマンドを実行する前にコメントが削除されます。
@z

% snip code...

@x
The following examples is equivalent.
@y
以下としても同じことです。
@z

% snip code...

@x
Comments don't support line continuation characters.
@y
コメントにおいて行継続を指示する文字はサポートされていません。
@z

@x
> **Note on whitespace**
>
> For backward compatibility, leading whitespace before comments (`#`) and
> instructions (such as `RUN`) are ignored, but discouraged. Leading whitespace
> is not preserved in these cases, and the following examples are therefore
> equivalent:
>
> ```dockerfile
>         # this is a comment-line
>     RUN echo hello
> RUN echo world
> ```
>
> ```dockerfile
> # this is a comment-line
> RUN echo hello
> RUN echo world
> ```
>
> Whitespace in instruction arguments, however, isn't ignored.
> The following example prints `    hello    world`
> with leading whitespace as specified:
>
> ```dockerfile
> RUN echo "\
>      hello\
>      world"
> ```
@y
> **Note on whitespace**
>
> For backward compatibility, leading whitespace before comments (`#`) and
> instructions (such as `RUN`) are ignored, but discouraged. Leading whitespace
> is not preserved in these cases, and the following examples are therefore
> equivalent:
>
> ```dockerfile
>         # this is a comment-line
>     RUN echo hello
> RUN echo world
> ```
>
> ```dockerfile
> # this is a comment-line
> RUN echo hello
> RUN echo world
> ```
>
> Whitespace in instruction arguments, however, isn't ignored.
> The following example prints `    hello    world`
> with leading whitespace as specified:
>
> ```dockerfile
> RUN echo "\
>      hello\
>      world"
> ```
@z

@x
## Parser directives
@y
## パーサーディレクティブ {#parser-directives}
@z

@x
Parser directives are optional, and affect the way in which subsequent lines
in a Dockerfile are handled. Parser directives don't add layers to the build,
and don't show up as build steps. Parser directives are written as a
special type of comment in the form `# directive=value`. A single directive
may only be used once.
@y
パーサーディレクティブ（parser directive）を利用することは任意です。
これは Dockerfile 内のその後に続く記述行を取り扱う方法を指示するものです。
パーサーディレクティブはビルドされるイメージにレイヤーを追加しません。
したがってビルドステップとして表示されることはありません。
パーサーディレクティブは、特別なコメントの記述方法をとるもので、`# ディレクティブ＝値` という書式です。
同一のディレクティブは一度しか記述できません。
@z

@x
Once a comment, empty line or builder instruction has been processed, BuildKit
no longer looks for parser directives. Instead it treats anything formatted
as a parser directive as a comment and doesn't attempt to validate if it might
be a parser directive. Therefore, all parser directives must be at the
top of a Dockerfile.
@y
コメント、空行、ビルド命令が一つでも読み込まれたら、それ以降 BuildKit はパーサーディレクティブの処理を行いません。
その場合、パーサーディレクティブの書式で記述されていても、それはコメントとして扱われます。
そしてパーサーディレクティブとして適切な書式であるかどうかも確認しません。
したがってパーサーディレクティブは Dockerfile の冒頭に記述しなければなりません。
@z

@x
Parser directive keys, such as `syntax` or `check`, aren't case-sensitive, but
they're lowercase by convention. Values for a directive are case-sensitive and
must be written in the appropriate case for the directive. For example,
`#check=skip=jsonargsrecommended` is invalid because the check name must use
Pascal case, not lowercase. It's also conventional to include a blank line
following any parser directives. Line continuation characters aren't supported
in parser directives.
@y
`syntax` や `check` のようなパーサーディレクティブは大文字小文字を区別しません。
ただし慣習として小文字とします。
ディレクティブに指定する値は大文字小文字を区別し、そのディレクティブにおいて適切な表記とすることが必要です。
たとえば `#check=skip=jsonargsrecommended` というのは不適切です。
チェック名は Pascal ケースを用いるべきであり、小文字ばかりではふさわしくありません。
同じく慣習として、パーサーディレクティブの次には空行を 1 行挿入します。
パーサーディレクティブにおいて、行継続を指示する文字はサポートされていません。
@z

@x
Due to these rules, the following examples are all invalid:
@y
以上の規則により、下に示す例はすべて無効な記述となります。
@z

@x
Invalid due to line continuation:
@y
行継続は無効です。
@z

% snip code...

@x
Invalid due to appearing twice:
@y
二度出現するため無効です。
@z

% snip code...

@x
Treated as a comment because it appears after a builder instruction:
@y
ビルド命令の後に記述されたためコメントとして扱われます。
@z

% snip code...

@x
Treated as a comment because it appears after a comment that isn't a parser
directive:
@y
パーサーディレクティブではないコメントの後に記述されたためコメントして扱われます。
@z

% snip code...

@x
The following `unknowndirective` is treated as a comment because it isn't
recognized. The known `syntax` directive is treated as a comment because it
appears after a comment that isn't a parser directive.
@y
不明なディレクティブ `unknowndirective` は認識できないためコメントとして扱われます。
さらに正常なディレクティブ `syntax` であっても、その前にパーサーディレクティブではないコメントが記述された場合、コメントとして扱われます。
@z

% snip code...

@x
Non line-breaking whitespace is permitted in a parser directive. Hence, the
following lines are all treated identically:
@y
改行ではないホワイトスペースは、パーサーディレクティブにおいて記述することができます。
そこで、以下の各行はすべて同一のものとして扱われます。
@z

% snip code...

@x
### syntax
@y
### syntax
@z

@x
<a name="external-implementation-features"><!-- included for deep-links to old section --></a>
@y
<a name="external-implementation-features"><!-- included for deep-links to old section --></a>
@z

%@x
%This feature is only available when using the [BuildKit](https://docs.docker.com/build/buildkit/)
%backend, and is ignored when using the classic builder backend.
%@y
%この機能は [BuildKit](/build/buildkit/) バックエンドが用いられているときのみ利用可能であり、旧来の builder バックエンドを利用している場合には無視されます。
%@z

@x
Use the `syntax` parser directive to declare the Dockerfile syntax version to
use for the build. If unspecified, BuildKit uses a bundled version of the
Dockerfile frontend. Declaring a syntax version lets you automatically use the
latest Dockerfile version without having to upgrade BuildKit or Docker Engine,
or even use a custom Dockerfile implementation.
@y
Use the `syntax` parser directive to declare the Dockerfile syntax version to
use for the build. If unspecified, BuildKit uses a bundled version of the
Dockerfile frontend. Declaring a syntax version lets you automatically use the
latest Dockerfile version without having to upgrade BuildKit or Docker Engine,
or even use a custom Dockerfile implementation.
@z

@x
Most users will want to set this parser directive to `docker/dockerfile:1`,
which causes BuildKit to pull the latest stable version of the Dockerfile
syntax before the build.
@y
Most users will want to set this parser directive to `docker/dockerfile:1`,
which causes BuildKit to pull the latest stable version of the Dockerfile
syntax before the build.
@z

% snip code...

@x
For more information about how the parser directive works, see
[Custom Dockerfile syntax](https://docs.docker.com/build/buildkit/dockerfile-frontend/).
@y
For more information about how the parser directive works, see
[Custom Dockerfile syntax](https://docs.docker.com/build/buildkit/dockerfile-frontend/).
@z

@x
### escape
@y
### escape
@z

% snip code...

@x
Or
@y
または
@z

% snip code...

@x
The `escape` directive sets the character used to escape characters in a
Dockerfile. If not specified, the default escape character is `\`.
@y
ディレクティブ `escape` は Dockerfile 内でエスケープ文字として用いる文字を設定します。
設定していない場合は、デフォルトとして `\` が用いられます。
@z

@x
The escape character is used both to escape characters in a line, and to
escape a newline. This allows a Dockerfile instruction to
span multiple lines. Note that regardless of whether the `escape` parser
directive is included in a Dockerfile, escaping is not performed in
a `RUN` command, except at the end of a line.
@y
エスケープ文字は行途中での文字をエスケープするものと、行継続をエスケープするものがあります。
行継続のエスケープを使うと Dockerfile 内の命令を複数行に分けることができます。
Dockerfile に `escape` パーサーディレクティブを記述していたとしても、`RUN` コマンドの途中でのエスケープは無効であり、行末の行継続エスケープのみ利用することができます。
@z

@x
Setting the escape character to `` ` `` is especially useful on
`Windows`, where `\` is the directory path separator. `` ` `` is consistent
with [Windows PowerShell](https://technet.microsoft.com/en-us/library/hh847755.aspx).
@y
`Windows` においてはエスケープ文字を `` ` `` とします。
`\` はディレクトリセパレーターとなっているためです。
`` ` `` は [Windows PowerShell](https://technet.microsoft.com/en-us/library/hh847755.aspx) 上でも利用できます。
@z

@x
Consider the following example which would fail in a non-obvious way on
Windows. The second `\` at the end of the second line would be interpreted as an
escape for the newline, instead of a target of the escape from the first `\`.
Similarly, the `\` at the end of the third line would, assuming it was actually
handled as an instruction, cause it be treated as a line continuation. The result
of this Dockerfile is that second and third lines are considered a single
instruction:
@y
以下のような Windows 上の例を見てみます。
これはよく分からずに失敗してしまう例です。
2 行めの行末にある 2 つめの `\` は、次の行への継続を表わすエスケープと解釈されます。
つまり 1 つめの `\` をエスケープするものとはなりません。
同様に 3 行めの行末にある `\` も、この行が正しく命令として解釈されるものであっても、行継続として扱われることになります。
結果としてこの Dockerfile の 2 行めと 3 行めは、一続きの記述行とみなされます。
@z

% snip code...

@x
Results in:
@y
この Dockerfile を用いると以下の結果になります。
@z

% snip command...

% snip output...

@x
One solution to the above would be to use `/` as the target of both the `COPY`
instruction, and `dir`. However, this syntax is, at best, confusing as it is not
natural for paths on Windows, and at worst, error prone as not all commands on
Windows support `/` as the path separator.
@y
上を解決するには `COPY` 命令と `dir` の対象において `/` を用います。
ただし Windows 上における普通のパス記述とは違う文法であるため混乱しやすく、さらに Windows のあらゆるコマンドがパスセパレーターとして  `/` をサポートしているわけではないので、エラーになることもあります。
@z

@x
By adding the `escape` parser directive, the following Dockerfile succeeds as
expected with the use of natural platform semantics for file paths on Windows:
@y
パーサーディレクティブ `escape` を利用すれば、Windows 上のファイルパスの文法をそのままに、期待どおりに Dockerfile が動作してくれます。
@z

% snip code...

@x
Results in:
@y
Results in:
@z

% snip output...

@x
## Environment replacement
@y
## Environment replacement
@z

@x
Environment variables (declared with [the `ENV` statement](#env)) can also be
used in certain instructions as variables to be interpreted by the
Dockerfile. Escapes are also handled for including variable-like syntax
into a statement literally.
@y
Environment variables (declared with [the `ENV` statement](#env)) can also be
used in certain instructions as variables to be interpreted by the
Dockerfile. Escapes are also handled for including variable-like syntax
into a statement literally.
@z

@x
Environment variables are notated in the Dockerfile either with
`$variable_name` or `${variable_name}`. They are treated equivalently and the
brace syntax is typically used to address issues with variable names with no
whitespace, like `${foo}_bar`.
@y
Environment variables are notated in the Dockerfile either with
`$variable_name` or `${variable_name}`. They are treated equivalently and the
brace syntax is typically used to address issues with variable names with no
whitespace, like `${foo}_bar`.
@z

@x
The `${variable_name}` syntax also supports a few of the standard `bash`
modifiers as specified below:
@y
The `${variable_name}` syntax also supports a few of the standard `bash`
modifiers as specified below:
@z

@x
- `${variable:-word}` indicates that if `variable` is set then the result
  will be that value. If `variable` is not set then `word` will be the result.
- `${variable:+word}` indicates that if `variable` is set then `word` will be
  the result, otherwise the result is the empty string.
@y
- `${variable:-word}` indicates that if `variable` is set then the result
  will be that value. If `variable` is not set then `word` will be the result.
- `${variable:+word}` indicates that if `variable` is set then `word` will be
  the result, otherwise the result is the empty string.
@z

@x
The following variable replacements are supported in a pre-release version of
Dockerfile syntax, when using the `# syntax=docker/dockerfile-upstream:master` syntax
directive in your Dockerfile:
@y
The following variable replacements are supported in a pre-release version of
Dockerfile syntax, when using the `# syntax=docker/dockerfile-upstream:master` syntax
directive in your Dockerfile:
@z

@x
- `${variable#pattern}` removes the shortest match of `pattern` from `variable`,
  seeking from the start of the string.
@y
- `${variable#pattern}` removes the shortest match of `pattern` from `variable`,
  seeking from the start of the string.
@z

% snip code...

@x
- `${variable##pattern}` removes the longest match of `pattern` from `variable`,
  seeking from the start of the string.
@y
- `${variable##pattern}` removes the longest match of `pattern` from `variable`,
  seeking from the start of the string.
@z

% snip code...

@x
- `${variable%pattern}` removes the shortest match of `pattern` from `variable`,
  seeking backwards from the end of the string.
@y
- `${variable%pattern}` removes the shortest match of `pattern` from `variable`,
  seeking backwards from the end of the string.
@z

% snip code...

@x
- `${variable%%pattern}` removes the longest match of `pattern` from `variable`,
  seeking backwards from the end of the string.
@y
- `${variable%%pattern}` removes the longest match of `pattern` from `variable`,
  seeking backwards from the end of the string.
@z

% snip code...

@x
- `${variable/pattern/replacement}` replace the first occurrence of `pattern`
  in `variable` with `replacement`
@y
- `${variable/pattern/replacement}` replace the first occurrence of `pattern`
  in `variable` with `replacement`
@z

% snip code...

@x
- `${variable//pattern/replacement}` replaces all occurrences of `pattern`
  in `variable` with `replacement`
@y
- `${variable//pattern/replacement}` replaces all occurrences of `pattern`
  in `variable` with `replacement`
@z

% snip code...

@x
In all cases, `word` can be any string, including additional environment
variables.
@y
In all cases, `word` can be any string, including additional environment
variables.
@z

@x
`pattern` is a glob pattern where `?` matches any single character
and `*` any number of characters (including zero). To match literal `?` and `*`,
use a backslash escape: `\?` and `\*`.
@y
`pattern` is a glob pattern where `?` matches any single character
and `*` any number of characters (including zero). To match literal `?` and `*`,
use a backslash escape: `\?` and `\*`.
@z

@x
You can escape whole variable names by adding a `\` before the variable: `\$foo` or `\${foo}`,
for example, will translate to `$foo` and `${foo}` literals respectively.
@y
You can escape whole variable names by adding a `\` before the variable: `\$foo` or `\${foo}`,
for example, will translate to `$foo` and `${foo}` literals respectively.
@z

@x
Example (parsed representation is displayed after the `#`):
@y
Example (parsed representation is displayed after the `#`):
@z

% snip code...

@x
Environment variables are supported by the following list of instructions in
the Dockerfile:
@y
Environment variables are supported by the following list of instructions in
the Dockerfile:
@z

@x
- `ADD`
- `COPY`
- `ENV`
- `EXPOSE`
- `FROM`
- `LABEL`
- `STOPSIGNAL`
- `USER`
- `VOLUME`
- `WORKDIR`
- `ONBUILD` (when combined with one of the supported instructions above)
@y
- `ADD`
- `COPY`
- `ENV`
- `EXPOSE`
- `FROM`
- `LABEL`
- `STOPSIGNAL`
- `USER`
- `VOLUME`
- `WORKDIR`
- `ONBUILD` (when combined with one of the supported instructions above)
@z

@x
You can also use environment variables with `RUN`, `CMD`, and `ENTRYPOINT`
instructions, but in those cases the variable substitution is handled by the
command shell, not the builder. Note that instructions using the exec form
don't invoke a command shell automatically. See [Variable
substitution](#variable-substitution).
@y
You can also use environment variables with `RUN`, `CMD`, and `ENTRYPOINT`
instructions, but in those cases the variable substitution is handled by the
command shell, not the builder. Note that instructions using the exec form
don't invoke a command shell automatically. See [Variable
substitution](#variable-substitution).
@z

@x
Environment variable substitution use the same value for each variable
throughout the entire instruction. Changing the value of a variable only takes
effect in subsequent instructions. Consider the following example:
@y
Environment variable substitution use the same value for each variable
throughout the entire instruction. Changing the value of a variable only takes
effect in subsequent instructions. Consider the following example:
@z

% snip code...

@x
- The value of `def` becomes `hello`
- The value of `ghi` becomes `bye`
@y
- The value of `def` becomes `hello`
- The value of `ghi` becomes `bye`
@z

@x
## .dockerignore file
@y
## .dockerignore ファイル {#dockerignore-file}
@z

@x
You can use `.dockerignore` file to exclude files and directories from the
build context. For more information, see
[.dockerignore file](https://docs.docker.com/build/building/context/#dockerignore-files).
@y
You can use `.dockerignore` file to exclude files and directories from the
build context. For more information, see
[.dockerignore file](https://docs.docker.com/build/building/context/#dockerignore-files).
@z

@x
## Shell and exec form
@y
## シェル形式と exec 形式 {#shell-and-exec-form}
@z

@x
The `RUN`, `CMD`, and `ENTRYPOINT` instructions all have two possible forms:
@y
`RUN`、`CMD`、`ENTRYPOINT` の各命令は、以下の 2 つの書式を取ります。
@z

@x
- `INSTRUCTION ["executable","param1","param2"]` (exec form)
- `INSTRUCTION command param1 param2` (shell form)
@y
- `<命令> ["<実行ファイル>","<パラメーター1>","<パラメーター2>"]` (exec 形式)
- `<命令> <コマンド> <パラメーター1> <パラメーター2>` (シェル形式)
@z

@x
The exec form makes it possible to avoid shell string munging, and to invoke
commands using a specific command shell, or any other executable. It uses a
JSON array syntax, where each element in the array is a command, flag, or
argument.
@y
The exec form makes it possible to avoid shell string munging, and to invoke
commands using a specific command shell, or any other executable. It uses a
JSON array syntax, where each element in the array is a command, flag, or
argument.
@z

@x
The shell form is more relaxed, and emphasizes ease of use, flexibility, and
readability. The shell form automatically uses a command shell, whereas the
exec form does not.
@y
The shell form is more relaxed, and emphasizes ease of use, flexibility, and
readability. The shell form automatically uses a command shell, whereas the
exec form does not.
@z

@x
### Exec form
@y
### Exec form {#exec-form}
@z

@x
The exec form is parsed as a JSON array, which means that
you must use double-quotes (") around words, not single-quotes (').
@y
The exec form is parsed as a JSON array, which means that
you must use double-quotes (") around words, not single-quotes (').
@z

% snip code...

@x
The exec form is best used to specify an `ENTRYPOINT` instruction, combined
with `CMD` for setting default arguments that can be overridden at runtime. For
more information, see [ENTRYPOINT](#entrypoint).
@y
The exec form is best used to specify an `ENTRYPOINT` instruction, combined
with `CMD` for setting default arguments that can be overridden at runtime. For
more information, see [ENTRYPOINT](#entrypoint).
@z

@x
#### Variable substitution
@y
#### Variable substitution {#variable-substitution}
@z

@x
Using the exec form doesn't automatically invoke a command shell. This means
that normal shell processing, such as variable substitution, doesn't happen.
For example, `RUN [ "echo", "$HOME" ]` won't handle variable substitution for
`$HOME`.
@y
Using the exec form doesn't automatically invoke a command shell. This means
that normal shell processing, such as variable substitution, doesn't happen.
For example, `RUN [ "echo", "$HOME" ]` won't handle variable substitution for
`$HOME`.
@z

@x
If you want shell processing then either use the shell form or execute a shell
directly with the exec form, for example: `RUN [ "sh", "-c", "echo $HOME" ]`.
When using the exec form and executing a shell directly, as in the case for the
shell form, it's the shell that's doing the environment variable substitution,
not the builder.
@y
If you want shell processing then either use the shell form or execute a shell
directly with the exec form, for example: `RUN [ "sh", "-c", "echo $HOME" ]`.
When using the exec form and executing a shell directly, as in the case for the
shell form, it's the shell that's doing the environment variable substitution,
not the builder.
@z

@x
#### Backslashes
@y
#### バックスラッシュ {#backslashes}
@z

@x
In exec form, you must escape backslashes. This is particularly relevant on
Windows where the backslash is the path separator. The following line would
otherwise be treated as shell form due to not being valid JSON, and fail in an
unexpected way:
@y
In exec form, you must escape backslashes. This is particularly relevant on
Windows where the backslash is the path separator. The following line would
otherwise be treated as shell form due to not being valid JSON, and fail in an
unexpected way:
@z

% snip code...

@x
The correct syntax for this example is:
@y
The correct syntax for this example is:
@z

% snip code...

@x
### Shell form
@y
### Shell form {#shell-form}
@z

@x
Unlike the exec form, instructions using the shell form always use a command
shell. The shell form doesn't use the JSON array format, instead it's a regular
string. The shell form string lets you escape newlines using the [escape
character](#escape) (backslash by default) to continue a single instruction
onto the next line. This makes it easier to use with longer commands, because
it lets you split them up into multiple lines. For example, consider these two
lines:
@y
Unlike the exec form, instructions using the shell form always use a command
shell. The shell form doesn't use the JSON array format, instead it's a regular
string. The shell form string lets you escape newlines using the [escape
character](#escape) (backslash by default) to continue a single instruction
onto the next line. This makes it easier to use with longer commands, because
it lets you split them up into multiple lines. For example, consider these two
lines:
@z

% snip code...

@x
They're equivalent to the following line:
@y
They're equivalent to the following line:
@z

% snip code...

@x
You can also use heredocs with the shell form to break up supported commands.
@y
You can also use heredocs with the shell form to break up supported commands.
@z

% snip code...

@x
For more information about heredocs, see [Here-documents](#here-documents).
@y
For more information about heredocs, see [Here-documents](#here-documents).
@z

@x
### Use a different shell
@y
### 別のシェル利用 {#use-a-different-shell}
@z

@x
You can change the default shell using the `SHELL` command. For example:
@y
You can change the default shell using the `SHELL` command. For example:
@z

% snip code...

@x
For more information, see [SHELL](#shell).
@y
For more information, see [SHELL](#shell).
@z

@x
## FROM
@y
## FROM
@z

% snip code...

@x
Or
@y
Or
@z

% snip code...

@x
Or
@y
Or
@z

% snip code...

@x
The `FROM` instruction initializes a new build stage and sets the
[base image](https://docs.docker.com/glossary/#base-image) for subsequent
instructions. As such, a valid Dockerfile must start with a `FROM` instruction.
The image can be any valid image.
@y
The `FROM` instruction initializes a new build stage and sets the
[base image](https://docs.docker.com/glossary/#base-image) for subsequent
instructions. As such, a valid Dockerfile must start with a `FROM` instruction.
The image can be any valid image.
@z

@x
- `ARG` is the only instruction that may precede `FROM` in the Dockerfile.
  See [Understand how ARG and FROM interact](#understand-how-arg-and-from-interact).
- `FROM` can appear multiple times within a single Dockerfile to
  create multiple images or use one build stage as a dependency for another.
  Simply make a note of the last image ID output by the commit before each new
  `FROM` instruction. Each `FROM` instruction clears any state created by previous
  instructions.
- Optionally a name can be given to a new build stage by adding `AS name` to the
  `FROM` instruction. The name can be used in subsequent `FROM <name>`,
  [`COPY --from=<name>`](#copy---from),
  and [`RUN --mount=type=bind,from=<name>`](#run---mounttypebind) instructions
  to refer to the image built in this stage.
- The `tag` or `digest` values are optional. If you omit either of them, the
  builder assumes a `latest` tag by default. The builder returns an error if it
  can't find the `tag` value.
@y
- `ARG` is the only instruction that may precede `FROM` in the Dockerfile.
  See [Understand how ARG and FROM interact](#understand-how-arg-and-from-interact).
- `FROM` can appear multiple times within a single Dockerfile to
  create multiple images or use one build stage as a dependency for another.
  Simply make a note of the last image ID output by the commit before each new
  `FROM` instruction. Each `FROM` instruction clears any state created by previous
  instructions.
- Optionally a name can be given to a new build stage by adding `AS name` to the
  `FROM` instruction. The name can be used in subsequent `FROM <name>`,
  [`COPY --from=<name>`](#copy---from),
  and [`RUN --mount=type=bind,from=<name>`](#run---mounttypebind) instructions
  to refer to the image built in this stage.
- The `tag` or `digest` values are optional. If you omit either of them, the
  builder assumes a `latest` tag by default. The builder returns an error if it
  can't find the `tag` value.
@z

@x
The optional `--platform` flag can be used to specify the platform of the image
in case `FROM` references a multi-platform image. For example, `linux/amd64`,
`linux/arm64`, or `windows/amd64`. By default, the target platform of the build
request is used. Global build arguments can be used in the value of this flag,
for example [automatic platform ARGs](#automatic-platform-args-in-the-global-scope)
allow you to force a stage to native build platform (`--platform=$BUILDPLATFORM`),
and use it to cross-compile to the target platform inside the stage.
@y
The optional `--platform` flag can be used to specify the platform of the image
in case `FROM` references a multi-platform image. For example, `linux/amd64`,
`linux/arm64`, or `windows/amd64`. By default, the target platform of the build
request is used. Global build arguments can be used in the value of this flag,
for example [automatic platform ARGs](#automatic-platform-args-in-the-global-scope)
allow you to force a stage to native build platform (`--platform=$BUILDPLATFORM`),
and use it to cross-compile to the target platform inside the stage.
@z

@x
### Understand how ARG and FROM interact
@y
### Understand how ARG and FROM interact {#understand-how-arg-and-from-interac}
@z

@x
`FROM` instructions support variables that are declared by any `ARG`
instructions that occur before the first `FROM`.
@y
`FROM` instructions support variables that are declared by any `ARG`
instructions that occur before the first `FROM`.
@z

% snip code...

@x
An `ARG` declared before a `FROM` is outside of a build stage, so it
can't be used in any instruction after a `FROM`. To use the default value of
an `ARG` declared before the first `FROM` use an `ARG` instruction without
a value inside of a build stage:
@y
An `ARG` declared before a `FROM` is outside of a build stage, so it
can't be used in any instruction after a `FROM`. To use the default value of
an `ARG` declared before the first `FROM` use an `ARG` instruction without
a value inside of a build stage:
@z

% snip code...

@x
## RUN
@y
## RUN
@z

@x
The `RUN` instruction will execute any commands to create a new layer on top of
the current image. The added layer is used in the next step in the Dockerfile.
@y
The `RUN` instruction will execute any commands to create a new layer on top of
the current image. The added layer is used in the next step in the Dockerfile.
@z

% snip code...

@x
For more information about the differences between these two forms, see
[shell or exec forms](#shell-and-exec-form).
@y
For more information about the differences between these two forms, see
[shell or exec forms](#shell-and-exec-form).
@z

@x
The shell form is most commonly used, and lets you break up longer
instructions into multiple lines, either using newline [escapes](#escape), or
with [heredocs](#here-documents):
@y
The shell form is most commonly used, and lets you break up longer
instructions into multiple lines, either using newline [escapes](#escape), or
with [heredocs](#here-documents):
@z

% snip code...

@x
The available `[OPTIONS]` for the `RUN` instruction are:
@y
The available `[OPTIONS]` for the `RUN` instruction are:
@z

@x
| Option                          | Minimum Dockerfile version |
| ------------------------------- | -------------------------- |
| [`--mount`](#run---mount)       | 1.2                        |
| [`--network`](#run---network)   | 1.3                        |
| [`--security`](#run---security) | 1.1.2-labs                 |
@y
| Option                          | Minimum Dockerfile version |
| ------------------------------- | -------------------------- |
| [`--mount`](#run---mount)       | 1.2                        |
| [`--network`](#run---network)   | 1.3                        |
| [`--security`](#run---security) | 1.1.2-labs                 |
@z

@x
### Cache invalidation for RUN instructions
@y
### Cache invalidation for RUN instructions {#understand-how-arg-and-from-interact}
@z

@x
The cache for `RUN` instructions isn't invalidated automatically during
the next build. The cache for an instruction like
`RUN apt-get dist-upgrade -y` will be reused during the next build. The
cache for `RUN` instructions can be invalidated by using the `--no-cache`
flag, for example `docker build --no-cache`.
@y
The cache for `RUN` instructions isn't invalidated automatically during
the next build. The cache for an instruction like
`RUN apt-get dist-upgrade -y` will be reused during the next build. The
cache for `RUN` instructions can be invalidated by using the `--no-cache`
flag, for example `docker build --no-cache`.
@z

@x
See the [Dockerfile Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
@y
See the [Dockerfile Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
@z

@x
The cache for `RUN` instructions can be invalidated by [`ADD`](#add) and [`COPY`](#copy) instructions.
@y
The cache for `RUN` instructions can be invalidated by [`ADD`](#add) and [`COPY`](#copy) instructions.
@z

@x
### RUN --mount
@y
### RUN --mount
@z

% snip code...

@x
`RUN --mount` allows you to create filesystem mounts that the build can access.
This can be used to:
@y
`RUN --mount` allows you to create filesystem mounts that the build can access.
This can be used to:
@z

@x
- Create bind mount to the host filesystem or other build stages
- Access build secrets or ssh-agent sockets
- Use a persistent package management cache to speed up your build
@y
- Create bind mount to the host filesystem or other build stages
- Access build secrets or ssh-agent sockets
- Use a persistent package management cache to speed up your build
@z

@x
The supported mount types are:
@y
The supported mount types are:
@z

@x
| Type                                     | Description                                                                                                              |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| [`bind`](#run---mounttypebind) (default) | Bind-mount context directories (read-only).                                                                              |
| [`cache`](#run---mounttypecache)         | Mount a temporary directory to cache directories for compilers and package managers.                                     |
| [`tmpfs`](#run---mounttypetmpfs)         | Mount a `tmpfs` in the build container.                                                                                  |
| [`secret`](#run---mounttypesecret)       | Allow the build container to access secure files such as private keys without baking them into the image or build cache. |
| [`ssh`](#run---mounttypessh)             | Allow the build container to access SSH keys via SSH agents, with support for passphrases.                               |
@y
| Type                                     | Description                                                                                                              |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| [`bind`](#run---mounttypebind) (default) | Bind-mount context directories (read-only).                                                                              |
| [`cache`](#run---mounttypecache)         | Mount a temporary directory to cache directories for compilers and package managers.                                     |
| [`tmpfs`](#run---mounttypetmpfs)         | Mount a `tmpfs` in the build container.                                                                                  |
| [`secret`](#run---mounttypesecret)       | Allow the build container to access secure files such as private keys without baking them into the image or build cache. |
| [`ssh`](#run---mounttypessh)             | Allow the build container to access SSH keys via SSH agents, with support for passphrases.                               |
@z

@x
### RUN --mount=type=bind
@y
### RUN --mount=type=bind
@z

@x
This mount type allows binding files or directories to the build container. A
bind mount is read-only by default.
@y
This mount type allows binding files or directories to the build container. A
bind mount is read-only by default.
@z

@x
| Option                             | Description                                                                                    |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- |
| `target`, `dst`, `destination`[^1] | Mount path.                                                                                    |
| `source`                           | Source path in the `from`. Defaults to the root of the `from`.                                 |
| `from`                             | Build stage, context, or image name for the root of the source. Defaults to the build context. |
| `rw`,`readwrite`                   | Allow writes on the mount. Written data will be discarded.                                     |
@y
| Option                             | Description                                                                                    |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- |
| `target`, `dst`, `destination`[^1] | Mount path.                                                                                    |
| `source`                           | Source path in the `from`. Defaults to the root of the `from`.                                 |
| `from`                             | Build stage, context, or image name for the root of the source. Defaults to the build context. |
| `rw`,`readwrite`                   | Allow writes on the mount. Written data will be discarded.                                     |
@z

@x
### RUN --mount=type=cache
@y
### RUN --mount=type=cache
@z

@x
This mount type allows the build container to cache directories for compilers
and package managers.
@y
This mount type allows the build container to cache directories for compilers
and package managers.
@z

@x
| Option                             | Description                                                                                                                                                                                                                                                                |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                               | Optional ID to identify separate/different caches. Defaults to value of `target`.                                                                                                                                                                                          |
| `target`, `dst`, `destination`[^1] | Mount path.                                                                                                                                                                                                                                                                |
| `ro`,`readonly`                    | Read-only if set.                                                                                                                                                                                                                                                          |
| `sharing`                          | One of `shared`, `private`, or `locked`. Defaults to `shared`. A `shared` cache mount can be used concurrently by multiple writers. `private` creates a new mount if there are multiple writers. `locked` pauses the second writer until the first one releases the mount. |
| `from`                             | Build stage, context, or image name to use as a base of the cache mount. Defaults to empty directory.                                                                                                                                                                      |
| `source`                           | Subpath in the `from` to mount. Defaults to the root of the `from`.                                                                                                                                                                                                        |
| `mode`                             | File mode for new cache directory in octal. Default `0755`.                                                                                                                                                                                                                |
| `uid`                              | User ID for new cache directory. Default `0`.                                                                                                                                                                                                                              |
| `gid`                              | Group ID for new cache directory. Default `0`.                                                                                                                                                                                                                             |
@y
| Option                             | Description                                                                                                                                                                                                                                                                |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                               | Optional ID to identify separate/different caches. Defaults to value of `target`.                                                                                                                                                                                          |
| `target`, `dst`, `destination`[^1] | Mount path.                                                                                                                                                                                                                                                                |
| `ro`,`readonly`                    | Read-only if set.                                                                                                                                                                                                                                                          |
| `sharing`                          | One of `shared`, `private`, or `locked`. Defaults to `shared`. A `shared` cache mount can be used concurrently by multiple writers. `private` creates a new mount if there are multiple writers. `locked` pauses the second writer until the first one releases the mount. |
| `from`                             | Build stage, context, or image name to use as a base of the cache mount. Defaults to empty directory.                                                                                                                                                                      |
| `source`                           | Subpath in the `from` to mount. Defaults to the root of the `from`.                                                                                                                                                                                                        |
| `mode`                             | File mode for new cache directory in octal. Default `0755`.                                                                                                                                                                                                                |
| `uid`                              | User ID for new cache directory. Default `0`.                                                                                                                                                                                                                              |
| `gid`                              | Group ID for new cache directory. Default `0`.                                                                                                                                                                                                                             |
@z

@x
Contents of the cache directories persists between builder invocations without
invalidating the instruction cache. Cache mounts should only be used for better
performance. Your build should work with any contents of the cache directory as
another build may overwrite the files or GC may clean it if more storage space
is needed.
@y
Contents of the cache directories persists between builder invocations without
invalidating the instruction cache. Cache mounts should only be used for better
performance. Your build should work with any contents of the cache directory as
another build may overwrite the files or GC may clean it if more storage space
is needed.
@z

@x
#### Example: cache Go packages
@y
#### Example: cache Go packages
@z

% snip code...

@x
#### Example: cache apt packages
@y
#### Example: cache apt packages
@z

% snip code...

@x
Apt needs exclusive access to its data, so the caches use the option
`sharing=locked`, which will make sure multiple parallel builds using
the same cache mount will wait for each other and not access the same
cache files at the same time. You could also use `sharing=private` if
you prefer to have each build create another cache directory in this
case.
@y
Apt needs exclusive access to its data, so the caches use the option
`sharing=locked`, which will make sure multiple parallel builds using
the same cache mount will wait for each other and not access the same
cache files at the same time. You could also use `sharing=private` if
you prefer to have each build create another cache directory in this
case.
@z

@x
### RUN --mount=type=tmpfs
@y
### RUN --mount=type=tmpfs
@z

@x
This mount type allows mounting `tmpfs` in the build container.
@y
This mount type allows mounting `tmpfs` in the build container.
@z

@x
| Option                             | Description                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `target`, `dst`, `destination`[^1] | Mount path.                                           |
| `size`                             | Specify an upper limit on the size of the filesystem. |
@y
| Option                             | Description                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `target`, `dst`, `destination`[^1] | Mount path.                                           |
| `size`                             | Specify an upper limit on the size of the filesystem. |
@z

@x
### RUN --mount=type=secret
@y
### RUN --mount=type=secret
@z

@x
This mount type allows the build container to access secret values, such as
tokens or private keys, without baking them into the image.
@y
This mount type allows the build container to access secret values, such as
tokens or private keys, without baking them into the image.
@z

@x
By default, the secret is mounted as a file. You can also mount the secret as
an environment variable by setting the `env` option.
@y
By default, the secret is mounted as a file. You can also mount the secret as
an environment variable by setting the `env` option.
@z

@x
| Option                         | Description                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `id`                           | ID of the secret. Defaults to basename of the target path.                                                      |
| `target`, `dst`, `destination` | Mount the secret to the specified path. Defaults to `/run/secrets/` + `id` if unset and if `env` is also unset. |
| `env`                          | Mount the secret to an environment variable instead of a file, or both. (since Dockerfile v1.10.0)              |
| `required`                     | If set to `true`, the instruction errors out when the secret is unavailable. Defaults to `false`.               |
| `mode`                         | File mode for secret file in octal. Default `0400`.                                                             |
| `uid`                          | User ID for secret file. Default `0`.                                                                           |
| `gid`                          | Group ID for secret file. Default `0`.                                                                          |
@y
| Option                         | Description                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `id`                           | ID of the secret. Defaults to basename of the target path.                                                      |
| `target`, `dst`, `destination` | Mount the secret to the specified path. Defaults to `/run/secrets/` + `id` if unset and if `env` is also unset. |
| `env`                          | Mount the secret to an environment variable instead of a file, or both. (since Dockerfile v1.10.0)              |
| `required`                     | If set to `true`, the instruction errors out when the secret is unavailable. Defaults to `false`.               |
| `mode`                         | File mode for secret file in octal. Default `0400`.                                                             |
| `uid`                          | User ID for secret file. Default `0`.                                                                           |
| `gid`                          | Group ID for secret file. Default `0`.                                                                          |
@z

@x
#### Example: access to S3
@y
#### Example: access to S3
@z

% snip code...
% snip command...

@x
### RUN --mount=type=ssh
@y
### RUN --mount=type=ssh
@z

@x
This mount type allows the build container to access SSH keys via SSH agents,
with support for passphrases.
@y
This mount type allows the build container to access SSH keys via SSH agents,
with support for passphrases.
@z

@x
| Option                         | Description                                                                                    |
| ------------------------------ | ---------------------------------------------------------------------------------------------- |
| `id`                           | ID of SSH agent socket or key. Defaults to "default".                                          |
| `target`, `dst`, `destination` | SSH agent socket path. Defaults to `/run/buildkit/ssh_agent.${N}`.                             |
| `required`                     | If set to `true`, the instruction errors out when the key is unavailable. Defaults to `false`. |
| `mode`                         | File mode for socket in octal. Default `0600`.                                                 |
| `uid`                          | User ID for socket. Default `0`.                                                               |
| `gid`                          | Group ID for socket. Default `0`.                                                              |
@y
| Option                         | Description                                                                                    |
| ------------------------------ | ---------------------------------------------------------------------------------------------- |
| `id`                           | ID of SSH agent socket or key. Defaults to "default".                                          |
| `target`, `dst`, `destination` | SSH agent socket path. Defaults to `/run/buildkit/ssh_agent.${N}`.                             |
| `required`                     | If set to `true`, the instruction errors out when the key is unavailable. Defaults to `false`. |
| `mode`                         | File mode for socket in octal. Default `0600`.                                                 |
| `uid`                          | User ID for socket. Default `0`.                                                               |
| `gid`                          | Group ID for socket. Default `0`.                                                              |
@z

@x
#### Example: access to GitLab
@y
#### Example: access to GitLab
@z

% snip code...
% snip command...

@x
You can also specify a path to `*.pem` file on the host directly instead of `$SSH_AUTH_SOCK`.
However, pem files with passphrases are not supported.
@y
You can also specify a path to `*.pem` file on the host directly instead of `$SSH_AUTH_SOCK`.
However, pem files with passphrases are not supported.
@z

@x
### RUN --network
@y
### RUN --network
@z

% snip code...

@x
`RUN --network` allows control over which networking environment the command
is run in.
@y
`RUN --network` allows control over which networking environment the command
is run in.
@z

@x
The supported network types are:
@y
The supported network types are:
@z

@x
| Type                                         | Description                            |
| -------------------------------------------- | -------------------------------------- |
| [`default`](#run---networkdefault) (default) | Run in the default network.            |
| [`none`](#run---networknone)                 | Run with no network access.            |
| [`host`](#run---networkhost)                 | Run in the host's network environment. |
@y
| Type                                         | Description                            |
| -------------------------------------------- | -------------------------------------- |
| [`default`](#run---networkdefault) (default) | Run in the default network.            |
| [`none`](#run---networknone)                 | Run with no network access.            |
| [`host`](#run---networkhost)                 | Run in the host's network environment. |
@z

@x
### RUN --network=default
@y
### RUN --network=default
@z

@x
Equivalent to not supplying a flag at all, the command is run in the default
network for the build.
@y
Equivalent to not supplying a flag at all, the command is run in the default
network for the build.
@z

@x
### RUN --network=none
@y
### RUN --network=none
@z

@x
The command is run with no network access (`lo` is still available, but is
isolated to this process)
@y
The command is run with no network access (`lo` is still available, but is
isolated to this process)
@z

@x
#### Example: isolating external effects
@y
#### Example: isolating external effects
@z

% snip code...

@x
`pip` will only be able to install the packages provided in the tarfile, which
can be controlled by an earlier build stage.
@y
`pip` will only be able to install the packages provided in the tarfile, which
can be controlled by an earlier build stage.
@z

@x
### RUN --network=host
@y
### RUN --network=host
@z

@x
The command is run in the host's network environment (similar to
`docker build --network=host`, but on a per-instruction basis)
@y
The command is run in the host's network environment (similar to
`docker build --network=host`, but on a per-instruction basis)
@z

@x
> [!WARNING]
> The use of `--network=host` is protected by the `network.host` entitlement,
> which needs to be enabled when starting the buildkitd daemon with
> `--allow-insecure-entitlement network.host` flag or in [buildkitd config](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md),
> and for a build request with [`--allow network.host` flag](https://docs.docker.com/engine/reference/commandline/buildx_build/#allow).
@y
> [!WARNING]
> The use of `--network=host` is protected by the `network.host` entitlement,
> which needs to be enabled when starting the buildkitd daemon with
> `--allow-insecure-entitlement network.host` flag or in [buildkitd config](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md),
> and for a build request with [`--allow network.host` flag](https://docs.docker.com/engine/reference/commandline/buildx_build/#allow).
@z

@x
### RUN --security
@y
### RUN --security
@z

@x
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1-labs`](#syntax) version.
@y
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1-labs`](#syntax) version.
@z

% snip code...

@x
The default security mode is `sandbox`.
With `--security=insecure`, the builder runs the command without sandbox in insecure
mode, which allows to run flows requiring elevated privileges (e.g. containerd).
This is equivalent to running `docker run --privileged`.
@y
The default security mode is `sandbox`.
With `--security=insecure`, the builder runs the command without sandbox in insecure
mode, which allows to run flows requiring elevated privileges (e.g. containerd).
This is equivalent to running `docker run --privileged`.
@z

@x
> [!WARNING]
> In order to access this feature, entitlement `security.insecure` should be
> enabled when starting the buildkitd daemon with
> `--allow-insecure-entitlement security.insecure` flag or in [buildkitd config](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md),
> and for a build request with [`--allow security.insecure` flag](https://docs.docker.com/engine/reference/commandline/buildx_build/#allow).
@y
> [!WARNING]
> In order to access this feature, entitlement `security.insecure` should be
> enabled when starting the buildkitd daemon with
> `--allow-insecure-entitlement security.insecure` flag or in [buildkitd config](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md),
> and for a build request with [`--allow security.insecure` flag](https://docs.docker.com/engine/reference/commandline/buildx_build/#allow).
@z

@x
#### Example: check entitlements
@y
#### Example: check entitlements
@z

% snip code...
% snip text...

@x
## CMD
@y
## CMD
@z

@x
The `CMD` instruction sets the command to be executed when running a container
from an image.
@y
The `CMD` instruction sets the command to be executed when running a container
from an image.
@z

@x
You can specify `CMD` instructions using
[shell or exec forms](#shell-and-exec-form):
@y
You can specify `CMD` instructions using
[shell or exec forms](#shell-and-exec-form):
@z

@x
- `CMD ["executable","param1","param2"]` (exec form)
- `CMD ["param1","param2"]` (exec form, as default parameters to `ENTRYPOINT`)
- `CMD command param1 param2` (shell form)
@y
- `CMD ["executable","param1","param2"]` (exec 形式)
- `CMD ["param1","param2"]` (exec 形式、`ENTRYPOINT` のデフォルトパラメーター)
- `CMD command param1 param2` (シェル形式)
@z

@x
There can only be one `CMD` instruction in a Dockerfile. If you list more than
one `CMD`, only the last one takes effect.
@y
Dockerfile では `CMD` 命令を 1 つしか記述できません。
仮に複数の `CMD` を記述しても、最後の `CMD` 命令しか処理されません。
@z

@x
The purpose of a `CMD` is to provide defaults for an executing container. These
defaults can include an executable, or they can omit the executable, in which
case you must specify an `ENTRYPOINT` instruction as well.
@y
`CMD` 命令の目的は、コンテナーの実行時のデフォルト処理を設定することです。
この処理設定においては、実行モジュールを含める場合と、実行モジュールを省略する場合があります。
省略する場合は `ENTRYPOINT` 命令を合わせて指定する必要があります。
@z

@x
If you would like your container to run the same executable every time, then
you should consider using `ENTRYPOINT` in combination with `CMD`. See
[`ENTRYPOINT`](#entrypoint). If the user specifies arguments to `docker run`
then they will override the default specified in `CMD`, but still use the
default `ENTRYPOINT`.
@y
If you would like your container to run the same executable every time, then
you should consider using `ENTRYPOINT` in combination with `CMD`. See
[`ENTRYPOINT`](#entrypoint). If the user specifies arguments to `docker run`
then they will override the default specified in `CMD`, but still use the
default `ENTRYPOINT`.
@z

@x
If `CMD` is used to provide default arguments for the `ENTRYPOINT` instruction,
both the `CMD` and `ENTRYPOINT` instructions should be specified in the
[exec form](#exec-form).
@y
`ENTRYPOINT` 命令に対するデフォルト引数を設定する目的で `CMD` 命令を用いる場合、`CMD` と `ENTRYPOINT` の両命令とも、[exec 形式](#exec-form) で指定しなければなりません。
@z

@x
> [!NOTE]
> Don't confuse `RUN` with `CMD`. `RUN` actually runs a command and commits
> the result; `CMD` doesn't execute anything at build time, but specifies
> the intended command for the image.
@y
> [!NOTE]
> `RUN` と `CMD` を混同しないようにしてください。
> `RUN` はコマンドを実行して処理結果を確定させます。
> 一方 `CMD` はイメージビルド時には何も実行せず、ただイメージ内にてコマンド指示がされたことを定めるだけです。
@z

@x
## LABEL
@y
## LABEL
@z

% snip code...

@x
The `LABEL` instruction adds metadata to an image. A `LABEL` is a
key-value pair. To include spaces within a `LABEL` value, use quotes and
backslashes as you would in command-line parsing. A few usage examples:
@y
The `LABEL` instruction adds metadata to an image. A `LABEL` is a
key-value pair. To include spaces within a `LABEL` value, use quotes and
backslashes as you would in command-line parsing. A few usage examples:
@z

% snip code...

@x
An image can have more than one label. You can specify multiple labels on a
single line. Prior to Docker 1.10, this decreased the size of the final image,
but this is no longer the case. You may still choose to specify multiple labels
in a single instruction, in one of the following two ways:
@y
An image can have more than one label. You can specify multiple labels on a
single line. Prior to Docker 1.10, this decreased the size of the final image,
but this is no longer the case. You may still choose to specify multiple labels
in a single instruction, in one of the following two ways:
@z

% snip code...
% snip code...

@x
> [!NOTE]
> Be sure to use double quotes and not single quotes. Particularly when you are
> using string interpolation (e.g. `LABEL example="foo-$ENV_VAR"`), single
> quotes will take the string as is without unpacking the variable's value.
@y
> [!NOTE]
> Be sure to use double quotes and not single quotes. Particularly when you are
> using string interpolation (e.g. `LABEL example="foo-$ENV_VAR"`), single
> quotes will take the string as is without unpacking the variable's value.
@z

@x
Labels included in base images (images in the `FROM` line) are inherited by
your image. If a label already exists but with a different value, the
most-recently-applied value overrides any previously-set value.
@y
Labels included in base images (images in the `FROM` line) are inherited by
your image. If a label already exists but with a different value, the
most-recently-applied value overrides any previously-set value.
@z

@x
To view an image's labels, use the `docker image inspect` command. You can use
the `--format` option to show just the labels;
@y
To view an image's labels, use the `docker image inspect` command. You can use
the `--format` option to show just the labels;
@z

@x
```console
$ docker image inspect --format='{{json .Config.Labels}}' myimage
```
@y
```console
$ docker image inspect --format='{{json .Config.Labels}}' myimage
```
@z

@x
```json
{
  "com.example.vendor": "ACME Incorporated",
  "com.example.label-with-value": "foo",
  "version": "1.0",
  "description": "This text illustrates that label-values can span multiple lines.",
  "multi.label1": "value1",
  "multi.label2": "value2",
  "other": "value3"
}
```
@y
```json
{
  "com.example.vendor": "ACME Incorporated",
  "com.example.label-with-value": "foo",
  "version": "1.0",
  "description": "This text illustrates that label-values can span multiple lines.",
  "multi.label1": "value1",
  "multi.label2": "value2",
  "other": "value3"
}
```
@z

@x
## MAINTAINER (deprecated)
@y
## MAINTAINER (deprecated)
@z

@x
```dockerfile
MAINTAINER <name>
```
@y
```dockerfile
MAINTAINER <name>
```
@z

@x
The `MAINTAINER` instruction sets the _Author_ field of the generated images.
The `LABEL` instruction is a much more flexible version of this and you should use
it instead, as it enables setting any metadata you require, and can be viewed
easily, for example with `docker inspect`. To set a label corresponding to the
`MAINTAINER` field you could use:
@y
The `MAINTAINER` instruction sets the _Author_ field of the generated images.
The `LABEL` instruction is a much more flexible version of this and you should use
it instead, as it enables setting any metadata you require, and can be viewed
easily, for example with `docker inspect`. To set a label corresponding to the
`MAINTAINER` field you could use:
@z

@x
```dockerfile
LABEL org.opencontainers.image.authors="SvenDowideit@home.org.au"
```
@y
```dockerfile
LABEL org.opencontainers.image.authors="SvenDowideit@home.org.au"
```
@z

@x
This will then be visible from `docker inspect` with the other labels.
@y
This will then be visible from `docker inspect` with the other labels.
@z

@x
## EXPOSE
@y
## EXPOSE
@z

@x
```dockerfile
EXPOSE <port> [<port>/<protocol>...]
```
@y
```dockerfile
EXPOSE <port> [<port>/<protocol>...]
```
@z

@x
The `EXPOSE` instruction informs Docker that the container listens on the
specified network ports at runtime. You can specify whether the port listens on
TCP or UDP, and the default is TCP if you don't specify a protocol.
@y
The `EXPOSE` instruction informs Docker that the container listens on the
specified network ports at runtime. You can specify whether the port listens on
TCP or UDP, and the default is TCP if you don't specify a protocol.
@z

@x
The `EXPOSE` instruction doesn't actually publish the port. It functions as a
type of documentation between the person who builds the image and the person who
runs the container, about which ports are intended to be published. To
publish the port when running the container, use the `-p` flag on `docker run`
to publish and map one or more ports, or the `-P` flag to publish all exposed
ports and map them to high-order ports.
@y
The `EXPOSE` instruction doesn't actually publish the port. It functions as a
type of documentation between the person who builds the image and the person who
runs the container, about which ports are intended to be published. To
publish the port when running the container, use the `-p` flag on `docker run`
to publish and map one or more ports, or the `-P` flag to publish all exposed
ports and map them to high-order ports.
@z

@x
By default, `EXPOSE` assumes TCP. You can also specify UDP:
@y
By default, `EXPOSE` assumes TCP. You can also specify UDP:
@z

@x
```dockerfile
EXPOSE 80/udp
```
@y
```dockerfile
EXPOSE 80/udp
```
@z

@x
To expose on both TCP and UDP, include two lines:
@y
To expose on both TCP and UDP, include two lines:
@z

@x
```dockerfile
EXPOSE 80/tcp
EXPOSE 80/udp
```
@y
```dockerfile
EXPOSE 80/tcp
EXPOSE 80/udp
```
@z

@x
In this case, if you use `-P` with `docker run`, the port will be exposed once
for TCP and once for UDP. Remember that `-P` uses an ephemeral high-ordered host
port on the host, so TCP and UDP doesn't use the same port.
@y
In this case, if you use `-P` with `docker run`, the port will be exposed once
for TCP and once for UDP. Remember that `-P` uses an ephemeral high-ordered host
port on the host, so TCP and UDP doesn't use the same port.
@z

@x
Regardless of the `EXPOSE` settings, you can override them at runtime by using
the `-p` flag. For example
@y
Regardless of the `EXPOSE` settings, you can override them at runtime by using
the `-p` flag. For example
@z

@x
```console
$ docker run -p 80:80/tcp -p 80:80/udp ...
```
@y
```console
$ docker run -p 80:80/tcp -p 80:80/udp ...
```
@z

@x
To set up port redirection on the host system, see [using the -P flag](https://docs.docker.com/reference/cli/docker/container/run/#publish).
The `docker network` command supports creating networks for communication among
containers without the need to expose or publish specific ports, because the
containers connected to the network can communicate with each other over any
port. For detailed information, see the
[overview of this feature](https://docs.docker.com/engine/userguide/networking/).
@y
To set up port redirection on the host system, see [using the -P flag](https://docs.docker.com/reference/cli/docker/container/run/#publish).
The `docker network` command supports creating networks for communication among
containers without the need to expose or publish specific ports, because the
containers connected to the network can communicate with each other over any
port. For detailed information, see the
[overview of this feature](https://docs.docker.com/engine/userguide/networking/).
@z

@x
## ENV
@y
## ENV
@z

@x
```dockerfile
ENV <key>=<value> [<key>=<value>...]
```
@y
```dockerfile
ENV <key>=<value> [<key>=<value>...]
```
@z

@x
The `ENV` instruction sets the environment variable `<key>` to the value
`<value>`. This value will be in the environment for all subsequent instructions
in the build stage and can be [replaced inline](#environment-replacement) in
many as well. The value will be interpreted for other environment variables, so
quote characters will be removed if they are not escaped. Like command line parsing,
quotes and backslashes can be used to include spaces within values.
@y
The `ENV` instruction sets the environment variable `<key>` to the value
`<value>`. This value will be in the environment for all subsequent instructions
in the build stage and can be [replaced inline](#environment-replacement) in
many as well. The value will be interpreted for other environment variables, so
quote characters will be removed if they are not escaped. Like command line parsing,
quotes and backslashes can be used to include spaces within values.
@z

@x
Example:
@y
Example:
@z

@x
```dockerfile
ENV MY_NAME="John Doe"
ENV MY_DOG=Rex\ The\ Dog
ENV MY_CAT=fluffy
```
@y
```dockerfile
ENV MY_NAME="John Doe"
ENV MY_DOG=Rex\ The\ Dog
ENV MY_CAT=fluffy
```
@z

@x
The `ENV` instruction allows for multiple `<key>=<value> ...` variables to be set
at one time, and the example below will yield the same net results in the final
image:
@y
The `ENV` instruction allows for multiple `<key>=<value> ...` variables to be set
at one time, and the example below will yield the same net results in the final
image:
@z

@x
```dockerfile
ENV MY_NAME="John Doe" MY_DOG=Rex\ The\ Dog \
    MY_CAT=fluffy
```
@y
```dockerfile
ENV MY_NAME="John Doe" MY_DOG=Rex\ The\ Dog \
    MY_CAT=fluffy
```
@z

@x
The environment variables set using `ENV` will persist when a container is run
from the resulting image. You can view the values using `docker inspect`, and
change them using `docker run --env <key>=<value>`.
@y
The environment variables set using `ENV` will persist when a container is run
from the resulting image. You can view the values using `docker inspect`, and
change them using `docker run --env <key>=<value>`.
@z

@x
A stage inherits any environment variables that were set using `ENV` by its
parent stage or any ancestor. Refer to the [multi-stage builds section](https://docs.docker.com/build/building/multi-stage/)
in the manual for more information.
@y
A stage inherits any environment variables that were set using `ENV` by its
parent stage or any ancestor. Refer to the [multi-stage builds section](https://docs.docker.com/build/building/multi-stage/)
in the manual for more information.
@z

@x
Environment variable persistence can cause unexpected side effects. For example,
setting `ENV DEBIAN_FRONTEND=noninteractive` changes the behavior of `apt-get`,
and may confuse users of your image.
@y
Environment variable persistence can cause unexpected side effects. For example,
setting `ENV DEBIAN_FRONTEND=noninteractive` changes the behavior of `apt-get`,
and may confuse users of your image.
@z

@x
If an environment variable is only needed during build, and not in the final
image, consider setting a value for a single command instead:
@y
If an environment variable is only needed during build, and not in the final
image, consider setting a value for a single command instead:
@z

@x
```dockerfile
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y ...
```
@y
```dockerfile
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y ...
```
@z

@x
Or using [`ARG`](#arg), which is not persisted in the final image:
@y
Or using [`ARG`](#arg), which is not persisted in the final image:
@z

@x
```dockerfile
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ...
```
@y
```dockerfile
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ...
```
@z

@x
> [!NOTE]
> **Alternative syntax**
>
> The `ENV` instruction also allows an alternative syntax `ENV <key> <value>`,
> omitting the `=`. For example:
>
> ```dockerfile
> ENV MY_VAR my-value
> ```
>
> This syntax does not allow for multiple environment-variables to be set in a
> single `ENV` instruction, and can be confusing. For example, the following
> sets a single environment variable (`ONE`) with value `"TWO= THREE=world"`:
>
> ```dockerfile
> ENV ONE TWO= THREE=world
> ```
>
> The alternative syntax is supported for backward compatibility, but discouraged
> for the reasons outlined above, and may be removed in a future release.
@y
> [!NOTE]
> **Alternative syntax**
>
> The `ENV` instruction also allows an alternative syntax `ENV <key> <value>`,
> omitting the `=`. For example:
>
> ```dockerfile
> ENV MY_VAR my-value
> ```
>
> This syntax does not allow for multiple environment-variables to be set in a
> single `ENV` instruction, and can be confusing. For example, the following
> sets a single environment variable (`ONE`) with value `"TWO= THREE=world"`:
>
> ```dockerfile
> ENV ONE TWO= THREE=world
> ```
>
> The alternative syntax is supported for backward compatibility, but discouraged
> for the reasons outlined above, and may be removed in a future release.
@z

@x
## ADD
@y
## ADD
@z

@x
ADD has two forms.
The latter form is required for paths containing whitespace.
@y
ADD has two forms.
The latter form is required for paths containing whitespace.
@z

@x
```dockerfile
ADD [OPTIONS] <src> ... <dest>
ADD [OPTIONS] ["<src>", ... "<dest>"]
```
@y
```dockerfile
ADD [OPTIONS] <src> ... <dest>
ADD [OPTIONS] ["<src>", ... "<dest>"]
```
@z

@x
The available `[OPTIONS]` are:
@y
The available `[OPTIONS]` are:
@z

@x
| Option                                  | Minimum Dockerfile version |
| --------------------------------------- | -------------------------- |
| [`--keep-git-dir`](#add---keep-git-dir) | 1.1                        |
| [`--checksum`](#add---checksum)         | 1.6                        |
| [`--chown`](#add---chown---chmod)       |                            |
| [`--chmod`](#add---chown---chmod)       | 1.2                        |
| [`--link`](#add---link)                 | 1.4                        |
| [`--exclude`](#add---exclude)           | 1.7-labs                   |
@y
| Option                                  | Minimum Dockerfile version |
| --------------------------------------- | -------------------------- |
| [`--keep-git-dir`](#add---keep-git-dir) | 1.1                        |
| [`--checksum`](#add---checksum)         | 1.6                        |
| [`--chown`](#add---chown---chmod)       |                            |
| [`--chmod`](#add---chown---chmod)       | 1.2                        |
| [`--link`](#add---link)                 | 1.4                        |
| [`--exclude`](#add---exclude)           | 1.7-labs                   |
@z

@x
The `ADD` instruction copies new files or directories from `<src>` and adds
them to the filesystem of the image at the path `<dest>`. Files and directories
can be copied from the build context, a remote URL, or a Git repository.
@y
The `ADD` instruction copies new files or directories from `<src>` and adds
them to the filesystem of the image at the path `<dest>`. Files and directories
can be copied from the build context, a remote URL, or a Git repository.
@z

@x
The `ADD` and `COPY` instructions are functionally similar, but serve slightly different purposes.
Learn more about the [differences between `ADD` and `COPY`](https://docs.docker.com/build/building/best-practices/#add-or-copy).
@y
The `ADD` and `COPY` instructions are functionally similar, but serve slightly different purposes.
Learn more about the [differences between `ADD` and `COPY`](https://docs.docker.com/build/building/best-practices/#add-or-copy).
@z

@x
### Source
@y
### Source
@z

@x
You can specify multiple source files or directories with `ADD`. The last
argument must always be the destination. For example, to add two files,
`file1.txt` and `file2.txt`, from the build context to `/usr/src/things/` in
the build container:
@y
You can specify multiple source files or directories with `ADD`. The last
argument must always be the destination. For example, to add two files,
`file1.txt` and `file2.txt`, from the build context to `/usr/src/things/` in
the build container:
@z

@x
```dockerfile
ADD file1.txt file2.txt /usr/src/things/
```
@y
```dockerfile
ADD file1.txt file2.txt /usr/src/things/
```
@z

@x
If you specify multiple source files, either directly or using a wildcard, then
the destination must be a directory (must end with a slash `/`).
@y
If you specify multiple source files, either directly or using a wildcard, then
the destination must be a directory (must end with a slash `/`).
@z

@x
To add files from a remote location, you can specify a URL or the address of a
Git repository as the source. For example:
@y
To add files from a remote location, you can specify a URL or the address of a
Git repository as the source. For example:
@z

@x
```dockerfile
ADD https://example.com/archive.zip /usr/src/things/
ADD git@github.com:user/repo.git /usr/src/things/
```
@y
```dockerfile
ADD https://example.com/archive.zip /usr/src/things/
ADD git@github.com:user/repo.git /usr/src/things/
```
@z

@x
BuildKit detects the type of `<src>` and processes it accordingly.
@y
BuildKit detects the type of `<src>` and processes it accordingly.
@z

@x
- If `<src>` is a local file or directory, the contents of the directory are
  copied to the specified destination. See [Adding files from the build context](#adding-files-from-the-build-context).
- If `<src>` is a local tar archive, it is decompressed and extracted to the
  specified destination. See [Adding local tar archives](#adding-local-tar-archives).
- If `<src>` is a URL, the contents of the URL are downloaded and placed at
  the specified destination. See [Adding files from a URL](#adding-files-from-a-url).
- If `<src>` is a Git repository, the repository is cloned to the specified
  destination. See [Adding files from a Git repository](#adding-files-from-a-git-repository).
@y
- If `<src>` is a local file or directory, the contents of the directory are
  copied to the specified destination. See [Adding files from the build context](#adding-files-from-the-build-context).
- If `<src>` is a local tar archive, it is decompressed and extracted to the
  specified destination. See [Adding local tar archives](#adding-local-tar-archives).
- If `<src>` is a URL, the contents of the URL are downloaded and placed at
  the specified destination. See [Adding files from a URL](#adding-files-from-a-url).
- If `<src>` is a Git repository, the repository is cloned to the specified
  destination. See [Adding files from a Git repository](#adding-files-from-a-git-repository).
@z

@x
#### Adding files from the build context
@y
#### Adding files from the build context
@z

@x
Any relative or local path that doesn't begin with a `http://`, `https://`, or
`git@` protocol prefix is considered a local file path. The local file path is
relative to the build context. For example, if the build context is the current
directory, `ADD file.txt /` adds the file at `./file.txt` to the root of the
filesystem in the build container.
@y
Any relative or local path that doesn't begin with a `http://`, `https://`, or
`git@` protocol prefix is considered a local file path. The local file path is
relative to the build context. For example, if the build context is the current
directory, `ADD file.txt /` adds the file at `./file.txt` to the root of the
filesystem in the build container.
@z

@x
Specifying a source path with a leading slash or one that navigates outside the
build context, such as `ADD ../something /something`, automatically removes any
parent directory navigation (`../`). Trailing slashes in the source path are
also disregarded, making `ADD something/ /something` equivalent to `ADD
something /something`.
@y
Specifying a source path with a leading slash or one that navigates outside the
build context, such as `ADD ../something /something`, automatically removes any
parent directory navigation (`../`). Trailing slashes in the source path are
also disregarded, making `ADD something/ /something` equivalent to `ADD
something /something`.
@z

@x
If the source is a directory, the contents of the directory are copied,
including filesystem metadata. The directory itself isn't copied, only its
contents. If it contains subdirectories, these are also copied, and merged with
any existing directories at the destination. Any conflicts are resolved in
favor of the content being added, on a file-by-file basis, except if you're
trying to copy a directory onto an existing file, in which case an error is
raised.
@y
If the source is a directory, the contents of the directory are copied,
including filesystem metadata. The directory itself isn't copied, only its
contents. If it contains subdirectories, these are also copied, and merged with
any existing directories at the destination. Any conflicts are resolved in
favor of the content being added, on a file-by-file basis, except if you're
trying to copy a directory onto an existing file, in which case an error is
raised.
@z

@x
If the source is a file, the file and its metadata are copied to the
destination. File permissions are preserved. If the source is a file and a
directory with the same name exists at the destination, an error is raised.
@y
If the source is a file, the file and its metadata are copied to the
destination. File permissions are preserved. If the source is a file and a
directory with the same name exists at the destination, an error is raised.
@z

@x
If you pass a Dockerfile through stdin to the build (`docker build - <
Dockerfile`), there is no build context. In this case, you can only use the
`ADD` instruction to copy remote files. You can also pass a tar archive through
stdin: (`docker build - < archive.tar`), the Dockerfile at the root of the
archive and the rest of the archive will be used as the context of the build.
@y
If you pass a Dockerfile through stdin to the build (`docker build - <
Dockerfile`), there is no build context. In this case, you can only use the
`ADD` instruction to copy remote files. You can also pass a tar archive through
stdin: (`docker build - < archive.tar`), the Dockerfile at the root of the
archive and the rest of the archive will be used as the context of the build.
@z

@x
##### Pattern matching
@y
##### Pattern matching
@z

@x
For local files, each `<src>` may contain wildcards and matching will be done
using Go's [filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
@y
For local files, each `<src>` may contain wildcards and matching will be done
using Go's [filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
@z

@x
For example, to add all files and directories in the root of the build context
ending with `.png`:
@y
For example, to add all files and directories in the root of the build context
ending with `.png`:
@z

@x
```dockerfile
ADD *.png /dest/
```
@y
```dockerfile
ADD *.png /dest/
```
@z

@x
In the following example, `?` is a single-character wildcard, matching e.g.
`index.js` and `index.ts`.
@y
In the following example, `?` is a single-character wildcard, matching e.g.
`index.js` and `index.ts`.
@z

@x
```dockerfile
ADD index.?s /dest/
```
@y
```dockerfile
ADD index.?s /dest/
```
@z

@x
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
@y
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
@z

@x
```dockerfile
ADD arr[[]0].txt /dest/
```
@y
```dockerfile
ADD arr[[]0].txt /dest/
```
@z

@x
#### Adding local tar archives
@y
#### Adding local tar archives
@z

@x
When using a local tar archive as the source for `ADD`, and the archive is in a
recognized compression format (`gzip`, `bzip2` or `xz`, or uncompressed), the
archive is decompressed and extracted into the specified destination. Only
local tar archives are extracted. If the tar archive is a remote URL, the
archive is not extracted, but downloaded and placed at the destination.
@y
When using a local tar archive as the source for `ADD`, and the archive is in a
recognized compression format (`gzip`, `bzip2` or `xz`, or uncompressed), the
archive is decompressed and extracted into the specified destination. Only
local tar archives are extracted. If the tar archive is a remote URL, the
archive is not extracted, but downloaded and placed at the destination.
@z

@x
When a directory is extracted, it has the same behavior as `tar -x`.
The result is the union of:
@y
When a directory is extracted, it has the same behavior as `tar -x`.
The result is the union of:
@z

@x
1. Whatever existed at the destination path, and
2. The contents of the source tree, with conflicts resolved in favor of the
   content being added, on a file-by-file basis.
@y
1. Whatever existed at the destination path, and
2. The contents of the source tree, with conflicts resolved in favor of the
   content being added, on a file-by-file basis.
@z

@x
> [!NOTE]
> Whether a file is identified as a recognized compression format or not is
> done solely based on the contents of the file, not the name of the file. For
> example, if an empty file happens to end with `.tar.gz` this isn't recognized
> as a compressed file and doesn't generate any kind of decompression error
> message, rather the file will simply be copied to the destination.
@y
> [!NOTE]
> Whether a file is identified as a recognized compression format or not is
> done solely based on the contents of the file, not the name of the file. For
> example, if an empty file happens to end with `.tar.gz` this isn't recognized
> as a compressed file and doesn't generate any kind of decompression error
> message, rather the file will simply be copied to the destination.
@z

@x
#### Adding files from a URL
@y
#### Adding files from a URL
@z

@x
In the case where source is a remote file URL, the destination will have
permissions of 600. If the HTTP response contains a `Last-Modified` header, the
timestamp from that header will be used to set the `mtime` on the destination
file. However, like any other file processed during an `ADD`, `mtime` isn't
included in the determination of whether or not the file has changed and the
cache should be updated.
@y
In the case where source is a remote file URL, the destination will have
permissions of 600. If the HTTP response contains a `Last-Modified` header, the
timestamp from that header will be used to set the `mtime` on the destination
file. However, like any other file processed during an `ADD`, `mtime` isn't
included in the determination of whether or not the file has changed and the
cache should be updated.
@z

@x
If the destination ends with a trailing slash, then the filename is inferred
from the URL path. For example, `ADD http://example.com/foobar /` would create
the file `/foobar`. The URL must have a nontrivial path so that an appropriate
filename can be discovered (`http://example.com` doesn't work).
@y
If the destination ends with a trailing slash, then the filename is inferred
from the URL path. For example, `ADD http://example.com/foobar /` would create
the file `/foobar`. The URL must have a nontrivial path so that an appropriate
filename can be discovered (`http://example.com` doesn't work).
@z

@x
If the destination doesn't end with a trailing slash, the destination path
becomes the filename of the file downloaded from the URL. For example, `ADD
http://example.com/foo /bar` creates the file `/bar`.
@y
If the destination doesn't end with a trailing slash, the destination path
becomes the filename of the file downloaded from the URL. For example, `ADD
http://example.com/foo /bar` creates the file `/bar`.
@z

@x
If your URL files are protected using authentication, you need to use `RUN wget`,
`RUN curl` or use another tool from within the container as the `ADD` instruction
doesn't support authentication.
@y
If your URL files are protected using authentication, you need to use `RUN wget`,
`RUN curl` or use another tool from within the container as the `ADD` instruction
doesn't support authentication.
@z

@x
#### Adding files from a Git repository
@y
#### Adding files from a Git repository
@z

@x
To use a Git repository as the source for `ADD`, you can reference the
repository's HTTP or SSH address as the source. The repository is cloned to the
specified destination in the image.
@y
To use a Git repository as the source for `ADD`, you can reference the
repository's HTTP or SSH address as the source. The repository is cloned to the
specified destination in the image.
@z

@x
```dockerfile
ADD https://github.com/user/repo.git /mydir/
```
@y
```dockerfile
ADD https://github.com/user/repo.git /mydir/
```
@z

@x
You can use URL fragments to specify a specific branch, tag, commit, or
subdirectory. For example, to add the `docs` directory of the `v0.14.1` tag of
the `buildkit` repository:
@y
You can use URL fragments to specify a specific branch, tag, commit, or
subdirectory. For example, to add the `docs` directory of the `v0.14.1` tag of
the `buildkit` repository:
@z

@x
```dockerfile
ADD git@github.com:moby/buildkit.git#v0.14.1:docs /buildkit-docs
```
@y
```dockerfile
ADD git@github.com:moby/buildkit.git#v0.14.1:docs /buildkit-docs
```
@z

@x
For more information about Git URL fragments,
see [URL fragments](https://docs.docker.com/build/building/context/#url-fragments).
@y
For more information about Git URL fragments,
see [URL fragments](https://docs.docker.com/build/building/context/#url-fragments).
@z

@x
When adding from a Git repository, the permissions bits for files
are 644. If a file in the repository has the executable bit set, it will have
permissions set to 755. Directories have permissions set to 755.
@y
When adding from a Git repository, the permissions bits for files
are 644. If a file in the repository has the executable bit set, it will have
permissions set to 755. Directories have permissions set to 755.
@z

@x
When using a Git repository as the source, the repository must be accessible
from the build context. To add a repository via SSH, whether public or private,
you must pass an SSH key for authentication. For example, given the following
Dockerfile:
@y
When using a Git repository as the source, the repository must be accessible
from the build context. To add a repository via SSH, whether public or private,
you must pass an SSH key for authentication. For example, given the following
Dockerfile:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD git@git.example.com:foo/bar.git /bar
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD git@git.example.com:foo/bar.git /bar
```
@z

@x
To build this Dockerfile, pass the `--ssh` flag to the `docker build` to mount
the SSH agent socket to the build. For example:
@y
To build this Dockerfile, pass the `--ssh` flag to the `docker build` to mount
the SSH agent socket to the build. For example:
@z

@x
```console
$ docker build --ssh default .
```
@y
```console
$ docker build --ssh default .
```
@z

@x
For more information about building with secrets,
see [Build secrets](https://docs.docker.com/build/building/secrets/).
@y
For more information about building with secrets,
see [Build secrets](https://docs.docker.com/build/building/secrets/).
@z

@x
### Destination
@y
### Destination
@z

@x
If the destination path begins with a forward slash, it's interpreted as an
absolute path, and the source files are copied into the specified destination
relative to the root of the current build stage.
@y
If the destination path begins with a forward slash, it's interpreted as an
absolute path, and the source files are copied into the specified destination
relative to the root of the current build stage.
@z

@x
```dockerfile
# create /abs/test.txt
ADD test.txt /abs/
```
@y
```dockerfile
# create /abs/test.txt
ADD test.txt /abs/
```
@z

@x
Trailing slashes are significant. For example, `ADD test.txt /abs` creates a
file at `/abs`, whereas `ADD test.txt /abs/` creates `/abs/test.txt`.
@y
Trailing slashes are significant. For example, `ADD test.txt /abs` creates a
file at `/abs`, whereas `ADD test.txt /abs/` creates `/abs/test.txt`.
@z

@x
If the destination path doesn't begin with a leading slash, it's interpreted as
relative to the working directory of the build container.
@y
If the destination path doesn't begin with a leading slash, it's interpreted as
relative to the working directory of the build container.
@z

@x
```dockerfile
WORKDIR /usr/src/app
# create /usr/src/app/rel/test.txt
ADD test.txt rel/
```
@y
```dockerfile
WORKDIR /usr/src/app
# create /usr/src/app/rel/test.txt
ADD test.txt rel/
```
@z

@x
If destination doesn't exist, it's created, along with all missing directories
in its path.
@y
If destination doesn't exist, it's created, along with all missing directories
in its path.
@z

@x
If the source is a file, and the destination doesn't end with a trailing slash,
the source file will be written to the destination path as a file.
@y
If the source is a file, and the destination doesn't end with a trailing slash,
the source file will be written to the destination path as a file.
@z

@x
### ADD --keep-git-dir
@y
### ADD --keep-git-dir
@z

@x
```dockerfile
ADD [--keep-git-dir=<boolean>] <src> ... <dir>
```
@y
```dockerfile
ADD [--keep-git-dir=<boolean>] <src> ... <dir>
```
@z

@x
When `<src>` is the HTTP or SSH address of a remote Git repository,
BuildKit adds the contents of the Git repository to the image
excluding the `.git` directory by default.
@y
When `<src>` is the HTTP or SSH address of a remote Git repository,
BuildKit adds the contents of the Git repository to the image
excluding the `.git` directory by default.
@z

@x
The `--keep-git-dir=true` flag lets you preserve the `.git` directory.
@y
The `--keep-git-dir=true` flag lets you preserve the `.git` directory.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD --keep-git-dir=true https://github.com/moby/buildkit.git#v0.10.1 /buildkit
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ADD --keep-git-dir=true https://github.com/moby/buildkit.git#v0.10.1 /buildkit
```
@z

@x
### ADD --checksum
@y
### ADD --checksum
@z

% snip code...

@x
The `--checksum` flag lets you verify the checksum of a remote resource. The
checksum is formatted as `sha256:<hash>`. SHA-256 is the only supported hash
algorithm.
@y
The `--checksum` flag lets you verify the checksum of a remote resource. The
checksum is formatted as `sha256:<hash>`. SHA-256 is the only supported hash
algorithm.
@z

% snip code...

@x
The `--checksum` flag only supports HTTP(S) sources.
@y
The `--checksum` flag only supports HTTP(S) sources.
@z

@x
### ADD --chown --chmod
@y
### ADD --chown --chmod
@z

@x
See [`COPY --chown --chmod`](#copy---chown---chmod).
@y
See [`COPY --chown --chmod`](#copy---chown---chmod).
@z

@x
### ADD --link
@y
### ADD --link
@z

@x
See [`COPY --link`](#copy---link).
@y
See [`COPY --link`](#copy---link).
@z

@x
### ADD --exclude
@y
### ADD --exclude
@z

@x
See [`COPY --exclude`](#copy---exclude).
@y
See [`COPY --exclude`](#copy---exclude).
@z

@x
## COPY
@y
## COPY
@z

@x
COPY has two forms.
The latter form is required for paths containing whitespace.
@y
COPY has two forms.
The latter form is required for paths containing whitespace.
@z

@x
```dockerfile
COPY [OPTIONS] <src> ... <dest>
COPY [OPTIONS] ["<src>", ... "<dest>"]
```
@y
```dockerfile
COPY [OPTIONS] <src> ... <dest>
COPY [OPTIONS] ["<src>", ... "<dest>"]
```
@z

@x
The available `[OPTIONS]` are:
@y
The available `[OPTIONS]` are:
@z

@x
| Option                             | Minimum Dockerfile version |
| ---------------------------------- | -------------------------- |
| [`--from`](#copy---from)           |                            |
| [`--chown`](#copy---chown---chmod) |                            |
| [`--chmod`](#copy---chown---chmod) | 1.2                        |
| [`--link`](#copy---link)           | 1.4                        |
| [`--parents`](#copy---parents)     | 1.7-labs                   |
| [`--exclude`](#copy---exclude)     | 1.7-labs                   |
@y
| Option                             | Minimum Dockerfile version |
| ---------------------------------- | -------------------------- |
| [`--from`](#copy---from)           |                            |
| [`--chown`](#copy---chown---chmod) |                            |
| [`--chmod`](#copy---chown---chmod) | 1.2                        |
| [`--link`](#copy---link)           | 1.4                        |
| [`--parents`](#copy---parents)     | 1.7-labs                   |
| [`--exclude`](#copy---exclude)     | 1.7-labs                   |
@z

@x
The `COPY` instruction copies new files or directories from `<src>` and adds
them to the filesystem of the image at the path `<dest>`. Files and directories
can be copied from the build context, build stage, named context, or an image.
@y
The `COPY` instruction copies new files or directories from `<src>` and adds
them to the filesystem of the image at the path `<dest>`. Files and directories
can be copied from the build context, build stage, named context, or an image.
@z

@x
The `ADD` and `COPY` instructions are functionally similar, but serve slightly different purposes.
Learn more about the [differences between `ADD` and `COPY`](https://docs.docker.com/build/building/best-practices/#add-or-copy).
@y
The `ADD` and `COPY` instructions are functionally similar, but serve slightly different purposes.
Learn more about the [differences between `ADD` and `COPY`](https://docs.docker.com/build/building/best-practices/#add-or-copy).
@z

@x
### Source
@y
### Source
@z

@x
You can specify multiple source files or directories with `COPY`. The last
argument must always be the destination. For example, to copy two files,
`file1.txt` and `file2.txt`, from the build context to `/usr/src/things/` in
the build container:
@y
You can specify multiple source files or directories with `COPY`. The last
argument must always be the destination. For example, to copy two files,
`file1.txt` and `file2.txt`, from the build context to `/usr/src/things/` in
the build container:
@z

@x
```dockerfile
COPY file1.txt file2.txt /usr/src/things/
```
@y
```dockerfile
COPY file1.txt file2.txt /usr/src/things/
```
@z

@x
If you specify multiple source files, either directly or using a wildcard, then
the destination must be a directory (must end with a slash `/`).
@y
If you specify multiple source files, either directly or using a wildcard, then
the destination must be a directory (must end with a slash `/`).
@z

@x
`COPY` accepts a flag `--from=<name>` that lets you specify the source location
to be a build stage, context, or image. The following example copies files from
a stage named `build`:
@y
`COPY` accepts a flag `--from=<name>` that lets you specify the source location
to be a build stage, context, or image. The following example copies files from
a stage named `build`:
@z

@x
```dockerfile
FROM golang AS build
WORKDIR /app
RUN --mount=type=bind,target=. go build -o /myapp ./cmd
@y
```dockerfile
FROM golang AS build
WORKDIR /app
RUN --mount=type=bind,target=. go build -o /myapp ./cmd
@z

@x
COPY --from=build /myapp /usr/bin/
```
@y
COPY --from=build /myapp /usr/bin/
```
@z

@x
For more information about copying from named sources, see the
[`--from` flag](#copy---from).
@y
For more information about copying from named sources, see the
[`--from` flag](#copy---from).
@z

@x
#### Copying from the build context
@y
#### Copying from the build context
@z

@x
When copying source files from the build context, paths are interpreted as
relative to the root of the context.
@y
When copying source files from the build context, paths are interpreted as
relative to the root of the context.
@z

@x
Specifying a source path with a leading slash or one that navigates outside the
build context, such as `COPY ../something /something`, automatically removes
any parent directory navigation (`../`). Trailing slashes in the source path
are also disregarded, making `COPY something/ /something` equivalent to `COPY
something /something`.
@y
Specifying a source path with a leading slash or one that navigates outside the
build context, such as `COPY ../something /something`, automatically removes
any parent directory navigation (`../`). Trailing slashes in the source path
are also disregarded, making `COPY something/ /something` equivalent to `COPY
something /something`.
@z

@x
If the source is a directory, the contents of the directory are copied,
including filesystem metadata. The directory itself isn't copied, only its
contents. If it contains subdirectories, these are also copied, and merged with
any existing directories at the destination. Any conflicts are resolved in
favor of the content being added, on a file-by-file basis, except if you're
trying to copy a directory onto an existing file, in which case an error is
raised.
@y
If the source is a directory, the contents of the directory are copied,
including filesystem metadata. The directory itself isn't copied, only its
contents. If it contains subdirectories, these are also copied, and merged with
any existing directories at the destination. Any conflicts are resolved in
favor of the content being added, on a file-by-file basis, except if you're
trying to copy a directory onto an existing file, in which case an error is
raised.
@z

@x
If the source is a file, the file and its metadata are copied to the
destination. File permissions are preserved. If the source is a file and a
directory with the same name exists at the destination, an error is raised.
@y
If the source is a file, the file and its metadata are copied to the
destination. File permissions are preserved. If the source is a file and a
directory with the same name exists at the destination, an error is raised.
@z

@x
If you pass a Dockerfile through stdin to the build (`docker build - <
Dockerfile`), there is no build context. In this case, you can only use the
`COPY` instruction to copy files from other stages, named contexts, or images,
using the [`--from` flag](#copy---from). You can also pass a tar archive
through stdin: (`docker build - < archive.tar`), the Dockerfile at the root of
the archive and the rest of the archive will be used as the context of the
build.
@y
If you pass a Dockerfile through stdin to the build (`docker build - <
Dockerfile`), there is no build context. In this case, you can only use the
`COPY` instruction to copy files from other stages, named contexts, or images,
using the [`--from` flag](#copy---from). You can also pass a tar archive
through stdin: (`docker build - < archive.tar`), the Dockerfile at the root of
the archive and the rest of the archive will be used as the context of the
build.
@z

@x
When using a Git repository as the build context, the permissions bits for
copied files are 644. If a file in the repository has the executable bit set,
it will have permissions set to 755. Directories have permissions set to 755.
@y
When using a Git repository as the build context, the permissions bits for
copied files are 644. If a file in the repository has the executable bit set,
it will have permissions set to 755. Directories have permissions set to 755.
@z

@x
##### Pattern matching
@y
##### Pattern matching
@z

@x
For local files, each `<src>` may contain wildcards and matching will be done
using Go's [filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
@y
For local files, each `<src>` may contain wildcards and matching will be done
using Go's [filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
@z

@x
For example, to add all files and directories in the root of the build context
ending with `.png`:
@y
For example, to add all files and directories in the root of the build context
ending with `.png`:
@z

@x
```dockerfile
COPY *.png /dest/
```
@y
```dockerfile
COPY *.png /dest/
```
@z

@x
In the following example, `?` is a single-character wildcard, matching e.g.
`index.js` and `index.ts`.
@y
In the following example, `?` is a single-character wildcard, matching e.g.
`index.js` and `index.ts`.
@z

@x
```dockerfile
COPY index.?s /dest/
```
@y
```dockerfile
COPY index.?s /dest/
```
@z

@x
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
@y
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
@z

@x
```dockerfile
COPY arr[[]0].txt /dest/
```
@y
```dockerfile
COPY arr[[]0].txt /dest/
```
@z

@x
### Destination
@y
### Destination
@z

@x
If the destination path begins with a forward slash, it's interpreted as an
absolute path, and the source files are copied into the specified destination
relative to the root of the current build stage.
@y
If the destination path begins with a forward slash, it's interpreted as an
absolute path, and the source files are copied into the specified destination
relative to the root of the current build stage.
@z

@x
```dockerfile
# create /abs/test.txt
COPY test.txt /abs/
```
@y
```dockerfile
# create /abs/test.txt
COPY test.txt /abs/
```
@z

@x
Trailing slashes are significant. For example, `COPY test.txt /abs` creates a
file at `/abs`, whereas `COPY test.txt /abs/` creates `/abs/test.txt`.
@y
Trailing slashes are significant. For example, `COPY test.txt /abs` creates a
file at `/abs`, whereas `COPY test.txt /abs/` creates `/abs/test.txt`.
@z

@x
If the destination path doesn't begin with a leading slash, it's interpreted as
relative to the working directory of the build container.
@y
If the destination path doesn't begin with a leading slash, it's interpreted as
relative to the working directory of the build container.
@z

@x
```dockerfile
WORKDIR /usr/src/app
# create /usr/src/app/rel/test.txt
COPY test.txt rel/
```
@y
```dockerfile
WORKDIR /usr/src/app
# create /usr/src/app/rel/test.txt
COPY test.txt rel/
```
@z

@x
If destination doesn't exist, it's created, along with all missing directories
in its path.
@y
If destination doesn't exist, it's created, along with all missing directories
in its path.
@z

@x
If the source is a file, and the destination doesn't end with a trailing slash,
the source file will be written to the destination path as a file.
@y
If the source is a file, and the destination doesn't end with a trailing slash,
the source file will be written to the destination path as a file.
@z

@x
### COPY --from
@y
### COPY --from
@z

@x
By default, the `COPY` instruction copies files from the build context. The
`COPY --from` flag lets you copy files from an image, a build stage,
or a named context instead.
@y
By default, the `COPY` instruction copies files from the build context. The
`COPY --from` flag lets you copy files from an image, a build stage,
or a named context instead.
@z

@x
```dockerfile
COPY [--from=<image|stage|context>] <src> ... <dest>
```
@y
```dockerfile
COPY [--from=<image|stage|context>] <src> ... <dest>
```
@z

@x
To copy from a build stage in a
[multi-stage build](https://docs.docker.com/build/building/multi-stage/),
specify the name of the stage you want to copy from. You specify stage names
using the `AS` keyword with the `FROM` instruction.
@y
To copy from a build stage in a
[multi-stage build](https://docs.docker.com/build/building/multi-stage/),
specify the name of the stage you want to copy from. You specify stage names
using the `AS` keyword with the `FROM` instruction.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine AS build
COPY . .
RUN apk add clang
RUN clang -o /hello hello.c
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine AS build
COPY . .
RUN apk add clang
RUN clang -o /hello hello.c
@z

@x
FROM scratch
COPY --from=build /hello /
```
@y
FROM scratch
COPY --from=build /hello /
```
@z

@x
You can also copy files directly from named contexts (specified with
`--build-context <name>=<source>`) or images. The following example copies an
`nginx.conf` file from the official Nginx image.
@y
You can also copy files directly from named contexts (specified with
`--build-context <name>=<source>`) or images. The following example copies an
`nginx.conf` file from the official Nginx image.
@z

@x
```dockerfile
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```
@y
```dockerfile
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```
@z

@x
The source path of `COPY --from` is always resolved from filesystem root of the
image or stage that you specify.
@y
The source path of `COPY --from` is always resolved from filesystem root of the
image or stage that you specify.
@z

@x
### COPY --chown --chmod
@y
### COPY --chown --chmod
@z

@x
> [!NOTE]
> Only octal notation is currently supported. Non-octal support is tracked in
> [moby/buildkit#1951](https://github.com/moby/buildkit/issues/1951).
@y
> [!NOTE]
> Only octal notation is currently supported. Non-octal support is tracked in
> [moby/buildkit#1951](https://github.com/moby/buildkit/issues/1951).
@z

@x
```dockerfile
COPY [--chown=<user>:<group>] [--chmod=<perms> ...] <src> ... <dest>
```
@y
```dockerfile
COPY [--chown=<user>:<group>] [--chmod=<perms> ...] <src> ... <dest>
```
@z

@x
The `--chown` and `--chmod` features are only supported on Dockerfiles used to build Linux containers,
and doesn't work on Windows containers. Since user and group ownership concepts do
not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
translating user and group names to IDs restricts this feature to only be viable for
Linux OS-based containers.
@y
The `--chown` and `--chmod` features are only supported on Dockerfiles used to build Linux containers,
and doesn't work on Windows containers. Since user and group ownership concepts do
not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
translating user and group names to IDs restricts this feature to only be viable for
Linux OS-based containers.
@z

@x
All files and directories copied from the build context are created with a UID and GID of `0` unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the copied content. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
@y
All files and directories copied from the build context are created with a UID and GID of `0` unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the copied content. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
@z

@x
```dockerfile
COPY --chown=55:mygroup files* /somedir/
COPY --chown=bin files* /somedir/
COPY --chown=1 files* /somedir/
COPY --chown=10:11 files* /somedir/
COPY --chown=myuser:mygroup --chmod=644 files* /somedir/
```
@y
```dockerfile
COPY --chown=55:mygroup files* /somedir/
COPY --chown=bin files* /somedir/
COPY --chown=1 files* /somedir/
COPY --chown=10:11 files* /somedir/
COPY --chown=myuser:mygroup --chmod=644 files* /somedir/
```
@z

@x
If the container root filesystem doesn't contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `COPY` operation. Using numeric IDs requires
no lookup and does not depend on container root filesystem content.
@y
If the container root filesystem doesn't contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `COPY` operation. Using numeric IDs requires
no lookup and does not depend on container root filesystem content.
@z

@x
With the Dockerfile syntax version 1.10.0 and later,
the `--chmod` flag supports variable interpolation,
which lets you define the permission bits using build arguments:
@y
With the Dockerfile syntax version 1.10.0 and later,
the `--chmod` flag supports variable interpolation,
which lets you define the permission bits using build arguments:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.10
FROM alpine
WORKDIR /src
ARG MODE=440
COPY --chmod=$MODE . .
```
@y
```dockerfile
# syntax=docker/dockerfile:1.10
FROM alpine
WORKDIR /src
ARG MODE=440
COPY --chmod=$MODE . .
```
@z

@x
### COPY --link
@y
### COPY --link
@z

@x
```dockerfile
COPY [--link[=<boolean>]] <src> ... <dest>
```
@y
```dockerfile
COPY [--link[=<boolean>]] <src> ... <dest>
```
@z

@x
Enabling this flag in `COPY` or `ADD` commands allows you to copy files with
enhanced semantics where your files remain independent on their own layer and
don't get invalidated when commands on previous layers are changed.
@y
Enabling this flag in `COPY` or `ADD` commands allows you to copy files with
enhanced semantics where your files remain independent on their own layer and
don't get invalidated when commands on previous layers are changed.
@z

@x
When `--link` is used your source files are copied into an empty destination
directory. That directory is turned into a layer that is linked on top of your
previous state.
@y
When `--link` is used your source files are copied into an empty destination
directory. That directory is turned into a layer that is linked on top of your
previous state.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
COPY --link /foo /bar
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
COPY --link /foo /bar
```
@z

@x
Is equivalent of doing two builds:
@y
Is equivalent of doing two builds:
@z

@x
```dockerfile
FROM alpine
```
@y
```dockerfile
FROM alpine
```
@z

@x
and
@y
and
@z

@x
```dockerfile
FROM scratch
COPY /foo /bar
```
@y
```dockerfile
FROM scratch
COPY /foo /bar
```
@z

@x
and merging all the layers of both images together.
@y
and merging all the layers of both images together.
@z

@x
#### Benefits of using `--link`
@y
#### Benefits of using `--link`
@z

@x
Use `--link` to reuse already built layers in subsequent builds with
`--cache-from` even if the previous layers have changed. This is especially
important for multi-stage builds where a `COPY --from` statement would
previously get invalidated if any previous commands in the same stage changed,
causing the need to rebuild the intermediate stages again. With `--link` the
layer the previous build generated is reused and merged on top of the new
layers. This also means you can easily rebase your images when the base images
receive updates, without having to execute the whole build again. In backends
that support it, BuildKit can do this rebase action without the need to push or
pull any layers between the client and the registry. BuildKit will detect this
case and only create new image manifest that contains the new layers and old
layers in correct order.
@y
Use `--link` to reuse already built layers in subsequent builds with
`--cache-from` even if the previous layers have changed. This is especially
important for multi-stage builds where a `COPY --from` statement would
previously get invalidated if any previous commands in the same stage changed,
causing the need to rebuild the intermediate stages again. With `--link` the
layer the previous build generated is reused and merged on top of the new
layers. This also means you can easily rebase your images when the base images
receive updates, without having to execute the whole build again. In backends
that support it, BuildKit can do this rebase action without the need to push or
pull any layers between the client and the registry. BuildKit will detect this
case and only create new image manifest that contains the new layers and old
layers in correct order.
@z

@x
The same behavior where BuildKit can avoid pulling down the base image can also
happen when using `--link` and no other commands that would require access to
the files in the base image. In that case BuildKit will only build the layers
for the `COPY` commands and push them to the registry directly on top of the
layers of the base image.
@y
The same behavior where BuildKit can avoid pulling down the base image can also
happen when using `--link` and no other commands that would require access to
the files in the base image. In that case BuildKit will only build the layers
for the `COPY` commands and push them to the registry directly on top of the
layers of the base image.
@z

@x
#### Incompatibilities with `--link=false`
@y
#### Incompatibilities with `--link=false`
@z

@x
When using `--link` the `COPY/ADD` commands are not allowed to read any files
from the previous state. This means that if in previous state the destination
directory was a path that contained a symlink, `COPY/ADD` can not follow it.
In the final image the destination path created with `--link` will always be a
path containing only directories.
@y
When using `--link` the `COPY/ADD` commands are not allowed to read any files
from the previous state. This means that if in previous state the destination
directory was a path that contained a symlink, `COPY/ADD` can not follow it.
In the final image the destination path created with `--link` will always be a
path containing only directories.
@z

@x
If you don't rely on the behavior of following symlinks in the destination
path, using `--link` is always recommended. The performance of `--link` is
equivalent or better than the default behavior and, it creates much better
conditions for cache reuse.
@y
If you don't rely on the behavior of following symlinks in the destination
path, using `--link` is always recommended. The performance of `--link` is
equivalent or better than the default behavior and, it creates much better
conditions for cache reuse.
@z

@x
### COPY --parents
@y
### COPY --parents
@z

@x
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1.7-labs`](#syntax) version.
@y
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1.7-labs`](#syntax) version.
@z

@x
```dockerfile
COPY [--parents[=<boolean>]] <src> ... <dest>
```
@y
```dockerfile
COPY [--parents[=<boolean>]] <src> ... <dest>
```
@z

@x
The `--parents` flag preserves parent directories for `src` entries. This flag defaults to `false`.
@y
The `--parents` flag preserves parent directories for `src` entries. This flag defaults to `false`.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch
@y
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch
@z

@x
COPY ./x/a.txt ./y/a.txt /no_parents/
COPY --parents ./x/a.txt ./y/a.txt /parents/
@y
COPY ./x/a.txt ./y/a.txt /no_parents/
COPY --parents ./x/a.txt ./y/a.txt /parents/
@z

@x
# /no_parents/a.txt
# /parents/x/a.txt
# /parents/y/a.txt
```
@y
# /no_parents/a.txt
# /parents/x/a.txt
# /parents/y/a.txt
```
@z

@x
This behavior is similar to the [Linux `cp` utility's](https://www.man7.org/linux/man-pages/man1/cp.1.html)
`--parents` or [`rsync`](https://man7.org/linux/man-pages/man1/rsync.1.html) `--relative` flag.
@y
This behavior is similar to the [Linux `cp` utility's](https://www.man7.org/linux/man-pages/man1/cp.1.html)
`--parents` or [`rsync`](https://man7.org/linux/man-pages/man1/rsync.1.html) `--relative` flag.
@z

@x
As with Rsync, it is possible to limit which parent directories are preserved by
inserting a dot and a slash (`./`) into the source path. If such point exists, only parent
directories after it will be preserved. This may be especially useful copies between stages
with `--from` where the source paths need to be absolute.
@y
As with Rsync, it is possible to limit which parent directories are preserved by
inserting a dot and a slash (`./`) into the source path. If such point exists, only parent
directories after it will be preserved. This may be especially useful copies between stages
with `--from` where the source paths need to be absolute.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch
@y
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch
@z

@x
COPY --parents ./x/./y/*.txt /parents/
@y
COPY --parents ./x/./y/*.txt /parents/
@z

@x
# Build context:
# ./x/y/a.txt
# ./x/y/b.txt
#
# Output:
# /parents/y/a.txt
# /parents/y/b.txt
```
@y
# Build context:
# ./x/y/a.txt
# ./x/y/b.txt
#
# Output:
# /parents/y/a.txt
# /parents/y/b.txt
```
@z

@x
Note that, without the `--parents` flag specified, any filename collision will
fail the Linux `cp` operation with an explicit error message
(`cp: will not overwrite just-created './x/a.txt' with './y/a.txt'`), where the
Buildkit will silently overwrite the target file at the destination.
@y
Note that, without the `--parents` flag specified, any filename collision will
fail the Linux `cp` operation with an explicit error message
(`cp: will not overwrite just-created './x/a.txt' with './y/a.txt'`), where the
Buildkit will silently overwrite the target file at the destination.
@z

@x
While it is possible to preserve the directory structure for `COPY`
instructions consisting of only one `src` entry, usually it is more beneficial
to keep the layer count in the resulting image as low as possible. Therefore,
with the `--parents` flag, the Buildkit is capable of packing multiple
`COPY` instructions together, keeping the directory structure intact.
@y
While it is possible to preserve the directory structure for `COPY`
instructions consisting of only one `src` entry, usually it is more beneficial
to keep the layer count in the resulting image as low as possible. Therefore,
with the `--parents` flag, the Buildkit is capable of packing multiple
`COPY` instructions together, keeping the directory structure intact.
@z

@x
### COPY --exclude
@y
### COPY --exclude
@z

@x
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1.7-labs`](#syntax) version.
@y
> [!NOTE]
> Not yet available in stable syntax, use [`docker/dockerfile:1.7-labs`](#syntax) version.
@z

@x
```dockerfile
COPY [--exclude=<path> ...] <src> ... <dest>
```
@y
```dockerfile
COPY [--exclude=<path> ...] <src> ... <dest>
```
@z

@x
The `--exclude` flag lets you specify a path expression for files to be excluded.
@y
The `--exclude` flag lets you specify a path expression for files to be excluded.
@z

@x
The path expression follows the same format as `<src>`,
supporting wildcards and matching using Go's
[filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
For example, to add all files starting with "hom", excluding files with a `.txt` extension:
@y
The path expression follows the same format as `<src>`,
supporting wildcards and matching using Go's
[filepath.Match](https://golang.org/pkg/path/filepath#Match) rules.
For example, to add all files starting with "hom", excluding files with a `.txt` extension:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch

COPY --exclude=*.txt hom* /mydir/
```
@y
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch

COPY --exclude=*.txt hom* /mydir/
```
@z

@x
You can specify the `--exclude` option multiple times for a `COPY` instruction.
Multiple `--excludes` are files matching its patterns not to be copied,
even if the files paths match the pattern specified in `<src>`.
To add all files starting with "hom", excluding files with either `.txt` or `.md` extensions:
@y
You can specify the `--exclude` option multiple times for a `COPY` instruction.
Multiple `--excludes` are files matching its patterns not to be copied,
even if the files paths match the pattern specified in `<src>`.
To add all files starting with "hom", excluding files with either `.txt` or `.md` extensions:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch

COPY --exclude=*.txt --exclude=*.md hom* /mydir/
```
@y
```dockerfile
# syntax=docker/dockerfile:1-labs
FROM scratch

COPY --exclude=*.txt --exclude=*.md hom* /mydir/
```
@z

@x
## ENTRYPOINT
@y
## ENTRYPOINT
@z

@x
An `ENTRYPOINT` allows you to configure a container that will run as an executable.
@y
An `ENTRYPOINT` allows you to configure a container that will run as an executable.
@z

@x
`ENTRYPOINT` has two possible forms:
@y
`ENTRYPOINT` has two possible forms:
@z

@x
- The exec form, which is the preferred form:
@y
- The exec form, which is the preferred form:
@z

@x
  ```dockerfile
  ENTRYPOINT ["executable", "param1", "param2"]
  ```
@y
  ```dockerfile
  ENTRYPOINT ["executable", "param1", "param2"]
  ```
@z

@x
- The shell form:
@y
- The shell form:
@z

@x
  ```dockerfile
  ENTRYPOINT command param1 param2
  ```
@y
  ```dockerfile
  ENTRYPOINT command param1 param2
  ```
@z

@x
For more information about the different forms, see [Shell and exec form](#shell-and-exec-form).
@y
For more information about the different forms, see [Shell and exec form](#shell-and-exec-form).
@z

@x
The following command starts a container from the `nginx` with its default
content, listening on port 80:
@y
The following command starts a container from the `nginx` with its default
content, listening on port 80:
@z

@x
```console
$ docker run -i -t --rm -p 80:80 nginx
```
@y
```console
$ docker run -i -t --rm -p 80:80 nginx
```
@z

@x
Command line arguments to `docker run <image>` will be appended after all
elements in an exec form `ENTRYPOINT`, and will override all elements specified
using `CMD`.
@y
Command line arguments to `docker run <image>` will be appended after all
elements in an exec form `ENTRYPOINT`, and will override all elements specified
using `CMD`.
@z

@x
This allows arguments to be passed to the entry point, i.e., `docker run
<image> -d` will pass the `-d` argument to the entry point. You can override
the `ENTRYPOINT` instruction using the `docker run --entrypoint` flag.
@y
This allows arguments to be passed to the entry point, i.e., `docker run
<image> -d` will pass the `-d` argument to the entry point. You can override
the `ENTRYPOINT` instruction using the `docker run --entrypoint` flag.
@z

@x
The shell form of `ENTRYPOINT` prevents any `CMD` command line arguments from
being used. It also starts your `ENTRYPOINT` as a subcommand of `/bin/sh -c`,
which does not pass signals. This means that the executable will not be the
container's `PID 1`, and will not receive Unix signals. In this case, your
executable doesn't receive a `SIGTERM` from `docker stop <container>`.
@y
The shell form of `ENTRYPOINT` prevents any `CMD` command line arguments from
being used. It also starts your `ENTRYPOINT` as a subcommand of `/bin/sh -c`,
which does not pass signals. This means that the executable will not be the
container's `PID 1`, and will not receive Unix signals. In this case, your
executable doesn't receive a `SIGTERM` from `docker stop <container>`.
@z

@x
Only the last `ENTRYPOINT` instruction in the Dockerfile will have an effect.
@y
Only the last `ENTRYPOINT` instruction in the Dockerfile will have an effect.
@z

@x
### Exec form ENTRYPOINT example
@y
### Exec form ENTRYPOINT example
@z

@x
You can use the exec form of `ENTRYPOINT` to set fairly stable default commands
and arguments and then use either form of `CMD` to set additional defaults that
are more likely to be changed.
@y
You can use the exec form of `ENTRYPOINT` to set fairly stable default commands
and arguments and then use either form of `CMD` to set additional defaults that
are more likely to be changed.
@z

@x
```dockerfile
FROM ubuntu
ENTRYPOINT ["top", "-b"]
CMD ["-c"]
```
@y
```dockerfile
FROM ubuntu
ENTRYPOINT ["top", "-b"]
CMD ["-c"]
```
@z

@x
When you run the container, you can see that `top` is the only process:
@y
When you run the container, you can see that `top` is the only process:
@z

@x
```console
$ docker run -it --rm --name test  top -H
@y
```console
$ docker run -it --rm --name test  top -H
@z

@x
top - 08:25:00 up  7:27,  0 users,  load average: 0.00, 0.01, 0.05
Threads:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.1 us,  0.1 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   2056668 total,  1616832 used,   439836 free,    99352 buffers
KiB Swap:  1441840 total,        0 used,  1441840 free.  1324440 cached Mem
@y
top - 08:25:00 up  7:27,  0 users,  load average: 0.00, 0.01, 0.05
Threads:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.1 us,  0.1 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   2056668 total,  1616832 used,   439836 free,    99352 buffers
KiB Swap:  1441840 total,        0 used,  1441840 free.  1324440 cached Mem
@z

@x
  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
    1 root      20   0   19744   2336   2080 R  0.0  0.1   0:00.04 top
```
@y
  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
    1 root      20   0   19744   2336   2080 R  0.0  0.1   0:00.04 top
```
@z

@x
To examine the result further, you can use `docker exec`:
@y
To examine the result further, you can use `docker exec`:
@z

@x
```console
$ docker exec -it test ps aux
@y
```console
$ docker exec -it test ps aux
@z

@x
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  2.6  0.1  19752  2352 ?        Ss+  08:24   0:00 top -b -H
root         7  0.0  0.1  15572  2164 ?        R+   08:25   0:00 ps aux
```
@y
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  2.6  0.1  19752  2352 ?        Ss+  08:24   0:00 top -b -H
root         7  0.0  0.1  15572  2164 ?        R+   08:25   0:00 ps aux
```
@z

@x
And you can gracefully request `top` to shut down using `docker stop test`.
@y
And you can gracefully request `top` to shut down using `docker stop test`.
@z

@x
The following Dockerfile shows using the `ENTRYPOINT` to run Apache in the
foreground (i.e., as `PID 1`):
@y
The following Dockerfile shows using the `ENTRYPOINT` to run Apache in the
foreground (i.e., as `PID 1`):
@z

@x
```dockerfile
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
@y
```dockerfile
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
@z

@x
If you need to write a starter script for a single executable, you can ensure that
the final executable receives the Unix signals by using `exec` and `gosu`
commands:
@y
If you need to write a starter script for a single executable, you can ensure that
the final executable receives the Unix signals by using `exec` and `gosu`
commands:
@z

@x
```bash
#!/usr/bin/env bash
set -e
@y
```bash
#!/usr/bin/env bash
set -e
@z

@x
if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"
@y
if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"
@z

@x
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi
@y
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi
@z

@x
    exec gosu postgres "$@"
fi
@y
    exec gosu postgres "$@"
fi
@z

@x
exec "$@"
```
@y
exec "$@"
```
@z

@x
Lastly, if you need to do some extra cleanup (or communicate with other containers)
on shutdown, or are co-ordinating more than one executable, you may need to ensure
that the `ENTRYPOINT` script receives the Unix signals, passes them on, and then
does some more work:
@y
Lastly, if you need to do some extra cleanup (or communicate with other containers)
on shutdown, or are co-ordinating more than one executable, you may need to ensure
that the `ENTRYPOINT` script receives the Unix signals, passes them on, and then
does some more work:
@z

@x
```bash
#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too
@y
```bash
#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too
@z

@x
# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT TERM
@y
# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT TERM
@z

@x
# start service in background here
/usr/sbin/apachectl start
@y
# start service in background here
/usr/sbin/apachectl start
@z

@x
echo "[hit enter key to exit] or run 'docker stop <container>'"
read
@y
echo "[hit enter key to exit] or run 'docker stop <container>'"
read
@z

@x
# stop service and clean up here
echo "stopping apache"
/usr/sbin/apachectl stop
@y
# stop service and clean up here
echo "stopping apache"
/usr/sbin/apachectl stop
@z

@x
echo "exited $0"
```
@y
echo "exited $0"
```
@z

@x
If you run this image with `docker run -it --rm -p 80:80 --name test apache`,
you can then examine the container's processes with `docker exec`, or `docker top`,
and then ask the script to stop Apache:
@y
If you run this image with `docker run -it --rm -p 80:80 --name test apache`,
you can then examine the container's processes with `docker exec`, or `docker top`,
and then ask the script to stop Apache:
@z

@x
```console
$ docker exec -it test ps aux
@y
```console
$ docker exec -it test ps aux
@z

@x
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.1  0.0   4448   692 ?        Ss+  00:42   0:00 /bin/sh /run.sh 123 cmd cmd2
root        19  0.0  0.2  71304  4440 ?        Ss   00:42   0:00 /usr/sbin/apache2 -k start
www-data    20  0.2  0.2 360468  6004 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
www-data    21  0.2  0.2 360468  6000 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
root        81  0.0  0.1  15572  2140 ?        R+   00:44   0:00 ps aux
@y
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.1  0.0   4448   692 ?        Ss+  00:42   0:00 /bin/sh /run.sh 123 cmd cmd2
root        19  0.0  0.2  71304  4440 ?        Ss   00:42   0:00 /usr/sbin/apache2 -k start
www-data    20  0.2  0.2 360468  6004 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
www-data    21  0.2  0.2 360468  6000 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
root        81  0.0  0.1  15572  2140 ?        R+   00:44   0:00 ps aux
@z

@x
$ docker top test
@y
$ docker top test
@z

@x
PID                 USER                COMMAND
10035               root                {run.sh} /bin/sh /run.sh 123 cmd cmd2
10054               root                /usr/sbin/apache2 -k start
10055               33                  /usr/sbin/apache2 -k start
10056               33                  /usr/sbin/apache2 -k start
@y
PID                 USER                COMMAND
10035               root                {run.sh} /bin/sh /run.sh 123 cmd cmd2
10054               root                /usr/sbin/apache2 -k start
10055               33                  /usr/sbin/apache2 -k start
10056               33                  /usr/sbin/apache2 -k start
@z

@x
$ /usr/bin/time docker stop test
@y
$ /usr/bin/time docker stop test
@z

@x
test
real	0m 0.27s
user	0m 0.03s
sys	0m 0.03s
```
@y
test
real	0m 0.27s
user	0m 0.03s
sys	0m 0.03s
```
@z

@x
> [!NOTE]
> You can override the `ENTRYPOINT` setting using `--entrypoint`,
> but this can only set the binary to exec (no `sh -c` will be used).
@y
> [!NOTE]
> You can override the `ENTRYPOINT` setting using `--entrypoint`,
> but this can only set the binary to exec (no `sh -c` will be used).
@z

@x
### Shell form ENTRYPOINT example
@y
### Shell form ENTRYPOINT example
@z

@x
You can specify a plain string for the `ENTRYPOINT` and it will execute in `/bin/sh -c`.
This form will use shell processing to substitute shell environment variables,
and will ignore any `CMD` or `docker run` command line arguments.
To ensure that `docker stop` will signal any long running `ENTRYPOINT` executable
correctly, you need to remember to start it with `exec`:
@y
You can specify a plain string for the `ENTRYPOINT` and it will execute in `/bin/sh -c`.
This form will use shell processing to substitute shell environment variables,
and will ignore any `CMD` or `docker run` command line arguments.
To ensure that `docker stop` will signal any long running `ENTRYPOINT` executable
correctly, you need to remember to start it with `exec`:
@z

@x
```dockerfile
FROM ubuntu
ENTRYPOINT exec top -b
```
@y
```dockerfile
FROM ubuntu
ENTRYPOINT exec top -b
```
@z

@x
When you run this image, you'll see the single `PID 1` process:
@y
When you run this image, you'll see the single `PID 1` process:
@z

@x
```console
$ docker run -it --rm --name test top
@y
```console
$ docker run -it --rm --name test top
@z

@x
Mem: 1704520K used, 352148K free, 0K shrd, 0K buff, 140368121167873K cached
CPU:   5% usr   0% sys   0% nic  94% idle   0% io   0% irq   0% sirq
Load average: 0.08 0.03 0.05 2/98 6
  PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
    1     0 root     R     3164   0%   0% top -b
```
@y
Mem: 1704520K used, 352148K free, 0K shrd, 0K buff, 140368121167873K cached
CPU:   5% usr   0% sys   0% nic  94% idle   0% io   0% irq   0% sirq
Load average: 0.08 0.03 0.05 2/98 6
  PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
    1     0 root     R     3164   0%   0% top -b
```
@z

@x
Which exits cleanly on `docker stop`:
@y
Which exits cleanly on `docker stop`:
@z

@x
```console
$ /usr/bin/time docker stop test
@y
```console
$ /usr/bin/time docker stop test
@z

@x
test
real	0m 0.20s
user	0m 0.02s
sys	0m 0.04s
```
@y
test
real	0m 0.20s
user	0m 0.02s
sys	0m 0.04s
```
@z

@x
If you forget to add `exec` to the beginning of your `ENTRYPOINT`:
@y
If you forget to add `exec` to the beginning of your `ENTRYPOINT`:
@z

@x
```dockerfile
FROM ubuntu
ENTRYPOINT top -b
CMD -- --ignored-param1
```
@y
```dockerfile
FROM ubuntu
ENTRYPOINT top -b
CMD -- --ignored-param1
```
@z

@x
You can then run it (giving it a name for the next step):
@y
You can then run it (giving it a name for the next step):
@z

@x
```console
$ docker run -it --name test top --ignored-param2
@y
```console
$ docker run -it --name test top --ignored-param2
@z

@x
top - 13:58:24 up 17 min,  0 users,  load average: 0.00, 0.00, 0.00
Tasks:   2 total,   1 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s): 16.7 us, 33.3 sy,  0.0 ni, 50.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   1990.8 total,   1354.6 free,    231.4 used,    404.7 buff/cache
MiB Swap:   1024.0 total,   1024.0 free,      0.0 used.   1639.8 avail Mem
@y
top - 13:58:24 up 17 min,  0 users,  load average: 0.00, 0.00, 0.00
Tasks:   2 total,   1 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s): 16.7 us, 33.3 sy,  0.0 ni, 50.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   1990.8 total,   1354.6 free,    231.4 used,    404.7 buff/cache
MiB Swap:   1024.0 total,   1024.0 free,      0.0 used.   1639.8 avail Mem
@z

@x
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
    1 root      20   0    2612    604    536 S   0.0   0.0   0:00.02 sh
    6 root      20   0    5956   3188   2768 R   0.0   0.2   0:00.00 top
```
@y
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
    1 root      20   0    2612    604    536 S   0.0   0.0   0:00.02 sh
    6 root      20   0    5956   3188   2768 R   0.0   0.2   0:00.00 top
```
@z

@x
You can see from the output of `top` that the specified `ENTRYPOINT` is not `PID 1`.
@y
You can see from the output of `top` that the specified `ENTRYPOINT` is not `PID 1`.
@z

@x
If you then run `docker stop test`, the container will not exit cleanly - the
`stop` command will be forced to send a `SIGKILL` after the timeout:
@y
If you then run `docker stop test`, the container will not exit cleanly - the
`stop` command will be forced to send a `SIGKILL` after the timeout:
@z

@x
```console
$ docker exec -it test ps waux
@y
```console
$ docker exec -it test ps waux
@z

@x
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.4  0.0   2612   604 pts/0    Ss+  13:58   0:00 /bin/sh -c top -b --ignored-param2
root         6  0.0  0.1   5956  3188 pts/0    S+   13:58   0:00 top -b
root         7  0.0  0.1   5884  2816 pts/1    Rs+  13:58   0:00 ps waux
@y
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.4  0.0   2612   604 pts/0    Ss+  13:58   0:00 /bin/sh -c top -b --ignored-param2
root         6  0.0  0.1   5956  3188 pts/0    S+   13:58   0:00 top -b
root         7  0.0  0.1   5884  2816 pts/1    Rs+  13:58   0:00 ps waux
@z

@x
$ /usr/bin/time docker stop test
@y
$ /usr/bin/time docker stop test
@z

@x
test
real	0m 10.19s
user	0m 0.04s
sys	0m 0.03s
```
@y
test
real	0m 10.19s
user	0m 0.04s
sys	0m 0.03s
```
@z

@x
### Understand how CMD and ENTRYPOINT interact
@y
### Understand how CMD and ENTRYPOINT interact
@z

@x
Both `CMD` and `ENTRYPOINT` instructions define what command gets executed when running a container.
There are few rules that describe their co-operation.
@y
Both `CMD` and `ENTRYPOINT` instructions define what command gets executed when running a container.
There are few rules that describe their co-operation.
@z

@x
1. Dockerfile should specify at least one of `CMD` or `ENTRYPOINT` commands.
@y
1. Dockerfile should specify at least one of `CMD` or `ENTRYPOINT` commands.
@z

@x
2. `ENTRYPOINT` should be defined when using the container as an executable.
@y
2. `ENTRYPOINT` should be defined when using the container as an executable.
@z

@x
3. `CMD` should be used as a way of defining default arguments for an `ENTRYPOINT` command
   or for executing an ad-hoc command in a container.
@y
3. `CMD` should be used as a way of defining default arguments for an `ENTRYPOINT` command
   or for executing an ad-hoc command in a container.
@z

@x
4. `CMD` will be overridden when running the container with alternative arguments.
@y
4. `CMD` will be overridden when running the container with alternative arguments.
@z

@x
The table below shows what command is executed for different `ENTRYPOINT` / `CMD` combinations:
@y
The table below shows what command is executed for different `ENTRYPOINT` / `CMD` combinations:
@z

@x
|                                | No ENTRYPOINT              | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
| :----------------------------- | :------------------------- | :----------------------------- | :--------------------------------------------- |
| **No CMD**                     | error, not allowed         | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry                            |
| **CMD ["exec_cmd", "p1_cmd"]** | exec_cmd p1_cmd            | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry exec_cmd p1_cmd            |
| **CMD exec_cmd p1_cmd**        | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |
@y
|                                | No ENTRYPOINT              | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
| :----------------------------- | :------------------------- | :----------------------------- | :--------------------------------------------- |
| **No CMD**                     | error, not allowed         | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry                            |
| **CMD ["exec_cmd", "p1_cmd"]** | exec_cmd p1_cmd            | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry exec_cmd p1_cmd            |
| **CMD exec_cmd p1_cmd**        | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |
@z

@x
> [!NOTE]
> If `CMD` is defined from the base image, setting `ENTRYPOINT` will
> reset `CMD` to an empty value. In this scenario, `CMD` must be defined in the
> current image to have a value.
@y
> [!NOTE]
> If `CMD` is defined from the base image, setting `ENTRYPOINT` will
> reset `CMD` to an empty value. In this scenario, `CMD` must be defined in the
> current image to have a value.
@z

@x
## VOLUME
@y
## VOLUME
@z

@x
```dockerfile
VOLUME ["/data"]
```
@y
```dockerfile
VOLUME ["/data"]
```
@z

@x
The `VOLUME` instruction creates a mount point with the specified name
and marks it as holding externally mounted volumes from native host or other
containers. The value can be a JSON array, `VOLUME ["/var/log/"]`, or a plain
string with multiple arguments, such as `VOLUME /var/log` or `VOLUME /var/log
/var/db`. For more information/examples and mounting instructions via the
Docker client, refer to
[_Share Directories via Volumes_](https://docs.docker.com/storage/volumes/)
documentation.
@y
The `VOLUME` instruction creates a mount point with the specified name
and marks it as holding externally mounted volumes from native host or other
containers. The value can be a JSON array, `VOLUME ["/var/log/"]`, or a plain
string with multiple arguments, such as `VOLUME /var/log` or `VOLUME /var/log
/var/db`. For more information/examples and mounting instructions via the
Docker client, refer to
[_Share Directories via Volumes_](https://docs.docker.com/storage/volumes/)
documentation.
@z

@x
The `docker run` command initializes the newly created volume with any data
that exists at the specified location within the base image. For example,
consider the following Dockerfile snippet:
@y
The `docker run` command initializes the newly created volume with any data
that exists at the specified location within the base image. For example,
consider the following Dockerfile snippet:
@z

@x
```dockerfile
FROM ubuntu
RUN mkdir /myvol
RUN echo "hello world" > /myvol/greeting
VOLUME /myvol
```
@y
```dockerfile
FROM ubuntu
RUN mkdir /myvol
RUN echo "hello world" > /myvol/greeting
VOLUME /myvol
```
@z

@x
This Dockerfile results in an image that causes `docker run` to
create a new mount point at `/myvol` and copy the `greeting` file
into the newly created volume.
@y
This Dockerfile results in an image that causes `docker run` to
create a new mount point at `/myvol` and copy the `greeting` file
into the newly created volume.
@z

@x
### Notes about specifying volumes
@y
### Notes about specifying volumes
@z

@x
Keep the following things in mind about volumes in the Dockerfile.
@y
Keep the following things in mind about volumes in the Dockerfile.
@z

@x
- **Volumes on Windows-based containers**: When using Windows-based containers,
  the destination of a volume inside the container must be one of:
@y
- **Volumes on Windows-based containers**: When using Windows-based containers,
  the destination of a volume inside the container must be one of:
@z

@x
  - a non-existing or empty directory
  - a drive other than `C:`
@y
  - a non-existing or empty directory
  - a drive other than `C:`
@z

@x
- **Changing the volume from within the Dockerfile**: If any build steps change the
  data within the volume after it has been declared, those changes will be discarded
  when using the legacy builder. When using Buildkit, the changes will instead be kept.
@y
- **Changing the volume from within the Dockerfile**: If any build steps change the
  data within the volume after it has been declared, those changes will be discarded
  when using the legacy builder. When using Buildkit, the changes will instead be kept.
@z

@x
- **JSON formatting**: The list is parsed as a JSON array.
  You must enclose words with double quotes (`"`) rather than single quotes (`'`).
@y
- **JSON formatting**: The list is parsed as a JSON array.
  You must enclose words with double quotes (`"`) rather than single quotes (`'`).
@z

@x
- **The host directory is declared at container run-time**: The host directory
  (the mountpoint) is, by its nature, host-dependent. This is to preserve image
  portability, since a given host directory can't be guaranteed to be available
  on all hosts. For this reason, you can't mount a host directory from
  within the Dockerfile. The `VOLUME` instruction does not support specifying a `host-dir`
  parameter. You must specify the mountpoint when you create or run the container.
@y
- **The host directory is declared at container run-time**: The host directory
  (the mountpoint) is, by its nature, host-dependent. This is to preserve image
  portability, since a given host directory can't be guaranteed to be available
  on all hosts. For this reason, you can't mount a host directory from
  within the Dockerfile. The `VOLUME` instruction does not support specifying a `host-dir`
  parameter. You must specify the mountpoint when you create or run the container.
@z

@x
## USER
@y
## USER
@z

@x
```dockerfile
USER <user>[:<group>]
```
@y
```dockerfile
USER <user>[:<group>]
```
@z

@x
or
@y
or
@z

@x
```dockerfile
USER <UID>[:<GID>]
```
@y
```dockerfile
USER <UID>[:<GID>]
```
@z

@x
The `USER` instruction sets the user name (or UID) and optionally the user
group (or GID) to use as the default user and group for the remainder of the
current stage. The specified user is used for `RUN` instructions and at
runtime, runs the relevant `ENTRYPOINT` and `CMD` commands.
@y
The `USER` instruction sets the user name (or UID) and optionally the user
group (or GID) to use as the default user and group for the remainder of the
current stage. The specified user is used for `RUN` instructions and at
runtime, runs the relevant `ENTRYPOINT` and `CMD` commands.
@z

@x
> Note that when specifying a group for the user, the user will have _only_ the
> specified group membership. Any other configured group memberships will be ignored.
@y
> Note that when specifying a group for the user, the user will have _only_ the
> specified group membership. Any other configured group memberships will be ignored.
@z

@x
> [!WARNING]
> When the user doesn't have a primary group then the image (or the next
> instructions) will be run with the `root` group.
>
> On Windows, the user must be created first if it's not a built-in account.
> This can be done with the `net user` command called as part of a Dockerfile.
@y
> [!WARNING]
> When the user doesn't have a primary group then the image (or the next
> instructions) will be run with the `root` group.
>
> On Windows, the user must be created first if it's not a built-in account.
> This can be done with the `net user` command called as part of a Dockerfile.
@z

@x
```dockerfile
FROM microsoft/windowsservercore
# Create Windows user in the container
RUN net user /add patrick
# Set it for subsequent commands
USER patrick
```
@y
```dockerfile
FROM microsoft/windowsservercore
# Create Windows user in the container
RUN net user /add patrick
# Set it for subsequent commands
USER patrick
```
@z

@x
## WORKDIR
@y
## WORKDIR
@z

@x
```dockerfile
WORKDIR /path/to/workdir
```
@y
```dockerfile
WORKDIR /path/to/workdir
```
@z

@x
The `WORKDIR` instruction sets the working directory for any `RUN`, `CMD`,
`ENTRYPOINT`, `COPY` and `ADD` instructions that follow it in the Dockerfile.
If the `WORKDIR` doesn't exist, it will be created even if it's not used in any
subsequent Dockerfile instruction.
@y
The `WORKDIR` instruction sets the working directory for any `RUN`, `CMD`,
`ENTRYPOINT`, `COPY` and `ADD` instructions that follow it in the Dockerfile.
If the `WORKDIR` doesn't exist, it will be created even if it's not used in any
subsequent Dockerfile instruction.
@z

@x
The `WORKDIR` instruction can be used multiple times in a Dockerfile. If a
relative path is provided, it will be relative to the path of the previous
`WORKDIR` instruction. For example:
@y
The `WORKDIR` instruction can be used multiple times in a Dockerfile. If a
relative path is provided, it will be relative to the path of the previous
`WORKDIR` instruction. For example:
@z

@x
```dockerfile
WORKDIR /a
WORKDIR b
WORKDIR c
RUN pwd
```
@y
```dockerfile
WORKDIR /a
WORKDIR b
WORKDIR c
RUN pwd
```
@z

@x
The output of the final `pwd` command in this Dockerfile would be `/a/b/c`.
@y
The output of the final `pwd` command in this Dockerfile would be `/a/b/c`.
@z

@x
The `WORKDIR` instruction can resolve environment variables previously set using
`ENV`. You can only use environment variables explicitly set in the Dockerfile.
For example:
@y
The `WORKDIR` instruction can resolve environment variables previously set using
`ENV`. You can only use environment variables explicitly set in the Dockerfile.
For example:
@z

@x
```dockerfile
ENV DIRPATH=/path
WORKDIR $DIRPATH/$DIRNAME
RUN pwd
```
@y
```dockerfile
ENV DIRPATH=/path
WORKDIR $DIRPATH/$DIRNAME
RUN pwd
```
@z

@x
The output of the final `pwd` command in this Dockerfile would be
`/path/$DIRNAME`
@y
The output of the final `pwd` command in this Dockerfile would be
`/path/$DIRNAME`
@z

@x
If not specified, the default working directory is `/`. In practice, if you aren't building a Dockerfile from scratch (`FROM scratch`),
the `WORKDIR` may likely be set by the base image you're using.
@y
If not specified, the default working directory is `/`. In practice, if you aren't building a Dockerfile from scratch (`FROM scratch`),
the `WORKDIR` may likely be set by the base image you're using.
@z

@x
Therefore, to avoid unintended operations in unknown directories, it's best practice to set your `WORKDIR` explicitly.
@y
Therefore, to avoid unintended operations in unknown directories, it's best practice to set your `WORKDIR` explicitly.
@z

@x
## ARG
@y
## ARG
@z

@x
```dockerfile
ARG <name>[=<default value>] [<name>[=<default value>]...]
```
@y
```dockerfile
ARG <name>[=<default value>] [<name>[=<default value>]...]
```
@z

@x
The `ARG` instruction defines a variable that users can pass at build-time to
the builder with the `docker build` command using the `--build-arg <varname>=<value>`
flag.
@y
The `ARG` instruction defines a variable that users can pass at build-time to
the builder with the `docker build` command using the `--build-arg <varname>=<value>`
flag.
@z

@x
> [!WARNING]
> It isn't recommended to use build arguments for passing secrets such as
> user credentials, API tokens, etc. Build arguments are visible in the
> `docker history` command and in `max` mode provenance attestations,
> which are attached to the image by default if you use the Buildx GitHub Actions
> and your GitHub repository is public.
>
> Refer to the [`RUN --mount=type=secret`](#run---mounttypesecret) section to
> learn about secure ways to use secrets when building images.
@y
> [!WARNING]
> It isn't recommended to use build arguments for passing secrets such as
> user credentials, API tokens, etc. Build arguments are visible in the
> `docker history` command and in `max` mode provenance attestations,
> which are attached to the image by default if you use the Buildx GitHub Actions
> and your GitHub repository is public.
>
> Refer to the [`RUN --mount=type=secret`](#run---mounttypesecret) section to
> learn about secure ways to use secrets when building images.
@z

@x
A Dockerfile may include one or more `ARG` instructions. For example,
the following is a valid Dockerfile:
@y
A Dockerfile may include one or more `ARG` instructions. For example,
the following is a valid Dockerfile:
@z

@x
```dockerfile
FROM busybox
ARG user1
ARG buildno
# ...
```
@y
```dockerfile
FROM busybox
ARG user1
ARG buildno
# ...
```
@z

@x
### Default values
@y
### Default values
@z

@x
An `ARG` instruction can optionally include a default value:
@y
An `ARG` instruction can optionally include a default value:
@z

@x
```dockerfile
FROM busybox
ARG user1=someuser
ARG buildno=1
# ...
```
@y
```dockerfile
FROM busybox
ARG user1=someuser
ARG buildno=1
# ...
```
@z

@x
If an `ARG` instruction has a default value and if there is no value passed
at build-time, the builder uses the default.
@y
If an `ARG` instruction has a default value and if there is no value passed
at build-time, the builder uses the default.
@z

@x
### Scope
@y
### Scope
@z

@x
An `ARG` variable comes into effect from the line on which it is declared in
the Dockerfile. For example, consider this Dockerfile:
@y
An `ARG` variable comes into effect from the line on which it is declared in
the Dockerfile. For example, consider this Dockerfile:
@z

@x
```dockerfile
FROM busybox
USER ${username:-some_user}
ARG username
USER $username
# ...
```
@y
```dockerfile
FROM busybox
USER ${username:-some_user}
ARG username
USER $username
# ...
```
@z

@x
A user builds this file by calling:
@y
A user builds this file by calling:
@z

@x
```console
$ docker build --build-arg username=what_user .
```
@y
```console
$ docker build --build-arg username=what_user .
```
@z

@x
- The `USER` instruction on line 2 evaluates to the `some_user` fallback,
  because the `username` variable is not yet declared.
- The `username` variable is declared on line 3, and available for reference in
  Dockerfile instruction from that point onwards.
- The `USER` instruction on line 4 evaluates to `what_user`, since at that
  point the `username` argument has a value of `what_user` which was passed on
  the command line. Prior to its definition by an `ARG` instruction, any use of
  a variable results in an empty string.
@y
- The `USER` instruction on line 2 evaluates to the `some_user` fallback,
  because the `username` variable is not yet declared.
- The `username` variable is declared on line 3, and available for reference in
  Dockerfile instruction from that point onwards.
- The `USER` instruction on line 4 evaluates to `what_user`, since at that
  point the `username` argument has a value of `what_user` which was passed on
  the command line. Prior to its definition by an `ARG` instruction, any use of
  a variable results in an empty string.
@z

@x
An `ARG` variable declared within a build stage is automatically inherited by
other stages based on that stage. Unrelated build stages do not have access to
the variable. To use an argument in multiple distinct stages, each stage must
include the `ARG` instruction, or they must both be based on a shared base
stage in the same Dockerfile where the variable is declared.
@y
An `ARG` variable declared within a build stage is automatically inherited by
other stages based on that stage. Unrelated build stages do not have access to
the variable. To use an argument in multiple distinct stages, each stage must
include the `ARG` instruction, or they must both be based on a shared base
stage in the same Dockerfile where the variable is declared.
@z

@x
For more information, refer to [variable scoping](https://docs.docker.com/build/building/variables/#scoping).
@y
For more information, refer to [variable scoping](https://docs.docker.com/build/building/variables/#scoping).
@z

@x
### Using ARG variables
@y
### Using ARG variables
@z

@x
You can use an `ARG` or an `ENV` instruction to specify variables that are
available to the `RUN` instruction. Environment variables defined using the
`ENV` instruction always override an `ARG` instruction of the same name. Consider
this Dockerfile with an `ENV` and `ARG` instruction.
@y
You can use an `ARG` or an `ENV` instruction to specify variables that are
available to the `RUN` instruction. Environment variables defined using the
`ENV` instruction always override an `ARG` instruction of the same name. Consider
this Dockerfile with an `ENV` and `ARG` instruction.
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=v1.0.0
RUN echo $CONT_IMG_VER
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=v1.0.0
RUN echo $CONT_IMG_VER
```
@z

@x
Then, assume this image is built with this command:
@y
Then, assume this image is built with this command:
@z

@x
```console
$ docker build --build-arg CONT_IMG_VER=v2.0.1 .
```
@y
```console
$ docker build --build-arg CONT_IMG_VER=v2.0.1 .
```
@z

@x
In this case, the `RUN` instruction uses `v1.0.0` instead of the `ARG` setting
passed by the user:`v2.0.1` This behavior is similar to a shell
script where a locally scoped variable overrides the variables passed as
arguments or inherited from environment, from its point of definition.
@y
In this case, the `RUN` instruction uses `v1.0.0` instead of the `ARG` setting
passed by the user:`v2.0.1` This behavior is similar to a shell
script where a locally scoped variable overrides the variables passed as
arguments or inherited from environment, from its point of definition.
@z

@x
Using the example above but a different `ENV` specification you can create more
useful interactions between `ARG` and `ENV` instructions:
@y
Using the example above but a different `ENV` specification you can create more
useful interactions between `ARG` and `ENV` instructions:
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=${CONT_IMG_VER:-v1.0.0}
RUN echo $CONT_IMG_VER
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=${CONT_IMG_VER:-v1.0.0}
RUN echo $CONT_IMG_VER
```
@z

@x
Unlike an `ARG` instruction, `ENV` values are always persisted in the built
image. Consider a docker build without the `--build-arg` flag:
@y
Unlike an `ARG` instruction, `ENV` values are always persisted in the built
image. Consider a docker build without the `--build-arg` flag:
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
Using this Dockerfile example, `CONT_IMG_VER` is still persisted in the image but
its value would be `v1.0.0` as it is the default set in line 3 by the `ENV` instruction.
@y
Using this Dockerfile example, `CONT_IMG_VER` is still persisted in the image but
its value would be `v1.0.0` as it is the default set in line 3 by the `ENV` instruction.
@z

@x
The variable expansion technique in this example allows you to pass arguments
from the command line and persist them in the final image by leveraging the
`ENV` instruction. Variable expansion is only supported for [a limited set of
Dockerfile instructions.](#environment-replacement)
@y
The variable expansion technique in this example allows you to pass arguments
from the command line and persist them in the final image by leveraging the
`ENV` instruction. Variable expansion is only supported for [a limited set of
Dockerfile instructions.](#environment-replacement)
@z

@x
### Predefined ARGs
@y
### Predefined ARGs
@z

@x
Docker has a set of predefined `ARG` variables that you can use without a
corresponding `ARG` instruction in the Dockerfile.
@y
Docker has a set of predefined `ARG` variables that you can use without a
corresponding `ARG` instruction in the Dockerfile.
@z

@x
- `HTTP_PROXY`
- `http_proxy`
- `HTTPS_PROXY`
- `https_proxy`
- `FTP_PROXY`
- `ftp_proxy`
- `NO_PROXY`
- `no_proxy`
- `ALL_PROXY`
- `all_proxy`
@y
- `HTTP_PROXY`
- `http_proxy`
- `HTTPS_PROXY`
- `https_proxy`
- `FTP_PROXY`
- `ftp_proxy`
- `NO_PROXY`
- `no_proxy`
- `ALL_PROXY`
- `all_proxy`
@z

@x
To use these, pass them on the command line using the `--build-arg` flag, for
example:
@y
To use these, pass them on the command line using the `--build-arg` flag, for
example:
@z

@x
```console
$ docker build --build-arg HTTPS_PROXY=https://my-proxy.example.com .
```
@y
```console
$ docker build --build-arg HTTPS_PROXY=https://my-proxy.example.com .
```
@z

@x
By default, these pre-defined variables are excluded from the output of
`docker history`. Excluding them reduces the risk of accidentally leaking
sensitive authentication information in an `HTTP_PROXY` variable.
@y
By default, these pre-defined variables are excluded from the output of
`docker history`. Excluding them reduces the risk of accidentally leaking
sensitive authentication information in an `HTTP_PROXY` variable.
@z

@x
For example, consider building the following Dockerfile using
`--build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com`
@y
For example, consider building the following Dockerfile using
`--build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com`
@z

@x
```dockerfile
FROM ubuntu
RUN echo "Hello World"
```
@y
```dockerfile
FROM ubuntu
RUN echo "Hello World"
```
@z

@x
In this case, the value of the `HTTP_PROXY` variable is not available in the
`docker history` and is not cached. If you were to change location, and your
proxy server changed to `http://user:pass@proxy.sfo.example.com`, a subsequent
build does not result in a cache miss.
@y
In this case, the value of the `HTTP_PROXY` variable is not available in the
`docker history` and is not cached. If you were to change location, and your
proxy server changed to `http://user:pass@proxy.sfo.example.com`, a subsequent
build does not result in a cache miss.
@z

@x
If you need to override this behaviour then you may do so by adding an `ARG`
statement in the Dockerfile as follows:
@y
If you need to override this behaviour then you may do so by adding an `ARG`
statement in the Dockerfile as follows:
@z

@x
```dockerfile
FROM ubuntu
ARG HTTP_PROXY
RUN echo "Hello World"
```
@y
```dockerfile
FROM ubuntu
ARG HTTP_PROXY
RUN echo "Hello World"
```
@z

@x
When building this Dockerfile, the `HTTP_PROXY` is preserved in the
`docker history`, and changing its value invalidates the build cache.
@y
When building this Dockerfile, the `HTTP_PROXY` is preserved in the
`docker history`, and changing its value invalidates the build cache.
@z

@x
### Automatic platform ARGs in the global scope
@y
### Automatic platform ARGs in the global scope
@z

@x
This feature is only available when using the [BuildKit](https://docs.docker.com/build/buildkit/)
backend.
@y
This feature is only available when using the [BuildKit](https://docs.docker.com/build/buildkit/)
backend.
@z

@x
BuildKit supports a predefined set of `ARG` variables with information on the platform of
the node performing the build (build platform) and on the platform of the
resulting image (target platform). The target platform can be specified with
the `--platform` flag on `docker build`.
@y
BuildKit supports a predefined set of `ARG` variables with information on the platform of
the node performing the build (build platform) and on the platform of the
resulting image (target platform). The target platform can be specified with
the `--platform` flag on `docker build`.
@z

@x
The following `ARG` variables are set automatically:
@y
The following `ARG` variables are set automatically:
@z

@x
- `TARGETPLATFORM` - platform of the build result. Eg `linux/amd64`, `linux/arm/v7`, `windows/amd64`.
- `TARGETOS` - OS component of TARGETPLATFORM
- `TARGETARCH` - architecture component of TARGETPLATFORM
- `TARGETVARIANT` - variant component of TARGETPLATFORM
- `BUILDPLATFORM` - platform of the node performing the build.
- `BUILDOS` - OS component of BUILDPLATFORM
- `BUILDARCH` - architecture component of BUILDPLATFORM
- `BUILDVARIANT` - variant component of BUILDPLATFORM
@y
- `TARGETPLATFORM` - platform of the build result. Eg `linux/amd64`, `linux/arm/v7`, `windows/amd64`.
- `TARGETOS` - OS component of TARGETPLATFORM
- `TARGETARCH` - architecture component of TARGETPLATFORM
- `TARGETVARIANT` - variant component of TARGETPLATFORM
- `BUILDPLATFORM` - platform of the node performing the build.
- `BUILDOS` - OS component of BUILDPLATFORM
- `BUILDARCH` - architecture component of BUILDPLATFORM
- `BUILDVARIANT` - variant component of BUILDPLATFORM
@z

@x
These arguments are defined in the global scope so are not automatically
available inside build stages or for your `RUN` commands. To expose one of
these arguments inside the build stage redefine it without value.
@y
These arguments are defined in the global scope so are not automatically
available inside build stages or for your `RUN` commands. To expose one of
these arguments inside the build stage redefine it without value.
@z

@x
For example:
@y
For example:
@z

@x
```dockerfile
FROM alpine
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
```
@y
```dockerfile
FROM alpine
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
```
@z

@x
### BuildKit built-in build args
@y
### BuildKit built-in build args
@z

@x
| Arg                             | Type   | Description                                                                                                                                                                                       |
| ------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BUILDKIT_CACHE_MOUNT_NS`       | String | Set optional cache ID namespace.                                                                                                                                                                  |
| `BUILDKIT_CONTEXT_KEEP_GIT_DIR` | Bool   | Trigger Git context to keep the `.git` directory.                                                                                                                                                 |
| `BUILDKIT_INLINE_CACHE`[^2]     | Bool   | Inline cache metadata to image config or not.                                                                                                                                                     |
| `BUILDKIT_MULTI_PLATFORM`       | Bool   | Opt into deterministic output regardless of multi-platform output or not.                                                                                                                         |
| `BUILDKIT_SANDBOX_HOSTNAME`     | String | Set the hostname (default `buildkitsandbox`)                                                                                                                                                      |
| `BUILDKIT_SYNTAX`               | String | Set frontend image                                                                                                                                                                                |
| `SOURCE_DATE_EPOCH`             | Int    | Set the Unix timestamp for created image and layers. More info from [reproducible builds](https://reproducible-builds.org/docs/source-date-epoch/). Supported since Dockerfile 1.5, BuildKit 0.11 |
@y
| Arg                             | Type   | Description                                                                                                                                                                                       |
| ------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BUILDKIT_CACHE_MOUNT_NS`       | String | Set optional cache ID namespace.                                                                                                                                                                  |
| `BUILDKIT_CONTEXT_KEEP_GIT_DIR` | Bool   | Trigger Git context to keep the `.git` directory.                                                                                                                                                 |
| `BUILDKIT_INLINE_CACHE`[^2]     | Bool   | Inline cache metadata to image config or not.                                                                                                                                                     |
| `BUILDKIT_MULTI_PLATFORM`       | Bool   | Opt into deterministic output regardless of multi-platform output or not.                                                                                                                         |
| `BUILDKIT_SANDBOX_HOSTNAME`     | String | Set the hostname (default `buildkitsandbox`)                                                                                                                                                      |
| `BUILDKIT_SYNTAX`               | String | Set frontend image                                                                                                                                                                                |
| `SOURCE_DATE_EPOCH`             | Int    | Set the Unix timestamp for created image and layers. More info from [reproducible builds](https://reproducible-builds.org/docs/source-date-epoch/). Supported since Dockerfile 1.5, BuildKit 0.11 |
@z

@x
#### Example: keep `.git` dir
@y
#### Example: keep `.git` dir
@z

@x
When using a Git context, `.git` dir is not kept on checkouts. It can be
useful to keep it around if you want to retrieve git information during
your build:
@y
When using a Git context, `.git` dir is not kept on checkouts. It can be
useful to keep it around if you want to retrieve git information during
your build:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
WORKDIR /src
RUN --mount=target=. \
  make REVISION=$(git rev-parse HEAD) build
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
WORKDIR /src
RUN --mount=target=. \
  make REVISION=$(git rev-parse HEAD) build
```
@z

@x
```console
$ docker build --build-arg BUILDKIT_CONTEXT_KEEP_GIT_DIR=1 https://github.com/user/repo.git#main
```
@y
```console
$ docker build --build-arg BUILDKIT_CONTEXT_KEEP_GIT_DIR=1 https://github.com/user/repo.git#main
```
@z

@x
### Impact on build caching
@y
### Impact on build caching
@z

@x
`ARG` variables are not persisted into the built image as `ENV` variables are.
However, `ARG` variables do impact the build cache in similar ways. If a
Dockerfile defines an `ARG` variable whose value is different from a previous
build, then a "cache miss" occurs upon its first usage, not its definition. In
particular, all `RUN` instructions following an `ARG` instruction use the `ARG`
variable implicitly (as an environment variable), thus can cause a cache miss.
All predefined `ARG` variables are exempt from caching unless there is a
matching `ARG` statement in the Dockerfile.
@y
`ARG` variables are not persisted into the built image as `ENV` variables are.
However, `ARG` variables do impact the build cache in similar ways. If a
Dockerfile defines an `ARG` variable whose value is different from a previous
build, then a "cache miss" occurs upon its first usage, not its definition. In
particular, all `RUN` instructions following an `ARG` instruction use the `ARG`
variable implicitly (as an environment variable), thus can cause a cache miss.
All predefined `ARG` variables are exempt from caching unless there is a
matching `ARG` statement in the Dockerfile.
@z

@x
For example, consider these two Dockerfile:
@y
For example, consider these two Dockerfile:
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
RUN echo $CONT_IMG_VER
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
RUN echo $CONT_IMG_VER
```
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
RUN echo hello
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
RUN echo hello
```
@z

@x
If you specify `--build-arg CONT_IMG_VER=<value>` on the command line, in both
cases, the specification on line 2 doesn't cause a cache miss; line 3 does
cause a cache miss. `ARG CONT_IMG_VER` causes the `RUN` line to be identified
as the same as running `CONT_IMG_VER=<value> echo hello`, so if the `<value>`
changes, you get a cache miss.
@y
If you specify `--build-arg CONT_IMG_VER=<value>` on the command line, in both
cases, the specification on line 2 doesn't cause a cache miss; line 3 does
cause a cache miss. `ARG CONT_IMG_VER` causes the `RUN` line to be identified
as the same as running `CONT_IMG_VER=<value> echo hello`, so if the `<value>`
changes, you get a cache miss.
@z

@x
Consider another example under the same command line:
@y
Consider another example under the same command line:
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=$CONT_IMG_VER
RUN echo $CONT_IMG_VER
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=$CONT_IMG_VER
RUN echo $CONT_IMG_VER
```
@z

@x
In this example, the cache miss occurs on line 3. The miss happens because
the variable's value in the `ENV` references the `ARG` variable and that
variable is changed through the command line. In this example, the `ENV`
command causes the image to include the value.
@y
In this example, the cache miss occurs on line 3. The miss happens because
the variable's value in the `ENV` references the `ARG` variable and that
variable is changed through the command line. In this example, the `ENV`
command causes the image to include the value.
@z

@x
If an `ENV` instruction overrides an `ARG` instruction of the same name, like
this Dockerfile:
@y
If an `ENV` instruction overrides an `ARG` instruction of the same name, like
this Dockerfile:
@z

@x
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=hello
RUN echo $CONT_IMG_VER
```
@y
```dockerfile
FROM ubuntu
ARG CONT_IMG_VER
ENV CONT_IMG_VER=hello
RUN echo $CONT_IMG_VER
```
@z

@x
Line 3 doesn't cause a cache miss because the value of `CONT_IMG_VER` is a
constant (`hello`). As a result, the environment variables and values used on
the `RUN` (line 4) doesn't change between builds.
@y
Line 3 doesn't cause a cache miss because the value of `CONT_IMG_VER` is a
constant (`hello`). As a result, the environment variables and values used on
the `RUN` (line 4) doesn't change between builds.
@z

@x
## ONBUILD
@y
## ONBUILD
@z

@x
```dockerfile
ONBUILD <INSTRUCTION>
```
@y
```dockerfile
ONBUILD <INSTRUCTION>
```
@z

@x
The `ONBUILD` instruction adds to the image a trigger instruction to
be executed at a later time, when the image is used as the base for
another build. The trigger will be executed in the context of the
downstream build, as if it had been inserted immediately after the
`FROM` instruction in the downstream Dockerfile.
@y
The `ONBUILD` instruction adds to the image a trigger instruction to
be executed at a later time, when the image is used as the base for
another build. The trigger will be executed in the context of the
downstream build, as if it had been inserted immediately after the
`FROM` instruction in the downstream Dockerfile.
@z

@x
This is useful if you are building an image which will be used as a base
to build other images, for example an application build environment or a
daemon which may be customized with user-specific configuration.
@y
This is useful if you are building an image which will be used as a base
to build other images, for example an application build environment or a
daemon which may be customized with user-specific configuration.
@z

@x
For example, if your image is a reusable Python application builder, it
will require application source code to be added in a particular
directory, and it might require a build script to be called after
that. You can't just call `ADD` and `RUN` now, because you don't yet
have access to the application source code, and it will be different for
each application build. You could simply provide application developers
with a boilerplate Dockerfile to copy-paste into their application, but
that's inefficient, error-prone and difficult to update because it
mixes with application-specific code.
@y
For example, if your image is a reusable Python application builder, it
will require application source code to be added in a particular
directory, and it might require a build script to be called after
that. You can't just call `ADD` and `RUN` now, because you don't yet
have access to the application source code, and it will be different for
each application build. You could simply provide application developers
with a boilerplate Dockerfile to copy-paste into their application, but
that's inefficient, error-prone and difficult to update because it
mixes with application-specific code.
@z

@x
The solution is to use `ONBUILD` to register advance instructions to
run later, during the next build stage.
@y
The solution is to use `ONBUILD` to register advance instructions to
run later, during the next build stage.
@z

@x
Here's how it works:
@y
Here's how it works:
@z

@x
1. When it encounters an `ONBUILD` instruction, the builder adds a
   trigger to the metadata of the image being built. The instruction
   doesn't otherwise affect the current build.
2. At the end of the build, a list of all triggers is stored in the
   image manifest, under the key `OnBuild`. They can be inspected with
   the `docker inspect` command.
3. Later the image may be used as a base for a new build, using the
   `FROM` instruction. As part of processing the `FROM` instruction,
   the downstream builder looks for `ONBUILD` triggers, and executes
   them in the same order they were registered. If any of the triggers
   fail, the `FROM` instruction is aborted which in turn causes the
   build to fail. If all triggers succeed, the `FROM` instruction
   completes and the build continues as usual.
4. Triggers are cleared from the final image after being executed. In
   other words they aren't inherited by "grand-children" builds.
@y
1. When it encounters an `ONBUILD` instruction, the builder adds a
   trigger to the metadata of the image being built. The instruction
   doesn't otherwise affect the current build.
2. At the end of the build, a list of all triggers is stored in the
   image manifest, under the key `OnBuild`. They can be inspected with
   the `docker inspect` command.
3. Later the image may be used as a base for a new build, using the
   `FROM` instruction. As part of processing the `FROM` instruction,
   the downstream builder looks for `ONBUILD` triggers, and executes
   them in the same order they were registered. If any of the triggers
   fail, the `FROM` instruction is aborted which in turn causes the
   build to fail. If all triggers succeed, the `FROM` instruction
   completes and the build continues as usual.
4. Triggers are cleared from the final image after being executed. In
   other words they aren't inherited by "grand-children" builds.
@z

@x
For example you might add something like this:
@y
For example you might add something like this:
@z

@x
```dockerfile
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
```
@y
```dockerfile
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
```
@z

@x
### ONBUILD limitations
@y
### ONBUILD limitations
@z

@x
- Chaining `ONBUILD` instructions using `ONBUILD ONBUILD` isn't allowed.
- The `ONBUILD` instruction may not trigger `FROM` or `MAINTAINER` instructions.
@y
- Chaining `ONBUILD` instructions using `ONBUILD ONBUILD` isn't allowed.
- The `ONBUILD` instruction may not trigger `FROM` or `MAINTAINER` instructions.
@z

@x
## STOPSIGNAL
@y
## STOPSIGNAL
@z

@x
```dockerfile
STOPSIGNAL signal
```
@y
```dockerfile
STOPSIGNAL signal
```
@z

@x
The `STOPSIGNAL` instruction sets the system call signal that will be sent to the
container to exit. This signal can be a signal name in the format `SIG<NAME>`,
for instance `SIGKILL`, or an unsigned number that matches a position in the
kernel's syscall table, for instance `9`. The default is `SIGTERM` if not
defined.
@y
The `STOPSIGNAL` instruction sets the system call signal that will be sent to the
container to exit. This signal can be a signal name in the format `SIG<NAME>`,
for instance `SIGKILL`, or an unsigned number that matches a position in the
kernel's syscall table, for instance `9`. The default is `SIGTERM` if not
defined.
@z

@x
The image's default stopsignal can be overridden per container, using the
`--stop-signal` flag on `docker run` and `docker create`.
@y
The image's default stopsignal can be overridden per container, using the
`--stop-signal` flag on `docker run` and `docker create`.
@z

@x
## HEALTHCHECK
@y
## HEALTHCHECK
@z

@x
The `HEALTHCHECK` instruction has two forms:
@y
The `HEALTHCHECK` instruction has two forms:
@z

@x
- `HEALTHCHECK [OPTIONS] CMD command` (check container health by running a command inside the container)
- `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)
@y
- `HEALTHCHECK [OPTIONS] CMD command` (check container health by running a command inside the container)
- `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)
@z

@x
The `HEALTHCHECK` instruction tells Docker how to test a container to check that
it's still working. This can detect cases such as a web server stuck in
an infinite loop and unable to handle new connections, even though the server
process is still running.
@y
The `HEALTHCHECK` instruction tells Docker how to test a container to check that
it's still working. This can detect cases such as a web server stuck in
an infinite loop and unable to handle new connections, even though the server
process is still running.
@z

@x
When a container has a healthcheck specified, it has a health status in
addition to its normal status. This status is initially `starting`. Whenever a
health check passes, it becomes `healthy` (whatever state it was previously in).
After a certain number of consecutive failures, it becomes `unhealthy`.
@y
When a container has a healthcheck specified, it has a health status in
addition to its normal status. This status is initially `starting`. Whenever a
health check passes, it becomes `healthy` (whatever state it was previously in).
After a certain number of consecutive failures, it becomes `unhealthy`.
@z

@x
The options that can appear before `CMD` are:
@y
The options that can appear before `CMD` are:
@z

@x
- `--interval=DURATION` (default: `30s`)
- `--timeout=DURATION` (default: `30s`)
- `--start-period=DURATION` (default: `0s`)
- `--start-interval=DURATION` (default: `5s`)
- `--retries=N` (default: `3`)
@y
- `--interval=DURATION` (default: `30s`)
- `--timeout=DURATION` (default: `30s`)
- `--start-period=DURATION` (default: `0s`)
- `--start-interval=DURATION` (default: `5s`)
- `--retries=N` (default: `3`)
@z

@x
The health check will first run **interval** seconds after the container is
started, and then again **interval** seconds after each previous check completes.
@y
The health check will first run **interval** seconds after the container is
started, and then again **interval** seconds after each previous check completes.
@z

@x
If a single run of the check takes longer than **timeout** seconds then the check
is considered to have failed.
@y
If a single run of the check takes longer than **timeout** seconds then the check
is considered to have failed.
@z

@x
It takes **retries** consecutive failures of the health check for the container
to be considered `unhealthy`.
@y
It takes **retries** consecutive failures of the health check for the container
to be considered `unhealthy`.
@z

@x
**start period** provides initialization time for containers that need time to bootstrap.
Probe failure during that period will not be counted towards the maximum number of retries.
However, if a health check succeeds during the start period, the container is considered
started and all consecutive failures will be counted towards the maximum number of retries.
@y
**start period** provides initialization time for containers that need time to bootstrap.
Probe failure during that period will not be counted towards the maximum number of retries.
However, if a health check succeeds during the start period, the container is considered
started and all consecutive failures will be counted towards the maximum number of retries.
@z

@x
**start interval** is the time between health checks during the start period.
This option requires Docker Engine version 25.0 or later.
@y
**start interval** is the time between health checks during the start period.
This option requires Docker Engine version 25.0 or later.
@z

@x
There can only be one `HEALTHCHECK` instruction in a Dockerfile. If you list
more than one then only the last `HEALTHCHECK` will take effect.
@y
There can only be one `HEALTHCHECK` instruction in a Dockerfile. If you list
more than one then only the last `HEALTHCHECK` will take effect.
@z

@x
The command after the `CMD` keyword can be either a shell command (e.g. `HEALTHCHECK
CMD /bin/check-running`) or an exec array (as with other Dockerfile commands;
see e.g. `ENTRYPOINT` for details).
@y
The command after the `CMD` keyword can be either a shell command (e.g. `HEALTHCHECK
CMD /bin/check-running`) or an exec array (as with other Dockerfile commands;
see e.g. `ENTRYPOINT` for details).
@z

@x
The command's exit status indicates the health status of the container.
The possible values are:
@y
The command's exit status indicates the health status of the container.
The possible values are:
@z

@x
- 0: success - the container is healthy and ready for use
- 1: unhealthy - the container isn't working correctly
- 2: reserved - don't use this exit code
@y
- 0: success - the container is healthy and ready for use
- 1: unhealthy - the container isn't working correctly
- 2: reserved - don't use this exit code
@z

@x
For example, to check every five minutes or so that a web-server is able to
serve the site's main page within three seconds:
@y
For example, to check every five minutes or so that a web-server is able to
serve the site's main page within three seconds:
@z

@x
```dockerfile
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```
@y
```dockerfile
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```
@z

@x
To help debug failing probes, any output text (UTF-8 encoded) that the command writes
on stdout or stderr will be stored in the health status and can be queried with
`docker inspect`. Such output should be kept short (only the first 4096 bytes
are stored currently).
@y
To help debug failing probes, any output text (UTF-8 encoded) that the command writes
on stdout or stderr will be stored in the health status and can be queried with
`docker inspect`. Such output should be kept short (only the first 4096 bytes
are stored currently).
@z

@x
When the health status of a container changes, a `health_status` event is
generated with the new status.
@y
When the health status of a container changes, a `health_status` event is
generated with the new status.
@z

@x
## SHELL
@y
## SHELL
@z

@x
```dockerfile
SHELL ["executable", "parameters"]
```
@y
```dockerfile
SHELL ["executable", "parameters"]
```
@z

@x
The `SHELL` instruction allows the default shell used for the shell form of
commands to be overridden. The default shell on Linux is `["/bin/sh", "-c"]`, and on
Windows is `["cmd", "/S", "/C"]`. The `SHELL` instruction must be written in JSON
form in a Dockerfile.
@y
The `SHELL` instruction allows the default shell used for the shell form of
commands to be overridden. The default shell on Linux is `["/bin/sh", "-c"]`, and on
Windows is `["cmd", "/S", "/C"]`. The `SHELL` instruction must be written in JSON
form in a Dockerfile.
@z

@x
The `SHELL` instruction is particularly useful on Windows where there are
two commonly used and quite different native shells: `cmd` and `powershell`, as
well as alternate shells available including `sh`.
@y
The `SHELL` instruction is particularly useful on Windows where there are
two commonly used and quite different native shells: `cmd` and `powershell`, as
well as alternate shells available including `sh`.
@z

@x
The `SHELL` instruction can appear multiple times. Each `SHELL` instruction overrides
all previous `SHELL` instructions, and affects all subsequent instructions. For example:
@y
The `SHELL` instruction can appear multiple times. Each `SHELL` instruction overrides
all previous `SHELL` instructions, and affects all subsequent instructions. For example:
@z

@x
```dockerfile
FROM microsoft/windowsservercore
@y
```dockerfile
FROM microsoft/windowsservercore
@z

@x
# Executed as cmd /S /C echo default
RUN echo default
@y
# Executed as cmd /S /C echo default
RUN echo default
@z

@x
# Executed as cmd /S /C powershell -command Write-Host default
RUN powershell -command Write-Host default
@y
# Executed as cmd /S /C powershell -command Write-Host default
RUN powershell -command Write-Host default
@z

@x
# Executed as powershell -command Write-Host hello
SHELL ["powershell", "-command"]
RUN Write-Host hello
@y
# Executed as powershell -command Write-Host hello
SHELL ["powershell", "-command"]
RUN Write-Host hello
@z

@x
# Executed as cmd /S /C echo hello
SHELL ["cmd", "/S", "/C"]
RUN echo hello
```
@y
# Executed as cmd /S /C echo hello
SHELL ["cmd", "/S", "/C"]
RUN echo hello
```
@z

@x
The following instructions can be affected by the `SHELL` instruction when the
shell form of them is used in a Dockerfile: `RUN`, `CMD` and `ENTRYPOINT`.
@y
The following instructions can be affected by the `SHELL` instruction when the
shell form of them is used in a Dockerfile: `RUN`, `CMD` and `ENTRYPOINT`.
@z

@x
The following example is a common pattern found on Windows which can be
streamlined by using the `SHELL` instruction:
@y
The following example is a common pattern found on Windows which can be
streamlined by using the `SHELL` instruction:
@z

@x
```dockerfile
RUN powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```
@y
```dockerfile
RUN powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```
@z

@x
The command invoked by the builder will be:
@y
The command invoked by the builder will be:
@z

@x
```powershell
cmd /S /C powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```
@y
```powershell
cmd /S /C powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```
@z

@x
This is inefficient for two reasons. First, there is an unnecessary `cmd.exe`
command processor (aka shell) being invoked. Second, each `RUN` instruction in
the shell form requires an extra `powershell -command` prefixing the command.
@y
This is inefficient for two reasons. First, there is an unnecessary `cmd.exe`
command processor (aka shell) being invoked. Second, each `RUN` instruction in
the shell form requires an extra `powershell -command` prefixing the command.
@z

@x
To make this more efficient, one of two mechanisms can be employed. One is to
use the JSON form of the `RUN` command such as:
@y
To make this more efficient, one of two mechanisms can be employed. One is to
use the JSON form of the `RUN` command such as:
@z

@x
```dockerfile
RUN ["powershell", "-command", "Execute-MyCmdlet", "-param1 \"c:\\foo.txt\""]
```
@y
```dockerfile
RUN ["powershell", "-command", "Execute-MyCmdlet", "-param1 \"c:\\foo.txt\""]
```
@z

@x
While the JSON form is unambiguous and does not use the unnecessary `cmd.exe`,
it does require more verbosity through double-quoting and escaping. The alternate
mechanism is to use the `SHELL` instruction and the shell form,
making a more natural syntax for Windows users, especially when combined with
the `escape` parser directive:
@y
While the JSON form is unambiguous and does not use the unnecessary `cmd.exe`,
it does require more verbosity through double-quoting and escaping. The alternate
mechanism is to use the `SHELL` instruction and the shell form,
making a more natural syntax for Windows users, especially when combined with
the `escape` parser directive:
@z

@x
```dockerfile
# escape=`
@y
```dockerfile
# escape=`
@z

@x
FROM microsoft/nanoserver
SHELL ["powershell","-command"]
RUN New-Item -ItemType Directory C:\Example
ADD Execute-MyCmdlet.ps1 c:\example\
RUN c:\example\Execute-MyCmdlet -sample 'hello world'
```
@y
FROM microsoft/nanoserver
SHELL ["powershell","-command"]
RUN New-Item -ItemType Directory C:\Example
ADD Execute-MyCmdlet.ps1 c:\example\
RUN c:\example\Execute-MyCmdlet -sample 'hello world'
```
@z

@x
Resulting in:
@y
Resulting in:
@z

@x
```console
PS E:\myproject> docker build -t shell .
@y
```console
PS E:\myproject> docker build -t shell .
@z

@x
Sending build context to Docker daemon 4.096 kB
Step 1/5 : FROM microsoft/nanoserver
 ---> 22738ff49c6d
Step 2/5 : SHELL powershell -command
 ---> Running in 6fcdb6855ae2
 ---> 6331462d4300
Removing intermediate container 6fcdb6855ae2
Step 3/5 : RUN New-Item -ItemType Directory C:\Example
 ---> Running in d0eef8386e97
@y
Sending build context to Docker daemon 4.096 kB
Step 1/5 : FROM microsoft/nanoserver
 ---> 22738ff49c6d
Step 2/5 : SHELL powershell -command
 ---> Running in 6fcdb6855ae2
 ---> 6331462d4300
Removing intermediate container 6fcdb6855ae2
Step 3/5 : RUN New-Item -ItemType Directory C:\Example
 ---> Running in d0eef8386e97
@z

@x
    Directory: C:\
@y
    Directory: C:\
@z

@x
Mode         LastWriteTime              Length Name
----         -------------              ------ ----
d-----       10/28/2016  11:26 AM              Example
@y
Mode         LastWriteTime              Length Name
----         -------------              ------ ----
d-----       10/28/2016  11:26 AM              Example
@z

@x
 ---> 3f2fbf1395d9
Removing intermediate container d0eef8386e97
Step 4/5 : ADD Execute-MyCmdlet.ps1 c:\example\
 ---> a955b2621c31
Removing intermediate container b825593d39fc
Step 5/5 : RUN c:\example\Execute-MyCmdlet 'hello world'
 ---> Running in be6d8e63fe75
hello world
 ---> 8e559e9bf424
Removing intermediate container be6d8e63fe75
Successfully built 8e559e9bf424
PS E:\myproject>
```
@y
 ---> 3f2fbf1395d9
Removing intermediate container d0eef8386e97
Step 4/5 : ADD Execute-MyCmdlet.ps1 c:\example\
 ---> a955b2621c31
Removing intermediate container b825593d39fc
Step 5/5 : RUN c:\example\Execute-MyCmdlet 'hello world'
 ---> Running in be6d8e63fe75
hello world
 ---> 8e559e9bf424
Removing intermediate container be6d8e63fe75
Successfully built 8e559e9bf424
PS E:\myproject>
```
@z

@x
The `SHELL` instruction could also be used to modify the way in which
a shell operates. For example, using `SHELL cmd /S /C /V:ON|OFF` on Windows, delayed
environment variable expansion semantics could be modified.
@y
The `SHELL` instruction could also be used to modify the way in which
a shell operates. For example, using `SHELL cmd /S /C /V:ON|OFF` on Windows, delayed
environment variable expansion semantics could be modified.
@z

@x
The `SHELL` instruction can also be used on Linux should an alternate shell be
required such as `zsh`, `csh`, `tcsh` and others.
@y
The `SHELL` instruction can also be used on Linux should an alternate shell be
required such as `zsh`, `csh`, `tcsh` and others.
@z

@x
## Here-Documents
@y
## Here-Documents
@z

@x
Here-documents allow redirection of subsequent Dockerfile lines to the input of
`RUN` or `COPY` commands. If such command contains a [here-document](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04)
the Dockerfile considers the next lines until the line only containing a
here-doc delimiter as part of the same command.
@y
Here-documents allow redirection of subsequent Dockerfile lines to the input of
`RUN` or `COPY` commands. If such command contains a [here-document](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04)
the Dockerfile considers the next lines until the line only containing a
here-doc delimiter as part of the same command.
@z

@x
### Example: Running a multi-line script
@y
### Example: Running a multi-line script
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT bash
  set -ex
  apt-get update
  apt-get install -y vim
EOT
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT bash
  set -ex
  apt-get update
  apt-get install -y vim
EOT
```
@z

@x
If the command only contains a here-document, its contents is evaluated with
the default shell.
@y
If the command only contains a here-document, its contents is evaluated with
the default shell.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT
  mkdir -p foo/bar
EOT
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT
  mkdir -p foo/bar
EOT
```
@z

@x
Alternatively, shebang header can be used to define an interpreter.
@y
Alternatively, shebang header can be used to define an interpreter.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.6
RUN <<EOT
#!/usr/bin/env python
print("hello world")
EOT
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.6
RUN <<EOT
#!/usr/bin/env python
print("hello world")
EOT
```
@z

@x
More complex examples may use multiple here-documents.
@y
More complex examples may use multiple here-documents.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN <<FILE1 cat > file1 && <<FILE2 cat > file2
I am
first
FILE1
I am
second
FILE2
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN <<FILE1 cat > file1 && <<FILE2 cat > file2
I am
first
FILE1
I am
second
FILE2
```
@z

@x
### Example: Creating inline files
@y
### Example: Creating inline files
@z

@x
With `COPY` instructions, you can replace the source parameter with a here-doc
indicator to write the contents of the here-document directly to a file. The
following example creates a `greeting.txt` file containing `hello world` using
a `COPY` instruction.
@y
With `COPY` instructions, you can replace the source parameter with a here-doc
indicator to write the contents of the here-document directly to a file. The
following example creates a `greeting.txt` file containing `hello world` using
a `COPY` instruction.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
COPY <<EOF greeting.txt
hello world
EOF
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
COPY <<EOF greeting.txt
hello world
EOF
```
@z

@x
Regular here-doc [variable expansion and tab stripping rules](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04) apply.
The following example shows a small Dockerfile that creates a `hello.sh` script
file using a `COPY` instruction with a here-document.
@y
Regular here-doc [variable expansion and tab stripping rules](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04) apply.
The following example shows a small Dockerfile that creates a `hello.sh` script
file using a `COPY` instruction with a here-document.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ARG FOO=bar
COPY <<-EOT /script.sh
  echo "hello ${FOO}"
EOT
ENTRYPOINT ash /script.sh
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ARG FOO=bar
COPY <<-EOT /script.sh
  echo "hello ${FOO}"
EOT
ENTRYPOINT ash /script.sh
```
@z

@x
In this case, file script prints "hello bar", because the variable is expanded
when the `COPY` instruction gets executed.
@y
In this case, file script prints "hello bar", because the variable is expanded
when the `COPY` instruction gets executed.
@z

@x
```console
$ docker build -t heredoc .
$ docker run heredoc
hello bar
```
@y
```console
$ docker build -t heredoc .
$ docker run heredoc
hello bar
```
@z

@x
If instead you were to quote any part of the here-document word `EOT`, the
variable would not be expanded at build-time.
@y
If instead you were to quote any part of the here-document word `EOT`, the
variable would not be expanded at build-time.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ARG FOO=bar
COPY <<-"EOT" /script.sh
  echo "hello ${FOO}"
EOT
ENTRYPOINT ash /script.sh
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
ARG FOO=bar
COPY <<-"EOT" /script.sh
  echo "hello ${FOO}"
EOT
ENTRYPOINT ash /script.sh
```
@z

@x
Note that `ARG FOO=bar` is excessive here, and can be removed. The variable
gets interpreted at runtime, when the script is invoked:
@y
Note that `ARG FOO=bar` is excessive here, and can be removed. The variable
gets interpreted at runtime, when the script is invoked:
@z

@x
```console
$ docker build -t heredoc .
$ docker run -e FOO=world heredoc
hello world
```
@y
```console
$ docker build -t heredoc .
$ docker run -e FOO=world heredoc
hello world
```
@z

@x
## Dockerfile examples
@y
## Dockerfile examples
@z

@x
For examples of Dockerfiles, refer to:
@y
For examples of Dockerfiles, refer to:
@z

@x
- The [building best practices page](https://docs.docker.com/build/building/best-practices/)
- The ["get started" tutorials](https://docs.docker.com/get-started/)
- The [language-specific getting started guides](https://docs.docker.com/guides/language/)
@y
- The [building best practices page](https://docs.docker.com/build/building/best-practices/)
- The ["get started" tutorials](https://docs.docker.com/get-started/)
- The [language-specific getting started guides](https://docs.docker.com/guides/language/)
@z

@x
[^1]: Value required
[^2]: For Docker-integrated [BuildKit](https://docs.docker.com/build/buildkit/#getting-started) and `docker buildx build`
@y
[^1]: Value required
[^2]: For Docker-integrated [BuildKit](https://docs.docker.com/build/buildkit/#getting-started) and `docker buildx build`
@z
