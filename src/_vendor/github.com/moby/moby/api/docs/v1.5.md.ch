%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!--[metadata]>
+++
draft = true
title = "Remote API v1.5"
description = "API Documentation for Docker"
keywords = ["API, Docker, rcli, REST,  documentation"]
[menu.main]
parent="smn_remoteapi"
+++
<![end-metadata]-->
@y
<!--[metadata]>
+++
draft = true
title = "Remote API v1.5"
description = "API Documentation for Docker"
keywords = ["API, Docker, rcli, REST,  documentation"]
[menu.main]
parent="smn_remoteapi"
+++
<![end-metadata]-->
@z

@x
# Docker Remote API v1.5
@y
# Docker Remote API v1.5
@z

@x
# 1. Brief introduction
@y
# 1. Brief introduction
@z

@x
- The Remote API is replacing rcli
- Default port in the docker daemon is 2375
- The API tends to be REST, but for some complex commands, like attach
  or pull, the HTTP connection is hijacked to transport stdout stdin
  and stderr
@y
- The Remote API is replacing rcli
- Default port in the docker daemon is 2375
- The API tends to be REST, but for some complex commands, like attach
  or pull, the HTTP connection is hijacked to transport stdout stdin
  and stderr
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
            "Image": "ubuntu:latest",
            "Command": "echo 1",
            "Created": 1367854155,
            "Status": "Exit 0",
            "Ports":[{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "9cd87474be90",
            "Image": "ubuntu:latest",
            "Command": "echo 222222",
            "Created": 1367854155,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "3176a2479c92",
            "Image": "centos:latest",
            "Command": "echo 3333333333333333",
            "Created": 1367854154,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "4cb07b47f9fb",
            "Image": "fedora:latest",
            "Command": "echo 444444444444444444444444444444444",
            "Created": 1367854152,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          }
        ]
@y
        [
          {
            "Id": "8dfafdbc3a40",
            "Image": "ubuntu:latest",
            "Command": "echo 1",
            "Created": 1367854155,
            "Status": "Exit 0",
            "Ports":[{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "9cd87474be90",
            "Image": "ubuntu:latest",
            "Command": "echo 222222",
            "Created": 1367854155,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "3176a2479c92",
            "Image": "centos:latest",
            "Command": "echo 3333333333333333",
            "Created": 1367854154,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          },
          {
            "Id": "4cb07b47f9fb",
            "Image": "fedora:latest",
            "Command": "echo 444444444444444444444444444444444",
            "Created": 1367854152,
            "Status": "Exit 0",
            "Ports":[],
            "SizeRw":12288,
            "SizeRootFs":0
          }
        ]
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
     
@y
     
@z

@x
-   **all** – 1/True/true or 0/False/false, Show all containers.
    Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created containers, include non-running ones.
-   **since** – Show only containers created since Id, include non-running ones.
-   **before** – Show only containers created before Id, include non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers sizes
@y
-   **all** – 1/True/true or 0/False/false, Show all containers.
    Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created containers, include non-running ones.
-   **since** – Show only containers created since Id, include non-running ones.
-   **before** – Show only containers created before Id, include non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers sizes
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
          "Hostname":"",
          "User":"",
          "Memory":0,
          "MemorySwap":0,
          "AttachStdin":false,
          "AttachStdout":true,
          "AttachStderr":true,
          "PortSpecs":null,
          "Privileged": false,
          "Tty":false,
          "OpenStdin":false,
          "StdinOnce":false,
          "Env":null,
          "Cmd":[
            "date"
          ],
          "Dns":null,
          "Image":"ubuntu",
          "Volumes":{},
          "VolumesFrom":"",
          "WorkingDir":""
        }
@y
        {
          "Hostname":"",
          "User":"",
          "Memory":0,
          "MemorySwap":0,
          "AttachStdin":false,
          "AttachStdout":true,
          "AttachStderr":true,
          "PortSpecs":null,
          "Privileged": false,
          "Tty":false,
          "OpenStdin":false,
          "StdinOnce":false,
          "Env":null,
          "Cmd":[
            "date"
          ],
          "Dns":null,
          "Image":"ubuntu",
          "Volumes":{},
          "VolumesFrom":"",
          "WorkingDir":""
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
          "Id":"e90e34656806"
          "Warnings":[]
        }
@y
        {
          "Id":"e90e34656806"
          "Warnings":[]
        }
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
-   **config** – the container's configuration
@y
-   **config** – the container's configuration
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
`GET /containers/(id)/json`
@y
`GET /containers/(id)/json`
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
            "WorkingDir":""
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
          "Volumes": {}
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
            "WorkingDir":""
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
          "Volumes": {}
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
`GET /containers/(id)/top`
@y
`GET /containers/(id)/top`
@z

@x
List processes running inside the container `id`
@y
List processes running inside the container `id`
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
          "Titles":[
            "USER",
            "PID",
            "%CPU",
            "%MEM",
            "VSZ",
            "RSS",
            "TTY",
            "STAT",
            "START",
            "TIME",
            "COMMAND"
          ],
          "Processes":[
            ["root","20147","0.0","0.1","18060","1864","pts/4","S","10:06","0:00","bash"],
            ["root","20271","0.0","0.0","4312","352","pts/4","S+","10:07","0:00","sleep","10"]
          ]
        }
@y
        {
          "Titles":[
            "USER",
            "PID",
            "%CPU",
            "%MEM",
            "VSZ",
            "RSS",
            "TTY",
            "STAT",
            "START",
            "TIME",
            "COMMAND"
          ],
          "Processes":[
            ["root","20147","0.0","0.1","18060","1864","pts/4","S","10:06","0:00","bash"],
            ["root","20271","0.0","0.0","4312","352","pts/4","S+","10:07","0:00","sleep","10"]
          ]
        }
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **ps_args** – ps arguments to use (e.g., aux)
@y
-   **ps_args** – ps arguments to use (e.g., aux)
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
`GET /containers/(id)/changes`
@y
`GET /containers/(id)/changes`
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
            "Path":"/dev",
            "Kind":0
          },
          {
            "Path":"/dev/kmsg",
            "Kind":1
          },
          {
            "Path":"/test",
            "Kind":1
          }
        ]
@y
        [
          {
            "Path":"/dev",
            "Kind":0
          },
          {
            "Path":"/dev/kmsg",
            "Kind":1
          },
          {
            "Path":"/test",
            "Kind":1
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
`GET /containers/(id)/export`
@y
`GET /containers/(id)/export`
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
### Start a container
@y
### Start a container
@z

@x
`POST /containers/(id)/start`
@y
`POST /containers/(id)/start`
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
        POST /containers/(id)/start HTTP/1.1
        Content-Type: application/json
@y
        POST /containers/(id)/start HTTP/1.1
        Content-Type: application/json
@z

@x
        {
          "Binds":["/tmp:/tmp"],
          "LxcConf":[{"Key":"lxc.utsname","Value":"docker"}]
        }
@y
        {
          "Binds":["/tmp:/tmp"],
          "LxcConf":[{"Key":"lxc.utsname","Value":"docker"}]
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 204 No Content
        Content-Type: text/plain
@y
        HTTP/1.1 204 No Content
        Content-Type: text/plain
@z

@x
Json Parameters:
@y
Json Parameters:
@z

@x
     
@y
     
@z

@x
-   **hostConfig** – the container's host configuration (optional)
@y
-   **hostConfig** – the container's host configuration (optional)
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
### Stop a container
@y
### Stop a container
@z

@x
`POST /containers/(id)/stop`
@y
`POST /containers/(id)/stop`
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
        HTTP/1.1 204 OK
@y
        HTTP/1.1 204 OK
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
### Restart a container
@y
### Restart a container
@z

@x
`POST /containers/(id)/restart`
@y
`POST /containers/(id)/restart`
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
`POST /containers/(id)/kill`
@y
`POST /containers/(id)/kill`
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
`POST /containers/(id)/attach`
@y
`POST /containers/(id)/attach`
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
-   **logs** – 1/True/true or 0/False/false, return logs. Defaul
        false
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default false
-   **stdin** – 1/True/true or 0/False/false, if stream=true, attach
        to stdin. Default false
-   **stdout** – 1/True/true or 0/False/false, if logs=true, return
        stdout log, if stream=true, attach to stdout. Default false
-   **stderr** – 1/True/true or 0/False/false, if logs=true, return
        stderr log, if stream=true, attach to stderr. Default false
@y
-   **logs** – 1/True/true or 0/False/false, return logs. Defaul
        false
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
### Attach to a container (websocket)
@y
### Attach to a container (websocket)
@z

@x
`GET /containers/(id)/attach/ws`
@y
`GET /containers/(id)/attach/ws`
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
`POST /containers/(id)/wait`
@y
`POST /containers/(id)/wait`
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
`DELETE /containers/(id)`
@y
`DELETE /containers/(id)`
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
@y
-   **v** – 1/True/true or 0/False/false, Remove the volumes
        associated to the container. Default false
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
`POST /containers/(id)/copy`
@y
`POST /containers/(id)/copy`
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
          "Resource":"test.txt"
        }
@y
        {
          "Resource":"test.txt"
        }
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
`GET /images/(format)`
@y
`GET /images/(format)`
@z

@x
List images `format` could be json or viz (json default)
@y
List images `format` could be json or viz (json default)
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
            "Repository":"ubuntu",
            "Tag":"precise",
            "Id":"b750fe79269d",
            "Created":1364102658,
            "Size":24653,
            "VirtualSize":180116135
          },
          {
            "Repository":"ubuntu",
            "Tag":"12.04",
            "Id":"b750fe79269d",
            "Created":1364102658,
            "Size":24653,
            "VirtualSize":180116135
          }
        ]
@y
        [
          {
            "Repository":"ubuntu",
            "Tag":"precise",
            "Id":"b750fe79269d",
            "Created":1364102658,
            "Size":24653,
            "VirtualSize":180116135
          },
          {
            "Repository":"ubuntu",
            "Tag":"12.04",
            "Id":"b750fe79269d",
            "Created":1364102658,
            "Size":24653,
            "VirtualSize":180116135
          }
        ]
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        GET /images/viz HTTP/1.1
@y
        GET /images/viz HTTP/1.1
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
        digraph docker {
        "d82cbacda43a" -> "074be284591f"
        "1496068ca813" -> "08306dc45919"
        "08306dc45919" -> "0e7893146ac2"
        "b750fe79269d" -> "1496068ca813"
        base -> "27cf78414709" [style=invis]
        "f71189fff3de" -> "9a33b36209ed"
        "27cf78414709" -> "b750fe79269d"
        "0e7893146ac2" -> "d6434d954665"
        "d6434d954665" -> "d82cbacda43a"
        base -> "e9aa60c60128" [style=invis]
        "074be284591f" -> "f71189fff3de"
        "b750fe79269d" [label="b750fe79269d\nubuntu",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        "e9aa60c60128" [label="e9aa60c60128\ncentos",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        "9a33b36209ed" [label="9a33b36209ed\nfedora",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        base [style=invisible]
        }
@y
        digraph docker {
        "d82cbacda43a" -> "074be284591f"
        "1496068ca813" -> "08306dc45919"
        "08306dc45919" -> "0e7893146ac2"
        "b750fe79269d" -> "1496068ca813"
        base -> "27cf78414709" [style=invis]
        "f71189fff3de" -> "9a33b36209ed"
        "27cf78414709" -> "b750fe79269d"
        "0e7893146ac2" -> "d6434d954665"
        "d6434d954665" -> "d82cbacda43a"
        base -> "e9aa60c60128" [style=invis]
        "074be284591f" -> "f71189fff3de"
        "b750fe79269d" [label="b750fe79269d\nubuntu",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        "e9aa60c60128" [label="e9aa60c60128\ncentos",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        "9a33b36209ed" [label="9a33b36209ed\nfedora",shape=box,fillcolor="paleturquoise",style="filled,rounded"];
        base [style=invisible]
        }
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by defaul
@y
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by defaul
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
Create an image, either by pull it from the registry or by importing i
@y
Create an image, either by pull it from the registry or by importing i
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
        {"status":"Pulling..."}
        {"status":"Pulling", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
        ...
@y
        {"status":"Pulling..."}
        {"status":"Pulling", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
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
-   **fromSrc** – source to import, - means stdin
-   **repo** – repository
-   **tag** – tag
-   **registry** – the registry to pull from
@y
-   **fromImage** – name of the image to pull
-   **fromSrc** – source to import, - means stdin
-   **repo** – repository
-   **tag** – tag
-   **registry** – the registry to pull from
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
### Insert a file in an image
@y
### Insert a file in an image
@z

@x
`POST /images/(name)/insert`
@y
`POST /images/(name)/insert`
@z

@x
Insert a file from `url` in the image `name` at `path`
@y
Insert a file from `url` in the image `name` at `path`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
        POST /images/test/insert?path=/usr&url=myurl HTTP/1.1
@y
        POST /images/test/insert?path=/usr&url=myurl HTTP/1.1
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
        {"status":"Inserting..."}
        {"status":"Inserting", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
        ...
@y
        {"status":"Inserting..."}
        {"status":"Inserting", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
        ...
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-	**url** – The url from where the file is taken
-	**path** – The path where the file is stored
@y
-	**url** – The url from where the file is taken
-	**path** – The path where the file is stored
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
        GET /images/centos/json HTTP/1.1
@y
        GET /images/centos/json HTTP/1.1
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
          "id":"b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
          "parent":"27cf784147099545",
          "created":"2013-03-23T22:24:18.818426-07:00",
          "container":"3d67245a8d72ecf13f33dffac9f79dcdf70f75acb84d308770391510e0c23ad0",
          "container_config":
            {
              "Hostname":"",
              "User":"",
              "Memory":0,
              "MemorySwap":0,
              "AttachStdin":false,
              "AttachStdout":false,
              "AttachStderr":false,
              "PortSpecs":null,
              "Tty":true,
              "OpenStdin":true,
              "StdinOnce":false,
              "Env":null,
              "Cmd": ["/bin/bash"],
              "Dns":null,
              "Image":"centos",
              "Volumes":null,
              "VolumesFrom":"",
              "WorkingDir":""
            },
          "Size": 6824592
        }
@y
        {
          "id":"b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
          "parent":"27cf784147099545",
          "created":"2013-03-23T22:24:18.818426-07:00",
          "container":"3d67245a8d72ecf13f33dffac9f79dcdf70f75acb84d308770391510e0c23ad0",
          "container_config":
            {
              "Hostname":"",
              "User":"",
              "Memory":0,
              "MemorySwap":0,
              "AttachStdin":false,
              "AttachStdout":false,
              "AttachStderr":false,
              "PortSpecs":null,
              "Tty":true,
              "OpenStdin":true,
              "StdinOnce":false,
              "Env":null,
              "Cmd": ["/bin/bash"],
              "Dns":null,
              "Image":"centos",
              "Volumes":null,
              "VolumesFrom":"",
              "WorkingDir":""
            },
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
        GET /images/fedora/history HTTP/1.1
@y
        GET /images/fedora/history HTTP/1.1
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
            "Id":"b750fe79269d",
            "Created":1364102658,
            "CreatedBy":"/bin/bash"
          },
          {
            "Id":"27cf78414709",
            "Created":1364068391,
            "CreatedBy":""
          }
        ]
@y
        [
          {
            "Id":"b750fe79269d",
            "Created":1364102658,
            "CreatedBy":"/bin/bash"
          },
          {
            "Id":"27cf78414709",
            "Created":1364068391,
            "CreatedBy":""
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
        {"status":"Pushing..."}
        {"status":"Pushing", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
        ...
@y
        {"status":"Pushing..."}
        {"status":"Pushing", "progress":"1/? (n/a)"}
        {"error":"Invalid..."}
        ...
@z

@x
    The `X-Registry-Auth` header can be used to
    include a base64-encoded AuthConfig object.
@y
    The `X-Registry-Auth` header can be used to
    include a base64-encoded AuthConfig object.
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
        HTTP/1.1 201 OK
@y
        HTTP/1.1 201 OK
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
          {"Untagged":"3e2f21a89f"},
          {"Deleted":"3e2f21a89f"},
          {"Deleted":"53b4f83ac9"}
        ]
@y
        [
          {"Untagged":"3e2f21a89f"},
          {"Deleted":"3e2f21a89f"},
          {"Deleted":"53b4f83ac9"}
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
Search for an image on [Docker Hub](https://hub.docker.com)
@y
Search for an image on [Docker Hub](https://hub.docker.com)
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
            "Name":"cespare/sshd",
            "Description":""
          },
          {
            "Name":"johnfuller/sshd",
            "Description":""
          },
          {
            "Name":"dhrp/mongodb-sshd",
            "Description":""
          }
        ]
@y
        [
          {
            "Name":"cespare/sshd",
            "Description":""
          },
          {
            "Name":"johnfuller/sshd",
            "Description":""
          },
          {
            "Name":"dhrp/mongodb-sshd",
            "Description":""
          }
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
@y
        HTTP/1.1 200 OK
@z

@x
        {{ STREAM }}
@y
        {{ STREAM }}
@z

@x
    The stream must be a tar archive compressed with one of the
    following algorithms: identity (no compression), gzip, bzip2, xz.
    The archive must include a file called Dockerfile at its root. I
    may include any number of other files, which will be accessible in
    the build context (See the ADD build command).
@y
    The stream must be a tar archive compressed with one of the
    following algorithms: identity (no compression), gzip, bzip2, xz.
    The archive must include a file called Dockerfile at its root. I
    may include any number of other files, which will be accessible in
    the build context (See the ADD build command).
@z

@x
    The Content-type header should be set to "application/tar".
@y
    The Content-type header should be set to "application/tar".
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **t** – repository name (and optionally a tag) to be applied to
    the resulting image in case of success
-   **remote** – build source URI (git or HTTPS/HTTP)
-   **q** – suppress verbose build output
-   **nocache** – do not use the cache when building the image
-   **rm** – remove intermediate containers after a successful build
@y
-   **t** – repository name (and optionally a tag) to be applied to
    the resulting image in case of success
-   **remote** – build source URI (git or HTTPS/HTTP)
-   **q** – suppress verbose build output
-   **nocache** – do not use the cache when building the image
-   **rm** – remove intermediate containers after a successful build
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
          "username":"hannibal",
          "password:"xxxx",
          "email":"hannibal@a-team.com",
          "serveraddress":"https://index.docker.io/v1/"
        }
@y
        {
          "username":"hannibal",
          "password:"xxxx",
          "email":"hannibal@a-team.com",
          "serveraddress":"https://index.docker.io/v1/"
        }
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
          "Containers":11,
          "Images":16,
          "Debug":false,
          "NFd": 11,
          "NGoroutines":21,
          "MemoryLimit":true,
          "SwapLimit":false,
          "IPv4Forwarding":true
        }
@y
        {
          "Containers":11,
          "Images":16,
          "Debug":false,
          "NFd": 11,
          "NGoroutines":21,
          "MemoryLimit":true,
          "SwapLimit":false,
          "IPv4Forwarding":true
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
          "Version":"0.2.2",
          "GitCommit":"5a2a5cc+CHANGES",
          "GoVersion":"go1.0.3"
        }
@y
        {
          "Version":"0.2.2",
          "GitCommit":"5a2a5cc+CHANGES",
          "GoVersion":"go1.0.3"
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
        POST /commit?container=44c004db4b17&m=message&repo=myrepo HTTP/1.1
        Content-Type: application/json
@y
        POST /commit?container=44c004db4b17&m=message&repo=myrepo HTTP/1.1
        Content-Type: application/json
@z

@x
        {
            "Cmd": ["cat", "/world"],
            "PortSpecs":["22"]
        }
@y
        {
            "Cmd": ["cat", "/world"],
            "PortSpecs":["22"]
        }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
        HTTP/1.1 201 OK
            Content-Type: application/vnd.docker.raw-stream
@y
        HTTP/1.1 201 OK
            Content-Type: application/vnd.docker.raw-stream
@z

@x
        {"Id": "596069db4bf5"}
@y
        {"Id": "596069db4bf5"}
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
-   **m** – commit message
-   **author** – author (e.g., "John Hannibal Smith
        <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
@y
-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **m** – commit message
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
Get events from docker, either in real time via streaming, or via
polling (using since).
@y
Get events from docker, either in real time via streaming, or via
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
        {"status":"create","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067924}
        {"status":"start","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067924}
        {"status":"stop","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067966}
        {"status":"destroy","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067970}
@y
        {"status":"create","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067924}
        {"status":"start","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067924}
        {"status":"stop","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067966}
        {"status":"destroy","id":"dfdf82bd3881","from":"ubuntu:latest","time":1374067970}
@z

@x
Query Parameters:
@y
Query Parameters:
@z

@x
-   **since** – timestamp used for polling
@y
-   **since** – timestamp used for polling
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
Here are the steps of `docker run`:
@y
Here are the steps of `docker run`:
@z

@x
 - Create the container
 - If the status code is 404, it means the image doesn't exist:
   Try to pull it - Then retry to create the container
 - Start the container
 - If you are not in detached mode:
   Attach to the container, using logs=1 (to have stdout and stderr
   from the container's start) and stream=1
 - If in detached mode or only stdin is attached:
   Display the container's id
@y
 - Create the container
 - If the status code is 404, it means the image doesn't exist:
   Try to pull it - Then retry to create the container
 - Start the container
 - If you are not in detached mode:
   Attach to the container, using logs=1 (to have stdout and stderr
   from the container's start) and stream=1
 - If in detached mode or only stdin is attached:
   Display the container's id
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
