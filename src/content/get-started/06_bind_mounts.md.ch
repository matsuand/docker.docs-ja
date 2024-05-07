%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use bind mounts
keywords: 'get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop'
description: Using bind mounts in our application
@y
title: バインドマウントの利用
keywords: 'get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop'
description: Using bind mounts in our application
@z

@x
In [part 5](./05_persisting_data.md), you used a volume mount to persist the
data in your database. A volume mount is a great choice when you need somewhere
persistent to store your application data.
@y
[5部](./05_persisting_data.md) においては、データベース内のデータを維持するためにボリュームマウントを利用しました。
ボリュームマウントというものは、アプリケーションデータをどこかに保持しなければならないときに採用する優れた選択肢の一つです。
@z

@x
A bind mount is another type of mount, which lets you share a directory from the
host's filesystem into the container. When working on an application, you can
use a bind mount to mount source code into the container. The container sees the
changes you make to the code immediately, as soon as you save a file. This means
that you can run processes in the container that watch for filesystem changes
and respond to them.
@y
バインドマウントというのは、それとは別のマウントです。
これによってホスト上のファイルシステムをコンテナーとの間で共有することができます。
アプリケーションを使った作業をする際には、バインドマウントを使ってソースコードをマウントすることで、それをコンテナー内で利用することができます。
ソースコードのファイルを保存した場合には、コンテナー内でそのコードの変更を即座に確認することができます。
コンテナー内ではファイルシステムへの変更を監視し、それに対して応答するようなプロセスが起動できることを意味します。
@z

@x
In this chapter, you'll see how you can use bind mounts and a tool called
[nodemon](https://npmjs.com/package/nodemon) to watch for file changes, and then restart the application
automatically. There are equivalent tools in most other languages and
frameworks.
@y
本章ではバインドマウントの利用方法について見ていきます。
またファイル変更の監視を行う [nodemon](https://npmjs.com/package/nodemon) というツールを使って、アプリケーションの再起動を自動的に行います。
こういったものは、たいていの言語フレームワークにも同様に含まれています。
@z

@x
## Quick volume type comparisons
@y
## ボリュームタイプの単純な比較 {#quick-volume-type-comparisons}
@z

@x
The following are examples of a named volume and a bind mount using `--mount`:
@y
以下では `--mount` を使って実現する名前つきボリュームとバインドマウントの例を示しています。
@z

@x
- Named volume: `type=volume,src=my-volume,target=/usr/local/data`
- Bind mount: `type=bind,src=/path/to/data,target=/usr/local/data`
@y
- 名前つきボリューム (named volume): `type=volume,src=my-volume,target=/usr/local/data`
- バインドマウント: `type=bind,src=/path/to/data,target=/usr/local/data`
@z

@x
The following table outlines the main differences between volume mounts and bind
mounts.
@y
以下の表は、ボリュームマウントとバインドマウントの主な違いについて示します。
@z

@x
|                                              | Named volumes                                      | Bind mounts                                          |
| -------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------- |
| Host location                                | Docker chooses                                     | You decide                                           |
| Populates new volume with container contents | Yes                                                | No                                                   |
| Supports Volume Drivers                      | Yes                                                | No                                                   |
@y
|                                              | 名前つきボリューム                                 | バインドマウント                                     |
| -------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------- |
| ホスト上の場所                               | Docker が決めます                                  | ユーザーが決めます                                   |
| コンテナー内容の別のボリュームによる公開     | 可                                                 | 不可                                                 |
| ボリュームドライバーのサポート               | 有り                                               | 無し                                                 |
@z

@x
## Trying out bind mounts
@y
## バインドマウントを試す {#trying-out-bind-mounts}
@z

@x
Before looking at how you can use bind mounts for developing your application,
you can run a quick experiment to get a practical understanding of how bind mounts
work.
@y
アプリケーションの開発に向けてバインドマウントをどのように活用していけば良いのか。
そういったことを学ぶ前に、まずは単純な実験を通じて、バインドマウントがどのように動作するのかを実践で理解していくことにしましょう。
@z

@x
1. Verify that your `getting-started-app` directory is in a directory defined in
Docker Desktop's file sharing setting. This setting defines which parts of your
filesystem you can share with containers. For details about accessing the
setting, see the topic for [Mac](../desktop/settings/mac.md/#file-sharing),
[Windows](../desktop/settings/windows.md/#file-sharing), or
[Linux](../desktop/settings/linux.md/#file-sharing).
@y
1. ここで確認しておくことですが、`getting-started-app` ディレクトリは Docker Desktop のファイル共有設定において定義されたディレクトリ内にあることが必要です。
   この設定は、コンテナーとの間で共有するのがファイルシステムのどこであるかを定義します。
   その設定へのアクセス方法の詳細については [Mac](../desktop/settings/mac.md/#file-sharing)、[Windows](../desktop/settings/windows.md/#file-sharing)、[Linux](../desktop/settings/linux.md/#file-sharing) の各説明を参照してください。
@z

@x
2. Open a terminal and change directory to the `getting-started-app`
   directory.
@y
2. 端末を開いて `getting-started-app` ディレクトリに移動します。
@z

@x
3. Run the following command to start `bash` in an `ubuntu` container with a
   bind mount.
@y
3. 以下のコマンドを実行して `bash` を起動します。
   これは `ubuntu` コンテナーでありバインドマウントを利用しています。
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux / PowerShell" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux / PowerShell" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Command Prompt" >}}
@y
   {{< /tab >}}
   {{< tab name="コマンドプロンプト" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Git Bash" >}}
@y
   {{< /tab >}}
   {{< tab name="Git Bash" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
   The `--mount type=bind` option tells Docker to create a bind mount, where `src` is the
   current working directory on your host machine (`getting-started-app`), and
   `target` is where that directory should appear inside the container (`/src`).
@y
   オプション `--mount type=bind` はバインドマウントの生成を指示するものです。
   ここで `src` はホストマシン上のカレントなワーキングディレクトリ (`getting-started-app`) であり、`target` はコンテナー内に現れることになるディレクトリ (`/src`) のことです。
@z

@x
4. After running the command, Docker starts an interactive `bash` session in the
   root directory of the container's filesystem.
@y
4. コマンド実行後 Docker は、コンテナーのファイルシステムにおけるルートディレクトリにおいて `bash` の対話セッションを起動します。
@z

% snip command...

@x
5. Change directory to the `src` directory.
@y
5. `src` ディレクトリに移動します。
@z

@x
   This is the directory that you mounted when starting the container. Listing
   the contents of this directory displays the same files as in the
   `getting-started-app` directory on your host machine.
@y
   このディレクトリは、コンテナーが起動した際にマウント先としたディレクトリです。
   このディレクトリ内の内容一覧を確認すれば、ホストマシン上の `getting-started-app` ディレクトリ内にあるファイルとまったく同じであることがわかります。
@z

% snip command...

@x
6. Create a new file named `myfile.txt`.
@y
6. `myfile.txt` というファイルを新たに生成します。
@z

% snip command...

@x
7. Open the `getting-started-app` directory on the host and observe that the
   `myfile.txt` file is in the directory.
@y
7. ホスト上において `getting-started-app` ディレクトリを開きます。
   確かに `myfile.txt` がそのディレクトリ内に存在しています。
@z

% snip text...

@x
8. From the host, delete the `myfile.txt` file.
9. In the container, list the contents of the `app` directory once more. Observe that the file is now gone.
@y
8. ホスト側から `myfile.txt` ファイルを削除します。
9. コンテナー内において、もう一度 `app` ディレクトリの一覧を表示します。
   上のファイルがなくなっていることがわかります。
@z

% snip command...

@x
10. Stop the interactive container session with `Ctrl` + `D`.
@y
10. `Ctrl` + `D` を入力して、コンテナーの対話セッションを終了します。
@z

@x
That's all for a brief introduction to bind mounts. This procedure
demonstrated how files are shared between the host and the container, and how
changes are immediately reflected on both sides. Now you can use
bind mounts to develop software.
@y
以上がバインドマウントの簡単な実験です。
この操作を通じて、ホストコンテナー間にてファイルが共有される様子や、ファイルへの変更が即座にホストコンテナーの両サイドに反映されることを見てきました。
ここからはバインドマウントを使ってソフトウェアを開発できるようになります。
@z

@x
## Development containers
@y
## 開発用コンテナー {#development-containers}
@z

@x
Using bind mounts is common for local development setups. The advantage is that the development machine doesn’t need to have all of the build tools and environments installed. With a single docker run command, Docker pulls dependencies and tools.
@y
バインドマウントは、ローカルの開発環境を設定する際にはごく普通に利用するものです。
そして開発用マシンの利点は、ビルドツールや環境すべてをインストールしておく必要はないことです。
単なる docker run コマンドを使うだけで、Docker が依存パッケージやツールをプルしてくれます。
@z

@x
### Run your app in a development container
@y
### 開発用コンテナー内でのアプリ起動 {#run-your-app-in-a-development-container}
@z

@x
The following steps describe how to run a development container with a bind
mount that does the following:
@y
以下の手順を通じて、バインドマウントを利用する開発用コンテナーの起動方法について説明します。
ここでは以下を行います。
@z

@x
- Mount your source code into the container
- Install all dependencies
- Start `nodemon` to watch for filesystem changes
@y
- ソースコードをコンテナーに対してマウントします。
- 依存パッケージをすべてインストールします。
- ファイルシステムの変更を検知するために `nodemon` を起動します。
@z

@x
You can use the CLI or Docker Desktop to run your container with a bind mount.
@y
バインドマウントを使ったコンテナーを起動するために CLI または Docker Desktop のいずれかを利用します。
@z

@x
{{< tabs >}}
{{< tab name="Mac / Linux CLI" >}}
@y
{{< tabs >}}
{{< tab name="Mac / Linux CLI" >}}
@z

@x
1. Make sure you don't have any `getting-started` containers currently running.
@y
1. `getting-started` が現在実行されていないことを確認します。
@z

@x
2. Run the following command from the `getting-started-app` directory.
@y
2. `getting-started-app` ディレクトリにおいて以下のコマンドを実行します。
@z

% snip command...

@x
   The following is a breakdown of the command:
@y
   このコマンドの実行内容は以下のとおりです。
@z

@x
   - `-dp 127.0.0.1:3000:3000` - same as before. Run in detached (background) mode and
     create a port mapping
@y
   - `-dp 127.0.0.1:3000:3000` - 以前と同じです。
     デタッチ (バックグラウンド) モードにより実行し、ポートマッピングを生成します。
@z

@x
   - `-w /app` - sets the "working directory" or the current directory that the
     command will run from
@y
   - `-w /app` - "ワーキングディレクトリ" を設定します。
     つまりコマンドが実行されるカレントディレクトリを設定するものです。
@z

@x
   - `--mount type=bind,src="$(pwd)",target=/app` - bind mount the current
     directory from the host into the `/app` directory in the container
@y
   - `--mount type=bind,src="$(pwd)",target=/app` - ホスト上の現在のディレクトリを、コンテナー内の `/app` ディレクトリにバインドマウントします。
@z

@x
   - `node:18-alpine` - the image to use. Note that this is the base image for
     your app from the Dockerfile
@y
   - `node:18-alpine` - 利用するイメージです。
     アプリ実行のためのベースイメージとしているものであり Dockerfile に指定しています。
@z

@x
   - `sh -c "yarn install && yarn run dev"` - the command. You're starting a
     shell using `sh` (alpine doesn't have `bash`) and running `yarn install` to
     install packages and then running `yarn run dev` to start the development
     server. If you look in the `package.json`, you'll see that the `dev` script
     starts `nodemon`.
@y
   - `sh -c "yarn install && yarn run dev"` - 実行するコマンドです。
     `sh` によってシェルを起動しています。
     (alpine に `bash` はありません。)
     そして `yarn install` を実行してパッケージのインストールを行うとともに `yarn run dev` によって開発サーバーを起動します。
     `package.json` を確認してみればわかりますが、`dev` スクリプトが `nodemon` を起動しています。
@z

@x
3. You can watch the logs using `docker logs <container-id>`. You'll know you're
   ready to go when you see this:
@y
3. `docker logs <container-id>` を実行すればログを見ることができます。
   これを見れば、環境がうまく動作できていることがわかるはずです。
@z

% snip command...

@x
   When you're done watching the logs, exit out by hitting `Ctrl`+`C`.
@y
   ログを見終えたら `Ctrl`+`C` を入力して終了します。
@z

@x
{{< /tab >}}
{{< tab name="PowerShell CLI" >}}
@y
{{< /tab >}}
{{< tab name="PowerShell CLI" >}}
@z

@x
1. Make sure you don't have any `getting-started` containers currently running.
@y
1. `getting-started` が現在実行されていないことを確認します。
@z

@x
2. Run the following command from the `getting-started-app` directory.
@y
2. `getting-started-app` ディレクトリにおいて以下のコマンドを実行します。
@z

% snip command...

@x
   The following is a breakdown of the command:
@y
   このコマンドの実行内容は以下のとおりです。
@z

@x
   - `-dp 127.0.0.1:3000:3000` - same as before. Run in detached (background) mode and
     create a port mapping
@y
   - `-dp 127.0.0.1:3000:3000` - 以前と同じです。
     デタッチ (バックグラウンド) モードにより実行し、ポートマッピングを生成します。
@z

@x
   - `-w /app` - sets the "working directory" or the current directory that the
     command will run from
@y
   - `-w /app` - "ワーキングディレクトリ" を設定します。
     つまりコマンドが実行されるカレントディレクトリを設定するものです。
@z

@x
   - `--mount "type=bind,src=$pwd,target=/app"` - bind mount the current
     directory from the host into the `/app` directory in the container
@y
   - `--mount "type=bind,src=$pwd,target=/app"` - ホスト上の現在のディレクトリを、コンテナー内の `/app` ディレクトリにバインドマウントします。
@z

@x
   - `node:18-alpine` - the image to use. Note that this is the base image for
     your app from the Dockerfile
@y
   - `node:18-alpine` - 利用するイメージです。
     アプリ実行のためのベースイメージとしているものであり Dockerfile に指定しています。
@z

@x
   - `sh -c "yarn install && yarn run dev"` - the command. You're starting a
     shell using `sh` (alpine doesn't have `bash`) and running `yarn install` to
     install packages and then running `yarn run dev` to start the development
     server. If you look in the `package.json`, you'll see that the `dev` script
     starts `nodemon`.
@y
   - `sh -c "yarn install && yarn run dev"` - 実行するコマンドです。
     `sh` によってシェルを起動しています。
     (alpine に `bash` はありません。)
     そして `yarn install` を実行してパッケージのインストールを行うとともに `yarn run dev` によって開発サーバーを起動します。
     `package.json` を確認してみればわかりますが、`dev` スクリプトが `nodemon` を起動しています。
@z

@x
3. You can watch the logs using `docker logs <container-id>`. You'll know you're
   ready to go when you see this:
@y
3. `docker logs <container-id>` を実行すればログを見ることができます。
   これを見れば、環境がうまく動作できていることがわかるはずです。
@z

% snip command...

@x
   When you're done watching the logs, exit out by hitting `Ctrl`+`C`.
@y
   ログを見終えたら `Ctrl`+`C` を入力して終了します。
@z

@x
{{< /tab >}}
{{< tab name="Command Prompt CLI" >}}
@y
{{< /tab >}}
{{< tab name="コマンドプロンプト CLI" >}}
@z

@x
1. Make sure you don't have any `getting-started` containers currently running.
@y
1. `getting-started` が現在実行されていないことを確認します。
@z

@x
2. Run the following command from the `getting-started-app` directory.
@y
2. `getting-started-app` ディレクトリにおいて以下のコマンドを実行します。
@z

% snip command...

@x
   The following is a breakdown of the command:
@y
   このコマンドの実行内容は以下のとおりです。
@z

@x
   - `-dp 127.0.0.1:3000:3000` - same as before. Run in detached (background) mode and
     create a port mapping
@y
   - `-dp 127.0.0.1:3000:3000` - 以前と同じです。
     デタッチ (バックグラウンド) モードにより実行し、ポートマッピングを生成します。
@z

@x
   - `-w /app` - sets the "working directory" or the current directory that the
     command will run from
@y
   - `-w /app` - "ワーキングディレクトリ" を設定します。
     つまりコマンドが実行されるカレントディレクトリを設定するものです。
@z

@x
   - `--mount "type=bind,src=%cd%,target=/app"` - bind mount the current
     directory from the host into the `/app` directory in the container
@y
   - `--mount "type=bind,src=%cd%,target=/app"` - ホスト上の現在のディレクトリを、コンテナー内の `/app` ディレクトリにバインドマウントします。
@z

@x
   - `node:18-alpine` - the image to use. Note that this is the base image for
     your app from the Dockerfile
@y
   - `node:18-alpine` - 利用するイメージです。
     アプリ実行のためのベースイメージとしているものであり Dockerfile に指定しています。
@z

@x
   - `sh -c "yarn install && yarn run dev"` - the command. You're starting a
     shell using `sh` (alpine doesn't have `bash`) and running `yarn install` to
     install packages and then running `yarn run dev` to start the development
     server. If you look in the `package.json`, you'll see that the `dev` script
     starts `nodemon`.
@y
   - `sh -c "yarn install && yarn run dev"` - 実行するコマンドです。
     `sh` によってシェルを起動しています。
     (alpine に `bash` はありません。)
     そして `yarn install` を実行してパッケージのインストールを行うとともに `yarn run dev` によって開発サーバーを起動します。
     `package.json` を確認してみればわかりますが、`dev` スクリプトが `nodemon` を起動しています。
@z

@x
3. You can watch the logs using `docker logs <container-id>`. You'll know you're
   ready to go when you see this:
@y
3. `docker logs <container-id>` を実行すればログを見ることができます。
   これを見れば、環境がうまく動作できていることがわかるはずです。
@z

% snip command...

@x
   When you're done watching the logs, exit out by hitting `Ctrl`+`C`.
@y
   ログを見終えたら `Ctrl`+`C` を入力して終了します。
@z

@x
{{< /tab >}}
{{< tab name="Git Bash CLI" >}}
@y
{{< /tab >}}
{{< tab name="Git Bash CLI" >}}
@z

@x
1. Make sure you don't have any `getting-started` containers currently running.
@y
1. `getting-started` が現在実行されていないことを確認します。
@z

@x
2. Run the following command from the `getting-started-app` directory.
@y
2. `getting-started-app` ディレクトリにおいて以下のコマンドを実行します。
@z

% snip command...

@x
   The following is a breakdown of the command:
@y
   このコマンドの実行内容は以下のとおりです。
@z

@x
   - `-dp 127.0.0.1:3000:3000` - same as before. Run in detached (background) mode and
     create a port mapping
@y
   - `-dp 127.0.0.1:3000:3000` - 以前と同じです。
     デタッチ (バックグラウンド) モードにより実行し、ポートマッピングを生成します。
@z

@x
   - `-w //app` - sets the "working directory" or the current directory that the
     command will run from
@y
   - `-w //app` - "ワーキングディレクトリ" を設定します。
     つまりコマンドが実行されるカレントディレクトリを設定するものです。
@z

@x
   - `--mount type=bind,src="/$(pwd)",target=/app` - bind mount the current
     directory from the host into the `/app` directory in the container
@y
   - `--mount type=bind,src="/$(pwd)",target=/app` - ホスト上の現在のディレクトリを、コンテナー内の `/app` ディレクトリにバインドマウントします。
@z

@x
   - `node:18-alpine` - the image to use. Note that this is the base image for
     your app from the Dockerfile
@y
   - `node:18-alpine` - 利用するイメージです。
     アプリ実行のためのベースイメージとしているものであり Dockerfile に指定しています。
@z

@x
   - `sh -c "yarn install && yarn run dev"` - the command. You're starting a
     shell using `sh` (alpine doesn't have `bash`) and running `yarn install` to
     install packages and then running `yarn run dev` to start the development
     server. If you look in the `package.json`, you'll see that the `dev` script
     starts `nodemon`.
@y
   - `sh -c "yarn install && yarn run dev"` - 実行するコマンドです。
     `sh` によってシェルを起動しています。
     (alpine に `bash` はありません。)
     そして `yarn install` を実行してパッケージのインストールを行うとともに `yarn run dev` によって開発サーバーを起動します。
     `package.json` を確認してみればわかりますが、`dev` スクリプトが `nodemon` を起動しています。
@z

@x
3. You can watch the logs using `docker logs <container-id>`. You'll know you're
   ready to go when you see this:
@y
3. `docker logs <container-id>` を実行すればログを見ることができます。
   これを見れば、環境がうまく動作できていることがわかるはずです。
@z

% snip command...

@x
   When you're done watching the logs, exit out by hitting `Ctrl`+`C`.
@y
   ログを見終えたら `Ctrl`+`C` を入力して終了します。
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
Make sure you don't have any `getting-started` containers currently running.
@y
`getting-started` が現在実行されていないことを確認します。
@z

@x
Run the image with a bind mount.
@y
バインドマウントを使うイメージを実行します。
@z

@x
1. Select the search box at the top of Docker Desktop.
2. In the search window, select the **Images** tab.
3. In the search box, specify the container name, `getting-started`.
@y
1. Docker Desktop の最上段の検索欄を選択します。
2. 検索画面にて **Images** タブを選択します。
3. 検索欄においてコンテナー名として `getting-started` を入力します。
@z

@x
   > **Tip**
   >
   >  Use the search filter to filter images and only show **Local images**.
   { .tip }
@y
   > **ヒント**
   >
   >  検索フィルターを用いてイメージの絞り込みを行えば **ローカルイメージ** のみを表示することができます。
   { .tip }
@z

@x
4. Select your image and then select **Run**.
5. Select **Optional settings**.
6. In **Host path**, specify the path to the `getting-started-app` directory on your host machine.
7. In **Container path**, specify `/app`.
8. Select **Run**.
@y
4. イメージを選択して **Run** (実行) をクリックします。
5. **Optional settings** (オプション設定) をクリックします。
6. **Host path** (ホストパス) に、ホスト上の `getting-started-app` ディレクトリへのパスを入力します。
7. **Container path** (コンテナーパス) に `/app` を入力します。
8. **Run** (実行) をクリックします。
@z

@x
You can watch the container logs using Docker Desktop.
@y
Docker Desktop を使ってコンテナーログを確認します。
@z

@x
1. Select **Containers** in Docker Desktop.
2. Select your container name.
@y
1. Docker Desktop の **Containers** (コンテナー) を選択します。
2. 対象のコンテナーを選択します。
@z

@x
You'll know you're ready to go when you see this:
@y
以下のようになっていれば成功です。
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Develop your app with the development container
@y
### 開発用コンテナーを使ったアプリ開発 {#develop-your-app-with-the-development-container}
@z

@x
Update your app on your host machine and see the changes reflected in the container.
@y
ホスト上のアプリを更新して、その変更内容がコンテナーに反映されることを確認します。
@z

@x
1. In the `src/static/js/app.js` file, on line
   109, change the "Add Item" button to simply say "Add":
@y
1. ファイル `src/static/js/app.js` の 109 行めにある "Add Item" (アイテム追加) ボタン名を単に "Add" とします。
@z

% snip diff...

@x
   Save the file.
@y
   ファイルを保存します。
@z

@x
2. Refresh the page in your web browser, and you should see the change reflected
   almost immediately because of the bind mount. Nodemon detects the change and
   restarts the server. It might take a few seconds for the Node server to
   restart. If you get an error, try refreshing after a few seconds.
@y
2. ウェブブラウザーのページをリフレッシュします。
   変更内容は即座に反映されているのがわかるはずです。
   それはバインドマウントを行ったからです。
   Nodemon は変更を検知しサーバーを再起動します。
   Node サーバーの再起動には数秒程度かかるかもしれません。
   もしエラーが発生したら、数秒待ってからリフレッシュを行ってください。
@z

@x
   ![Screenshot of updated label for Add button](images/updated-add-button.webp)
@y
   ![Add ボタンのラベルを変更したスクリーンショット](images/updated-add-button.webp)
@z

@x
3. Feel free to make any other changes you'd like to make. Each time you make a
   change and save a file, the change is reflected in the container because of
   the bind mount. When Nodemon detects a change, it restarts the app inside the
   container automatically. When you're done, stop the container and build your
   new image using:
@y
3. 他にも変更したい内容があれば、自由に行ってみてください。
   バインドマウントを使っているので、変更を行ってファイルを保存すればコンテナー内にそれが反映されます。
   Nodemon が変更を検知したら、コンテナー内のアプリは自動的に再起動します。
   確認を終えたら、コンテナーを停止して以下のようにして新たなイメージをビルドしてください。
@z

% snip command...

@x
## Summary
@y
## まとめ {#summary}
@z

@x
At this point, you can persist your database and see changes in your app as you develop without rebuilding the image.
@y
ここまでにデータベースのデータを保存し、イメージを再ビルドすることなく開発作業を行い、アプリへの変更内容を確認しました。
@z

@x
In addition to volume mounts and bind mounts, Docker also supports other mount
types and storage drivers for handling more complex and specialized use cases.
@y
ボリュームマウントやバインドマウントの他にもタイプの異なるマウントがあります。
それに合わせて、より複雑で特殊なユースケースに対応するストレージドライバーがサポートしています。
@z

@x
Related information:
@y
関連情報
@z

@x
 - [docker CLI reference](/reference/cli/docker/)
 - [Manage data in Docker](https://docs.docker.com/storage/)
@y
 - [docker CLI リファレンス](__SUBDIR__/reference/cli/docker/)
 - [Docker におけるデータ管理](__SUBDIR__/storage/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In order to prepare your app for production, you need to migrate your database
from working in SQLite to something that can scale a little better. For
simplicity, you'll keep using a relational database and switch your application
to use MySQL. But, how should you run MySQL? How do you allow the containers to
talk to each other? You'll learn about that in the next section.
@y
アプリの運用環境に向けた準備が整ったので、SQLite での作業から、よりスケールアップしたデータベースに移行していくことが必要になります。
要はリレーショナルデータベースを使う方式はそのままに、アプリが利用するデータベースを MySQL に切り替えます。
ではどうやって MySQL を動かしましょう？
どうやってコンテナーとの間での通信を実現しましょう？
このことを次のセクションで学んでいきます。
@z

@x
{{< button text="Multi container apps" url="07_multi_container.md" >}}
@y
{{< button text="マルチコンテナーアプリ" url="07_multi_container.md" >}}
@z
