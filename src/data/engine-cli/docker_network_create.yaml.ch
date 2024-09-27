%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker network create
short: Create a network
long: |-
    Creates a new network. The `DRIVER` accepts `bridge` or `overlay` which are the
    built-in network drivers. If you have installed a third party or your own custom
    network driver you can specify that `DRIVER` here also. If you don't specify the
    `--driver` option, the command automatically creates a `bridge` network for you.
    When you install Docker Engine it creates a `bridge` network automatically. This
    network corresponds to the `docker0` bridge that Docker Engine has traditionally relied
    on. When you launch a new container with  `docker run` it automatically connects to
    this bridge network. You cannot remove this default bridge network, but you can
    create new ones using the `network create` command.
@y
command: docker network create
short: ネットワークを生成します。
long: |-
    新たなネットワークを生成します。
    `DRIVER` にはビルトインネットワークドライバーである `bridge` か `overlay` を指定します。
    サードパーティ製のドライバーをインストールしているか、独自のカスタムネットワークドライバーを利用する場合は、この `DRIVER` に設定します。
    `--driver` オプションを指定しなかった場合、このコマンドが `bridge` ネットワークを自動的に生成します。
    Docker Engine をインストールすれば `bridge` ネットワークは自動生成されています。
    このネットワークは `docker0` ブリッジに対応するものであり、Docker Engine が従来より利用しているものです。
    `docker run` によって新たなコンテナーを起動すると、自動的にこのブリッジネットワークに接続されます。
    このデフォルトのブリッジネットワークは削除することはできません。
    新たなネットワークは `network create` コマンドを使って生成することができます。
@z

% snip command...

@x
    Bridge networks are isolated networks on a single Docker Engine installation. If you
    want to create a network that spans multiple Docker hosts each running Docker
    Engine, you must enable Swarm mode, and create an `overlay` network. To read more
    about overlay networks with Swarm mode, see ["*use overlay networks*"](/network/overlay/).
@y
    ブリッジネットワークは、インストールされている 1 つの Docker Engine 上において分離されているネットワークです。
    複数の Docker Engine 上において稼動している複数の Docker ホストにわたるようなネットワークを生成したいのであれば、swarm モードを有効にして `overlay` ネットワークを生成することが必要です。
    swarm モードにおいてオーバーレイネットワークを利用する詳細については ["*オーバーレイネットワークの利用*"](__SUBDIR__/network/overlay/) を参照してください。
@z

@x
    Once you have enabled swarm mode, you can create a swarm-scoped overlay network:
@y
    swarm モードを有効化したら swarm 内でのオーバーレイネットワークを生成します。
@z

% snip command...

@x
    By default, swarm-scoped networks do not allow manually started containers to
    be attached. This restriction is added to prevent someone that has access to
    a non-manager node in the swarm cluster from running a container that is able
    to access the network stack of a swarm service.
@y
    By default, swarm-scoped networks do not allow manually started containers to
    be attached. This restriction is added to prevent someone that has access to
    a non-manager node in the swarm cluster from running a container that is able
    to access the network stack of a swarm service.
@z

@x
    The `--attachable` option used in the example above disables this restriction,
    and allows for both swarm services and manually started containers to attach to
    the overlay network.
@y
    The `--attachable` option used in the example above disables this restriction,
    and allows for both swarm services and manually started containers to attach to
    the overlay network.
@z

@x
    Network names must be unique. The Docker daemon attempts to identify naming
    conflicts but this is not guaranteed. It is the user's responsibility to avoid
    name conflicts.
@y
    ネットワーク名はユニークでなければなりません。
    Docker デーモンは名前の衝突がないかどうかの検出を試みますが、この処理は保証されていません。
    ネットワーク名に衝突がないようにするのはユーザーの責任です。
@z

@x
    ### Overlay network limitations
@y
    ### オーバーレイネットワークの制約 {#overlay-network-limitations}
@z

@x
    You should create overlay networks with `/24` blocks (the default), which limits
    you to 256 IP addresses, when you create networks using the default VIP-based
    endpoint-mode. This recommendation addresses
    [limitations with swarm mode](https://github.com/moby/moby/issues/30820). If you
    need more than 256 IP addresses, do not increase the IP block size. You can
    either use `dnsrr` endpoint mode with an external load balancer, or use multiple
    smaller overlay networks. See
    [Configure service discovery](/engine/swarm/networking/#configure-service-discovery)
    for more information about different endpoint modes.
@y
    オーバーレイネットワークは `/24` ブロック（これがデフォルト）のネットワークとして生成する必要があります。
    デフォルトの VIP ベースのエンドポイントモードにおいてネットワークを生成する限り、利用可能な IP アドレスは 256 個までという制限が発生します。
    この推奨事項に関しては [limitations with swarm mode（Swarm モードにおける制約）](https://github.com/moby/moby/issues/30820) に述べられています。
    IP アドレスを 256 個より多く必要とする場合、ブロックサイズを増やすことはやめてください。
    その場合は、外部ロードバランサーにより `dnsrr` エンドポイントモードを利用するか、あるいは、より小さな overlay ネットワークを複数利用するようにします。
    さまざまなエンドポイントモードに関する詳細は [サービスディスカバリーの設定](__SUBDIR__/engine/swarm/networking/#configure-service-discovery) を参照してください。
@z

@x
usage: docker network create [OPTIONS] NETWORK
@y
usage: docker network create [OPTIONS] NETWORK
@z

% options:

@x attachable
      description: Enable manual container attachment
@y
      description: 手動によるコンテナーのアタッチを有効にします。
@z

@x aux-address
      description: Auxiliary IPv4 or IPv6 addresses used by Network driver
@y
      description: ネットワークドライバーが利用する IPv4 または IPv6 による補助アドレス。
@z

@x config-from
      description: The network from which to copy the configuration
@y
      description: 設定のコピー元とするネットワーク。
@z

@x config-only
      description: Create a configuration only network
@y
      description: ネットワークについてのみ設定を生成します。
@z

@x driver
      description: Driver to manage the Network
@y
      description: ネットワークを管理するドライバー。
@z

@x gateway
      description: IPv4 or IPv6 Gateway for the master subnet
@y
      description: マスターサブネット用の IPv4 または IPv6 ゲートウェイ。
@z

@x ingress
      description: Create swarm routing-mesh network
@y
      description: Swarm のルーティングメッシュネットワークを生成します。
@z

@x internal
      description: Restrict external access to the network
@y
      description: ネットワークへの外部アクセスを制限します。
@z

@x ip-range
      description: Allocate container ip from a sub-range
@y
      description: IP の部分的な範囲からコンテナー IP を割り当てます。
@z

@x ipam-driver
      description: IP Address Management Driver
@y
      description: IP アドレス管理ドライバー。
@z

@x ipam-opt
      description: Set IPAM driver specific options
@y
      description: IPAM ドライバーの特定オプションを設定します。
@z

@x ipv6
      description: Enable or disable IPv6 networking
@y
      description: IPv6 ネットワークを有効または無効にします。
@z

@x label
      description: Set metadata on a network
@y
      description: ネットワークに対してメタデータを設定します。
@z

@x opt
      description: Set driver specific options
@y
      description: ドライバー固有のオプションを設定します。
@z

@x scope
      description: Control the network's scope
@y
      description: ネットワークのスコープを制御します。
@z

@x subnet
      description: Subnet in CIDR format that represents a network segment
@y
      description: ネットワークセグメントを表わす CIDR 形式によるサブネット。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Connect containers
@y
examples: |-
    ### コンテナーの接続 {#connect-containers}
@z

@x
    When you start a container, use the `--network` flag to connect it to a network.
    This example adds the `busybox` container to the `mynet` network:
@y
    コンテナーを起動する際には `--network` フラグを使ってネットワークに接続します。
    以下の例は `busybox` コンテナーを `mynet` ネットワークに接続します。
@z

% snip command...

@x
    If you want to add a container to a network after the container is already
    running, use the `docker network connect` subcommand.
@y
    コンテナー起動後に、そのコンテナーをネットワークに加える場合は、サブコマンド `docker network connect` を使います。
@z

@x
    You can connect multiple containers to the same network. Once connected, the
    containers can communicate using only another container's IP address or name.
    For `overlay` networks or custom plugins that support multi-host connectivity,
    containers connected to the same multi-host network but launched from different
    daemons can also communicate in this way.
@y
    ネットワークに接続されると、コンテナー間のやりとりはコンテナーの IP アドレスまたはコンテナー名を使って行われます。
    `overlay` ネットワークやカスタムプラグインを使ったマルチホスト接続に対応している場合、コンテナーがマルチホスト対応ネットワークに接続し、かつ異なるデーモンから起動されたものであっても、そのようなやりとりを通じてコンテナー間の通信が可能です。
@z

@x
    You can disconnect a container from a network using the `docker network
    disconnect` command.
@y
    ネットワークからコンテナーを切断するには `docker network disconnect` コマンドを使います。
@z

@x
    ### Specify advanced options
@y
    ### 高度なオプションの設定 {#specify-advanced-options}
@z

@x
    When you create a network, Docker Engine creates a non-overlapping subnetwork
    for the network by default. This subnetwork is not a subdivision of an existing
    network. It is purely for ip-addressing purposes. You can override this default
    and specify subnetwork values directly using the `--subnet` option. On a
    `bridge` network you can only create a single subnet:
@y
    ネットワーク生成時に Docker Engine はデフォルトではサブネットワークが重複しないようにします。
    このサブネットワークは、既存のネットワークを分割したものではありません。
    純粋に IP アドレスのためにあります。
    このデフォルト設定はオーバーライドすることが可能であり、サブネットワークの値を直接 `--subnet` オプションに指定します。
    `bridge` ネットワークにおいては、単一のサブネットしか生成することはできません。
@z

% snip command...

@x
    Additionally, you also specify the `--gateway` `--ip-range` and `--aux-address`
    options.
@y
    また `--gateway`、`--ip-range`、`--aux-address` といったオプションを指定することもできます。
@z

% snip command...

@x
    If you omit the `--gateway` flag, Docker Engine selects one for you from inside
    a preferred pool. For `overlay` networks and for network driver plugins that
    support it you can create multiple subnetworks. This example uses two `/25`
    subnet mask to adhere to the current guidance of not having more than 256 IPs in
    a single overlay network. Each of the subnetworks has 126 usable addresses.
@y
    `--gateway` フラグを省略すると、Docker Engine は適切なアドレスプールからアドレスを選び出します。
    `overlay` ネットワークやネットワークドライバープラグインでは、複数のサブネットワークを生成することができます。
    以下の例では 2 つの `/25` サブネットマスクを利用して、単一のオーバーレイネットワーク内において IP アドレスが 256 個以上にならないように、現在のガイダンスに従っているものです。
    各サブネットワークでは 126 個のアドレスが利用可能です。
@z

% snip command...

@x
    Be sure that your subnetworks do not overlap. If they do, the network create
    fails and Docker Engine returns an error.
@y
    サブネットワークは重複しないように注意してください。
    重複してしまうとネットワーク生成に失敗し、Docker Engine がエラーを返します。
@z

@x
    ### Bridge driver options
@y
    ### ブリッジドライバーオプション {#bridge-driver-options}
@z

@x
    When creating a custom network, the default network driver (i.e. `bridge`) has
    additional options that can be passed. The following are those options and the
    equivalent Docker daemon flags used for docker0 bridge:
@y
    カスタムネットワークを生成すると、デフォルトのネットワークドライバー（つまり `bridge`）には、指定可能なオプションが追加されます。
    以下に示すのがその追加オプションであり、docker0 ブリッジに対して用いられる同等の Docker デーモンフラグを合わせて示します。
@z

@x
    | Option                                           | Equivalent  | Description                                           |
    |--------------------------------------------------|-------------|-------------------------------------------------------|
    | `com.docker.network.bridge.name`                 | -           | Bridge name to be used when creating the Linux bridge |
    | `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` | Enable IP masquerading                                |
    | `com.docker.network.bridge.enable_icc`           | `--icc`     | Enable or Disable Inter Container Connectivity        |
    | `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      | Default IP when binding container ports               |
    | `com.docker.network.driver.mtu`                  | `--mtu`     | Set the containers network MTU                        |
    | `com.docker.network.container_iface_prefix`      | -           | Set a custom prefix for container interfaces          |
@y
    | オプション                                       | 同等の指定  | 内容説明                                              |
    |--------------------------------------------------|-------------|-------------------------------------------------------|
    | `com.docker.network.bridge.name`                 | -           | Bridge name to be used when creating the Linux bridge |
    | `com.docker.network.bridge.enable_ip_masquerade` | `--ip-masq` | Enable IP masquerading                                |
    | `com.docker.network.bridge.enable_icc`           | `--icc`     | Enable or Disable Inter Container Connectivity        |
    | `com.docker.network.bridge.host_binding_ipv4`    | `--ip`      | Default IP when binding container ports               |
    | `com.docker.network.driver.mtu`                  | `--mtu`     | Set the containers network MTU                        |
    | `com.docker.network.container_iface_prefix`      | -           | Set a custom prefix for container interfaces          |
@z

@x
    The following arguments can be passed to `docker network create` for any
    network driver, again with their approximate equivalents to Docker daemon
    flags used for the docker0 bridge:
@y
    The following arguments can be passed to `docker network create` for any
    network driver, again with their approximate equivalents to Docker daemon
    flags used for the docker0 bridge:
@z

@x
    | Argument     | Equivalent     | Description                                |
    |--------------|----------------|--------------------------------------------|
    | `--gateway`  | -              | IPv4 or IPv6 Gateway for the master subnet |
    | `--ip-range` | `--fixed-cidr` | Allocate IPs from a range                  |
    | `--internal` | -              | Restrict external access to the network    |
    | `--ipv6`     | `--ipv6`       | Enable or disable IPv6 networking          |
    | `--subnet`   | `--bip`        | Subnet for network                         |
@y
    | 引数         | 同等の指定     | 内容説明                                   |
    |--------------|----------------|--------------------------------------------|
    | `--gateway`  | -              | IPv4 or IPv6 Gateway for the master subnet |
    | `--ip-range` | `--fixed-cidr` | Allocate IPs from a range                  |
    | `--internal` | -              | Restrict external access to the network    |
    | `--ipv6`     | `--ipv6`       | Enable or disable IPv6 networking          |
    | `--subnet`   | `--bip`        | Subnet for network                         |
@z

@x
    For example, let's use `-o` or `--opt` options to specify an IP address binding
    when publishing ports:
@y
    たとえばポート公開のために割り当てる IP アドレスを指定するには `-o` または `--opt` オプションを使ってください。
@z

% snip command...

@x
    ### Network internal mode (--internal) {#internal}
@y
    ### ネットワーク内部モード (--internal) {#internal}
@z

@x
    Containers on an internal network may communicate between each other, but not
    with any other network, as no default route is configured and firewall rules
    are set up to drop all traffic to or from other networks. Communication with
    the gateway IP  address (and thus appropriately configured host services) is
    possible, and the host may communicate with any container IP directly.
@y
    Containers on an internal network may communicate between each other, but not
    with any other network, as no default route is configured and firewall rules
    are set up to drop all traffic to or from other networks. Communication with
    the gateway IP  address (and thus appropriately configured host services) is
    possible, and the host may communicate with any container IP directly.
@z

@x
    By default, when you connect a container to an `overlay` network, Docker also
    connects a bridge network to it to provide external connectivity. If you want
    to create an externally isolated `overlay` network, you can specify the
    `--internal` option.
@y
    コンテナーを `overlay` ネットワークに接続する際に、デフォルトで Docker は外部接続を可能にするために bridge ネットワークにも接続します。
    外部とは切り離された `overlay` ネットワークを生成したい場合は `--internal` オプションを指定します。
@z

@x
    ### Network ingress mode (--ingress) {#ingress}
@y
    ### ネットワーク ingress モード (--ingress) {#ingress}
@z

@x
    You can create the network which will be used to provide the routing-mesh in the
    swarm cluster. You do so by specifying `--ingress` when creating the network. Only
    one ingress network can be created at the time. The network can be removed only
    if no services depend on it. Any option available when creating an overlay network
    is also available when creating the ingress network, besides the `--attachable` option.
@y
    Swarm クラスター内においてルーティングメッシュを提供するためのネットワークを生成することができます。
    これを行うにはネットワーク生成時に `--ingress` を指定します。
    一度に生成できる ingress ネットワークはただ一つです。
    ネットワークは、どのサービスもそのネットワークに依存していない場合に限って削除することができます。
    overlay ネットワークの生成時に利用可能なオプションは、同じく ingress ネットワーク生成時にも利用可能です。
    ただし `--attachable` オプションは ingress ネットワークでは利用できません。
@z

% snip command...

@x
    ### Run services on predefined networks
@y
    ### Run services on predefined networks
@z

@x
    You can create services on the predefined Docker networks `bridge` and `host`.
@y
    You can create services on the predefined Docker networks `bridge` and `host`.
@z

% snip command...

@x
    ### Swarm networks with local scope drivers
@y
    ### Swarm networks with local scope drivers
@z

@x
    You can create a swarm network with local scope network drivers. You do so
    by promoting the network scope to `swarm` during the creation of the network.
    You will then be able to use this network when creating services.
@y
    You can create a swarm network with local scope network drivers. You do so
    by promoting the network scope to `swarm` during the creation of the network.
    You will then be able to use this network when creating services.
@z

% snip command...

@x
    For network drivers which provide connectivity across hosts (ex. macvlan), if
    node specific configurations are needed in order to plumb the network on each
    host, you will supply that configuration via a configuration only network.
    When you create the swarm scoped network, you will then specify the name of the
    network which contains the configuration.
@y
    For network drivers which provide connectivity across hosts (ex. macvlan), if
    node specific configurations are needed in order to plumb the network on each
    host, you will supply that configuration via a configuration only network.
    When you create the swarm scoped network, you will then specify the name of the
    network which contains the configuration.
@z

% snip command...
% snip directives...
