%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker image build
aliases: docker image build, docker build, docker buildx build, docker builder build
short: Build an image from a Dockerfile
long: |-
    The `docker build` command builds Docker images from a Dockerfile and a
    "context". A build's context is the set of files located in the specified
    `PATH` or `URL`. The build process can refer to any of the files in the
    context. For example, your build can use a [*COPY*](/reference/dockerfile/#copy)
    instruction to reference a file in the context.
@y
command: docker image build
aliases: docker image build, docker build, docker buildx build, docker builder build
short: Dockerfile からイメージをビルドします。
long: |-
    `docker build` コマンドは Dockerfile と "コンテキスト" (context) から Docker イメージをビルドします。
    ビルド時のコンテキストとは、`PATH` または `URL` によって指定された場所にあるファイルの集まりのことです。
    ビルド処理においては、コンテキスト内のどのファイルでも参照できます。
    たとえばビルドにおいて [*COPY*](__SUBDIR__/reference/dockerfile/#copy) 命令を使う場合、コンテキスト内のファイルを参照することができます。
@z

@x
    The `URL` parameter can refer to three kinds of resources: Git repositories,
    pre-packaged tarball contexts, and plain text files.
@y
    `URL` パラメーターは 3 種類のリソースを参照します。
    Git リポジトリ、パッケージングされた tarball コンテキスト、プレーンなテキストファイルの 3 つです。
@z

@x
    ### Git repositories
@y
    ### Git リポジトリ {#git-repositories}
@z

@x
    When the `URL` parameter points to the location of a Git repository, the
    repository acts as the build context. The system recursively fetches the
    repository and its submodules. The commit history isn't preserved. A
    repository is first pulled into a temporary directory on your local host. After
    that succeeds, the command sends the directory to the Docker daemon as the context.
    Local copy gives you the ability to access private repositories using local
    user credentials, VPNs, and so forth.
@y
    `URL` パラメーターが Git リポジトリの場所を指している場合、そのリポジトリがビルドコンテキストとして扱われます。
    システムはリポジトリとサブモジュールを再帰的にフェッチします。
    コミット履歴は保持されません。
    リポジトリは初めに、ローカルホスト内の一時的なディレクトリにプルされます。
    これが正常処理されると、ディレクトリ内容がコンテキストとして Docker デーモンに送信されます。
    ローカルにコピーが存在しているなら、プライベートリポジトリにもアクセス可能になります。
    その際にはローカルにあるユーザー認証情報、VPN 情報などが用いられます。
@z

@x
    > **Note**
    >
    > If the `URL` parameter contains a fragment the system recursively clones
    > the repository and its submodules.
@y
    > **メモ**
    >
    > `URL` パラメーターが部分的なものであった場合、システムはそのリポジトリやサブモジュールを再帰的にクローンします。
@z

@x
    Git URLs accept context configuration in their fragment section, separated by a
    colon (`:`).  The first part represents the reference that Git checks out,
    and can be either a branch, a tag, or a remote reference. The second part
    represents a subdirectory inside the repository used as a build
    context.
@y
    Git URL では、コンテキスト設定にあたって URL の部分指定が可能です。
    部分指定にはコロン（`:`）を使って区切ります。
    コロンより前の 1 つめの項目として Git がチェックアウトを行う URL を指定します。
    これはブランチ、タグ、リモートリファレンスのいずれでも可能です。
    2 つめの項目には、そのリポジトリ内のサブディレクトリを指定します。
    このサブディレクトリがビルドコンテキストとして用いられることになります。
@z

@x
    For example, run this command to use a directory called `docker` in the branch
    `container`:
@y
    たとえば `container` ブランチ内の `docker` というディレクトリを利用するには、以下のように実行します。
@z

% snip command...

@x
    The following table represents all the valid suffixes with their build
    contexts:
@y
    以下に示す表は、ビルドコンテキストとして有効なサフィックス指定の例です。
@z

@x
    | Build Syntax Suffix            | Commit Used           | Build Context Used |
    |--------------------------------|-----------------------|--------------------|
    | `myrepo.git`                   | `refs/heads/master`   | `/`                |
    | `myrepo.git#mytag`             | `refs/tags/mytag`     | `/`                |
    | `myrepo.git#mybranch`          | `refs/heads/mybranch` | `/`                |
    | `myrepo.git#pull/42/head`      | `refs/pull/42/head`   | `/`                |
    | `myrepo.git#:myfolder`         | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#master:myfolder`   | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`     | `/myfolder`        |
    | `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch` | `/myfolder`        |
@y
    | ビルド時のサフィックス指定例   | 利用されるコミット    | 利用されるビルドコンテキスト |
    |--------------------------------|-----------------------|--------------------|
    | `myrepo.git`                   | `refs/heads/master`   | `/`                |
    | `myrepo.git#mytag`             | `refs/tags/mytag`     | `/`                |
    | `myrepo.git#mybranch`          | `refs/heads/mybranch` | `/`                |
    | `myrepo.git#pull/42/head`      | `refs/pull/42/head`   | `/`                |
    | `myrepo.git#:myfolder`         | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#master:myfolder`   | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`     | `/myfolder`        |
    | `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch` | `/myfolder`        |
@z

@x
    ### Tarball contexts
@y
    ### Tarball コンテキスト {#tarball-contexts}
@z

@x
    If you pass a URL to a remote tarball, the command sends the URL itself to the
    daemon:
@y
    URL にリモートの tarball を指定した場合、URL がそのままデーモンに送信されます。
@z

% snip command...

@x
    The host running the Docker daemon performs the download operation,
    which isn't necessarily the same host that issued the build command.
    The Docker daemon fetches `context.tar.gz` and uses it as the
    build context. Tarball contexts must be tar archives conforming to the standard
    `tar` Unix format and can be compressed with any one of the `xz`, `bzip2`,
    `gzip` or `identity` (no compression) formats.
@y
    Docker デーモンが稼働しているホストは、ダウンロード処理を実現します。
    そのホストは build コマンドが実行されたホストと同じである必要はありません。
    Docker デーモンは `context.tar.gz` を取得して、これをビルドコンテキストとして利用します。
    Tarball コンテキストは UNIX `tar` フォーマット標準に適合した tar アーカイブである必要があります。
    これを `xz`、`bzip2`、`gzip` により圧縮したフォーマットも受け付けます。
    `identity`（圧縮なし）のフォーマットも利用できます。
@z

@x
    ### Text files
@y
    ### テキストファイル {#text-files}
@z

@x
    Instead of specifying a context, you can pass a single `Dockerfile` in the
    `URL` or pipe the file in via `STDIN`. To pipe a `Dockerfile` from `STDIN`:
@y
    コンテキストを指定するのではなく、1 つの Dockerfile を指定することができます。
    つまりそのファイル内容を、`STDIN` を介してパイプ入力します。
    `Dockerfile` を `STDIN` からパイプ入力するには、以下のようにします。
@z

% snip command...

@x
    With PowerShell on Windows, you run:
@y
    Windows における Powershell 上では以下のようにします。
@z

% snip command...

@x
    If you use `STDIN` or specify a `URL` pointing to a plain text file, the daemon
    places the contents into a `Dockerfile`, and ignores any `-f`, `--file`
    option. In this scenario, there is no context.
@y
    `STDIN` を利用するか `URL` によりプレーンテキストファイルを指定した場合、デーモンはその内容を `Dockerfile` に書き入れます。
    この場合 `-f` や `--file` オプションは無視されます。
    この状況では、コンテキストは存在しないものとなります。
@z

@x
    By default the `docker build` command looks for a `Dockerfile` at the root
    of the build context. The `-f`, `--file`, option lets you specify the path to
    an alternative file to use instead. This is useful in cases that use the same
    set of files for multiple builds. The path must be to a file within the
    build context. Relative path are interpreted as relative to the root of the
    context.
@y
    `docker build` コマンドが `Dockerfile` を探しにいく場所は、デフォルトではビルドコンテキストのルートディレクトリです。
    `-f` や `--file` オプションを使うと、別のファイルを利用するように指定できます。
    これは同一のファイル群を使って、ビルドを何度か行う場合に便利です。
    パスはビルドコンテキスト内のファイルを表わしていなければなりません。
    相対パスが指定された場合は、コンテキストのルートからの相対パスと解釈されます。
@z

@x
    In most cases, it's best to put each Dockerfile in an empty directory. Then,
    add to that directory only the files needed for building the Dockerfile. To
    increase the build's performance, you can exclude files and directories by
    adding a `.dockerignore` file to that directory as well. For information on
    creating one, see the [.dockerignore file](/reference/dockerfile/#dockerignore-file).
@y
    In most cases, it's best to put each Dockerfile in an empty directory. Then,
    add to that directory only the files needed for building the Dockerfile. To
    increase the build's performance, you can exclude files and directories by
    adding a `.dockerignore` file to that directory as well. For information on
    creating one, see the [.dockerignore file](__SUBDIR__/reference/dockerfile/#dockerignore-file).
@z

@x
    If the Docker client loses connection to the daemon, it cancels the build.
    This happens if you interrupt the Docker client with `CTRL-c` or if the Docker
    client is killed for any reason. If the build initiated a pull which is still
    running at the time the build is cancelled, the client also cancels the pull.
@y
    If the Docker client loses connection to the daemon, it cancels the build.
    This happens if you interrupt the Docker client with `CTRL-c` or if the Docker
    client is killed for any reason. If the build initiated a pull which is still
    running at the time the build is cancelled, the client also cancels the pull.
@z

@x
usage: docker image build [OPTIONS] PATH | URL | -
@y
usage: docker image build [OPTIONS] PATH | URL | -
@z

% options:

@x add-host
      description: Add a custom host-to-IP mapping (`host:ip`)
@y
      description: Add a custom host-to-IP mapping (`host:ip`)
@z

@x build-arg
      description: Set build-time variables
@y
      description: Set build-time variables
@z

@x cache-from
      description: Images to consider as cache sources
@y
      description: Images to consider as cache sources
@z

@x cgroup-parent
      description: Set the parent cgroup for the `RUN` instructions during build
@y
      description: Set the parent cgroup for the `RUN` instructions during build
@z

@x compress
      description: Compress the build context using gzip
@y
      description: Compress the build context using gzip
@z

@x cpu-period
      description: Limit the CPU CFS (Completely Fair Scheduler) period
@y
      description: Limit the CPU CFS (Completely Fair Scheduler) period
@z

@x cpu-quota
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
@y
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
@z

@x cpu-shares
      description: CPU shares (relative weight)
@y
      description: CPU shares (relative weight)
@z

@x cpuset-cpus
      description: CPUs in which to allow execution (0-3, 0,1)
@y
      description: CPUs in which to allow execution (0-3, 0,1)
@z

@x cpuset-mems
      description: MEMs in which to allow execution (0-3, 0,1)
@y
      description: MEMs in which to allow execution (0-3, 0,1)
@z

@x disable-content-trust
      description: Skip image verification
@y
      description: Skip image verification
@z

@x file
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
@y
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
@z

@x force-rm
      description: Always remove intermediate containers
@y
      description: Always remove intermediate containers
@z

@x iidfile
      description: Write the image ID to the file
@y
      description: Write the image ID to the file
@z

@x isolation
      description: Container isolation technology
@y
      description: Container isolation technology
@z

@x label
      description: Set metadata for an image
@y
      description: Set metadata for an image
@z

@x memory
      description: Memory limit
@y
      description: Memory limit
@z

@x memory-swap
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@y
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@z

@x network
      description: Set the networking mode for the RUN instructions during build
@y
      description: Set the networking mode for the RUN instructions during build
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: Do not use cache when building the image
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: Set platform if server is multi-platform capable
@z

@x pull
      description: Always attempt to pull a newer version of the image
@y
      description: Always attempt to pull a newer version of the image
@z

@x quiet
      description: Suppress the build output and print image ID on success
@y
      description: Suppress the build output and print image ID on success
@z

@x rm
      description: Remove intermediate containers after a successful build
@y
      description: Remove intermediate containers after a successful build
@z

@x security-opt
      description: Security options
@y
      description: Security options
@z

@x shm-size
      description: Size of `/dev/shm`
@y
      description: Size of `/dev/shm`
@z

@x squash
      description: Squash newly built layers into a single new layer
@y
      description: Squash newly built layers into a single new layer
@z

@x tag
      description: Name and optionally a tag in the `name:tag` format
@y
      description: Name and optionally a tag in the `name:tag` format
@z

@x target
      description: Set the target build stage to build.
@y
      description: Set the target build stage to build.
@z

@x ulimit
      description: Ulimit options
@y
      description: Ulimit options
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Build with PATH
@y
examples: |-
    ### Build with PATH
@z

% snip command...

@x
    This example specifies that the `PATH` is `.`, and so `tar`s all the files in the
    local directory and sends them to the Docker daemon. The `PATH` specifies
    where to find the files for the "context" of the build on the Docker daemon.
    Remember that the daemon could be running on a remote machine and that no
    parsing of the Dockerfile happens at the client side (where you're running
    `docker build`). That means that all the files at `PATH` are sent, not just
    the ones listed to [`ADD`](/reference/dockerfile/#add)
    in the Dockerfile.
@y
    This example specifies that the `PATH` is `.`, and so `tar`s all the files in the
    local directory and sends them to the Docker daemon. The `PATH` specifies
    where to find the files for the "context" of the build on the Docker daemon.
    Remember that the daemon could be running on a remote machine and that no
    parsing of the Dockerfile happens at the client side (where you're running
    `docker build`). That means that all the files at `PATH` are sent, not just
    the ones listed to [`ADD`](__SUBDIR__/reference/dockerfile/#add)
    in the Dockerfile.
@z

@x
    The transfer of context from the local machine to the Docker daemon is what the
    `docker` client means when you see the "Sending build context" message.
@y
    The transfer of context from the local machine to the Docker daemon is what the
    `docker` client means when you see the "Sending build context" message.
@z

@x
    If you wish to keep the intermediate containers after the build is complete,
    you must use `--rm=false`. This doesn't affect the build cache.
@y
    If you wish to keep the intermediate containers after the build is complete,
    you must use `--rm=false`. This doesn't affect the build cache.
@z

@x
    ### Build with URL
@y
    ### Build with URL
@z

% snip command...

@x
    This clones the GitHub repository, using the cloned repository as context,
    and the Dockerfile at the root of the repository. You can
    specify an arbitrary Git repository by using the `git://` or `git@` scheme.
@y
    This clones the GitHub repository, using the cloned repository as context,
    and the Dockerfile at the root of the repository. You can
    specify an arbitrary Git repository by using the `git://` or `git@` scheme.
@z

% snip command...

@x
    This sends the URL `http://server/ctx.tar.gz` to the Docker daemon, which
    downloads and extracts the referenced tarball. The `-f ctx/Dockerfile`
    parameter specifies a path inside `ctx.tar.gz` to the `Dockerfile` used
    to build the image. Any `ADD` commands in that `Dockerfile` that refer to local
    paths must be relative to the root of the contents inside `ctx.tar.gz`. In the
    example above, the tarball contains a directory `ctx/`, so the `ADD
    ctx/container.cfg /` operation works as expected.
@y
    This sends the URL `http://server/ctx.tar.gz` to the Docker daemon, which
    downloads and extracts the referenced tarball. The `-f ctx/Dockerfile`
    parameter specifies a path inside `ctx.tar.gz` to the `Dockerfile` used
    to build the image. Any `ADD` commands in that `Dockerfile` that refer to local
    paths must be relative to the root of the contents inside `ctx.tar.gz`. In the
    example above, the tarball contains a directory `ctx/`, so the `ADD
    ctx/container.cfg /` operation works as expected.
@z

@x
    ### Build with `-`
@y
    ### Build with `-`
@z

% snip command...

@x
    This example reads a Dockerfile from `STDIN` without context. Due to the lack of a
    context, the command doesn't send contents of any local directory to the Docker daemon.
    Since there is no context, a Dockerfile `ADD` only works if it refers to a
    remote URL.
@y
    This example reads a Dockerfile from `STDIN` without context. Due to the lack of a
    context, the command doesn't send contents of any local directory to the Docker daemon.
    Since there is no context, a Dockerfile `ADD` only works if it refers to a
    remote URL.
@z

% snip command...

@x
    This example builds an image for a compressed context read from `STDIN`.
    Supported formats are: `bzip2`, `gzip` and `xz`.
@y
    This example builds an image for a compressed context read from `STDIN`.
    Supported formats are: `bzip2`, `gzip` and `xz`.
@z

@x
    ### Use a .dockerignore file
@y
    ### Use a .dockerignore file
@z

% snip command...

@x
    This example shows the use of the `.dockerignore` file to exclude the `.git`
    directory from the context. You can see its effect in the changed size of the
    uploaded context. The builder reference contains detailed information on
    [creating a .dockerignore file](/reference/dockerfile/#dockerignore-file).
@y
    This example shows the use of the `.dockerignore` file to exclude the `.git`
    directory from the context. You can see its effect in the changed size of the
    uploaded context. The builder reference contains detailed information on
    [creating a .dockerignore file](__SUBDIR__/reference/dockerfile/#dockerignore-file).
@z

@x
    When using the [BuildKit backend](/build/buildkit/),
    `docker build` searches for a `.dockerignore` file relative to the Dockerfile
    name. For example, running `docker build -f myapp.Dockerfile .` first looks
    for an ignore file named `myapp.Dockerfile.dockerignore`. If it can't find such a file,
    if present, it uses the `.dockerignore` file. Using a Dockerfile based
    `.dockerignore` is useful if a project contains multiple Dockerfiles that expect
    to ignore different sets of files.
@y
    When using the [BuildKit backend](__SUBDIR__/build/buildkit/),
    `docker build` searches for a `.dockerignore` file relative to the Dockerfile
    name. For example, running `docker build -f myapp.Dockerfile .` first looks
    for an ignore file named `myapp.Dockerfile.dockerignore`. If it can't find such a file,
    if present, it uses the `.dockerignore` file. Using a Dockerfile based
    `.dockerignore` is useful if a project contains multiple Dockerfiles that expect
    to ignore different sets of files.
@z

@x
    ### Tag an image (-t, --tag) {#tag}
@y
    ### Tag an image (-t, --tag) {#tag}
@z

% snip command...

@x
    This examples builds in the same way as the previous example, but it then tags the resulting
    image. The repository name will be `vieux/apache` and the tag `2.0`.
@y
    This examples builds in the same way as the previous example, but it then tags the resulting
    image. The repository name will be `vieux/apache` and the tag `2.0`.
@z

@x
    [Read more about valid tags](/reference/cli/docker/image/tag/).
@y
    [Read more about valid tags](__SUBDIR__/reference/cli/docker/image/tag/).
@z

@x
    You can apply multiple tags to an image. For example, you can apply the `latest`
    tag to a newly built image and add another tag that references a specific
    version.
@y
    You can apply multiple tags to an image. For example, you can apply the `latest`
    tag to a newly built image and add another tag that references a specific
    version.
@z

@x
    For example, to tag an image both as `whenry/fedora-jboss:latest` and
    `whenry/fedora-jboss:v2.1`, use the following:
@y
    For example, to tag an image both as `whenry/fedora-jboss:latest` and
    `whenry/fedora-jboss:v2.1`, use the following:
@z

% snip command...

@x
    ### Specify a Dockerfile (-f, --file) {#file}
@y
    ### Specify a Dockerfile (-f, --file) {#file}
@z

% snip command...

@x
    This uses a file called `Dockerfile.debug` for the build instructions
    instead of `Dockerfile`.
@y
    This uses a file called `Dockerfile.debug` for the build instructions
    instead of `Dockerfile`.
@z

% snip command...

@x
    The above command uses the current directory as the build context and reads
    a Dockerfile from stdin.
@y
    The above command uses the current directory as the build context and reads
    a Dockerfile from stdin.
@z

% snip command...

@x
    The above commands build the current build context (as specified by the
    `.`) twice. Once using a debug version of a `Dockerfile` and once using a
    production version.
@y
    The above commands build the current build context (as specified by the
    `.`) twice. Once using a debug version of a `Dockerfile` and once using a
    production version.
@z

% snip command...

@x
    These two `docker build` commands do the exact same thing. They both use the
    contents of the `debug` file instead of looking for a `Dockerfile` and use
    `/home/me/myapp` as the root of the build context. Note that `debug` is in the
    directory structure of the build context, regardless of how you refer to it on
    the command line.
@y
    These two `docker build` commands do the exact same thing. They both use the
    contents of the `debug` file instead of looking for a `Dockerfile` and use
    `/home/me/myapp` as the root of the build context. Note that `debug` is in the
    directory structure of the build context, regardless of how you refer to it on
    the command line.
@z

@x
    > **Note**
    >
    > `docker build` returns a `no such file or directory` error if the
    > file or directory doesn't exist in the uploaded context. This may
    > happen if there is no context, or if you specify a file that's
    > elsewhere on the Host system. The context is limited to the current
    > directory (and its children) for security reasons, and to ensure
    > repeatable builds on remote Docker hosts. This is also the reason why
    > `ADD ../file` doesn't work.
@y
    > **Note**
    >
    > `docker build` returns a `no such file or directory` error if the
    > file or directory doesn't exist in the uploaded context. This may
    > happen if there is no context, or if you specify a file that's
    > elsewhere on the Host system. The context is limited to the current
    > directory (and its children) for security reasons, and to ensure
    > repeatable builds on remote Docker hosts. This is also the reason why
    > `ADD ../file` doesn't work.
@z

@x
    ### Use a custom parent cgroup (--cgroup-parent) {#cgroup-parent}
@y
    ### Use a custom parent cgroup (--cgroup-parent) {#cgroup-parent}
@z

@x
    When you run `docker build` with the `--cgroup-parent` option, the daemon runs the containers
    used in the build with the [corresponding `docker run` flag](/reference/cli/docker/container/run/#cgroup-parent).
@y
    When you run `docker build` with the `--cgroup-parent` option, the daemon runs the containers
    used in the build with the [corresponding `docker run` flag](__SUBDIR__/reference/cli/docker/container/run/#cgroup-parent).
@z

@x
    ### Set ulimits in container (--ulimit) {#ulimit}
@y
    ### Set ulimits in container (--ulimit) {#ulimit}
@z

@x
    Using the `--ulimit` option with `docker build` causes the daemon to start each build step's
    container using those [`--ulimit` flag values](/reference/cli/docker/container/run/#ulimit).
@y
    Using the `--ulimit` option with `docker build` causes the daemon to start each build step's
    container using those [`--ulimit` flag values](__SUBDIR__/reference/cli/docker/container/run/#ulimit).
@z

@x
    ### Set build-time variables (--build-arg) {#build-arg}
@y
    ### Set build-time variables (--build-arg) {#build-arg}
@z

@x
    You can use `ENV` instructions in a Dockerfile to define variable values. These
    values persist in the built image. Often persistence isn't what you want. Users
    want to specify variables differently depending on which host they build an
    image on.
@y
    You can use `ENV` instructions in a Dockerfile to define variable values. These
    values persist in the built image. Often persistence isn't what you want. Users
    want to specify variables differently depending on which host they build an
    image on.
@z

@x
    A good example is `http_proxy` or source versions for pulling intermediate
    files. The `ARG` instruction lets Dockerfile authors define values that users
    can set at build-time using the  `--build-arg` flag:
@y
    A good example is `http_proxy` or source versions for pulling intermediate
    files. The `ARG` instruction lets Dockerfile authors define values that users
    can set at build-time using the  `--build-arg` flag:
@z

% snip command...

@x
    This flag allows you to pass the build-time variables that are
    accessed like regular environment variables in the `RUN` instruction of the
    Dockerfile. These values don't persist in the intermediate or final images
    like `ENV` values do. You must add `--build-arg` for each build argument.
@y
    This flag allows you to pass the build-time variables that are
    accessed like regular environment variables in the `RUN` instruction of the
    Dockerfile. These values don't persist in the intermediate or final images
    like `ENV` values do. You must add `--build-arg` for each build argument.
@z

@x
    Using this flag doesn't alter the output you see when the build process echoes the`ARG` lines from the
    Dockerfile.
@y
    Using this flag doesn't alter the output you see when the build process echoes the`ARG` lines from the
    Dockerfile.
@z

@x
    For detailed information on using `ARG` and `ENV` instructions, see the
    [Dockerfile reference](/reference/dockerfile/).
@y
    For detailed information on using `ARG` and `ENV` instructions, see the
    [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@y
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@z

% snip command...

@x
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](/reference/cli/docker/container/run/#env)
    for more information.
@y
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](__SUBDIR__/reference/cli/docker/container/run/#env)
    for more information.
@z

@x
    ### Optional security options (--security-opt) {#security-opt}
@y
    ### Optional security options (--security-opt) {#security-opt}
@z

@x
    This flag is only supported on a daemon running on Windows, and only supports
    the `credentialspec` option. The `credentialspec` must be in the format
    `file://spec.txt` or `registry://keyname`.
@y
    This flag is only supported on a daemon running on Windows, and only supports
    the `credentialspec` option. The `credentialspec` must be in the format
    `file://spec.txt` or `registry://keyname`.
@z

@x
    ### Specify isolation technology for container (--isolation) {#isolation}
@y
    ### Specify isolation technology for container (--isolation) {#isolation}
@z

@x
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation
    technology. On Linux, the only supported is the `default` option which uses
    Linux namespaces. On Microsoft Windows, you can specify these values:
@y
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation
    technology. On Linux, the only supported is the `default` option which uses
    Linux namespaces. On Microsoft Windows, you can specify these values:
@z

@x
    | Value     | Description                                                                                                                                                                    |
    |-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` . If the `daemon` does not specify an isolation technology, Microsoft Windows uses `process` as its default value. |
    | `process` | Namespace isolation only.                                                                                                                                                      |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                                                                                                                  |
@y
    | Value     | Description                                                                                                                                                                    |
    |-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` . If the `daemon` does not specify an isolation technology, Microsoft Windows uses `process` as its default value. |
    | `process` | Namespace isolation only.                                                                                                                                                      |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                                                                                                                  |
@z

@x
    Specifying the `--isolation` flag without a value is the same as setting `--isolation="default"`.
@y
    Specifying the `--isolation` flag without a value is the same as setting `--isolation="default"`.
@z

@x
    ### Add entries to container hosts file (--add-host) {#add-host}
@y
    ### Add entries to container hosts file (--add-host) {#add-host}
@z

@x
    You can add other hosts into a build container's `/etc/hosts` file by using one
    or more `--add-host` flags. This example adds static addresses for hosts named
    `my-hostname` and `my_hostname_v6`:
@y
    You can add other hosts into a build container's `/etc/hosts` file by using one
    or more `--add-host` flags. This example adds static addresses for hosts named
    `my-hostname` and `my_hostname_v6`:
@z

% snip command...

@x
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@y
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@z

% snip command...

@x
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@y
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@z

% snip command...

@x
    ### Specifying target build stage (--target) {#target}
@y
    ### Specifying target build stage (--target) {#target}
@z

@x
    When building a Dockerfile with multiple build stages, you can use the `--target`
    option to specify an intermediate build stage by name as a final stage for the
    resulting image. The daemon skips commands after the target stage.
@y
    When building a Dockerfile with multiple build stages, you can use the `--target`
    option to specify an intermediate build stage by name as a final stage for the
    resulting image. The daemon skips commands after the target stage.
@z

% snip code...
% snip command...

@x
    ### Custom build outputs (--output) {#output}
@y
    ### Custom build outputs (--output) {#output}
@z

@x
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin which provides more
    > output type options.
@y
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](__SUBDIR__/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin which provides more
    > output type options.
@z

@x
    By default, a local container image is created from the build result. The
    `--output` (or `-o`) flag allows you to override this behavior, and specify a
    custom exporter. Custom exporters allow you to export the build
    artifacts as files on the local filesystem instead of a Docker image, which can
    be useful for generating local binaries, code generation etc.
@y
    By default, a local container image is created from the build result. The
    `--output` (or `-o`) flag allows you to override this behavior, and specify a
    custom exporter. Custom exporters allow you to export the build
    artifacts as files on the local filesystem instead of a Docker image, which can
    be useful for generating local binaries, code generation etc.
@z

@x
    The value for `--output` is a CSV-formatted string defining the exporter type
    and options that supports `local` and `tar` exporters.
@y
    The value for `--output` is a CSV-formatted string defining the exporter type
    and options that supports `local` and `tar` exporters.
@z

@x
    The `local` exporter writes the resulting build files to a directory on the client side. The
    `tar` exporter is similar but writes the files as a single tarball (`.tar`).
@y
    The `local` exporter writes the resulting build files to a directory on the client side. The
    `tar` exporter is similar but writes the files as a single tarball (`.tar`).
@z

@x
    If you specify no type, the value defaults to the output directory of the local
    exporter. Use a hyphen (`-`) to write the output tarball to standard output
    (`STDOUT`).
@y
    If you specify no type, the value defaults to the output directory of the local
    exporter. Use a hyphen (`-`) to write the output tarball to standard output
    (`STDOUT`).
@z

@x
    The following example builds an image using the current directory (`.`) as a build
    context, and exports the files to a directory named `out` in the current directory.
    If the directory does not exist, Docker creates the directory automatically:
@y
    The following example builds an image using the current directory (`.`) as a build
    context, and exports the files to a directory named `out` in the current directory.
    If the directory does not exist, Docker creates the directory automatically:
@z

% snip command...

@x
    The example above uses the short-hand syntax, omitting the `type` options, and
    thus uses the default (`local`) exporter. The example below shows the equivalent
    using the long-hand CSV syntax, specifying both `type` and `dest` (destination
    path):
@y
    The example above uses the short-hand syntax, omitting the `type` options, and
    thus uses the default (`local`) exporter. The example below shows the equivalent
    using the long-hand CSV syntax, specifying both `type` and `dest` (destination
    path):
@z

% snip command...

@x
    Use the `tar` type to export the files as a `.tar` archive:
@y
    Use the `tar` type to export the files as a `.tar` archive:
@z

% snip command...

@x
    The example below shows the equivalent when using the short-hand syntax. In this
    case, `-` is specified as destination, which automatically selects the `tar` type,
    and writes the output tarball to standard output, which is then redirected to
    the `out.tar` file:
@y
    The example below shows the equivalent when using the short-hand syntax. In this
    case, `-` is specified as destination, which automatically selects the `tar` type,
    and writes the output tarball to standard output, which is then redirected to
    the `out.tar` file:
@z

% snip command...

@x
    The `--output` option exports all files from the target stage. A common pattern
    for exporting only specific files is to do multi-stage builds and to copy the
    desired files to a new scratch stage with [`COPY --from`](/reference/dockerfile/#copy).
@y
    The `--output` option exports all files from the target stage. A common pattern
    for exporting only specific files is to do multi-stage builds and to copy the
    desired files to a new scratch stage with [`COPY --from`](__SUBDIR__/reference/dockerfile/#copy).
@z

@x
    The example, the `Dockerfile` below uses a separate stage to collect the
    build artifacts for exporting:
@y
    The example, the `Dockerfile` below uses a separate stage to collect the
    build artifacts for exporting:
@z

% snip code...

@x
    When building the Dockerfile with the `-o` option, the command only exports the files from the final
    stage to the `out` directory, in this case, the `vndr` binary:
@y
    When building the Dockerfile with the `-o` option, the command only exports the files from the final
    stage to the `out` directory, in this case, the `vndr` binary:
@z

% snip command...

@x
    ### Specifying external cache sources (--cache-from) {#cache-from}
@y
    ### Specifying external cache sources (--cache-from) {#cache-from}
@z

@x
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin. The previous
    > builder has limited support for reusing cache from pre-pulled images.
@y
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](__SUBDIR__/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin. The previous
    > builder has limited support for reusing cache from pre-pulled images.
@z

@x
    In addition to local build cache, the builder can reuse the cache generated from
    previous builds with the `--cache-from` flag pointing to an image in the registry.
@y
    In addition to local build cache, the builder can reuse the cache generated from
    previous builds with the `--cache-from` flag pointing to an image in the registry.
@z

@x
    To use an image as a cache source, cache metadata needs to be written into the
    image on creation. You can do this by setting `--build-arg BUILDKIT_INLINE_CACHE=1`
    when building the image. After that, you can use the built image as a cache source
    for subsequent builds.
@y
    To use an image as a cache source, cache metadata needs to be written into the
    image on creation. You can do this by setting `--build-arg BUILDKIT_INLINE_CACHE=1`
    when building the image. After that, you can use the built image as a cache source
    for subsequent builds.
@z

@x
    Upon importing the cache, the builder only pulls the JSON metadata from the
    registry and determine possible cache hits based on that information. If there
    is a cache hit, the builder pulls the matched layers into the local environment.
@y
    Upon importing the cache, the builder only pulls the JSON metadata from the
    registry and determine possible cache hits based on that information. If there
    is a cache hit, the builder pulls the matched layers into the local environment.
@z

@x
    In addition to images, the cache can also be pulled from special cache manifests
    generated by [`buildx`](https://github.com/docker/buildx) or the BuildKit CLI
    (`buildctl`). These manifests (when built with the `type=registry` and `mode=max`
    options) allow pulling layer data for intermediate stages in multi-stage builds.
@y
    In addition to images, the cache can also be pulled from special cache manifests
    generated by [`buildx`](https://github.com/docker/buildx) or the BuildKit CLI
    (`buildctl`). These manifests (when built with the `type=registry` and `mode=max`
    options) allow pulling layer data for intermediate stages in multi-stage builds.
@z

@x
    The following example builds an image with inline-cache metadata and pushes it
    to a registry, then uses the image as a cache source on another machine:
@y
    The following example builds an image with inline-cache metadata and pushes it
    to a registry, then uses the image as a cache source on another machine:
@z

% snip command...

@x
    After pushing the image, the image is used as cache source on another machine.
    BuildKit automatically pulls the image from the registry if needed.
@y
    After pushing the image, the image is used as cache source on another machine.
    BuildKit automatically pulls the image from the registry if needed.
@z

@x
    On another machine:
@y
    On another machine:
@z

% snip command...

@x
    ### Set the networking mode for the RUN instructions during build (--network) {#network}
@y
    ### Set the networking mode for the RUN instructions during build (--network) {#network}
@z

@x
    #### Overview
@y
    #### Overview
@z

@x
    Available options for the networking mode are:
@y
    Available options for the networking mode are:
@z

@x
    - `default` (default): Run in the default network.
    - `none`: Run with no network access.
    - `host`: Run in the host’s network environment.
@y
    - `default` (default): Run in the default network.
    - `none`: Run with no network access.
    - `host`: Run in the host’s network environment.
@z

@x
    Find more details in the [Dockerfile documentation](/reference/dockerfile/#run---network).
@y
    Find more details in the [Dockerfile documentation](__SUBDIR__/reference/dockerfile/#run---network).
@z

@x
    ### Squash an image's layers (--squash) (experimental) {#squash}
@y
    ### Squash an image's layers (--squash) (experimental) {#squash}
@z

@x
    #### Overview
@y
    #### Overview
@z

@x
    > **Note**
    > The `--squash` option is an experimental feature, and should not be considered
    > stable.
@y
    > **Note**
    > The `--squash` option is an experimental feature, and should not be considered
    > stable.
@z

@x
    Once the image is built, this flag squashes the new layers into a new image with
    a single new layer. Squashing doesn't destroy any existing image, rather it
    creates a new image with the content of the squashed layers. This effectively
    makes it look like all `Dockerfile` commands were created with a single layer.
    The `--squash` flag preserves the build cache.
@y
    Once the image is built, this flag squashes the new layers into a new image with
    a single new layer. Squashing doesn't destroy any existing image, rather it
    creates a new image with the content of the squashed layers. This effectively
    makes it look like all `Dockerfile` commands were created with a single layer.
    The `--squash` flag preserves the build cache.
@z

@x
    Squashing layers can be beneficial if your Dockerfile produces multiple layers
    modifying the same files. For example, files created in one step and
    removed in another step. For other use-cases, squashing images may actually have
    a negative impact on performance. When pulling an image consisting of multiple
    layers, the daemon can pull layers in parallel and allows sharing layers between
    images (saving space).
@y
    Squashing layers can be beneficial if your Dockerfile produces multiple layers
    modifying the same files. For example, files created in one step and
    removed in another step. For other use-cases, squashing images may actually have
    a negative impact on performance. When pulling an image consisting of multiple
    layers, the daemon can pull layers in parallel and allows sharing layers between
    images (saving space).
@z

@x
    For most use cases, multi-stage builds are a better alternative, as they give more
    fine-grained control over your build, and can take advantage of future
    optimizations in the builder. Refer to the [Multi-stage builds](/build/building/multi-stage/)
    section for more information.
@y
    For most use cases, multi-stage builds are a better alternative, as they give more
    fine-grained control over your build, and can take advantage of future
    optimizations in the builder. Refer to the [Multi-stage builds](__SUBDIR__/build/building/multi-stage/)
    section for more information.
@z

@x
    #### Known limitations
@y
    #### Known limitations
@z

@x
    The `--squash` option has a number of known limitations:
@y
    The `--squash` option has a number of known limitations:
@z

@x
    - When squashing layers, the resulting image can't take advantage of layer
      sharing with other images, and may use significantly more space. Sharing the
      base image is still supported.
    - When using this option you may see significantly more space used due to
      storing two copies of the image, one for the build cache with all the cache
      layers intact, and one for the squashed version.
    - While squashing layers may produce smaller images, it may have a negative
      impact on performance, as a single layer takes longer to extract, and
      you can't parallelize downloading a single layer.
    - When attempting to squash an image that doesn't make changes to the
      filesystem (for example, the Dockerfile only contains `ENV` instructions),
      the squash step will fail (see [issue #33823](https://github.com/moby/moby/issues/33823)).
@y
    - When squashing layers, the resulting image can't take advantage of layer
      sharing with other images, and may use significantly more space. Sharing the
      base image is still supported.
    - When using this option you may see significantly more space used due to
      storing two copies of the image, one for the build cache with all the cache
      layers intact, and one for the squashed version.
    - While squashing layers may produce smaller images, it may have a negative
      impact on performance, as a single layer takes longer to extract, and
      you can't parallelize downloading a single layer.
    - When attempting to squash an image that doesn't make changes to the
      filesystem (for example, the Dockerfile only contains `ENV` instructions),
      the squash step will fail (see [issue #33823](https://github.com/moby/moby/issues/33823)).
@z

@x
    #### Prerequisites
@y
    #### Prerequisites
@z

@x
    The example on this page is using experimental mode in Docker 23.03.
@y
    The example on this page is using experimental mode in Docker 23.03.
@z

@x
    You can enable experimental mode by using the `--experimental` flag when starting
    the Docker daemon or setting `experimental: true` in the `daemon.json` configuration
    file.
@y
    You can enable experimental mode by using the `--experimental` flag when starting
    the Docker daemon or setting `experimental: true` in the `daemon.json` configuration
    file.
@z

@x
    By default, experimental mode is disabled. To see the current configuration of
    the Docker daemon, use the `docker version` command and check the `Experimental`
    line in the `Engine` section:
@y
    By default, experimental mode is disabled. To see the current configuration of
    the Docker daemon, use the `docker version` command and check the `Experimental`
    line in the `Engine` section:
@z

% snip output...

@x
    #### Build an image with the `--squash` flag
@y
    #### Build an image with the `--squash` flag
@z

@x
    The following is an example of a build with the `--squash` flag.  Below is the
    `Dockerfile`:
@y
    The following is an example of a build with the `--squash` flag.  Below is the
    `Dockerfile`:
@z

% snip code...

@x
    Next, build an image named `test` using the `--squash` flag.
@y
    Next, build an image named `test` using the `--squash` flag.
@z

% snip command...

@x
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@y
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@z

% snip command...

@x
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
@y
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
@z

% snip directives...
