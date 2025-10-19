k%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
linkTitle: Services
title: Define services in Docker Compose
description: Explore all the attributes the services top-level element can have.
keywords: compose, compose specification, services, compose file reference
@y
linkTitle: services
title: Docker Compose でのサービス定義
description: Explore all the attributes the services top-level element can have.
keywords: compose, compose specification, services, compose file reference
@z

@x
{{% include "compose/services.md" %}}
@y
{{% include "compose/services.md" %}}
@z

@x
A Compose file must declare a `services` top-level element as a map whose keys are string representations of service names,
and whose values are service definitions. A service definition contains the configuration that is applied to each
service container.
@y
Compose ファイルとは `services` というトップレベル要素により宣言しなければなりません。
そこではマッピング形式により、キーとしてサービス名を文字表現により、またその値としてサービス定義を指定します。
一つのサービス定義には、各サービスコンテナーに適用される設定を記述します。
@z

@x
Each service may also include a `build` section, which defines how to create the Docker image for the service.
Compose supports building Docker images using this service definition. If not used, the `build` section is ignored and the Compose file is still considered valid. Build support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Build Specification](build.md) documentation.
@y
各サービスには `build` セクションを含める場合があります。
これはサービス向けにどのようにして Docker イメージを生成するのかを定めるものです。
Compose ではこのサービス定義を用いて Docker イメージをビルドする機能をサポートしています。
この記述がないのであれば `build` セクションによる機能は無視されますが、それでも Compose ファイルは文法的に正しいものとして扱われます。
ビルド機能は Compose 仕様においてはオプション的な位置づけであり、その詳細については [Compose ビルド仕様](build.md) のドキュメントにおいて説明しています。
@z

@x
Each service defines runtime constraints and requirements to run its containers. The `deploy` section groups
these constraints and lets the platform adjust the deployment strategy to best match containers' needs with
available resources. Deploy support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Deploy Specification](deploy.md) documentation.
If not implemented the `deploy` section is ignored and the Compose file is still considered valid.
@y
各サービスでは実行時の制約やコンテナー起動のための要件を定めます。
`deploy` セクションはその制約を取りまとめ、限られたリソースの中からコンテナー起動要件を満たすプラットフォーム向けのデプロイ戦術を調整します。
デプロイのサポートは Compose 仕様のオプション機能です。
詳しくは [Compose デプロイ仕様](deploy.md) のドキュメントを参照してください。
この機能が実装されていない場合 `deploy` セクションは無視されますが、Compose ファイルは有効なものとして扱われます。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
### Simple example
@y
### 単純な例 {#simple-example}
@z

@x
The following example demonstrates how to define two simple services, set their images, map ports, and configure basic environment variables using Docker Compose.
@y
以下の例は Docker Compose を使って、2 つの単純なサービスを定義し、そのイメージ、マップポート、基本的な環境変数の設定方法について示すものです。
@z

% snip code...

@x
### Advanced example
@y
### 応用的な例 {#advanced-example}
@z

@x
In the following example, the `proxy` service uses the Nginx image, mounts a local Nginx configuration file into the container, exposes port `80` and depends on the `backend` service.
@y
以下の例においては `proxy` サービスが Nginx イメージを利用し、コンテナーに対してローカルにある Nginx 設定ファイルをマウントしています。
ポート `80` を開放し、また `backend` サービスに依存する設定を行っています。
@z

@x
The `backend` service builds an image from the Dockerfile located in the `backend` directory that is set to build at stage `builder`.
@y
`backend` サービスは、ステージ `builder` においてビルドされるように設定されており、`backend` ディレクトリに置かれている Dockerfile からイメージがビルドされます。
@z

% snip code...

@x
For more example Compose files, explore the [Awesome Compose samples](https://github.com/docker/awesome-compose).
@y
Compose ファイルの例に関しては [Awesome Compose サンプル](https://github.com/docker/awesome-compose) を参照してください。
@z

@x
## Attributes
@y
## 属性 {#attributes}
@z

@x
### `annotations`
@y
### `annotations`
@z

@x
`annotations` defines annotations for the container. `annotations` can use either an array or a map.
@y
`annotations` はコンテナーの説明文を定義します。
`annotations` は配列またはマップを用いることが可能です。
@z

% snip code...

@x
### `attach`
@y
### `attach`
@z

@x
{{< summary-bar feature_name="Compose attach" >}}
@y
{{< summary-bar feature_name="Compose attach" >}}
@z

@x
When `attach` is defined and set to `false` Compose does not collect service logs,
until you explicitly request it to.
@y
`attach` が定義されその値が `false` である場合、サービスのログを明示的に収集する要求がない限り、その収集を行いません。
@z

@x
The default service configuration is `attach: true`.
@y
サービス設定のデフォルトは `attach: true` です。
@z

@x
### `build`
@y
### `build`
@z

@x
`build` specifies the build configuration for creating a container image from source, as defined in the [Compose Build Specification](build.md).
@y
`build` は、ソースからコンテナーイメージを生成するためのビルド設定を定義します。
詳しくは [Compose ビルド仕様](build.md) に示されています。
@z

@x
### `blkio_config`
@y
### `blkio_config`
@z

@x
`blkio_config` defines a set of configuration options to set block I/O limits for a service.
@y
`blkio_config` は、サービスに対するブロック I/O 制限を指示する一連の設定オプションを定義します。
@z

% snip code...

@x
#### `device_read_bps`, `device_write_bps`
@y
#### `device_read_bps`, `device_write_bps`
@z

@x
Set a limit in bytes per second for read / write operations on a given device.
Each item in the list must have two keys:
@y
指定するデバイスにおいて読み書き動作に対する 1 秒あたりのバイト数の制限を設定します。
項目をリスト内に設定し、以下の 2 つのキーがなければなりません。
@z

@x
- `path`: Defines the symbolic path to the affected device.
- `rate`: Either as an integer value representing the number of bytes or as a string expressing a byte value.
@y
- `path`: 対象デバイスへのシンボリックパスを定義します。
- `rate`: バイト数を表す整数値か、あるいはバイト値を表す文字列表現を指定します。
@z

@x
#### `device_read_iops`, `device_write_iops`
@y
#### `device_read_iops`, `device_write_iops`
@z

@x
Set a limit in operations per second for read / write operations on a given device.
Each item in the list must have two keys:
@y
指定されたデバイスに対して、読み書き動作に対する 1 秒あたりの処理数の制限を設定します。
項目をリスト内に設定し、以下の 2 つのキーがなければなりません。
@z

@x
- `path`: Defines the symbolic path to the affected device.
- `rate`: As an integer value representing the permitted number of operations per second.
@y
- `path`: 対象デバイスへのシンボリックパスを定義します。
- `rate`: 1 秒あたりの処理数として許容される整数値を指定します。
@z

@x
#### `weight`
@y
#### `weight`
@z

@x
Modify the proportion of bandwidth allocated to a service relative to other services.
Takes an integer value between 10 and 1000, with 500 being the default.
@y
別のサービスとの対比として 1 つのサービスに割り当てる帯域幅の割合を変更します。
10 から 1000 までの整数値を指定します。
デフォルトは 500 です。
@z

@x
#### `weight_device`
@y
#### `weight_device`
@z

@x
Fine-tune bandwidth allocation by device. Each item in the list must have two keys:
@y
デバイスごとに帯域幅の割合を調整します。
項目をリスト内に設定し、以下の 2 つのキーがなければなりません。
@z

@x
- `path`: Defines the symbolic path to the affected device.
- `weight`: An integer value between 10 and 1000.
@y
- `path`: 対象デバイスへのシンボリックパスを定義します。
- `weight`: 10 から 1000 の整数値を指定します。
@z

@x
### `cpu_count`
@y
### `cpu_count`
@z

@x
`cpu_count` defines the number of usable CPUs for service container.
@y
`cpu_count` はサービスコンテナーにおいて利用する CPU 数を定義します。
@z

@x
### `cpu_percent`
@y
### `cpu_percent`
@z

@x
`cpu_percent` defines the usable percentage of the available CPUs.
@y
`cpu_percent` は利用可能な CPU の中から、その利用割合を定義します。
@z

@x
### `cpu_shares`
@y
### `cpu_shares`
@z

@x
`cpu_shares` defines, as integer value, a service container's relative CPU weight versus other containers.
@y
`cpu_shares` は整数値を指定するものであり、別コンテナーに対するコンテナーの相対的な CPU 重みを定義します。
@z

@x
### `cpu_period`
@y
### `cpu_period`
@z

@x
`cpu_period` configures CPU CFS (Completely Fair Scheduler) period when a platform is based
on Linux kernel.
@y
プラットフォームが Linux ベースのものである場合に `cpu_period` は CPU の CFS (Completely Fair Scheduler) 時間を定めます。
@z

@x
### `cpu_quota`
@y
### `cpu_quota`
@z

@x
`cpu_quota` configures CPU CFS (Completely Fair Scheduler) quota when a platform is based
on Linux kernel.
@y
プラットフォームが Linux ベースのものである場合に `cpu_period` は CPU の CFS (Completely Fair Scheduler) クォータを定めます。
@z

@x
### `cpu_rt_runtime`
@y
### `cpu_rt_runtime`
@z

@x
`cpu_rt_runtime` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_runtime` はリアルタイムスケジューラーをサポートするプラットフォームにおいて CPU 割り当てパラメーターを設定します。
ここにはマイクロ秒を単位とする整数値を指定するか [時間](extension.md#specifying-durations) を指定することができます。
@z

% snip code...

@x
### `cpu_rt_period`
@y
### `cpu_rt_period`
@z

@x
`cpu_rt_period` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_runtime` はリアルタイムスケジューラーをサポートするプラットフォームにおいて CPU 割り当てパラメーターを設定します。
ここにはマイクロ秒を単位とする整数値を指定するか [時間](extension.md#specifying-durations) を指定することができます。
@z

% snip code...

@x
### `cpus`
@y
### `cpus`
@z

@x
`cpus` define the number of (potentially virtual) CPUs to allocate to service containers. This is a fractional number.
`0.000` means no limit.
@y
`cpus` はサービスコンテナーに割り当てる (仮想の) CPU 数を指定します。
小数を用いるものであり `0.000` は無制限を表します。
@z

@x
When set, `cpus` must be consistent with the `cpus` attribute in the [Deploy Specification](deploy.md#cpus).
@y
これを設定する場合は [デプロイ仕様](deploy.md#cpus) にある `cpus` 属性と一致していなければなりません。
@z

@x
### `cpuset`
@y
### `cpuset`
@z

@x
`cpuset` defines the explicit CPUs in which to permit execution. Can be a range `0-3` or a list `0,1`
@y
`cpuset` は実行を許可する CPU を明示的に指定します。
範囲指定 `0-3` やリスト形式 `0,1` のような指定とします。
@z

@x
### `cap_add`
@y
### `cap_add`
@z

@x
`cap_add` specifies additional container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html)
as strings.
@y
`cap_add` は追加コンテナーの [ケーパビリティー](https://man7.org/linux/man-pages/man7/capabilities.7.html) を文字列で指定します。
@z

% snip code...

@x
### `cap_drop`
@y
### `cap_drop`
@z

@x
`cap_drop` specifies container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html) to drop
as strings.
@y
`cap_drop` は削除するコンテナー [ケーパビリティー](https://man7.org/linux/man-pages/man7/capabilities.7.html)を文字列で指定します。
@z

% snip code...

@x
### `cgroup`
@y
### `cgroup`
@z

@x
{{< summary-bar feature_name="Compose cgroup" >}}
@y
{{< summary-bar feature_name="Compose cgroup" >}}
@z

@x
`cgroup` specifies the cgroup namespace to join. When unset, it is the container runtime's decision to
select which cgroup namespace to use, if supported.
@y
`cgroup` は参加する cgroup 名前空間を指定します。
これが設定されていない場合、どの cgroup 名前空間が用いられるかは、コンテナー実行時に選定されます。
ただしそれはその機能がサポートされている場合に限ります。
@z

@x
- `host`: Runs the container in the Container runtime cgroup namespace.
- `private`: Runs the container in its own private cgroup namespace.
@y
- `host`: cgroup 名前空間 Container runtime においてコンテナーを実行します。
- `private`: 独自のプライベートな cgroup 名前空間においてコンテナーを実行します。
@z

@x
### `cgroup_parent`
@y
### `cgroup_parent`
@z

@x
`cgroup_parent` specifies an optional parent [cgroup](https://man7.org/linux/man-pages/man7/cgroups.7.html) for the container.
@y
`cgroup_parent` はオプションとしてコンテナーに対する親 [cgroup](https://man7.org/linux/man-pages/man7/cgroups.7.html) を指定します。
@z

% snip code...

@x
### `command`
@y
### `command`
@z

@x
`command` overrides the default command declared by the container image, for example by Dockerfile's `CMD`.
@y
`command` は、たとえば Dockerfile 内の `CMD` のような、コンテナーイメージによって宣言されたデフォルトコマンドを上書きします。
@z

% snip code...

@x
If the value is `null`, the default command from the image is used.
@y
その値が `null` である場合、イメージ内にあるデフォルトコマンドが用いられます。
@z

@x
If the value is `[]` (empty list) or `''` (empty string), the default command declared by the image is ignored, or in other words overridden to be empty.
@y
その値が `[]` (空リスト) または `''` (空文字列) である場合、イメージ内に宣言されているデフォルトコマンドは無視されます。
つまり空っぽとして上書きされます。
@z

@x
> [!NOTE]
>
> Unlike the `CMD` instruction in a Dockerfile, the `command` field doesn't automatically run within the context of the [`SHELL`](/reference/dockerfile.md#shell-form) instruction defined in the image. If your `command` relies on shell-specific features, such as environment variable expansion, you need to explicitly run it within a shell. For example:
@y
> [!NOTE]
>
> Dockerfile における `CMD` 命令とは異なり `command` フィールドは、イメージ内に定義される [`SHELL`](reference/dockerfile.md#shell-form) 命令の内部では自動実行されません。
`command` がたとえば環境変数の展開などのような、シェル固有の機能に基づいている場合、シェル内において明示的に実行する必要があります。
たとえば以下のとおりです。
@z

% snip code...

@x
The value can also be a list, similar to the [exec-form syntax](/reference/dockerfile.md#exec-form)
used by the [Dockerfile](/reference/dockerfile.md#exec-form).
@y
その値はリストにすることもできます。
それはちょうど [Dockerfile](reference/dockerfile.md#exec-form) において用いられる [exec 形式の文法](reference/dockerfile.md#exec-form) と同様になります。
@z

@x
### `configs`
@y
### `configs`
@z

@x
`configs` let services adapt their behaviour without the need to rebuild a Docker image.
Services can only access configs when explicitly granted by the `configs` attribute. Two different syntax variants are supported.
@y
`configs` は Docker イメージを再ビルドすることなく、サービスの動作を変更できるようにします。
サービスは `configs` 属性により明示的にアクセス許可が与えられている場合にのみ config にアクセスすることができます。
文法は 2 つの形式がサポートされています。
@z

@x
Compose reports an error if `config` doesn't exist on the platform or isn't defined in the
[`configs` top-level element](configs.md) in the Compose file.
@y
`config` がプラットフォーム上に存在しない場合、あるいは Compose ファイルの [トップレベル要素 `configs`](configs.md) において定義されていない場合、Compose はエラーを出力します。
@z

@x
There are two syntaxes defined for configs: a short syntax and a long syntax.
@y
config に用いられる 2 つの文法とは、短い文法と長い文法です。
@z

@x
You can grant a service access to multiple configs, and you can mix long and short syntax.
@y
サービスへは、複数の config へのアクセス権限を与えることができます。
また短い文法、長い文法は両者を混在させて記述することもできます。
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it as files into a service’s container’s filesystem. The location of the mount point within the container defaults to `/<config_name>` in Linux containers, and `C:\<config-name>` in Windows containers.
@y
短い文法では config 名のみを指定します。
これはコンテナーから config へのアクセスを許可し、その config はサービスのコンテナー内にあるファイルシステムに対してファイルとしてマウントされます。
コンテナーにおけるマウントポイントは、Linux コンテナーでのデフォルトが `/<config 名>`、Windows コンテナーでのデフォルトが `C:\<config 名>` です。
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in the platform. If the external config does not exist,
the deployment fails.
@y
以下の例は短い文法を使って、`redis` サービスが 2 つの config `my_config` と `my_other_config` へのアクセスを許可するものです。
`my_config` の値は `./my_config.txt` ファイルの内容を設定しています。
また `my_other_config` は外部リソースとして定義されています。
外部であるということは、プラットフォーム上においてあらかじめ定義済みであることを意味します。
したがって外部 config が存在しなかった場合、デプロイは失敗します。
@z

% snip code...

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long syntax provides more granularity in how the config is created within the service's task containers.
@y
長い文法は、これを使うことでサービスのタスクコンテナー内において config をより詳細に定めることができます。
@z

@x
- `source`: The name of the config as it exists in the platform.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric uid or gid that owns the mounted config file
  within the service's task containers. Default value when not specified is `USER`.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file that is mounted within the service's
  task containers, in octal notation. Default value is world-readable (`0444`).
  Writable bit must be ignored. The executable bit can be set.
@y
- `source`: プラットフォーム上に存在する config 名。
- `target`: サービスのタスクコンテナーにマウントされるファイルのパスおよびファイル名。
  指定がなかった場合のデフォルトは `/<source>`。
- `uid` および `gid`: サービスのタスクコンテナー内にマウントされる config ファイルを所有する uid および gid の数値。
  指定がなかった場合のデフォルトは `USER`。
- `mode`: サービスのタスクコンテナーにマウントされるファイルの [パーミッション](https://wintelguy.com/permissions-calc.pl)。
  8 進数表現。
  デフォルト値はワールド読み込み可 (`0444`)。
  書き込みビットは無視され、実行ビットは設定可能。
@z

@x
The following example sets the name of `my_config` to `redis_config` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_config`
config.
@y
以下の例ではコンテナー内の `redis_config` に対して `my_config` という名前を設定しています。
そのモードは `0440` (グループ読み込み可) であり、ユーザーとグループは `103` に設定しています。
`redis` サービスは `my_other_config` という config に対してのアクセス権限は持っていません。
@z

% snip code...

@x
### `container_name`
@y
### `container_name`
@z

@x
`container_name` is a string that specifies a custom container name, rather than a name generated by default.
@y
`container_name` は、カスタムのコンテナー名を文字列にて指定します。
これによってデフォルトで生成されるコンテナー名は用いられなくなります。
@z

% snip code...

@x
Compose does not scale a service beyond one container if the Compose file specifies a
`container_name`. Attempting to do so results in an error.
@y
Compose ファイルに `container_name` の指定を行った場合、そのサービスが複数コンテナーにスケールアップすることはできなくなります。
これを行おうとした場合にはエラーが発生します。
@z

@x
`container_name` follows the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`
@y
`container_name` は正規表現では `[a-zA-Z0-9][a-zA-Z0-9_.-]+` に従います。
@z

@x
### `credential_spec`
@y
### `credential_spec`
@z

@x
`credential_spec` configures the credential spec for a managed service account.
@y
`credential_spec` は、管理しているサービスアカウントの資格情報スペック (credential spec) を設定します。
@z

@x
If you have services that use Windows containers, you can use `file:` and
`registry:` protocols for `credential_spec`. Compose also supports additional
protocols for custom use-cases.
@y
そのサービスが Windows コンテナーを利用している場合、資格情報スペックに対しては `file:` または `registry:` プロトコルが指定可能です。
Compose はカスタムユースケース向けに、プロトコル追加機能をサポートしています。
@z

@x
The `credential_spec` must be in the format `file://<filename>` or `registry://<value-name>`.
@y
`credential_spec` は `file://<ファイル名>` または `registry://<値の名>` という書式でなければなりません。
@z

% snip code...

@x
When using `registry:`, the credential spec is read from the Windows registry on
the daemon's host. A registry value with the given name must be located in:
@y
`registry:` を利用した場合、デーモンが稼働するホストの Windows レジストリから資格情報スペックを読み込みます。
レジストリ値と指定された名前は、以下の場所に存在していなければなりません。
@z

% snip code...

@x
The following example loads the credential spec from a value named `my-credential-spec`
in the registry:
@y
次の例では、レジストリ内の `my-credential-spec` という名称に割り振られた値から、資格情報スペックをロードします。
@z

% snip code...

@x
#### Example gMSA configuration
@y
#### gMSA 設定例 {#example-gmsa-configuration}
@z

@x
When configuring a gMSA credential spec for a service, you only need
to specify a credential spec with `config`, as shown in the following example:
@y
gMSA 資格情報スペックをサービスに対して設定する場合は、`config` を使って資格情報スペックを指定するだけで済みます。
その具体例は以下のとおりです。
@z

% snip code...

@x
### `depends_on`
@y
### `depends_on`
@z

@x
{{% include "compose/services-depends-on.md" %}}
@y
{{% include "compose/services-depends-on.md" %}}
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
The short syntax variant only specifies service names of the dependencies.
Service dependencies cause the following behaviors:
@y
短い文法では依存するサービス名のみを指定します。
サービスの依存関係に応じて以下の動作となります。
@z

@x
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@y
- Compose はサービスの生成を依存順に行います。
  以下の例では `db` と `redis` が `web` よりも先に生成されます。
@z

@x
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@y
- Compose はサービスの削除を依存順に行います。
  以下の例で `web` は `db` や `redis` よりも前に削除されます。
@z

@x
Simple example:
@y
単純な例
@z

% snip code...

@x
Compose guarantees dependency services have been started before
starting a dependent service.
Compose waits for dependency services to be "ready" before
starting a dependent service.
@y
依存するサービスを持つ対象サービスは、その依存サービスが起動してから対象サービスが起動するよう、Compose が確実に保証します。
依存するサービスが起動するまで、その対象サービスは「待機状態」に置かれます。
@z

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long form syntax enables the configuration of additional fields that can't be
expressed in the short form.
@y
長い文法では追加の設定フィールドの指定が可能であり、これは短い文法形式では表現することはできません。
@z

@x
- `restart`: When set to `true` Compose restarts this service after it updates the dependency service.
  This applies to an explicit restart controlled by a Compose operation, and excludes automated restart by the container runtime
  after the container dies. Introduced in Docker Compose version [2.17.0](/manuals/compose/releases/release-notes.md#2170).
@y
- `restart`: これが `true` に設定されていると、Compose は依存サービスが更新された時に、対象サービスを再起動します。
  これは Compose 処理として制御される明示的な再起動を実現します。
  そしてコンテナーが停止した際にコンテナーランタイムが行う自動再起動には適用されません。
  この機能は Docker Compose バージョン [2.17.0](manuals/compose/releases/release-notes.md#2170) から導入されたものです。
@z

@x
- `condition`: Sets the condition under which dependency is considered satisfied
  - `service_started`: An equivalent of the short syntax described previously
  - `service_healthy`: Specifies that a dependency is expected to be "healthy"
    (as indicated by [`healthcheck`](#healthcheck)) before starting a dependent
    service.
  - `service_completed_successfully`: Specifies that a dependency is expected to run
    to successful completion before starting a dependent service.
@y
- `condition`: 依存サービスがどのような状態になったときに条件が満たされたとするかを定めます。
  - `service_started`: 前述した短い文法での内容と同じです。
  - `service_healthy`: 対象サービスの起動するには、依存サービスが「健康的 (healthy)」([`healthcheck`](#healthcheck) に説明) となっていることを指定します。
  - `service_completed_successfully`: 対象サービスが起動するには、依存サービスが正常に実行していることを指定します。
@z

@x
- `required`: When set to `false` Compose only warns you when the dependency service isn't started or available. If it's not defined
    the default value of `required` is `true`. Introduced in Docker Compose version [2.20.0](/manuals/compose/releases/release-notes.md#2200).
@y
- `required`: これが `false` に設定されていると、依存サービスが起動されなかったり利用不能である場合に、Compose が警告のみを行います。
  `required` が定義されていない場合のデフォルト値は `true` です。
  この機能は Docker Compose バージョン [2.20.0](manuals/compose/releases/release-notes.md#2200) から導入されました。
@z

@x
Service dependencies cause the following behaviors:
@y
サービスの依存関係に応じて以下の動作となります。
@z

@x
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@y
- Compose はサービスの生成を依存順に行います。
  以下の例では `db` と `redis` が `web` よりも先に生成されます。
@z

@x
- Compose waits for healthchecks to pass on dependencies
  marked with `service_healthy`. In the following example, `db` is expected to
  be "healthy" before `web` is created.
@y
- Compose は依存サービスが `service_healthy` と印づけられる時まで待ちます。
  以下の例では `db` が「健康的」になってから `web` が生成されます。
@z

@x
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@y
- Compose はサービスの削除を依存順に行います。
  以下の例で `web` は `db` や `redis` よりも前に削除されます。
@z

% snip code...

@x
Compose guarantees dependency services are started before
starting a dependent service.
Compose guarantees dependency services marked with
`service_healthy` are "healthy" before starting a dependent service.
@y
依存するサービスを持つ対象サービスは、その依存サービスが起動してから対象サービスが起動するよう、Compose が確実に保証します。
`service_healthy` として印づけられた依存サービスを持つ対象サービスは、対象サービスの起動の際には依存サービスが「健康的」であることを確実に保証します。
@z

@x
### `deploy`
@y
### `deploy`
@z

@x
`deploy` specifies the configuration for the deployment and lifecycle of services, as defined [in the Compose Deploy Specification](deploy.md).
@y
`deploy` 識別子は、サービスのデプロイとライフサイクルの設定を行います。
これは [Compose デプロイ仕様](deploy.md) において定義されています。
@z

@x
### `develop`
@y
### `develop`
@z

@x
{{< summary-bar feature_name="Compose develop" >}}
@y
{{< summary-bar feature_name="Compose develop" >}}
@z

@x
`develop` specifies the development configuration for maintaining a container in sync with source, as defined in the [Development Section](develop.md).
@y
`develop` 識別子は、コンテナーとソースを同期するための開発設定を指定します。
これは [開発の節](develop.md) において定義されています。
@z

@x
### `device_cgroup_rules`
@y
### `device_cgroup_rules`
@z

@x
`device_cgroup_rules` defines a list of device cgroup rules for this container.
The format is the same format the Linux kernel specifies in the [Control Groups
Device Whitelist Controller](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/devices.html).
@y
`device_cgroup_rules` は対象コンテナー向けのデバイス cgroup ルールのリストを定義します。
その書式は Linux カーネルが [Control Groups
Device Whitelist Controller](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/devices.html) において指定している書式と同様です。
@z

% snip code...

@x
### `devices`
@y
### `devices`
@z

@x
`devices` defines a list of device mappings for created containers in the form of
`HOST_PATH:CONTAINER_PATH[:CGROUP_PERMISSIONS]`.
@y
`devices` は生成されるコンテナーのデバイスマッピング一覧を定義します。
その形式は `HOST_PATH:CONTAINER_PATH[:CGROUP_PERMISSIONS]` です。
@z

% snip code...

@x
`devices` can also rely on the [CDI](https://github.com/cncf-tags/container-device-interface) syntax to let the container runtime select a device:
@y
`devices` では [CDI](https://github.com/cncf-tags/container-device-interface) 文法の指定も可能であり、これによってコンテナーランタイムがデバイスを選択できるようにします。
@z

% snip code...

@x
### `dns`
@y
### `dns`
@z

@x
`dns` defines custom DNS servers to set on the container network interface configuration. It can be a single value or a list.
@y
`dns` は、コンテナーのネットワークインターフェースに設定するカスタムな DNS サーバーを指定します。
単一の値かリスト形式による指定が可能です。
@z

% snip code...

@x
### `dns_opt`
@y
### `dns_opt`
@z

@x
`dns_opt` list custom DNS options to be passed to the container’s DNS resolver (`/etc/resolv.conf` file on Linux).
@y
`dns_opt` は、カスタム DNS サーバーへのオプションリストであり、コンテナーの DNS リボルバー (Linux における `/etc/resolv.conf` ファイル) に受け渡されます。
@z

% snip code...

@x
### `dns_search`
@y
### `dns_search`
@z

@x
`dns_search` defines custom DNS search domains to set on container network interface configuration. It can be a single value or a list.
@y
`dns_search` は、コンテナーのネットワークインターフェースに設定するカスタムな DNS 検索ドメインを指定します。
単一の値かリスト形式による指定が可能です。
@z

% snip code...

@x
### `domainname`
@y
### `domainname`
@z

@x
`domainname` declares a custom domain name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`domainname` は、サービスコンテナーにて用いるカスタムドメイン名を宣言します。
RFC 1123 に従ったホスト名でなければなりません。
@z

@x
### `driver_opts`
@y
### `driver_opts`
@z

@x
{{< summary-bar feature_name="Compose driver opts" >}}
@y
{{< summary-bar feature_name="Compose driver opts" >}}
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
### `entrypoint`
@y
### `entrypoint`
@z

@x
`entrypoint` declares the default entrypoint for the service container.
This overrides the `ENTRYPOINT` instruction from the service's Dockerfile.
@y
`entrypoint` はサービスコンテナーにおけるデフォルトのエントリーポイントを宣言します。
これはサービスの Dockerfile に記述された `ENTRYPOINT` 命令を上書きします。
@z

@x
If `entrypoint` is non-null, Compose ignores any default command from the image, for example the `CMD`
instruction in the Dockerfile.
@y
`entrypoint` がヌルではない場合、イメージ内のデフォルトコマンド、たとえば `Dockerfile` 内の `CMD` は無視されます。
@z

@x
See also [`command`](#command) to set or override the default command to be executed by the entrypoint process.
@y
エントリーポイント処理として実行されるデフォルトコマンドの上書き方法については [`command`](#command) も参照してください。
@z

@x
In its short form, the value can be defined as a string:
@y
短い書式では値を文字列により指定します。
@z

% snip code...

@x
Alternatively, the value can also be a list, in a manner similar to the
[Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd):
@y
またはリスト形式により指定することもできます。
その形式は [Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd) における方法と同様です。
@z

% snip code...

@x
If the value is `null`, the default entrypoint from the image is used.
@y
値が `null` である場合、デフォルトのエントリーポイントはイメージ内のものが用いられます。
@z

@x
If the value is `[]` (empty list) or `''` (empty string), the default entrypoint declared by the image is ignored, or in other words, overridden to be empty.
@y
その値が `[]` (空リスト) または `''` (空文字列) である場合、イメージ内に宣言されているデフォルトのエントリーポイントは無視されます。
つまり空っぽとして上書きされます。
@z

@x
### `env_file`
@y
### `env_file`
@z

@x
{{% include "compose/services-env-file.md" %}}
@y
{{% include "compose/services-env-file.md" %}}
@z

% snip code...

@x
Relative paths are resolved from the Compose file's parent folder. As absolute paths prevent the Compose
file from being portable, Compose warns you when such a path is used to set `env_file`.
@y
相対パスは Compose ファイルの親フォルダーから相対的に解釈されます。
`env_file` に絶対パスを用いると Compose ファイルの可搬性を損なうため、そういったパスが用いられている場合には Compose が警告出力を行います。
@z

@x
Environment variables declared in the [`environment`](#environment) section override these values. This holds true even if those values are
empty or undefined.
@y
[`environment`](#environment) セクションに記述されている環境変数は、この値を上書きします。
これは値が空や未定義であっても同様です。
@z

@x
`env_file` can also be a list. The files in the list are processed from the top down. For the same variable
specified in two environment files, the value from the last file in the list stands.
@y
`env_file` はリスト指定することもできます。
リスト内のファイルはトップダウンにより処理されます。
同一の環境変数設定が複数ファイル内に存在していた場合、最終のファイルに示されている値が有効になります。
@z

% snip code...

@x
List elements can also be declared as a mapping, which then lets you set additional
attributes.
@y
リスト要素はマッピングとして宣言することもできます。
そうすれば追加の属性を設定することもできます。
@z

@x
#### `required`
@y
#### `required`
@z

@x
{{< summary-bar feature_name="Compose required" >}}
@y
{{< summary-bar feature_name="Compose required" >}}
@z

@x
The `required` attribute defaults to `true`. When `required` is set to `false` and the `.env` file is missing, Compose silently ignores the entry.
@y
`required` 属性のデフォルトは `true` です。
`required` が `false` に設定されていて `.env` ファイルが見つからない場合、Compose は何も出力せず無視するだけです。
@z

% snip code...

@x
#### `format`
@y
#### `format`
@z

@x
{{< summary-bar feature_name="Compose format" >}}
@y
{{< summary-bar feature_name="Compose format" >}}
@z

@x
The `format` attribute lets you use an alternative file format for the `env_file`. When not set, `env_file` is parsed according to the Compose rules outlined in [`Env_file` format](#env_file-format).
@y
`format` 属性は `env_file` のファイル書式を別形式とする指定です。
これが未指定の場合 `env_file` は [`env_file` フォーマット](#env_file-format) に示されている Compose ルールに従って解釈されます。
@z

@x
`raw` format lets you use an `env_file` with key=value items, but without any attempt from Compose to parse the value for interpolation.
This let you pass values as-is, including quotes and `$` signs.
@y
`raw` フォーマットは `env_file` においてキーバリュー形式の項目指定ができるようになります。
ただし Compose はその値に対しての補間はいっさい行いません。
つまり値は記述されたまま取り扱われ、クォートや `$` 記号もそのままです。
@z

% snip code...

@x
#### `Env_file` format
@y
#### `env_file` フォーマット {#env_file-format}
@z

@x
Each line in an `.env` file must be in `VAR[=[VAL]]` format. The following syntax rules apply:
@y
`.env` ファイル内の各行は `VAR[=[VAL]]` の形式になっていなければなりません。
そして以下のルールが適用されます。
@z

@x
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- Unquoted and double-quoted (`"`) values have [Interpolation](interpolation.md) applied.
@y
- `#` で始まる行はコメントとして扱われ無視されます。
- 空行は無視されます。
- クォートで囲まれていないまたはダブルクォート (`"`) で囲まれている値は [補間](interpolation.md) 処理が適用されます。
@z

@x
- Each line represents a key-value pair. Values can optionally be quoted.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
@y
- 各行はキーバリューペアを表現しています。
  値をクォーテーションで囲むこともできます。
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
@z

@x
- Inline comments for unquoted values must be preceded with a space.
  - `VAR=VAL # comment` -> `VAL`
  - `VAR=VAL# not a comment` -> `VAL# not a comment`
@y
- クォートで囲まれていない値に対してインラインコメントをつける場合は、コメント記号の前に空白を設ける必要があります。
  - `VAR=VAL # コメント` -> `VAL`
  - `VAR=VAL# コメントにあらず` -> `VAL# コメントにあらず`
@z

@x
- Inline comments for quoted values must follow the closing quote.
  - `VAR="VAL # not a comment"` -> `VAL # not a comment`
  - `VAR="VAL" # comment` -> `VAL`
@y
- クォートで囲まれた値に対してのインラインコメントは、閉じクォートの後につける必要があります。
  - `VAR="VAL # コメントにあらず"` -> `VAL # コメントにあらず`
  - `VAR="VAL" # コメント` -> `VAL`
@z

@x
- Single-quoted (`'`) values are used literally.
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
@y
- シングルクォーテーションで囲んだ場合、値はそのまま評価されます。
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
@z

@x
- Quotes can be escaped with `\`.
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
@y
- クォーテーション記号は `\` を使ってエスケープすることができます。
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
@z

@x
- Common shell escape sequences including `\n`, `\r`, `\t`, and `\\` are supported in double-quoted values.
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@y
- `\n`、`\r`、`\t`、`\\` といった一般的なシェルエスケープシーケンスは、ダブルクォートで囲まれた値においてサポートされます。
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@z

@x
`VAL` may be omitted, in such cases the variable value is an empty string.
`=VAL` may be omitted, in such cases the variable is unset.
@y
`VAL` は省略可です。
この場合、変数値は空文字になります。
`=VAL` も省略可です。
この場合、変数値が未設定になります。
@z

@x within code
# Set Rails/Rack environment
@y
# Rails/Rack 環境の設定
@z

@x
### `environment`
@y
### `environment`
@z

@x
{{% include "compose/services-environment.md" %}}
@y
{{% include "compose/services-environment.md" %}}
@z

@x
Environment variables can be declared by a single key (no value to equals sign). In this case Compose
relies on you to resolve the value. If the value is not resolved, the variable
is unset and is removed from the service container environment.
@y
環境変数はキーだけ (等号文字による値がない) 単独で宣言することができます。
その場合 Compose はその値の設定をユーザーに委ねます。
その値が解決できなかった場合、その変数は未設定となり、サービスコンテナーの環境内からは削除されます。
@z

@x
Map syntax:
@y
マップ形式の文法
@z

% snip code...

@x
Array syntax:
@y
配列形式の文法
@z

% snip code...

@x
When both `env_file` and `environment` are set for a service, values set by `environment` have precedence.
@y
1 つのサービスに対して `env_file` と `environment` の両方が設定された場合、`environment` に設定された値が優先されます。
@z

@x
### `expose`
@y
### `expose`
@z

@x
`expose` defines the (incoming) port or a range of ports that Compose exposes from the container. These ports must be
accessible to linked services and should not be published to the host machine. Only the internal container
ports can be specified.
@y
`expose` は (入力) ポート、または Compose がコンテナーから公開するポート範囲を定義するものです。
このポートはリンクされたサービスからアクセス可能でなければならず、またホストマシンに向けては公開されていないものとします。
内部コンテナーのポートのみが指定できます。
@z

@x
Syntax is `<portnum>/[<proto>]` or `<startport-endport>/[<proto>]` for a port range.
When not explicitly set, `tcp` protocol is used.
@y
その文法は `<ポート>/[<プロトコル>]` とするか、ポート範囲であれば `<開始ポート-終了ポート>/[<プロトコル>]` とします。
プロトコルが明示的に指定されなかった場合は `tcp` が用いられます。
@z

% snip code...

@x
> [!NOTE]
>
> If the Dockerfile for the image already exposes ports, it is visible to other containers on the network even if `expose` is not set in your Compose file.
@y
> [!NOTE]
>
> イメージに対する Dockerfile においてポートが既に公開されている場合は、Compose ファイルでの `expose` が設定されていなくても、そのポートはネットワーク上の他のコンテナーが参照できます。
@z

@x
### `extends`
@y
### `extends`
@z

@x
`extends` lets you share common configurations among different files, or even different projects entirely. With `extends` you can define a common set of service options in one place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.
@y
`extends` lets you share common configurations among different files, or even different projects entirely.
`extends` を使うことで、共通するサービスオプションを一箇所に定義しておいて、それをどこからでも参照することができます。
別の Compose ファイルを参照しアプリケーション内で利用したいサービスを選び出します。
必要に応じて属性を上書きする機能を利用します。
@z

@x
You can use `extends` on any service together with other configuration keys. The `extends` value must be a mapping
defined with a required `service` and an optional `file` key.
@y
You can use `extends` on any service together with other configuration keys. The `extends` value must be a mapping
defined with a required `service` and an optional `file` key.
@z

% snip code...

@x
- `service`: Defines the name of the service being referenced as a base, for example `web` or `database`.
- `file`: The location of a Compose configuration file defining that service.
@y
- `service`: Defines the name of the service being referenced as a base, for example `web` or `database`.
- `file`: The location of a Compose configuration file defining that service.
@z

@x
#### Restrictions
@y
#### 制約 {#restrictions}
@z

@x
When a service is referenced using `extends`, it can declare dependencies on other resources. These dependencies may be explicitly defined through attributes like `volumes`, `networks`, `configs`, `secrets`, `links`, `volumes_from`, or `depends_on`. Alternatively, dependencies can reference another service using the `service:{name}` syntax in namespace declarations such as `ipc`, `pid`, or `network_mode`.
@y
When a service is referenced using `extends`, it can declare dependencies on other resources. These dependencies may be explicitly defined through attributes like `volumes`, `networks`, `configs`, `secrets`, `links`, `volumes_from`, or `depends_on`. Alternatively, dependencies can reference another service using the `service:{name}` syntax in namespace declarations such as `ipc`, `pid`, or `network_mode`.
@z

@x
Compose does not automatically import these referenced resources into the extended model. It is your responsibility to ensure all required resources are explicitly declared in the model that relies on extends.
@y
Compose does not automatically import these referenced resources into the extended model. It is your responsibility to ensure all required resources are explicitly declared in the model that relies on extends.
@z

@x
Circular references with `extends` are not supported, Compose returns an error when one is detected.
@y
Circular references with `extends` are not supported, Compose returns an error when one is detected.
@z

@x
#### Finding referenced service
@y
#### Finding referenced service {#finding-referenced-service}
@z

@x
`file` value can be:
@y
`file` value can be:
@z

@x
- Not present.
  This indicates that another service within the same Compose file is being referenced.
- File path, which can be either:
  - Relative path. This path is considered as relative to the location of the main Compose
    file.
  - Absolute path.
@y
- Not present.
  This indicates that another service within the same Compose file is being referenced.
- File path, which can be either:
  - Relative path. This path is considered as relative to the location of the main Compose
    file.
  - Absolute path.
@z

@x
A service denoted by `service` must be present in the identified referenced Compose file.
Compose returns an error if:
@y
A service denoted by `service` must be present in the identified referenced Compose file.
Compose returns an error if:
@z

@x
- The service denoted by `service` is not found.
- The Compose file denoted by `file` is not found.
@y
- The service denoted by `service` is not found.
- The Compose file denoted by `file` is not found.
@z

@x
#### Merging service definitions
@y
#### Merging service definitions {#merging-service-definitions}
@z

@x
Two service definitions, the main one in the current Compose file and the referenced one
specified by `extends`, are merged in the following way:
@y
Two service definitions, the main one in the current Compose file and the referenced one
specified by `extends`, are merged in the following way:
@z

@x
- Mappings: Keys in mappings of the main service definition override keys in mappings
  of the referenced service definition. Keys that aren't overridden are included as is.
- Sequences: Items are combined together into a new sequence. The order of elements is
  preserved with the referenced items coming first and main items after.
- Scalars: Keys in the main service definition take precedence over keys in the
  referenced one.
@y
- Mappings: Keys in mappings of the main service definition override keys in mappings
  of the referenced service definition. Keys that aren't overridden are included as is.
- Sequences: Items are combined together into a new sequence. The order of elements is
  preserved with the referenced items coming first and main items after.
- Scalars: Keys in the main service definition take precedence over keys in the
  referenced one.
@z

@x
##### Mappings
@y
##### マッピング {#mappings}
@z

@x
The following keys should be treated as mappings: `annotations`, `build.args`, `build.labels`,
`build.extra_hosts`, `deploy.labels`, `deploy.update_config`, `deploy.rollback_config`,
`deploy.restart_policy`, `deploy.resources.limits`, `environment`, `healthcheck`,
`labels`, `logging.options`, `sysctls`, `storage_opt`, `extra_hosts`, `ulimits`.
@y
The following keys should be treated as mappings: `annotations`, `build.args`, `build.labels`,
`build.extra_hosts`, `deploy.labels`, `deploy.update_config`, `deploy.rollback_config`,
`deploy.restart_policy`, `deploy.resources.limits`, `environment`, `healthcheck`,
`labels`, `logging.options`, `sysctls`, `storage_opt`, `extra_hosts`, `ulimits`.
@z

@x
One exception that applies to `healthcheck` is that the main mapping cannot specify
`disable: true` unless the referenced mapping also specifies `disable: true`. Compose returns an error in this case.
For example, the following input:
@y
One exception that applies to `healthcheck` is that the main mapping cannot specify
`disable: true` unless the referenced mapping also specifies `disable: true`. Compose returns an error in this case.
For example, the following input:
@z

% snip code...

@x
Produces the following configuration for the `cli` service. The same output is
produced if array syntax is used.
@y
Produces the following configuration for the `cli` service. The same output is
produced if array syntax is used.
@z

% snip code...

@x
Items under `blkio_config.device_read_bps`, `blkio_config.device_read_iops`,
`blkio_config.device_write_bps`, `blkio_config.device_write_iops`, `devices` and
`volumes` are also treated as mappings where key is the target path inside the
container.
@y
Items under `blkio_config.device_read_bps`, `blkio_config.device_read_iops`,
`blkio_config.device_write_bps`, `blkio_config.device_write_iops`, `devices` and
`volumes` are also treated as mappings where key is the target path inside the
container.
@z

@x
For example, the following input:
@y
For example, the following input:
@z

% snip code...

@x
Produces the following configuration for the `cli` service. Note that the mounted path
now points to the new volume name and `ro` flag was applied.
@y
Produces the following configuration for the `cli` service. Note that the mounted path
now points to the new volume name and `ro` flag was applied.
@z

% snip code...

@x
If the referenced service definition contains `extends` mapping, the items under it
are simply copied into the new merged definition. The merging process is then kicked
off again until no `extends` keys are remaining.
@y
If the referenced service definition contains `extends` mapping, the items under it
are simply copied into the new merged definition. The merging process is then kicked
off again until no `extends` keys are remaining.
@z

@x
For example, the following input:
@y
For example, the following input:
@z

% snip code...

@x
Produces the following configuration for the `cli` service. Here, `cli` services
gets `user` key from `common` service, which in turn gets this key from `base`
service.
@y
Produces the following configuration for the `cli` service. Here, `cli` services
gets `user` key from `common` service, which in turn gets this key from `base`
service.
@z

% snip code...

@x
##### Sequences
@y
##### シーケンス {#sequences}
@z

@x
The following keys should be treated as sequences: `cap_add`, `cap_drop`, `configs`,
`deploy.placement.constraints`, `deploy.placement.preferences`,
`deploy.reservations.generic_resources`, `device_cgroup_rules`, `expose`,
`external_links`, `ports`, `secrets`, `security_opt`.
Any duplicates resulting from the merge are removed so that the sequence only
contains unique elements.
@y
The following keys should be treated as sequences: `cap_add`, `cap_drop`, `configs`,
`deploy.placement.constraints`, `deploy.placement.preferences`,
`deploy.reservations.generic_resources`, `device_cgroup_rules`, `expose`,
`external_links`, `ports`, `secrets`, `security_opt`.
Any duplicates resulting from the merge are removed so that the sequence only
contains unique elements.
@z

@x
For example, the following input:
@y
For example, the following input:
@z

% snip code...

@x
Produces the following configuration for the `cli` service.
@y
Produces the following configuration for the `cli` service.
@z

% snip code...

@x
In case list syntax is used, the following keys should also be treated as sequences:
`dns`, `dns_search`, `env_file`, `tmpfs`. Unlike sequence fields mentioned previously,
duplicates resulting from the merge are not removed.
@y
In case list syntax is used, the following keys should also be treated as sequences:
`dns`, `dns_search`, `env_file`, `tmpfs`. Unlike sequence fields mentioned previously,
duplicates resulting from the merge are not removed.
@z

@x
##### Scalars
@y
##### Scalars
@z

@x
Any other allowed keys in the service definition should be treated as scalars.
@y
Any other allowed keys in the service definition should be treated as scalars.
@z

@x
### `external_links`
@y
### `external_links`
@z

@x
`external_links` link service containers to services managed outside of your Compose application.
`external_links` define the name of an existing service to retrieve using the platform lookup mechanism.
An alias of the form `SERVICE:ALIAS` can be specified.
@y
`external_links` link service containers to services managed outside of your Compose application.
`external_links` define the name of an existing service to retrieve using the platform lookup mechanism.
An alias of the form `SERVICE:ALIAS` can be specified.
@z

% snip code...

@x
### `extra_hosts`
@y
### `extra_hosts`
@z

@x
`extra_hosts` adds hostname mappings to the container network interface configuration (`/etc/hosts` for Linux).
@y
`extra_hosts` adds hostname mappings to the container network interface configuration (`/etc/hosts` for Linux).
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
Short syntax uses plain strings in a list. Values must set hostname and IP address for additional hosts in the form of `HOSTNAME=IP`.
@y
Short syntax uses plain strings in a list. Values must set hostname and IP address for additional hosts in the form of `HOSTNAME=IP`.
@z

% snip code...

@x
IPv6 addresses can be enclosed in square brackets, for example:
@y
IPv6 addresses can be enclosed in square brackets, for example:
@z

% snip code...

@x
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](/manuals/compose/releases/release-notes.md#2241). For example:
@y
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](manuals/compose/releases/release-notes.md#2241). For example:
@z

% snip code...

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
Alternatively, `extra_hosts` can be set as a mapping between hostname(s) and IP(s)
@y
Alternatively, `extra_hosts` can be set as a mapping between hostname(s) and IP(s)
@z

% snip code...

@x
Compose creates a matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` get extra lines:
@y
Compose creates a matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` get extra lines:
@z

% snip code...

@x
### `gpus`
@y
### `gpus`
@z

@x
{{< summary-bar feature_name="Compose gpus" >}}
@y
{{< summary-bar feature_name="Compose gpus" >}}
@z

@x
`gpus` specifies GPU devices to be allocated for container usage. This is equivalent to a [device request](deploy.md#devices) with
an implicit `gpu` capability.
@y
`gpus` specifies GPU devices to be allocated for container usage. This is equivalent to a [device request](deploy.md#devices) with
an implicit `gpu` capability.
@z

% snip code...

@x
`gpus` also can be set as string `all` to allocate all available GPU devices to the container.
@y
`gpus` also can be set as string `all` to allocate all available GPU devices to the container.
@z

% snip code...

@x
### `group_add`
@y
### `group_add`
@z

@x
`group_add` specifies additional groups, by name or number, which the user inside the container must be a member of.
@y
`group_add` specifies additional groups, by name or number, which the user inside the container must be a member of.
@z

@x
An example of where this is useful is when multiple containers (running as different users) need to all read or write
the same file on a shared volume. That file can be owned by a group shared by all the containers, and specified in
`group_add`.
@y
An example of where this is useful is when multiple containers (running as different users) need to all read or write
the same file on a shared volume. That file can be owned by a group shared by all the containers, and specified in
`group_add`.
@z

% snip code...

@x
Running `id` inside the created container must show that the user belongs to the `mail` group, which would not have
been the case if `group_add` were not declared.
@y
Running `id` inside the created container must show that the user belongs to the `mail` group, which would not have
been the case if `group_add` were not declared.
@z

@x
### `healthcheck`
@y
### `healthcheck`
@z

@x
{{% include "compose/services-healthcheck.md" %}}
@y
{{% include "compose/services-healthcheck.md" %}}
@z

@x
For more information on `HEALTHCHECK`, see the [Dockerfile reference](/reference/dockerfile.md#healthcheck).
@y
For more information on `HEALTHCHECK`, see the [Dockerfile reference](reference/dockerfile.md#healthcheck).
@z

% snip code...

@x
`interval`, `timeout`, `start_period`, and `start_interval` are [specified as durations](extension.md#specifying-durations). Introduced in Docker Compose version [2.20.2](/manuals/compose/releases/release-notes.md#2202)
@y
`interval`, `timeout`, `start_period`, and `start_interval` are [specified as durations](extension.md#specifying-durations). Introduced in Docker Compose version [2.20.2](manuals/compose/releases/release-notes.md#2202)
@z

@x
`test` defines the command Compose runs to check container health. It can be
either a string or a list. If it's a list, the first item must be either `NONE`, `CMD` or `CMD-SHELL`.
If it's a string, it's equivalent to specifying `CMD-SHELL` followed by that string.
@y
`test` defines the command Compose runs to check container health. It can be
either a string or a list. If it's a list, the first item must be either `NONE`, `CMD` or `CMD-SHELL`.
If it's a string, it's equivalent to specifying `CMD-SHELL` followed by that string.
@z

@x within code
# Hit the local web app
@y
# Hit the local web app
@z

@x
Using `CMD-SHELL` runs the command configured as a string using the container's default shell
(`/bin/sh` for Linux). Both of the following forms are equivalent:
@y
Using `CMD-SHELL` runs the command configured as a string using the container's default shell
(`/bin/sh` for Linux). Both of the following forms are equivalent:
@z

% snip code...

@x
`NONE` disables the healthcheck, and is mostly useful to disable the Healthcheck Dockerfile instruction set by the service's Docker image. Alternatively,
the healthcheck set by the image can be disabled by setting `disable: true`:
@y
`NONE` disables the healthcheck, and is mostly useful to disable the Healthcheck Dockerfile instruction set by the service's Docker image. Alternatively,
the healthcheck set by the image can be disabled by setting `disable: true`:
@z

% snip code...

@x
### `hostname`
@y
### `hostname`
@z

@x
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@z

@x
### `image`
@y
### `image`
@z

@x
`image` specifies the image to start the container from. `image` must follow the Open Container Specification
[addressable image format](https://github.com/opencontainers/org/blob/master/docs/docs/introduction/digests.md),
as `[<registry>/][<project>/]<image>[:<tag>|@<digest>]`.
@y
`image` specifies the image to start the container from. `image` must follow the Open Container Specification
[addressable image format](https://github.com/opencontainers/org/blob/master/docs/docs/introduction/digests.md),
as `[<registry>/][<project>/]<image>[:<tag>|@<digest>]`.
@z

% snip code...

@x
If the image does not exist on the platform, Compose attempts to pull it based on the `pull_policy`.
If you are also using the [Compose Build Specification](build.md), there are alternative options for controlling the precedence of
pull over building the image from source, however pulling the image is the default behavior.
@y
If the image does not exist on the platform, Compose attempts to pull it based on the `pull_policy`.
If you are also using the [Compose Build Specification](build.md), there are alternative options for controlling the precedence of
pull over building the image from source, however pulling the image is the default behavior.
@z

@x
`image` may be omitted from a Compose file as long as a `build` section is declared. If you are not using the Compose Build Specification, Compose won't work if `image` is missing from the Compose file.
@y
`image` may be omitted from a Compose file as long as a `build` section is declared. If you are not using the Compose Build Specification, Compose won't work if `image` is missing from the Compose file.
@z

@x
### `init`
@y
### `init`
@z

@x
`init` runs an init process (PID 1) inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@y
`init` runs an init process (PID 1) inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@z

% snip code...

@x
The init binary that is used is platform specific.
@y
The init binary that is used is platform specific.
@z

@x
### `ipc`
@y
### `ipc`
@z

@x
`ipc` configures the IPC isolation mode set by the service container.
@y
`ipc` configures the IPC isolation mode set by the service container.
@z

@x
- `shareable`: Gives the container its own private IPC namespace, with a
  possibility to share it with other containers.
- `service:{name}`: Makes the container join another container's
  (`shareable`) IPC namespace.
@y
- `shareable`: Gives the container its own private IPC namespace, with a
  possibility to share it with other containers.
- `service:{name}`: Makes the container join another container's
  (`shareable`) IPC namespace.
@z

% snip code...

@x
### `isolation`
@y
### `isolation`
@z

@x
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@y
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@z

@x
### `labels`
@y
### `labels`
@z

@x
`labels` add metadata to containers. You can use either an array or a map.
@y
`labels` はコンテナーにメタデータを追加します。
配列またはマップ形式のデータを指定できます。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with
those used by other software.
@y
推奨されるのは逆引き DNS 記法を用いることであり、他のソフトウェアが利用するラベルとの衝突を避けることができます。
@z

% snip code...

@x
Compose creates containers with canonical labels:
@y
Compose creates containers with canonical labels:
@z

@x
- `com.docker.compose.project` set on all resources created by Compose to the user project name
- `com.docker.compose.service` set on service containers with service name as defined in the Compose file
@y
- `com.docker.compose.project` set on all resources created by Compose to the user project name
- `com.docker.compose.service` set on service containers with service name as defined in the Compose file
@z

@x
The `com.docker.compose` label prefix is reserved. Specifying labels with this prefix in the Compose file
results in a runtime error.
@y
The `com.docker.compose` label prefix is reserved. Specifying labels with this prefix in the Compose file
results in a runtime error.
@z

@x
### `label_file`
@y
### `label_file`
@z

@x
{{< summary-bar feature_name="Compose label file" >}}
@y
{{< summary-bar feature_name="Compose label file" >}}
@z

@x
The `label_file` attribute lets you load labels for a service from an external file or a list of files. This provides a convenient way to manage multiple labels without cluttering the Compose file.
@y
The `label_file` attribute lets you load labels for a service from an external file or a list of files. This provides a convenient way to manage multiple labels without cluttering the Compose file.
@z

@x
The file uses a key-value format, similar to `env_file`. You can specify multiple files as a list. When using multiple files, they are processed in the order they appear in the list. If the same label is defined in multiple files, the value from the last file in the list overrides earlier ones.
@y
The file uses a key-value format, similar to `env_file`. You can specify multiple files as a list. When using multiple files, they are processed in the order they appear in the list. If the same label is defined in multiple files, the value from the last file in the list overrides earlier ones.
@z

% snip code...

@x
If a label is defined in both the `label_file` and the `labels` attribute, the value in [labels](#labels) takes precedence.
@y
If a label is defined in both the `label_file` and the `labels` attribute, the value in [labels](#labels) takes precedence.
@z

@x
### `links`
@y
### `links`
@z

@x
`links` defines a network link to containers in another service. Either specify both the service name and
a link alias (`SERVICE:ALIAS`), or just the service name.
@y
`links` defines a network link to containers in another service. Either specify both the service name and
a link alias (`SERVICE:ALIAS`), or just the service name.
@z

% snip code...

@x
Containers for the linked service are reachable at a hostname identical to the alias, or the service name
if no alias is specified.
@y
Containers for the linked service are reachable at a hostname identical to the alias, or the service name
if no alias is specified.
@z

@x
Links are not required to enable services to communicate. When no specific network configuration is set,
any service is able to reach any other service at that service’s name on the `default` network.
If services specify the networks they are attached to, `links` does not override the network configuration. Services that are not connected to a shared network are not be able to communicate with each other. Compose doesn't warn you about a configuration mismatch.
@y
Links are not required to enable services to communicate. When no specific network configuration is set,
any service is able to reach any other service at that service’s name on the `default` network.
If services specify the networks they are attached to, `links` does not override the network configuration. Services that are not connected to a shared network are not be able to communicate with each other. Compose doesn't warn you about a configuration mismatch.
@z

@x
Links also express implicit dependency between services in the same way as
[`depends_on`](#depends_on), so they determine the order of service startup.
@y
Links also express implicit dependency between services in the same way as
[`depends_on`](#depends_on), so they determine the order of service startup.
@z

@x
### `logging`
@y
### `logging`
@z

@x
`logging` defines the logging configuration for the service.
@y
`logging` defines the logging configuration for the service.
@z

% snip code...

@x
The `driver` name specifies a logging driver for the service's containers. The default and available values
are platform specific. Driver specific options can be set with `options` as key-value pairs.
@y
The `driver` name specifies a logging driver for the service's containers. The default and available values
are platform specific. Driver specific options can be set with `options` as key-value pairs.
@z

@x
### `mac_address`
@y
### `mac_address`
@z

@x
> Available with Docker Compose version 2.24.0 and later.
@y
> Available with Docker Compose version 2.24.0 and later.
@z

@x
`mac_address` sets a Mac address for the service container.
@y
`mac_address` sets a Mac address for the service container.
@z

@x
> [!NOTE]
> Container runtimes might reject this value, for example Docker Engine >= v25.0. In that case, you should use [networks.mac_address](#mac_address) instead.
@y
> [!NOTE]
> Container runtimes might reject this value, for example Docker Engine >= v25.0. In that case, you should use [networks.mac_address](#mac_address) instead.
@z

@x
### `mem_limit`
@y
### `mem_limit`
@z

@x
`mem_limit` configures a limit on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`mem_limit` configures a limit on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
When set, `mem_limit` must be consistent with the `limits.memory` attribute in the [Deploy Specification](deploy.md#memory).
@y
When set, `mem_limit` must be consistent with the `limits.memory` attribute in the [Deploy Specification](deploy.md#memory).
@z

@x
### `mem_reservation`
@y
### `mem_reservation`
@z

@x
`mem_reservation` configures a reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`mem_reservation` configures a reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
When set, `mem_reservation` must be consistent with the `reservations.memory` attribute in the [Deploy Specification](deploy.md#memory).
@y
When set, `mem_reservation` must be consistent with the `reservations.memory` attribute in the [Deploy Specification](deploy.md#memory).
@z

@x
### `mem_swappiness`
@y
### `mem_swappiness`
@z

@x
`mem_swappiness` defines as a percentage, a value between 0 and 100, for the host kernel to swap out
anonymous memory pages used by a container.
@y
`mem_swappiness` defines as a percentage, a value between 0 and 100, for the host kernel to swap out
anonymous memory pages used by a container.
@z

@x
- `0`: Turns off anonymous page swapping.
- `100`: Sets all anonymous pages as swappable.
@y
- `0`: Turns off anonymous page swapping.
- `100`: Sets all anonymous pages as swappable.
@z

@x
The default value is platform specific.
@y
The default value is platform specific.
@z

@x
### `memswap_limit`
@y
### `memswap_limit`
@z

@x
`memswap_limit` defines the amount of memory the container is allowed to swap to disk. This is a modifier
attribute that only has meaning if [`memory`](deploy.md#memory) is also set. Using swap lets the container write excess
memory requirements to disk when the container has exhausted all the memory that is available to it.
There is a performance penalty for applications that swap memory to disk often.
@y
`memswap_limit` defines the amount of memory the container is allowed to swap to disk. This is a modifier
attribute that only has meaning if [`memory`](deploy.md#memory) is also set. Using swap lets the container write excess
memory requirements to disk when the container has exhausted all the memory that is available to it.
There is a performance penalty for applications that swap memory to disk often.
@z

@x
- If `memswap_limit` is set to a positive integer, then both `memory` and `memswap_limit` must be set. `memswap_limit` represents the total amount of memory and swap that can be used, and `memory` controls the amount used by non-swap memory. So if `memory`="300m" and `memswap_limit`="1g", the container can use 300m of memory and 700m (1g - 300m) swap.
- If `memswap_limit` is set to 0, the setting is ignored, and the value is treated as unset.
- If `memswap_limit` is set to the same value as `memory`, and `memory` is set to a positive integer, the container does not have access to swap.
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host container has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@y
- If `memswap_limit` is set to a positive integer, then both `memory` and `memswap_limit` must be set. `memswap_limit` represents the total amount of memory and swap that can be used, and `memory` controls the amount used by non-swap memory. So if `memory`="300m" and `memswap_limit`="1g", the container can use 300m of memory and 700m (1g - 300m) swap.
- If `memswap_limit` is set to 0, the setting is ignored, and the value is treated as unset.
- If `memswap_limit` is set to the same value as `memory`, and `memory` is set to a positive integer, the container does not have access to swap.
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host container has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@z

@x
### `models`
@y
### `models`
@z

@x
{{< summary-bar feature_name="Compose models" >}}
@y
{{< summary-bar feature_name="Compose models" >}}
@z

@x
`models` defines which AI models the service should use at runtime. Each referenced model must be defined under the [`models` top-level element](models.md).
@y
`models` defines which AI models the service should use at runtime. Each referenced model must be defined under the [`models` top-level element](models.md).
@z

% snip code...

@x
When a service is linked to a model, Docker Compose injects environment variables to pass connection details and model identifiers to the container. This allows the application to locate and communicate with the model dynamically at runtime, without hard-coding values.
@y
When a service is linked to a model, Docker Compose injects environment variables to pass connection details and model identifiers to the container. This allows the application to locate and communicate with the model dynamically at runtime, without hard-coding values.
@z

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long syntax gives you more control over the environment variable names.
@y
The long syntax gives you more control over the environment variable names.
@z

@x
- `endpoint_var` sets the name of the environment variable that holds the model runner’s URL.
- `model_var` sets the name of the environment variable that holds the model identifier.
@y
- `endpoint_var` sets the name of the environment variable that holds the model runner’s URL.
- `model_var` sets the name of the environment variable that holds the model identifier.
@z

@x
If either is omitted, Compose automatically generates the environment variable names based on the model key using the following rules:
@y
If either is omitted, Compose automatically generates the environment variable names based on the model key using the following rules:
@z

@x
 - Convert the model key to uppercase
 - Replace any '-' characters with '_'
 - Append `_URL` for the endpoint variable
@y
 - Convert the model key to uppercase
 - Replace any '-' characters with '_'
 - Append `_URL` for the endpoint variable
@z

@x
### `network_mode`
@y
### `network_mode`
@z

@x
`network_mode` sets a service container's network mode.
@y
`network_mode` sets a service container's network mode.
@z

@x
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the container access to the specified container by referring to its service name.
- `container:{name}`: Gives the container access to the specified container by referring to its container ID.
@y
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the container access to the specified container by referring to its service name.
- `container:{name}`: Gives the container access to the specified container by referring to its container ID.
@z

@x
For more information container networks, see the [Docker Engine documentation](/manuals/engine/network/_index.md#container-networks).
@y
For more information container networks, see the [Docker Engine documentation](manuals/engine/network/_index.md#container-networks).
@z

% snip code...

@x
When set, the [`networks`](#networks) attribute is not allowed and Compose rejects any
Compose file containing both attributes.
@y
When set, the [`networks`](#networks) attribute is not allowed and Compose rejects any
Compose file containing both attributes.
@z

@x
### `networks`
@y
### `networks`
@z

@x
{{% include "compose/services-networks.md" %}}
@y
{{% include "compose/services-networks.md" %}}
@z

% snip code...

@x
For more information about the `networks` top-level element, see [Networks](networks.md).
@y
For more information about the `networks` top-level element, see [Networks](networks.md).
@z

@x
#### Implicit default network
@y
#### Implicit default network
@z

@x
If `networks` is empty or absent from the Compose file, Compose considers an implicit definition for the service to be
connected to the `default` network:
@y
If `networks` is empty or absent from the Compose file, Compose considers an implicit definition for the service to be
connected to the `default` network:
@z

% snip code...

@x
This example is actually equivalent to:
@y
This example is actually equivalent to:
@z

% snip code...

@x
If you want the service to not be connected a network, you must set [`network_mode: none`](#network_mode).
@y
If you want the service to not be connected a network, you must set [`network_mode: none`](#network_mode).
@z

@x
#### `aliases`
@y
#### `aliases`
@z

@x
`aliases` declares alternative hostnames for the service on the network. Other containers on the same
network can use either the service name or an alias to connect to one of the service's containers.
@y
`aliases` declares alternative hostnames for the service on the network. Other containers on the same
network can use either the service name or an alias to connect to one of the service's containers.
@z

@x
Since `aliases` are network-scoped, the same service can have different aliases on different networks.
@y
Since `aliases` are network-scoped, the same service can have different aliases on different networks.
@z

@x
> [!NOTE]
> A network-wide alias can be shared by multiple containers, and even by multiple services.
> If it is, then exactly which container the name resolves to is not guaranteed.
@y
> [!NOTE]
> A network-wide alias can be shared by multiple containers, and even by multiple services.
> If it is, then exactly which container the name resolves to is not guaranteed.
@z

% snip code...

@x
In the following example, service `frontend` is able to reach the `backend` service at
the hostname `backend` or `database` on the `back-tier` network. The service `monitoring`
is able to reach same `backend` service at `backend` or `mysql` on the `admin` network.
@y
In the following example, service `frontend` is able to reach the `backend` service at
the hostname `backend` or `database` on the `back-tier` network. The service `monitoring`
is able to reach same `backend` service at `backend` or `mysql` on the `admin` network.
@z

% snip code...

@x
#### `interface_name`
@y
#### `interface_name`
@z

@x
{{< summary-bar feature_name="Compose interface-name" >}}
@y
{{< summary-bar feature_name="Compose interface-name" >}}
@z

@x
`interface_name` lets you specify the name of the network interface used to connect a service to a given network. This ensures consistent and predictable interface naming across services and networks.
@y
`interface_name` lets you specify the name of the network interface used to connect a service to a given network. This ensures consistent and predictable interface naming across services and networks.
@z

% snip code...

@x
Running the example Compose application shows:
@y
Running the example Compose application shows:
@z

% snip output...

@x
#### `ipv4_address`, `ipv6_address`
@y
#### `ipv4_address`, `ipv6_address`
@z

@x
Specify a static IP address for a service container when joining the network.
@y
Specify a static IP address for a service container when joining the network.
@z

@x
The corresponding network configuration in the [top-level networks section](networks.md) must have an
`ipam` attribute with subnet configurations covering each static address.
@y
The corresponding network configuration in the [top-level networks section](networks.md) must have an
`ipam` attribute with subnet configurations covering each static address.
@z

% snip code...

@x
#### `link_local_ips`
@y
#### `link_local_ips`
@z

@x
`link_local_ips` specifies a list of link-local IPs. Link-local IPs are special IPs which belong to a well
known subnet and are purely managed by the operator, usually dependent on the architecture where they are
deployed.
@y
`link_local_ips` specifies a list of link-local IPs. Link-local IPs are special IPs which belong to a well
known subnet and are purely managed by the operator, usually dependent on the architecture where they are
deployed.
@z

@x
Example:
@y
Example:
@z

% snip code...

@x
#### `mac_address`
@y
#### `mac_address`
@z

@x
{{< summary-bar feature_name="Compose mac address" >}}
@y
{{< summary-bar feature_name="Compose mac address" >}}
@z

@x
`mac_address` sets the Mac address used by the service container when connecting to this particular network.
@y
`mac_address` sets the Mac address used by the service container when connecting to this particular network.
@z

@x
#### `driver_opts`
@y
#### `driver_opts`
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent. Consult the driver's documentation for more information.
@y
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent. Consult the driver's documentation for more information.
@z

% snip code...

@x
#### `gw_priority`
@y
#### `gw_priority`
@z

@x
{{< summary-bar feature_name="Compose gw priority" >}}
@y
{{< summary-bar feature_name="Compose gw priority" >}}
@z

@x
The network with the highest `gw_priority` is selected as the default gateway for the service container.
If unspecified, the default value is 0.
@y
The network with the highest `gw_priority` is selected as the default gateway for the service container.
If unspecified, the default value is 0.
@z

@x
In the following example, `app_net_2` will be selected as the default gateway.
@y
In the following example, `app_net_2` will be selected as the default gateway.
@z

% snip code...

@x
#### `priority`
@y
#### `priority`
@z

@x
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@y
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@z

@x
If the container runtime accepts a `mac_address` attribute at service level, it is
applied to the network with the highest `priority`. In other cases, use attribute
`networks.mac_address`.
@y
If the container runtime accepts a `mac_address` attribute at service level, it is
applied to the network with the highest `priority`. In other cases, use attribute
`networks.mac_address`.
@z

@x
`priority` does not affect which network is selected as the default gateway. Use the
[`gw_priority`](#gw_priority) attribute instead.
@y
`priority` does not affect which network is selected as the default gateway. Use the
[`gw_priority`](#gw_priority) attribute instead.
@z

@x
`priority` does not control the order in which networks connections are added to
the container, it cannot be used to determine the device name (`eth0` etc.) in the
container.
@y
`priority` does not control the order in which networks connections are added to
the container, it cannot be used to determine the device name (`eth0` etc.) in the
container.
@z

% snip code...

@x
### `oom_kill_disable`
@y
### `oom_kill_disable`
@z

@x
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@y
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@z

@x
### `oom_score_adj`
@y
### `oom_score_adj`
@z

@x
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@y
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@z

@x
### `pid`
@y
### `pid`
@z

@x
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@y
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@z

@x
### `pids_limit`
@y
### `pids_limit`
@z

@x
`pids_limit` tunes a container’s PIDs limit. Set to -1 for unlimited PIDs.
@y
`pids_limit` tunes a container’s PIDs limit. Set to -1 for unlimited PIDs.
@z

% snip code...

@x
When set, `pids_limit` must be consistent with the `pids` attribute in the [Deploy Specification](deploy.md#pids).
@y
When set, `pids_limit` must be consistent with the `pids` attribute in the [Deploy Specification](deploy.md#pids).
@z

@x
### `platform`
@y
### `platform`
@z

@x
`platform` defines the target platform the containers for the service run on. It uses the `os[/arch[/variant]]` syntax.
@y
`platform` defines the target platform the containers for the service run on. It uses the `os[/arch[/variant]]` syntax.
@z

@x
The values of `os`, `arch`, and `variant` must conform to the convention used by the [OCI Image Spec](https://github.com/opencontainers/image-spec/blob/v1.0.2/image-index.md).
@y
The values of `os`, `arch`, and `variant` must conform to the convention used by the [OCI Image Spec](https://github.com/opencontainers/image-spec/blob/v1.0.2/image-index.md).
@z

@x
Compose uses this attribute to determine which version of the image is pulled
and/or on which platform the service’s build is performed.
@y
Compose uses this attribute to determine which version of the image is pulled
and/or on which platform the service’s build is performed.
@z

% snip code...

@x
### `ports`
@y
### `ports`
@z

@x
{{% include "compose/services-ports.md" %}}
@y
{{% include "compose/services-ports.md" %}}
@z

@x
> [!NOTE]
>
> Port mapping must not be used with `network_mode: host`. Doing so causes a runtime error because `network_mode: host` already exposes container ports directly to the host network, so port mapping isn’t needed.
@y
> [!NOTE]
>
> Port mapping must not be used with `network_mode: host`. Doing so causes a runtime error because `network_mode: host` already exposes container ports directly to the host network, so port mapping isn’t needed.
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
The short syntax is a colon-separated string to set the host IP, host port, and container port
in the form:
@y
The short syntax is a colon-separated string to set the host IP, host port, and container port
in the form:
@z

@x
`[HOST:]CONTAINER[/PROTOCOL]` where:
@y
`[HOST:]CONTAINER[/PROTOCOL]` where:
@z

@x
- `HOST` is `[IP:](port | range)` (optional). If it is not set, it binds to all network interfaces (`0.0.0.0`).
- `CONTAINER` is `port | range`.
- `PROTOCOL` restricts ports to a specified protocol either `tcp` or `udp`(optional). Default is `tcp`.
@y
- `HOST` is `[IP:](port | range)` (optional). If it is not set, it binds to all network interfaces (`0.0.0.0`).
- `CONTAINER` is `port | range`.
- `PROTOCOL` restricts ports to a specified protocol either `tcp` or `udp`(optional). Default is `tcp`.
@z

@x
Ports can be either a single value or a range. `HOST` and `CONTAINER` must use equivalent ranges.
@y
Ports can be either a single value or a range. `HOST` and `CONTAINER` must use equivalent ranges.
@z

@x
You can either specify both ports (`HOST:CONTAINER`), or just the container port. In the latter case,
the container runtime automatically allocates any unassigned port of the host.
@y
You can either specify both ports (`HOST:CONTAINER`), or just the container port. In the latter case,
the container runtime automatically allocates any unassigned port of the host.
@z

@x
`HOST:CONTAINER` should always be specified as a (quoted) string, to avoid conflicts
with [YAML base-60 float](https://yaml.org/type/float.html).
@y
`HOST:CONTAINER` should always be specified as a (quoted) string, to avoid conflicts
with [YAML base-60 float](https://yaml.org/type/float.html).
@z

@x
IPv6 addresses can be enclosed in square brackets.
@y
IPv6 addresses can be enclosed in square brackets.
@z

@x
Examples:
@y
Examples:
@z

% snip code...

@x
> [!NOTE]
>
> If host IP mapping is not supported by a container engine, Compose rejects
> the Compose file and ignores the specified host IP.
@y
> [!NOTE]
>
> If host IP mapping is not supported by a container engine, Compose rejects
> the Compose file and ignores the specified host IP.
@z

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@y
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@z

@x
- `target`: The container port.
- `published`: The publicly exposed port. It is defined as a string and can be set as a range using syntax `start-end`. It means the actual port is assigned a remaining available port, within the set range.
- `host_ip`: The host IP mapping. If it is not set, it binds to all network interfaces (`0.0.0.0`).
- `protocol`: The port protocol (`tcp` or `udp`). Defaults to `tcp`.
- `app_protocol`: The application protocol (TCP/IP level 4 / OSI level 7) this port is used for. This is optional and can be used as a hint for Compose to offer richer behavior for protocols that it understands. Introduced in Docker Compose version [2.26.0](/manuals/compose/releases/release-notes.md#2260).
- `mode`: Specifies how the port is published in a Swarm setup. If set to `host`, it publishes the port on every node in Swarm. If set to `ingress`, it allows load balancing across the nodes in Swarm. Defaults to `ingress`.
- `name`: A human-readable name for the port, used to document its usage within the service.
@y
- `target`: The container port.
- `published`: The publicly exposed port. It is defined as a string and can be set as a range using syntax `start-end`. It means the actual port is assigned a remaining available port, within the set range.
- `host_ip`: The host IP mapping. If it is not set, it binds to all network interfaces (`0.0.0.0`).
- `protocol`: The port protocol (`tcp` or `udp`). Defaults to `tcp`.
- `app_protocol`: The application protocol (TCP/IP level 4 / OSI level 7) this port is used for. This is optional and can be used as a hint for Compose to offer richer behavior for protocols that it understands. Introduced in Docker Compose version [2.26.0](manuals/compose/releases/release-notes.md#2260).
- `mode`: Specifies how the port is published in a Swarm setup. If set to `host`, it publishes the port on every node in Swarm. If set to `ingress`, it allows load balancing across the nodes in Swarm. Defaults to `ingress`.
- `name`: A human-readable name for the port, used to document its usage within the service.
@z

% snip code...

@x
### `post_start`
@y
### `post_start`
@z

@x
{{< summary-bar feature_name="Compose post start" >}}
@y
{{< summary-bar feature_name="Compose post start" >}}
@z

@x
`post_start` defines a sequence of lifecycle hooks to run after a container has started. The exact timing of when the command is run is not guaranteed.
@y
`post_start` defines a sequence of lifecycle hooks to run after a container has started. The exact timing of when the command is run is not guaranteed.
@z

@x
- `command`: Specifies the command to run once the container starts. This attribute is required, and you can choose to use either the shell form or the exec form.
- `user`: The user to run the command. If not set, the command is run with the same user as the main service command.
- `privileged`: Lets the `post_start` command run with privileged access.
- `working_dir`: The working directory in which to run the command. If not set, it is run in the same working directory as the main service command.
- `environment`: Sets environment variables specifically for the `post_start` command. While the command inherits the environment variables defined for the service’s main command, this section lets you add new variables or override existing ones.
@y
- `command`: Specifies the command to run once the container starts. This attribute is required, and you can choose to use either the shell form or the exec form.
- `user`: The user to run the command. If not set, the command is run with the same user as the main service command.
- `privileged`: Lets the `post_start` command run with privileged access.
- `working_dir`: The working directory in which to run the command. If not set, it is run in the same working directory as the main service command.
- `environment`: Sets environment variables specifically for the `post_start` command. While the command inherits the environment variables defined for the service’s main command, this section lets you add new variables or override existing ones.
@z

% snip code...

@x
For more information, see [Use lifecycle hooks](/manuals/compose/how-tos/lifecycle.md).
@y
For more information, see [Use lifecycle hooks](manuals/compose/how-tos/lifecycle.md).
@z

@x
### `pre_stop`
@y
### `pre_stop`
@z

@x
{{< summary-bar feature_name="Compose pre stop" >}}
@y
{{< summary-bar feature_name="Compose pre stop" >}}
@z

@x
`pre_stop` defines a sequence of lifecycle hooks to run before the container is stopped. These hooks won't run if the container stops by itself or is terminated suddenly.
@y
`pre_stop` defines a sequence of lifecycle hooks to run before the container is stopped. These hooks won't run if the container stops by itself or is terminated suddenly.
@z

@x
Configuration is equivalent to [post_start](#post_start).
@y
Configuration is equivalent to [post_start](#post_start).
@z

@x
### `privileged`
@y
### `privileged`
@z

@x
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@y
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@z

@x
### `profiles`
@y
### `profiles`
@z

@x
`profiles` defines a list of named profiles for the service to be enabled under. If unassigned, the service is always started but if assigned, it is only started if the profile is activated.
@y
`profiles` defines a list of named profiles for the service to be enabled under. If unassigned, the service is always started but if assigned, it is only started if the profile is activated.
@z

@x
If present, `profiles` follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
If present, `profiles` follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@z

% snip code...

@x
### `provider`
@y
### `provider`
@z

@x
{{< summary-bar feature_name="Compose provider services" >}}
@y
{{< summary-bar feature_name="Compose provider services" >}}
@z

@x
`provider` can be used to define a service that Compose won't manage directly. Compose delegated the service lifecycle to a dedicated or third-party component.
@y
`provider` can be used to define a service that Compose won't manage directly. Compose delegated the service lifecycle to a dedicated or third-party component.
@z

% snip code...

@x
As Compose runs the application, the `awesomecloud` binary is used to manage the `database` service setup.
Dependent service `app` receives additional environment variables prefixed by the service name so it can access the resource.
@y
As Compose runs the application, the `awesomecloud` binary is used to manage the `database` service setup.
Dependent service `app` receives additional environment variables prefixed by the service name so it can access the resource.
@z

@x
For illustration, assuming `awesomecloud` execution produced variables `URL` and `API_KEY`, the `app` service
runs with environment variables `DATABASE_URL` and `DATABASE_API_KEY`.
@y
For illustration, assuming `awesomecloud` execution produced variables `URL` and `API_KEY`, the `app` service
runs with environment variables `DATABASE_URL` and `DATABASE_API_KEY`.
@z

@x
As Compose stops the application, the `awesomecloud` binary is used to manage the `database` service tear down.
@y
As Compose stops the application, the `awesomecloud` binary is used to manage the `database` service tear down.
@z

@x
The mechanism used by Compose to delegate the service lifecycle to an external binary is described [here](https://github.com/docker/compose/tree/main/docs/extension.md).
@y
The mechanism used by Compose to delegate the service lifecycle to an external binary is described [here](https://github.com/docker/compose/tree/main/docs/extension.md).
@z

@x
For more information on using the `provider` attribute, see [Use provider services](/manuals/compose/how-tos/provider-services.md).
@y
For more information on using the `provider` attribute, see [Use provider services](manuals/compose/how-tos/provider-services.md).
@z

@x
#### `type`
@y
#### `type`
@z

@x
`type` attribute is required. It defines the external component used by Compose to manage setup and tear down lifecycle
events.
@y
`type` attribute is required. It defines the external component used by Compose to manage setup and tear down lifecycle
events.
@z

@x
#### `options`
@y
#### `options`
@z

@x
`options` are specific to the selected provider and not validated by the compose specification
@y
`options` are specific to the selected provider and not validated by the compose specification
@z

@x
### `pull_policy`
@y
### `pull_policy`
@z

@x
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@y
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@z

@x
- `always`: Compose always pulls the image from the registry.
- `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
- `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility. The `latest` tag is always pulled even when the `missing` pull policy is used.
- `build`: Compose builds the image. Compose rebuilds the image if it's already present.
- `daily`: Compose checks the registry for image updates if the last pull took place more than 24 hours ago.
- `weekly`: Compose checks the registry for image updates if the last pull took place more than 7 days ago.
- `every_<duration>`: Compose checks the registry for image updates if the last pull took place before `<duration>`. Duration can be expressed in weeks (`w`), days (`d`), hours (`h`), minutes (`m`), seconds (`s`) or a combination of these.
@y
- `always`: Compose always pulls the image from the registry.
- `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
- `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility. The `latest` tag is always pulled even when the `missing` pull policy is used.
- `build`: Compose builds the image. Compose rebuilds the image if it's already present.
- `daily`: Compose checks the registry for image updates if the last pull took place more than 24 hours ago.
- `weekly`: Compose checks the registry for image updates if the last pull took place more than 7 days ago.
- `every_<duration>`: Compose checks the registry for image updates if the last pull took place before `<duration>`. Duration can be expressed in weeks (`w`), days (`d`), hours (`h`), minutes (`m`), seconds (`s`) or a combination of these.
@z

% snip code...

@x
### `read_only`
@y
### `read_only`
@z

@x
`read_only` configures the service container to be created with a read-only filesystem.
@y
`read_only` configures the service container to be created with a read-only filesystem.
@z

@x
### `restart`
@y
### `restart`
@z

@x
`restart` defines the policy that the platform applies on container termination.
@y
`restart` defines the policy that the platform applies on container termination.
@z

@x
- `no`: The default restart policy. It does not restart the container under any circumstances.
- `always`: The policy always restarts the container until its removal.
- `on-failure[:max-retries]`: The policy restarts the container if the exit code indicates an error.
Optionally, limit the number of restart retries the Docker daemon attempts.
- `unless-stopped`: The policy restarts the container irrespective of the exit code but stops
  restarting when the service is stopped or removed.
@y
- `no`: The default restart policy. It does not restart the container under any circumstances.
- `always`: The policy always restarts the container until its removal.
- `on-failure[:max-retries]`: The policy restarts the container if the exit code indicates an error.
Optionally, limit the number of restart retries the Docker daemon attempts.
- `unless-stopped`: The policy restarts the container irrespective of the exit code but stops
  restarting when the service is stopped or removed.
@z

% snip code...

@x
You can find more detailed information on restart policies in the
[Restart Policies (--restart)](/reference/cli/docker/container/run.md#restart)
section of the Docker run reference page.
@y
You can find more detailed information on restart policies in the
[Restart Policies (--restart)](reference/cli/docker/container/run.md#restart)
section of the Docker run reference page.
@z

@x
### `runtime`
@y
### `runtime`
@z

@x
`runtime` specifies which runtime to use for the service’s containers.
@y
`runtime` specifies which runtime to use for the service’s containers.
@z

@x
For example, `runtime` can be the name of [an implementation of OCI Runtime Spec](https://github.com/opencontainers/runtime-spec/blob/master/implementations.md), such as "runc".
@y
For example, `runtime` can be the name of [an implementation of OCI Runtime Spec](https://github.com/opencontainers/runtime-spec/blob/master/implementations.md), such as "runc".
@z

% snip code...

@x
The default is `runc`. To use a different runtime, see [Alternative runtimes](/manuals/engine/daemon/alternative-runtimes.md).
@y
The default is `runc`. To use a different runtime, see [Alternative runtimes](manuals/engine/daemon/alternative-runtimes.md).
@z

@x
### `scale`
@y
### `scale`
@z

@x
`scale` specifies the default number of containers to deploy for this service.
When both are set, `scale` must be consistent with the `replicas` attribute in the [Deploy Specification](deploy.md#replicas).
@y
`scale` specifies the default number of containers to deploy for this service.
When both are set, `scale` must be consistent with the `replicas` attribute in the [Deploy Specification](deploy.md#replicas).
@z

@x
### `secrets`
@y
### `secrets`
@z

@x
{{% include "compose/services-secrets.md" %}}
@y
{{% include "compose/services-secrets.md" %}}
@z

@x
Two different syntax variants are supported; the short syntax and the long syntax. Long and short syntax for secrets may be used in the same Compose file.
@y
Two different syntax variants are supported; the short syntax and the long syntax. Long and short syntax for secrets may be used in the same Compose file.
@z

@x
Compose reports an error if the secret doesn't exist on the platform or isn't defined in the
[`secrets` top-level section](secrets.md) of the Compose file.
@y
Compose reports an error if the secret doesn't exist on the platform or isn't defined in the
[`secrets` top-level section](secrets.md) of the Compose file.
@z

@x
Defining a secret in the top-level `secrets` must not imply granting any service access to it.
Such grant must be explicit within service specification as [secrets](secrets.md) service element.
@y
Defining a secret in the top-level `secrets` must not imply granting any service access to it.
Such grant must be explicit within service specification as [secrets](secrets.md) service element.
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@y
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@z

@x
The following example uses the short syntax to grant the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@y
The following example uses the short syntax to grant the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@z

% snip code...

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long syntax provides more granularity in how the secret is created within
the service's containers.
@y
The long syntax provides more granularity in how the secret is created within
the service's containers.
@z

@x
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task container, or absolute path of the file if an alternate location is required. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric uid or gid that owns the file within
  `/run/secrets/` in the service's task containers. Default value is `USER`.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@y
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task container, or absolute path of the file if an alternate location is required. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric uid or gid that owns the file within
  `/run/secrets/` in the service's task containers. Default value is `USER`.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@z

@x
Note that support for `uid`, `gid`, and `mode` attributes are not implemented in Docker Compose when the source of the secret is a [`file`](secrets.md). This is because bind-mounts used under the hood don't allow uid remapping.
@y
Note that support for `uid`, `gid`, and `mode` attributes are not implemented in Docker Compose when the source of the secret is a [`file`](secrets.md). This is because bind-mounts used under the hood don't allow uid remapping.
@z

@x
The following example sets the name of the `server-certificate` secret file to `server.cert`
within the container, sets the mode to `0440` (group-readable), and sets the user and group
to `103`. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@y
The following example sets the name of the `server-certificate` secret file to `server.cert`
within the container, sets the mode to `0440` (group-readable), and sets the user and group
to `103`. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@z

% snip code...

@x
### `security_opt`
@y
### `security_opt`
@z

@x
`security_opt` overrides the default labeling scheme for each container.
@y
`security_opt` overrides the default labeling scheme for each container.
@z

% snip code...

@x
For further default labeling schemes you can override, see [Security configuration](/reference/cli/docker/container/run.md#security-opt).
@y
For further default labeling schemes you can override, see [Security configuration](reference/cli/docker/container/run.md#security-opt).
@z

@x
### `shm_size`
@y
### `shm_size`
@z

@x
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@y
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@z

@x
### `stdin_open`
@y
### `stdin_open`
@z

@x
`stdin_open` configures a service's container to run with an allocated stdin. This is the same as running a container with the
`-i` flag. For more information, see [Keep stdin open](/reference/cli/docker/container/run.md#interactive).
@y
`stdin_open` configures a service's container to run with an allocated stdin. This is the same as running a container with the
`-i` flag. For more information, see [Keep stdin open](reference/cli/docker/container/run.md#interactive).
@z

@x
Supported values are `true` or `false`.
@y
Supported values are `true` or `false`.
@z

@x
### `stop_grace_period`
@y
### `stop_grace_period`
@z

@x
`stop_grace_period` specifies how long Compose must wait when attempting to stop a container if it doesn't
handle SIGTERM (or whichever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. It's specified
as a [duration](extension.md#specifying-durations).
@y
`stop_grace_period` specifies how long Compose must wait when attempting to stop a container if it doesn't
handle SIGTERM (or whichever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. It's specified
as a [duration](extension.md#specifying-durations).
@z

% snip code...

@x
Default value is 10 seconds for the container to exit before sending SIGKILL.
@y
Default value is 10 seconds for the container to exit before sending SIGKILL.
@z

@x
### `stop_signal`
@y
### `stop_signal`
@z

@x
`stop_signal` defines the signal that Compose uses to stop the service containers.
If unset containers are stopped by Compose by sending `SIGTERM`.
@y
`stop_signal` defines the signal that Compose uses to stop the service containers.
If unset containers are stopped by Compose by sending `SIGTERM`.
@z

% snip code...

@x
### `storage_opt`
@y
### `storage_opt`
@z

@x
`storage_opt` defines storage driver options for a service.
@y
`storage_opt` defines storage driver options for a service.
@z

% snip code...

@x
### `sysctls`
@y
### `sysctls`
@z

@x
`sysctls` defines kernel parameters to set in the container. `sysctls` can use either an array or a map.
@y
`sysctls` defines kernel parameters to set in the container. `sysctls` can use either an array or a map.
@z

% snip code...

@x
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to [configure namespaced kernel
parameters (sysctls) at runtime](/reference/cli/docker/container/run.md#sysctl).
@y
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to [configure namespaced kernel
parameters (sysctls) at runtime](reference/cli/docker/container/run.md#sysctl).
@z

@x
### `tmpfs`
@y
### `tmpfs`
@z

@x
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@y
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@z

% snip code...

@x
- `path`: The path inside the container where the tmpfs will be mounted.
- `options`: Comma-separated list of options for the tmpfs mount.
@y
- `path`: The path inside the container where the tmpfs will be mounted.
- `options`: Comma-separated list of options for the tmpfs mount.
@z

@x
Available options:
@y
Available options:
@z

@x
- `mode`: Sets the file system permissions.
- `uid`: Sets the user ID that owns the mounted tmpfs.
- `gid`: Sets the group ID that owns the mounted tmpfs.
@y
- `mode`: Sets the file system permissions.
- `uid`: Sets the user ID that owns the mounted tmpfs.
- `gid`: Sets the group ID that owns the mounted tmpfs.
@z

% snip code...

@x
### `tty`
@y
### `tty`
@z

@x
`tty` configures a service's container to run with a TTY. This is the same as running a container with the
`-t` or `--tty` flag. For more information, see [Allocate a pseudo-TTY](/reference/cli/docker/container/run.md#tty).
@y
`tty` configures a service's container to run with a TTY. This is the same as running a container with the
`-t` or `--tty` flag. For more information, see [Allocate a pseudo-TTY](reference/cli/docker/container/run.md#tty).
@z

@x
Supported values are `true` or `false`.
@y
Supported values are `true` or `false`.
@z

@x
### `ulimits`
@y
### `ulimits`
@z

@x
`ulimits` overrides the default `ulimits` for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@y
`ulimits` overrides the default `ulimits` for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@z

% snip code...

@x
### `use_api_socket`
@y
### `use_api_socket`
@z

@x
When `use_api_socket` is set, the container is able to interact with the underlying container engine through the API socket.
Your credentials are mounted inside the container so the container acts as a pure delegate for your commands relating to the container engine.
Typically, commands ran by container can `pull` and `push` to your registry.
@y
When `use_api_socket` is set, the container is able to interact with the underlying container engine through the API socket.
Your credentials are mounted inside the container so the container acts as a pure delegate for your commands relating to the container engine.
Typically, commands ran by container can `pull` and `push` to your registry.
@z

@x
### `user`
@y
### `user`
@z

@x
`user` overrides the user used to run the container process. The default is set by the image, for example Dockerfile `USER`. If it's not set, then `root`.
@y
`user` overrides the user used to run the container process. The default is set by the image, for example Dockerfile `USER`. If it's not set, then `root`.
@z

@x
### `userns_mode`
@y
### `userns_mode`
@z

@x
`userns_mode` sets the user namespace for the service. Supported values are platform specific and may depend
on platform configuration.
@y
`userns_mode` sets the user namespace for the service. Supported values are platform specific and may depend
on platform configuration.
@z

% snip code...

@x
### `uts`
@y
### `uts`
@z

@x
{{< summary-bar feature_name="Compose uts" >}}
@y
{{< summary-bar feature_name="Compose uts" >}}
@z

@x
`uts` configures the UTS namespace mode set for the service container. When unspecified
it is the runtime's decision to assign a UTS namespace, if supported. Available values are:
@y
`uts` configures the UTS namespace mode set for the service container. When unspecified
it is the runtime's decision to assign a UTS namespace, if supported. Available values are:
@z

@x
- `'host'`: Results in the container using the same UTS namespace as the host.
@y
- `'host'`: Results in the container using the same UTS namespace as the host.
@z

% snip code...

@x
### `volumes`
@y
### `volumes`
@z

@x
{{% include "compose/services-volumes.md" %}}
@y
{{% include "compose/services-volumes.md" %}}
@z

@x
The following example shows a named volume (`db-data`) being used by the `backend` service,
and a bind mount defined for a single service.
@y
The following example shows a named volume (`db-data`) being used by the `backend` service,
and a bind mount defined for a single service.
@z

% snip code...

@x
For more information about the `volumes` top-level element, see [Volumes](volumes.md).
@y
For more information about the `volumes` top-level element, see [Volumes](volumes.md).
@z

@x
#### Short syntax
@y
#### 短い文法 {#short-syntax}
@z

@x
The short syntax uses a single string with colon-separated values to specify a volume mount
(`VOLUME:CONTAINER_PATH`), or an access mode (`VOLUME:CONTAINER_PATH:ACCESS_MODE`).
@y
The short syntax uses a single string with colon-separated values to specify a volume mount
(`VOLUME:CONTAINER_PATH`), or an access mode (`VOLUME:CONTAINER_PATH:ACCESS_MODE`).
@z

@x
- `VOLUME`: Can be either a host path on the platform hosting containers (bind mount) or a volume name.
- `CONTAINER_PATH`: The path in the container where the volume is mounted.
- `ACCESS_MODE`: A comma-separated `,` list of options:
  - `rw`: Read and write access. This is the default if none is specified.
  - `ro`: Read-only access.
  - `z`: SELinux option indicating that the bind mount host content is shared among multiple containers.
  - `Z`: SELinux option indicating that the bind mount host content is private and unshared for other containers.
@y
- `VOLUME`: Can be either a host path on the platform hosting containers (bind mount) or a volume name.
- `CONTAINER_PATH`: The path in the container where the volume is mounted.
- `ACCESS_MODE`: A comma-separated `,` list of options:
  - `rw`: Read and write access. This is the default if none is specified.
  - `ro`: Read-only access.
  - `z`: SELinux option indicating that the bind mount host content is shared among multiple containers.
  - `Z`: SELinux option indicating that the bind mount host content is private and unshared for other containers.
@z

@x
> [!NOTE]
>
> The SELinux re-labeling bind mount option is ignored on platforms without SELinux.
@y
> [!NOTE]
>
> The SELinux re-labeling bind mount option is ignored on platforms without SELinux.
@z

@x
> [!NOTE]
> Relative host paths are only supported by Compose that deploy to a
> local container runtime. This is because the relative path is resolved from the Compose file’s parent
> directory which is only applicable in the local case. When Compose deploys to a non-local
> platform it rejects Compose files which use relative host paths with an error. To avoid ambiguities
> with named volumes, relative paths should always begin with `.` or `..`.
@y
> [!NOTE]
> Relative host paths are only supported by Compose that deploy to a
> local container runtime. This is because the relative path is resolved from the Compose file’s parent
> directory which is only applicable in the local case. When Compose deploys to a non-local
> platform it rejects Compose files which use relative host paths with an error. To avoid ambiguities
> with named volumes, relative paths should always begin with `.` or `..`.
@z

@x
> [!NOTE]
>
> For bind mounts, the short syntax creates a directory at the source path on the host if it doesn't exist. This is for backward compatibility with `docker-compose` legacy.
> It can be prevented by using long syntax and setting `create_host_path` to `false`.
@y
> [!NOTE]
>
> For bind mounts, the short syntax creates a directory at the source path on the host if it doesn't exist. This is for backward compatibility with `docker-compose` legacy.
> It can be prevented by using long syntax and setting `create_host_path` to `false`.
@z

@x
#### Long syntax
@y
#### 長い文法 {#long-syntax}
@z

@x
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@y
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@z

@x
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `image`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, a Docker image reference for an image mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present. Defaults to `true`.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](/manuals/compose/releases/release-notes.md#2260).
- `image`: Configures additional image options:
  - `subpath`: Path inside the source image to mount instead of the image root. Available in [Docker Compose version 2.35.0](/manuals/compose/releases/release-notes.md#2350)
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@y
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `image`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, a Docker image reference for an image mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present. Defaults to `true`.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](manuals/compose/releases/release-notes.md#2260).
- `image`: Configures additional image options:
  - `subpath`: Path inside the source image to mount instead of the image root. Available in [Docker Compose version 2.35.0](manuals/compose/releases/release-notes.md#2350)
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@z

@x
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase?
> Compose now takes advantage of [Synchronized file shares](/manuals/desktop/features/synchronized-file-sharing.md) and automatically creates file shares for bind mounts.
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@y
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase?
> Compose now takes advantage of [Synchronized file shares](manuals/desktop/features/synchronized-file-sharing.md) and automatically creates file shares for bind mounts.
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@z

@x
### `volumes_from`
@y
### `volumes_from`
@z

@x
`volumes_from` mounts all of the volumes from another service or container. You can optionally specify
read-only access `ro` or read-write `rw`. If no access level is specified, then read-write access is used.
@y
`volumes_from` mounts all of the volumes from another service or container. You can optionally specify
read-only access `ro` or read-write `rw`. If no access level is specified, then read-write access is used.
@z

@x
You can also mount volumes from a container that is not managed by Compose by using the `container:` prefix.
@y
You can also mount volumes from a container that is not managed by Compose by using the `container:` prefix.
@z

% snip code...

@x
### `working_dir`
@y
### `working_dir`
@z

@x
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@y
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@z
