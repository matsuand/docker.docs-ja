%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
linkTitle: Networks
title: Define and manage networks in Docker Compose
description: Learn how to configure and control networks using the top-level networks element in Docker Compose.
keywords: compose, compose specification, networks, compose file reference
@y
linkTitle: Networks
title: Define and manage networks in Docker Compose
description: Learn how to configure and control networks using the top-level networks element in Docker Compose.
keywords: compose, compose specification, networks, compose file reference
@z

@x
{{% include "compose/networks.md" %}}
@y
{{% include "compose/networks.md" %}}
@z

@x
To use a network across multiple services, you must explicitly grant each service access by using the [networks](services.md) attribute within the `services` top-level element. The `networks` top-level element has additional syntax that provides more granular control.
@y
To use a network across multiple services, you must explicitly grant each service access by using the [networks](services.md) attribute within the `services` top-level element. The `networks` top-level element has additional syntax that provides more granular control.
@z

@x
## Examples
@y
## Examples
@z

@x
### Basic example
@y
### Basic example
@z

@x
In the following example, at runtime, networks `front-tier` and `back-tier` are created and the `frontend` service
is connected to `front-tier` and `back-tier` networks.
@y
In the following example, at runtime, networks `front-tier` and `back-tier` are created and the `frontend` service
is connected to `front-tier` and `back-tier` networks.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    networks:
      - front-tier
      - back-tier
@y
```yml
services:
  frontend:
    image: example/webapp
    networks:
      - front-tier
      - back-tier
@z

@x
networks:
  front-tier:
  back-tier:
```
@y
networks:
  front-tier:
  back-tier:
```
@z

@x
### Advanced example
@y
### Advanced example
@z

@x
```yml
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend
@y
```yml
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend
@z

@x
networks:
  frontend:
    # Specify driver options
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
  backend:
    # Use a custom driver
    driver: custom-driver
```
@y
networks:
  frontend:
    # Specify driver options
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
  backend:
    # Use a custom driver
    driver: custom-driver
```
@z

@x
This example shows a Compose file which defines two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common. Only `app` can talk to both.
@y
This example shows a Compose file which defines two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common. Only `app` can talk to both.
@z

@x
## The default network
@y
## The default network
@z

@x
When a Compose file doesn't declare explicit networks, Compose uses an implicit `default` network. Services without an explicit [`networks`](services.md#networks) declaration are connected by Compose to this `default` network:
@y
When a Compose file doesn't declare explicit networks, Compose uses an implicit `default` network. Services without an explicit [`networks`](services.md#networks) declaration are connected by Compose to this `default` network:
@z

@x
```yml
services:
  some-service:
    image: foo
```
This example is actually equivalent to:
@y
```yml
services:
  some-service:
    image: foo
```
This example is actually equivalent to:
@z

@x
```yml
services:
  some-service:
    image: foo
    networks:
      default: {}  
networks:
  default: {}      
```
@y
```yml
services:
  some-service:
    image: foo
    networks:
      default: {}  
networks:
  default: {}      
```
@z

@x
You can customize the `default` network with an explicit declaration:
@y
You can customize the `default` network with an explicit declaration:
@z

@x
```yml
networks:
  default: 
    name: a_network # Use a custom name
    driver_opts:    # pass options to driver for network creation
      com.docker.network.bridge.host_binding_ipv4: 127.0.0.1
```
@y
```yml
networks:
  default: 
    name: a_network # Use a custom name
    driver_opts:    # pass options to driver for network creation
      com.docker.network.bridge.host_binding_ipv4: 127.0.0.1
```
@z

@x
For options, see the [Docker Engine docs](https://docs.docker.com/engine/network/drivers/bridge/#options).
@y
For options, see the [Docker Engine docs](https://docs.docker.com/engine/network/drivers/bridge/#options).
@z

@x
## Attributes
@y
## Attributes
@z

@x
### `attachable`
@y
### `attachable`
@z

@x
If `attachable` is set to `true`, then standalone containers should be able to attach to this network, in addition to services.
If a standalone container attaches to the network, it can communicate with services and other standalone containers
that are also attached to the network.
@y
If `attachable` is set to `true`, then standalone containers should be able to attach to this network, in addition to services.
If a standalone container attaches to the network, it can communicate with services and other standalone containers
that are also attached to the network.
@z

@x
```yml
networks:
  mynet1:
    driver: overlay
    attachable: true
```
@y
```yml
networks:
  mynet1:
    driver: overlay
    attachable: true
```
@z

@x
### `driver`
@y
### `driver`
@z

@x
`driver` specifies which driver should be used for this network. Compose returns an error if the
driver is not available on the platform.
@y
`driver` specifies which driver should be used for this network. Compose returns an error if the
driver is not available on the platform.
@z

@x
```yml
networks:
  db-data:
    driver: bridge
```
@y
```yml
networks:
  db-data:
    driver: bridge
```
@z

@x
For more information on drivers and available options, see [Network drivers](/manuals/engine/network/drivers/_index.md).
@y
For more information on drivers and available options, see [Network drivers](manuals/engine/network/drivers/_index.md).
@z

@x
### `driver_opts`
@y
### `driver_opts`
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent.
@y
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent.
@z

@x
```yml
networks:
  frontend:
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
```
@y
```yml
networks:
  frontend:
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
```
@z

@x
Consult the [network drivers documentation](/manuals/engine/network/_index.md) for more information.
@y
Consult the [network drivers documentation](manuals/engine/network/_index.md) for more information.
@z

@x
### `enable_ipv4`
@y
### `enable_ipv4`
@z

@x
{{< summary-bar feature_name="Compose enable ipv4" >}}
@y
{{< summary-bar feature_name="Compose enable ipv4" >}}
@z

@x
`enable_ipv4` can be used to disable IPv4 address assignment.
@y
`enable_ipv4` can be used to disable IPv4 address assignment.
@z

@x
```yml
  networks:
    ip6net:
      enable_ipv4: false
      enable_ipv6: true
```
@y
```yml
  networks:
    ip6net:
      enable_ipv4: false
      enable_ipv6: true
```
@z

@x
### `enable_ipv6`
@y
### `enable_ipv6`
@z

@x
`enable_ipv6` enables IPv6 address assignment.
@y
`enable_ipv6` enables IPv6 address assignment.
@z

@x
```yml
  networks:
    ip6net:
      enable_ipv6: true
```
@y
```yml
  networks:
    ip6net:
      enable_ipv6: true
```
@z

@x
### `external`
@y
### `external`
@z

@x
If set to `true`:
 - `external` specifies that this network’s lifecycle is maintained outside of that of the application.
Compose doesn't attempt to create these networks, and returns an error if one doesn't exist.
 - All other attributes apart from name are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
If set to `true`:
 - `external` specifies that this network’s lifecycle is maintained outside of that of the application.
Compose doesn't attempt to create these networks, and returns an error if one doesn't exist.
 - All other attributes apart from name are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@z

@x
In the following example, `proxy` is the gateway to the outside world. Instead of attempting to create a network, Compose
queries the platform for an existing network called `outside` and connects the
`proxy` service's containers to it.
@y
In the following example, `proxy` is the gateway to the outside world. Instead of attempting to create a network, Compose
queries the platform for an existing network called `outside` and connects the
`proxy` service's containers to it.
@z

@x
```yml
services:
  proxy:
    image: example/proxy
    networks:
      - outside
      - default
  app:
    image: example/app
    networks:
      - default
@y
```yml
services:
  proxy:
    image: example/proxy
    networks:
      - outside
      - default
  app:
    image: example/app
    networks:
      - default
@z

@x
networks:
  outside:
    external: true
```
@y
networks:
  outside:
    external: true
```
@z

@x
### `ipam`
@y
### `ipam`
@z

@x
`ipam` specifies a custom IPAM configuration. This is an object with several properties, each of which is optional:
@y
`ipam` specifies a custom IPAM configuration. This is an object with several properties, each of which is optional:
@z

@x
- `driver`: Custom IPAM driver, instead of the default.
- `config`: A list with zero or more configuration elements, each containing a:
  - `subnet`: Subnet in CIDR format that represents a network segment
  - `ip_range`: Range of IPs from which to allocate container IPs
  - `gateway`: IPv4 or IPv6 gateway for the master subnet
  - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver, as a mapping from hostname to IP
- `options`: Driver-specific options as a key-value mapping.
@y
- `driver`: Custom IPAM driver, instead of the default.
- `config`: A list with zero or more configuration elements, each containing a:
  - `subnet`: Subnet in CIDR format that represents a network segment
  - `ip_range`: Range of IPs from which to allocate container IPs
  - `gateway`: IPv4 or IPv6 gateway for the master subnet
  - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver, as a mapping from hostname to IP
- `options`: Driver-specific options as a key-value mapping.
@z

@x
```yml
networks:
  mynet1:
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/16
          ip_range: 172.28.5.0/24
          gateway: 172.28.5.254
          aux_addresses:
            host1: 172.28.1.5
            host2: 172.28.1.6
            host3: 172.28.1.7
      options:
        foo: bar
        baz: "0"
```
@y
```yml
networks:
  mynet1:
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/16
          ip_range: 172.28.5.0/24
          gateway: 172.28.5.254
          aux_addresses:
            host1: 172.28.1.5
            host2: 172.28.1.6
            host3: 172.28.1.7
      options:
        foo: bar
        baz: "0"
```
@z

@x
### `internal`
@y
### `internal`
@z

@x
By default, Compose provides external connectivity to networks. `internal`, when set to `true`, lets you
create an externally isolated network.
@y
By default, Compose provides external connectivity to networks. `internal`, when set to `true`, lets you
create an externally isolated network.
@z

@x
### `labels`
@y
### `labels`
@z

@x
Add metadata to containers using `labels`. You can use either an array or a dictionary.
@y
Add metadata to containers using `labels`. You can use either an array or a dictionary.
@z

@x
It is recommended that you use reverse-DNS notation to prevent labels from conflicting with those used by other software.
@y
It is recommended that you use reverse-DNS notation to prevent labels from conflicting with those used by other software.
@z

@x
```yml
networks:
  mynet1:
    labels:
      com.example.description: "Financial transaction network"
      com.example.department: "Finance"
      com.example.label-with-empty-value: ""
```
@y
```yml
networks:
  mynet1:
    labels:
      com.example.description: "Financial transaction network"
      com.example.department: "Finance"
      com.example.label-with-empty-value: ""
```
@z

@x
```yml
networks:
  mynet1:
    labels:
      - "com.example.description=Financial transaction network"
      - "com.example.department=Finance"
      - "com.example.label-with-empty-value"
```
@y
```yml
networks:
  mynet1:
    labels:
      - "com.example.description=Financial transaction network"
      - "com.example.department=Finance"
      - "com.example.label-with-empty-value"
```
@z

@x
Compose sets `com.docker.compose.project` and `com.docker.compose.network` labels.
@y
Compose sets `com.docker.compose.project` and `com.docker.compose.network` labels.
@z

@x
### `name`
@y
### `name`
@z

@x
`name` sets a custom name for the network. The name field can be used to reference networks which contain special characters.
The name is used as is and is not scoped with the project name.
@y
`name` sets a custom name for the network. The name field can be used to reference networks which contain special characters.
The name is used as is and is not scoped with the project name.
@z

@x
```yml
networks:
  network1:
    name: my-app-net
```
@y
```yml
networks:
  network1:
    name: my-app-net
```
@z

@x
It can also be used in conjunction with the `external` property to define the platform network that Compose
should retrieve, typically by using a parameter so the Compose file doesn't need to hard-code runtime specific values:
@y
It can also be used in conjunction with the `external` property to define the platform network that Compose
should retrieve, typically by using a parameter so the Compose file doesn't need to hard-code runtime specific values:
@z

@x
```yml
networks:
  network1:
    external: true
    name: "${NETWORK_ID}"
```
@y
```yml
networks:
  network1:
    external: true
    name: "${NETWORK_ID}"
```
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
For more examples, see [Networking in Compose](/manuals/compose/how-tos/networking.md).
@y
For more examples, see [Networking in Compose](manuals/compose/how-tos/networking.md).
@z
