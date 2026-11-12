%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Multi-stage builds
linkTitle: Multi-stage
@y
title: マルチステージビルド
linkTitle: マルチステージ
@z

@x
description: |
  Learn about multi-stage builds and how you can use
  them to improve your builds and get smaller images
keywords: build, best practices
@y
description: |
  Learn about multi-stage builds and how you can use
  them to improve your builds and get smaller images
keywords: build, best practices
@z

@x
Multi-stage builds are useful to anyone who has struggled to optimize
Dockerfiles while keeping them easy to read and maintain.
@y
Dockerfile の最適化に取り組んでいる方、そしてそれを読みやすくメンテナンスしやすくしようとしている方にとって、マルチステージビルドは大変有用なものとなります。
@z

@x
## Use multi-stage builds
@y
## マルチステージビルドの活用 {#use-multi-stage-builds}
@z

@x
With multi-stage builds, you use multiple `FROM` statements in your Dockerfile.
Each `FROM` instruction can use a different base, and each of them begins a new
stage of the build. You can selectively copy artifacts from one stage to
another, leaving behind everything you don't want in the final image.
@y
マルチステージビルドを行う場合、Dockerfile 内には `FROM` 文を複数記述することになります。
そして各 `FROM` 文ではいろいろなベース名を指定します。
そのいずれもビルドを行うステージを新たに記述します。
これにより、一つのステージから別ステージへと成果物を選別してコピーできるようになります。
そして最終イメージに残したくないものは含めなくて済みます。
@z

@x
The following Dockerfile has two separate stages: one for building a binary,
and another where the binary gets copied from the first stage into the next stage.
@y
以下に示す Dockerfile には２つの独立したステージがあります。
１つはバイナリーをビルドするものであり、もう１つはそのバイナリーを、第一のステージから第二のステージにコピーするものです。
@z

% snip code...

@x
You only need the single Dockerfile. No need for a separate build script. Just
run `docker build`.
@y
記述する Dockerfile は１つだけです。
ビルドのスクリプトを個別に用意する必要はありません。
単に `docker build` を実行するだけです。
@z

% snip command...

@x
The end result is a tiny production image with nothing but the binary inside.
None of the build tools required to build the application are included in the
resulting image.
@y
最終的な成果は小さなイメージであって、バイナリーしか含まれていません。
アプリケーションのビルドに必要となるビルドツール類は、最終イメージには何も含まれません。
@z

@x
How does it work? The second `FROM` instruction starts a new build stage with
the `scratch` image as its base. The `COPY --from=0` line copies just the
built artifact from the previous stage into this new stage. The Go SDK and any
intermediate artifacts are left behind, and not saved in the final image.
@y
どうしてこれが動くのでしょうか？
２つめの `FROM` 文は、`scratch` イメージをベースとする新たなビルドステージから始まります。
`COPY --from=0` という行は、直前のステージにおいてビルドされた成果物を、この新たなステージにコピーします。
Go SDK や中間生成物は取り残されたままであって、最終イメージには保存されません。
@z

@x
## Name your build stages
@y
## ビルドステージの命名 {#name-your-build-stages}
@z

@x
By default, the stages aren't named, and you refer to them by their integer
number, starting with 0 for the first `FROM` instruction. However, you can
name your stages, by adding an `AS <NAME>` to the `FROM` instruction. This
example improves the previous one by naming the stages and using the name in
the `COPY` instruction. This means that even if the instructions in your
Dockerfile are re-ordered later, the `COPY` doesn't break.
@y
デフォルトでステージに名前はつきません。
参照される際には、一番初めの `FROM` 文を 0 として順にカウントする整数値が用いられます。
もっともステージに名前をつけることは可能であって、`FROM` 文に `AS <ステージ名>` をつけます。
ここに示した例は、その前の例を改善したものであり、ステージに名前をつけてこれを `COPY` 命令において利用しています。
これはつまり、Dockerfile 内での定義順が変わったとしても、`COPY` 処理は正常に機能することを意味します。
@z

% snip code...

@x
## Stop at a specific build stage
@y
## 特定のビルドステージの停止 {#stop-at-a-specific-build-stage}
@z

@x
When you build your image, you don't necessarily need to build the entire
Dockerfile including every stage. You can specify a target build stage. The
following command assumes you are using the previous `Dockerfile` but stops at
the stage named `build`:
@y
イメージをビルドする際に、Dockerfile 内に含まれている全ステージをビルドしなければならない訳ではありません。
ビルド対象とするステージは指定することができます。
以下のコマンドは上の Dockerfile を用いているものですが、`build` という名前のステージをビルドするだけで終わります。
@z

% snip command...

@x
A few scenarios where this might be useful are:
@y
これが役に立つ例をいくつか上げると、以下のようになります。
@z

@x
- Debugging a specific build stage
- Using a `debug` stage with all debugging symbols or tools enabled, and a
  lean `production` stage
- Using a `testing` stage in which your app gets populated with test data, but
  building for production using a different stage which uses real data
@y
- 特定のビルドステージのデバッグを行います。
- デバッグシンボルやデバッグツールを利用する `debug` ステージを使い、`production` ステージは軽量なものとします。
- `testing` ステージにおいてテストデータを投入したアプリを利用するとともに、本番環境のビルドでは実データを投入した別ステージを利用します。
@z

@x
## Use an external image as a stage
@y
## 外部イメージのステージとしての利用 {#use-an-external-image-as-a-stage}
@z

@x
When using multi-stage builds, you aren't limited to copying from stages you
created earlier in your Dockerfile. You can use the `COPY --from` instruction to
copy from a separate image, either using the local image name, a tag available
locally or on a Docker registry, or a tag ID. The Docker client pulls the image
if necessary and copies the artifact from there. The syntax is:
@y
マルチステージビルドを利用する場合、ステージからのコピーは、Dockerfile 内において前段階で作り上げたステージからだけに限定されるわけではありません。
`COPY --from` 命令を利用すれば、別のイメージからのコピーも可能になります。
それはローカルにあるイメージ名、ローカル内や Docker レジストリから利用可能なタグあるいはタグ ID であっても構いません。
Docker クライアントは必要に応じてイメージをプルしたり、そこから成果物をコピーしたりします。
文法は以下のとおりです。
@z

% snip code...

@x
## Use a previous stage as a new stage
@y
## 既出ステージの新たなステージとしての利用 {#use-a-previous-stage-as-a-new-stage}
@z

@x
You can pick up where a previous stage left off by referring to it when using
the `FROM` directive. For example:
@y
`FROM` ディレクティブを利用すると、以前のステージを参照することができます。
そしてそのステージの続きから作業を再開できます。
たとえば以下のとおりです。
@z

% snip code...

@x
## Differences between legacy builder and BuildKit
@y
## 従来ビルダーと BuildKit との違い {#differences-between-legacy-builder-and-buildkit}
@z

@x
The legacy Docker Engine builder processes all stages of a Dockerfile leading
up to the selected `--target`. It will build a stage even if the selected
target doesn't depend on that stage.
@y
従来の Docker Engine ビルダーであれば、`--target` により指定されたところまでのすべてのステージを処理します。
ターゲットとして指定したステージが依存していないステージであっても、そのステージはビルドされます。
@z

@x
[BuildKit](../buildkit/_index.md) only builds the stages that the target stage
depends on.
@y
[BuildKit](../buildkit/_index.md) では、ターゲットにしたステージが依存しているステージのみをビルドします。
@z

@x
For example, given the following Dockerfile:
@y
たとえば以下のような Dockerfile があるとします。
@z
ｓ
% snip code...

@x
With [BuildKit enabled](../buildkit/_index.md#getting-started), building the
`stage2` target in this Dockerfile means only `base` and `stage2` are processed.
There is no dependency on `stage1`, so it's skipped.
@y
[BuildKit が有効](../buildkit/_index.md#getting-started) である場合、Dockerfile 内の `stage2` をターゲットとすると、`base` と `stage2` のみが処理されます。
`stage1` とは依存関係がないため、処理はスキップされます。
@z

% snip command...

@x
On the other hand, building the same target without BuildKit results in all
stages being processed:
@y
一方で BuildKit を無効にして処理した場合、同じターゲットを指定して処理すると、すべてのステージがビルドされます。
@z

% snip command...

@x
The legacy builder processes `stage1`, even if `stage2` doesn't depend on it.
@y
従来のビルダーでは、`stage2` が `stage1` に依存していなかったとしても `stage1` が処理されます。
@z
