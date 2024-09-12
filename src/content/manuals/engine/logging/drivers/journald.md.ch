%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how to use the Journald logging driver with Docker Engine
keywords: journald, systemd-journald, docker, logging, driver
title: Journald logging driver
@y
description: Learn how to use the Journald logging driver with Docker Engine
keywords: journald, systemd-journald, docker, logging, driver
title: Journald logging driver
@z

@x
The `journald` logging driver sends container logs to the
[`systemd` journal](https://www.freedesktop.org/software/systemd/man/systemd-journald.service.html).
Log entries can be retrieved using the `journalctl` command, through use of the
`journal` API, or using the `docker logs` command.
@y
The `journald` logging driver sends container logs to the
[`systemd` journal](https://www.freedesktop.org/software/systemd/man/systemd-journald.service.html).
Log entries can be retrieved using the `journalctl` command, through use of the
`journal` API, or using the `docker logs` command.
@z

@x
In addition to the text of the log message itself, the `journald` log driver
stores the following metadata in the journal with each message:
@y
In addition to the text of the log message itself, the `journald` log driver
stores the following metadata in the journal with each message:
@z

@x
| Field                                | Description                                                                                                                                           |
| :----------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONTAINER_ID`                       | The container ID truncated to 12 characters.                                                                                                          |
| `CONTAINER_ID_FULL`                  | The full 64-character container ID.                                                                                                                   |
| `CONTAINER_NAME`                     | The container name at the time it was started. If you use `docker rename` to rename a container, the new name isn't reflected in the journal entries. |
| `CONTAINER_TAG`, `SYSLOG_IDENTIFIER` | The container tag ([log tag option documentation](log_tags.md)).                                                                                      |
| `CONTAINER_PARTIAL_MESSAGE`          | A field that flags log integrity. Improve logging of long log lines.                                                                                  |
| `IMAGE_NAME`                         | The name of the container image.                                                                                                                      |
@y
| Field                                | Description                                                                                                                                           |
| :----------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONTAINER_ID`                       | The container ID truncated to 12 characters.                                                                                                          |
| `CONTAINER_ID_FULL`                  | The full 64-character container ID.                                                                                                                   |
| `CONTAINER_NAME`                     | The container name at the time it was started. If you use `docker rename` to rename a container, the new name isn't reflected in the journal entries. |
| `CONTAINER_TAG`, `SYSLOG_IDENTIFIER` | The container tag ([log tag option documentation](log_tags.md)).                                                                                      |
| `CONTAINER_PARTIAL_MESSAGE`          | A field that flags log integrity. Improve logging of long log lines.                                                                                  |
| `IMAGE_NAME`                         | The name of the container image.                                                                                                                      |
@z

@x
## Usage
@y
## Usage
@z

@x
To use the `journald` driver as the default logging driver, set the `log-driver`
and `log-opts` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](/reference/cli/dockerd.md#daemon-configuration-file).
@y
To use the `journald` driver as the default logging driver, set the `log-driver`
and `log-opts` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](reference/cli/dockerd.md#daemon-configuration-file).
@z

@x
The following example sets the log driver to `journald`:
@y
The following example sets the log driver to `journald`:
@z

@x
```json
{
  "log-driver": "journald"
}
```
@y
```json
{
  "log-driver": "journald"
}
```
@z

@x
Restart Docker for the changes to take effect.
@y
Restart Docker for the changes to take effect.
@z

@x
To configure the logging driver for a specific container, use the `--log-driver`
flag on the `docker run` command.
@y
To configure the logging driver for a specific container, use the `--log-driver`
flag on the `docker run` command.
@z

@x
```console
$ docker run --log-driver=journald ...
```
@y
```console
$ docker run --log-driver=journald ...
```
@z

@x
## Options
@y
## Options
@z

@x
Use the `--log-opt NAME=VALUE` flag to specify additional `journald` logging
driver options.
@y
Use the `--log-opt NAME=VALUE` flag to specify additional `journald` logging
driver options.
@z

@x
| Option         | Required | Description                                                                                                                                                                   |
| :------------- | :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `tag`          | optional | Specify template to set `CONTAINER_TAG` and `SYSLOG_IDENTIFIER` value in journald logs. Refer to [log tag option documentation](log_tags.md) to customize the log tag format. |
| `labels`       | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for the container.                                                 |
| `labels-regex` | optional | Similar to and compatible with labels. A regular expression to match logging-related labels. Used for advanced [log tag options](log_tags.md).                                |
| `env`          | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for the container.                               |
| `env-regex`    | optional | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                    |
@y
| Option         | Required | Description                                                                                                                                                                   |
| :------------- | :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `tag`          | optional | Specify template to set `CONTAINER_TAG` and `SYSLOG_IDENTIFIER` value in journald logs. Refer to [log tag option documentation](log_tags.md) to customize the log tag format. |
| `labels`       | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for the container.                                                 |
| `labels-regex` | optional | Similar to and compatible with labels. A regular expression to match logging-related labels. Used for advanced [log tag options](log_tags.md).                                |
| `env`          | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for the container.                               |
| `env-regex`    | optional | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                    |
@z

@x
If a collision occurs between `label` and `env` options, the value of the `env`
takes precedence. Each option adds additional fields to the attributes of a
logging message.
@y
If a collision occurs between `label` and `env` options, the value of the `env`
takes precedence. Each option adds additional fields to the attributes of a
logging message.
@z

@x
The following is an example of the logging options required to log to journald.
@y
The following is an example of the logging options required to log to journald.
@z

@x
```console
$ docker run \
    --log-driver=journald \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
@y
```console
$ docker run \
    --log-driver=journald \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
@z

@x
This configuration also directs the driver to include in the payload the label
location, and the environment variable `TEST`. If the `--env "TEST=false"`
or `--label location=west` arguments were omitted, the corresponding key would
not be set in the journald log.
@y
This configuration also directs the driver to include in the payload the label
location, and the environment variable `TEST`. If the `--env "TEST=false"`
or `--label location=west` arguments were omitted, the corresponding key would
not be set in the journald log.
@z

@x
## Note regarding container names
@y
## Note regarding container names
@z

@x
The value logged in the `CONTAINER_NAME` field is the name of the container that
was set at startup. If you use `docker rename` to rename a container, the new
name isn't reflected in the journal entries. Journal entries continue
to use the original name.
@y
The value logged in the `CONTAINER_NAME` field is the name of the container that
was set at startup. If you use `docker rename` to rename a container, the new
name isn't reflected in the journal entries. Journal entries continue
to use the original name.
@z

@x
## Retrieve log messages with `journalctl`
@y
## Retrieve log messages with `journalctl`
@z

@x
Use the `journalctl` command to retrieve log messages. You can apply filter
expressions to limit the retrieved messages to those associated with a specific
container:
@y
Use the `journalctl` command to retrieve log messages. You can apply filter
expressions to limit the retrieved messages to those associated with a specific
container:
@z

@x
```console
$ sudo journalctl CONTAINER_NAME=webserver
```
@y
```console
$ sudo journalctl CONTAINER_NAME=webserver
```
@z

@x
You can use additional filters to further limit the messages retrieved. The `-b`
flag only retrieves messages generated since the last system boot:
@y
You can use additional filters to further limit the messages retrieved. The `-b`
flag only retrieves messages generated since the last system boot:
@z

@x
```console
$ sudo journalctl -b CONTAINER_NAME=webserver
```
@y
```console
$ sudo journalctl -b CONTAINER_NAME=webserver
```
@z

@x
The `-o` flag specifies the format for the retrieved log messages. Use `-o json`
to return the log messages in JSON format.
@y
The `-o` flag specifies the format for the retrieved log messages. Use `-o json`
to return the log messages in JSON format.
@z

@x
```console
$ sudo journalctl -o json CONTAINER_NAME=webserver
```
@y
```console
$ sudo journalctl -o json CONTAINER_NAME=webserver
```
@z

@x
### View logs for a container with a TTY enabled
@y
### View logs for a container with a TTY enabled
@z

@x
If TTY is enabled on a container you may see `[10B blob data]` in the output
when retrieving log messages.
The reason for that is that `\r` is appended to the end of the line and
`journalctl` doesn't strip it automatically unless `--all` is set:
@y
If TTY is enabled on a container you may see `[10B blob data]` in the output
when retrieving log messages.
The reason for that is that `\r` is appended to the end of the line and
`journalctl` doesn't strip it automatically unless `--all` is set:
@z

@x
```console
$ sudo journalctl -b CONTAINER_NAME=webserver --all
```
@y
```console
$ sudo journalctl -b CONTAINER_NAME=webserver --all
```
@z

@x
## Retrieve log messages with the `journal` API
@y
## Retrieve log messages with the `journal` API
@z

@x
This example uses the `systemd` Python module to retrieve container
logs:
@y
This example uses the `systemd` Python module to retrieve container
logs:
@z

@x
```python
import systemd.journal
@y
```python
import systemd.journal
@z

@x
reader = systemd.journal.Reader()
reader.add_match('CONTAINER_NAME=web')
@y
reader = systemd.journal.Reader()
reader.add_match('CONTAINER_NAME=web')
@z

@x
for msg in reader:
    print '{CONTAINER_ID_FULL}: {MESSAGE}'.format(**msg)
```
@y
for msg in reader:
    print '{CONTAINER_ID_FULL}: {MESSAGE}'.format(**msg)
```
@z
