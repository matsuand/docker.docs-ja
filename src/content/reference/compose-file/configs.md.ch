%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
linkTitle: Configs 
title: Configs top-level element
description: Manage and share configuration data using the configs element in Docker Compose.
keywords: compose, compose specification, configs, compose file reference
@y
linkTitle: configs
title: トップレベル要素 configs
description: Manage and share configuration data using the configs element in Docker Compose.
keywords: compose, compose specification, configs, compose file reference
@z

@x
{{% include "compose/configs.md" %}}
@y
{{% include "compose/configs.md" %}}
@z

@x
Services can only access configs when explicitly granted by a [`configs`](services.md#configs) attribute within the `services` top-level element.
@y
サービスから config にアクセスできるのは、トップレベル要素 `services` における [`configs`](services.md#configs) 属性により明示的にアクセスが許可された場合だけです。
@z

@x
By default, the config:
- Is owned by the user running the container command but can be overridden by service configuration.
- Has world-readable permissions (mode 0444), unless the service is configured to override this.
@y
デフォルトにおいて、config は以下の特徴を持ちます。
- config の所有者はコンテナー実行を行っているユーザーですが、サービス設定により上書き変更が可能です。
- ワールド読み込みの権限 (モード 0444) を持ちますが、サービス設定により上書きされていればそれに従います。
@z

@x
The top-level `configs` declaration defines or references configuration data that is granted to services in your Compose application. The source of the config is either `file`, `environment`, `content`, or `external`.
@y
トップレベル要素 `configs` による宣言は、Compose アプリケーション内のサービスに対して、設定データを定義したり参照したりするための定義を行うものです。
 The source of the config is either `file`, `environment`, `content`, or `external`.
@z

@x
- `file`: The config is created with the contents of the file at the specified path.
@y
- `file`: The config is created with the contents of the file at the specified path.
@z

@x
- `environment`: The config content is created with the value of an environment variable. Introduced in Docker Compose version [2.23.1](/manuals/compose/releases/release-notes.md#2231).
@y
- `environment`: The config content is created with the value of an environment variable. Introduced in Docker Compose version [2.23.1](manuals/compose/releases/release-notes.md#2231).
@z

@x
- `content`: The content is created with the inlined value. Introduced in Docker Compose version [2.23.1](/manuals/compose/releases/release-notes.md#2231).
@y
- `content`: The content is created with the inlined value. Introduced in Docker Compose version [2.23.1](manuals/compose/releases/release-notes.md#2231).
@z

@x
- `external`: If set to true, `external` specifies that this config has already been created. Compose does not
  attempt to create it, and if it does not exist, an error occurs.
@y
- `external`: If set to true, `external` specifies that this config has already been created. Compose does not
  attempt to create it, and if it does not exist, an error occurs.
@z

@x
- `name`: The name of the config object in the container engine to look up. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the project name.
@y
- `name`: The name of the config object in the container engine to look up. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the project name.
@z

@x
## Example 1
@y
## 例１ {#example-1}
@z

@x
`<project_name>_http_config` is created when the application is deployed,
by registering the content of the `httpd.conf` as the configuration data.
@y
`<プロジェクト名>_http_config` is created when the application is deployed,
by registering the content of the `httpd.conf` as the configuration data.
@z

% snip code...

@x
Alternatively, `http_config` can be declared as external. Compose looks up `http_config` to expose the configuration data to relevant services.
@y
Alternatively, `http_config` can be declared as external. Compose looks up `http_config` to expose the configuration data to relevant services.
@z

% snip code...

@x
## Example 2
@y
## 例２ {#example-2}
@z

@x
External configs lookup can also use a distinct key by specifying a `name`. 
@y
External configs lookup can also use a distinct key by specifying a `name`. 
@z

@x
The following
example modifies the previous one to look up a config using the parameter `HTTP_CONFIG_KEY`. The actual lookup key is set at deployment time by the [interpolation](interpolation.md) of
variables, but exposed to containers as hard-coded ID `http_config`.
@y
The following
example modifies the previous one to look up a config using the parameter `HTTP_CONFIG_KEY`. The actual lookup key is set at deployment time by the [interpolation](interpolation.md) of
variables, but exposed to containers as hard-coded ID `http_config`.
@z

% snip code...

@x
## Example 3
@y
## 例３ {#example-3}
@z

@x
`<project_name>_app_config` is created when the application is deployed,
by registering the inlined content as the configuration data. This means Compose infers variables when creating the config, which allows you to
adjust content according to service configuration:
@y
`<project_name>_app_config` is created when the application is deployed,
by registering the inlined content as the configuration data. This means Compose infers variables when creating the config, which allows you to
adjust content according to service configuration:
@z

@x
## Example 4
@y
## 例４ {#example-4}
@z

@x
`<project_name>_simple_config` is created when the application is deployed,
using the value of an environment variable as the configuration data. This is useful for simple configuration values that don’t require interpolation:
@y
`<project_name>_simple_config` is created when the application is deployed,
using the value of an environment variable as the configuration data. This is useful for simple configuration values that don’t require interpolation:
@z

% snip code...

@x
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@z
