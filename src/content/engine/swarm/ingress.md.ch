%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Use the routing mesh to publish services externally to a swarm
keywords: guide, swarm mode, swarm, network, ingress, routing mesh
title: Use Swarm mode routing mesh
---
@y
---
description: Use the routing mesh to publish services externally to a swarm
keywords: guide, swarm mode, swarm, network, ingress, routing mesh
title: Use Swarm mode routing mesh
---
@z

@x
Docker Engine Swarm mode makes it easy to publish ports for services to make
them available to resources outside the swarm. All nodes participate in an
ingress routing mesh. The routing mesh enables each node in the swarm to
accept connections on published ports for any service running in the swarm, even
if there's no task running on the node. The routing mesh routes all
incoming requests to published ports on available nodes to an active container.
@y
Docker Engine Swarm mode makes it easy to publish ports for services to make
them available to resources outside the swarm. All nodes participate in an
ingress routing mesh. The routing mesh enables each node in the swarm to
accept connections on published ports for any service running in the swarm, even
if there's no task running on the node. The routing mesh routes all
incoming requests to published ports on available nodes to an active container.
@z

@x
To use the ingress network in the swarm, you need to have the following
ports open between the swarm nodes before you enable Swarm mode:
@y
To use the ingress network in the swarm, you need to have the following
ports open between the swarm nodes before you enable Swarm mode:
@z

@x
* Port `7946` TCP/UDP for container network discovery.
* Port `4789` UDP (configurable) for the container ingress network.
@y
* Port `7946` TCP/UDP for container network discovery.
* Port `4789` UDP (configurable) for the container ingress network.
@z

@x
When setting up networking in a Swarm, special care should be taken. Consult
the [tutorial](swarm-tutorial/index.md#open-protocols-and-ports-between-the-hosts)
for an overview.
@y
When setting up networking in a Swarm, special care should be taken. Consult
the [tutorial](swarm-tutorial/index.md#open-protocols-and-ports-between-the-hosts)
for an overview.
@z

@x
You must also open the published port between the swarm nodes and any external
resources, such as an external load balancer, that require access to the port.
@y
You must also open the published port between the swarm nodes and any external
resources, such as an external load balancer, that require access to the port.
@z

@x
You can also [bypass the routing mesh](#bypass-the-routing-mesh) for a given
service.
@y
You can also [bypass the routing mesh](#bypass-the-routing-mesh) for a given
service.
@z

@x
## Publish a port for a service
@y
## Publish a port for a service
@z

@x
Use the `--publish` flag to publish a port when you create a service. `target`
is used to specify the port inside the container, and `published` is used to
specify the port to bind on the routing mesh. If you leave off the `published`
port, a random high-numbered port is bound for each service task. You
need to inspect the task to determine the port.
@y
Use the `--publish` flag to publish a port when you create a service. `target`
is used to specify the port inside the container, and `published` is used to
specify the port to bind on the routing mesh. If you leave off the `published`
port, a random high-numbered port is bound for each service task. You
need to inspect the task to determine the port.
@z

@x
```console
$ docker service create \
  --name <SERVICE-NAME> \
  --publish published=<PUBLISHED-PORT>,target=<CONTAINER-PORT> \
  <IMAGE>
```
@y
```console
$ docker service create \
  --name <SERVICE-NAME> \
  --publish published=<PUBLISHED-PORT>,target=<CONTAINER-PORT> \
  <IMAGE>
```
@z

@x
> **Note**
>
> The older form of this syntax is a colon-separated string, where
> the published port is first and the target port is second, such as
> `-p 8080:80`. The new syntax is preferred because it is easier to read and
> allows more flexibility.
@y
> **Note**
>
> The older form of this syntax is a colon-separated string, where
> the published port is first and the target port is second, such as
> `-p 8080:80`. The new syntax is preferred because it is easier to read and
> allows more flexibility.
@z

@x
The `<PUBLISHED-PORT>` is the port where the swarm makes the service available.
If you omit it, a random high-numbered port is bound.
The `<CONTAINER-PORT>` is the port where the container listens. This parameter
is required.
@y
The `<PUBLISHED-PORT>` is the port where the swarm makes the service available.
If you omit it, a random high-numbered port is bound.
The `<CONTAINER-PORT>` is the port where the container listens. This parameter
is required.
@z

@x
For example, the following command publishes port 80 in the nginx container to
port 8080 for any node in the swarm:
@y
For example, the following command publishes port 80 in the nginx container to
port 8080 for any node in the swarm:
@z

@x
```console
$ docker service create \
  --name my-web \
  --publish published=8080,target=80 \
  --replicas 2 \
  nginx
```
@y
```console
$ docker service create \
  --name my-web \
  --publish published=8080,target=80 \
  --replicas 2 \
  nginx
```
@z

@x
When you access port 8080 on any node, Docker routes your request to an active
container. On the swarm nodes themselves, port 8080 may not actually be bound,
but the routing mesh knows how to route the traffic and prevents any port
conflicts from happening.
@y
When you access port 8080 on any node, Docker routes your request to an active
container. On the swarm nodes themselves, port 8080 may not actually be bound,
but the routing mesh knows how to route the traffic and prevents any port
conflicts from happening.
@z

@x
The routing mesh listens on the published port for any IP address assigned to
the node. For externally routable IP addresses, the port is available from
outside the host. For all other IP addresses the access is only available from
within the host.
@y
The routing mesh listens on the published port for any IP address assigned to
the node. For externally routable IP addresses, the port is available from
outside the host. For all other IP addresses the access is only available from
within the host.
@z

@x
![Service ingress image](images/ingress-routing-mesh.webp)
@y
![Service ingress image](images/ingress-routing-mesh.webp)
@z

@x
You can publish a port for an existing service using the following command:
@y
You can publish a port for an existing service using the following command:
@z

@x
```console
$ docker service update \
  --publish-add published=<PUBLISHED-PORT>,target=<CONTAINER-PORT> \
  <SERVICE>
```
@y
```console
$ docker service update \
  --publish-add published=<PUBLISHED-PORT>,target=<CONTAINER-PORT> \
  <SERVICE>
```
@z

@x
You can use `docker service inspect` to view the service's published port. For
instance:
@y
You can use `docker service inspect` to view the service's published port. For
instance:
@z

@x
```console
$ docker service inspect --format="{{json .Endpoint.Spec.Ports}}" my-web
@y
```console
$ docker service inspect --format="{{json .Endpoint.Spec.Ports}}" my-web
@z

@x
[{"Protocol":"tcp","TargetPort":80,"PublishedPort":8080}]
```
@y
[{"Protocol":"tcp","TargetPort":80,"PublishedPort":8080}]
```
@z

@x
The output shows the `<CONTAINER-PORT>` (labeled `TargetPort`) from the containers and the
`<PUBLISHED-PORT>` (labeled `PublishedPort`) where nodes listen for requests for the service.
@y
The output shows the `<CONTAINER-PORT>` (labeled `TargetPort`) from the containers and the
`<PUBLISHED-PORT>` (labeled `PublishedPort`) where nodes listen for requests for the service.
@z

@x
### Publish a port for TCP only or UDP only
@y
### Publish a port for TCP only or UDP only
@z

@x
By default, when you publish a port, it is a TCP port. You can
specifically publish a UDP port instead of or in addition to a TCP port. When
you publish both TCP and UDP ports, if you omit the protocol specifier,
the port is published as a TCP port. If you use the longer syntax (recommended),
set the `protocol` key to either `tcp` or `udp`.
@y
By default, when you publish a port, it is a TCP port. You can
specifically publish a UDP port instead of or in addition to a TCP port. When
you publish both TCP and UDP ports, if you omit the protocol specifier,
the port is published as a TCP port. If you use the longer syntax (recommended),
set the `protocol` key to either `tcp` or `udp`.
@z

@x
#### TCP only
@y
#### TCP only
@z

@x
Long syntax:
@y
Long syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53 \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53 \
  dns-cache
```
@z

@x
Short syntax:
@y
Short syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  -p 53:53 \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  -p 53:53 \
  dns-cache
```
@z

@x
#### TCP and UDP
@y
#### TCP and UDP
@z

@x
Long syntax:
@y
Long syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53 \
  --publish published=53,target=53,protocol=udp \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53 \
  --publish published=53,target=53,protocol=udp \
  dns-cache
```
@z

@x
Short syntax:
@y
Short syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  -p 53:53 \
  -p 53:53/udp \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  -p 53:53 \
  -p 53:53/udp \
  dns-cache
```
@z

@x
#### UDP only
@y
#### UDP only
@z

@x
Long syntax:
@y
Long syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53,protocol=udp \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53,protocol=udp \
  dns-cache
```
@z

@x
Short syntax:
@y
Short syntax:
@z

@x
```console
$ docker service create --name dns-cache \
  -p 53:53/udp \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  -p 53:53/udp \
  dns-cache
```
@z

@x
## Bypass the routing mesh
@y
## Bypass the routing mesh
@z

@x
By default, swarm services which publish ports do so using the routing mesh.
When you connect to a published port on any swarm node (whether it is running a
given service or not), you are redirected to a worker which is running that
service, transparently. Effectively, Docker acts as a load balancer for your
swarm services.
@y
By default, swarm services which publish ports do so using the routing mesh.
When you connect to a published port on any swarm node (whether it is running a
given service or not), you are redirected to a worker which is running that
service, transparently. Effectively, Docker acts as a load balancer for your
swarm services.
@z

@x
You can bypass the routing mesh, so that when you access the bound port on a
given node, you are always accessing the instance of the service running on
that node. This is referred to as `host` mode. There are a few things to keep
in mind.
@y
You can bypass the routing mesh, so that when you access the bound port on a
given node, you are always accessing the instance of the service running on
that node. This is referred to as `host` mode. There are a few things to keep
in mind.
@z

@x
- If you access a node which is not running a service task, the service does not
  listen on that port. It is possible that nothing is listening, or
  that a completely different application is listening.
@y
- If you access a node which is not running a service task, the service does not
  listen on that port. It is possible that nothing is listening, or
  that a completely different application is listening.
@z

@x
- If you expect to run multiple service tasks on each node (such as when you
  have 5 nodes but run 10 replicas), you cannot specify a static target port.
  Either allow Docker to assign a random high-numbered port (by leaving off the
  `published`), or ensure that only a single instance of the service runs on a
  given node, by using a global service rather than a replicated one, or by
  using placement constraints.
@y
- If you expect to run multiple service tasks on each node (such as when you
  have 5 nodes but run 10 replicas), you cannot specify a static target port.
  Either allow Docker to assign a random high-numbered port (by leaving off the
  `published`), or ensure that only a single instance of the service runs on a
  given node, by using a global service rather than a replicated one, or by
  using placement constraints.
@z

@x
To bypass the routing mesh, you must use the long `--publish` service and
set `mode` to `host`. If you omit the `mode` key or set it to `ingress`, the
routing mesh is used. The following command creates a global service using
`host` mode and bypassing the routing mesh.
@y
To bypass the routing mesh, you must use the long `--publish` service and
set `mode` to `host`. If you omit the `mode` key or set it to `ingress`, the
routing mesh is used. The following command creates a global service using
`host` mode and bypassing the routing mesh.
@z

@x
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53,protocol=udp,mode=host \
  --mode global \
  dns-cache
```
@y
```console
$ docker service create --name dns-cache \
  --publish published=53,target=53,protocol=udp,mode=host \
  --mode global \
  dns-cache
```
@z

@x
## Configure an external load balancer
@y
## Configure an external load balancer
@z

@x
You can configure an external load balancer for swarm services, either in
combination with the routing mesh or without using the routing mesh at all.
@y
You can configure an external load balancer for swarm services, either in
combination with the routing mesh or without using the routing mesh at all.
@z

@x
### Using the routing mesh
@y
### Using the routing mesh
@z

@x
You can configure an external load balancer to route requests to a swarm
service. For example, you could configure [HAProxy](https://www.haproxy.org) to
balance requests to an nginx service published to port 8080.
@y
You can configure an external load balancer to route requests to a swarm
service. For example, you could configure [HAProxy](https://www.haproxy.org) to
balance requests to an nginx service published to port 8080.
@z

@x
![Ingress with external load balancer image](images/ingress-lb.webp)
@y
![Ingress with external load balancer image](images/ingress-lb.webp)
@z

@x
In this case, port 8080 must be open between the load balancer and the nodes in
the swarm. The swarm nodes can reside on a private network that is accessible to
the proxy server, but that is not publicly accessible.
@y
In this case, port 8080 must be open between the load balancer and the nodes in
the swarm. The swarm nodes can reside on a private network that is accessible to
the proxy server, but that is not publicly accessible.
@z

@x
You can configure the load balancer to balance requests between every node in
the swarm even if there are no tasks scheduled on the node. For example, you
could have the following HAProxy configuration in `/etc/haproxy/haproxy.cfg`:
@y
You can configure the load balancer to balance requests between every node in
the swarm even if there are no tasks scheduled on the node. For example, you
could have the following HAProxy configuration in `/etc/haproxy/haproxy.cfg`:
@z

@x
```bash
global
        log /dev/log    local0
        log /dev/log    local1 notice
...snip...
@y
```bash
global
        log /dev/log    local0
        log /dev/log    local1 notice
...snip...
@z

@x
# Configure HAProxy to listen on port 80
frontend http_front
   bind *:80
   stats uri /haproxy?stats
   default_backend http_back
@y
# Configure HAProxy to listen on port 80
frontend http_front
   bind *:80
   stats uri /haproxy?stats
   default_backend http_back
@z

@x
# Configure HAProxy to route requests to swarm nodes on port 8080
backend http_back
   balance roundrobin
   server node1 192.168.99.100:8080 check
   server node2 192.168.99.101:8080 check
   server node3 192.168.99.102:8080 check
```
@y
# Configure HAProxy to route requests to swarm nodes on port 8080
backend http_back
   balance roundrobin
   server node1 192.168.99.100:8080 check
   server node2 192.168.99.101:8080 check
   server node3 192.168.99.102:8080 check
```
@z

@x
When you access the HAProxy load balancer on port 80, it forwards requests to
nodes in the swarm. The swarm routing mesh routes the request to an active task.
If, for any reason the swarm scheduler dispatches tasks to different nodes, you
don't need to reconfigure the load balancer.
@y
When you access the HAProxy load balancer on port 80, it forwards requests to
nodes in the swarm. The swarm routing mesh routes the request to an active task.
If, for any reason the swarm scheduler dispatches tasks to different nodes, you
don't need to reconfigure the load balancer.
@z

@x
You can configure any type of load balancer to route requests to swarm nodes.
To learn more about HAProxy, see the [HAProxy documentation](https://cbonte.github.io/haproxy-dconv/).
@y
You can configure any type of load balancer to route requests to swarm nodes.
To learn more about HAProxy, see the [HAProxy documentation](https://cbonte.github.io/haproxy-dconv/).
@z

@x
### Without the routing mesh
@y
### Without the routing mesh
@z

@x
To use an external load balancer without the routing mesh, set `--endpoint-mode`
to `dnsrr` instead of the default value of `vip`. In this case, there is not a
single virtual IP. Instead, Docker sets up DNS entries for the service such that
a DNS query for the service name returns a list of IP addresses, and the client
connects directly to one of these.
@y
To use an external load balancer without the routing mesh, set `--endpoint-mode`
to `dnsrr` instead of the default value of `vip`. In this case, there is not a
single virtual IP. Instead, Docker sets up DNS entries for the service such that
a DNS query for the service name returns a list of IP addresses, and the client
connects directly to one of these.
@z

@x
You can't use `--endpoint-mode dnsrr` together with `--publish mode=ingress`.
You must run your own load balancer in front of the service. A DNS query for
the service name on the Docker host returns a list of IP addresses for the
nodes running the service. Configure your load balancer to consume this list
and balance the traffic across the nodes.
See [Configure service discovery](networking.md#configure-service-discovery).
@y
You can't use `--endpoint-mode dnsrr` together with `--publish mode=ingress`.
You must run your own load balancer in front of the service. A DNS query for
the service name on the Docker host returns a list of IP addresses for the
nodes running the service. Configure your load balancer to consume this list
and balance the traffic across the nodes.
See [Configure service discovery](networking.md#configure-service-discovery).
@z

@x
## Learn more
@y
## Learn more
@z

@x
* [Deploy services to a swarm](services.md)
@y
* [Deploy services to a swarm](services.md)
@z
