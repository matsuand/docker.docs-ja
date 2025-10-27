%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
long: |-
    The `docker cp` utility copies the contents of `SRC_PATH` to the `DEST_PATH`.
    You can copy from the container's file system to the local machine or the
    reverse, from the local filesystem to the container. If `-` is specified for
    either the `SRC_PATH` or `DEST_PATH`, you can also stream a tar archive from
    `STDIN` or to `STDOUT`. The `CONTAINER` can be a running or stopped container.
    The `SRC_PATH` or `DEST_PATH` can be a file or directory.
@y
command: docker container cp
aliases: docker container cp, docker cp
short: コンテナー間あるいはローカルファイルシステムとの間でのファイル/フォルダーをコピーします。
long: |-
    `docker cp` コマンドは `SRC_PATH` の内容を `DEST_PATH` にコピーします。
    コンテナー内のファイルシステムからローカルマシンへのコピーができ、その逆にローカルファイルシステムからコンテナーへのコピーもできます。
    `SRC_PATH` や `DEST_PATH` に `-` が指定された場合、`STDIN` からの、あるいは `STDOUT` への tar アーカイブを扱うことになります。
    `CONTAINER` に指定するコンテナーは実行中、停止中のいずれも可能です。
    `SRC_PATH` または `DEST_PATH` はファイルあるいはディレクトリとすることができます。
@z

@x
    The `docker cp` command assumes container paths are relative to the container's
    `/` (root) directory. This means supplying the initial forward slash is optional;
    The command sees `compassionate_darwin:/tmp/foo/myfile.txt` and
    `compassionate_darwin:tmp/foo/myfile.txt` as identical. Local machine paths can
    be an absolute or relative value. The command interprets a local machine's
    relative paths as relative to the current working directory where `docker cp` is
    run.
@y
    `docker cp` コマンドに指定されるコンテナーパスは、コンテナーの `/` (ルート) ディレクトリからの相対パスであるものとして扱います。
    これはつまりパスの先頭にスラッシュをつけるかどうかは任意です。
    `compassionate_darwin:/tmp/foo/myfile.txt` と `compassionate_darwin:tmp/foo/myfile.txt` は同一に扱われます。
    ローカルマシン側のパスは、絶対パス、相対パス両方の指定が可能です。
    ローカルマシンの相対パスは、`docker cp` が実行されたワーキングディレクトリからの相対パスとして解釈されます。
@z

@x
    The `cp` command behaves like the Unix `cp -a` command in that directories are
    copied recursively with permissions preserved if possible. Ownership is set to
    the user and primary group at the destination. For example, files copied to a
    container are created with `UID:GID` of the root user. Files copied to the local
    machine are created with the `UID:GID` of the user which invoked the `docker cp`
    command. However, if you specify the `-a` option, `docker cp` sets the ownership
    to the user and primary group at the source.
    If you specify the `-L` option, `docker cp` follows any symbolic link
    in the `SRC_PATH`.  `docker cp` doesn't create parent directories for
    `DEST_PATH` if they don't exist.
@y
    `cp` コマンドは Unix の `cp -a` コマンドと同じような動作をします。
    つまりディレクトリは再帰的にコピーされ、パーミッションは可能な限り維持されます。
    所有者はコピー先ディレクトリのユーザーとプライマリグループに設定されます。
    たとえばコンテナーにコピーされたファイルの `UID:GID` はルートユーザーのものになります。
    ローカルマシンにコピーされたファイルの `UID:GID` は `docker cp` を実行したユーザーのものになります。
    ただし `docker cp` に `-a` オプションをつけた場合の所有者は、コピー元のユーザーおよびプライマリグループとなります。
    `-L` オプションをつけた場合 `docker cp` は `SRC_PATH` 内のシンボリックリンクをすべてたどります。
    `docker cp` の `DEST_PATH` が存在しなかった場合、そのディレクトリは生成されません。
@z

@x
    Assuming a path separator of `/`, a first argument of `SRC_PATH` and second
    argument of `DEST_PATH`, the behavior is as follows:
@y
    パスセパレーター `/`、第一引数 `SRC_PATH`、第二引数 `DEST_PATH` の状況により、コピー処理は以下のようになります。
@z

@x
    - `SRC_PATH` specifies a file
        - `DEST_PATH` does not exist
            - the file is saved to a file created at `DEST_PATH`
        - `DEST_PATH` does not exist and ends with `/`
            - Error condition: the destination directory must exist.
        - `DEST_PATH` exists and is a file
            - the destination is overwritten with the source file's contents
        - `DEST_PATH` exists and is a directory
            - the file is copied into this directory using the basename from
              `SRC_PATH`
@y
    - `SRC_PATH` がファイルを表している場合
        - `DEST_PATH` が存在しないなら
            - コピー元ファイルが `DEST_PATH` にファイルとして生成され保存されます。
        - `DEST_PATH` が存在せず `/` で終わっているなら
            - エラー。コピー先ディレクトリは存在していなければなりません。
        - `DEST_PATH` が存在し、それがファイルであるなら
            - コピー先がソースファイル内容によって上書きされます。
        - `DEST_PATH` が存在し、それがディレクトリであるなら
            - `SRC_PATH` 内のベース名を使って、ファイルがそのディレクトリにコピーされます。
@z

@x
    - `SRC_PATH` specifies a directory
        - `DEST_PATH` does not exist
            - `DEST_PATH` is created as a directory and the *contents* of the source
               directory are copied into this directory
        - `DEST_PATH` exists and is a file
            - Error condition: cannot copy a directory to a file
        - `DEST_PATH` exists and is a directory
            - `SRC_PATH` does not end with `/.` (that is: _slash_ followed by _dot_)
                - the source directory is copied into this directory
            - `SRC_PATH` does end with `/.` (that is: _slash_ followed by _dot_)
                - the *content* of the source directory is copied into this
                  directory
@y
    - `SRC_PATH` がディレクトリを表している場合
        - `DEST_PATH` が存在しないなら
            - `DEST_PATH` がコピー先ディレクトリとして生成されて、ソースディレクトリ内の *内容* がコピー先ディレクトリにコピーされます。
        - `DEST_PATH` が存在し、それがファイルであるなら
            - エラー。ディレクトリをファイルとしてコピーすることはできません。
        - `DEST_PATH` が存在し、それがディレクトリであるなら
            - `SRC_PATH` が `/.` (_スラッシュ_ と _ドット_) で終わっていない場合
                - ソースディレクトリがコピー先ディレクトリにコピーされます。
            - `SRC_PATH` が `/.` (_スラッシュ_ と _ドット_) で終わっている場合
                - ソースディレクトリの *内容* がコピー先ディレクトリにコピーされます。
@z

@x
    The command requires `SRC_PATH` and `DEST_PATH` to exist according to the above
    rules. If `SRC_PATH` is local and is a symbolic link, the symbolic link, not
    the target, is copied by default. To copy the link target and not the link, specify
    the `-L` option.
@y
    このコマンドでは上記ルールに従って `SRC_PATH` や `DEST_PATH` の存在を要求しています。
    `SRC_PATH` がローカルであって、かつシンボリックリンクである場合、リンク先ではなくシンボリックリンクそのものがコピーされます。
    これがデフォルトです。
    リンクそのものではなくリンク先をコピーしたい場合は `-L` オプションを指定します。
@z

@x
    A colon (`:`) is used as a delimiter between `CONTAINER` and its path. You can
    also use `:` when specifying paths to a `SRC_PATH` or `DEST_PATH` on a local
    machine, for example  `file:name.txt`. If you use a `:` in a local machine path,
    you must be explicit with a relative or absolute path, for example:
@y
    `CONTAINER` とパスとの間のデリミターにはコロン (`:`) を用います。
    またローカルマシン上の `SRC_PATH` または `DEST_PATH` を表す場合にも用います。
    たとえば `file:name.txt` です。
    ローカルマシン上のパス表現として `:` を用いる場合は、そのパスが絶対パスなのか相対パスなのかを明示する必要があります。
    その例は以下のとおりです。
@z

@x
        `/path/to/file:name.txt` or `./file:name.txt`
@y
    ```text
    `/path/to/file:name.txt` または `./file:name.txt`
    ```
@z

@x
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
@y
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
@z

% options:

@x archive
      description: Archive mode (copy all uid/gid information)
@y
      description: アーカイブモード (uid/gid 情報をすべてコピーします)。
@z

@x follow-link
      description: Always follow symbol link in SRC_PATH
@y
      description: SRC_PATH 内のシンボリックリンクをすべてたどります。
@z

@x quiet
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
@y
      description: |
        コピー時の進捗状況の出力を行いません。
        ターミナルがアタッチされていない場合、進捗出力は自動的に行われません。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    Copy a local file into container
@y
examples: |-
    ローカルにあるファイルをコンテナーにコピーします。
@z

% snip command...

@x
    Copy files from container to local path
@y
    コンテナーにあるファイルをローカルパスにコピーします。
@z

% snip command...

@x
    Copy a file from container to stdout. Note `cp` command produces a tar stream
@y
    コンテナーからコピーしたファイルを stdout に出力します。
    `cp` コマンドの出力は tar ストリームとして生成されます。
@z

% snip command...

@x
    ### Corner cases
@y
    ### 特殊なケース {#corner-cases}
@z

@x
    It isn't possible to copy certain system files such as resources under
    `/proc`, `/sys`, `/dev`, [tmpfs](/reference/cli/docker/container/run/#tmpfs), and mounts created by
    the user in the container. However, you can still copy such files by manually
    running `tar` in `docker exec`. Both of the following examples do the same thing
    in different ways (consider `SRC_PATH` and `DEST_PATH` are directories):
@y
    特定のシステムファイルはコピーすることができません。
    たとえば `/proc`, `/sys`, `/dev`, [tmpfs](__SUBDIR__/reference/cli/docker/container/run/#tmpfs) といったディレクトリ配下にあるリソースや、コンテナー内にユーザーが生成したマウントなどです。
    ただし `docker exec` において手動で `tar` を実行させれば、そのようなファイルであってもコピーが可能です。
    以下に示す例は同じ処理内容を、異なる方法によって実現するものです。
    (`SRC_PATH` および `DEST_PATH` はディレクトリであるとします。)
@z

% snip command...

@x
    Using `-` as the `SRC_PATH` streams the contents of `STDIN` as a tar archive.
    The command extracts the content of the tar to the `DEST_PATH` in container's
    filesystem. In this case, `DEST_PATH` must specify a directory. Using `-` as
    the `DEST_PATH` streams the contents of the resource as a tar archive to `STDOUT`.
@y
    `SRC_PATH` として `-` を用いているのは、`STDIN` の内容を tar アーカイブとして出力するためです。
    コマンドはその tar の内容を、コンテナーファイルシステム内の `DEST_PATH` に伸長 (解凍) します。
    この場合 `DEST_PATH` は必ずディレクトリを表していなければなりません。
    `DEST_PATH` に `-` を指定すると、リソース内容を tar アーカイブとして `STDOUT` に出力します。
@z

% snip directives...
