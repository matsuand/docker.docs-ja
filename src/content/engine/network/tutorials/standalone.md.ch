%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Networking with standalone containers
description: Tutorials for networking with standalone containers
keywords: networking, bridge, routing, ports, overlay
@y
title: スタンドアロンなコンテナーのネットワーク
description: Tutorials for networking with standalone containers
keywords: networking, bridge, routing, ports, overlay
@z

@x
This series of tutorials deals with networking for standalone Docker containers.
For networking with swarm services, see
[Networking with swarm services](/engine/network/tutorials/overlay.md). If you need to
learn more about Docker networking in general, see the [overview](_index.md).
@y
ここに示すチュートリアルは、スタンドアロンの Docker コンテナーに対するネットワークを扱います。
Swarm サービスにおけるネットワークについては [Swarm サービスにおけるネットワーク](engine/network/tutorials/overlay.md) を参照してください。
Docker ネットワークの全般的なことを確認したい場合は、[ネットワーク概要](_index.md) を参照してください。
@z

@x
This topic includes two different tutorials. You can run each of them on
Linux, Windows, or a Mac, but for the last one, you need a second Docker
host running elsewhere.
@y
このトピックには 2 つのチュートリアルがあります。
それぞれは Linux、Windows、Mac 上において実行することができます。
ただし Mac の場合は、2 つめの Docker ホストをどこか別に用意することが必要になります。
@z

@x
- [Use the default bridge network](#use-the-default-bridge-network) demonstrates
  how to use the default `bridge` network that Docker sets up for you
  automatically. This network is not the best choice for production systems.
@y
- [デフォルトのブリッジネットワーク利用](#use-the-default-bridge-network) では、Docker が自動的に設定するデフォルトの `bridge` ネットワークの利用方法を示します。
  このネットワークは、本番環境向けには適していません。
@z

@x
- [Use user-defined bridge networks](#use-user-defined-bridge-networks) shows
  how to create and use your own custom bridge networks, to connect containers
  running on the same Docker host. This is recommended for standalone containers
  running in production.
@y
- [ユーザー定義のブリッジネットワーク利用](#use-user-defined-bridge-networks) では、独自にブリッジネットワークを生成して、同一の Docker ホスト上で稼動する複数コンテナーに接続して利用する方法を示します。
  本番環境においてスタンドアロンコンテナーを稼動させる場合には、この方法が推奨されます。
@z

@x
Although [overlay networks](/engine/network/drivers/overlay.md) are generally used for swarm services,
you can also use an overlay network for standalone containers. That's covered as
part of the [tutorial on using overlay networks](/engine/network/tutorials/overlay.md#use-an-overlay-network-for-standalone-containers).
@y
Swarm サービスにおいて利用されるのは、一般的には [オーバーレイネットワーク](engine/network/drivers/overlay.md) です。
このオーバーレイネットワークは、スタンドアロンコンテナーに対しても利用することができます。
このことは [オーバーレイネットワークのチュートリアル](engine/network/tutorials/overlay.md#use-an-overlay-network-for-standalone-containers) において触れています。
@z

@x
## Use the default bridge network
@y
## デフォルトのブリッジネットワーク利用 {#use-the-default-bridge-network}
@z

@x
In this example, you start two different `alpine` containers on the same Docker
host and do some tests to understand how they communicate with each other. You
need to have Docker installed and running.
@y
以下の例では、2 つの`alpine`コンテナーを同じ Docker ホスト上に稼動させます。
そしてテストを行ってみて、コンテナー同士がどのようにやりとりを行うかを見ていきます。
Docker がインストール済みであり、起動していることを確認してください。
@z

@x
1.  Open a terminal window. List current networks before you do anything else.
    Here's what you should see if you've never added a network or initialized a
    swarm on this Docker daemon. You may see different networks, but you should
    at least see these (the network IDs will be different):
@y
1.  ターミナル画面を開きます。
    まず初めに、現在のネットワーク一覧を確認しておきます。
    ネットワークをまったく追加せず、Docker デーモン上において Swarm の初期化も行っていなければ、以下のような表示になるはずです。
    複数のネットワークが表示されるはずであり、最低で以下のものがあるはずです。
    （ネットワーク ID は異なります。）
@z

% snip command...

@x
    The default `bridge` network is listed, along with `host` and `none`. The
    latter two are not fully-fledged networks, but are used to start a container
    connected directly to the Docker daemon host's networking stack, or to start
    a container with no network devices. This tutorial will connect two
    containers to the `bridge` network.
@y
    デフォルトの `bridge` ネットワークが一覧に表示されます。
    これとともに `host` と `none` があります。
    この 2 つは完全なネットワークではありませんが、コンテナーを起動して Docker デーモンホストのネットワークに直接接続するために、あるいはネットワークデバイスのないコンテナーを起動するために必要となります。
    このチュートリアルでは、2 つのコンテナーを `bridge` ネットワークに接続します。
@z

@x
2.  Start two `alpine` containers running `ash`, which is Alpine's default shell
    rather than `bash`. The `-dit` flags mean to start the container detached
    (in the background), interactive (with the ability to type into it), and
    with a TTY (so you can see the input and output). Since you are starting it
    detached, you won't be connected to the container right away. Instead, the
    container's ID will be printed. Because you have not specified any
    `--network` flags, the containers connect to the default `bridge` network.
@y
2.  `alpine` コンテナーを 2 つ起動して `ash` を実行します。
    Alpine のデフォルトシェルが `bash` ではなく`ash`です。
    `-dit` フラグは、コンテナーをデタッチモードで（バックグラウンドで）実行し、対話を行い（入力を可能とし）、TTY を利用する（入出力が確認できる）ことを意味します。
    デタッチモードで起動するため、コンテナーに即座に接続されるわけではありません。
    その前にコンテナー ID が出力されます。
    `--network` フラグを何も指定しなかったので、コンテナーはデフォルトの `bridge` ネットワークに接続されます。
@z

% snip command...

@x
    Check that both containers are actually started:
@y
    2 つのコンテナーが実際に開始されたことを確認します。
@z

% snip command...

@x
3.  Inspect the `bridge` network to see what containers are connected to it.
@y
3.  `bridge` ネットワークを参照して、どのコンテナーがこれに接続しているかを確認します。
@z

% snip command...

@x
    Near the top, information about the `bridge` network is listed, including
    the IP address of the gateway between the Docker host and the `bridge`
    network (`172.17.0.1`). Under the `Containers` key, each connected container
    is listed, along with information about its IP address (`172.17.0.2` for
    `alpine1` and `172.17.0.3` for `alpine2`).
@y
    上の方に `bridge` ネットワークに関する情報が一覧表示されます。
    Docker ホストと `bridge` ネットワーク間のゲートウェイに対する IP アドレス（`172.17.0.1`）も表示されています。
    `Containers` キーの配下に、接続されているコンテナーがそれぞれ表示されています。
    そこには IP アドレスの情報もあります（`alpine1` が `172.17.0.2`、`alpine2` が `172.17.0.3` となっています）。
@z

@x
4.  The containers are running in the background. Use the `docker attach`
    command to connect to `alpine1`.
@y
4.  コンテナーはバックグラウンドで実行しています。
    `docker attach` コマンドを使って `alpine1` に接続してみます。
@z

% snip command...

@x
    The prompt changes to `#` to indicate that you are the `root` user within
    the container. Use the `ip addr show` command to show the network interfaces
    for `alpine1` as they look from within the container:
@y
    プロンプトが `#` に変わりました。
    これはコンテナー内の `root` ユーザーであることを意味します。
    `ip addr show` コマンドを使って、コンテナー内部から `alpine1` のネットワークインターフェースを見てみます。
@z

% snip command...

@x
    The first interface is the loopback device. Ignore it for now. Notice that
    the second interface has the IP address `172.17.0.2`, which is the same
    address shown for `alpine1` in the previous step.
@y
    1 つめのインターフェースはループバックデバイスです。
    今はこれを無視します。
    2 つめのインターフェースの IP アドレスは `172.17.0.2` となっています。
    前の手順で確認した `alpine1` のアドレスと同じです。
@z

@x
5.  From within `alpine1`, make sure you can connect to the internet by
    pinging `google.com`. The `-c 2` flag limits the command to two `ping`
    attempts.
@y
5.  `alpine1` の内部から `google.com` への ping を行ってインターネットに接続してみます。
    `-c 2` フラグにより 2 回だけ `ping` を行います。
@z

% snip command...

@x
6.  Now try to ping the second container. First, ping it by its IP address,
    `172.17.0.3`:
@y
6.  そこで 2 つめのコンテナーに対して ping してみます。
    最初は IP アドレス `172.17.0.3` を使って ping します。
@z

% snip command...

@x
    This succeeds. Next, try pinging the `alpine2` container by container
    name. This will fail.
@y
    成功しました。
    次に `alpine2` コンテナーに向けて、コンテナー名により ping をしてみます。
    これは失敗します。
@z

% snip command...

@x
7.  Detach from `alpine1` without stopping it by using the detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
    If you wish, attach to `alpine2` and repeat steps 4, 5, and 6 there,
    substituting `alpine1` for `alpine2`.
@y
7.  `alpine1` を停止させることなくデタッチします。
    これはデタッチを行うキー操作、つまり `CTRL`+`p`、`CTRL`+`q` により行います（`CTRL` を押したまま、`p` と `q` を順に押します）。
    この後 `alpine2` に対して同じことをするなら、手順の 4、5、6 をもう一度行います。
    `alpine1` のところは `alpine2` に変えて実施します。
@z

@x
8.  Stop and remove both containers.
@y
8.  2 つのコンテナーを停止させ削除します。
@z

% snip command...

@x
Remember, the default `bridge` network is not recommended for production. To
learn about user-defined bridge networks, continue to the
[next tutorial](#use-user-defined-bridge-networks).
@y
デフォルトの `bridge` ネットワークは、本番環境向けとしては推奨されない点を覚えておいてください。
ユーザー定義のブリッジネットワークについては、[次のチュートリアル](#use-user-defined-bridge-networks) に進んでください。
@z

@x
## Use user-defined bridge networks
@y
## ユーザー定義のブリッジネットワーク利用 {#use-user-defined-bridge-networks}
@z

@x
In this example, we again start two `alpine` containers, but attach them to a
user-defined network called `alpine-net` which we have already created. These
containers are not connected to the default `bridge` network at all. We then
start a third `alpine` container which is connected to the `bridge` network but
not connected to `alpine-net`, and a fourth `alpine` container which is
connected to both networks.
@y
以下の例では、すでに生成している 2 つの `alpine` コンテナーをもう一度使います。
ただしこれをアタッチするのは、`alpine-net` という名前のユーザー定義ネットワークです。
もうデフォルトの `bridge` ネットワークへの接続は行いません。
そして 3 つめの `alpine` コンテナーを用意します。
これは `bridge` ネットワークに接続させるものの `alpine-net` には接続しません。
さらに 4 つめの `alpine` コンテナーを、その両方のネットワークに接続するようにします。
@z

@x
1.  Create the `alpine-net` network. You do not need the `--driver bridge` flag
    since it's the default, but this example shows how to specify it.
@y
1.  `alpine-net` ネットワークを生成します。
    `--driver bridge` フラグは不要です。
    なぜならそれがデフォルトであるからです。
    ただし以下の例では、指定方法を示すために含めます。
@z

% snip command...

@x
2.  List Docker's networks:
@y
2.  Docker のネットワーク一覧を表示します。
@z

% snip command...

@x
    Inspect the `alpine-net` network. This shows you its IP address and the fact
    that no containers are connected to it:
@y
    `alpine-net` ネットワークを確認します。
    そこから IP アドレスがわかります。
    また接続されているコンテナーが 1 つもないことがわかります。
@z

% snip command...

@x
    Notice that this network's gateway is `172.18.0.1`, as opposed to the
    default bridge network, whose gateway is `172.17.0.1`. The exact IP address
    may be different on your system.
@y
    ネットワークのゲートウェイは `172.18.0.1` となっています。
    デフォルトのブリッジネットワークのときとは違っていて、その際には `172.17.0.1` でした。
    IP アドレスの実際はシステムによって異なります。
@z

@x
3.  Create your four containers. Notice the `--network` flags. You can only
    connect to one network during the `docker run` command, so you need to use
    `docker network connect` afterward to connect `alpine4` to the `bridge`
    network as well.
@y
3.  4 つのコンテナーを生成します。
    それぞれの `--network` フラグに注目してください。
    `docker run` コマンドの実行において、接続指定できるネットワークはただ 1 つです。
    したがって `alpine4` を `bridge` にも接続させるために、後から `docker network connect` を実行することが必要になります。
@z

% snip command...

@x
    Verify that all containers are running:
@y
    コンテナーすべてが実行していることを確認します。
@z

% snip command...

@x
4.  Inspect the `bridge` network and the `alpine-net` network again:
@y
4.  `bridge` ネットワークと `alpine-net` ネットワークを再度確認してみます。
@z

% snip command...

@x
    Containers `alpine3` and `alpine4` are connected to the `bridge` network.
@y
    `alpine3` と `alpine4` は `bridge` ネットワークに接続されています。
@z

% snip command...

@x
    Containers `alpine1`, `alpine2`, and `alpine4` are connected to the
    `alpine-net` network.
@y
    `alpine1`、`alpine2`、`alpine4` は `alpine-net` ネットワークに接続されています。
@z

@x
5.  On user-defined networks like `alpine-net`, containers can not only
    communicate by IP address, but can also resolve a container name to an IP
    address. This capability is called automatic service discovery. Let's
    connect to `alpine1` and test this out. `alpine1` should be able to resolve
    `alpine2` and `alpine4` (and `alpine1`, itself) to IP addresses.
@y
5.  `alpine-net` のようなユーザー定義ネットワークでは、IP アドレスによる通信が可能です。
    さらにコンテナー名から IP アドレスを解決することもできます。
    この機能のことを自動サービス検出 (automatic service discovery) と呼びます。
    では `alpine1` に接続して、いろいろテストしてみます。
    `alpine1` は `alpine2` と `alpine4`（そして `alpine1` そのもの）の IP アドレスが解決できなければなりません。
@z

@x
    > [!NOTE]
    > 
    > Automatic service discovery can only resolve custom container names, not default automatically generated container names,
@y
    > [!メモ]
    > 
    > 自動サービス検出 (automatic service discovery) によって解決される名前は、カスタム指定した名前のみであって、デフォルトで自動的に生成されたコンテナー名に対しては行われません。
@z

% snip command...

@x
6.  From `alpine1`, you should not be able to connect to `alpine3` at all, since
    it is not on the `alpine-net` network.
@y
6.  `alpine1` から `alpine3` へはまったく接続できないはずです。
    `alpine3` は `alpine-net` ネットワーク上にないからです。
@z

% snip command...

@x
    Not only that, but you can't connect to `alpine3` from `alpine1` by its IP
    address either. Look back at the `docker network inspect` output for the
    `bridge` network and find `alpine3`'s IP address: `172.17.0.2` Try to ping
    it.
@y
    それだけでなく `alpine1` から `alpine3` へは、IP アドレスを利用しても接続できません。
    `docker network inspect` を使った `bridge` ネットワークの確認時の出力結果をもう一度確認してください。
    `alpine3` の IP アドレスは `172.17.0.2` であったはずです。
    そこで ping を行ってみます。
@z

% snip command...

@x
    Detach from `alpine1` using detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
@y
    デタッチキー操作により `alpine1` をデタッチします。
    `CTRL`+`p`、`CTRL`+`q` を行います（`CTRL` を押したまま `p` と `q` を順に押します）。
@z

@x
7.  Remember that `alpine4` is connected to both the default `bridge` network
    and `alpine-net`. It should be able to reach all of the other containers.
    However, you will need to address `alpine3` by its IP address. Attach to it
    and run the tests.
@y
7.  `alpine4` は、デフォルトの `bridge` ネットワークと `alpine-net` ネットワークの両方に接続していました。
    このコンテナーは別のコンテナーすべてに接続できるはずです。
    ただしそれを行うには `alpine3` の IP アドレスを知っておく必要があります。
    そこで `alpine3` にアタッチして、いろいろ確認してみます。
@z

% snip command...

@x
8.  As a final test, make sure your containers can all connect to the internet
    by pinging `google.com`. You are already attached to `alpine4` so start by
    trying from there. Next, detach from `alpine4` and connect to `alpine3`
    (which is only attached to the `bridge` network) and try again. Finally,
    connect to `alpine1` (which is only connected to the `alpine-net` network)
    and try again.
@y
8.  確認の最後として、どのコンテナーもインターネットには接続できるはずですから、`google.com` への ping を行ってみます。
    `alpine4` はすでにアタッチしていますから、そこから始めます。
    そして `alpine4` のデタッチの後に `alpine3`（これは唯一 `bridge` ネットワークに接続しているものです）に接続して、同じことを確認します。
    最終的に（`alpine-net` ネットワークにのみ接続している）`alpine1` への接続と同様の確認まで進めます。
@z

% snip command...

@x
9.  Stop and remove all containers and the `alpine-net` network.
@y
9.  コンテナーすべてを停止し削除します。
    そして `alpine-net` ネットワークを削除します。
@z

% snip command...

@x
## Other networking tutorials
@y
## その他のネットワークチュートリアル {#other-networking-tutorials}
@z

@x
- [Host networking tutorial](/engine/network/tutorials/host.md)
- [Overlay networking tutorial](/engine/network/tutorials/overlay.md)
- [Macvlan networking tutorial](/engine/network/tutorials/macvlan.md)
@y
- [ホストネットワークのチュートリアル](engine/network/tutorials/host.md)
- [オーバーレイネットワークのチュートリアル](engine/network/tutorials/overlay.md)
- [Macvlan ネットワークのチュートリアル](engine/network/tutorials/macvlan.md)
@z
