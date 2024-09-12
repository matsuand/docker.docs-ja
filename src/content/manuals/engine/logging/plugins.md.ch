%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn about logging driver plugins for extending and customizing Docker's logging capabilities
title: Use a logging driver plugin
keywords: logging, driver, plugins, monitoring
@y
description: Learn about logging driver plugins for extending and customizing Docker's logging capabilities
title: Use a logging driver plugin
keywords: logging, driver, plugins, monitoring
@z

@x
Docker logging plugins allow you to extend and customize Docker's logging
capabilities beyond those of the [built-in logging drivers](configure.md).
A logging service provider can
[implement their own plugins](/manuals/engine/extend/plugins_logging.md) and make them
available on Docker Hub, or a private registry. This topic shows
how a user of that logging service can configure Docker to use the plugin.
@y
Docker logging plugins allow you to extend and customize Docker's logging
capabilities beyond those of the [built-in logging drivers](configure.md).
A logging service provider can
[implement their own plugins](manuals/engine/extend/plugins_logging.md) and make them
available on Docker Hub, or a private registry. This topic shows
how a user of that logging service can configure Docker to use the plugin.
@z

@x
## Install the logging driver plugin
@y
## Install the logging driver plugin
@z

@x
To install a logging driver plugin, use `docker plugin install <org/image>`,
using the information provided by the plugin developer.
@y
To install a logging driver plugin, use `docker plugin install <org/image>`,
using the information provided by the plugin developer.
@z

@x
You can list all installed plugins using `docker plugin ls`, and you can inspect
a specific plugin using `docker inspect`.
@y
You can list all installed plugins using `docker plugin ls`, and you can inspect
a specific plugin using `docker inspect`.
@z

@x
## Configure the plugin as the default logging driver
@y
## Configure the plugin as the default logging driver
@z

@x
When the plugin is installed, you can configure the Docker daemon to use it as
the default by setting the plugin's name as the value of the `log-driver`
key in the `daemon.json`, as detailed in the
[logging overview](configure.md#configure-the-default-logging-driver). If the
logging driver supports additional options, you can set those as the values of
the `log-opts` array in the same file.
@y
When the plugin is installed, you can configure the Docker daemon to use it as
the default by setting the plugin's name as the value of the `log-driver`
key in the `daemon.json`, as detailed in the
[logging overview](configure.md#configure-the-default-logging-driver). If the
logging driver supports additional options, you can set those as the values of
the `log-opts` array in the same file.
@z

@x
## Configure a container to use the plugin as the logging driver
@y
## Configure a container to use the plugin as the logging driver
@z

@x
After the plugin is installed, you can configure a container to use the plugin
as its logging driver by specifying the `--log-driver` flag to `docker run`, as
detailed in the
[logging overview](configure.md#configure-the-logging-driver-for-a-container).
If the logging driver supports additional options, you can specify them using
one or more `--log-opt` flags with the option name as the key and the option
value as the value.
@y
After the plugin is installed, you can configure a container to use the plugin
as its logging driver by specifying the `--log-driver` flag to `docker run`, as
detailed in the
[logging overview](configure.md#configure-the-logging-driver-for-a-container).
If the logging driver supports additional options, you can specify them using
one or more `--log-opt` flags with the option name as the key and the option
value as the value.
@z
