%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Networking with overlay networks
description: Tutorials for networking with swarm services and standalone containers
  on multiple Docker daemons
keywords: networking, bridge, routing, ports, swarm, overlay
aliases:
- /engine/userguide/networking/get-started-overlay/
---
@y
---
title: Networking with overlay networks
description: Tutorials for networking with swarm services and standalone containers
  on multiple Docker daemons
keywords: networking, bridge, routing, ports, swarm, overlay
aliases:
- /engine/userguide/networking/get-started-overlay/
---
@z

@x
This series of tutorials deals with networking for swarm services.
For networking with standalone containers, see
[Networking with standalone containers](network-tutorial-standalone.md). If you need to
learn more about Docker networking in general, see the [overview](index.md).
@y
This series of tutorials deals with networking for swarm services.
For networking with standalone containers, see
[Networking with standalone containers](network-tutorial-standalone.md). If you need to
learn more about Docker networking in general, see the [overview](index.md).
@z

@x
This topic includes four different tutorials. You can run each of them on
Linux, Windows, or a Mac, but for the last two, you need a second Docker
host running elsewhere.
@y
This topic includes four different tutorials. You can run each of them on
Linux, Windows, or a Mac, but for the last two, you need a second Docker
host running elsewhere.
@z

@x
- [Use the default overlay network](#use-the-default-overlay-network) demonstrates
  how to use the default overlay network that Docker sets up for you
  automatically when you initialize or join a swarm. This network is not the
  best choice for production systems.
@y
- [Use the default overlay network](#use-the-default-overlay-network) demonstrates
  how to use the default overlay network that Docker sets up for you
  automatically when you initialize or join a swarm. This network is not the
  best choice for production systems.
@z

@x
- [Use user-defined overlay networks](#use-a-user-defined-overlay-network) shows
  how to create and use your own custom overlay networks, to connect services.
  This is recommended for services running in production.
@y
- [Use user-defined overlay networks](#use-a-user-defined-overlay-network) shows
  how to create and use your own custom overlay networks, to connect services.
  This is recommended for services running in production.
@z

@x
- [Use an overlay network for standalone containers](#use-an-overlay-network-for-standalone-containers)
  shows how to communicate between standalone containers on different Docker
  daemons using an overlay network.
@y
- [Use an overlay network for standalone containers](#use-an-overlay-network-for-standalone-containers)
  shows how to communicate between standalone containers on different Docker
  daemons using an overlay network.
@z

@x
- [Communicate between a container and a swarm service](#communicate-between-a-container-and-a-swarm-service)
  sets up communication between a standalone container and a swarm service,
  using an attachable overlay network.
@y
- [Communicate between a container and a swarm service](#communicate-between-a-container-and-a-swarm-service)
  sets up communication between a standalone container and a swarm service,
  using an attachable overlay network.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
These require you to have at least a single-node swarm, which means that
you have started Docker and run `docker swarm init` on the host. You can run
the examples on a multi-node swarm as well.
@y
These require you to have at least a single-node swarm, which means that
you have started Docker and run `docker swarm init` on the host. You can run
the examples on a multi-node swarm as well.
@z

@x
## Use the default overlay network
@y
## Use the default overlay network
@z

@x
In this example, you start an `alpine` service and examine the characteristics
of the network from the point of view of the individual service containers.
@y
In this example, you start an `alpine` service and examine the characteristics
of the network from the point of view of the individual service containers.
@z

@x
This tutorial does not go into operation-system-specific details about how
overlay networks are implemented, but focuses on how the overlay functions from
the point of view of a service.
@y
This tutorial does not go into operation-system-specific details about how
overlay networks are implemented, but focuses on how the overlay functions from
the point of view of a service.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
This tutorial requires three physical or virtual Docker hosts which can all
communicate with one another. This tutorial assumes that the three hosts are
running on the same network with no firewall involved.
@y
This tutorial requires three physical or virtual Docker hosts which can all
communicate with one another. This tutorial assumes that the three hosts are
running on the same network with no firewall involved.
@z

@x
These hosts will be referred to as `manager`, `worker-1`, and `worker-2`. The
`manager` host will function as both a manager and a worker, which means it can
both run service tasks and manage the swarm. `worker-1` and `worker-2` will
function as workers only,
@y
These hosts will be referred to as `manager`, `worker-1`, and `worker-2`. The
`manager` host will function as both a manager and a worker, which means it can
both run service tasks and manage the swarm. `worker-1` and `worker-2` will
function as workers only,
@z

@x
If you don't have three hosts handy, an easy solution is to set up three
Ubuntu hosts on a cloud provider such as Amazon EC2, all on the same network
with all communications allowed to all hosts on that network (using a mechanism
such as EC2 security groups), and then to follow the
[installation instructions for Docker Engine - Community on Ubuntu](../engine/install/ubuntu.md).
@y
If you don't have three hosts handy, an easy solution is to set up three
Ubuntu hosts on a cloud provider such as Amazon EC2, all on the same network
with all communications allowed to all hosts on that network (using a mechanism
such as EC2 security groups), and then to follow the
[installation instructions for Docker Engine - Community on Ubuntu](../engine/install/ubuntu.md).
@z

@x
### Walkthrough
@y
### Walkthrough
@z

@x
#### Create the swarm
@y
#### Create the swarm
@z

@x
At the end of this procedure, all three Docker hosts will be joined to the swarm
and will be connected together using an overlay network called `ingress`.
@y
At the end of this procedure, all three Docker hosts will be joined to the swarm
and will be connected together using an overlay network called `ingress`.
@z

@x
1.  On `manager`. initialize the swarm. If the host only has one network
    interface, the `--advertise-addr` flag is optional.
@y
1.  On `manager`. initialize the swarm. If the host only has one network
    interface, the `--advertise-addr` flag is optional.
@z

@x
    ```console
    $ docker swarm init --advertise-addr=<IP-ADDRESS-OF-MANAGER>
    ```
@y
    ```console
    $ docker swarm init --advertise-addr=<IP-ADDRESS-OF-MANAGER>
    ```
@z

@x
    Make a note of the text that is printed, as this contains the token that
    you will use to join `worker-1` and `worker-2` to the swarm. It is a good
    idea to store the token in a password manager.
@y
    Make a note of the text that is printed, as this contains the token that
    you will use to join `worker-1` and `worker-2` to the swarm. It is a good
    idea to store the token in a password manager.
@z

@x
2.  On `worker-1`, join the swarm. If the host only has one network interface,
    the `--advertise-addr` flag is optional.
@y
2.  On `worker-1`, join the swarm. If the host only has one network interface,
    the `--advertise-addr` flag is optional.
@z

@x
    ```console
    $ docker swarm join --token <TOKEN> \
      --advertise-addr <IP-ADDRESS-OF-WORKER-1> \
      <IP-ADDRESS-OF-MANAGER>:2377
    ```
@y
    ```console
    $ docker swarm join --token <TOKEN> \
      --advertise-addr <IP-ADDRESS-OF-WORKER-1> \
      <IP-ADDRESS-OF-MANAGER>:2377
    ```
@z

@x
3.  On `worker-2`, join the swarm. If the host only has one network interface,
    the `--advertise-addr` flag is optional.
@y
3.  On `worker-2`, join the swarm. If the host only has one network interface,
    the `--advertise-addr` flag is optional.
@z

@x
    ```console
    $ docker swarm join --token <TOKEN> \
      --advertise-addr <IP-ADDRESS-OF-WORKER-2> \
      <IP-ADDRESS-OF-MANAGER>:2377
    ```
@y
    ```console
    $ docker swarm join --token <TOKEN> \
      --advertise-addr <IP-ADDRESS-OF-WORKER-2> \
      <IP-ADDRESS-OF-MANAGER>:2377
    ```
@z

@x
4.  On `manager`, list all the nodes. This command can only be done from a
    manager.
@y
4.  On `manager`, list all the nodes. This command can only be done from a
    manager.
@z

@x
    ```console
    $ docker node ls
@y
    ```console
    $ docker node ls
@z

@x
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    d68ace5iraw6whp7llvgjpu48 *   ip-172-31-34-146    Ready               Active              Leader
    nvp5rwavvb8lhdggo8fcf7plg     ip-172-31-35-151    Ready               Active
    ouvx2l7qfcxisoyms8mtkgahw     ip-172-31-36-89     Ready               Active
    ```
@y
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    d68ace5iraw6whp7llvgjpu48 *   ip-172-31-34-146    Ready               Active              Leader
    nvp5rwavvb8lhdggo8fcf7plg     ip-172-31-35-151    Ready               Active
    ouvx2l7qfcxisoyms8mtkgahw     ip-172-31-36-89     Ready               Active
    ```
@z

@x
    You can also use the `--filter` flag to filter by role:
@y
    You can also use the `--filter` flag to filter by role:
@z

@x
    ```console
    $ docker node ls --filter role=manager
@y
    ```console
    $ docker node ls --filter role=manager
@z

@x
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    d68ace5iraw6whp7llvgjpu48 *   ip-172-31-34-146    Ready               Active              Leader
@y
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    d68ace5iraw6whp7llvgjpu48 *   ip-172-31-34-146    Ready               Active              Leader
@z

@x
    $ docker node ls --filter role=worker
@y
    $ docker node ls --filter role=worker
@z

@x
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    nvp5rwavvb8lhdggo8fcf7plg     ip-172-31-35-151    Ready               Active
    ouvx2l7qfcxisoyms8mtkgahw     ip-172-31-36-89     Ready               Active
    ```
@y
    ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    nvp5rwavvb8lhdggo8fcf7plg     ip-172-31-35-151    Ready               Active
    ouvx2l7qfcxisoyms8mtkgahw     ip-172-31-36-89     Ready               Active
    ```
@z

@x
5.  List the Docker networks on `manager`, `worker-1`, and `worker-2` and notice
    that each of them now has an overlay network called `ingress` and a bridge
    network called `docker_gwbridge`. Only the listing for `manager` is shown
    here:
@y
5.  List the Docker networks on `manager`, `worker-1`, and `worker-2` and notice
    that each of them now has an overlay network called `ingress` and a bridge
    network called `docker_gwbridge`. Only the listing for `manager` is shown
    here:
@z

@x
    ```console
    $ docker network ls
@y
    ```console
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    495c570066be        bridge              bridge              local
    961c6cae9945        docker_gwbridge     bridge              local
    ff35ceda3643        host                host                local
    trtnl4tqnc3n        ingress             overlay             swarm
    c8357deec9cb        none                null                local
    ```
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    495c570066be        bridge              bridge              local
    961c6cae9945        docker_gwbridge     bridge              local
    ff35ceda3643        host                host                local
    trtnl4tqnc3n        ingress             overlay             swarm
    c8357deec9cb        none                null                local
    ```
@z

@x
The `docker_gwbridge` connects the `ingress` network to the Docker host's
network interface so that traffic can flow to and from swarm managers and
workers. If you create swarm services and do not specify a network, they are
connected to the `ingress` network. It is recommended that you use separate
overlay networks for each application or group of applications which will work
together. In the next procedure, you will create two overlay networks and
connect a service to each of them.
@y
The `docker_gwbridge` connects the `ingress` network to the Docker host's
network interface so that traffic can flow to and from swarm managers and
workers. If you create swarm services and do not specify a network, they are
connected to the `ingress` network. It is recommended that you use separate
overlay networks for each application or group of applications which will work
together. In the next procedure, you will create two overlay networks and
connect a service to each of them.
@z

@x
#### Create the services
@y
#### Create the services
@z

@x
1.  On `manager`, create a new overlay network called `nginx-net`:
@y
1.  On `manager`, create a new overlay network called `nginx-net`:
@z

@x
    ```console
    $ docker network create -d overlay nginx-net
    ```
@y
    ```console
    $ docker network create -d overlay nginx-net
    ```
@z

@x
    You don't need to create the overlay network on the other nodes, because it
    will be automatically created when one of those nodes starts running a
    service task which requires it.
@y
    You don't need to create the overlay network on the other nodes, because it
    will be automatically created when one of those nodes starts running a
    service task which requires it.
@z

@x
2.  On `manager`, create a 5-replica Nginx service connected to `nginx-net`. The
    service will publish port 80 to the outside world. All of the service
    task containers can communicate with each other without opening any ports.
@y
2.  On `manager`, create a 5-replica Nginx service connected to `nginx-net`. The
    service will publish port 80 to the outside world. All of the service
    task containers can communicate with each other without opening any ports.
@z

@x
    > **Note**
    >
    > Services can only be created on a manager.
@y
    > **Note**
    >
    > Services can only be created on a manager.
@z

@x
    ```console
    $ docker service create \
      --name my-nginx \
      --publish target=80,published=80 \
      --replicas=5 \
      --network nginx-net \
      nginx
      ```
@y
    ```console
    $ docker service create \
      --name my-nginx \
      --publish target=80,published=80 \
      --replicas=5 \
      --network nginx-net \
      nginx
      ```
@z

@x
      The default publish mode of `ingress`, which is used when you do not
      specify a `mode` for the `--publish` flag, means that if you browse to
      port 80 on `manager`, `worker-1`, or `worker-2`, you will be connected to
      port 80 on one of the 5 service tasks, even if no tasks are currently
      running on the node you browse to. If you want to publish the port using
      `host` mode, you can add `mode=host` to the `--publish` output. However,
      you should also use `--mode global` instead of `--replicas=5` in this case,
      since only one service task can bind a given port on a given node.
@y
      The default publish mode of `ingress`, which is used when you do not
      specify a `mode` for the `--publish` flag, means that if you browse to
      port 80 on `manager`, `worker-1`, or `worker-2`, you will be connected to
      port 80 on one of the 5 service tasks, even if no tasks are currently
      running on the node you browse to. If you want to publish the port using
      `host` mode, you can add `mode=host` to the `--publish` output. However,
      you should also use `--mode global` instead of `--replicas=5` in this case,
      since only one service task can bind a given port on a given node.
@z

@x
3.  Run `docker service ls` to monitor the progress of service bring-up, which
    may take a few seconds.
@y
3.  Run `docker service ls` to monitor the progress of service bring-up, which
    may take a few seconds.
@z

@x
4.  Inspect the `nginx-net` network on `manager`, `worker-1`, and `worker-2`.
    Remember that you did not need to create it manually on `worker-1` and
    `worker-2` because Docker created it for you. The output will be long, but
    notice the `Containers` and `Peers` sections. `Containers` lists all
    service tasks (or standalone containers) connected to the overlay network
    from that host.
@y
4.  Inspect the `nginx-net` network on `manager`, `worker-1`, and `worker-2`.
    Remember that you did not need to create it manually on `worker-1` and
    `worker-2` because Docker created it for you. The output will be long, but
    notice the `Containers` and `Peers` sections. `Containers` lists all
    service tasks (or standalone containers) connected to the overlay network
    from that host.
@z

@x
5.  From `manager`, inspect the service using `docker service inspect my-nginx`
    and notice the information about the ports and endpoints used by the
    service.
@y
5.  From `manager`, inspect the service using `docker service inspect my-nginx`
    and notice the information about the ports and endpoints used by the
    service.
@z

@x
6.  Create a new network `nginx-net-2`, then update the service to use this
    network instead of `nginx-net`:
@y
6.  Create a new network `nginx-net-2`, then update the service to use this
    network instead of `nginx-net`:
@z

@x
    ```console
    $ docker network create -d overlay nginx-net-2
    ```
@y
    ```console
    $ docker network create -d overlay nginx-net-2
    ```
@z

@x
    ```console
    $ docker service update \
      --network-add nginx-net-2 \
      --network-rm nginx-net \
      my-nginx
    ```
@y
    ```console
    $ docker service update \
      --network-add nginx-net-2 \
      --network-rm nginx-net \
      my-nginx
    ```
@z

@x
7.  Run `docker service ls` to verify that the service has been updated and all
    tasks have been redeployed. Run `docker network inspect nginx-net` to verify
    that no containers are connected to it. Run the same command for
    `nginx-net-2` and notice that all the service task containers are connected
    to it.
@y
7.  Run `docker service ls` to verify that the service has been updated and all
    tasks have been redeployed. Run `docker network inspect nginx-net` to verify
    that no containers are connected to it. Run the same command for
    `nginx-net-2` and notice that all the service task containers are connected
    to it.
@z

@x
    > **Note**
    >
    > Even though overlay networks are automatically created on swarm
    > worker nodes as needed, they are not automatically removed.
@y
    > **Note**
    >
    > Even though overlay networks are automatically created on swarm
    > worker nodes as needed, they are not automatically removed.
@z

@x
8.  Clean up the service and the networks. From `manager`, run the following
    commands. The manager will direct the workers to remove the networks
    automatically.
@y
8.  Clean up the service and the networks. From `manager`, run the following
    commands. The manager will direct the workers to remove the networks
    automatically.
@z

@x
    ```console
    $ docker service rm my-nginx
    $ docker network rm nginx-net nginx-net-2
    ```
@y
    ```console
    $ docker service rm my-nginx
    $ docker network rm nginx-net nginx-net-2
    ```
@z

@x
## Use a user-defined overlay network
@y
## Use a user-defined overlay network
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
This tutorial assumes the swarm is already set up and you are on a manager.
@y
This tutorial assumes the swarm is already set up and you are on a manager.
@z

@x
### Walkthrough
@y
### Walkthrough
@z

@x
1.  Create the user-defined overlay network.
@y
1.  Create the user-defined overlay network.
@z

@x
    ```console
    $ docker network create -d overlay my-overlay
    ```
@y
    ```console
    $ docker network create -d overlay my-overlay
    ```
@z

@x
2.  Start a service using the overlay network and publishing port 80 to port
    8080 on the Docker host.
@y
2.  Start a service using the overlay network and publishing port 80 to port
    8080 on the Docker host.
@z

@x
    ```console
    $ docker service create \
      --name my-nginx \
      --network my-overlay \
      --replicas 1 \
      --publish published=8080,target=80 \
      nginx:latest
    ```
@y
    ```console
    $ docker service create \
      --name my-nginx \
      --network my-overlay \
      --replicas 1 \
      --publish published=8080,target=80 \
      nginx:latest
    ```
@z

@x
3.  Run `docker network inspect my-overlay` and verify that the `my-nginx`
    service task is connected to it, by looking at the `Containers` section.
@y
3.  Run `docker network inspect my-overlay` and verify that the `my-nginx`
    service task is connected to it, by looking at the `Containers` section.
@z

@x
4.  Remove the service and the network.
@y
4.  Remove the service and the network.
@z

@x
    ```console
    $ docker service rm my-nginx
@y
    ```console
    $ docker service rm my-nginx
@z

@x
    $ docker network rm my-overlay
    ```
@y
    $ docker network rm my-overlay
    ```
@z

@x
## Use an overlay network for standalone containers
@y
## Use an overlay network for standalone containers
@z

@x
This example demonstrates DNS container discovery -- specifically, how to
communicate between standalone containers on different Docker daemons using an
overlay network. Steps are:
@y
This example demonstrates DNS container discovery -- specifically, how to
communicate between standalone containers on different Docker daemons using an
overlay network. Steps are:
@z

@x
- On `host1`, initialize the node as a swarm (manager).
- On `host2`, join the node to the swarm (worker).
- On `host1`, create an attachable overlay network (`test-net`).
- On `host1`, run an interactive [alpine](https://hub.docker.com/_/alpine/) container (`alpine1`) on `test-net`.
- On `host2`, run an interactive, and detached, [alpine](https://hub.docker.com/_/alpine/) container (`alpine2`) on `test-net`.
- On `host1`, from within a session of `alpine1`, ping `alpine2`.
@y
- On `host1`, initialize the node as a swarm (manager).
- On `host2`, join the node to the swarm (worker).
- On `host1`, create an attachable overlay network (`test-net`).
- On `host1`, run an interactive [alpine](https://hub.docker.com/_/alpine/) container (`alpine1`) on `test-net`.
- On `host2`, run an interactive, and detached, [alpine](https://hub.docker.com/_/alpine/) container (`alpine2`) on `test-net`.
- On `host1`, from within a session of `alpine1`, ping `alpine2`.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
For this test, you need two different Docker hosts that can communicate with
each other. Each host must have the following ports open between the two Docker
hosts:
@y
For this test, you need two different Docker hosts that can communicate with
each other. Each host must have the following ports open between the two Docker
hosts:
@z

@x
- TCP port 2377
- TCP and UDP port 7946
- UDP port 4789
@y
- TCP port 2377
- TCP and UDP port 7946
- UDP port 4789
@z

@x
One easy way to set this up is to have two VMs (either local or on a cloud
provider like AWS), each with Docker installed and running. If you're using AWS
or a similar cloud computing platform, the easiest configuration is to use a
security group that opens all incoming ports between the two hosts and the SSH
port from your client's IP address.
@y
One easy way to set this up is to have two VMs (either local or on a cloud
provider like AWS), each with Docker installed and running. If you're using AWS
or a similar cloud computing platform, the easiest configuration is to use a
security group that opens all incoming ports between the two hosts and the SSH
port from your client's IP address.
@z

@x
This example refers to the two nodes in our swarm as `host1` and `host2`. This
example also uses Linux hosts, but the same commands work on Windows.
@y
This example refers to the two nodes in our swarm as `host1` and `host2`. This
example also uses Linux hosts, but the same commands work on Windows.
@z

@x
### Walk-through
@y
### Walk-through
@z

@x
1.  Set up the swarm.
@y
1.  Set up the swarm.
@z

@x
    a.  On `host1`, initialize a swarm (and if prompted, use `--advertise-addr`
        to specify the IP address for the interface that communicates with other
        hosts in the swarm, for instance, the private IP address on AWS):
@y
    a.  On `host1`, initialize a swarm (and if prompted, use `--advertise-addr`
        to specify the IP address for the interface that communicates with other
        hosts in the swarm, for instance, the private IP address on AWS):
@z

@x
    ```console
    $ docker swarm init
    Swarm initialized: current node (vz1mm9am11qcmo979tlrlox42) is now a manager.
@y
    ```console
    $ docker swarm init
    Swarm initialized: current node (vz1mm9am11qcmo979tlrlox42) is now a manager.
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join --token SWMTKN-1-5g90q48weqrtqryq4kj6ow0e8xm9wmv9o6vgqc5j320ymybd5c-8ex8j0bc40s6hgvy5ui5gl4gy 172.31.47.252:2377
@y
        docker swarm join --token SWMTKN-1-5g90q48weqrtqryq4kj6ow0e8xm9wmv9o6vgqc5j320ymybd5c-8ex8j0bc40s6hgvy5ui5gl4gy 172.31.47.252:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
    b.  On `host2`, join the swarm as instructed above:
@y
    b.  On `host2`, join the swarm as instructed above:
@z

@x
    ```console
    $ docker swarm join --token <your_token> <your_ip_address>:2377
    This node joined a swarm as a worker.
    ```
@y
    ```console
    $ docker swarm join --token <your_token> <your_ip_address>:2377
    This node joined a swarm as a worker.
    ```
@z

@x
    If the node fails to join the swarm, the `docker swarm join` command times
    out. To resolve, run `docker swarm leave --force` on `host2`, verify your
    network and firewall settings, and try again.
@y
    If the node fails to join the swarm, the `docker swarm join` command times
    out. To resolve, run `docker swarm leave --force` on `host2`, verify your
    network and firewall settings, and try again.
@z

@x
2.  On `host1`, create an attachable overlay network called `test-net`:
@y
2.  On `host1`, create an attachable overlay network called `test-net`:
@z

@x
    ```console
    $ docker network create --driver=overlay --attachable test-net
    uqsof8phj3ak0rq9k86zta6ht
    ```
@y
    ```console
    $ docker network create --driver=overlay --attachable test-net
    uqsof8phj3ak0rq9k86zta6ht
    ```
@z

@x
    > Notice the returned **NETWORK ID** -- you will see it again when you connect to it from `host2`.
@y
    > Notice the returned **NETWORK ID** -- you will see it again when you connect to it from `host2`.
@z

@x
3.  On `host1`, start an interactive (`-it`) container (`alpine1`) that connects to `test-net`:
@y
3.  On `host1`, start an interactive (`-it`) container (`alpine1`) that connects to `test-net`:
@z

@x
    ```console
    $ docker run -it --name alpine1 --network test-net alpine
    / #
    ```
@y
    ```console
    $ docker run -it --name alpine1 --network test-net alpine
    / #
    ```
@z

@x
4.  On `host2`, list the available networks -- notice that `test-net` does not yet exist:
@y
4.  On `host2`, list the available networks -- notice that `test-net` does not yet exist:
@z

@x
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    ec299350b504        bridge              bridge              local
    66e77d0d0e9a        docker_gwbridge     bridge              local
    9f6ae26ccb82        host                host                local
    omvdxqrda80z        ingress             overlay             swarm
    b65c952a4b2b        none                null                local
    ```
@y
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    ec299350b504        bridge              bridge              local
    66e77d0d0e9a        docker_gwbridge     bridge              local
    9f6ae26ccb82        host                host                local
    omvdxqrda80z        ingress             overlay             swarm
    b65c952a4b2b        none                null                local
    ```
@z

@x
5.  On `host2`, start a detached (`-d`) and interactive (`-it`) container (`alpine2`) that connects to `test-net`:
@y
5.  On `host2`, start a detached (`-d`) and interactive (`-it`) container (`alpine2`) that connects to `test-net`:
@z

@x
    ```console
    $ docker run -dit --name alpine2 --network test-net alpine
    fb635f5ece59563e7b8b99556f816d24e6949a5f6a5b1fbd92ca244db17a4342
    ```
@y
    ```console
    $ docker run -dit --name alpine2 --network test-net alpine
    fb635f5ece59563e7b8b99556f816d24e6949a5f6a5b1fbd92ca244db17a4342
    ```
@z

@x
    > **Note**
    >
    > Automatic DNS container discovery only works with unique container names.
@y
    > **Note**
    >
    > Automatic DNS container discovery only works with unique container names.
@z

@x
6. On `host2`, verify that `test-net` was created (and has the same NETWORK ID as `test-net` on `host1`):
@y
6. On `host2`, verify that `test-net` was created (and has the same NETWORK ID as `test-net` on `host1`):
@z

@x
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    ...
    uqsof8phj3ak        test-net            overlay             swarm
    ```
@y
    ```console
    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    ...
    uqsof8phj3ak        test-net            overlay             swarm
    ```
@z

@x
7.  On `host1`, ping `alpine2` within the interactive terminal of `alpine1`:
@y
7.  On `host1`, ping `alpine2` within the interactive terminal of `alpine1`:
@z

@x
    ```console
    / # ping -c 2 alpine2
    PING alpine2 (10.0.0.5): 56 data bytes
    64 bytes from 10.0.0.5: seq=0 ttl=64 time=0.600 ms
    64 bytes from 10.0.0.5: seq=1 ttl=64 time=0.555 ms
@y
    ```console
    / # ping -c 2 alpine2
    PING alpine2 (10.0.0.5): 56 data bytes
    64 bytes from 10.0.0.5: seq=0 ttl=64 time=0.600 ms
    64 bytes from 10.0.0.5: seq=1 ttl=64 time=0.555 ms
@z

@x
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.555/0.577/0.600 ms
    ```
@y
    --- alpine2 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.555/0.577/0.600 ms
    ```
@z

@x
    The two containers communicate with the overlay network connecting the two
    hosts. If you run another alpine container on `host2` that is _not detached_,
    you can ping `alpine1` from `host2` (and here we add the
    [remove option](/engine/reference/run/#clean-up---rm) for automatic container cleanup):
@y
    The two containers communicate with the overlay network connecting the two
    hosts. If you run another alpine container on `host2` that is _not detached_,
    you can ping `alpine1` from `host2` (and here we add the
    [remove option](/engine/reference/run/#clean-up---rm) for automatic container cleanup):
@z

@x
    ```sh
    $ docker run -it --rm --name alpine3 --network test-net alpine
    / # ping -c 2 alpine1
    / # exit
    ```
@y
    ```sh
    $ docker run -it --rm --name alpine3 --network test-net alpine
    / # ping -c 2 alpine1
    / # exit
    ```
@z

@x
8.  On `host1`, close the `alpine1` session (which also stops the container):
@y
8.  On `host1`, close the `alpine1` session (which also stops the container):
@z

@x
    ```console
    / # exit
    ```
@y
    ```console
    / # exit
    ```
@z

@x
9.  Clean up your containers and networks:
@y
9.  Clean up your containers and networks:
@z

@x
    You must stop and remove the containers on each host independently because
    Docker daemons operate independently and these are standalone containers.
    You only have to remove the network on `host1` because when you stop
    `alpine2` on `host2`, `test-net` disappears.
@y
    You must stop and remove the containers on each host independently because
    Docker daemons operate independently and these are standalone containers.
    You only have to remove the network on `host1` because when you stop
    `alpine2` on `host2`, `test-net` disappears.
@z

@x
    a.  On `host2`, stop `alpine2`, check that `test-net` was removed, then remove `alpine2`:
@y
    a.  On `host2`, stop `alpine2`, check that `test-net` was removed, then remove `alpine2`:
@z

@x
    ```console
    $ docker container stop alpine2
    $ docker network ls
    $ docker container rm alpine2
    ```
@y
    ```console
    $ docker container stop alpine2
    $ docker network ls
    $ docker container rm alpine2
    ```
@z

@x
    a.  On `host1`, remove `alpine1` and `test-net`:
@y
    a.  On `host1`, remove `alpine1` and `test-net`:
@z

@x
    ```console
    $ docker container rm alpine1
    $ docker network rm test-net
    ```
@y
    ```console
    $ docker container rm alpine1
    $ docker network rm test-net
    ```
@z

@x
## Communicate between a container and a swarm service
@y
## Communicate between a container and a swarm service
@z

@x
In this example, you start two different `alpine` containers on the same Docker
host and do some tests to understand how they communicate with each other. You
need to have Docker installed and running.
@y
In this example, you start two different `alpine` containers on the same Docker
host and do some tests to understand how they communicate with each other. You
need to have Docker installed and running.
@z

@x
1.  Open a terminal window. List current networks before you do anything else.
    Here's what you should see if you've never added a network or initialized a
    swarm on this Docker daemon. You may see different networks, but you should
    at least see these (the network IDs will be different):
@y
1.  Open a terminal window. List current networks before you do anything else.
    Here's what you should see if you've never added a network or initialized a
    swarm on this Docker daemon. You may see different networks, but you should
    at least see these (the network IDs will be different):
@z

@x
    ```console
    $ docker network ls
@y
    ```console
    $ docker network ls
@z

@x
    NETWORK ID          NAME                DRIVER              SCOPE
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@y
    NETWORK ID          NAME                DRIVER              SCOPE
    17e324f45964        bridge              bridge              local
    6ed54d316334        host                host                local
    7092879f2cc8        none                null                local
    ```
@z

@x
    The default `bridge` network is listed, along with `host` and `none`. The
    latter two are not fully-fledged networks, but are used to start a container
    connected directly to the Docker daemon host's networking stack, or to start
    a container with no network devices. This tutorial will connect two
    containers to the `bridge` network.
@y
    The default `bridge` network is listed, along with `host` and `none`. The
    latter two are not fully-fledged networks, but are used to start a container
    connected directly to the Docker daemon host's networking stack, or to start
    a container with no network devices. This tutorial will connect two
    containers to the `bridge` network.
@z

@x
2.  Start two `alpine` containers running `ash`, which is Alpine's default shell
    rather than `bash`. The `-dit` flags mean to start the container detached
    (in the background), interactive (with the ability to type into it), and
    with a TTY (so you can see the input and output). Since you are starting it
    detached, you won't be connected to the container right away. Instead, the
    container's ID will be printed. Because you have not specified any
    `--network` flags, the containers connect to the default `bridge` network.
@y
2.  Start two `alpine` containers running `ash`, which is Alpine's default shell
    rather than `bash`. The `-dit` flags mean to start the container detached
    (in the background), interactive (with the ability to type into it), and
    with a TTY (so you can see the input and output). Since you are starting it
    detached, you won't be connected to the container right away. Instead, the
    container's ID will be printed. Because you have not specified any
    `--network` flags, the containers connect to the default `bridge` network.
@z

@x
    ```console
    $ docker run -dit --name alpine1 alpine ash
@y
    ```console
    $ docker run -dit --name alpine1 alpine ash
@z

@x
    $ docker run -dit --name alpine2 alpine ash
    ```
@y
    $ docker run -dit --name alpine2 alpine ash
    ```
@z

@x
    Check that both containers are actually started:
@y
    Check that both containers are actually started:
@z

@x
    ```console
    $ docker container ls
@y
    ```console
    $ docker container ls
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    602dbf1edc81        alpine              "ash"               4 seconds ago       Up 3 seconds                            alpine2
    da33b7aa74b0        alpine              "ash"               17 seconds ago      Up 16 seconds                           alpine1
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    602dbf1edc81        alpine              "ash"               4 seconds ago       Up 3 seconds                            alpine2
    da33b7aa74b0        alpine              "ash"               17 seconds ago      Up 16 seconds                           alpine1
    ```
@z

@x
3.  Inspect the `bridge` network to see what containers are connected to it.
@y
3.  Inspect the `bridge` network to see what containers are connected to it.
@z

@x
    ```console
    $ docker network inspect bridge
@y
    ```console
    $ docker network inspect bridge
@z

@x
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "602dbf1edc81813304b6cf0a647e65333dc6fe6ee6ed572dc0f686a3307c6a2c": {
                    "Name": "alpine2",
                    "EndpointID": "03b6aafb7ca4d7e531e292901b43719c0e34cc7eef565b38a6bf84acf50f38cd",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "da33b7aa74b0bf3bda3ebd502d404320ca112a268aafe05b4851d1e3312ed168": {
                    "Name": "alpine1",
                    "EndpointID": "46c044a645d6afc42ddd7857d19e9dcfb89ad790afb5c239a35ac0af5e8a5bc5",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@y
    [
        {
            "Name": "bridge",
            "Id": "17e324f459648a9baaea32b248d3884da102dde19396c25b30ec800068ce6b10",
            "Created": "2017-06-22T20:27:43.826654485Z",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": null,
                "Config": [
                    {
                        "Subnet": "172.17.0.0/16",
                        "Gateway": "172.17.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Containers": {
                "602dbf1edc81813304b6cf0a647e65333dc6fe6ee6ed572dc0f686a3307c6a2c": {
                    "Name": "alpine2",
                    "EndpointID": "03b6aafb7ca4d7e531e292901b43719c0e34cc7eef565b38a6bf84acf50f38cd",
                    "MacAddress": "02:42:ac:11:00:03",
                    "IPv4Address": "172.17.0.3/16",
                    "IPv6Address": ""
                },
                "da33b7aa74b0bf3bda3ebd502d404320ca112a268aafe05b4851d1e3312ed168": {
                    "Name": "alpine1",
                    "EndpointID": "46c044a645d6afc42ddd7857d19e9dcfb89ad790afb5c239a35ac0af5e8a5bc5",
                    "MacAddress": "02:42:ac:11:00:02",
                    "IPv4Address": "172.17.0.2/16",
                    "IPv6Address": ""
                }
            },
            "Options": {
                "com.docker.network.bridge.default_bridge": "true",
                "com.docker.network.bridge.enable_icc": "true",
                "com.docker.network.bridge.enable_ip_masquerade": "true",
                "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
                "com.docker.network.bridge.name": "docker0",
                "com.docker.network.driver.mtu": "1500"
            },
            "Labels": {}
        }
    ]
    ```
@z

@x
    Near the top, information about the `bridge` network is listed, including
    the IP address of the gateway between the Docker host and the `bridge`
    network (`172.17.0.1`). Under the `Containers` key, each connected container
    is listed, along with information about its IP address (`172.17.0.2` for
    `alpine1` and `172.17.0.3` for `alpine2`).
@y
    Near the top, information about the `bridge` network is listed, including
    the IP address of the gateway between the Docker host and the `bridge`
    network (`172.17.0.1`). Under the `Containers` key, each connected container
    is listed, along with information about its IP address (`172.17.0.2` for
    `alpine1` and `172.17.0.3` for `alpine2`).
@z

@x
4.  The containers are running in the background. Use the `docker attach`
    command to connect to `alpine1`.
@y
4.  The containers are running in the background. Use the `docker attach`
    command to connect to `alpine1`.
@z

@x
    ```console
    $ docker attach alpine1
@y
    ```console
    $ docker attach alpine1
@z

@x
    / #
    ```
@y
    / #
    ```
@z

@x
    The prompt changes to `#` to indicate that you are the `root` user within
    the container. Use the `ip addr show` command to show the network interfaces
    for `alpine1` as they look from within the container:
@y
    The prompt changes to `#` to indicate that you are the `root` user within
    the container. Use the `ip addr show` command to show the network interfaces
    for `alpine1` as they look from within the container:
@z

@x
    ```console
    # ip addr show
@y
    ```console
    # ip addr show
@z

@x
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    27: eth0@if28: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
        link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff
        inet 172.17.0.2/16 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fe80::42:acff:fe11:2/64 scope link
           valid_lft forever preferred_lft forever
    ```
@y
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    27: eth0@if28: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
        link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff
        inet 172.17.0.2/16 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fe80::42:acff:fe11:2/64 scope link
           valid_lft forever preferred_lft forever
    ```
@z

@x
    The first interface is the loopback device. Ignore it for now. Notice that
    the second interface has the IP address `172.17.0.2`, which is the same
    address shown for `alpine1` in the previous step.
@y
    The first interface is the loopback device. Ignore it for now. Notice that
    the second interface has the IP address `172.17.0.2`, which is the same
    address shown for `alpine1` in the previous step.
@z

@x
5.  From within `alpine1`, make sure you can connect to the internet by
    pinging `google.com`. The `-c 2` flag limits the command two two `ping`
    attempts.
@y
5.  From within `alpine1`, make sure you can connect to the internet by
    pinging `google.com`. The `-c 2` flag limits the command two two `ping`
    attempts.
@z

@x
    ```console
    # ping -c 2 google.com
@y
    ```console
    # ping -c 2 google.com
@z

@x
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.841 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.897 ms
@y
    PING google.com (172.217.3.174): 56 data bytes
    64 bytes from 172.217.3.174: seq=0 ttl=41 time=9.841 ms
    64 bytes from 172.217.3.174: seq=1 ttl=41 time=9.897 ms
@z

@x
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.841/9.869/9.897 ms
    ```
@y
    --- google.com ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 9.841/9.869/9.897 ms
    ```
@z

@x
6.  Now try to ping the second container. First, ping it by its IP address,
    `172.17.0.3`:
@y
6.  Now try to ping the second container. First, ping it by its IP address,
    `172.17.0.3`:
@z

@x
    ```console
    # ping -c 2 172.17.0.3
@y
    ```console
    # ping -c 2 172.17.0.3
@z

@x
    PING 172.17.0.3 (172.17.0.3): 56 data bytes
    64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.086 ms
    64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.094 ms
@y
    PING 172.17.0.3 (172.17.0.3): 56 data bytes
    64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.086 ms
    64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.094 ms
@z

@x
    --- 172.17.0.3 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.086/0.090/0.094 ms
    ```
@y
    --- 172.17.0.3 ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max = 0.086/0.090/0.094 ms
    ```
@z

@x
    This succeeds. Next, try pinging the `alpine2` container by container
    name. This will fail.
@y
    This succeeds. Next, try pinging the `alpine2` container by container
    name. This will fail.
@z

@x
    ```console
    # ping -c 2 alpine2
@y
    ```console
    # ping -c 2 alpine2
@z

@x
    ping: bad address 'alpine2'
    ```
@y
    ping: bad address 'alpine2'
    ```
@z

@x
7.  Detach from `alpine1` without stopping it by using the detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
    If you wish, attach to `alpine2` and repeat steps 4, 5, and 6 there,
    substituting `alpine1` for `alpine2`.
@y
7.  Detach from `alpine1` without stopping it by using the detach sequence,
    `CTRL` + `p` `CTRL` + `q` (hold down `CTRL` and type `p` followed by `q`).
    If you wish, attach to `alpine2` and repeat steps 4, 5, and 6 there,
    substituting `alpine1` for `alpine2`.
@z

@x
8.  Stop and remove both containers.
@y
8.  Stop and remove both containers.
@z

@x
    ```console
    $ docker container stop alpine1 alpine2
    $ docker container rm alpine1 alpine2
    ```
@y
    ```console
    $ docker container stop alpine1 alpine2
    $ docker container rm alpine1 alpine2
    ```
@z

@x
Remember, the default `bridge` network is not recommended for production. To
learn about user-defined bridge networks, continue to the
[next tutorial](network-tutorial-standalone.md#use-user-defined-bridge-networks).
@y
Remember, the default `bridge` network is not recommended for production. To
learn about user-defined bridge networks, continue to the
[next tutorial](network-tutorial-standalone.md#use-user-defined-bridge-networks).
@z

@x
## Other networking tutorials
@y
## Other networking tutorials
@z

@x
- [Host networking tutorial](network-tutorial-host.md)
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@y
- [Host networking tutorial](network-tutorial-host.md)
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@z
