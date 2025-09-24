%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to connect Docker containers together.
keywords: Examples, Usage, user guide, links, linking, docker, documentation, examples,
  names, name, container naming, port, map, network port, network
title: Legacy container links
@y
description: Learn how to connect Docker containers together.
keywords: Examples, Usage, user guide, links, linking, docker, documentation, examples,
  names, name, container naming, port, map, network port, network
title: Legacy container links
@z

@x
> [!WARNING]
>
> The `--link` flag is a legacy feature of Docker. It may eventually
be removed. Unless you absolutely need to continue using it, we recommend that you use
user-defined networks to facilitate communication between two containers instead of using
`--link`. One feature that user-defined networks do not support that you can do
with `--link` is sharing environment variables between containers. However,
you can use other mechanisms such as volumes to share environment variables
between containers in a more controlled way.
>
> See [Differences between user-defined bridges and the default bridge](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for some alternatives to using `--link`.
@y
> [!WARNING]
>
> The `--link` flag is a legacy feature of Docker. It may eventually
be removed. Unless you absolutely need to continue using it, we recommend that you use
user-defined networks to facilitate communication between two containers instead of using
`--link`. One feature that user-defined networks do not support that you can do
with `--link` is sharing environment variables between containers. However,
you can use other mechanisms such as volumes to share environment variables
between containers in a more controlled way.
>
> See [Differences between user-defined bridges and the default bridge](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for some alternatives to using `--link`.
@z

@x
The information in this section explains legacy container links within the
Docker default `bridge` network which is created automatically when you install
Docker.
@y
The information in this section explains legacy container links within the
Docker default `bridge` network which is created automatically when you install
Docker.
@z

@x
Before the [Docker networks feature](index.md), you could use the
Docker link feature to allow containers to discover each other and securely
transfer information about one container to another container. With the
introduction of the Docker networks feature, you can still create links but they
behave differently between default `bridge` network and
[user defined networks](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge).
@y
Before the [Docker networks feature](index.md), you could use the
Docker link feature to allow containers to discover each other and securely
transfer information about one container to another container. With the
introduction of the Docker networks feature, you can still create links but they
behave differently between default `bridge` network and
[user defined networks](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge).
@z

@x
This section briefly discusses connecting via a network port and then goes into
detail on container linking in default `bridge` network.
@y
This section briefly discusses connecting via a network port and then goes into
detail on container linking in default `bridge` network.
@z

@x
## Connect using network port mapping
@y
## Connect using network port mapping
@z

@x
Let's say you used this command to run a simple Python Flask application:
@y
Let's say you used this command to run a simple Python Flask application:
@z

@x
```console
$ docker run -d -P training/webapp python app.py
```
@y
```console
$ docker run -d -P training/webapp python app.py
```
@z

@x
> [!NOTE]
>
> Containers have an internal network and an IP address.
> Docker can have a variety of network configurations. You can see more
> information on Docker networking [here](index.md).
@y
> [!NOTE]
>
> Containers have an internal network and an IP address.
> Docker can have a variety of network configurations. You can see more
> information on Docker networking [here](index.md).
@z

@x
When that container was created, the `-P` flag was used to automatically map
any network port inside it to a random high port within an *ephemeral port
range* on your Docker host. Next, when `docker ps` was run, you saw that port
5000 in the container was bound to port 49155 on the host.
@y
When that container was created, the `-P` flag was used to automatically map
any network port inside it to a random high port within an *ephemeral port
range* on your Docker host. Next, when `docker ps` was run, you saw that port
5000 in the container was bound to port 49155 on the host.
@z

@x
```console
$ docker ps nostalgic_morse
@y
```console
$ docker ps nostalgic_morse
@z

@x
CONTAINER ID  IMAGE                   COMMAND       CREATED        STATUS        PORTS                    NAMES
bc533791f3f5  training/webapp:latest  python app.py 5 seconds ago  Up 2 seconds  0.0.0.0:49155->5000/tcp  nostalgic_morse
```
@y
CONTAINER ID  IMAGE                   COMMAND       CREATED        STATUS        PORTS                    NAMES
bc533791f3f5  training/webapp:latest  python app.py 5 seconds ago  Up 2 seconds  0.0.0.0:49155->5000/tcp  nostalgic_morse
```
@z

@x
You also saw how you can bind a container's ports to a specific port using
the `-p` flag. Here port 80 of the host is mapped to port 5000 of the
container:
@y
You also saw how you can bind a container's ports to a specific port using
the `-p` flag. Here port 80 of the host is mapped to port 5000 of the
container:
@z

@x
```console
$ docker run -d -p 80:5000 training/webapp python app.py
```
@y
```console
$ docker run -d -p 80:5000 training/webapp python app.py
```
@z

@x
And you saw why this isn't such a great idea because it constrains you to
only one container on that specific port.
@y
And you saw why this isn't such a great idea because it constrains you to
only one container on that specific port.
@z

@x
Instead, you may specify a range of host ports to bind a container port to
that is different than the default *ephemeral port range*:
@y
Instead, you may specify a range of host ports to bind a container port to
that is different than the default *ephemeral port range*:
@z

@x
```console
$ docker run -d -p 8000-9000:5000 training/webapp python app.py
```
@y
```console
$ docker run -d -p 8000-9000:5000 training/webapp python app.py
```
@z

@x
This would bind port 5000 in the container to a randomly available port
between 8000 and 9000 on the host.
@y
This would bind port 5000 in the container to a randomly available port
between 8000 and 9000 on the host.
@z

@x
There are also a few other ways you can configure the `-p` flag. By
default the `-p` flag binds the specified port to all interfaces on
the host machine. But you can also specify a binding to a specific
interface, for example only to the `localhost`.
@y
There are also a few other ways you can configure the `-p` flag. By
default the `-p` flag binds the specified port to all interfaces on
the host machine. But you can also specify a binding to a specific
interface, for example only to the `localhost`.
@z

@x
```console
$ docker run -d -p 127.0.0.1:80:5000 training/webapp python app.py
```
@y
```console
$ docker run -d -p 127.0.0.1:80:5000 training/webapp python app.py
```
@z

@x
This would bind port 5000 inside the container to port 80 on the
`localhost` or `127.0.0.1` interface on the host machine.
@y
This would bind port 5000 inside the container to port 80 on the
`localhost` or `127.0.0.1` interface on the host machine.
@z

@x
Or, to bind port 5000 of the container to a dynamic port but only on the
`localhost`, you could use:
@y
Or, to bind port 5000 of the container to a dynamic port but only on the
`localhost`, you could use:
@z

@x
```console
$ docker run -d -p 127.0.0.1::5000 training/webapp python app.py
```
@y
```console
$ docker run -d -p 127.0.0.1::5000 training/webapp python app.py
```
@z

@x
You can also bind UDP and SCTP (typically used by telecom protocols such as SIGTRAN, Diameter, and S1AP/X2AP) ports by adding a trailing `/udp` or `/sctp`. For example:
@y
You can also bind UDP and SCTP (typically used by telecom protocols such as SIGTRAN, Diameter, and S1AP/X2AP) ports by adding a trailing `/udp` or `/sctp`. For example:
@z

@x
```console
$ docker run -d -p 127.0.0.1:80:5000/udp training/webapp python app.py
```
@y
```console
$ docker run -d -p 127.0.0.1:80:5000/udp training/webapp python app.py
```
@z

@x
You also learned about the useful `docker port` shortcut which showed us the
current port bindings. This is also useful for showing you specific port
configurations. For example, if you've bound the container port to the
`localhost` on the host machine, then the `docker port` output reflects that.
@y
You also learned about the useful `docker port` shortcut which showed us the
current port bindings. This is also useful for showing you specific port
configurations. For example, if you've bound the container port to the
`localhost` on the host machine, then the `docker port` output reflects that.
@z

@x
```console
$ docker port nostalgic_morse 5000
@y
```console
$ docker port nostalgic_morse 5000
@z

@x
127.0.0.1:49155
```
@y
127.0.0.1:49155
```
@z

@x
> [!NOTE]
>
> The `-p` flag can be used multiple times to configure multiple ports.
@y
> [!NOTE]
>
> The `-p` flag can be used multiple times to configure multiple ports.
@z

@x
## Connect with the linking system
@y
## Connect with the linking system
@z

@x
> [!NOTE]
>
> This section covers the legacy link feature in the default `bridge` network.
> Refer to [differences between user-defined bridges and the default bridge](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for more information on links in user-defined networks.
@y
> [!NOTE]
>
> This section covers the legacy link feature in the default `bridge` network.
> Refer to [differences between user-defined bridges and the default bridge](drivers/bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for more information on links in user-defined networks.
@z

@x
Network port mappings are not the only way Docker containers can connect to one
another. Docker also has a linking system that allows you to link multiple
containers together and send connection information from one to another. When
containers are linked, information about a source container can be sent to a
recipient container. This allows the recipient to see selected data describing
aspects of the source container.
@y
Network port mappings are not the only way Docker containers can connect to one
another. Docker also has a linking system that allows you to link multiple
containers together and send connection information from one to another. When
containers are linked, information about a source container can be sent to a
recipient container. This allows the recipient to see selected data describing
aspects of the source container.
@z

@x
### The importance of naming
@y
### The importance of naming
@z

@x
To establish links, Docker relies on the names of your containers.
You've already seen that each container you create has an automatically
created name; indeed you've become familiar with our old friend
`nostalgic_morse` during this guide. You can also name containers
yourself. This naming provides two useful functions:
@y
To establish links, Docker relies on the names of your containers.
You've already seen that each container you create has an automatically
created name; indeed you've become familiar with our old friend
`nostalgic_morse` during this guide. You can also name containers
yourself. This naming provides two useful functions:
@z

@x
1. It can be useful to name containers that do specific functions in a way
   that makes it easier for you to remember them, for example naming a
   container containing a web application `web`.
@y
1. It can be useful to name containers that do specific functions in a way
   that makes it easier for you to remember them, for example naming a
   container containing a web application `web`.
@z

@x
2. It provides Docker with a reference point that allows it to refer to other
   containers, for example, you can specify to link the container `web` to container `db`.
@y
2. It provides Docker with a reference point that allows it to refer to other
   containers, for example, you can specify to link the container `web` to container `db`.
@z

@x
You can name your container by using the `--name` flag, for example:
@y
You can name your container by using the `--name` flag, for example:
@z

@x
```console
$ docker run -d -P --name web training/webapp python app.py
```
@y
```console
$ docker run -d -P --name web training/webapp python app.py
```
@z

@x
This launches a new container and uses the `--name` flag to
name the container `web`. You can see the container's name using the
`docker ps` command.
@y
This launches a new container and uses the `--name` flag to
name the container `web`. You can see the container's name using the
`docker ps` command.
@z

@x
```console
$ docker ps -l
@y
```console
$ docker ps -l
@z

@x
CONTAINER ID  IMAGE                  COMMAND        CREATED       STATUS       PORTS                    NAMES
aed84ee21bde  training/webapp:latest python app.py  12 hours ago  Up 2 seconds 0.0.0.0:49154->5000/tcp  web
```
@y
CONTAINER ID  IMAGE                  COMMAND        CREATED       STATUS       PORTS                    NAMES
aed84ee21bde  training/webapp:latest python app.py  12 hours ago  Up 2 seconds 0.0.0.0:49154->5000/tcp  web
```
@z

@x
You can also use `docker inspect` to return the container's name.
@y
You can also use `docker inspect` to return the container's name.
@z

@x
> [!NOTE]
>
> Container names must be unique. That means you can only call
> one container `web`. If you want to re-use a container name you must delete
> the old container (with `docker container rm`) before you can create a new
> container with the same name. As an alternative you can use the `--rm`
> flag with the `docker run` command. This deletes the container
> immediately after it is stopped.
@y
> [!NOTE]
>
> Container names must be unique. That means you can only call
> one container `web`. If you want to re-use a container name you must delete
> the old container (with `docker container rm`) before you can create a new
> container with the same name. As an alternative you can use the `--rm`
> flag with the `docker run` command. This deletes the container
> immediately after it is stopped.
@z

@x
## Communication across links
@y
## Communication across links
@z

@x
Links allow containers to discover each other and securely transfer information
about one container to another container. When you set up a link, you create a
conduit between a source container and a recipient container. The recipient can
then access select data about the source. To create a link, you use the `--link`
flag. First, create a new container, this time one containing a database.
@y
Links allow containers to discover each other and securely transfer information
about one container to another container. When you set up a link, you create a
conduit between a source container and a recipient container. The recipient can
then access select data about the source. To create a link, you use the `--link`
flag. First, create a new container, this time one containing a database.
@z

@x
```console
$ docker run -d --name db training/postgres
```
@y
```console
$ docker run -d --name db training/postgres
```
@z

@x
This creates a new container called `db` from the `training/postgres`
image, which contains a PostgreSQL database.
@y
This creates a new container called `db` from the `training/postgres`
image, which contains a PostgreSQL database.
@z

@x
Now, you need to delete the `web` container you created previously so you can replace it
with a linked one:
@y
Now, you need to delete the `web` container you created previously so you can replace it
with a linked one:
@z

@x
```console
$ docker container rm -f web
```
@y
```console
$ docker container rm -f web
```
@z

@x
Now, create a new `web` container and link it with your `db` container.
@y
Now, create a new `web` container and link it with your `db` container.
@z

@x
```console
$ docker run -d -P --name web --link db:db training/webapp python app.py
```
@y
```console
$ docker run -d -P --name web --link db:db training/webapp python app.py
```
@z

@x
This links the new `web` container with the `db` container you created
earlier. The `--link` flag takes the form:
@y
This links the new `web` container with the `db` container you created
earlier. The `--link` flag takes the form:
@z

@x
    --link <name or id>:alias
@y
    --link <name or id>:alias
@z

@x
Where `name` is the name of the container we're linking to and `alias` is an
alias for the link name. That alias is used shortly.
The `--link` flag also takes the form:
@y
Where `name` is the name of the container we're linking to and `alias` is an
alias for the link name. That alias is used shortly.
The `--link` flag also takes the form:
@z

@x
    --link <name or id>
@y
    --link <name or id>
@z

@x
In this case the alias matches the name. You could write the previous
example as:
@y
In this case the alias matches the name. You could write the previous
example as:
@z

@x
```console
$ docker run -d -P --name web --link db training/webapp python app.py
```
@y
```console
$ docker run -d -P --name web --link db training/webapp python app.py
```
@z

@x
Next, inspect your linked containers with `docker inspect`:
@y
Next, inspect your linked containers with `docker inspect`:
@z

@x
```console
$ docker inspect -f "{{ .HostConfig.Links }}" web
@y
```console
$ docker inspect -f "{{ .HostConfig.Links }}" web
@z

@x
[/db:/web/db]
```
@y
[/db:/web/db]
```
@z

@x
You can see that the `web` container is now linked to the `db` container
`web/db`. Which allows it to access information about the `db` container.
@y
You can see that the `web` container is now linked to the `db` container
`web/db`. Which allows it to access information about the `db` container.
@z

@x
So what does linking the containers actually do? You've learned that a link allows a
source container to provide information about itself to a recipient container. In
our example, the recipient, `web`, can access information about the source `db`. To do
this, Docker creates a secure tunnel between the containers that doesn't need to
expose any ports externally on the container; when we started the
`db` container we did not use either the `-P` or `-p` flags. That's a big benefit of
linking: we don't need to expose the source container, here the PostgreSQL database, to
the network.
@y
So what does linking the containers actually do? You've learned that a link allows a
source container to provide information about itself to a recipient container. In
our example, the recipient, `web`, can access information about the source `db`. To do
this, Docker creates a secure tunnel between the containers that doesn't need to
expose any ports externally on the container; when we started the
`db` container we did not use either the `-P` or `-p` flags. That's a big benefit of
linking: we don't need to expose the source container, here the PostgreSQL database, to
the network.
@z

@x
Docker exposes connectivity information for the source container to the
recipient container in two ways:
@y
Docker exposes connectivity information for the source container to the
recipient container in two ways:
@z

@x
* Environment variables,
* Updating the `/etc/hosts` file.
@y
* Environment variables,
* Updating the `/etc/hosts` file.
@z

@x
### Environment variables
@y
### Environment variables
@z

@x
Docker creates several environment variables when you link containers. Docker
automatically creates environment variables in the target container based on
the `--link` parameters. It also exposes all environment variables
originating from Docker from the source container. These include variables from:
@y
Docker creates several environment variables when you link containers. Docker
automatically creates environment variables in the target container based on
the `--link` parameters. It also exposes all environment variables
originating from Docker from the source container. These include variables from:
@z

@x
* the `ENV` commands in the source container's Dockerfile
* the `-e`, `--env`, and `--env-file` options on the `docker run`
command when the source container is started
@y
* the `ENV` commands in the source container's Dockerfile
* the `-e`, `--env`, and `--env-file` options on the `docker run`
command when the source container is started
@z

@x
These environment variables enable programmatic discovery from within the
target container of information related to the source container.
@y
These environment variables enable programmatic discovery from within the
target container of information related to the source container.
@z

@x
> [!WARNING]
>
> It is important to understand that all environment variables originating
> from Docker within a container are made available to any container
> that links to it. This could have serious security implications if sensitive
> data is stored in them.
@y
> [!WARNING]
>
> It is important to understand that all environment variables originating
> from Docker within a container are made available to any container
> that links to it. This could have serious security implications if sensitive
> data is stored in them.
@z

@x
Docker sets an `<alias>_NAME` environment variable for each target container
listed in the `--link` parameter. For example, if a new container called
`web` is linked to a database container called `db` via `--link db:webdb`,
then Docker creates a `WEBDB_NAME=/web/webdb` variable in the `web` container.
@y
Docker sets an `<alias>_NAME` environment variable for each target container
listed in the `--link` parameter. For example, if a new container called
`web` is linked to a database container called `db` via `--link db:webdb`,
then Docker creates a `WEBDB_NAME=/web/webdb` variable in the `web` container.
@z

@x
Docker also defines a set of environment variables for each port exposed by the
source container. Each variable has a unique prefix in the form `<name>_PORT_<port>_<protocol>`
@y
Docker also defines a set of environment variables for each port exposed by the
source container. Each variable has a unique prefix in the form `<name>_PORT_<port>_<protocol>`
@z

@x
The components in this prefix are:
@y
The components in this prefix are:
@z

@x
* the alias `<name>` specified in the `--link` parameter (for example, `webdb`)
* the `<port>` number exposed
* a `<protocol>` which is either TCP or UDP
@y
* the alias `<name>` specified in the `--link` parameter (for example, `webdb`)
* the `<port>` number exposed
* a `<protocol>` which is either TCP or UDP
@z

@x
Docker uses this prefix format to define three distinct environment variables:
@y
Docker uses this prefix format to define three distinct environment variables:
@z

@x
* The `prefix_ADDR` variable contains the IP Address from the URL, for
example `WEBDB_PORT_5432_TCP_ADDR=172.17.0.82`.
* The `prefix_PORT` variable contains just the port number from the URL of
example `WEBDB_PORT_5432_TCP_PORT=5432`.
* The `prefix_PROTO` variable contains just the protocol from the URL of
example `WEBDB_PORT_5432_TCP_PROTO=tcp`.
@y
* The `prefix_ADDR` variable contains the IP Address from the URL, for
example `WEBDB_PORT_5432_TCP_ADDR=172.17.0.82`.
* The `prefix_PORT` variable contains just the port number from the URL of
example `WEBDB_PORT_5432_TCP_PORT=5432`.
* The `prefix_PROTO` variable contains just the protocol from the URL of
example `WEBDB_PORT_5432_TCP_PROTO=tcp`.
@z

@x
If the container exposes multiple ports, an environment variable set is
defined for each one. This means, for example, if a container exposes 4 ports
that Docker creates 12 environment variables, 3 for each port.
@y
If the container exposes multiple ports, an environment variable set is
defined for each one. This means, for example, if a container exposes 4 ports
that Docker creates 12 environment variables, 3 for each port.
@z

@x
Additionally, Docker creates an environment variable called `<alias>_PORT`.
This variable contains the URL of the source container's first exposed port.
The 'first' port is defined as the exposed port with the lowest number.
For example, consider the `WEBDB_PORT=tcp://172.17.0.82:5432` variable. If
that port is used for both tcp and udp, then the tcp one is specified.
@y
Additionally, Docker creates an environment variable called `<alias>_PORT`.
This variable contains the URL of the source container's first exposed port.
The 'first' port is defined as the exposed port with the lowest number.
For example, consider the `WEBDB_PORT=tcp://172.17.0.82:5432` variable. If
that port is used for both tcp and udp, then the tcp one is specified.
@z

@x
Finally, Docker also exposes each Docker originated environment variable
from the source container as an environment variable in the target. For each
variable Docker creates an `<alias>_ENV_<name>` variable in the target
container. The variable's value is set to the value Docker used when it
started the source container.
@y
Finally, Docker also exposes each Docker originated environment variable
from the source container as an environment variable in the target. For each
variable Docker creates an `<alias>_ENV_<name>` variable in the target
container. The variable's value is set to the value Docker used when it
started the source container.
@z

@x
Returning back to our database example, you can run the `env`
command to list the specified container's environment variables.
@y
Returning back to our database example, you can run the `env`
command to list the specified container's environment variables.
@z

@x
```console
$ docker run --rm --name web2 --link db:db training/webapp env
@y
```console
$ docker run --rm --name web2 --link db:db training/webapp env
@z

@x
<...>
DB_NAME=/web2/db
DB_PORT=tcp://172.17.0.5:5432
DB_PORT_5432_TCP=tcp://172.17.0.5:5432
DB_PORT_5432_TCP_PROTO=tcp
DB_PORT_5432_TCP_PORT=5432
DB_PORT_5432_TCP_ADDR=172.17.0.5
<...>
```
@y
<...>
DB_NAME=/web2/db
DB_PORT=tcp://172.17.0.5:5432
DB_PORT_5432_TCP=tcp://172.17.0.5:5432
DB_PORT_5432_TCP_PROTO=tcp
DB_PORT_5432_TCP_PORT=5432
DB_PORT_5432_TCP_ADDR=172.17.0.5
<...>
```
@z

@x
You can see that Docker has created a series of environment variables with
useful information about the source `db` container. Each variable is prefixed
with
`DB_`, which is populated from the `alias` you specified above. If the `alias`
were `db1`, the variables would be prefixed with `DB1_`. You can use these
environment variables to configure your applications to connect to the database
on the `db` container. The connection is secure and private; only the
linked `web` container can communicate with the `db` container.
@y
You can see that Docker has created a series of environment variables with
useful information about the source `db` container. Each variable is prefixed
with
`DB_`, which is populated from the `alias` you specified above. If the `alias`
were `db1`, the variables would be prefixed with `DB1_`. You can use these
environment variables to configure your applications to connect to the database
on the `db` container. The connection is secure and private; only the
linked `web` container can communicate with the `db` container.
@z

@x
### Important notes on Docker environment variables
@y
### Important notes on Docker environment variables
@z

@x
Unlike host entries in the [`/etc/hosts` file](#updating-the-etchosts-file),
IP addresses stored in the environment variables are not automatically updated
if the source container is restarted. We recommend using the host entries in
`/etc/hosts` to resolve the IP address of linked containers.
@y
Unlike host entries in the [`/etc/hosts` file](#updating-the-etchosts-file),
IP addresses stored in the environment variables are not automatically updated
if the source container is restarted. We recommend using the host entries in
`/etc/hosts` to resolve the IP address of linked containers.
@z

@x
These environment variables are only set for the first process in the
container. Some daemons, such as `sshd`, scrub them when spawning shells
for connection.
@y
These environment variables are only set for the first process in the
container. Some daemons, such as `sshd`, scrub them when spawning shells
for connection.
@z

@x
### Updating the `/etc/hosts` file
@y
### Updating the `/etc/hosts` file
@z

@x
In addition to the environment variables, Docker adds a host entry for the
source container to the `/etc/hosts` file. Here's an entry for the `web`
container:
@y
In addition to the environment variables, Docker adds a host entry for the
source container to the `/etc/hosts` file. Here's an entry for the `web`
container:
@z

@x
```console
$ docker run -t -i --rm --link db:webdb training/webapp /bin/bash
@y
```console
$ docker run -t -i --rm --link db:webdb training/webapp /bin/bash
@z

@x
root@aed84ee21bde:/opt/webapp# cat /etc/hosts
172.17.0.7  aed84ee21bde
<...>
172.17.0.5  webdb 6e5cdeb2d300 db
```
@y
root@aed84ee21bde:/opt/webapp# cat /etc/hosts
172.17.0.7  aed84ee21bde
<...>
172.17.0.5  webdb 6e5cdeb2d300 db
```
@z

@x
You can see two relevant host entries. The first is an entry for the `web`
container that uses the Container ID as a host name. The second entry uses the
link alias to reference the IP address of the `db` container. In addition to
the alias you provide, the linked container's name, if unique from the alias
provided to the `--link` parameter, and the linked container's hostname are
also added to `/etc/hosts` for the linked container's IP address. You can ping
that host via any of these entries:
@y
You can see two relevant host entries. The first is an entry for the `web`
container that uses the Container ID as a host name. The second entry uses the
link alias to reference the IP address of the `db` container. In addition to
the alias you provide, the linked container's name, if unique from the alias
provided to the `--link` parameter, and the linked container's hostname are
also added to `/etc/hosts` for the linked container's IP address. You can ping
that host via any of these entries:
@z

@x
```console
root@aed84ee21bde:/opt/webapp# apt-get install -yqq inetutils-ping
root@aed84ee21bde:/opt/webapp# ping webdb
@y
```console
root@aed84ee21bde:/opt/webapp# apt-get install -yqq inetutils-ping
root@aed84ee21bde:/opt/webapp# ping webdb
@z

@x
PING webdb (172.17.0.5): 48 data bytes
56 bytes from 172.17.0.5: icmp_seq=0 ttl=64 time=0.267 ms
56 bytes from 172.17.0.5: icmp_seq=1 ttl=64 time=0.250 ms
56 bytes from 172.17.0.5: icmp_seq=2 ttl=64 time=0.256 ms
```
@y
PING webdb (172.17.0.5): 48 data bytes
56 bytes from 172.17.0.5: icmp_seq=0 ttl=64 time=0.267 ms
56 bytes from 172.17.0.5: icmp_seq=1 ttl=64 time=0.250 ms
56 bytes from 172.17.0.5: icmp_seq=2 ttl=64 time=0.256 ms
```
@z

@x
> [!NOTE]
>
> In the example, you had to install `ping` because it was not included
> in the container initially.
@y
> [!NOTE]
>
> In the example, you had to install `ping` because it was not included
> in the container initially.
@z

@x
Here, you used the `ping` command to ping the `db` container using its host entry,
which resolves to `172.17.0.5`. You can use this host entry to configure an application
to make use of your `db` container.
@y
Here, you used the `ping` command to ping the `db` container using its host entry,
which resolves to `172.17.0.5`. You can use this host entry to configure an application
to make use of your `db` container.
@z

@x
> [!NOTE]
>
> You can link multiple recipient containers to a single source. For
> example, you could have multiple (differently named) web containers attached to your
>`db` container.
@y
> [!NOTE]
>
> You can link multiple recipient containers to a single source. For
> example, you could have multiple (differently named) web containers attached to your
>`db` container.
@z

@x
If you restart the source container, the `/etc/hosts` files on the linked containers
are automatically updated with the source container's new IP address,
allowing linked communication to continue.
@y
If you restart the source container, the `/etc/hosts` files on the linked containers
are automatically updated with the source container's new IP address,
allowing linked communication to continue.
@z

@x
```console
$ docker restart db
db
@y
```console
$ docker restart db
db
@z

@x
$ docker run -t -i --rm --link db:db training/webapp /bin/bash
@y
$ docker run -t -i --rm --link db:db training/webapp /bin/bash
@z

@x
root@aed84ee21bde:/opt/webapp# cat /etc/hosts
172.17.0.7  aed84ee21bde
<...>
172.17.0.9  db
```
@y
root@aed84ee21bde:/opt/webapp# cat /etc/hosts
172.17.0.7  aed84ee21bde
<...>
172.17.0.9  db
```
@z
