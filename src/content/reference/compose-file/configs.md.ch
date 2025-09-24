%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
linkTitle: Configs 
title: Configs top-level element
description: Manage and share configuration data using the configs element in Docker Compose.
keywords: compose, compose specification, configs, compose file reference
@y
linkTitle: Configs 
title: Configs top-level element
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
Services can only access configs when explicitly granted by a [`configs`](services.md#configs) attribute within the `services` top-level element.
@z

@x
By default, the config:
- Is owned by the user running the container command but can be overridden by service configuration.
- Has world-readable permissions (mode 0444), unless the service is configured to override this.
@y
By default, the config:
- Is owned by the user running the container command but can be overridden by service configuration.
- Has world-readable permissions (mode 0444), unless the service is configured to override this.
@z

@x
The top-level `configs` declaration defines or references configuration data that is granted to services in your Compose application. The source of the config is either `file` or `external`.
@y
The top-level `configs` declaration defines or references configuration data that is granted to services in your Compose application. The source of the config is either `file` or `external`.
@z

@x
- `file`: The config is created with the contents of the file at the specified path.
- `environment`: The config content is created with the value of an environment variable. Introduced in Docker Compose version [2.23.1](/manuals/compose/releases/release-notes.md#2231).
- `content`: The content is created with the inlined value. Introduced in Docker Compose version [2.23.1](/manuals/compose/releases/release-notes.md#2231).
- `external`: If set to true, `external` specifies that this config has already been created. Compose does not
  attempt to create it, and if it does not exist, an error occurs.
- `name`: The name of the config object in the container engine to look up. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the project name.
@y
- `file`: The config is created with the contents of the file at the specified path.
- `environment`: The config content is created with the value of an environment variable. Introduced in Docker Compose version [2.23.1](manuals/compose/releases/release-notes.md#2231).
- `content`: The content is created with the inlined value. Introduced in Docker Compose version [2.23.1](manuals/compose/releases/release-notes.md#2231).
- `external`: If set to true, `external` specifies that this config has already been created. Compose does not
  attempt to create it, and if it does not exist, an error occurs.
- `name`: The name of the config object in the container engine to look up. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the project name.
@z

@x
## Example 1
@y
## Example 1
@z

@x
`<project_name>_http_config` is created when the application is deployed,
by registering the content of the `httpd.conf` as the configuration data.
@y
`<project_name>_http_config` is created when the application is deployed,
by registering the content of the `httpd.conf` as the configuration data.
@z

@x
```yml
configs:
  http_config:
    file: ./httpd.conf
```
@y
```yml
configs:
  http_config:
    file: ./httpd.conf
```
@z

@x
Alternatively, `http_config` can be declared as external. Compose looks up `http_config` to expose the configuration data to relevant services.
@y
Alternatively, `http_config` can be declared as external. Compose looks up `http_config` to expose the configuration data to relevant services.
@z

@x
```yml
configs:
  http_config:
    external: true
```
@y
```yml
configs:
  http_config:
    external: true
```
@z

@x
## Example 2
@y
## Example 2
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
```yml
configs:
  app_config:
    content: |
      debug=${DEBUG}
      spring.application.admin.enabled=${DEBUG}
      spring.application.name=${COMPOSE_PROJECT_NAME}
```
@y
```yml
configs:
  app_config:
    content: |
      debug=${DEBUG}
      spring.application.admin.enabled=${DEBUG}
      spring.application.name=${COMPOSE_PROJECT_NAME}
```
@z

@x
## Example 3
@y
## Example 3
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

@x
```yml
configs:
  http_config:
    external: true
    name: "${HTTP_CONFIG_KEY}"
```
@y
```yml
configs:
  http_config:
    external: true
    name: "${HTTP_CONFIG_KEY}"
```
@z

@x
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@z
