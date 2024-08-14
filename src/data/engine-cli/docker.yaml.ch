%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker
short: The base command for the Docker CLI.
long: |-
    Depending on your Docker system configuration, you may be required to preface
    each `docker` command with `sudo`. To avoid having to use `sudo` with the
    `docker` command, your system administrator can create a Unix group called
    `docker` and add users to it.
@y
command: docker
short: The base command for the Docker CLI.
long: |-
    Depending on your Docker system configuration, you may be required to preface
    each `docker` command with `sudo`. To avoid having to use `sudo` with the
    `docker` command, your system administrator can create a Unix group called
    `docker` and add users to it.
@z

@x
    For more information about installing Docker or `sudo` configuration, refer to
    the [installation](/install/) instructions for your operating system.
@y
    For more information about installing Docker or `sudo` configuration, refer to
    the [installation](/install/) instructions for your operating system.
@z

@x
    ### Display help text
@y
    ### Display help text
@z

@x
    To list the help on any command just execute the command, followed by the
    `--help` option.
@y
    To list the help on any command just execute the command, followed by the
    `--help` option.
@z

% snip command...

@x
    ### Environment variables
@y
    ### Environment variables
@z

@x
    The following list of environment variables are supported by the `docker` command
    line:
@y
    The following list of environment variables are supported by the `docker` command
    line:
@z

@x
    | Variable                      | Description                                                                                                                                                                                                                                                       |
    | :---------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `DOCKER_API_VERSION`          | Override the negotiated API version to use for debugging (e.g. `1.19`)                                                                                                                                                                                            |
    | `DOCKER_CERT_PATH`            | Location of your authentication keys. This variable is used both by the `docker` CLI and the [`dockerd` daemon](/reference/cli/dockerd/)                                                                                                   |
    | `DOCKER_CONFIG`               | The location of your client configuration files.                                                                                                                                                                                                                  |
    | `DOCKER_CONTENT_TRUST_SERVER` | The URL of the Notary server to use. Defaults to the same URL as the registry.                                                                                                                                                                                    |
    | `DOCKER_CONTENT_TRUST`        | When set Docker uses notary to sign and verify images. Equates to `--disable-content-trust=false` for build, create, pull, push, run.                                                                                                                             |
    | `DOCKER_CONTEXT`              | Name of the `docker context` to use (overrides `DOCKER_HOST` env var and default context set with `docker context use`)                                                                                                                                           |
    | `DOCKER_CUSTOM_HEADERS`       | (Experimental) Configure [custom HTTP headers](#custom-http-headers) to be sent by the client. Headers must be provided as a comma-separated list of `name=value` pairs. This is the equivalent to the `HttpHeaders` field in the configuration file.             |
    | `DOCKER_DEFAULT_PLATFORM`     | Default platform for commands that take the `--platform` flag.                                                                                                                                                                                                    |
    | `DOCKER_HIDE_LEGACY_COMMANDS` | When set, Docker hides "legacy" top-level commands (such as `docker rm`, and `docker pull`) in `docker help` output, and only `Management commands` per object-type (e.g., `docker container`) are printed. This may become the default in a future release.      |
    | `DOCKER_HOST`                 | Daemon socket to connect to.                                                                                                                                                                                                                                      |
    | `DOCKER_TLS`                  | Enable TLS for connections made by the `docker` CLI (equivalent of the `--tls` command-line option). Set to a non-empty value to enable TLS. Note that TLS is enabled automatically if any of the other TLS options are set.                                      |
    | `DOCKER_TLS_VERIFY`           | When set Docker uses TLS and verifies the remote. This variable is used both by the `docker` CLI and the [`dockerd` daemon](/reference/cli/dockerd/)                                                                                       |
    | `BUILDKIT_PROGRESS`           | Set type of progress output (`auto`, `plain`, `tty`, `rawjson`) when [building](/reference/cli/docker/image/build/) with [BuildKit backend](/build/buildkit/). Use plain to show container output (default `auto`). |
@y
    | Variable                      | Description                                                                                                                                                                                                                                                       |
    | :---------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `DOCKER_API_VERSION`          | Override the negotiated API version to use for debugging (e.g. `1.19`)                                                                                                                                                                                            |
    | `DOCKER_CERT_PATH`            | Location of your authentication keys. This variable is used both by the `docker` CLI and the [`dockerd` daemon](/reference/cli/dockerd/)                                                                                                   |
    | `DOCKER_CONFIG`               | The location of your client configuration files.                                                                                                                                                                                                                  |
    | `DOCKER_CONTENT_TRUST_SERVER` | The URL of the Notary server to use. Defaults to the same URL as the registry.                                                                                                                                                                                    |
    | `DOCKER_CONTENT_TRUST`        | When set Docker uses notary to sign and verify images. Equates to `--disable-content-trust=false` for build, create, pull, push, run.                                                                                                                             |
    | `DOCKER_CONTEXT`              | Name of the `docker context` to use (overrides `DOCKER_HOST` env var and default context set with `docker context use`)                                                                                                                                           |
    | `DOCKER_CUSTOM_HEADERS`       | (Experimental) Configure [custom HTTP headers](#custom-http-headers) to be sent by the client. Headers must be provided as a comma-separated list of `name=value` pairs. This is the equivalent to the `HttpHeaders` field in the configuration file.             |
    | `DOCKER_DEFAULT_PLATFORM`     | Default platform for commands that take the `--platform` flag.                                                                                                                                                                                                    |
    | `DOCKER_HIDE_LEGACY_COMMANDS` | When set, Docker hides "legacy" top-level commands (such as `docker rm`, and `docker pull`) in `docker help` output, and only `Management commands` per object-type (e.g., `docker container`) are printed. This may become the default in a future release.      |
    | `DOCKER_HOST`                 | Daemon socket to connect to.                                                                                                                                                                                                                                      |
    | `DOCKER_TLS`                  | Enable TLS for connections made by the `docker` CLI (equivalent of the `--tls` command-line option). Set to a non-empty value to enable TLS. Note that TLS is enabled automatically if any of the other TLS options are set.                                      |
    | `DOCKER_TLS_VERIFY`           | When set Docker uses TLS and verifies the remote. This variable is used both by the `docker` CLI and the [`dockerd` daemon](/reference/cli/dockerd/)                                                                                       |
    | `BUILDKIT_PROGRESS`           | Set type of progress output (`auto`, `plain`, `tty`, `rawjson`) when [building](/reference/cli/docker/image/build/) with [BuildKit backend](/build/buildkit/). Use plain to show container output (default `auto`). |
@z

@x
    Because Docker is developed using Go, you can also use any environment
    variables used by the Go runtime. In particular, you may find these useful:
@y
    Because Docker is developed using Go, you can also use any environment
    variables used by the Go runtime. In particular, you may find these useful:
@z

@x
    | Variable      | Description                                                                    |
    |:--------------|:-------------------------------------------------------------------------------|
    | `HTTP_PROXY`  | Proxy URL for HTTP requests unless overridden by NoProxy.                      |
    | `HTTPS_PROXY` | Proxy URL for HTTPS requests unless overridden by NoProxy.                     |
    | `NO_PROXY`    | Comma-separated values specifying hosts that should be excluded from proxying. |
@y
    | Variable      | Description                                                                    |
    |:--------------|:-------------------------------------------------------------------------------|
    | `HTTP_PROXY`  | Proxy URL for HTTP requests unless overridden by NoProxy.                      |
    | `HTTPS_PROXY` | Proxy URL for HTTPS requests unless overridden by NoProxy.                     |
    | `NO_PROXY`    | Comma-separated values specifying hosts that should be excluded from proxying. |
@z

@x
    See the [Go specification](https://pkg.go.dev/golang.org/x/net/http/httpproxy#Config)
    for details on these variables.
@y
    See the [Go specification](https://pkg.go.dev/golang.org/x/net/http/httpproxy#Config)
    for details on these variables.
@z

@x
    ### Option types
@y
    ### Option types
@z

@x
    Single character command line options can be combined, so rather than
    typing `docker run -i -t --name test busybox sh`,
    you can write `docker run -it --name test busybox sh`.
@y
    Single character command line options can be combined, so rather than
    typing `docker run -i -t --name test busybox sh`,
    you can write `docker run -it --name test busybox sh`.
@z

@x
    #### Boolean
@y
    #### Boolean
@z

@x
    Boolean options take the form `-d=false`. The value you see in the help text is
    the default value which is set if you do **not** specify that flag. If you
    specify a Boolean flag without a value, this will set the flag to `true`,
    irrespective of the default value.
@y
    Boolean options take the form `-d=false`. The value you see in the help text is
    the default value which is set if you do **not** specify that flag. If you
    specify a Boolean flag without a value, this will set the flag to `true`,
    irrespective of the default value.
@z

@x
    For example, running `docker run -d` will set the value to `true`, so your
    container **will** run in "detached" mode, in the background.
@y
    For example, running `docker run -d` will set the value to `true`, so your
    container **will** run in "detached" mode, in the background.
@z

@x
    Options which default to `true` (e.g., `docker build --rm=true`) can only be
    set to the non-default value by explicitly setting them to `false`:
@y
    Options which default to `true` (e.g., `docker build --rm=true`) can only be
    set to the non-default value by explicitly setting them to `false`:
@z

% snip command...

@x
    #### Multi
@y
    #### Multi
@z

@x
    You can specify options like `-a=[]` multiple times in a single command line,
    for example in these commands:
@y
    You can specify options like `-a=[]` multiple times in a single command line,
    for example in these commands:
@z

% snip command...

@x
    Sometimes, multiple options can call for a more complex value string as for
    `-v`:
@y
    Sometimes, multiple options can call for a more complex value string as for
    `-v`:
@z

% snip command...

@x
    > **Note**
    >
    > Do not use the `-t` and `-a stderr` options together due to
    > limitations in the `pty` implementation. All `stderr` in `pty` mode
    > simply goes to `stdout`.
@y
    > **Note**
    >
    > Do not use the `-t` and `-a stderr` options together due to
    > limitations in the `pty` implementation. All `stderr` in `pty` mode
    > simply goes to `stdout`.
@z

@x
    #### Strings and Integers
@y
    #### Strings and Integers
@z

@x
    Options like `--name=""` expect a string, and they
    can only be specified once. Options like `-c=0`
    expect an integer, and they can only be specified once.
@y
    Options like `--name=""` expect a string, and they
    can only be specified once. Options like `-c=0`
    expect an integer, and they can only be specified once.
@z

@x
    ### Configuration files
@y
    ### Configuration files
@z

@x
    By default, the Docker command line stores its configuration files in a
    directory called `.docker` within your `$HOME` directory.
@y
    By default, the Docker command line stores its configuration files in a
    directory called `.docker` within your `$HOME` directory.
@z

@x
    Docker manages most of the files in the configuration directory
    and you shouldn't modify them. However, you can modify the
    `config.json` file to control certain aspects of how the `docker`
    command behaves.
@y
    Docker manages most of the files in the configuration directory
    and you shouldn't modify them. However, you can modify the
    `config.json` file to control certain aspects of how the `docker`
    command behaves.
@z

@x
    You can modify the `docker` command behavior using environment
    variables or command-line options. You can also use options within
    `config.json` to modify some of the same behavior. If an environment variable
    and the `--config` flag are set, the flag takes precedent over the environment
    variable. Command line options override environment variables and environment
    variables override properties you specify in a `config.json` file.
@y
    You can modify the `docker` command behavior using environment
    variables or command-line options. You can also use options within
    `config.json` to modify some of the same behavior. If an environment variable
    and the `--config` flag are set, the flag takes precedent over the environment
    variable. Command line options override environment variables and environment
    variables override properties you specify in a `config.json` file.
@z

@x
    #### Change the `.docker` directory
@y
    #### Change the `.docker` directory
@z

@x
    To specify a different directory, use the `DOCKER_CONFIG`
    environment variable or the `--config` command line option. If both are
    specified, then the `--config` option overrides the `DOCKER_CONFIG` environment
    variable. The example below overrides the `docker ps` command using a
    `config.json` file located in the `~/testconfigs/` directory.
@y
    To specify a different directory, use the `DOCKER_CONFIG`
    environment variable or the `--config` command line option. If both are
    specified, then the `--config` option overrides the `DOCKER_CONFIG` environment
    variable. The example below overrides the `docker ps` command using a
    `config.json` file located in the `~/testconfigs/` directory.
@z

% snip command...

@x
    This flag only applies to whatever command is being ran. For persistent
    configuration, you can set the `DOCKER_CONFIG` environment variable in your
    shell (e.g. `~/.profile` or `~/.bashrc`). The example below sets the new
    directory to be `HOME/newdir/.docker`.
@y
    This flag only applies to whatever command is being ran. For persistent
    configuration, you can set the `DOCKER_CONFIG` environment variable in your
    shell (e.g. `~/.profile` or `~/.bashrc`). The example below sets the new
    directory to be `HOME/newdir/.docker`.
@z

% snip command...

@x
    ### Docker CLI configuration file (`config.json`) properties
@y
    ### Docker CLI configuration file (`config.json`) properties
@z

@x
    <a name="configjson-properties"><!-- included for deep-links to old section --></a>
@y
    <a name="configjson-properties"><!-- included for deep-links to old section --></a>
@z

@x
    Use the Docker CLI configuration to customize settings for the `docker` CLI. The
    configuration file uses JSON formatting, and properties:
@y
    Use the Docker CLI configuration to customize settings for the `docker` CLI. The
    configuration file uses JSON formatting, and properties:
@z

@x
    By default, configuration file is stored in `~/.docker/config.json`. Refer to the
    [change the `.docker` directory](#change-the-docker-directory) section to use a
    different location.
@y
    By default, configuration file is stored in `~/.docker/config.json`. Refer to the
    [change the `.docker` directory](#change-the-docker-directory) section to use a
    different location.
@z

@x
    > **Warning**
    >
    > The configuration file and other files inside the `~/.docker` configuration
    > directory may contain sensitive information, such as authentication information
    > for proxies or, depending on your credential store, credentials for your image
    > registries. Review your configuration file's content before sharing with others,
    > and prevent committing the file to version control.
@y
    > **Warning**
    >
    > The configuration file and other files inside the `~/.docker` configuration
    > directory may contain sensitive information, such as authentication information
    > for proxies or, depending on your credential store, credentials for your image
    > registries. Review your configuration file's content before sharing with others,
    > and prevent committing the file to version control.
@z

@x
    #### Customize the default output format for commands
@y
    #### Customize the default output format for commands
@z

@x
    These fields lets you customize the default output format for some commands
    if no `--format` flag is provided.
@y
    These fields lets you customize the default output format for some commands
    if no `--format` flag is provided.
@z

@x
    | Property               | Description                                                                                                                                                                                                    |
    | :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `configFormat`         | Custom default format for `docker config ls` output. See [`docker config ls`](/reference/cli/docker/config/ls/#format) for a list of supported formatting directives.                   |
    | `imagesFormat`         | Custom default format for `docker images` / `docker image ls` output. See [`docker images`](/reference/cli/docker/image/ls/#format) for a list of supported formatting directives.      |
    | `networksFormat`       | Custom default format for `docker network ls` output. See [`docker network ls`](/reference/cli/docker/network/ls/#format) for a list of supported formatting directives.                |
    | `nodesFormat`          | Custom default format for `docker node ls` output. See [`docker node ls`](/reference/cli/docker/node/ls/#format) for a list of supported formatting directives.                         |
    | `pluginsFormat`        | Custom default format for `docker plugin ls` output. See [`docker plugin ls`](/reference/cli/docker/plugin/ls/#format) for a list of supported formatting directives.                   |
    | `psFormat`             | Custom default format for `docker ps` / `docker container ps` output. See [`docker ps`](/reference/cli/docker/container/ls/#format) for a list of supported formatting directives.      |
    | `secretFormat`         | Custom default format for `docker secret ls` output. See [`docker secret ls`](/reference/cli/docker/secret/ls/#format) for a list of supported formatting directives.                   |
    | `serviceInspectFormat` | Custom default format for `docker service inspect` output. See [`docker service inspect`](/reference/cli/docker/service/inspect/#format) for a list of supported formatting directives. |
    | `servicesFormat`       | Custom default format for `docker service ls` output. See [`docker service ls`](/reference/cli/docker/service/ls/#format) for a list of supported formatting directives.                |
    | `statsFormat`          | Custom default format for `docker stats` output. See [`docker stats`](/reference/cli/docker/container/stats/#format) for a list of supported formatting directives.                     |
    | `tasksFormat`          | Custom default format for `docker stack ps` output. See [`docker stack ps`](/reference/cli/docker/stack/ps/#format) for a list of supported formatting directives.                      |
    | `volumesFormat`        | Custom default format for `docker volume ls` output. See [`docker volume ls`](/reference/cli/docker/volume/ls/#format) for a list of supported formatting directives.                   |
@y
    | Property               | Description                                                                                                                                                                                                    |
    | :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `configFormat`         | Custom default format for `docker config ls` output. See [`docker config ls`](/reference/cli/docker/config/ls/#format) for a list of supported formatting directives.                   |
    | `imagesFormat`         | Custom default format for `docker images` / `docker image ls` output. See [`docker images`](/reference/cli/docker/image/ls/#format) for a list of supported formatting directives.      |
    | `networksFormat`       | Custom default format for `docker network ls` output. See [`docker network ls`](/reference/cli/docker/network/ls/#format) for a list of supported formatting directives.                |
    | `nodesFormat`          | Custom default format for `docker node ls` output. See [`docker node ls`](/reference/cli/docker/node/ls/#format) for a list of supported formatting directives.                         |
    | `pluginsFormat`        | Custom default format for `docker plugin ls` output. See [`docker plugin ls`](/reference/cli/docker/plugin/ls/#format) for a list of supported formatting directives.                   |
    | `psFormat`             | Custom default format for `docker ps` / `docker container ps` output. See [`docker ps`](/reference/cli/docker/container/ls/#format) for a list of supported formatting directives.      |
    | `secretFormat`         | Custom default format for `docker secret ls` output. See [`docker secret ls`](/reference/cli/docker/secret/ls/#format) for a list of supported formatting directives.                   |
    | `serviceInspectFormat` | Custom default format for `docker service inspect` output. See [`docker service inspect`](/reference/cli/docker/service/inspect/#format) for a list of supported formatting directives. |
    | `servicesFormat`       | Custom default format for `docker service ls` output. See [`docker service ls`](/reference/cli/docker/service/ls/#format) for a list of supported formatting directives.                |
    | `statsFormat`          | Custom default format for `docker stats` output. See [`docker stats`](/reference/cli/docker/container/stats/#format) for a list of supported formatting directives.                     |
    | `tasksFormat`          | Custom default format for `docker stack ps` output. See [`docker stack ps`](/reference/cli/docker/stack/ps/#format) for a list of supported formatting directives.                      |
    | `volumesFormat`        | Custom default format for `docker volume ls` output. See [`docker volume ls`](/reference/cli/docker/volume/ls/#format) for a list of supported formatting directives.                   |
@z

@x
    #### Custom HTTP headers
@y
    #### Custom HTTP headers
@z

@x
    The property `HttpHeaders` specifies a set of headers to include in all messages
    sent from the Docker client to the daemon. Docker doesn't try to interpret or
    understand these headers; it simply puts them into the messages. Docker does
    not allow these headers to change any headers it sets for itself.
@y
    The property `HttpHeaders` specifies a set of headers to include in all messages
    sent from the Docker client to the daemon. Docker doesn't try to interpret or
    understand these headers; it simply puts them into the messages. Docker does
    not allow these headers to change any headers it sets for itself.
@z

@x
    Alternatively, use the `DOCKER_CUSTOM_HEADERS` [environment variable](#environment-variables),
    which is available in v27.1 and higher. This environment-variable is experimental,
    and its exact behavior may change.
@y
    Alternatively, use the `DOCKER_CUSTOM_HEADERS` [environment variable](#environment-variables),
    which is available in v27.1 and higher. This environment-variable is experimental,
    and its exact behavior may change.
@z

@x
    #### Credential store options
@y
    #### Credential store options
@z

@x
    The property `credsStore` specifies an external binary to serve as the default
    credential store. When this property is set, `docker login` will attempt to
    store credentials in the binary specified by `docker-credential-<value>` which
    is visible on `$PATH`. If this property isn't set, credentials are stored
    in the `auths` property of the CLI configuration file. For more information,
    see the [**Credential stores** section in the `docker login` documentation](/reference/cli/docker/login/#credential-stores)
@y
    The property `credsStore` specifies an external binary to serve as the default
    credential store. When this property is set, `docker login` will attempt to
    store credentials in the binary specified by `docker-credential-<value>` which
    is visible on `$PATH`. If this property isn't set, credentials are stored
    in the `auths` property of the CLI configuration file. For more information,
    see the [**Credential stores** section in the `docker login` documentation](/reference/cli/docker/login/#credential-stores)
@z

@x
    The property `credHelpers` specifies a set of credential helpers to use
    preferentially over `credsStore` or `auths` when storing and retrieving
    credentials for specific registries. If this property is set, the binary
    `docker-credential-<value>` will be used when storing or retrieving credentials
    for a specific registry. For more information, see the
    [**Credential helpers** section in the `docker login` documentation](/reference/cli/docker/login/#credential-helpers)
@y
    The property `credHelpers` specifies a set of credential helpers to use
    preferentially over `credsStore` or `auths` when storing and retrieving
    credentials for specific registries. If this property is set, the binary
    `docker-credential-<value>` will be used when storing or retrieving credentials
    for a specific registry. For more information, see the
    [**Credential helpers** section in the `docker login` documentation](/reference/cli/docker/login/#credential-helpers)
@z

@x
    #### Automatic proxy configuration for containers
@y
    #### Automatic proxy configuration for containers
@z

@x
    The property `proxies` specifies proxy environment variables to be automatically
    set on containers, and set as `--build-arg` on containers used during `docker build`.
    A `"default"` set of proxies can be configured, and will be used for any Docker
    daemon that the client connects to, or a configuration per host (Docker daemon),
    for example, `https://docker-daemon1.example.com`. The following properties can
    be set for each environment:
@y
    The property `proxies` specifies proxy environment variables to be automatically
    set on containers, and set as `--build-arg` on containers used during `docker build`.
    A `"default"` set of proxies can be configured, and will be used for any Docker
    daemon that the client connects to, or a configuration per host (Docker daemon),
    for example, `https://docker-daemon1.example.com`. The following properties can
    be set for each environment:
@z

@x
    | Property       | Description                                                                                             |
    |:---------------|:--------------------------------------------------------------------------------------------------------|
    | `httpProxy`    | Default value of `HTTP_PROXY` and `http_proxy` for containers, and as `--build-arg` on `docker build`   |
    | `httpsProxy`   | Default value of `HTTPS_PROXY` and `https_proxy` for containers, and as `--build-arg` on `docker build` |
    | `ftpProxy`     | Default value of `FTP_PROXY` and `ftp_proxy` for containers, and as `--build-arg` on `docker build`     |
    | `noProxy`      | Default value of `NO_PROXY` and `no_proxy` for containers, and as `--build-arg` on `docker build`       |
    | `allProxy`     | Default value of `ALL_PROXY` and `all_proxy` for containers, and as `--build-arg` on `docker build`     |
@y
    | Property       | Description                                                                                             |
    |:---------------|:--------------------------------------------------------------------------------------------------------|
    | `httpProxy`    | Default value of `HTTP_PROXY` and `http_proxy` for containers, and as `--build-arg` on `docker build`   |
    | `httpsProxy`   | Default value of `HTTPS_PROXY` and `https_proxy` for containers, and as `--build-arg` on `docker build` |
    | `ftpProxy`     | Default value of `FTP_PROXY` and `ftp_proxy` for containers, and as `--build-arg` on `docker build`     |
    | `noProxy`      | Default value of `NO_PROXY` and `no_proxy` for containers, and as `--build-arg` on `docker build`       |
    | `allProxy`     | Default value of `ALL_PROXY` and `all_proxy` for containers, and as `--build-arg` on `docker build`     |
@z

@x
    These settings are used to configure proxy settings for containers only, and not
    used as proxy settings for the `docker` CLI or the `dockerd` daemon. Refer to the
    [environment variables](#environment-variables) and [HTTP/HTTPS proxy](/engine/daemon/proxy/#httphttps-proxy)
    sections for configuring proxy settings for the CLI and daemon.
@y
    These settings are used to configure proxy settings for containers only, and not
    used as proxy settings for the `docker` CLI or the `dockerd` daemon. Refer to the
    [environment variables](#environment-variables) and [HTTP/HTTPS proxy](/engine/daemon/proxy/#httphttps-proxy)
    sections for configuring proxy settings for the CLI and daemon.
@z

@x
    > **Warning**
    >
    > Proxy settings may contain sensitive information (for example, if the proxy
    > requires authentication). Environment variables are stored as plain text in
    > the container's configuration, and as such can be inspected through the remote
    > API or committed to an image when using `docker commit`.
    { .warning }
@y
    > **Warning**
    >
    > Proxy settings may contain sensitive information (for example, if the proxy
    > requires authentication). Environment variables are stored as plain text in
    > the container's configuration, and as such can be inspected through the remote
    > API or committed to an image when using `docker commit`.
    { .warning }
@z

@x
    #### Default key-sequence to detach from containers
@y
    #### Default key-sequence to detach from containers
@z

@x
    Once attached to a container, users detach from it and leave it running using
    the using `CTRL-p CTRL-q` key sequence. This detach key sequence is customizable
    using the `detachKeys` property. Specify a `<sequence>` value for the
    property. The format of the `<sequence>` is a comma-separated list of either
    a letter [a-Z], or the `ctrl-` combined with any of the following:
@y
    Once attached to a container, users detach from it and leave it running using
    the using `CTRL-p CTRL-q` key sequence. This detach key sequence is customizable
    using the `detachKeys` property. Specify a `<sequence>` value for the
    property. The format of the `<sequence>` is a comma-separated list of either
    a letter [a-Z], or the `ctrl-` combined with any of the following:
@z

@x
    * `a-z` (a single lowercase alpha character )
    * `@` (at sign)
    * `[` (left bracket)
    * `\\` (two backward slashes)
    * `_` (underscore)
    * `^` (caret)
@y
    * `a-z` (a single lowercase alpha character )
    * `@` (at sign)
    * `[` (left bracket)
    * `\\` (two backward slashes)
    * `_` (underscore)
    * `^` (caret)
@z

@x
    Your customization applies to all containers started in with your Docker client.
    Users can override your custom or the default key sequence on a per-container
    basis. To do this, the user specifies the `--detach-keys` flag with the `docker
    attach`, `docker exec`, `docker run` or `docker start` command.
@y
    Your customization applies to all containers started in with your Docker client.
    Users can override your custom or the default key sequence on a per-container
    basis. To do this, the user specifies the `--detach-keys` flag with the `docker
    attach`, `docker exec`, `docker run` or `docker start` command.
@z

@x
    #### CLI plugin options
@y
    #### CLI plugin options
@z

@x
    The property `plugins` contains settings specific to CLI plugins. The
    key is the plugin name, while the value is a further map of options,
    which are specific to that plugin.
@y
    The property `plugins` contains settings specific to CLI plugins. The
    key is the plugin name, while the value is a further map of options,
    which are specific to that plugin.
@z

@x
    #### Sample configuration file
@y
    #### Sample configuration file
@z

@x
    Following is a sample `config.json` file to illustrate the format used for
    various fields:
@y
    Following is a sample `config.json` file to illustrate the format used for
    various fields:
@z

% snip code...

@x
    #### Experimental features
@y
    #### Experimental features
@z

@x
    Experimental features provide early access to future product functionality.
    These features are intended for testing and feedback, and they may change
    between releases without warning or can be removed from a future release.
@y
    Experimental features provide early access to future product functionality.
    These features are intended for testing and feedback, and they may change
    between releases without warning or can be removed from a future release.
@z

@x
    Starting with Docker 20.10, experimental CLI features are enabled by default,
    and require no configuration to enable them.
@y
    Starting with Docker 20.10, experimental CLI features are enabled by default,
    and require no configuration to enable them.
@z

@x
    #### Notary
@y
    #### Notary
@z

@x
    If using your own notary server and a self-signed certificate or an internal
    Certificate Authority, you need to place the certificate at
    `tls/<registry_url>/ca.crt` in your Docker config directory.
@y
    If using your own notary server and a self-signed certificate or an internal
    Certificate Authority, you need to place the certificate at
    `tls/<registry_url>/ca.crt` in your Docker config directory.
@z

@x
    Alternatively you can trust the certificate globally by adding it to your system's
    list of root Certificate Authorities.
@y
    Alternatively you can trust the certificate globally by adding it to your system's
    list of root Certificate Authorities.
@z

% cname:
% clink:
% options:

@x config
      description: Location of client config files
@y
      description: Location of client config files
@z

@x context
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
@y
      description: |
        Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with `docker context use`)
@z

@x debug
      description: Enable debug mode
@y
      description: デバッグモードを有効にします。
@z

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x host
      description: Daemon socket to connect to
@y
      description: デーモンソケットの接続先。
@z

@x log-level
      description: Set the logging level (`debug`, `info`, `warn`, `error`, `fatal`)
@y
      description: ログ出力レベルを設定します。（`debug`, `info`, `warn`, `error`, `fatal`）
@z

@x tls
      description: Use TLS; implied by --tlsverify
@y
      description: TLS の利用。暗に --tlsverify を含みます。
@z

@x tlscacert
      description: Trust certs signed only by this CA
@y
      description: この CA によってのみ署名された信頼できる証明局。
@z

@x tlscert
      description: Path to TLS certificate file
@y
      description: TLS 証明書ファイルへのパス。
@z

@x tlskey
      description: Path to TLS key file
@y
      description: TLS 鍵ファイルへのパス。
@z

@x tlsverify
      description: Use TLS and verify the remote
@y
      description: TLS を利用しリモートを確認します。
@z

@x
examples: |-
    ### Specify daemon host (-H, --host) {#host}
@y
examples: |-
    ### Specify daemon host (-H, --host) {#host}
@z

@x
    You can use the `-H`, `--host` flag to specify a socket to use when you invoke
    a `docker` command. You can use the following protocols:
@y
    You can use the `-H`, `--host` flag to specify a socket to use when you invoke
    a `docker` command. You can use the following protocols:
@z

@x
    | Scheme                                 | Description               | Example                          |
    |----------------------------------------|---------------------------|----------------------------------|
    | `unix://[<path>]`                      | Unix socket (Linux only)  | `unix:///var/run/docker.sock`    |
    | `tcp://[<IP or host>[:port]]`          | TCP connection            | `tcp://174.17.0.1:2376`          |
    | `ssh://[username@]<IP or host>[:port]` | SSH connection            | `ssh://user@192.168.64.5`        |
    | `npipe://[<name>]`                     | Named pipe (Windows only) | `npipe:////./pipe/docker_engine` |
@y
    | Scheme                                 | Description               | Example                          |
    |----------------------------------------|---------------------------|----------------------------------|
    | `unix://[<path>]`                      | Unix socket (Linux only)  | `unix:///var/run/docker.sock`    |
    | `tcp://[<IP or host>[:port]]`          | TCP connection            | `tcp://174.17.0.1:2376`          |
    | `ssh://[username@]<IP or host>[:port]` | SSH connection            | `ssh://user@192.168.64.5`        |
    | `npipe://[<name>]`                     | Named pipe (Windows only) | `npipe:////./pipe/docker_engine` |
@z

@x
    If you don't specify the `-H` flag, and you're not using a custom
    [context](/engine/context/working-with-contexts),
    commands use the following default sockets:
@y
    If you don't specify the `-H` flag, and you're not using a custom
    [context](/engine/context/working-with-contexts),
    commands use the following default sockets:
@z

@x
    - `unix:///var/run/docker.sock` on macOS and Linux
    - `npipe:////./pipe/docker_engine` on Windows
@y
    - `unix:///var/run/docker.sock` on macOS and Linux
    - `npipe:////./pipe/docker_engine` on Windows
@z

@x
    To achieve a similar effect without having to specify the `-H` flag for every
    command, you could also [create a context](/reference/cli/docker/context/create/),
    or alternatively, use the
    [`DOCKER_HOST` environment variable](#environment-variables).
@y
    To achieve a similar effect without having to specify the `-H` flag for every
    command, you could also [create a context](/reference/cli/docker/context/create/),
    or alternatively, use the
    [`DOCKER_HOST` environment variable](#environment-variables).
@z

@x
    For more information about the `-H` flag, see
    [Daemon socket option](/reference/cli/dockerd/#daemon-socket-option).
@y
    For more information about the `-H` flag, see
    [Daemon socket option](/reference/cli/dockerd/#daemon-socket-option).
@z

@x
    #### Using TCP sockets
@y
    #### Using TCP sockets
@z

@x
    The following example shows how to invoke `docker ps` over TCP, to a remote
    daemon with IP address `174.17.0.1`, listening on port `2376`:
@y
    The following example shows how to invoke `docker ps` over TCP, to a remote
    daemon with IP address `174.17.0.1`, listening on port `2376`:
@z

% snip command...

@x
    > **Note**
    >
    > By convention, the Docker daemon uses port `2376` for secure TLS connections,
    > and port `2375` for insecure, non-TLS connections.
@y
    > **Note**
    >
    > By convention, the Docker daemon uses port `2376` for secure TLS connections,
    > and port `2375` for insecure, non-TLS connections.
@z

@x
    #### Using SSH sockets
@y
    #### Using SSH sockets
@z

@x
    When you use SSH invoke a command on a remote daemon, the request gets forwarded
    to the `/var/run/docker.sock` Unix socket on the SSH host.
@y
    When you use SSH invoke a command on a remote daemon, the request gets forwarded
    to the `/var/run/docker.sock` Unix socket on the SSH host.
@z

% snip command...

@x
    You can optionally specify the location of the socket by appending a path
    component to the end of the SSH address.
@y
    You can optionally specify the location of the socket by appending a path
    component to the end of the SSH address.
@z

% snip command...

@x
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
