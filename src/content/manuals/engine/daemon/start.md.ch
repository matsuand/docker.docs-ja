%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Start the daemon
@y
title: デーモンの起動
@z

@x
description: Starting the Docker daemon manually
keywords: docker, daemon, configuration, troubleshooting
@y
description: Starting the Docker daemon manually
keywords: docker, daemon, configuration, troubleshooting
@z

@x
This page shows how to start the daemon, either manually or using OS utilities.
@y
このページではデーモンの起動方法を示します。
手動の場合と OS ユーティリティーを用いる場合のそれぞれを説明します。
@z

@x
## Start the daemon using operating system utilities
@y
## OS ユーティリティーを使ったデーモン起動 {#start-the-daemon-using-operating-system-utilities}
@z

@x
On a typical installation the Docker daemon is started by a system utility, not
manually by a user. This makes it easier to automatically start Docker when the
machine reboots.
@y
標準的にインストールを行えば Docker デーモンはシステムユーティリティーによって起動されます。
つまりユーザーが手動起動するものではありません。
これにより、マシンの起動と同時に自動的に Docker を起動させることができます。
@z

@x
The command to start Docker depends on your operating system. Check the correct
page under [Install Docker](/manuals/engine/install/index.md).
@y
Docker の開始コマンドはオペレーティングシステムにより異なります。
[Docker のインストール](manuals/engine/install/index.md) における適切な説明を参照してください。
@z

@x
### Start with systemd
@y
### systemd を使った起動 {#start-with-systemd}
@z

@x
On some operating systems, like Ubuntu and Debian, the Docker daemon service
starts automatically. Use the following command to start it manually:
@y
Ubuntu や Debian などのオペレーティングシステムでは、Docker サービスが自動起動します。
手動で起動させる場合には以下のコマンドを実行します。
@z

% snip command...

@x
If you want Docker to start at boot, see
[Configure Docker to start on boot](/manuals/engine/install/linux-postinstall.md#configure-docker-to-start-on-boot-with-systemd).
@y
システムブート時に Docker を起動させたい場合には [ブート時の Docker 起動設定](manuals/engine/install/linux-postinstall.md#configure-docker-to-start-on-boot-with-systemd) を参照してください。
@z

@x
## Start the daemon manually
@y
## 手動によるデーモン起動 {#start-the-daemon-manually}
@z

@x
If you don't want to use a system utility to manage the Docker daemon, or just
want to test things out, you can manually run it using the `dockerd` command.
You may need to use `sudo`, depending on your operating system configuration.
@y
Docker デーモンを管理するシステムユーティリティーを利用したくない場合、あるいは単にテストを行いたい場合などには、`dockerd` コマンドを使って手動起動することができます。
その際にはオペレーティングシステムの設定によっては `sudo` を用いることが必要かもしれません。
@z

@x
When you start Docker this way, it runs in the foreground and sends its logs
directly to your terminal.
@y
この方法によって Docker を起動した場合、Docker はフォアグランド実行されて、ログは直接端末画面に出力されます。
@z

% snip command...

@x
To stop Docker when you have started it manually, issue a `Ctrl+C` in your
terminal.
@y
手動によりデーモンを起動していた場合、これを停止するには端末画面にて `Ctrl+C` を入力します。
@z
