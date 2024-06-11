%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Layers
description: Improving the initial Dockerfile using layers
keywords: build, buildkit, buildx, guide, tutorial, layers
@y
title: レイヤー
description: Improving the initial Dockerfile using layers
keywords: build, buildkit, buildx, guide, tutorial, layers
@z

@x
The order of Dockerfile instructions matters. A Docker build consists of a series
of ordered build instructions. Each instruction in a Dockerfile roughly translates
to an image layer. The following diagram illustrates how a Dockerfile translates
into a stack of layers in a container image.
@y
Dockerfile における命令の順番には意味があります。
Docker がビルドするものは、順に並んだビルド命令から構成されます。
Dockerfile に記述された各命令は、おおざっぱに言えばイメージレイヤーに変換されます。
以下に示す図は、Dockerfile がいかにして変換されて、コンテナーイメージ内に積み上げられるレイヤーとして生成されるのかを示しています。
@z

@x
![From Dockerfile to layers](./images/layers.png)
@y
![Dockerfile からレイヤーへ](./images/layers.png)
@z

@x
## Cached layers
@y
## キャッシュされるレイヤー {#cached-layers}
@z

@x
When you run a build, the builder attempts to reuse layers from earlier builds.
If a layer of an image is unchanged, then the builder picks it up from the build cache.
If a layer has changed since the last build, that layer, and all layers that follow, must be rebuilt.
@y
ビルダーがビルド処理を行う場合、すでにビルドされたレイヤーを再利用しようとします。
イメージ内のレイヤーに変更がなければ、ビルダーはそのレイヤーをビルドキャッシュから取得します。
レイヤーがビルドされた後に変更されていた場合、そのレイヤーとそれに続くレイヤーは再ビルドする必要があります。
@z

@x
The Dockerfile from the previous section copies all project files to the
container (`COPY . .`) and then downloads application dependencies in the
following step (`RUN go mod download`). If you were to change any of the project
files, then that would invalidate the cache for the `COPY` layer. It also invalidates
the cache for all of the layers that follow.
@y
上の説明に示した Dockerfile では、プロジェクトファイルすべてをコンテナーにコピーします (`COPY . .`)。
そして次のステップでは、アプリケーションに対する依存パッケージのダウンロードを行います (`RUN go mod download`)。
仮にプロジェクトファイルのいずれかを変更していたとしたら、`COPY` を行ったレイヤーに対するキャッシュは無効なものとなります。
これはそれ以降に続くレイヤーすべてを無効にします。
@z

@x
![Layer cache is bust](./images/cache-bust.png)
@y
![レイヤーキャッシュが無効](./images/cache-bust.png)
@z

@x
Because of the current order of the Dockerfile instructions, the builder must
download the Go modules again, despite none of the packages having changed since
the last time.
@y
Dockerfile の現在の命令順から考えると、ビルダーはもう一度 Go モジュールをダウンロードしなければなりません。
前回のビルドから、そのパッケージが何も変わっていないにも関わらずです。
@z

@x
## Update the instruction order
@y
## 命令順の更新 {#update-the-instruction-order}
@z

@x
You can avoid this redundancy by reordering the instructions in the Dockerfile.
Change the order of the instructions so that downloading and installing dependencies
occur before the source code is copied over to the container. In that way, the
builder can reuse the "dependencies" layer from the cache, even when you
make changes to your source code.
@y
この無駄な処理は Dockerfile の命令を並び替えることで解消できます。
命令の順序を変えて、コンテナーへのソースコードのコピーよりも前に、依存パッケージのダウンロードとインストールを行うようにします。
こうすることでビルダーは "依存パッケージ" レイヤーをキャッシュから再利用してくれます。
ソースコードを変更したとしてもこれは変わりません。
@z

@x
Go uses two files, called `go.mod` and `go.sum`, to track dependencies for a project.
These files are to Go, what `package.json` and `package-lock.json` are to JavaScript.
For Go to know which dependencies to download, you need to copy the `go.mod` and
`go.sum` files to the container. Add another `COPY` instruction before
`RUN go mod download`, this time copying only the `go.mod` and `go.sum` files.
@y
Go においては 2 つのファイル `go.mod` と `go.sum` というものを用いて、プロジェクトに必要な依存パッケージを追跡します。
こういうファイルは Go 向けのものであり、 JavaScript であれば `package.json` や `package-lock.json` となります。
Go においてはダウンロードするべき依存パッケージを指示するものとなるので `go.mod` と `go.sum` ファイルはコンテナーへコピーする必要があります。
そこで `RUN go mod download` よりも前の `COPY` コマンドは別のものに置き換えます。
ここでは `go.mod` と `go.sum` というファイルをコピーするだけとします。
@z

% snip diff...

@x
Now if you edit your source code, building the image won't cause the
builder to download the dependencies each time. The `COPY . .` instruction
appears after the package management instructions, so the builder can reuse the
`RUN go mod download` layer.
@y
上のようにしたので、ソースコードを編集したとしても、ビルド処理にあたってビルダーが毎回依存パッケージのダウンロードを行うようなことはなくなります。
`COPY . .` 命令があるのはパッケージを取り扱う命令の後ろなので、ビルダーは `RUN go mod download` レイヤーを再利用できるということです。
@z

@x
![Reordered](./images/reordered-layers.png)
@y
![命令順の変更](./images/reordered-layers.png)
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
Ordering your Dockerfile instructions appropriately helps you avoid unnecessary
work at build time.
@y
Dockerfile 命令の順番を適切にしておけば、ビルド時に不要な処理を避けることができます。
@z

@x
Related information:
@y
関連情報
@z

@x
- [Docker build cache](../cache/_index.md)
- [Dockerfile best practices](../../build/building/best-practices.md)
@y
- [Docker build cache](../cache/_index.md)
- [Dockerfile ベストプラクティス](../../build/building/best-practices.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
The next section shows how you can make the build run faster, and make the
resulting output smaller, using multi-stage builds.
@y
次の節ではマルチステージビルドを行うことによって、ビルド処理をいかに早くするのか、出力結果をいかに小さくするのかについて示します。
@z

@x
{{< button text="Multi-stage" url="multi-stage.md" >}}
@y
{{< button text="マルチステージ" url="multi-stage.md" >}}
@z
