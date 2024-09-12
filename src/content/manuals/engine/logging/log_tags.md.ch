%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about how to format log output with Go templates
keywords: docker, logging, driver, syslog, Fluentd, gelf, journald
title: Customize log driver output
aliases:
  - /engine/reference/logging/log_tags/
  - /engine/admin/logging/log_tags/
  - /config/containers/logging/log_tags/
---
@y
---
description: Learn about how to format log output with Go templates
keywords: docker, logging, driver, syslog, Fluentd, gelf, journald
title: Customize log driver output
aliases:
  - /engine/reference/logging/log_tags/
  - /engine/admin/logging/log_tags/
  - /config/containers/logging/log_tags/
---
@z

@x
The `tag` log option specifies how to format a tag that identifies the
container's log messages. By default, the system uses the first 12 characters of
the container ID. To override this behavior, specify a `tag` option:
@y
The `tag` log option specifies how to format a tag that identifies the
container's log messages. By default, the system uses the first 12 characters of
the container ID. To override this behavior, specify a `tag` option:
@z

@x
```console
$ docker run --log-driver=fluentd --log-opt fluentd-address=myhost.local:24224 --log-opt tag="mailer"
```
@y
```console
$ docker run --log-driver=fluentd --log-opt fluentd-address=myhost.local:24224 --log-opt tag="mailer"
```
@z

@x
Docker supports some special template markup you can use when specifying a tag's value:
@y
Docker supports some special template markup you can use when specifying a tag's value:
@z

@x
| Markup             | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `{{.ID}}`          | The first 12 characters of the container ID.         |
| `{{.FullID}}`      | The full container ID.                               |
| `{{.Name}}`        | The container name.                                  |
| `{{.ImageID}}`     | The first 12 characters of the container's image ID. |
| `{{.ImageFullID}}` | The container's full image ID.                       |
| `{{.ImageName}}`   | The name of the image used by the container.         |
| `{{.DaemonName}}`  | The name of the Docker program (`docker`).           |
@y
| Markup             | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `{{.ID}}`          | The first 12 characters of the container ID.         |
| `{{.FullID}}`      | The full container ID.                               |
| `{{.Name}}`        | The container name.                                  |
| `{{.ImageID}}`     | The first 12 characters of the container's image ID. |
| `{{.ImageFullID}}` | The container's full image ID.                       |
| `{{.ImageName}}`   | The name of the image used by the container.         |
| `{{.DaemonName}}`  | The name of the Docker program (`docker`).           |
@z

@x
For example, specifying a `--log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"` value yields `syslog` log lines like:
@y
For example, specifying a `--log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"` value yields `syslog` log lines like:
@z

@x
```none
Aug  7 18:33:19 HOSTNAME hello-world/foobar/5790672ab6a0[9103]: Hello from Docker.
```
@y
```none
Aug  7 18:33:19 HOSTNAME hello-world/foobar/5790672ab6a0[9103]: Hello from Docker.
```
@z

@x
At startup time, the system sets the `container_name` field and `{{.Name}}` in
the tags. If you use `docker rename` to rename a container, the new name isn't
reflected in the log messages. Instead, these messages continue to use the
original container name.
@y
At startup time, the system sets the `container_name` field and `{{.Name}}` in
the tags. If you use `docker rename` to rename a container, the new name isn't
reflected in the log messages. Instead, these messages continue to use the
original container name.
@z
