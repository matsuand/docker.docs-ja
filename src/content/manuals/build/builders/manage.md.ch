%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage builders
keywords: build, buildx, builders, buildkit, drivers, backend
description: null
@y
title: ビルダーの管理
keywords: build, buildx, builders, buildkit, drivers, backend
description: null
@z

@x
You can create, inspect, and manage builders using `docker buildx` commands,
or [using Docker Desktop](#manage-builders-with-docker-desktop).
@y
ビルダーは `docker buildx` コマンドまたは [Docker Desktop](#manage-builders-with-docker-desktop) を使って生成、確認、管理することができます。
@z

@x
## Create a new builder
@y
## ビルダーの新規生成 {#create-a-new-builder}
@z

@x
The default builder uses the [`docker` driver](drivers/docker.md).
You can't manually create new `docker` builders, but you can create builders
that use other drivers, such as the
[`docker-container` driver](drivers/docker-container.md),
which runs the BuildKit daemon in a container.
@y
デフォルトのビルダーは [`docker` ドライバー](drivers/docker.md) を用います。
`docker` ビルダーは自作することはできませんが、[`docker-container` ドライバー](drivers/docker-container.md) といった別のドライバーを利用するビルダーなら生成することができます。
`docker-container` ドライバーとは、コンテナー内において BuilKit デーモンを起動させるものです。
@z

@x
Use the
[`docker buildx create`](/reference/cli/docker/buildx/create.md)
command to create a builder.
@y
[`docker buildx create`](reference/cli/docker/buildx/create.md) コマンドを使ってビルダーを生成します。
@z

% snip command...

@x
Buildx uses the `docker-container` driver by default if you omit the `--driver`
flag. For more information about available drivers, see
[Build drivers](drivers/_index.md).
@y
Buildx は `--driver` フラグを指定しなければ、デフォルトで `docker-container` ドライバーを用います。
利用可能なドライバーについては [ドライバーのビルド](drivers/_index.md) を参照してください。
@z

@x
## List available builders
@y
## 利用可能なビルダー一覧 {#list-available-builders}
@z

@x
Use `docker buildx ls` to see builder instances available on your system, and
the drivers they're using.
@y
Use `docker buildx ls` to see builder instances available on your system, and
the drivers they're using.
@z

% snip command...

@x
The asterisk (`*`) next to the builder name indicates the
[selected builder](_index.md#selected-builder).
@y
The asterisk (`*`) next to the builder name indicates the
[selected builder](_index.md#selected-builder).
@z

@x
## Inspect a builder
@y
## Inspect a builder
@z

@x
To inspect a builder with the CLI, use `docker buildx inspect <name>`.
You can only inspect a builder if the builder is active.
You can add the `--bootstrap` flag to the command to start the builder.
@y
To inspect a builder with the CLI, use `docker buildx inspect <name>`.
You can only inspect a builder if the builder is active.
You can add the `--bootstrap` flag to the command to start the builder.
@z

% snip command...

@x
If you want to see how much disk space a builder is using, use the
`docker buildx du` command. By default, this command shows the total disk usage
for all available builders. To see usage for a specific builder, use the
`--builder` flag.
@y
If you want to see how much disk space a builder is using, use the
`docker buildx du` command. By default, this command shows the total disk usage
for all available builders. To see usage for a specific builder, use the
`--builder` flag.
@z

% snip command...

@x
## Remove a builder
@y
## Remove a builder
@z

@x
Use the
[`docker buildx remove`](/reference/cli/docker/buildx/create.md)
command to remove a builder.
@y
Use the
[`docker buildx remove`](reference/cli/docker/buildx/create.md)
command to remove a builder.
@z

% snip command...

@x
If you remove your currently selected builder,
the default `docker` builder is automatically selected.
You can't remove the default builder.
@y
If you remove your currently selected builder,
the default `docker` builder is automatically selected.
You can't remove the default builder.
@z

@x
Local build cache for the builder is also removed.
@y
Local build cache for the builder is also removed.
@z

@x
### Removing remote builders
@y
### Removing remote builders
@z

@x
Removing a remote builder doesn't affect the remote build cache.
It also doesn't stop the remote BuildKit daemon.
It only removes your connection to the builder.
@y
Removing a remote builder doesn't affect the remote build cache.
It also doesn't stop the remote BuildKit daemon.
It only removes your connection to the builder.
@z

@x
## Manage builders with Docker Desktop
@y
## Manage builders with Docker Desktop
@z

@x
If you have turned on the
[Docker Desktop Builds view](/manuals/desktop/use-desktop/builds.md),
you can inspect builders in [Docker Desktop settings](/manuals/desktop/settings-and-maintenance/settings.md#builders). 
@y
If you have turned on the
[Docker Desktop Builds view](manuals/desktop/use-desktop/builds.md),
you can inspect builders in [Docker Desktop settings](manuals/desktop/settings-and-maintenance/settings.md#builders). 
@z
