%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
linkTitle: Networks
title: Define and manage networks in Docker Compose
description: Learn how to configure and control networks using the top-level networks element in Docker Compose.
keywords: compose, compose specification, networks, compose file reference
@y
linkTitle: networks
title: Docker Compose でのネットワークの定義と管理
description: Learn how to configure and control networks using the top-level networks element in Docker Compose.
keywords: compose, compose specification, networks, compose file reference
@z

@x
{{% include "compose/networks.md" %}}
@y
{{% include "compose/networks.md" %}}
@z

@x
To use a network across multiple services, you must explicitly grant each service access by using the [networks](services.md) attribute within the `services` top-level element. The `networks` top-level element has additional syntax that provides more granular control.
@y
複数のサービス間において一つのネットワークを共有するためには、トップレベル要素 `services` 内にある [networks](services.md) 属性を使って明示的に各サービスからのアクセスを許可しなければなりません。
トップレベル要素 `networks` には追加の文法があって、より詳細な制御を行えるようになっています。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
### Basic example
@y
### 基本的な例 {#basic-example}
@z

@x
In the following example, at runtime, networks `front-tier` and `back-tier` are created and the `frontend` service
is connected to `front-tier` and `back-tier` networks.
@y
以下の例では実行時にネットワーク `front-tier` と `back-tier` が生成されて、`frontend` サービスが `front-tier` と `back-tier` の各ネットワークに接続されます。
@z

% snip code...

@x
### Advanced example
@y
### 応用的な例 {#advanced-example}
@z

% snip code...

@x within code
    # Specify driver options
@y
    # ドライバーオプションの指定
@z
@x
    # Use a custom driver
@y
    # カスタムドライバーの利用
@z

@x
This example shows a Compose file which defines two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common. Only `app` can talk to both.
@y
上の例では Compose ファイルにカスタムネットワークを二つ定義しています。
`proxy` サービスは `db` サービスとは分離されています。
なぜなら両者は共通するネットワークを一つも共有していないからです。
`app` のみが両者とのやり取りができます。
@z

@x
## The default network
@y
## デフォルトネットワーク {#the-default-network}
@z

@x
When a Compose file doesn't declare explicit networks, Compose uses an implicit `default` network. Services without an explicit [`networks`](services.md#networks) declaration are connected by Compose to this `default` network:
@y
Compose ファイルが明示的にネットワークを宣言していない場合、Compose は暗に `default` ネットワークを使います。
明示的な [`networks`](services.md#networks) 宣言のないサービスは Compose によってこの `default` ネットワークに接続されます。
@z

% snip code...

@x
This example is actually equivalent to:
@y
上の例は実際には以下と同じです。
@z

% snip code...

@x
You can customize the `default` network with an explicit declaration:
@y
`default` ネットワークは明示的な宣言を通じてカスタマイズが可能です。
@z

@x within code
    name: a_network # Use a custom name
    driver_opts:    # pass options to driver for network creation
@y
    name: a_network # カスタム名を利用
    driver_opts:    # ネットワーク生成のためドライバーに受け渡すオプション
@z

@x
For options, see the [Docker Engine docs](https://docs.docker.com/engine/network/drivers/bridge/#options).
@y
オプションに関しては [Docker Engine ドキュメント](https://docs.docker.com/engine/network/drivers/bridge/#options) を参照してください。
@z

@x
## Attributes
@y
## 属性 {#attributes}
@z

@x
### `attachable`
@y
### `attachable`
@z

@x
If `attachable` is set to `true`, then standalone containers should be able to attach to this network, in addition to services.
If a standalone container attaches to the network, it can communicate with services and other standalone containers
that are also attached to the network.
@y
`attachable` を `true` に設定すると、そのネットワークに対してスタンドアローンコンテナーおよびサービスが接続できるようになります。
スタンドアローンコンテナーがそのネットワークに接続すると、サービスや他のスタンドアローンコンテナーの間での通信が可能となります。
@z

% snip code...

@x
### `driver`
@y
### `driver`
@z

@x
`driver` specifies which driver should be used for this network. Compose returns an error if the
driver is not available on the platform.
@y
`driver` はそのネットワークが用いるドライバーを指定します。
ドライバーがプラットフォーム上で利用不能である場合には Compose がエラーを返します。
@z

% snip code...

@x
For more information on drivers and available options, see [Network drivers](/manuals/engine/network/drivers/_index.md).
@y
ドライバーやその指定可能オプションについての詳細は [ネットワークドライバー](manuals/engine/network/drivers/_index.md) を参照してください。
@z

@x
### `driver_opts`
@y
### `driver_opts`
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent.
@y
`driver_opts` はキーバリューペアによるオプションリストを指定するものであり、ドライバーにこれが受け渡されます。
オプションはドライバー固有のものを指定します。
@z

% snip code...

@x
Consult the [network drivers documentation](/manuals/engine/network/_index.md) for more information.
@y
詳しくは [ネットワークドライバーのドキュメント](manuals/engine/network/_index.md) を参照してください。
@z

@x
### `enable_ipv4`
@y
### `enable_ipv4`
@z

@x
{{< summary-bar feature_name="Compose enable ipv4" >}}
@y
{{< summary-bar feature_name="Compose enable ipv4" >}}
@z

@x
`enable_ipv4` can be used to disable IPv4 address assignment.
@y
`enable_ipv4` は IPv4 アドレス割り当てを無効にする際に用いられます。
@z

% snip code...

@x
### `enable_ipv6`
@y
### `enable_ipv6`
@z

@x
`enable_ipv6` enables IPv6 address assignment.
@y
`enable_ipv6` は IPv6 アドレス割り当てを有効にします。
@z

% snip code...

@x
### `external`
@y
### `external`
@z

@x
If set to `true`:
 - `external` specifies that this network’s lifecycle is maintained outside of that of the application.
Compose doesn't attempt to create these networks, and returns an error if one doesn't exist.
 - All other attributes apart from name are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
`true` が設定された場合、以下となります。
 - `external` は、このネットワークのライフサイクルを外部のアプリケーションが制御することを指定するものです。
   Compose はそのように設定されたネットワークは生成しません。
   そしてネットワークが存在しなければエラーを返します。
 - 名前以外の属性は一切無効になります。
   Compose が他の属性を検出した場合、Compose ファイルが不適切であるものとして受け入れません。
@z

@x
In the following example, `proxy` is the gateway to the outside world. Instead of attempting to create a network, Compose
queries the platform for an existing network called `outside` and connects the
`proxy` service's containers to it.
@y
以下の例において `proxy` は外部に対してのゲートウェイとして位置づけられます。
Compose はネットワークを作りにいくことはしません。
その代わりに `outside` という既存ネットワーク用のプラットフォームを探しに行きます。
そして `proxy` というサービスコンテナーをそこに貼り付けます。
@z

% snip code...

@x
### `ipam`
@y
### `ipam`
@z

@x
`ipam` specifies a custom IPAM configuration. This is an object with several properties, each of which is optional:
@y
`ipam` はカスタマイズした IPAM 設定を指定します。
これはプロパティをいくつか持ったオブジェクトです。
各プロパティは任意に設定します。
@z

@x
- `driver`: Custom IPAM driver, instead of the default.
- `config`: A list with zero or more configuration elements, each containing a:
  - `subnet`: Subnet in CIDR format that represents a network segment
  - `ip_range`: Range of IPs from which to allocate container IPs
  - `gateway`: IPv4 or IPv6 gateway for the master subnet
  - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver, as a mapping from hostname to IP
- `options`: Driver-specific options as a key-value mapping.
@y
- `driver`: デフォルトではないカスタマイズした IPAM ドライバー。
- `config`: 0 個またはいくつかの設定が行われた要素リストです。要素としては以下があります。
  - `subnet`: CIDR フォーマットによるサブネットでありネットワークセグメントを表現します。
  - `ip_range`: コンテナー に対して割り当てる IP アドレスの範囲。
  - `gateway`: マスターサブネットに対する IPv4 または IPv6 ゲートウェイ。
  - `aux_addresses`: ホスト名から IP アドレスへのマッピングのためにネットワークドライバーが用いる補助 IPv4 または IPv6 アドレス。
- `options`: キーバリューマッピングによる表現されるドライバー固有のオプション。
@z

% snip code...

@x
### `internal`
@y
### `internal`
@z

@x
By default, Compose provides external connectivity to networks. `internal`, when set to `true`, lets you
create an externally isolated network.
@y
Compose はデフォルトで外部ネットワークへの接続機能を提供します。
`internal` を `true` に設定すると、外部からは独立したネットワークを生成します。
@z

@x
### `labels`
@y
### `labels`
@z

@x
Add metadata to containers using `labels`. You can use either an array or a dictionary.
@y
`labels` を用いることで、コンテナーにメタデータを追加します。
配列または辞書形式のデータを指定できます。
@z

@x
It is recommended that you use reverse-DNS notation to prevent labels from conflicting with those used by other software.
@y
推奨されるのは逆引き DNS 記法を用いることであり、他のソフトウェアが利用するラベルとの衝突を避けることができます。
@z

% snip code...

@x
Compose sets `com.docker.compose.project` and `com.docker.compose.network` labels.
@y
Compose が `com.docker.compose.project` と `com.docker.compose.network` というラベルを設定します。
@z

@x
### `name`
@y
### `name`
@z

@x
`name` sets a custom name for the network. The name field can be used to reference networks which contain special characters.
The name is used as is and is not scoped with the project name.
@y
`name` はネットワークに対してカスタムな名前を設定します。
name フィールドには、ネットワークを参照するために特殊文字も含めて指定することができます。
name は記述されたものがそのまま用いられるものであり、プロジェクト名によってスコープされるものではありません。
@z

% snip code...

@x
It can also be used in conjunction with the `external` property to define the platform network that Compose
should retrieve, typically by using a parameter so the Compose file doesn't need to hard-code runtime specific values:
@y
`external` プロパティとともに指定することが可能であり、Compose が必ず用いなければならないプラットフォーム内のネットワークを定義できます。
利用にあたっては通常はパラメーターを用いるので、Compose ファイルでは実行時の特定の値をハードコーディングする必要はありません。
@z

% snip code...

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
For more examples, see [Networking in Compose](/manuals/compose/how-tos/networking.md).
@y
この他の例については [Compose におけるネットワーク](manuals/compose/how-tos/networking.md) を参照してください。
@z
