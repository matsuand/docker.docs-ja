%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting Started tutorial for Docker Engine swarm mode
keywords: tutorial, cluster management, swarm mode
title: Getting started with swarm mode
toc_max: 4
---
@y
---
description: Getting Started tutorial for Docker Engine swarm mode
keywords: tutorial, cluster management, swarm mode
title: Getting started with swarm mode
toc_max: 4
---
@z

@x
This tutorial introduces you to the features of Docker Engine Swarm mode. You
may want to familiarize yourself with the [key concepts](../key-concepts.md)
before you begin.
@y
This tutorial introduces you to the features of Docker Engine Swarm mode. You
may want to familiarize yourself with the [key concepts](../key-concepts.md)
before you begin.
@z

@x
The tutorial guides you through the following activities:
@y
The tutorial guides you through the following activities:
@z

@x
* initializing a cluster of Docker Engines in swarm mode
* adding nodes to the swarm
* deploying application services to the swarm
* managing the swarm once you have everything running
@y
* initializing a cluster of Docker Engines in swarm mode
* adding nodes to the swarm
* deploying application services to the swarm
* managing the swarm once you have everything running
@z

@x
This tutorial uses Docker Engine CLI commands entered on the command line of a
terminal window.
@y
This tutorial uses Docker Engine CLI commands entered on the command line of a
terminal window.
@z

@x
If you are brand new to Docker, see [About Docker Engine](../../index.md).
@y
If you are brand new to Docker, see [About Docker Engine](../../index.md).
@z

@x
## Set up
@y
## Set up
@z

@x
To run this tutorial, you need the following:
@y
To run this tutorial, you need the following:
@z

@x
* [three Linux hosts which can communicate over a network, with Docker installed](#three-networked-host-machines)
* [the IP address of the manager machine](#the-ip-address-of-the-manager-machine)
* [open ports between the hosts](#open-protocols-and-ports-between-the-hosts)
@y
* [three Linux hosts which can communicate over a network, with Docker installed](#three-networked-host-machines)
* [the IP address of the manager machine](#the-ip-address-of-the-manager-machine)
* [open ports between the hosts](#open-protocols-and-ports-between-the-hosts)
@z

@x
### Three networked host machines
@y
### Three networked host machines
@z

@x
This tutorial requires three Linux hosts which have Docker installed and can
communicate over a network. These can be physical machines, virtual machines,
Amazon EC2 instances, or hosted in some other way. Check out
[Getting started - Swarms](../../../get-started/swarm-deploy.md#prerequisites)
for one possible set-up for the hosts.
@y
This tutorial requires three Linux hosts which have Docker installed and can
communicate over a network. These can be physical machines, virtual machines,
Amazon EC2 instances, or hosted in some other way. Check out
[Getting started - Swarms](../../../get-started/swarm-deploy.md#prerequisites)
for one possible set-up for the hosts.
@z

@x
One of these machines is a manager (called `manager1`) and two of them are
workers (`worker1` and `worker2`).
@y
One of these machines is a manager (called `manager1`) and two of them are
workers (`worker1` and `worker2`).
@z

@x
>**Note**: You can follow many of the tutorial steps to test single-node swarm
as well, in which case you need only one host. Multi-node commands do not
work, but you can initialize a swarm, create services, and scale them.
@y
>**Note**: You can follow many of the tutorial steps to test single-node swarm
as well, in which case you need only one host. Multi-node commands do not
work, but you can initialize a swarm, create services, and scale them.
@z

@x
#### Install Docker Engine on Linux machines
@y
#### Install Docker Engine on Linux machines
@z

@x
If you are using Linux based physical computers or cloud-provided computers as
hosts, simply follow the [Linux install instructions](../../install/index.md)
for your platform. Spin up the three machines, and you are ready. You can test both
single-node and multi-node swarm scenarios on Linux machines.
@y
If you are using Linux based physical computers or cloud-provided computers as
hosts, simply follow the [Linux install instructions](../../install/index.md)
for your platform. Spin up the three machines, and you are ready. You can test both
single-node and multi-node swarm scenarios on Linux machines.
@z

@x
### The IP address of the manager machine
@y
### The IP address of the manager machine
@z

@x
The IP address must be assigned to a network interface available to the host
operating system. All nodes in the swarm need to connect to the manager at
the IP address.
@y
The IP address must be assigned to a network interface available to the host
operating system. All nodes in the swarm need to connect to the manager at
the IP address.
@z

@x
Because other nodes contact the manager node on its IP address, you should use a
fixed IP address.
@y
Because other nodes contact the manager node on its IP address, you should use a
fixed IP address.
@z

@x
You can run `ifconfig` on Linux or macOS to see a list of the
available network interfaces.
@y
You can run `ifconfig` on Linux or macOS to see a list of the
available network interfaces.
@z

@x
The tutorial uses `manager1` : `192.168.99.100`.
@y
The tutorial uses `manager1` : `192.168.99.100`.
@z

@x
### Open protocols and ports between the hosts
@y
### Open protocols and ports between the hosts
@z

@x
The following ports must be available. On some systems, these ports are open by default.
@y
The following ports must be available. On some systems, these ports are open by default.
@z

@x
* Port `2377` TCP for communication with and between manager nodes
* Port `7946` TCP/UDP for overlay network node discovery
* Port `4789` UDP (configurable) for overlay network traffic
@y
* Port `2377` TCP for communication with and between manager nodes
* Port `7946` TCP/UDP for overlay network node discovery
* Port `4789` UDP (configurable) for overlay network traffic
@z

@x
If you plan on creating an overlay network with encryption (`--opt encrypted`),
you also need to ensure **IP protocol 50** (**IPSec ESP**) traffic is allowed.
@y
If you plan on creating an overlay network with encryption (`--opt encrypted`),
you also need to ensure **IP protocol 50** (**IPSec ESP**) traffic is allowed.
@z

@x
Port `4789` is the default value for the Swarm data path port, also known as the VXLAN port.
It is important to prevent any untrusted traffic from reaching this port, as VXLAN does not
provide authentication. This port should only be opened to a trusted network, and never at a
perimeter firewall.
@y
Port `4789` is the default value for the Swarm data path port, also known as the VXLAN port.
It is important to prevent any untrusted traffic from reaching this port, as VXLAN does not
provide authentication. This port should only be opened to a trusted network, and never at a
perimeter firewall.
@z

@x
If the network which Swarm traffic traverses is not fully trusted, it is strongly suggested that
encrypted overlay networks be used. If encrypted overlay networks are in exclusive use, some
additional hardening is suggested:
@y
If the network which Swarm traffic traverses is not fully trusted, it is strongly suggested that
encrypted overlay networks be used. If encrypted overlay networks are in exclusive use, some
additional hardening is suggested:
@z

@x
* [Customize the default ingress network](../networking.md) to use encryption
* Only accept encrypted packets on the Data Path Port:
@y
* [Customize the default ingress network](../networking.md) to use encryption
* Only accept encrypted packets on the Data Path Port:
@z

@x
```bash
# Example iptables rule (order and other tools may require customization)
iptables -I INPUT -m udp --dport 4789 -m policy --dir in --pol none -j DROP
```
@y
```bash
# Example iptables rule (order and other tools may require customization)
iptables -I INPUT -m udp --dport 4789 -m policy --dir in --pol none -j DROP
```
@z

@x
## What's next?
@y
## What's next?
@z

@x
After you have set up your environment, you are ready to [create a swarm](create-swarm.md).
@y
After you have set up your environment, you are ready to [create a swarm](create-swarm.md).
@z
