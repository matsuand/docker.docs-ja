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

@x
cname:
    - docker attach
    - docker build
    - docker builder
    - docker checkpoint
    - docker commit
    - docker config
    - docker container
    - docker context
    - docker cp
    - docker create
    - docker diff
    - docker events
    - docker exec
    - docker export
    - docker history
    - docker image
    - docker images
    - docker import
    - docker info
    - docker inspect
    - docker kill
    - docker load
    - docker login
    - docker logout
    - docker logs
    - docker manifest
    - docker network
    - docker node
    - docker pause
    - docker plugin
    - docker port
    - docker ps
    - docker pull
    - docker push
    - docker rename
    - docker restart
    - docker rm
    - docker rmi
    - docker run
    - docker save
    - docker search
    - docker secret
    - docker service
    - docker stack
    - docker start
    - docker stats
    - docker stop
    - docker swarm
    - docker system
    - docker tag
    - docker top
    - docker trust
    - docker unpause
    - docker update
    - docker version
    - docker volume
    - docker wait
@y
cname:
    - docker attach
    - docker build
    - docker builder
    - docker checkpoint
    - docker commit
    - docker config
    - docker container
    - docker context
    - docker cp
    - docker create
    - docker diff
    - docker events
    - docker exec
    - docker export
    - docker history
    - docker image
    - docker images
    - docker import
    - docker info
    - docker inspect
    - docker kill
    - docker load
    - docker login
    - docker logout
    - docker logs
    - docker manifest
    - docker network
    - docker node
    - docker pause
    - docker plugin
    - docker port
    - docker ps
    - docker pull
    - docker push
    - docker rename
    - docker restart
    - docker rm
    - docker rmi
    - docker run
    - docker save
    - docker search
    - docker secret
    - docker service
    - docker stack
    - docker start
    - docker stats
    - docker stop
    - docker swarm
    - docker system
    - docker tag
    - docker top
    - docker trust
    - docker unpause
    - docker update
    - docker version
    - docker volume
    - docker wait
@z

@x
clink:
    - docker_attach.yaml
    - docker_build.yaml
    - docker_builder.yaml
    - docker_checkpoint.yaml
    - docker_commit.yaml
    - docker_config.yaml
    - docker_container.yaml
    - docker_context.yaml
    - docker_cp.yaml
    - docker_create.yaml
    - docker_diff.yaml
    - docker_events.yaml
    - docker_exec.yaml
    - docker_export.yaml
    - docker_history.yaml
    - docker_image.yaml
    - docker_images.yaml
    - docker_import.yaml
    - docker_info.yaml
    - docker_inspect.yaml
    - docker_kill.yaml
    - docker_load.yaml
    - docker_login.yaml
    - docker_logout.yaml
    - docker_logs.yaml
    - docker_manifest.yaml
    - docker_network.yaml
    - docker_node.yaml
    - docker_pause.yaml
    - docker_plugin.yaml
    - docker_port.yaml
    - docker_ps.yaml
    - docker_pull.yaml
    - docker_push.yaml
    - docker_rename.yaml
    - docker_restart.yaml
    - docker_rm.yaml
    - docker_rmi.yaml
    - docker_run.yaml
    - docker_save.yaml
    - docker_search.yaml
    - docker_secret.yaml
    - docker_service.yaml
    - docker_stack.yaml
    - docker_start.yaml
    - docker_stats.yaml
    - docker_stop.yaml
    - docker_swarm.yaml
    - docker_system.yaml
    - docker_tag.yaml
    - docker_top.yaml
    - docker_trust.yaml
    - docker_unpause.yaml
    - docker_update.yaml
    - docker_version.yaml
    - docker_volume.yaml
    - docker_wait.yaml
@y
clink:
    - docker_attach.yaml
    - docker_build.yaml
    - docker_builder.yaml
    - docker_checkpoint.yaml
    - docker_commit.yaml
    - docker_config.yaml
    - docker_container.yaml
    - docker_context.yaml
    - docker_cp.yaml
    - docker_create.yaml
    - docker_diff.yaml
    - docker_events.yaml
    - docker_exec.yaml
    - docker_export.yaml
    - docker_history.yaml
    - docker_image.yaml
    - docker_images.yaml
    - docker_import.yaml
    - docker_info.yaml
    - docker_inspect.yaml
    - docker_kill.yaml
    - docker_load.yaml
    - docker_login.yaml
    - docker_logout.yaml
    - docker_logs.yaml
    - docker_manifest.yaml
    - docker_network.yaml
    - docker_node.yaml
    - docker_pause.yaml
    - docker_plugin.yaml
    - docker_port.yaml
    - docker_ps.yaml
    - docker_pull.yaml
    - docker_push.yaml
    - docker_rename.yaml
    - docker_restart.yaml
    - docker_rm.yaml
    - docker_rmi.yaml
    - docker_run.yaml
    - docker_save.yaml
    - docker_search.yaml
    - docker_secret.yaml
    - docker_service.yaml
    - docker_stack.yaml
    - docker_start.yaml
    - docker_stats.yaml
    - docker_stop.yaml
    - docker_swarm.yaml
    - docker_system.yaml
    - docker_tag.yaml
    - docker_top.yaml
    - docker_trust.yaml
    - docker_unpause.yaml
    - docker_update.yaml
    - docker_version.yaml
    - docker_volume.yaml
    - docker_wait.yaml
@z

@x
options:
    - option: config
      value_type: string
      default_value: /root/.docker
      description: Location of client config files
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
options:
    - option: config
      value_type: string
      default_value: /root/.docker
      description: Location of client config files
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: context
      shorthand: c
      value_type: string
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: context
      shorthand: c
      value_type: string
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: Enable debug mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: デバッグモードを有効にします。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: help
      value_type: bool
      default_value: "false"
      description: 利用方法を表示します。
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: host
      shorthand: H
      value_type: list
      description: Daemon socket to connect to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: host
      shorthand: H
      value_type: list
      description: デーモンソケットの接続先。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: log-level
      shorthand: l
      value_type: string
      default_value: info
      description: Set the logging level (`debug`, `info`, `warn`, `error`, `fatal`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: log-level
      shorthand: l
      value_type: string
      default_value: info
      description: ログ出力レベルを設定します。（`debug`, `info`, `warn`, `error`, `fatal`）
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: tls
      value_type: bool
      default_value: "false"
      description: Use TLS; implied by --tlsverify
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: tls
      value_type: bool
      default_value: "false"
      description: TLS の利用。暗に --tlsverify を含みます。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: tlscacert
      value_type: string
      default_value: /root/.docker/ca.pem
      description: Trust certs signed only by this CA
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: tlscacert
      value_type: string
      default_value: /root/.docker/ca.pem
      description: この CA によってのみ署名された信頼できる証明局。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: tlscert
      value_type: string
      default_value: /root/.docker/cert.pem
      description: Path to TLS certificate file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: tlscert
      value_type: string
      default_value: /root/.docker/cert.pem
      description: TLS 証明書ファイルへのパス。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: tlskey
      value_type: string
      default_value: /root/.docker/key.pem
      description: Path to TLS key file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: tlskey
      value_type: string
      default_value: /root/.docker/key.pem
      description: TLS 鍵ファイルへのパス。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: tlsverify
      value_type: bool
      default_value: "false"
      description: Use TLS and verify the remote
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: tlsverify
      value_type: bool
      default_value: "false"
      description: TLS を利用しリモートを確認します。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
