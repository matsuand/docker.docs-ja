%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!--[metadata]>
+++
title = "Remote API v1.15"
description = "API Documentation for Docker"
keywords = ["API, Docker, rcli, REST,  documentation"]
[menu.main]
parent = "engine_remoteapi"
weight = 6
+++
<![end-metadata]-->
@y
<!--[metadata]>
+++
title = "Remote API v1.15"
description = "API Documentation for Docker"
keywords = ["API, Docker, rcli, REST,  documentation"]
[menu.main]
parent = "engine_remoteapi"
weight = 6
+++
<![end-metadata]-->
@z

@x
# Docker Remote API v1.15
@y
# Docker Remote API v1.15
@z

@x
## 1. Brief introduction
@y
## 1. Brief introduction
@z

@x
 - The Remote API has replaced `rcli`.
 - The daemon listens on `unix:///var/run/docker.sock` but you can
   [Bind Docker to another host/port or a Unix socket](../../quickstart.md#bind-docker-to-another-host-port-or-a-unix-socket).
 - The API tends to be REST, but for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `STDOUT`,
   `STDIN` and `STDERR`.
@y
 - The Remote API has replaced `rcli`.
 - The daemon listens on `unix:///var/run/docker.sock` but you can
   [Bind Docker to another host/port or a Unix socket](../../quickstart.md#bind-docker-to-another-host-port-or-a-unix-socket).
 - The API tends to be REST, but for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `STDOUT`,
   `STDIN` and `STDERR`.
@z

@x
# 2. Endpoints
@y
# 2. Endpoints
@z

@x
## 2.1 Containers
@y
## 2.1 Containers
@z

@x
### List containers
@y
### List containers
@z

@x
`GET /containers/json`
@y
`GET /containers/json`
@z

@x
List containers
@y
List containers
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
@y
        GET /containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        [
             {
                     "Id": "8dfafdbc3a40",
                     "Names":["/boring_feynman"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 1",
                     "Created": 1367854155,
                     "Status": "Exit 0",
                     "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             },
             {
                     "Id": "9cd87474be90",
                     "Names":["/coolName"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 222222",
                     "Created": 1367854155,
                     "Status": "Exit 0",
                     "Ports": [],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             },
             {
                     "Id": "3176a2479c92",
                     "Names":["/sleepy_dog"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 3333333333333333",
                     "Created": 1367854154,
                     "Status": "Exit 0",
                     "Ports":[],
                     "SizeRw":12288,
                     "SizeRootFs":0
             },
             {
                     "Id": "4cb07b47f9fb",
                     "Names":["/running_cat"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 444444444444444444444444444444444",
                     "Created": 1367854152,
                     "Status": "Exit 0",
                     "Ports": [],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             }
        ]
@y
        [
             {
                     "Id": "8dfafdbc3a40",
                     "Names":["/boring_feynman"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 1",
                     "Created": 1367854155,
                     "Status": "Exit 0",
                     "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             },
             {
                     "Id": "9cd87474be90",
                     "Names":["/coolName"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 222222",
                     "Created": 1367854155,
                     "Status": "Exit 0",
                     "Ports": [],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             },
             {
                     "Id": "3176a2479c92",
                     "Names":["/sleepy_dog"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 3333333333333333",
                     "Created": 1367854154,
                     "Status": "Exit 0",
                     "Ports":[],
                     "SizeRw":12288,
                     "SizeRootFs":0
             },
             {
                     "Id": "4cb07b47f9fb",
                     "Names":["/running_cat"],
                     "Image": "ubuntu:latest",
                     "Command": "echo 444444444444444444444444444444444",
                     "Created": 1367854152,
                     "Status": "Exit 0",
                     "Ports": [],
                     "SizeRw": 12288,
                     "SizeRootFs": 0
             }
        ]
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created
        containers, include non-running ones.
-   **since** – Show only containers created since Id, include
        non-running ones.
-   **before** – Show only containers created before Id, include
        non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers
        sizes
-   **filters** - a json encoded value of the filters (a map[string][]string) to process on the containers list. Available filters:
  -   exited=&lt;int&gt; -- containers with exit code of &lt;int&gt;
  -   status=(restarting|running|paused|exited)
@y
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created
        containers, include non-running ones.
-   **since** – Show only containers created since Id, include
        non-running ones.
-   **before** – Show only containers created before Id, include
        non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers
        sizes
-   **filters** - a json encoded value of the filters (a map[string][]string) to process on the containers list. Available filters:
  -   exited=&lt;int&gt; -- containers with exit code of &lt;int&gt;
  -   status=(restarting|running|paused|exited)
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **500** – server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **500** – server error
@z

@x
### Create a container
@y
### Create a container
@z

@x
`POST /containers/create`
@y
`POST /containers/create`
@z

@x
Create a container
@y
Create a container
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/create HTTP/1.1
        Content-Type: application/json
@y
        POST /containers/create HTTP/1.1
        Content-Type: application/json
@z

@x
        {
             "Hostname": "",
             "Domainname": "",
             "User": "",
             "Memory": 0,
             "MemorySwap": 0,
             "CpuShares": 512,
             "Cpuset": "0,1",
             "AttachStdin": false,
             "AttachStdout": true,
             "AttachStderr": true,
             "Tty": false,
             "OpenStdin": false,
             "StdinOnce": false,
             "Env": [
                     "FOO=bar",
                     "BAZ=quux"
             ],
             "Cmd": [
                     "date"
             ],
             "Entrypoint": "",
             "Image": "ubuntu",
             "Volumes": {
                     "/tmp": {}
             },
             "WorkingDir": "",
             "NetworkDisabled": false,
             "MacAddress": "12:34:56:78:9a:bc",
             "ExposedPorts": {
                     "22/tcp": {}
             },
             "SecurityOpt": [],
             "HostConfig": {
               "Binds": ["/tmp:/tmp"],
               "Links": ["redis3:redis"],
               "LxcConf": {"lxc.utsname":"docker"},
               "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
               "PublishAllPorts": false,
               "Privileged": false,
               "Dns": ["8.8.8.8"],
               "DnsSearch": [""],
               "ExtraHosts": null,
               "VolumesFrom": ["parent", "other:ro"],
               "CapAdd": ["NET_ADMIN"],
               "CapDrop": ["MKNOD"],
               "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
               "NetworkMode": "bridge",
               "Devices": []
            }
        }
@y
        {
             "Hostname": "",
             "Domainname": "",
             "User": "",
             "Memory": 0,
             "MemorySwap": 0,
             "CpuShares": 512,
             "Cpuset": "0,1",
             "AttachStdin": false,
             "AttachStdout": true,
             "AttachStderr": true,
             "Tty": false,
             "OpenStdin": false,
             "StdinOnce": false,
             "Env": [
                     "FOO=bar",
                     "BAZ=quux"
             ],
             "Cmd": [
                     "date"
             ],
             "Entrypoint": "",
             "Image": "ubuntu",
             "Volumes": {
                     "/tmp": {}
             },
             "WorkingDir": "",
             "NetworkDisabled": false,
             "MacAddress": "12:34:56:78:9a:bc",
             "ExposedPorts": {
                     "22/tcp": {}
             },
             "SecurityOpt": [],
             "HostConfig": {
               "Binds": ["/tmp:/tmp"],
               "Links": ["redis3:redis"],
               "LxcConf": {"lxc.utsname":"docker"},
               "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
               "PublishAllPorts": false,
               "Privileged": false,
               "Dns": ["8.8.8.8"],
               "DnsSearch": [""],
               "ExtraHosts": null,
               "VolumesFrom": ["parent", "other:ro"],
               "CapAdd": ["NET_ADMIN"],
               "CapDrop": ["MKNOD"],
               "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
               "NetworkMode": "bridge",
               "Devices": []
            }
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 Created
        Content-Type: application/json
@y
        HTTP/1.1 201 Created
        Content-Type: application/json
@z

@x
        {
             "Id": "f91ddc4b01e079c4481a8340bbbeca4dbd33d6e4a10662e499f8eacbb5bf252b"
             "Warnings": []
        }
@y
        {
             "Id": "f91ddc4b01e079c4481a8340bbbeca4dbd33d6e4a10662e499f8eacbb5bf252b"
             "Warnings": []
        }
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-   **Hostname** - A string value containing the desired hostname to use for the
      container.
-   **Domainname** - A string value containing the desired domain name to use
      for the container.
-   **User** - A string value containing the user to use inside the container.
-   **Memory** - Memory limit in bytes.
-   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
-   **CpuShares** - An integer value containing the CPU Shares for container
      (ie. the relative weight vs other containers).
    **CpuSet** - String value containing the cgroups Cpuset to use.
-   **AttachStdin** - Boolean value, attaches to stdin.
-   **AttachStdout** - Boolean value, attaches to stdout.
-   **AttachStderr** - Boolean value, attaches to stderr.
-   **Tty** - Boolean value, Attach standard streams to a tty, including stdin if it is not closed.
-   **OpenStdin** - Boolean value, opens stdin,
-   **StdinOnce** - Boolean value, close stdin after the 1 attached client disconnects.
-   **Env** - A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Entrypoint** - Set the entrypoint for the container a string or an array
      of strings
-   **Image** - String value containing the image name to use for the container
-   **Volumes** – An object mapping mountpoint paths (strings) inside the
        container to empty objects.
-   **WorkingDir** - A string value containing the working dir for commands to
      run in.
-   **NetworkDisabled** - Boolean value, when true disables networking for the
      container
-   **ExposedPorts** - An object mapping ports to an empty object in the form of:
      `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
-   **SecurityOpt**: A list of string values to customize labels for MLS
      systems, such as SELinux.
-   **HostConfig**
  -   **Binds** – A list of volume bindings for this container.  Each volume
          binding is a string of the form `container_path` (to create a new
          volume for the container), `host_path:container_path` (to bind-mount
          a host path into the container), or `host_path:container_path:ro`
          (to make the bind-mount read-only inside the container).
  -   **Links** - A list of links for the container.  Each link entry should be
        in the form of "container_name:alias".
  -   **LxcConf** - LXC specific configurations.  These configurations will only
        work when using the `lxc` execution driver.
  -   **PortBindings** - A map of exposed container ports and the host port they
        should map to. It should be specified in the form
        `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
        Take note that `port` is specified as a string and not an integer value.
  -   **PublishAllPorts** - Allocates a random host port for all of a container's
        exposed ports. Specified as a boolean value.
  -   **Privileged** - Gives the container full access to the host.  Specified as
        a boolean value.
  -   **Dns** - A list of dns servers for the container to use.
  -   **DnsSearch** - A list of DNS search domains
  -   **ExtraHosts** - A list of hostnames/IP mappings to be added to the
      container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
  -   **VolumesFrom** - A list of volumes to inherit from another container.
        Specified in the form `<container name>[:<ro|rw>]`
  -   **CapAdd** - A list of kernel capabilities to add to the container.
  -   **Capdrop** - A list of kernel capabilities to drop from the container.
  -   **RestartPolicy** – The behavior to apply when the container exits.  The
          value is an object with a `Name` property of either `"always"` to
          always restart or `"on-failure"` to restart only when the container
          exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
          controls the number of times to retry before giving up.
          The default is not to restart. (optional)
          An ever increasing delay (double the previous delay, starting at 100mS)
          is added before each restart to prevent flooding the server.
  -   **NetworkMode** - Sets the networking mode for the container. Supported
        values are: `bridge`, `host`, `none`, and `container:<name|id>`
  -   **Devices** - A list of devices to add to the container specified in the
        form
        `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
@y
-   **Hostname** - A string value containing the desired hostname to use for the
      container.
-   **Domainname** - A string value containing the desired domain name to use
      for the container.
-   **User** - A string value containing the user to use inside the container.
-   **Memory** - Memory limit in bytes.
-   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
-   **CpuShares** - An integer value containing the CPU Shares for container
      (ie. the relative weight vs other containers).
    **CpuSet** - String value containing the cgroups Cpuset to use.
-   **AttachStdin** - Boolean value, attaches to stdin.
-   **AttachStdout** - Boolean value, attaches to stdout.
-   **AttachStderr** - Boolean value, attaches to stderr.
-   **Tty** - Boolean value, Attach standard streams to a tty, including stdin if it is not closed.
-   **OpenStdin** - Boolean value, opens stdin,
-   **StdinOnce** - Boolean value, close stdin after the 1 attached client disconnects.
-   **Env** - A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Entrypoint** - Set the entrypoint for the container a string or an array
      of strings
-   **Image** - String value containing the image name to use for the container
-   **Volumes** – An object mapping mountpoint paths (strings) inside the
        container to empty objects.
-   **WorkingDir** - A string value containing the working dir for commands to
      run in.
-   **NetworkDisabled** - Boolean value, when true disables networking for the
      container
-   **ExposedPorts** - An object mapping ports to an empty object in the form of:
      `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
-   **SecurityOpt**: A list of string values to customize labels for MLS
      systems, such as SELinux.
-   **HostConfig**
  -   **Binds** – A list of volume bindings for this container.  Each volume
          binding is a string of the form `container_path` (to create a new
          volume for the container), `host_path:container_path` (to bind-mount
          a host path into the container), or `host_path:container_path:ro`
          (to make the bind-mount read-only inside the container).
  -   **Links** - A list of links for the container.  Each link entry should be
        in the form of "container_name:alias".
  -   **LxcConf** - LXC specific configurations.  These configurations will only
        work when using the `lxc` execution driver.
  -   **PortBindings** - A map of exposed container ports and the host port they
        should map to. It should be specified in the form
        `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
        Take note that `port` is specified as a string and not an integer value.
  -   **PublishAllPorts** - Allocates a random host port for all of a container's
        exposed ports. Specified as a boolean value.
  -   **Privileged** - Gives the container full access to the host.  Specified as
        a boolean value.
  -   **Dns** - A list of dns servers for the container to use.
  -   **DnsSearch** - A list of DNS search domains
  -   **ExtraHosts** - A list of hostnames/IP mappings to be added to the
      container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
  -   **VolumesFrom** - A list of volumes to inherit from another container.
        Specified in the form `<container name>[:<ro|rw>]`
  -   **CapAdd** - A list of kernel capabilities to add to the container.
  -   **Capdrop** - A list of kernel capabilities to drop from the container.
  -   **RestartPolicy** – The behavior to apply when the container exits.  The
          value is an object with a `Name` property of either `"always"` to
          always restart or `"on-failure"` to restart only when the container
          exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
          controls the number of times to retry before giving up.
          The default is not to restart. (optional)
          An ever increasing delay (double the previous delay, starting at 100mS)
          is added before each restart to prevent flooding the server.
  -   **NetworkMode** - Sets the networking mode for the container. Supported
        values are: `bridge`, `host`, `none`, and `container:<name|id>`
  -   **Devices** - A list of devices to add to the container specified in the
        form
        `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **name** – Assign the specified name to the container. Must
    match `/?[a-zA-Z0-9_-]+`.
@y
-   **name** – Assign the specified name to the container. Must
    match `/?[a-zA-Z0-9_-]+`.
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **201** – no error
-   **404** – no such container
-   **406** – impossible to attach (container not running)
-   **500** – server error
@y
-   **201** – no error
-   **404** – no such container
-   **406** – impossible to attach (container not running)
-   **500** – server error
@z

@x
### Inspect a container
@y
### Inspect a container
@z

@x
`GET /containers/(id or name)/json`
@y
`GET /containers/(id or name)/json`
@z

@x
Return low-level information on the container `id`
@y
Return low-level information on the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /containers/4fa6e0f0c678/json HTTP/1.1
@y
        GET /containers/4fa6e0f0c678/json HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {
                     "Id": "4fa6e0f0c6786287e131c3852c58a2e01cc697a68231826813597e4994f1d6e2",
                     "Created": "2013-05-07T14:51:42.041847+02:00",
                     "Path": "date",
                     "Args": [],
                     "Config": {
                             "Hostname": "4fa6e0f0c678",
                             "User": "",
                             "Memory": 0,
                             "MemorySwap": 0,
                             "AttachStdin": false,
                             "AttachStdout": true,
                             "AttachStderr": true,
                             "PortSpecs": null,
                             "Tty": false,
                             "OpenStdin": false,
                             "StdinOnce": false,
                             "Env": null,
                             "Cmd": [
                                     "date"
                             ],
                             "Dns": null,
                             "Image": "ubuntu",
                             "Volumes": {},
                             "VolumesFrom": "",
                             "WorkingDir": ""
                     },
                     "State": {
                             "Running": false,
                             "Pid": 0,
                             "ExitCode": 0,
                             "StartedAt": "2013-05-07T14:51:42.087658+02:01360",
                             "Ghost": false
                     },
                     "Image": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
                     "NetworkSettings": {
                             "IpAddress": "",
                             "IpPrefixLen": 0,
                             "Gateway": "",
                             "Bridge": "",
                             "PortMapping": null
                     },
                     "SysInitPath": "/home/kitty/go/src/github.com/docker/docker/bin/docker",
                     "ResolvConfPath": "/etc/resolv.conf",
                     "Volumes": {},
                     "HostConfig": {
                         "Binds": null,
                         "ContainerIDFile": "",
                         "LxcConf": [],
                         "Privileged": false,
                         "PortBindings": {
                            "80/tcp": [
                                {
                                    "HostIp": "0.0.0.0",
                                    "HostPort": "49153"
                                }
                            ]
                         },
                         "Links": ["/name:alias"],
                         "PublishAllPorts": false,
                         "CapAdd": ["NET_ADMIN"],
                         "CapDrop": ["MKNOD"]
                     }
        }
@y
        {
                     "Id": "4fa6e0f0c6786287e131c3852c58a2e01cc697a68231826813597e4994f1d6e2",
                     "Created": "2013-05-07T14:51:42.041847+02:00",
                     "Path": "date",
                     "Args": [],
                     "Config": {
                             "Hostname": "4fa6e0f0c678",
                             "User": "",
                             "Memory": 0,
                             "MemorySwap": 0,
                             "AttachStdin": false,
                             "AttachStdout": true,
                             "AttachStderr": true,
                             "PortSpecs": null,
                             "Tty": false,
                             "OpenStdin": false,
                             "StdinOnce": false,
                             "Env": null,
                             "Cmd": [
                                     "date"
                             ],
                             "Dns": null,
                             "Image": "ubuntu",
                             "Volumes": {},
                             "VolumesFrom": "",
                             "WorkingDir": ""
                     },
                     "State": {
                             "Running": false,
                             "Pid": 0,
                             "ExitCode": 0,
                             "StartedAt": "2013-05-07T14:51:42.087658+02:01360",
                             "Ghost": false
                     },
                     "Image": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
                     "NetworkSettings": {
                             "IpAddress": "",
                             "IpPrefixLen": 0,
                             "Gateway": "",
                             "Bridge": "",
                             "PortMapping": null
                     },
                     "SysInitPath": "/home/kitty/go/src/github.com/docker/docker/bin/docker",
                     "ResolvConfPath": "/etc/resolv.conf",
                     "Volumes": {},
                     "HostConfig": {
                         "Binds": null,
                         "ContainerIDFile": "",
                         "LxcConf": [],
                         "Privileged": false,
                         "PortBindings": {
                            "80/tcp": [
                                {
                                    "HostIp": "0.0.0.0",
                                    "HostPort": "49153"
                                }
                            ]
                         },
                         "Links": ["/name:alias"],
                         "PublishAllPorts": false,
                         "CapAdd": ["NET_ADMIN"],
                         "CapDrop": ["MKNOD"]
                     }
        }
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### List processes running inside a container
@y
### List processes running inside a container
@z

@x
`GET /containers/(id or name)/top`
@y
`GET /containers/(id or name)/top`
@z

@x
List processes running inside the container `id`. On Unix systems this
is done by running the `ps` command. This endpoint is not
supported on Windows.
@y
List processes running inside the container `id`. On Unix systems this
is done by running the `ps` command. This endpoint is not
supported on Windows.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /containers/4fa6e0f0c678/top HTTP/1.1
@y
    GET /containers/4fa6e0f0c678/top HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
       "Titles" : [
         "UID", "PID", "PPID", "C", "STIME", "TTY", "TIME", "CMD"
       ],
       "Processes" : [
         [
           "root", "13642", "882", "0", "17:03", "pts/0", "00:00:00", "/bin/bash"
         ],
         [
           "root", "13735", "13642", "0", "17:06", "pts/0", "00:00:00", "sleep 10"
         ]
       ]
    }
@y
    {
       "Titles" : [
         "UID", "PID", "PPID", "C", "STIME", "TTY", "TIME", "CMD"
       ],
       "Processes" : [
         [
           "root", "13642", "882", "0", "17:03", "pts/0", "00:00:00", "/bin/bash"
         ],
         [
           "root", "13735", "13642", "0", "17:06", "pts/0", "00:00:00", "sleep 10"
         ]
       ]
    }
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
@y
    GET /containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
      "Titles" : [
        "USER","PID","%CPU","%MEM","VSZ","RSS","TTY","STAT","START","TIME","COMMAND"
      ]
      "Processes" : [
        [
          "root","13642","0.0","0.1","18172","3184","pts/0","Ss","17:03","0:00","/bin/bash"
        ],
        [
          "root","13895","0.0","0.0","4348","692","pts/0","S+","17:15","0:00","sleep 10"
        ]
      ],
    }
@y
    {
      "Titles" : [
        "USER","PID","%CPU","%MEM","VSZ","RSS","TTY","STAT","START","TIME","COMMAND"
      ]
      "Processes" : [
        [
          "root","13642","0.0","0.1","18172","3184","pts/0","Ss","17:03","0:00","/bin/bash"
        ],
        [
          "root","13895","0.0","0.0","4348","692","pts/0","S+","17:15","0:00","sleep 10"
        ]
      ],
    }
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **ps_args** – `ps` arguments to use (e.g., `aux`), defaults to `-ef`
@y
-   **ps_args** – `ps` arguments to use (e.g., `aux`), defaults to `-ef`
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Get container logs
@y
### Get container logs
@z

@x
`GET /containers/(id or name)/logs`
@y
`GET /containers/(id or name)/logs`
@z

@x
Get stdout and stderr logs from the container ``id``
@y
Get stdout and stderr logs from the container ``id``
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
       GET /containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10 HTTP/1.1
@y
       GET /containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
       HTTP/1.1 200 OK
       Content-Type: application/vnd.docker.raw-stream
@y
       HTTP/1.1 200 OK
       Content-Type: application/vnd.docker.raw-stream
@z

@x
       {{ STREAM }}
@y
       {{ STREAM }}
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **follow** – 1/True/true or 0/False/false, return stream. Default false
-   **stdout** – 1/True/true or 0/False/false, show stdout log. Default false
-   **stderr** – 1/True/true or 0/False/false, show stderr log. Default false
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default false
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all
@y
-   **follow** – 1/True/true or 0/False/false, return stream. Default false
-   **stdout** – 1/True/true or 0/False/false, show stdout log. Default false
-   **stderr** – 1/True/true or 0/False/false, show stderr log. Default false
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default false
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Inspect changes on a container's filesystem
@y
### Inspect changes on a container's filesystem
@z

@x
`GET /containers/(id or name)/changes`
@y
`GET /containers/(id or name)/changes`
@z

@x
Inspect changes on container `id`'s filesystem
@y
Inspect changes on container `id`'s filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /containers/4fa6e0f0c678/changes HTTP/1.1
@y
        GET /containers/4fa6e0f0c678/changes HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        [
             {
                     "Path": "/dev",
                     "Kind": 0
             },
             {
                     "Path": "/dev/kmsg",
                     "Kind": 1
             },
             {
                     "Path": "/test",
                     "Kind": 1
             }
        ]
@y
        [
             {
                     "Path": "/dev",
                     "Kind": 0
             },
             {
                     "Path": "/dev/kmsg",
                     "Kind": 1
             },
             {
                     "Path": "/test",
                     "Kind": 1
             }
        ]
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Export a container
@y
### Export a container
@z

@x
`GET /containers/(id or name)/export`
@y
`GET /containers/(id or name)/export`
@z

@x
Export the contents of container `id`
@y
Export the contents of container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /containers/4fa6e0f0c678/export HTTP/1.1
@y
        GET /containers/4fa6e0f0c678/export HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/octet-stream
@y
        HTTP/1.1 200 OK
        Content-Type: application/octet-stream
@z

@x
        {{ TAR STREAM }}
@y
        {{ TAR STREAM }}
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Resize a container TTY
@y
### Resize a container TTY
@z

@x
`GET /containers/(id or name)/resize?h=<height>&w=<width>`
@y
`GET /containers/(id or name)/resize?h=<height>&w=<width>`
@z

@x
Resize the TTY of container `id`
@y
Resize the TTY of container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
@y
        GET /containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Length: 0
        Content-Type: text/plain; charset=utf-8
@y
        HTTP/1.1 200 OK
        Content-Length: 0
        Content-Type: text/plain; charset=utf-8
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – No such container
-   **500** – bad file descriptor
@y
-   **200** – no error
-   **404** – No such container
-   **500** – bad file descriptor
@z

@x
### Start a container
@y
### Start a container
@z

@x
`POST /containers/(id or name)/start`
@y
`POST /containers/(id or name)/start`
@z

@x
Start the container `id`
@y
Start the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/start HTTP/1.1
        Content-Type: application/json
@y
        POST /containers/e90e34656806/start HTTP/1.1
        Content-Type: application/json
@z

@x
        {
             "Binds": ["/tmp:/tmp"],
             "Links": ["redis3:redis"],
             "LxcConf": {"lxc.utsname":"docker"},
             "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
             "PublishAllPorts": false,
             "Privileged": false,
             "Dns": ["8.8.8.8"],
             "DnsSearch": [""],
             "VolumesFrom": ["parent", "other:ro"],
             "CapAdd": ["NET_ADMIN"],
             "CapDrop": ["MKNOD"],
             "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
             "NetworkMode": "bridge",
             "Devices": []
        }
@y
        {
             "Binds": ["/tmp:/tmp"],
             "Links": ["redis3:redis"],
             "LxcConf": {"lxc.utsname":"docker"},
             "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
             "PublishAllPorts": false,
             "Privileged": false,
             "Dns": ["8.8.8.8"],
             "DnsSearch": [""],
             "VolumesFrom": ["parent", "other:ro"],
             "CapAdd": ["NET_ADMIN"],
             "CapDrop": ["MKNOD"],
             "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
             "NetworkMode": "bridge",
             "Devices": []
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-   **Binds** – A list of volume bindings for this container.  Each volume
        binding is a string of the form `container_path` (to create a new
        volume for the container), `host_path:container_path` (to bind-mount
        a host path into the container), or `host_path:container_path:ro`
        (to make the bind-mount read-only inside the container).
-   **Links** - A list of links for the container.  Each link entry should be of
      of the form "container_name:alias".
-   **LxcConf** - LXC specific configurations.  These configurations will only
      work when using the `lxc` execution driver.
-   **PortBindings** - A map of exposed container ports and the host port they
      should map to. It should be specified in the form
      `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
      Take note that `port` is specified as a string and not an integer value.
-   **PublishAllPorts** - Allocates a random host port for all of a container's
      exposed ports. Specified as a boolean value.
-   **Privileged** - Gives the container full access to the host.  Specified as
      a boolean value.
-   **Dns** - A list of dns servers for the container to use.
-   **DnsSearch** - A list of DNS search domains
-   **VolumesFrom** - A list of volumes to inherit from another container.
      Specified in the form `<container name>[:<ro|rw>]`
-   **CapAdd** - A list of kernel capabilities to add to the container.
-   **Capdrop** - A list of kernel capabilities to drop from the container.
-   **RestartPolicy** – The behavior to apply when the container exits.  The
        value is an object with a `Name` property of either `"always"` to
        always restart or `"on-failure"` to restart only when the container
        exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
        controls the number of times to retry before giving up.
        The default is not to restart. (optional)
        An ever increasing delay (double the previous delay, starting at 100mS)
        is added before each restart to prevent flooding the server.
-   **NetworkMode** - Sets the networking mode for the container. Supported
      values are: `bridge`, `host`, `none`, and `container:<name|id>`
-   **Devices** - A list of devices to add to the container specified in the
      form
      `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
@y
-   **Binds** – A list of volume bindings for this container.  Each volume
        binding is a string of the form `container_path` (to create a new
        volume for the container), `host_path:container_path` (to bind-mount
        a host path into the container), or `host_path:container_path:ro`
        (to make the bind-mount read-only inside the container).
-   **Links** - A list of links for the container.  Each link entry should be of
      of the form "container_name:alias".
-   **LxcConf** - LXC specific configurations.  These configurations will only
      work when using the `lxc` execution driver.
-   **PortBindings** - A map of exposed container ports and the host port they
      should map to. It should be specified in the form
      `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
      Take note that `port` is specified as a string and not an integer value.
-   **PublishAllPorts** - Allocates a random host port for all of a container's
      exposed ports. Specified as a boolean value.
-   **Privileged** - Gives the container full access to the host.  Specified as
      a boolean value.
-   **Dns** - A list of dns servers for the container to use.
-   **DnsSearch** - A list of DNS search domains
-   **VolumesFrom** - A list of volumes to inherit from another container.
      Specified in the form `<container name>[:<ro|rw>]`
-   **CapAdd** - A list of kernel capabilities to add to the container.
-   **Capdrop** - A list of kernel capabilities to drop from the container.
-   **RestartPolicy** – The behavior to apply when the container exits.  The
        value is an object with a `Name` property of either `"always"` to
        always restart or `"on-failure"` to restart only when the container
        exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
        controls the number of times to retry before giving up.
        The default is not to restart. (optional)
        An ever increasing delay (double the previous delay, starting at 100mS)
        is added before each restart to prevent flooding the server.
-   **NetworkMode** - Sets the networking mode for the container. Supported
      values are: `bridge`, `host`, `none`, and `container:<name|id>`
-   **Devices** - A list of devices to add to the container specified in the
      form
      `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error
@z

@x
### Stop a container
@y
### Stop a container
@z

@x
`POST /containers/(id or name)/stop`
@y
`POST /containers/(id or name)/stop`
@z

@x
Stop the container `id`
@y
Stop the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/stop?t=5 HTTP/1.1
@y
        POST /containers/e90e34656806/stop?t=5 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **t** – number of seconds to wait before killing the container
@y
-   **t** – number of seconds to wait before killing the container
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **304** – container already stopped
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **304** – container already stopped
-   **404** – no such container
-   **500** – server error
@z

@x
### Restart a container
@y
### Restart a container
@z

@x
`POST /containers/(id or name)/restart`
@y
`POST /containers/(id or name)/restart`
@z

@x
Restart the container `id`
@y
Restart the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/restart?t=5 HTTP/1.1
@y
        POST /containers/e90e34656806/restart?t=5 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **t** – number of seconds to wait before killing the container
@y
-   **t** – number of seconds to wait before killing the container
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Kill a container
@y
### Kill a container
@z

@x
`POST /containers/(id or name)/kill`
@y
`POST /containers/(id or name)/kill`
@z

@x
Kill the container `id`
@y
Kill the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/kill HTTP/1.1
@y
        POST /containers/e90e34656806/kill HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Query Parameters
@y
Query Parameters
@z

@x
-   **signal** - Signal to send to the container: integer or string like "SIGINT".
        When not set, SIGKILL is assumed and the call will waits for the container to exit.
@y
-   **signal** - Signal to send to the container: integer or string like "SIGINT".
        When not set, SIGKILL is assumed and the call will waits for the container to exit.
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Pause a container
@y
### Pause a container
@z

@x
`POST /containers/(id or name)/pause`
@y
`POST /containers/(id or name)/pause`
@z

@x
Pause the container `id`
@y
Pause the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/pause HTTP/1.1
@y
        POST /containers/e90e34656806/pause HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Unpause a container
@y
### Unpause a container
@z

@x
`POST /containers/(id or name)/unpause`
@y
`POST /containers/(id or name)/unpause`
@z

@x
Unpause the container `id`
@y
Unpause the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/unpause HTTP/1.1
@y
        POST /containers/e90e34656806/unpause HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Attach to a container
@y
### Attach to a container
@z

@x
`POST /containers/(id or name)/attach`
@y
`POST /containers/(id or name)/attach`
@z

@x
Attach to the container `id`
@y
Attach to the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
@y
        POST /containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@y
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@z

@x
        {{ STREAM }}
@y
        {{ STREAM }}
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **logs** – 1/True/true or 0/False/false, return logs. Default false
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default false
-   **stdin** – 1/True/true or 0/False/false, if stream=true, attach
        to stdin. Default false
-   **stdout** – 1/True/true or 0/False/false, if logs=true, return
        stdout log, if stream=true, attach to stdout. Default false
-   **stderr** – 1/True/true or 0/False/false, if logs=true, return
        stderr log, if stream=true, attach to stderr. Default false
@y
-   **logs** – 1/True/true or 0/False/false, return logs. Default false
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default false
-   **stdin** – 1/True/true or 0/False/false, if stream=true, attach
        to stdin. Default false
-   **stdout** – 1/True/true or 0/False/false, if logs=true, return
        stdout log, if stream=true, attach to stdout. Default false
-   **stderr** – 1/True/true or 0/False/false, if logs=true, return
        stderr log, if stream=true, attach to stderr. Default false
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@z

@x
    **Stream details**:
@y
    **Stream details**:
@z

@x
    When using the TTY setting is enabled in
    [`POST /containers/create`](#create-a-container),
    the stream is the raw data from the process PTY and client's stdin.
    When the TTY is disabled, then the stream is multiplexed to separate
    stdout and stderr.
@y
    When using the TTY setting is enabled in
    [`POST /containers/create`](#create-a-container),
    the stream is the raw data from the process PTY and client's stdin.
    When the TTY is disabled, then the stream is multiplexed to separate
    stdout and stderr.
@z

@x
    The format is a **Header** and a **Payload** (frame).
@y
    The format is a **Header** and a **Payload** (frame).
@z

@x
    **HEADER**
@y
    **HEADER**
@z

@x
    The header will contain the information on which stream write the
    stream (stdout or stderr). It also contain the size of the
    associated frame encoded on the last 4 bytes (uint32).
@y
    The header will contain the information on which stream write the
    stream (stdout or stderr). It also contain the size of the
    associated frame encoded on the last 4 bytes (uint32).
@z

@x
    It is encoded on the first 8 bytes like this:
@y
    It is encoded on the first 8 bytes like this:
@z

@x
        header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
@y
        header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
@z

@x
    `STREAM_TYPE` can be:
@y
    `STREAM_TYPE` can be:
@z

@x
-   0: stdin (will be written on stdout)
-   1: stdout
-   2: stderr
@y
-   0: stdin (will be written on stdout)
-   1: stdout
-   2: stderr
@z

@x
    `SIZE1, SIZE2, SIZE3, SIZE4` are the 4 bytes of
    the uint32 size encoded as big endian.
@y
    `SIZE1, SIZE2, SIZE3, SIZE4` are the 4 bytes of
    the uint32 size encoded as big endian.
@z

@x
    **PAYLOAD**
@y
    **PAYLOAD**
@z

@x
    The payload is the raw stream.
@y
    The payload is the raw stream.
@z

@x
    **IMPLEMENTATION**
@y
    **IMPLEMENTATION**
@z

@x
    The simplest way to implement the Attach protocol is the following:
@y
    The simplest way to implement the Attach protocol is the following:
@z

@x
    1.  Read 8 bytes
    2.  chose stdout or stderr depending on the first byte
    3.  Extract the frame size from the last 4 bytes
    4.  Read the extracted size and output it on the correct output
    5.  Goto 1
@y
    1.  Read 8 bytes
    2.  chose stdout or stderr depending on the first byte
    3.  Extract the frame size from the last 4 bytes
    4.  Read the extracted size and output it on the correct output
    5.  Goto 1
@z

@x
### Attach to a container (websocket)
@y
### Attach to a container (websocket)
@z

@x
`GET /containers/(id or name)/attach/ws`
@y
`GET /containers/(id or name)/attach/ws`
@z

@x
Attach to the container `id` via websocket
@y
Attach to the container `id` via websocket
@z

@x
Implements websocket protocol handshake according to [RFC 6455](http://tools.ietf.org/html/rfc6455)
@y
Implements websocket protocol handshake according to [RFC 6455](http://tools.ietf.org/html/rfc6455)
@z

@x
**Example request**
@y
**Example request**
@z

@x
        GET /containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
@y
        GET /containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
@z

@x
**Example response**
@y
**Example response**
@z

@x
        {{ STREAM }}
@y
        {{ STREAM }}
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **logs** – 1/True/true or 0/False/false, return logs. Default false
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default false
-   **stdin** – 1/True/true or 0/False/false, if stream=true, attach
        to stdin. Default false
-   **stdout** – 1/True/true or 0/False/false, if logs=true, return
        stdout log, if stream=true, attach to stdout. Default false
-   **stderr** – 1/True/true or 0/False/false, if logs=true, return
        stderr log, if stream=true, attach to stderr. Default false
@y
-   **logs** – 1/True/true or 0/False/false, return logs. Default false
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default false
-   **stdin** – 1/True/true or 0/False/false, if stream=true, attach
        to stdin. Default false
-   **stdout** – 1/True/true or 0/False/false, if logs=true, return
        stdout log, if stream=true, attach to stdout. Default false
-   **stderr** – 1/True/true or 0/False/false, if logs=true, return
        stderr log, if stream=true, attach to stderr. Default false
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@z

@x
### Wait a container
@y
### Wait a container
@z

@x
`POST /containers/(id or name)/wait`
@y
`POST /containers/(id or name)/wait`
@z

@x
Block until container `id` stops, then returns the exit code
@y
Block until container `id` stops, then returns the exit code
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/16253994b7c4/wait HTTP/1.1
@y
        POST /containers/16253994b7c4/wait HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {"StatusCode": 0}
@y
        {"StatusCode": 0}
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Remove a container
@y
### Remove a container
@z

@x
`DELETE /containers/(id or name)`
@y
`DELETE /containers/(id or name)`
@z

@x
Remove the container `id` from the filesystem
@y
Remove the container `id` from the filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        DELETE /containers/16253994b7c4?v=1 HTTP/1.1
@y
        DELETE /containers/16253994b7c4?v=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
@y
        HTTP/1.1 204 No Content
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **v** – 1/True/true or 0/False/false, Remove the volumes
        associated to the container. Default false
-   **force** - 1/True/true or 0/False/false, Kill then remove the container.
        Default false
@y
-   **v** – 1/True/true or 0/False/false, Remove the volumes
        associated to the container. Default false
-   **force** - 1/True/true or 0/False/false, Kill then remove the container.
        Default false
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **204** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@z

@x
### Copy files or folders from a container
@y
### Copy files or folders from a container
@z

@x
`POST /containers/(id or name)/copy`
@y
`POST /containers/(id or name)/copy`
@z

@x
Copy files or folders of container `id`
@y
Copy files or folders of container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/4fa6e0f0c678/copy HTTP/1.1
        Content-Type: application/json
@y
        POST /containers/4fa6e0f0c678/copy HTTP/1.1
        Content-Type: application/json
@z

@x
        {
             "Resource": "test.txt"
        }
@y
        {
             "Resource": "test.txt"
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@y
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@z

@x
        {{ TAR STREAM }}
@y
        {{ TAR STREAM }}
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
## 2.2 Images
@y
## 2.2 Images
@z

@x
### List Images
@y
### List Images
@z

@x
`GET /images/json`
@y
`GET /images/json`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /images/json?all=0 HTTP/1.1
@y
        GET /images/json?all=0 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        [
          {
             "RepoTags": [
               "ubuntu:12.04",
               "ubuntu:precise",
               "ubuntu:latest"
             ],
             "Id": "8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c",
             "Created": 1365714795,
             "Size": 131506275,
             "VirtualSize": 131506275
          },
          {
             "RepoTags": [
               "ubuntu:12.10",
               "ubuntu:quantal"
             ],
             "ParentId": "27cf784147099545",
             "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
             "Created": 1364102658,
             "Size": 24653,
             "VirtualSize": 180116135
          }
        ]
@y
        [
          {
             "RepoTags": [
               "ubuntu:12.04",
               "ubuntu:precise",
               "ubuntu:latest"
             ],
             "Id": "8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c",
             "Created": 1365714795,
             "Size": 131506275,
             "VirtualSize": 131506275
          },
          {
             "RepoTags": [
               "ubuntu:12.10",
               "ubuntu:quantal"
             ],
             "ParentId": "27cf784147099545",
             "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
             "Created": 1364102658,
             "Size": 24653,
             "VirtualSize": 180116135
          }
        ]
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a json encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   dangling=true
-   **filter** - only return images with the specified name
@y
-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a json encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   dangling=true
-   **filter** - only return images with the specified name
@z

@x
### Create an image
@y
### Create an image
@z

@x
`POST /images/create`
@y
`POST /images/create`
@z

@x
Create an image, either by pulling it from the registry or by importing it
@y
Create an image, either by pulling it from the registry or by importing it
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /images/create?fromImage=ubuntu HTTP/1.1
@y
        POST /images/create?fromImage=ubuntu HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {"status": "Pulling..."}
        {"status": "Pulling", "progress": "1 B/ 100 B", "progressDetail": {"current": 1, "total": 100}}
        {"error": "Invalid..."}
        ...
@y
        {"status": "Pulling..."}
        {"status": "Pulling", "progress": "1 B/ 100 B", "progressDetail": {"current": 1, "total": 100}}
        {"error": "Invalid..."}
        ...
@z

@x
    When using this endpoint to pull an image from the registry, the
    `X-Registry-Auth` header can be used to include
    a base64-encoded AuthConfig object.
@y
    When using this endpoint to pull an image from the registry, the
    `X-Registry-Auth` header can be used to include
    a base64-encoded AuthConfig object.
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **fromImage** – name of the image to pull
-   **fromSrc** – source to import.  The value may be a URL from which the image
        can be retrieved or `-` to read the image from the request body.
-   **repo** – repository
-   **tag** – tag
@y
-   **fromImage** – name of the image to pull
-   **fromSrc** – source to import.  The value may be a URL from which the image
        can be retrieved or `-` to read the image from the request body.
-   **repo** – repository
-   **tag** – tag
@z

@x
    Request Headers:
@y
    Request Headers:
@z

@x
-   **X-Registry-Auth** – base64-encoded AuthConfig object
@y
-   **X-Registry-Auth** – base64-encoded AuthConfig object
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Inspect an image
@y
### Inspect an image
@z

@x
`GET /images/(name)/json`
@y
`GET /images/(name)/json`
@z

@x
Return low-level information on the image `name`
@y
Return low-level information on the image `name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /images/ubuntu/json HTTP/1.1
@y
        GET /images/ubuntu/json HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {
             "Created": "2013-03-23T22:24:18.818426-07:00",
             "Container": "3d67245a8d72ecf13f33dffac9f79dcdf70f75acb84d308770391510e0c23ad0",
             "ContainerConfig":
                     {
                             "Hostname": "",
                             "User": "",
                             "Memory": 0,
                             "MemorySwap": 0,
                             "AttachStdin": false,
                             "AttachStdout": false,
                             "AttachStderr": false,
                             "PortSpecs": null,
                             "Tty": true,
                             "OpenStdin": true,
                             "StdinOnce": false,
                             "Env": null,
                             "Cmd": ["/bin/bash"],
                             "Dns": null,
                             "Image": "ubuntu",
                             "Volumes": null,
                             "VolumesFrom": "",
                             "WorkingDir": ""
                     },
             "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
             "Parent": "27cf784147099545",
             "Size": 6824592
        }
@y
        {
             "Created": "2013-03-23T22:24:18.818426-07:00",
             "Container": "3d67245a8d72ecf13f33dffac9f79dcdf70f75acb84d308770391510e0c23ad0",
             "ContainerConfig":
                     {
                             "Hostname": "",
                             "User": "",
                             "Memory": 0,
                             "MemorySwap": 0,
                             "AttachStdin": false,
                             "AttachStdout": false,
                             "AttachStderr": false,
                             "PortSpecs": null,
                             "Tty": true,
                             "OpenStdin": true,
                             "StdinOnce": false,
                             "Env": null,
                             "Cmd": ["/bin/bash"],
                             "Dns": null,
                             "Image": "ubuntu",
                             "Volumes": null,
                             "VolumesFrom": "",
                             "WorkingDir": ""
                     },
             "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
             "Parent": "27cf784147099545",
             "Size": 6824592
        }
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
### Get the history of an image
@y
### Get the history of an image
@z

@x
`GET /images/(name)/history`
@y
`GET /images/(name)/history`
@z

@x
Return the history of the image `name`
@y
Return the history of the image `name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /images/ubuntu/history HTTP/1.1
@y
        GET /images/ubuntu/history HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        [
             {
                     "Id": "b750fe79269d",
                     "Created": 1364102658,
                     "CreatedBy": "/bin/bash"
             },
             {
                     "Id": "27cf78414709",
                     "Created": 1364068391,
                     "CreatedBy": ""
             }
        ]
@y
        [
             {
                     "Id": "b750fe79269d",
                     "Created": 1364102658,
                     "CreatedBy": "/bin/bash"
             },
             {
                     "Id": "27cf78414709",
                     "Created": 1364068391,
                     "CreatedBy": ""
             }
        ]
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
### Push an image on the registry
@y
### Push an image on the registry
@z

@x
`POST /images/(name)/push`
@y
`POST /images/(name)/push`
@z

@x
Push the image `name` on the registry
@y
Push the image `name` on the registry
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /images/test/push HTTP/1.1
@y
        POST /images/test/push HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {"status": "Pushing..."}
        {"status": "Pushing", "progress": "1/? (n/a)", "progressDetail": {"current": 1}}}
        {"error": "Invalid..."}
        ...
@y
        {"status": "Pushing..."}
        {"status": "Pushing", "progress": "1/? (n/a)", "progressDetail": {"current": 1}}}
        {"error": "Invalid..."}
        ...
@z

@x
    If you wish to push an image on to a private registry, that image must already have been tagged
    into a repository which references that registry host name and port.  This repository name should
    then be used in the URL. This mirrors the flow of the CLI.
@y
    If you wish to push an image on to a private registry, that image must already have been tagged
    into a repository which references that registry host name and port.  This repository name should
    then be used in the URL. This mirrors the flow of the CLI.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /images/registry.acme.com:5000/test/push HTTP/1.1
@y
        POST /images/registry.acme.com:5000/test/push HTTP/1.1
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **tag** – the tag to associate with the image on the registry, optional
@y
-   **tag** – the tag to associate with the image on the registry, optional
@z

@x
Request Headers:
@y
Request Headers:
@z

@x
-   **X-Registry-Auth** – include a base64-encoded AuthConfig
        object.
@y
-   **X-Registry-Auth** – include a base64-encoded AuthConfig
        object.
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
### Tag an image into a repository
@y
### Tag an image into a repository
@z

@x
`POST /images/(name)/tag`
@y
`POST /images/(name)/tag`
@z

@x
Tag the image `name` into a repository
@y
Tag the image `name` into a repository
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /images/test/tag?repo=myrepo&force=0&tag=v42 HTTP/1.1
@y
        POST /images/test/tag?repo=myrepo&force=0&tag=v42 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 Created
@y
        HTTP/1.1 201 Created
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **repo** – The repository to tag in
-   **force** – 1/True/true or 0/False/false, default false
-   **tag** - The new tag name
@y
-   **repo** – The repository to tag in
-   **force** – 1/True/true or 0/False/false, default false
-   **tag** - The new tag name
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@y
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@z

@x
### Remove an image
@y
### Remove an image
@z

@x
`DELETE /images/(name)`
@y
`DELETE /images/(name)`
@z

@x
Remove the image `name` from the filesystem
@y
Remove the image `name` from the filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        DELETE /images/test HTTP/1.1
@y
        DELETE /images/test HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-type: application/json
@y
        HTTP/1.1 200 OK
        Content-type: application/json
@z

@x
        [
         {"Untagged": "3e2f21a89f"},
         {"Deleted": "3e2f21a89f"},
         {"Deleted": "53b4f83ac9"}
        ]
@y
        [
         {"Untagged": "3e2f21a89f"},
         {"Deleted": "3e2f21a89f"},
         {"Deleted": "53b4f83ac9"}
        ]
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **force** – 1/True/true or 0/False/false, default false
-   **noprune** – 1/True/true or 0/False/false, default false
@y
-   **force** – 1/True/true or 0/False/false, default false
-   **noprune** – 1/True/true or 0/False/false, default false
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@z

@x
### Search images
@y
### Search images
@z

@x
`GET /images/search`
@y
`GET /images/search`
@z

@x
Search for an image on [Docker Hub](https://hub.docker.com).
@y
Search for an image on [Docker Hub](https://hub.docker.com).
@z

@x
> **Note**:
> The response keys have changed from API v1.6 to reflect the JSON
> sent by the registry server to the docker daemon's request.
@y
> **Note**:
> The response keys have changed from API v1.6 to reflect the JSON
> sent by the registry server to the docker daemon's request.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /images/search?term=sshd HTTP/1.1
@y
        GET /images/search?term=sshd HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        [
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "wma55/u1210sshd",
                    "star_count": 0
                },
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "jdswinbank/sshd",
                    "star_count": 0
                },
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "vgauthier/sshd",
                    "star_count": 0
                }
        ...
        ]
@y
        [
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "wma55/u1210sshd",
                    "star_count": 0
                },
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "jdswinbank/sshd",
                    "star_count": 0
                },
                {
                    "description": "",
                    "is_official": false,
                    "is_automated": false,
                    "name": "vgauthier/sshd",
                    "star_count": 0
                }
        ...
        ]
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **term** – term to search
@y
-   **term** – term to search
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
## 2.3 Misc
@y
## 2.3 Misc
@z

@x
### Build an image from Dockerfile via stdin
@y
### Build an image from Dockerfile via stdin
@z

@x
`POST /build`
@y
`POST /build`
@z

@x
Build an image from Dockerfile via stdin
@y
Build an image from Dockerfile via stdin
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /build HTTP/1.1
@y
        POST /build HTTP/1.1
@z

@x
        {{ TAR STREAM }}
@y
        {{ TAR STREAM }}
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {"stream": "Step 1..."}
        {"stream": "..."}
        {"error": "Error...", "errorDetail": {"code": 123, "message": "Error..."}}
@y
        {"stream": "Step 1..."}
        {"stream": "..."}
        {"error": "Error...", "errorDetail": {"code": 123, "message": "Error..."}}
@z

@x
    The stream must be a tar archive compressed with one of the
    following algorithms: identity (no compression), gzip, bzip2, xz.
@y
    The stream must be a tar archive compressed with one of the
    following algorithms: identity (no compression), gzip, bzip2, xz.
@z

@x
    The archive must include a file called `Dockerfile`
    at its root. It may include any number of other files,
    which will be accessible in the build context (See the [*ADD build
    command*](../../reference/builder.md#dockerbuilder)).
@y
    The archive must include a file called `Dockerfile`
    at its root. It may include any number of other files,
    which will be accessible in the build context (See the [*ADD build
    command*](../../reference/builder.md#dockerbuilder)).
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **t** – repository name (and optionally a tag) to be applied to
        the resulting image in case of success
-   **remote** – git or HTTP/HTTPS URI build source
-   **q** – suppress verbose build output
-   **nocache** – do not use the cache when building the image
-   **rm** - remove intermediate containers after a successful build (default behavior)
-   **forcerm** - always remove intermediate containers (includes rm)
@y
-   **t** – repository name (and optionally a tag) to be applied to
        the resulting image in case of success
-   **remote** – git or HTTP/HTTPS URI build source
-   **q** – suppress verbose build output
-   **nocache** – do not use the cache when building the image
-   **rm** - remove intermediate containers after a successful build (default behavior)
-   **forcerm** - always remove intermediate containers (includes rm)
@z

@x
    Request Headers:
@y
    Request Headers:
@z

@x
-   **Content-type** – should be set to `"application/tar"`.
-   **X-Registry-Config** – base64-encoded ConfigFile object
@y
-   **Content-type** – should be set to `"application/tar"`.
-   **X-Registry-Config** – base64-encoded ConfigFile object
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Check auth configuration
@y
### Check auth configuration
@z

@x
`POST /auth`
@y
`POST /auth`
@z

@x
Get the default username and email
@y
Get the default username and email
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /auth HTTP/1.1
        Content-Type: application/json
@y
        POST /auth HTTP/1.1
        Content-Type: application/json
@z

@x
        {
             "username":" hannibal",
             "password: "xxxx",
             "email": "hannibal@a-team.com",
             "serveraddress": "https://index.docker.io/v1/"
        }
@y
        {
             "username":" hannibal",
             "password: "xxxx",
             "email": "hannibal@a-team.com",
             "serveraddress": "https://index.docker.io/v1/"
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
@y
        HTTP/1.1 200 OK
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **204** – no error
-   **500** – server error
@y
-   **200** – no error
-   **204** – no error
-   **500** – server error
@z

@x
### Display system-wide information
@y
### Display system-wide information
@z

@x
`GET /info`
@y
`GET /info`
@z

@x
Display system-wide information
@y
Display system-wide information
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /info HTTP/1.1
@y
        GET /info HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {
             "Containers": 11,
             "Images": 16,
             "Driver": "btrfs",
             "ExecutionDriver": "native-0.1",
             "KernelVersion": "3.12.0-1-amd64"
             "Debug": false,
             "NFd": 11,
             "NGoroutines": 21,
             "NEventsListener": 0,
             "InitPath": "/usr/bin/docker",
             "IndexServerAddress": ["https://index.docker.io/v1/"],
             "MemoryLimit": true,
             "SwapLimit": false,
             "IPv4Forwarding": true
        }
@y
        {
             "Containers": 11,
             "Images": 16,
             "Driver": "btrfs",
             "ExecutionDriver": "native-0.1",
             "KernelVersion": "3.12.0-1-amd64"
             "Debug": false,
             "NFd": 11,
             "NGoroutines": 21,
             "NEventsListener": 0,
             "InitPath": "/usr/bin/docker",
             "IndexServerAddress": ["https://index.docker.io/v1/"],
             "MemoryLimit": true,
             "SwapLimit": false,
             "IPv4Forwarding": true
        }
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Show the docker version information
@y
### Show the docker version information
@z

@x
`GET /version`
@y
`GET /version`
@z

@x
Show the docker version information
@y
Show the docker version information
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /version HTTP/1.1
@y
        GET /version HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {
             "ApiVersion": "1.12",
             "Version": "0.2.2",
             "GitCommit": "5a2a5cc+CHANGES",
             "GoVersion": "go1.0.3"
        }
@y
        {
             "ApiVersion": "1.12",
             "Version": "0.2.2",
             "GitCommit": "5a2a5cc+CHANGES",
             "GoVersion": "go1.0.3"
        }
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Ping the docker server
@y
### Ping the docker server
@z

@x
`GET /_ping`
@y
`GET /_ping`
@z

@x
Ping the docker server
@y
Ping the docker server
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /_ping HTTP/1.1
@y
        GET /_ping HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: text/plain
@y
        HTTP/1.1 200 OK
        Content-Type: text/plain
@z

@x
        OK
@y
        OK
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** - no error
-   **500** - server error
@y
-   **200** - no error
-   **500** - server error
@z

@x
### Create a new image from a container's changes
@y
### Create a new image from a container's changes
@z

@x
`POST /commit`
@y
`POST /commit`
@z

@x
Create a new image from a container's changes
@y
Create a new image from a container's changes
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
        Content-Type: application/json
@y
        POST /commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
        Content-Type: application/json
@z

@x
        {
             "Hostname": "",
             "Domainname": "",
             "User": "",
             "Memory": 0,
             "MemorySwap": 0,
             "CpuShares": 512,
             "Cpuset": "0,1",
             "AttachStdin": false,
             "AttachStdout": true,
             "AttachStderr": true,
             "PortSpecs": null,
             "Tty": false,
             "OpenStdin": false,
             "StdinOnce": false,
             "Env": null,
             "Cmd": [
                     "date"
             ],
             "Volumes": {
                     "/tmp": {}
             },
             "WorkingDir": "",
             "NetworkDisabled": false,
             "ExposedPorts": {
                     "22/tcp": {}
             }
        }
@y
        {
             "Hostname": "",
             "Domainname": "",
             "User": "",
             "Memory": 0,
             "MemorySwap": 0,
             "CpuShares": 512,
             "Cpuset": "0,1",
             "AttachStdin": false,
             "AttachStdout": true,
             "AttachStderr": true,
             "PortSpecs": null,
             "Tty": false,
             "OpenStdin": false,
             "StdinOnce": false,
             "Env": null,
             "Cmd": [
                     "date"
             ],
             "Volumes": {
                     "/tmp": {}
             },
             "WorkingDir": "",
             "NetworkDisabled": false,
             "ExposedPorts": {
                     "22/tcp": {}
             }
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 Created
        Content-Type: application/json
@y
        HTTP/1.1 201 Created
        Content-Type: application/json
@z

@x
        {"Id": "596069db4bf5"}
@y
        {"Id": "596069db4bf5"}
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-  **config** - the container's configuration
@y
-  **config** - the container's configuration
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **comment** – commit message
-   **author** – author (e.g., "John Hannibal Smith
    <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
@y
-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **comment** – commit message
-   **author** – author (e.g., "John Hannibal Smith
    <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **201** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **201** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
### Monitor Docker's events
@y
### Monitor Docker's events
@z

@x
`GET /events`
@y
`GET /events`
@z

@x
Get container events from docker, either in real time via streaming, or via
polling (using since).
@y
Get container events from docker, either in real time via streaming, or via
polling (using since).
@z

@x
Docker containers will report the following events:
@y
Docker containers will report the following events:
@z

@x
    create, destroy, die, export, kill, pause, restart, start, stop, unpause
@y
    create, destroy, die, export, kill, pause, restart, start, stop, unpause
@z

@x
and Docker images will report:
@y
and Docker images will report:
@z

@x
    untag, delete
@y
    untag, delete
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /events?since=1374067924
@y
        GET /events?since=1374067924
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/json
@y
        HTTP/1.1 200 OK
        Content-Type: application/json
@z

@x
        {"status": "create", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067924}
        {"status": "start", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067924}
        {"status": "stop", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067966}
        {"status": "destroy", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067970}
@y
        {"status": "create", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067924}
        {"status": "start", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067924}
        {"status": "stop", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067966}
        {"status": "destroy", "id": "dfdf82bd3881","from": "ubuntu:latest", "time":1374067970}
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **since** – timestamp used for polling
-   **until** – timestamp used for polling
@y
-   **since** – timestamp used for polling
-   **until** – timestamp used for polling
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Get a tarball containing all images in a repository
@y
### Get a tarball containing all images in a repository
@z

@x
`GET /images/(name)/get`
@y
`GET /images/(name)/get`
@z

@x
Get a tarball containing all images and metadata for the repository specified
by `name`.
@y
Get a tarball containing all images and metadata for the repository specified
by `name`.
@z

@x
If `name` is a specific name and tag (e.g. ubuntu:latest), then only that image
(and its parents) are returned. If `name` is an image ID, similarly only that
image (and its parents) are returned, but with the exclusion of the
'repositories' file in the tarball, as there were no image names referenced.
@y
If `name` is a specific name and tag (e.g. ubuntu:latest), then only that image
(and its parents) are returned. If `name` is an image ID, similarly only that
image (and its parents) are returned, but with the exclusion of the
'repositories' file in the tarball, as there were no image names referenced.
@z

@x
See the [image tarball format](#image-tarball-format) for more details.
@y
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
        GET /images/ubuntu/get
@y
        GET /images/ubuntu/get
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@y
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@z

@x
        Binary data stream
@y
        Binary data stream
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Get a tarball containing all images.
@y
### Get a tarball containing all images.
@z

@x
`GET /images/get`
@y
`GET /images/get`
@z

@x
Get a tarball containing all images and metadata for one or more repositories.
@y
Get a tarball containing all images and metadata for one or more repositories.
@z

@x
For each value of the `names` parameter: if it is a specific name and tag (e.g.
ubuntu:latest), then only that image (and its parents) are returned; if it is
an image ID, similarly only that image (and its parents) are returned and there
would be no names referenced in the 'repositories' file for this image ID.
@y
For each value of the `names` parameter: if it is a specific name and tag (e.g.
ubuntu:latest), then only that image (and its parents) are returned; if it is
an image ID, similarly only that image (and its parents) are returned and there
would be no names referenced in the 'repositories' file for this image ID.
@z

@x
See the [image tarball format](#image-tarball-format) for more details.
@y
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
        GET /images/get?names=myname%2Fmyapp%3Alatest&names=busybox
@y
        GET /images/get?names=myname%2Fmyapp%3Alatest&names=busybox
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@y
        HTTP/1.1 200 OK
        Content-Type: application/x-tar
@z

@x
        Binary data stream
@y
        Binary data stream
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Load a tarball with a set of images and tags into docker
@y
### Load a tarball with a set of images and tags into docker
@z

@x
`POST /images/load`
@y
`POST /images/load`
@z

@x
Load a set of images and tags into the docker repository.
See the [image tarball format](#image-tarball-format) for more details.
@y
Load a set of images and tags into the docker repository.
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
        POST /images/load
@y
        POST /images/load
@z

@x
        Tarball in body
@y
        Tarball in body
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
@y
        HTTP/1.1 200 OK
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### Image tarball format
@y
### Image tarball format
@z

@x
An image tarball contains one directory per image layer (named using its long ID),
each containing three files:
@y
An image tarball contains one directory per image layer (named using its long ID),
each containing three files:
@z

@x
1. `VERSION`: currently `1.0` - the file format version
2. `json`: detailed layer information, similar to `docker inspect layer_id`
3. `layer.tar`: A tarfile containing the filesystem changes in this layer
@y
1. `VERSION`: currently `1.0` - the file format version
2. `json`: detailed layer information, similar to `docker inspect layer_id`
3. `layer.tar`: A tarfile containing the filesystem changes in this layer
@z

@x
The `layer.tar` file will contain `aufs` style `.wh..wh.aufs` files and directories
for storing attribute changes and deletions.
@y
The `layer.tar` file will contain `aufs` style `.wh..wh.aufs` files and directories
for storing attribute changes and deletions.
@z

@x
If the tarball defines a repository, there will also be a `repositories` file at
the root that contains a list of repository and tag names mapped to layer IDs.
@y
If the tarball defines a repository, there will also be a `repositories` file at
the root that contains a list of repository and tag names mapped to layer IDs.
@z

@x
```
{"hello-world":
    {"latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"}
}
```
@y
```
{"hello-world":
    {"latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"}
}
```
@z

@x
### Exec Create
@y
### Exec Create
@z

@x
`POST /containers/(id or name)/exec`
@y
`POST /containers/(id or name)/exec`
@z

@x
Sets up an exec instance in a running container `id`
@y
Sets up an exec instance in a running container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /containers/e90e34656806/exec HTTP/1.1
        Content-Type: application/json
@y
        POST /containers/e90e34656806/exec HTTP/1.1
        Content-Type: application/json
@z

@x
        {
	     "AttachStdin": false,
	     "AttachStdout": true,
	     "AttachStderr": true,
	     "Tty": false,
	     "Cmd": [
                     "date"
             ],
        }
@y
        {
	     "AttachStdin": false,
	     "AttachStdout": true,
	     "AttachStderr": true,
	     "Tty": false,
	     "Cmd": [
                     "date"
             ],
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 Created
        Content-Type: application/json
@y
        HTTP/1.1 201 Created
        Content-Type: application/json
@z

@x
        {
             "Id": "f90e34656806"
        }
@y
        {
             "Id": "f90e34656806"
        }
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-   **AttachStdin** - Boolean value, attaches to stdin of the exec command.
-   **AttachStdout** - Boolean value, attaches to stdout of the exec command.
-   **AttachStderr** - Boolean value, attaches to stderr of the exec command.
-   **Tty** - Boolean value to allocate a pseudo-TTY
-   **Cmd** - Command to run specified as a string or an array of strings.
@y
-   **AttachStdin** - Boolean value, attaches to stdin of the exec command.
-   **AttachStdout** - Boolean value, attaches to stdout of the exec command.
-   **AttachStderr** - Boolean value, attaches to stderr of the exec command.
-   **Tty** - Boolean value to allocate a pseudo-TTY
-   **Cmd** - Command to run specified as a string or an array of strings.
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **201** – no error
-   **404** – no such container
@y
-   **201** – no error
-   **404** – no such container
@z

@x
### Exec Start
@y
### Exec Start
@z

@x
`POST /exec/(id)/start`
@y
`POST /exec/(id)/start`
@z

@x
Starts a previously set up exec instance `id`. If `detach` is true, this API
returns after starting the `exec` command. Otherwise, this API sets up an
interactive session with the `exec` command.
@y
Starts a previously set up exec instance `id`. If `detach` is true, this API
returns after starting the `exec` command. Otherwise, this API sets up an
interactive session with the `exec` command.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /exec/e90e34656806/start HTTP/1.1
        Content-Type: application/json
@y
        POST /exec/e90e34656806/start HTTP/1.1
        Content-Type: application/json
@z

@x
        {
	     "Detach": false,
	     "Tty": false,
        }
@y
        {
	     "Detach": false,
	     "Tty": false,
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@y
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@z

@x
        {{ STREAM }}
@y
        {{ STREAM }}
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-   **Detach** - Detach from the exec command
-   **Tty** - Boolean value to allocate a pseudo-TTY
@y
-   **Detach** - Detach from the exec command
-   **Tty** - Boolean value to allocate a pseudo-TTY
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **200** – no error
-   **404** – no such exec instance
@y
-   **200** – no error
-   **404** – no such exec instance
@z

@x
    **Stream details**:
    Similar to the stream behavior of `POST /containers/(id or name)/attach` API
@y
    **Stream details**:
    Similar to the stream behavior of `POST /containers/(id or name)/attach` API
@z

@x
### Exec Resize
@y
### Exec Resize
@z

@x
`POST /exec/(id)/resize`
@y
`POST /exec/(id)/resize`
@z

@x
Resizes the tty session used by the exec command `id`.
This API is valid only if `tty` was specified as part of creating and starting the exec command.
@y
Resizes the tty session used by the exec command `id`.
This API is valid only if `tty` was specified as part of creating and starting the exec command.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /exec/e90e34656806/resize HTTP/1.1
        Content-Type: plain/text
@y
        POST /exec/e90e34656806/resize HTTP/1.1
        Content-Type: plain/text
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 Created
        Content-Type: plain/text
@y
        HTTP/1.1 201 Created
        Content-Type: plain/text
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **h** – height of tty session
-   **w** – width
@y
-   **h** – height of tty session
-   **w** – width
@z

@x
Status Codes:
@y
Status Codes:
@z

@x
-   **201** – no error
-   **404** – no such exec instance
@y
-   **201** – no error
-   **404** – no such exec instance
@z

@x
# 3. Going further
@y
# 3. Going further
@z

@x
## 3.1 Inside `docker run`
@y
## 3.1 Inside `docker run`
@z

@x
As an example, the `docker run` command line makes the following API calls:
@y
As an example, the `docker run` command line makes the following API calls:
@z

@x
- Create the container
@y
- Create the container
@z

@x
- If the status code is 404, it means the image doesn't exist:
    - Try to pull it
    - Then retry to create the container
@y
- If the status code is 404, it means the image doesn't exist:
    - Try to pull it
    - Then retry to create the container
@z

@x
- Start the container
@y
- Start the container
@z

@x
- If you are not in detached mode:
- Attach to the container, using logs=1 (to have stdout and
      stderr from the container's start) and stream=1
@y
- If you are not in detached mode:
- Attach to the container, using logs=1 (to have stdout and
      stderr from the container's start) and stream=1
@z

@x
- If in detached mode or only stdin is attached:
- Display the container's id
@y
- If in detached mode or only stdin is attached:
- Display the container's id
@z

@x
## 3.2 Hijacking
@y
## 3.2 Hijacking
@z

@x
In this version of the API, /attach, uses hijacking to transport stdin,
stdout and stderr on the same socket. This might change in the future.
@y
In this version of the API, /attach, uses hijacking to transport stdin,
stdout and stderr on the same socket. This might change in the future.
@z

@x
## 3.3 CORS Requests
@y
## 3.3 CORS Requests
@z

@x
To enable cross origin requests to the remote api add the flag
"--api-enable-cors" when running docker in daemon mode.
@y
To enable cross origin requests to the remote api add the flag
"--api-enable-cors" when running docker in daemon mode.
@z

@x
    $ docker -d -H="192.168.1.9:2375" --api-enable-cors
@y
    $ docker -d -H="192.168.1.9:2375" --api-enable-cors
@z
