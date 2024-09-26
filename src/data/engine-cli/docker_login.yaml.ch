%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker login
short: Authenticate to a registry
long: |-
    Authenticate to a registry.
@y
command: docker login
short: Authenticate to a registry
long: |-
    Authenticate to a registry.
@z

@x
    You can authenticate to any public or private registry for which you have
    credentials. Authentication may be required for pulling and pushing images.
    Other commands, such as `docker scout` and `docker build`, may also require
    authentication to access subscription-only features or data related to your
    Docker organization.
@y
    You can authenticate to any public or private registry for which you have
    credentials. Authentication may be required for pulling and pushing images.
    Other commands, such as `docker scout` and `docker build`, may also require
    authentication to access subscription-only features or data related to your
    Docker organization.
@z

@x
    Authentication credentials are stored in the configured [credential
    store](#credential-stores). If you use Docker Desktop, credentials are
    automatically saved to the native keychain of your operating system. If you're
    not using Docker Desktop, you can configure the credential store in the Docker
    configuration file, which is located at `$HOME/.docker/config.json` on Linux or
    `%USERPROFILE%/.docker/config.json` on Windows. If you don't configure a
    credential store, Docker stores credentials in the `config.json` file in a
    base64-encoded format. This method is less secure than configuring and using a
    credential store.
@y
    Authentication credentials are stored in the configured [credential
    store](#credential-stores). If you use Docker Desktop, credentials are
    automatically saved to the native keychain of your operating system. If you're
    not using Docker Desktop, you can configure the credential store in the Docker
    configuration file, which is located at `$HOME/.docker/config.json` on Linux or
    `%USERPROFILE%/.docker/config.json` on Windows. If you don't configure a
    credential store, Docker stores credentials in the `config.json` file in a
    base64-encoded format. This method is less secure than configuring and using a
    credential store.
@z

@x
    `docker login` also supports [credential helpers](#credential-helpers) to help
    you handle credentials for specific registries.
@y
    `docker login` also supports [credential helpers](#credential-helpers) to help
    you handle credentials for specific registries.
@z

@x
    ### Authentication methods
@y
    ### Authentication methods
@z

@x
    You can authenticate to a registry using a username and access token or
    password. Docker Hub also supports a web-based sign-in flow, which signs you in
    to your Docker account without entering your password. For Docker Hub, the
    `docker login` command uses a device code flow by default, unless the
    `--username` flag is specified. The device code flow is a secure way to sign
    in. See [Authenticate to Docker Hub using device code](#authenticate-to-docker-hub-with-web-based-login).
@y
    You can authenticate to a registry using a username and access token or
    password. Docker Hub also supports a web-based sign-in flow, which signs you in
    to your Docker account without entering your password. For Docker Hub, the
    `docker login` command uses a device code flow by default, unless the
    `--username` flag is specified. The device code flow is a secure way to sign
    in. See [Authenticate to Docker Hub using device code](#authenticate-to-docker-hub-with-web-based-login).
@z

@x
    ### Credential stores
@y
    ### Credential stores
@z

@x
    The Docker Engine can keep user credentials in an external credential store,
    such as the native keychain of the operating system. Using an external store
    is more secure than storing credentials in the Docker configuration file.
@y
    The Docker Engine can keep user credentials in an external credential store,
    such as the native keychain of the operating system. Using an external store
    is more secure than storing credentials in the Docker configuration file.
@z

@x
    To use a credential store, you need an external helper program to interact
    with a specific keychain or external store. Docker requires the helper
    program to be in the client's host `$PATH`.
@y
    To use a credential store, you need an external helper program to interact
    with a specific keychain or external store. Docker requires the helper
    program to be in the client's host `$PATH`.
@z

@x
    You can download the helpers from the `docker-credential-helpers`
    [releases page](https://github.com/docker/docker-credential-helpers/releases).
    Helpers are available for the following credential stores:
@y
    You can download the helpers from the `docker-credential-helpers`
    [releases page](https://github.com/docker/docker-credential-helpers/releases).
    Helpers are available for the following credential stores:
@z

@x
    - D-Bus Secret Service
    - Apple macOS keychain
    - Microsoft Windows Credential Manager
    - [pass](https://www.passwordstore.org/)
@y
    - D-Bus Secret Service
    - Apple macOS keychain
    - Microsoft Windows Credential Manager
    - [pass](https://www.passwordstore.org/)
@z

@x
    With Docker Desktop, the credential store is already installed and configured
    for you. Unless you want to change the credential store used by Docker Desktop,
    you can skip the following steps.
@y
    With Docker Desktop, the credential store is already installed and configured
    for you. Unless you want to change the credential store used by Docker Desktop,
    you can skip the following steps.
@z

@x
    #### Configure the credential store
@y
    #### Configure the credential store
@z

@x
    You need to specify the credential store in `$HOME/.docker/config.json`
    to tell the Docker Engine to use it. The value of the config property should be
    the suffix of the program to use (i.e. everything after `docker-credential-`).
    For example, to use `docker-credential-osxkeychain`:
@y
    You need to specify the credential store in `$HOME/.docker/config.json`
    to tell the Docker Engine to use it. The value of the config property should be
    the suffix of the program to use (i.e. everything after `docker-credential-`).
    For example, to use `docker-credential-osxkeychain`:
@z

% snip code...

@x
    If you are currently logged in, run `docker logout` to remove
    the credentials from the file and run `docker login` again.
@y
    If you are currently logged in, run `docker logout` to remove
    the credentials from the file and run `docker login` again.
@z

@x
    #### Default behavior
@y
    #### Default behavior
@z

@x
    By default, Docker looks for the native binary on each of the platforms, i.e.
    `osxkeychain` on macOS, `wincred` on Windows, and `pass` on Linux. A special
    case is that on Linux, Docker will fall back to the `secretservice` binary if
    it cannot find the `pass` binary. If none of these binaries are present, it
    stores the base64-encoded credentials in the `config.json` configuration file.
@y
    By default, Docker looks for the native binary on each of the platforms, i.e.
    `osxkeychain` on macOS, `wincred` on Windows, and `pass` on Linux. A special
    case is that on Linux, Docker will fall back to the `secretservice` binary if
    it cannot find the `pass` binary. If none of these binaries are present, it
    stores the base64-encoded credentials in the `config.json` configuration file.
@z

@x
    #### Credential helper protocol
@y
    #### Credential helper protocol
@z

@x
    Credential helpers can be any program or script that implements the credential
    helper protocol. This protocol is inspired by Git, but differs in the
    information shared.
@y
    Credential helpers can be any program or script that implements the credential
    helper protocol. This protocol is inspired by Git, but differs in the
    information shared.
@z

@x
    The helpers always use the first argument in the command to identify the action.
    There are only three possible values for that argument: `store`, `get`, and `erase`.
@y
    The helpers always use the first argument in the command to identify the action.
    There are only three possible values for that argument: `store`, `get`, and `erase`.
@z

@x
    The `store` command takes a JSON payload from the standard input. That payload carries
    the server address, to identify the credential, the username, and either a password
    or an identity token.
@y
    The `store` command takes a JSON payload from the standard input. That payload carries
    the server address, to identify the credential, the username, and either a password
    or an identity token.
@z

% snip code...

@x
    If the secret being stored is an identity token, the Username should be set to
    `<token>`.
@y
    If the secret being stored is an identity token, the Username should be set to
    `<token>`.
@z

@x
    The `store` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@y
    The `store` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@z

@x
    The `get` command takes a string payload from the standard input. That payload carries
    the server address that the Docker Engine needs credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@y
    The `get` command takes a string payload from the standard input. That payload carries
    the server address that the Docker Engine needs credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@z

@x
    The `get` command writes a JSON payload to `STDOUT`. Docker reads the user name
    and password from this payload:
@y
    The `get` command writes a JSON payload to `STDOUT`. Docker reads the user name
    and password from this payload:
@z

% snip code...

@x
    The `erase` command takes a string payload from `STDIN`. That payload carries
    the server address that the Docker Engine wants to remove credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@y
    The `erase` command takes a string payload from `STDIN`. That payload carries
    the server address that the Docker Engine wants to remove credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@z

@x
    The `erase` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@y
    The `erase` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@z

@x
    ### Credential helpers
@y
    ### Credential helpers
@z

@x
    Credential helpers are similar to [credential stores](#credential-stores), but
    act as the designated programs to handle credentials for specific registries.
    The default credential store will not be used for operations concerning
    credentials of the specified registries.
@y
    Credential helpers are similar to [credential stores](#credential-stores), but
    act as the designated programs to handle credentials for specific registries.
    The default credential store will not be used for operations concerning
    credentials of the specified registries.
@z

@x
    #### Configure credential helpers
@y
    #### Configure credential helpers
@z

@x
    If you are currently logged in, run `docker logout` to remove
    the credentials from the default store.
@y
    If you are currently logged in, run `docker logout` to remove
    the credentials from the default store.
@z

@x
    Credential helpers are specified in a similar way to `credsStore`, but
    allow for multiple helpers to be configured at a time. Keys specify the
    registry domain, and values specify the suffix of the program to use
    (i.e. everything after `docker-credential-`). For example:
@y
    Credential helpers are specified in a similar way to `credsStore`, but
    allow for multiple helpers to be configured at a time. Keys specify the
    registry domain, and values specify the suffix of the program to use
    (i.e. everything after `docker-credential-`). For example:
@z

% snip code...

@x
usage: docker login [OPTIONS] [SERVER]
@y
usage: docker login [OPTIONS] [SERVER]
@z

% options:

@x password
      description: Password
@y
      description: Password
@z

@x password-stdin
      description: Take the password from stdin
@y
      description: Take the password from stdin
@z

@x username
      description: Username
@y
      description: Username
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Authenticate to Docker Hub with web-based login
@y
examples: |-
    ### Authenticate to Docker Hub with web-based login
@z

@x
    By default, the `docker login` command authenticates to Docker Hub, using a
    device code flow. This flow lets you authenticate to Docker Hub without
    entering your password. Instead, you visit a URL in your web browser, enter a
    code, and authenticate.
@y
    By default, the `docker login` command authenticates to Docker Hub, using a
    device code flow. This flow lets you authenticate to Docker Hub without
    entering your password. Instead, you visit a URL in your web browser, enter a
    code, and authenticate.
@z

% snip command...

@x
    After entering the code in your browser, you are authenticated to Docker Hub
    using the account you're currently signed in with on the Docker Hub website or
    in Docker Desktop. If you aren't signed in, you are prompted to sign in after
    entering the device code.
@y
    After entering the code in your browser, you are authenticated to Docker Hub
    using the account you're currently signed in with on the Docker Hub website or
    in Docker Desktop. If you aren't signed in, you are prompted to sign in after
    entering the device code.
@z

@x
    ### Authenticate to a self-hosted registry
@y
    ### Authenticate to a self-hosted registry
@z

@x
    If you want to authenticate to a self-hosted registry you can specify this by
    adding the server name.
@y
    If you want to authenticate to a self-hosted registry you can specify this by
    adding the server name.
@z

% snip command...

@x
    By default, the `docker login` command assumes that the registry listens on
    port 443 or 80. If the registry listens on a different port, you can specify it
    by adding the port number to the server name.
@y
    By default, the `docker login` command assumes that the registry listens on
    port 443 or 80. If the registry listens on a different port, you can specify it
    by adding the port number to the server name.
@z

% snip command...

@x
    > [!NOTE]
    > Registry addresses should not include URL path components, only the hostname
    > and (optionally) the port. Registry addresses with URL path components may
    > result in an error. For example, `docker login registry.example.com/foo/`
    > is incorrect, while `docker login registry.example.com` is correct.
    >
    > The exception to this rule is the Docker Hub registry, which may use the
    > `/v1/` path component in the address for historical reasons.
@y
    > [!NOTE]
    > Registry addresses should not include URL path components, only the hostname
    > and (optionally) the port. Registry addresses with URL path components may
    > result in an error. For example, `docker login registry.example.com/foo/`
    > is incorrect, while `docker login registry.example.com` is correct.
    >
    > The exception to this rule is the Docker Hub registry, which may use the
    > `/v1/` path component in the address for historical reasons.
@z

@x
    ### Authenticate to a registry with a username and password {#username}
@y
    ### Authenticate to a registry with a username and password {#username}
@z

@x
    To authenticate to a registry with a username and password, you can use the
    `--username` or `-u` flag. The following example authenticates to Docker Hub
    with the username `moby`. The password is entered interactively.
@y
    To authenticate to a registry with a username and password, you can use the
    `--username` or `-u` flag. The following example authenticates to Docker Hub
    with the username `moby`. The password is entered interactively.
@z

% snip command...

@x
    ### Provide a password using STDIN (--password-stdin) {#password-stdin}
@y
    ### Provide a password using STDIN (--password-stdin) {#password-stdin}
@z

@x
    To run the `docker login` command non-interactively, you can set the
    `--password-stdin` flag to provide a password through `STDIN`. Using
    `STDIN` prevents the password from ending up in the shell's history,
    or log-files.
@y
    To run the `docker login` command non-interactively, you can set the
    `--password-stdin` flag to provide a password through `STDIN`. Using
    `STDIN` prevents the password from ending up in the shell's history,
    or log-files.
@z

@x
    The following example reads a password from a file, and passes it to the
    `docker login` command using `STDIN`:
@y
    The following example reads a password from a file, and passes it to the
    `docker login` command using `STDIN`:
@z

% snip command...
% snip directives...
