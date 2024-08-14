%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。/ .md リンクへの (no slash) 対応

@x
description: Overview of persisting data in containers
title: Manage data in Docker
keywords: storage, persistence, data persistence, volumes, mounts, bind mounts, tmpfs
@y
description: コンテナー内にデータを保持するための概要
title: Docker におけるデータ管理
keywords: storage, persistence, data persistence, volumes, mounts, bind mounts, tmpfs
@z

@x
By default all files created inside a container are stored on a writable
container layer. This means that:
@y
コンテナー内に生成されたファイルは、デフォルトではすべて書き込み可能なコンテナーレイヤーに保存されます。
これは以下を意味します。
@z

@x
- The data doesn't persist when that container no longer exists, and it can be
  difficult to get the data out of the container if another process needs it.
- A container's writable layer is tightly coupled to the host machine
  where the container is running. You can't easily move the data somewhere else.
- Writing into a container's writable layer requires a
  [storage driver](/engine/storage/drivers/) to manage the
  filesystem. The storage driver provides a union filesystem, using the Linux
  kernel. This extra abstraction reduces performance as compared to using
  _data volumes_, which write directly to the host filesystem.
@y
- コンテナーが存在しなくなると、データを保持しておくことができなくなります。
  そのデータをコンテナーの外部から取得したいと思っても、外部プロセスがこれを行うことは極めて困難になります。
- コンテナーの書き込み可能レイヤーは、コンテナーが稼動しているホストマシンに強く結び付けられています。
  したがってその中のデータをどこかに移動させることは容易ではありません。
- コンテナーの書き込み可能レイヤーにデータを書き込むためには、ファイルシステムを管理する [ストレージドライバー](__SUBDIR__/engine/storage/drivers/) が必要になります。
  このストレージドライバーは、Linux カーネルを利用してユニオンファイルシステム（union filesystem）を提供します。
  この特別な抽象ファイルシステムは **データボリューム** に比べると性能が劣ります。
  データボリュームであれば、ホストのファイルシステムに直接データを書き込むことができます。
@z

@x
Docker has two options for containers to store files on the host machine, so
that the files are persisted even after the container stops: volumes, and
bind mounts. 
@y
Docker コンテナーにおけるファイルをホストマシン上に保存する方法は 2 つあります。
これを行えば、コンテナーが停止した後にもデータを維持していくことができます。
その 2 つの方法とはボリュームとバインドマウントです。
@z

@x
Docker also supports containers storing files in-memory on the host machine. Such files are not persisted.
If you're running Docker on Linux, `tmpfs` mount is used to store files in the host's system memory.
If you're running Docker on Windows, named pipe is used to store files in the host's system memory.
@y
Docker ではさらに、ホストマシン上でのインメモリにファイル保存するコンテナーをサポートしています。
そういったファイルは永続的ではありません。
Linux 上において Docker を稼動していれば、`tmpfs` マウントを使って、ホストシステムメモリ内にファイル保存することができます。
Windows 上において Docker を稼動していれば、名前つきパイプ（named pipe）を使って、ホストシステムメモリ内にファイル保存することができます。
@z

@x
## Choose the right type of mount
@y
## 適切なマウント方法の選定 {#choose-the-right-type-of-mount}
@z

@x
No matter which type of mount you choose to use, the data looks the same from
within the container. It is exposed as either a directory or an individual file
in the container's filesystem.
@y
どの種類のマウント方法を選んだとしても、コンテナー内部からのデータの見え方は同じです。
そのデータはコンテナー内のファイルシステム上において、ディレクトリとして見えるか、あるいは個別のファイルとして見えます。
@z

@x
An easy way to visualize the difference among volumes, bind mounts, and `tmpfs`
mounts is to think about where the data lives on the Docker host.
@y
ボリューム、バインドマウント、`tmpfs`マウントにどのような違いがあるのかは、そのデータが Docker ホスト上のどこに保存されるかを考えてみると、わかりやすくなります。
@z

@x
![Types of mounts and where they live on the Docker host](images/types-of-mounts.webp?w=450&h=300)
@y
![マウントの種類と Docker ホスト上でのデータ保存場所](images/types-of-mounts.webp?w=450&h=300)
@z

@x
- Volumes are stored in a part of the host filesystem which is _managed by
  Docker_ (`/var/lib/docker/volumes/` on Linux). Non-Docker processes should not
  modify this part of the filesystem. Volumes are the best way to persist data
  in Docker.
@y
- ボリュームはホストのファイルシステムの一部としてデータが保存されます。
  そしてこれは **Docker によって管理されます**。
  （Linux であれば`/var/lib/docker/volumes/`に保存されます。）
  Docker 以外のプロセスは、このファイルシステム上の保存場所に変更を行ってはなりません。
  ボリュームは Docker においてデータを維持するための最良の方法です。
@z

@x
- Bind mounts may be stored anywhere on the host system. They may even be
  important system files or directories. Non-Docker processes on the Docker host
  or a Docker container can modify them at any time.
@y
- バインドマウントはホストシステム上のどこにでも保存することができます。
  それが重要なシステムファイルやディレクトリであってもかまいません。
  Docker ホスト上の Docker に無関係なプロセスや Docker コンテナーであったとしても、これを修正することがいつでもできます。
@z

@x
- `tmpfs` mounts are stored in the host system's memory only, and are never
  written to the host system's filesystem.
@y
- `tmpfs`マウントはホストシステムのメモリ上にのみ保存されます。
  そしてホストシステムのファイルシステムに向けての書き込みを行うことはできません。
@z

@x
Bind mounts and volumes can both be mounted into containers using the `-v` or
`--volume` flag, but the syntax for each is slightly different. For `tmpfs`
mounts, you can use the `--tmpfs` flag. We recommend using the `--mount` flag
for both containers and services, for bind mounts, volumes, or `tmpfs` mounts,
as the syntax is more clear.
@y
バインドマウントとボリュームは、いずれも `-v` フラグまたは `--volume` フラグを使ってコンテナーにマウントすることができますが、その文法は微妙に異なります。
`tmpfs` マウントに対しては `--tmpfs` フラグがあります。
文法がより明確になることから、コンテナーとサービス間、バインドマウント、ボリューム、`tmpfs` マウントには `--mount` フラグを用いることをお勧めします。
@z

@x
### Volumes
@y
### ボリューム {#volumes}
@z

@x
Volumes are created and managed by Docker. You can create a volume explicitly
using the `docker volume create` command, or Docker can create a volume during
container or service creation.
@y
ボリューム (volume) とは Docker によって生成され管理されるものです。
ボリュームは`docker volume create`コマンドによって明示的に生成します。
あるいは Docker が、コンテナーやサービスの生成時にボリュームを生成します。
@z

@x
When you create a volume, it's stored within a directory on the Docker
host. When you mount the volume into a container, this directory is what's
mounted into the container. This is similar to the way that bind mounts work,
except that volumes are managed by Docker and are isolated from the core
functionality of the host machine.
@y
ボリュームを生成した際には、Docker ホスト上のディレクトリにボリュームが保存されます。
このボリュームをコンテナーにマウントすると、そのディレクトリがコンテナー内にマウントされるものとなります。
このことは、バインドマウントが動作する様子と同様です。
ただしボリュームは Docker によって管理されるものであって、ホストマシンの主要な機能からは切り離されています。
@z

@x
A given volume can be mounted into multiple containers simultaneously. When no
running container is using a volume, the volume is still available to Docker
and isn't removed automatically. You can remove unused volumes using `docker
volume prune`.
@y
ボリュームは複数のコンテナーに対して同時にマウントすることができます。
たとえそのボリュームを利用するコンテナーが 1 つも実行されていなくても、ボリュームは Docker が利用できる状態にあって、自動的に削除されることはありません。
未使用のボリュームは`docker volume prune`によって削除することができます。
@z

@x
When you mount a volume, it may be named or anonymous. Anonymous volumes are
given a random name that's guaranteed to be unique within a given Docker host.
Just like named volumes, anonymous volumes persist even if you remove the
container that uses them, except if you use the `--rm` flag when creating the
container, in which case the anonymous volume is destroyed.
See [Remove anonymous volumes](volumes.md#remove-anonymous-volumes).
If you create multiple containers after each other that use anonymous volumes,
each container creates its own volume.
Anonymous volumes aren't reused or shared between containers automatically.
To share an anonymous volume between two or more containers,
you must mount the anonymous volume using the random volume ID.
@y
ボリュームのマウントは、名前つき（named）か匿名（anonymous）のいずれかにより行われます。
匿名ボリュームにはランダムな名前が与えられます。
これは利用する Docker ホスト内において固有な名称を確保するためです。
名前つきボリュームの名称の場合と同様に、匿名ボリュームの名称も維持されます。
それはコンテナーの生成時に `--rm` フラグをつけなかった場合であれば、たとえそのコンテナーが削除されたとしても、名称は残ります。
逆につけた場合、匿名ボリュームは削除されます。
詳しくは [匿名ボリュームの削除](volumes.md#remove-anonymous-volumes) を参照してください。
匿名ボリュームを複数のコンテナーから利用するマルチコンテナーを生成した場合、各コンテナーはそれぞれに自分自身のボリュームを生成します。
匿名ボリュームはコンテナー間においては、自動的に再利用されたり共有されたりすることはありません。
匿名ボリュームを複数コンテナー間において共有するためには、その匿名ボリュームに対してランダムなボリューム ID を使ってマウントしなければなりません。
@z

@x
Volumes also support the use of volume drivers, which allow you to store
your data on remote hosts or cloud providers, among other possibilities.
@y
ボリュームではボリュームドライバーの利用がサポートされます。
これによって、いろいろな利用の仕方が可能となります。
たとえば手元のデータを、リモートホストやクラウドプロバイダーに保存することができるようになります。
@z

@x
### Bind mounts
@y
### バインドマウント {#bind-mounts}
@z

@x
Bind mounts have limited functionality compared to volumes. When you use a bind
mount, a file or directory on the host machine is mounted into a container. The
file or directory is referenced by its full path on the host machine. The file
or directory doesn't need to exist on the Docker host already. It is created on
demand if it doesn't yet exist. Bind mounts are fast, but they rely on the host
machine's filesystem having a specific directory structure available. If you
are developing new Docker applications, consider using named volumes instead.
You can't use Docker CLI commands to directly manage bind mounts.
@y
バインドマウントにはボリュームに比べて機能が制限されています。
バインドマウントを利用する際には、ホストマシン上のファイルやディレクトリがコンテナーにマウントされます。
そのファイルやディレクトリは、ホストマシン上のフルパスによって参照されます。
ファイルやディレクトリが、Docker ホスト上からなくなっていても問題ありません。
存在していないときは、処理実行時に生成されます。
バインドマウントは非常に高速なものですが、ホストマシン上のファイルシステムに依存し、利用可能な所定のディレクトリ構造に従って動作します。
Docker アプリケーションを新規開発する際には、これではなく名前つきボリュームを利用することを考えてみてください。
バインドマウントを直接管理するような Docker CLI コマンドはありません。
@z

@x
> **Important**
>
> Bind mounts allow write access to files on the host by default.
>
> One side effect of using bind mounts is that you can change the host
> filesystem via processes running in a container, including creating,
> modifying, or deleting important system files or directories. This is a
> powerful ability which can have security implications, including impacting
> non-Docker processes on the host system.
{ .important }
@y
> **重要**
>
> バインドマウントはデフォルトで、ホスト上のファイルへの書き込みアクセスも行います。
>
> バインドマウントを利用する際の副作用として、これが良いことか悪いことかはわかりませんが、コンテナー内に動作するプロセスを通じてホストのファイルシステムに変更がかけられるということです。
> たとえばシステムにとって重要なファイル、ディレクトリを生成、編集、削除ができてしまいます。
> セキュリティに影響を及ぼしかねない強力な能力がここにあって、ホストシステム上の Docker 以外のプロセスへも影響します。
{ .important }
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
A `tmpfs` mount isn't persisted on disk, either on the Docker host or within a
container. It can be used by a container during the lifetime of the container,
to store non-persistent state or sensitive information. For instance,
internally, Swarm services use `tmpfs` mounts to mount
[secrets](/engine/swarm/secrets.md) into a service's containers.
@y
`tmpfs`マウントとは、Docker ホスト上もコンテナー上も、ディスクに長らく保持されるものではありません。
これはコンテナーが起動している間のみ、コンテナーが利用するものであって、一時的な状態や機密情報などを保存します。
たとえば Docker 内部においては、Swarm サービスが`tmpfs`マウントを利用して、サービスコンテナー内に [secrets](engine/swarm/secrets.md) をマウントしています。
@z

@x
### Named pipes
@y
### 名前つきパイプ {#named-pipes}
@z

@x
[Named pipes](https://docs.microsoft.com/en-us/windows/desktop/ipc/named-pipes)
can be used for communication between the Docker host and a container. Common
use case is to run a third-party tool inside of a container and connect to the
Docker Engine API using a named pipe.
@y
[名前つきパイプ](https://docs.microsoft.com/en-us/windows/desktop/ipc/named-pipes)**（named pipe）は Docker ホストとコンテナーの間での通信のために利用されます。
よく行われる利用例としては、コンテナー内部にサードパーティー製のツールを実行させて、名前つきパイプにより Docker Engine API への接続を行うような場合です。
@z

@x
## Good use cases for volumes
@y
## ボリュームの適切な利用例 {#good-use-cases-for-volumes}
@z

@x
Volumes are the preferred way to persist data in Docker containers and services.
Some use cases for volumes include:
@y
Docker コンテナーやサービスにおいてデータを保持するためには、ボリュームを用いるのが好ましい方法です。
ボリュームの利用例として以下のものがあります。
@z

@x
- Sharing data among multiple running containers. If you don't explicitly create
  it, a volume is created the first time it is mounted into a container. When
  that container stops or is removed, the volume still exists. Multiple
  containers can mount the same volume simultaneously, either read-write or
  read-only. Volumes are only removed when you explicitly remove them.
@y
- 複数コンテナーを起動し、データ共有を行う場合です。
  ボリュームが明示的に生成されていない場合、コンテナーへのマウント時の初回にボリュームは生成されます。
  コンテナーが停止されるか削除されたとしても、ボリュームは残ります。
  複数コンテナーは同一ボリュームを同時にマウントすることが可能です。
  その場合、読み書き可能、あるいは読み込み専用とすることができます。
  ボリュームは、明示的に削除を指示したときのみ削除されます。
@z

@x
- When the Docker host is not guaranteed to have a given directory or file
  structure. Volumes help you decouple the configuration of the Docker host
  from the container runtime.
@y
- Docker ホストにおいて、指定されたディレクトリまたはファイル構造が保証されていない場合です。
  ボリュームを用いることで、Docker ホストの設定を、コンテナーの実行環境から切り離すことができます。
@z

@x
- When you want to store your container's data on a remote host or a cloud
  provider, rather than locally.
@y
- コンテナーデータの保存先として、ローカルマシンではなく、リモートホストやクラウドプロバイダーを利用したい場合です。
@z

@x
- When you need to back up, restore, or migrate data from one Docker
  host to another, volumes are a better choice. You can stop containers using
  the volume, then back up the volume's directory
  (such as `/var/lib/docker/volumes/<volume-name>`).
@y
- 1 つの Docker ホストのデータをバックアップして、他のホストに復元、移行する必要がある場合です。
  こういった場合にボリュームを選びます。
  ボリュームを利用しているコンテナーを停止させてから、ボリュームがあるディレクトリのバックアップをとります（ディレクトリは`/var/lib/docker/volumes/<ボリューム名>`などです）。
@z

@x
- When your application requires high-performance I/O on Docker Desktop. Volumes
  are stored in the Linux VM rather than the host, which means that the reads and writes
  have much lower latency and higher throughput.
@y
- Docker Desktop においてアプリケーションが高性能な I/O を必要とする場合です。
  ボリュームはホスト上ではなく Linux VM 上に保存されます。
  このことはつまり、読み書きにおける待ち時間がより少なくなり、スループットが向上します。
@z

@x
- When your application requires fully native file system behavior on Docker
  Desktop. For example, a database engine requires precise control over disk
  flushing to guarantee transaction durability. Volumes are stored in the Linux
  VM and can make these guarantees, whereas bind mounts are remoted to macOS or
  Windows, where the file systems behave slightly differently.
@y
- Docker Desktop 上でのアプリケーションが、完全にネイティブなファイルシステムの動作を必要とする場合です。
  たとえばデータベースエンジンでは、トランザクションの耐久性を保証するために、ディスクへの書き込みを細かく制御できることが必要になります。
  ボリュームは Linux VM 上に保存され、これらを保証することができます。
  一方バインドマウントは macOS や Windows にリモート接続されるものなので、ファイルシステムの動作は若干異なるものになります。
@z

@x
## Good use cases for bind mounts
@y
## バインドマウントの適切な利用例 {#good-use-cases-for-bind-mounts}
@z

@x
In general, you should use volumes where possible. Bind mounts are appropriate
for the following types of use case:
@y
一般的には、可能なかぎりボリュームを用いるべきです。
バインドマウントは、以下のような利用例において適切と考えられます。
@z

@x
- Sharing configuration files from the host machine to containers. This is how
  Docker provides DNS resolution to containers by default, by mounting
  `/etc/resolv.conf` from the host machine into each container.
@y
- 設定ファイルをホストマシンからコンテナーに共有するような場合です。
  デフォルトで Docker はコンテナーに対し DNS 解決機能を提供しますが、それがこの状況に相当します。
  この場合、`/etc/resolv.conf`をホストマシンから各コンテナーへマウントすることを行います。
@z

@x
- Sharing source code or build artifacts between a development environment on
  the Docker host and a container. For instance, you may mount a Maven `target/`
  directory into a container, and each time you build the Maven project on the
  Docker host, the container gets access to the rebuilt artifacts.
@y
- ソースコードやビルド結果を、Docker ホスト上の開発環境とコンテナーとの間で共有する場合です。
  たとえば Maven の`target/`ディレクトリをコンテナーにマウントします。
  Docker ホスト上にて Maven プロジェクトをビルドするたびに、コンテナーは再ビルドされた結果をすぐに利用します。
@z

@x
  If you use Docker for development this way, your production Dockerfile would
  copy the production-ready artifacts directly into the image, rather than
  relying on a bind mount.
@y
  Docker をこのようにして開発に利用する場合、本番環境用の Dockerfile には、本番向けにビルドされたバイナリを、直接イメージにコピーするような記述を行うはずです。
  そこではもう、バインドマウントに頼ることはありません。
@z

@x
- When the file or directory structure of the Docker host is guaranteed to be
  consistent with the bind mounts the containers require.
@y
- Docker ホストのファイルやディレクトリ構造が、コンテナーにとって必要となるバインドマウントと合致することが保証されている場合です。
@z

@x
## Good use cases for tmpfs mounts
@y
## tmpfs マウントの適切な利用例 {#good-use-cases-for-tmpfs-mounts}
@z

@x
`tmpfs` mounts are best used for cases when you do not want the data to persist
either on the host machine or within the container. This may be for security
reasons or to protect the performance of the container when your application
needs to write a large volume of non-persistent state data.
@y
`tmpfs`マウントの一番の使い方は、ホストマシン上にもコンテナー内にも、データを残しておきたくない場合に利用することです。
セキュリティに関する理由もありますが、アプリケーションが書き込むデータが大量にあって、それが保存を必要としないのであれば、コンテナーの性能を保護する目的があります。
@z

@x
## Tips for using bind mounts or volumes
@y
## バインドマウントとボリュームを使う際のヒント {#tips-for-using-bind-mounts-or-volumes}
@z

@x
If you use either bind mounts or volumes, keep the following in mind:
@y
バインドマウントとボリュームのどちらかを用いる場合には、以下のことを忘れないでください。
@z

@x
- If you mount an **empty volume** into a directory in the container in which files
  or directories exist, these files or directories are propagated (copied)
  into the volume. Similarly, if you start a container and specify a volume which
  does not already exist, an empty volume is created for you.
  This is a good way to pre-populate data that another container needs.
@y
- コンテナー内のディレクトリに **空のボリューム** をマウントしようとしていて、そのディレクトリ内にファイルやディレクトリが存在する場合、そのファイルやディレクトリはボリューム内にコピーされます。
  コンテナー起動時に指定したボリュームがまだ存在していなかった場合は、空のボリュームが生成されます。
  コンテナーの求めに応じて事前にデータを提供しておく方法として用いられます。
@z

@x
- If you mount a **bind mount or non-empty volume** into a directory in the container
  in which some files or directories exist, these files or directories are
  obscured by the mount, just as if you saved files into `/mnt` on a Linux host
  and then mounted a USB drive into `/mnt`. The contents of `/mnt` would be
  obscured by the contents of the USB drive until the USB drive was unmounted.
  The obscured files are not removed or altered, but are not accessible while the
  bind mount or volume is mounted.
@y
- コンテナー内のディレクトリに **バインドマウントか、空ではないボリューム** をマウントしようとしていて、そのディレクトリ内にファイルやディレクトリが存在する場合、マウントによってそのファイルやディレクトリは隠れてしまいます。
  それはたとえば、Linux マシン上の`/mnt`にファイルを保存した後に、`/mnt`に対して USB ドライブをマウントしたような場合と同じです。
  `/mnt`に存在していた内容は USB ドライブの内容によって隠されてしまい、USB ドライブがアンマウントされるまで続きます。
  隠されてしまったファイルは、削除されるわけでなく変更もされません。
  しかしバインドマウントやボリュームがアンマウントされない限り、アクセスすることはできません。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- Learn more about [volumes](./volumes.md).
- Learn more about [bind mounts](./bind-mounts.md).
- Learn more about [tmpfs mounts](./tmpfs.md).
- Learn more about [storage drivers](/engine/storage/drivers/), which
  are not related to bind mounts or volumes, but allow you to store data in a
  container's writable layer.
@y
- [ボリューム](./volumes.md) について学びます。
- [バインドマウント](./bind-mounts.md) について学びます。
- [tmpfs マウント](./tmpfs.md) について学びます。
- [ストレージドライバー](__SUBDIR__/engine/storage/drivers/) について学びます。
  これはバインドマウントやボリュームに関連するものではありませんが、
  コンテナーの書き込み可能レイヤーにデータを保存できるものです。
@z
