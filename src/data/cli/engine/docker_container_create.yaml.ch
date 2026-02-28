%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container create
aliases: docker container create, docker create
short: Create a new container
long: |-
    The `docker container create` (or shorthand: `docker create`) command creates a
    new container from the specified image, without starting it.
@y
command: docker container create
aliases: docker container create, docker create
short: コンテナーを新規に生成します。
long: |-
    `docker container create` (短縮形 `docker create`) コマンドは、指定されたイメージからコンテナーを新規生成します。
    ただしコンテナーの起動は行いません。
@z

@x
    When creating a container, the Docker daemon creates a writeable container layer
    over the specified image and prepares it for running the specified command. The
    container ID is then printed to `STDOUT`. This is similar to `docker run -d`
    except the container is never started. You can then use the `docker container start`
    (or shorthand: `docker start`) command to start the container at any point.
@y
    コンテナーが生成されると Docker デーモンは指定されたイメージの上に書き込み可能なコンテナーレイヤーを生成します。
    これは指示されるコマンドの実行を処理するためです。
    生成後にはコンテナー ID が `STDOUT` に出力されます。
    この動作は `docker run -d` のようなものですが、ただしコンテナーが起動するわけではありません。
    したがってこの後に `docker container start` (あるいは短縮形 `docker start`) コマンドを実行してコンテナーを起動することになります。
@z

@x
    This is useful when you want to set up a container configuration ahead of time
    so that it's ready to start when you need it. The initial status of the
    new container is `created`.
@y
    このコマンドは、事前にコンテナーの設定を行っておいて、いつでも起動できるように準備しておくような使い方ができます。
    新たに生成されたコンテナーの初期ステータスは `created` (生成済み) です。
@z

@x
    The `docker create` command shares most of its options with the `docker run`
    command (which performs a `docker create` before starting it).
    Refer to the [`docker run` CLI reference](/reference/cli/docker/container/run/)
    for details on the available flags and options.
@y
    `docker create` コマンドのオプションは `docker run` コマンド (`docker create` を行ってからコンテナーを起動します) のものとかなりの部分で共通しています。
    利用可能なフラグやオプションについては [`docker run` CLI リファレンス](__SUBDIR__/reference/cli/docker/container/run/) を参照してください。
@z

@x
usage: docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
@y
usage: docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
@z

% options:

@x add-host
      description: Add a custom host-to-IP mapping (host:ip)
@y
      description: ホスト－IP マッピングのカスタム設定を追加します。(ホスト名:ip)
@z

@x annotation
      description: |
        Add an annotation to the container (passed through to the OCI runtime)
@y
      description: |
        (OCI ランタイムに受け渡された) コンテナーに注釈 (annotation) を追加します。
@z

@x attach
      description: Attach to STDIN, STDOUT or STDERR
@y
      description: STDIN、STDOUT、STDERR にアタッチします。
@z

@x blkio-weight
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
@y
      description: |
        ブロック I/O（相対的な重みづけ）、10 から 1000、0 は無効化。（デフォルトは 0）
@z

@x blkio-weight-device
      description: Block IO weight (relative device weight)
@y
      description: ブロック I/O 重みづけ。（相対的なデバイス重みづけ）
@z

@x cap-add
      description: Add Linux capabilities
@y
      description: Linux ケーパビリティーを追加します。
@z

@x cap-drop
      description: Drop Linux capabilities
@y
      description: Linux ケーパビリティーを削除します。
@z

@x cgroup-parent
      description: Optional parent cgroup for the container
@y
      description: 任意に指定するコンテナーの親 cgroup。
@z

@x cgroupns
      description: |-
        Cgroup namespace to use (host|private)
        'host':    Run the container in the Docker host's cgroup namespace
        'private': Run the container in its own private cgroup namespace
        '':        Use the cgroup namespace as configured by the
                   default-cgroupns-mode option on the daemon (default)
@y
      description: |-
        利用する cgroup 名前空間（host|private）。
        'host':    Dockerホストのcgroup名前空間内でコンテナーを起動。
        'private': プライベートなcgroup名前空間内でコンテナーを起動。
        '':        デーモンのdefault-cgroupns-modeオプションによって
                   設定されるcgroup名前空間を利用（デフォルト）。
@z

@x cidfile
      description: Write the container ID to the file
@y
      description: コンテナー ID をファイルに書き出します。
@z

@x cpu-count
      description: CPU count (Windows only)
@y
      description: CPU カウント。(Windows のみ)
@z

@x cpu-percent
      description: CPU percent (Windows only)
@y
      description: CPU パーセント。(Windows のみ)
@z

@x cpu-period
      description: Limit CPU CFS (Completely Fair Scheduler) period
@y
      description: CPU の CFS（Completely Fair Scheduler）間隔を制限します。
@z

@x cpu-quota
      description: Limit CPU CFS (Completely Fair Scheduler) quota
@y
      description: CPU の CFS（Completely Fair Scheduler）クォータを制限します。
@z

@x cpu-rt-period
      description: Limit CPU real-time period in microseconds
@y
      description: CPU へのリアルタイムアクセス時間をマイクロ秒で制限します。
@z

@x cpu-rt-runtime
      description: Limit CPU real-time runtime in microseconds
@y
      description: CPU へのリアルタイムアクセスランタイムをマイクロ秒で制限します。
@z

@x cpu-shares
      description: CPU shares (relative weight)
@y
      description: CPU 配分。（相対的な重みづけ）
@z

@x cpus
      description: Number of CPUs
@y
      description: CPU 数。
@z

@x cpuset-cpus
      description: CPUs in which to allow execution (0-3, 0,1)
@y
      description: 利用を許容する CPU 数。（0-3、0,1）
@z

@x cpuset-mems
      description: MEMs in which to allow execution (0-3, 0,1)
@y
      description: 利用を許容するメモリ数。（0-3、0,1）
@z

@x device
      description: Add a host device to the container
@y
      description: ホストのデバイスをコンテナーに追加します。
@z

@x device-cgroup-rule
      description: Add a rule to the cgroup allowed devices list
@y
      description: cgroup がアクセス可能なデバイスリストにルールを追加します。
@z

@x device-read-bps
      description: Limit read rate (bytes per second) from a device
@y
      description: デバイスからの読み込み割合（秒あたりのバイト数）を制限します。
@z

@x device-read-iops
      description: Limit read rate (IO per second) from a device
@y
      description: デバイスからの読み込み割合（秒あたりの I/O）を制限します。
@z

@x device-write-bps
      description: Limit write rate (bytes per second) to a device
@y
      description: デバイスへの書き込み割合（秒あたりのバイト数）を制限します。
@z

@x device-write-iops
      description: Limit write rate (IO per second) to a device
@y
      description: デバイスへの書き込み割合（秒あたりの I/O）を制限します。
@z

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: イメージの検証を省略します (廃止予定)。
@z

@x dns
      description: Set custom DNS servers
@y
      description: カスタム DNS サーバーを設定します。
@z

@x dns-opt
      description: Set DNS options
@y
      description: DNS オプションを設定します。
@z

@x dns-option
      description: Set DNS options
@y
      description: DNS オプションを設定します。
@z

@x dns-search
      description: Set custom DNS search domains
@y
      description: カスタム DNS 検索ドメインを設定します。
@z

@x domainname
      description: Container NIS domain name
@y
      description: コンテナーの NIS ドメイン名。
@z

@x entrypoint
      description: Overwrite the default ENTRYPOINT of the image
@y
      description: イメージのデフォルト ENTRYPOINT をオーバーライドします。
@z

@x env
      description: Set environment variables
@y
      description: 環境変数を設定します。
@z

@x env-file
      description: Read in a file of environment variables
@y
      description: 環境変数ファイルを読み込みます。
@z

@x expose
      description: Expose a port or a range of ports
@y
      description: ポートまたはポート範囲を公開します。
@z

@x gpus
      description: GPU devices to add to the container ('all' to pass all GPUs)
@y
      description: コンテナーに追加する GPU デバイスを指定します。('all' により全 GPU)
@z

@x group-add
      description: Add additional groups to join
@y
      description: 新たに参加するグループを追加します。
@z

@x health-cmd
      description: Command to run to check health
@y
      description: ヘルスチェックを実行するコマンド。
@z

@x health-interval
      description: Time between running the check (ms|s|m|h) (default 0s)
@y
      description: ヘルスチェックの実行間隔。(ms|s|m|h) （デフォルトは 0s）
@z

@x health-retries
      description: Consecutive failures needed to report unhealthy
@y
      description: 不健康（unhealthy）であると報告するのに必要な連続失敗回数。
@z

@x health-start-interval
      description: |
        Time between running the check during the start period (ms|s|m|h) (default 0s)
@y
      description: |
        起動時間内のヘルスチェックの実行間隔。(ms|s|m|h) (デフォルトは 0s)
@z

@x health-start-period
      description: |
        Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
@y
      description: |
        ヘルスチェックのリトライを数え始める前の、コンテナー初期化を行う開始時間。(ms|s|m|h) （デフォルトは 0s）
@z

@x health-timeout
      description: Maximum time to allow one check to run (ms|s|m|h) (default 0s)
@y
      description: 1 つのチェック処理実行に許容する最大時間。(ms|s|m|h) （デフォルトは 0s）
@z

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x hostname
      description: Container host name
@y
      description: コンテナーのホスト名。
@z

@x init
      description: |
        Run an init inside the container that forwards signals and reaps processes
@y
      description: |
        コンテナー内部にて、シグナル送信と子プロセス管理を行う初期化処理を実行します。
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: アタッチされていなくても STDIN は開放し続けます。
@z

@x io-maxbandwidth
      description: Maximum IO bandwidth limit for the system drive (Windows only)
@y
      description: システムデバイスの I/O 帯域幅の上限。（Windows のみ）
@z

@x io-maxiops
      description: Maximum IOps limit for the system drive (Windows only)
@y
      description: システムデバイスの IOps の上限。（Windows のみ）
@z

@x ip
      description: IPv4 address (e.g., 172.30.100.104)
@y
      description: IPv4 アドレス。(たとえば 172.30.100.104)
@z

@x ip6
      description: IPv6 address (e.g., 2001:db8::33)
@y
      description: IPv6 アドレス。(たとえば 2001:db8::33)
@z

@x ipc
      description: IPC mode to use
@y
      description: 利用する IPC mode モード。
@z

@x isolation
      description: Container isolation technology
@y
      description: コンテナーの分離技術（isolation technology）方式。
@z

@x kernel-memory
      description: Kernel memory limit (deprecated)
@y
      description: カーネルメモリ上限 (廃止予定)。
@z

@x label
      description: Set meta data on a container
@y
      description: コンテナーに対してメタデータを設定します。
@z

@x label-file
      description: Read in a line delimited file of labels
@y
      description: 行ごとにラベルが記述されたファイルを読み込みます。
@z

@x link
      description: Add link to another container
@y
      description: 別コンテナーへのリンクを追加します。
@z

@x link-local-ip
      description: Container IPv4/IPv6 link-local addresses
@y
      description: コンテナーの IPv4/IPv6 によるリンクローカルアドレス。
@z

@x log-driver
      description: Logging driver for the container
@y
      description: コンテナーにおけるログドライバー。
@z

@x log-opt
      description: Log driver options
@y
      description: ログドライバーオプション。
@z

@x mac-address
      description: Container MAC address (e.g., 92:d0:c6:0a:29:33)
@y
      description: コンテナーの MAC アドレス。（たとえば 92:d0:c6:0a:29:33）
@z

@x memory
      description: Memory limit
@y
      description: メモリ上限。
@z

@x memory-reservation
      description: Memory soft limit
@y
      description: メモリのソフト上限。
@z

@x memory-swap
      description: |
        Swap limit equal to memory plus swap: '-1' to enable unlimited swap
@y
      description: |
        メモリとスワップの総量を制限します。'-1' 設定時はスワップ無制限。
@z

@x memory-swappiness
      description: Tune container memory swappiness (0 to 100)
@y
      description: コンテナーのスワップ割合を調整します。（0 から 100）
@z

@x mount
      description: Attach a filesystem mount to the container
@y
      description: ファイルシステムマウントをコンテナーにアタッチします。
@z

@x name
      description: Assign a name to the container
@y
      description: コンテナーに名前を割り当てます。
@z

@x net
      description: Connect a container to a network
@y
      description: コンテナーをネットワークに接続します。
@z

@x net-alias
      description: Add network-scoped alias for the container
@y
      description: ネットワーク範囲内のエイリアスをコンテナーに追加します。
@z

@x network
      description: Connect a container to a network
@y
      description: コンテナーをネットワークに接続します。
@z

@x network-alias
      description: Add network-scoped alias for the container
@y
      description: ネットワーク範囲内のエイリアスをコンテナーに追加します。
@z

@x no-healthcheck
      description: Disable any container-specified HEALTHCHECK
@y
      description: コンテナー固有の HEALTHCHECK を無効にします。
@z

@x oom-kill-disable
      description: Disable OOM Killer
@y
      description: OOM キラーを無効にします。
@z

@x oom-score-adj
      description: Tune host's OOM preferences (-1000 to 1000)
@y
      description: ホストの OOM に対する優先順位を設定します。（-1000 から 1000）
@z

@x pid
      description: PID namespace to use
@y
      description: 利用する PID 名前空間。
@z

@x pids-limit
      description: Tune container pids limit (set -1 for unlimited)
@y
      description: コンテナーの PID 制限を調整します。（-1 により無制限）
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: サーバーがマルチプラットフォームに対応している場合にプラットフォームを指定します。
@z

@x privileged
      description: Give extended privileges to this container
@y
      description: コンテナーに拡張権限を付与します。
@z

@x publish
      description: Publish a container's port(s) to the host
@y
      description: ホストに対してコンテナーのポートを公開します。
@z

@x publish-all
      description: Publish all exposed ports to random ports
@y
      description: 公開されたポートをランダムポートとして公開します。
@z

@x pull
      description: Pull image before creating (`always`, `|missing`, `never`)
@y
      description: イメージ生成前にプルを行います（`always`, `missing`, `never`）。
@z

@x quiet
      description: Suppress the pull output
@y
      description: プル処理時の出力を省略します。
@z

@x read-only
      description: Mount the container's root filesystem as read only
@y
      description: コンテナーのルートファイルシステムを読み込み専用としてマウントします。
@z

@x restart
      description: Restart policy to apply when a container exits
@y
      description: コンテナー終了時に適用する再起動ポリシー。
@z

@x rm
      description: |
        Automatically remove the container and its associated anonymous volumes when it exits
@y
      description: |
        終了時にコンテナーと関連する匿名ボリュームがあればそれを自動的に削除します。
@z

@x runtime
      description: Runtime to use for this container
@y
      description: このコンテナー向けに利用するランタイム。
@z

@x security-opt
      description: Security Options
@y
      description: セキュリティオプション。
@z

@x shm-size
      description: Size of /dev/shm
@y
      description: /dev/shm のサイズ。
@z

@x stop-signal
      description: Signal to stop the container
@y
      description: コンテナーを停止するシグナル。
@z

@x stop-timeout
      description: Timeout (in seconds) to stop a container
@y
      description: コンテナー停止時の中断時間（秒単位）。
@z

@x storage-opt
      description: Storage driver options for the container
@y
      description: コンテナーにおけるストレージドライバーのオプション。
@z

@x sysctl
      description: Sysctl options
@y
      description: sysctl オプション。
@z

@x tmpfs
      description: Mount a tmpfs directory
@y
      description: tmpfs ディレクトリのマウント。
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: 擬似 TTY を割り当てます。
@z

@x ulimit
      description: Ulimit options
@y
      description: ulimit オプション。
@z

@x use-api-socket
      description: Bind mount Docker API socket and required auth
@y
      description: Docker API ソケットと必要な auth をバインドマウントします。
@z

@x user
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@y
      description: 'ユーザー名または UID。（記述書式: <name|uid>[:<group|gid>]）'
@z

@x userns
      description: User namespace to use
@y
      description: 利用するユーザー名前空間。
@z

@x uts
      description: UTS namespace to use
@y
      description: 利用する UTS 名前空間。
@z

@x volume
      description: Bind mount a volume
@y
      description: ボリュームをバインドマウントします。
@z

@x volume-driver
      description: Optional volume driver for the container
@y
      description: 任意に指定するボリュームドライバー。
@z

@x volumes-from
      description: Mount volumes from the specified container(s)
@y
      description: 指定されたコンテナーからボリュームをマウントします。
@z

@x workdir
      description: Working directory inside the container
@y
      description: コンテナー内部のワーキングディレクトリ。
@z

@x
examples: |-
    ### Create and start a container
@y
examples: |-
    ### コンテナーの生成と起動 {#create-and-start-a-container}
@z

@x
    The following example creates an interactive container with a pseudo-TTY attached,
    then starts the container and attaches to it:
@y
    以下の例は、疑似 TTY をアタッチして対話操作を可能にしたコンテナーを生成します。
    そしてコンテナーを起動し疑似 TTY をアタッチします。
@z

% snip command...

@x
    The above is the equivalent of a `docker run`:
@y
    上の例は以下の `docker run` を実行した場合と同じです。
@z

% snip command...

@x
    ### Initialize volumes
@y
    ### ボリュームの初期化 {#initialize-volumes}
@z

@x
    Container volumes are initialized during the `docker create` phase
    (i.e., `docker run` too). For example, this allows you to `create` the `data`
    volume container, and then use it from another container:
@y
    コンテナーボリュームは `docker create` 処理内において初期化されます (`docker run` でも同じです)。
    たとえば以下はボリュームコンテナー `data` を `create` し、それを別コンテナーから利用します。
@z

% snip command...

@x
    Similarly, `create` a host directory bind mounted volume container, which can
    then be used from the subsequent container:
@y
    同じようにして、ホストディレクトリをバインドマウントしたボリュームコンテナーを `create` します。
    そして次のコンテナーからそれを利用します。
@z

% snip command...
% snip directives...
