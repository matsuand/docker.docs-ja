%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network connect
short: Connect a container to a network
long: |-
    Connects a container to a network. You can connect a container by name
    or by ID. Once connected, the container can communicate with other containers in
    the same network.
usage: docker network connect [OPTIONS] NETWORK CONTAINER
@y
command: docker network connect
short: コンテナーをネットワークに接続します。
long: |-
    コンテナーをネットワークに接続します。
    接続にあたってはコンテナーの名前または ID を指定することができます。
    接続が行われると、同一ネットワーク内であれば他のコンテナーと互いに通信することができます。
usage: docker network connect [OPTIONS] NETWORK CONTAINER
@z

% options:

@x alias
      description: Add network-scoped alias for the container
@y
      description: コンテナーに対してネットワーク限定のエイリアスを追加します。
@z

@x driver-opt
      description: driver options for the network
@y
      description: ネットワークドライバーのオプション。
@z

@x ip
      description: IPv4 address (e.g., `172.30.100.104`)
@y
      description: IPv4 アドレスを指定します。（たとえば `172.30.100.104` など）
@z

@x ip6
      description: IPv6 address (e.g., `2001:db8::33`)
@y
      description: IPv6 アドレスを指定します。（たとえば `2001:db8::33` など）
@z

@x link
      description: Add link to another container
@y
      description: 別コンテナーへのリンクを追加します。
@z

@x link-local-ip
      description: Add a link-local address for the container
@y
      description: コンテナーに対してリンクローカルアドレスを追加します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Connect a running container to a network
@y
examples: |-
    ### 実行中コンテナーのネットワークへの接続 {#connect-a-running-container-to-a-network}
@z

% snip command...

@x
    ### Connect a container to a network when it starts
@y
    ### コンテナー起動時のネットワークへの接続 {#connect-a-container-to-a-network-when-it-starts}
@z

@x
    You can also use the `docker run --network=<network-name>` option to start a
    container and immediately connect it to a network.
@y
    `docker run --network=<network-name>` のようにオプションをつけてコンテナーを起動すれば、起動直後にネットワークに接続することもできます。
@z

% snip command...

@x
    ### Specify the IP address a container will use on a given network (--ip) {#ip}
@y
    ### ネットワーク内で利用する IP アドレスの指定 (--ip) {#ip}
@z

@x
    You can specify the IP address you want to be assigned to the container's interface.
@y
    コンテナーのインターフェースに割り振りたい IP アドレスを指定することができます。
@z

% snip command...

@x
    ### Use the legacy `--link` option (--link) {#link}
@y
    ### かつての `--link` オプションの利用 (--link) {#link}
@z

@x
    You can use `--link` option to link another container with a preferred alias.
@y
    `--link` オプションを使って、エイリアスを指定して別のコンテナーをリンクすることができます。
@z

% snip command...

@x
    ### Create a network alias for a container (--alias) {#alias}
@y
    ### コンテナーに対するネットワークエイリアスの生成 (--alias) {#alias}
@z

@x
    `--alias` option can be used to resolve the container by another name in the network
    being connected to.
@y
    `--alias` オプションは、コンテナーがネットワークに接続する際に、別名による接続を可能とするものです。
@z

% snip command...

@x
    ### Set sysctls for a container's interface (--driver-opt) {#sysctl}
@y
    ### コンテナーのインターフェースへの sysctl 設定 (--driver-opt) {#sysctl}
@z

@x
    `sysctl` settings that start with `net.ipv4.` and `net.ipv6.` can be set per-interface
    using `--driver-opt` label `com.docker.network.endpoint.sysctls`. The name of the
    interface must be replaced by `IFNAME`.
@y
    各インターフェースに対しては `--driver-opt` のラベル `com.docker.network.endpoint.sysctls` を用いることで、`net.ipv4.` や `net.ipv6.` によってはじまる `sysctl` を設定することができます。
    インタフェース名は `IFNAME` と書く必要があります。
@z

@x
    To set more than one `sysctl` for an interface, quote the whole value of the
    `driver-opt` field, remembering to escape the quotes for the shell if necessary.
    For example, if the interface to `my-net` is given name `eth3`, the following example
    sets `net.ipv4.conf.eth3.log_martians=1` and `net.ipv4.conf.eth3.forwarding=0`.
@y
    インターフェースとして複数の `sysctl` を設定する場合は `driver-opt` の全項目をクォートでくくります。
    その場合にクォートはエスケープすることが必要になります。
    たとえばインターフェース `my-net` に対して `eth3` という名前が与えられているとした場合、以下の例は `net.ipv4.conf.eth3.log_martians=1`、`net.ipv4.conf.eth3.forwarding=0` を設定するものとなります。
@z

% snip command...

@x
    > [!NOTE]
    > Network drivers may restrict the sysctl settings that can be modified and, to protect
    > the operation of the network, new restrictions may be added in the future.
@y
    > [!NOTE]
    > ネットワークドライバーによっては sysctl 設定の変更を制限している場合があります。
    > さらにネットワーク操作を禁止するような新たな制限が将来加えられるかもしれません。
@z

@x
    ### Network implications of stopping, pausing, or restarting containers
@y
    ### コンテナーの停止、一時停止、再起動に伴うネットワークへの影響 {#network-implications-of-stopping-pausing-or-restarting-containers}
@z

@x
    You can pause, restart, and stop containers that are connected to a network.
    A container connects to its configured networks when it runs.
@y
    ネットワークに接続しているコンテナーの一時停止、再起動、停止を行うことができます。
    コンテナーの起動時には、設定されているネットワークへの接続を行います。
@z

@x
    If specified, the container's IP address(es) is reapplied when a stopped
    container is restarted. If the IP address is no longer available, the container
    fails to start. One way to guarantee that the IP address is available is
    to specify an `--ip-range` when creating the network, and choose the static IP
    address(es) from outside that range. This ensures that the IP address is not
    given to another container while this container is not on the network.
@y
    コンテナーに IP アドレスが指定されている場合、停止コンテナーが再起動する際には、IP アドレスが再割り当てされます。
    その IP アドレスが利用できない場合、コンテナーは起動に失敗します。
    IP アドレスの取得を確実にするために、ネットワーク生成時に `--ip-range` を指定する方法があります。
    そしてコンテナーの IP アドレスには、そこで指定した IP アドレスの範囲外にある固定 IP アドレスを選ぶようにします。
    こうすれば、コンテナーがネットワークに接続していない間に、その IP アドレスが他のコンテナーによって利用されることがなくなります。
@z

% snip command...

@x
    To verify the container is connected, use the `docker network inspect` command.
    Use `docker network disconnect` to remove a container from the network.
@y
    コンテナーに接続できることを確認するには `docker network inspect` コマンドを使います。
    `docker network disconnect` を実行すれば、ネットワークからコンテナーを削除できます。
@z

@x
    Once connected in network, containers can communicate using only another
    container's IP address or name. For `overlay` networks or custom plugins that
    support multi-host connectivity, containers connected to the same multi-host
    network but launched from different Engines can also communicate in this way.
@y
    ネットワークに接続されると、コンテナー間のやりとりは、コンテナーの IP アドレスまたはコンテナー名を使って行われます。
    `overlay` ネットワークやカスタムプラグインを使ったマルチホスト接続に対応している場合、コンテナーがマルチホスト対応ネットワークに接続し、かつ異なる Engine から起動されたものであっても、そのようなやりとりを通じてコンテナー間の通信が可能です。
@z

@x
    You can connect a container to one or more networks. The networks need not be
    the same type. For example, you can connect a single container bridge and overlay
    networks.
@y
    1 つのコンテナーは複数のネットワークに接続することができます。
    その場合のネットワークは同一タイプである必要はありません。
    たとえば 1 つのコンテナーを、bridge と overlay のネットワークに接続することができます。
@z

% snip directives...
