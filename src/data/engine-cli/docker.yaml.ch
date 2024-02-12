%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker
short: The base command for the Docker CLI.
long: The base command for the Docker CLI.
@y
command: docker
short: Docker CLI の基本コマンド
long: Docker CLI の基本的なコマンドです。
@z

@x option: config
      description: Location of client config files
@y
      description: Location of client config files
@z

@x option: context
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
@y
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
@z

@x option: debug
      description: Enable debug mode
@y
      description: デバッグモードを有効にします。
@z

@x option: help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x option: host
      description: Daemon socket to connect to
@y
      description: デーモンソケットの接続先。
@z

@x option: log-level
      description: Set the logging level (`debug`, `info`, `warn`, `error`, `fatal`)
@y
      description: ログ出力レベルを設定します。（`debug`, `info`, `warn`, `error`, `fatal`）
@z

@x option: tls
      description: Use TLS; implied by --tlsverify
@y
      description: TLS の利用。暗に --tlsverify を含みます。
@z

@x option: tlscacert
      description: Trust certs signed only by this CA
@y
      description: この CA によってのみ署名された信頼できる証明局。
@z

@x option: tlscert
      description: Path to TLS certificate file
@y
      description: TLS 証明書ファイルへのパス。
@z

@x option: tlskey
      description: Path to TLS key file
@y
      description: TLS 鍵ファイルへのパス。
@z

@x option: tlsverify
      description: Use TLS and verify the remote
@y
      description: TLS を利用しリモートを確認します。
@z
