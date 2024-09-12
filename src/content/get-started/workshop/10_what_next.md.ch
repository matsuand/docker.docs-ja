%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: What next after the Docker workshop
@y
title: What next after the Docker workshop
@z

@x
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making sure you have more ideas of what you could do next with your application
@y
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making sure you have more ideas of what you could do next with your application
@z

@x
Although you're done with the workshop, there's still a lot more to learn about containers.
@y
Although you're done with the workshop, there's still a lot more to learn about containers.
@z

@x
Here are a few other areas to look at next.
@y
Here are a few other areas to look at next.
@z

@x
## Container orchestration
@y
## Container orchestration
@z

@x
Running containers in production is tough. You don't want to log into a machine and simply run a
`docker run` or `docker compose up`. Why not? Well, what happens if the containers die? How do you
scale across several machines? Container orchestration solves this problem. Tools like Kubernetes,
Swarm, Nomad, and ECS all help solve this problem, all in slightly different ways.
@y
Running containers in production is tough. You don't want to log into a machine and simply run a
`docker run` or `docker compose up`. Why not? Well, what happens if the containers die? How do you
scale across several machines? Container orchestration solves this problem. Tools like Kubernetes,
Swarm, Nomad, and ECS all help solve this problem, all in slightly different ways.
@z

@x
The general idea is that you have managers who receive the expected state. This state might be
"I want to run two instances of my web app and expose port 80." The managers then look at all of the
machines in the cluster and delegate work to worker nodes. The managers watch for changes (such as
a container quitting) and then work to make the actual state reflect the expected state.
@y
The general idea is that you have managers who receive the expected state. This state might be
"I want to run two instances of my web app and expose port 80." The managers then look at all of the
machines in the cluster and delegate work to worker nodes. The managers watch for changes (such as
a container quitting) and then work to make the actual state reflect the expected state.
@z

@x
## Cloud Native Computing Foundation projects
@y
## Cloud Native Computing Foundation projects
@z

@x
The CNCF is a vendor-neutral home for various open-source projects, including Kubernetes, Prometheus, 
Envoy, Linkerd, NATS, and more. You can view the [graduated and incubated projects here](https://www.cncf.io/projects/)
and the entire [CNCF Landscape here](https://landscape.cncf.io/). There are a lot of projects to help
solve problems around monitoring, logging, security, image registries, messaging, and more.
@y
The CNCF is a vendor-neutral home for various open-source projects, including Kubernetes, Prometheus, 
Envoy, Linkerd, NATS, and more. You can view the [graduated and incubated projects here](https://www.cncf.io/projects/)
and the entire [CNCF Landscape here](https://landscape.cncf.io/). There are a lot of projects to help
solve problems around monitoring, logging, security, image registries, messaging, and more.
@z

@x
## Getting started video workshop
@y
## Getting started video workshop
@z

@x
Docker recommends watching the video workshop from DockerCon 2022. Watch the entire video or use the following links to open the video at a particular section.
@y
Docker recommends watching the video workshop from DockerCon 2022. Watch the entire video or use the following links to open the video at a particular section.
@z

@x
* [Docker overview and installation](https://youtu.be/gAGEar5HQoU)
* [Pull, run, and explore containers](https://youtu.be/gAGEar5HQoU?t=1400)
* [Build a container image](https://youtu.be/gAGEar5HQoU?t=3185)
* [Containerize an app](https://youtu.be/gAGEar5HQoU?t=4683)
* [Connect a DB and set up a bind mount](https://youtu.be/gAGEar5HQoU?t=6305)
* [Deploy a container to the cloud](https://youtu.be/gAGEar5HQoU?t=8280)
@y
* [Docker overview and installation](https://youtu.be/gAGEar5HQoU)
* [Pull, run, and explore containers](https://youtu.be/gAGEar5HQoU?t=1400)
* [Build a container image](https://youtu.be/gAGEar5HQoU?t=3185)
* [Containerize an app](https://youtu.be/gAGEar5HQoU?t=4683)
* [Connect a DB and set up a bind mount](https://youtu.be/gAGEar5HQoU?t=6305)
* [Deploy a container to the cloud](https://youtu.be/gAGEar5HQoU?t=8280)
@z

@x
<iframe src="https://www.youtube-nocookie.com/embed/gAGEar5HQoU" style="max-width: 100%; aspect-ratio: 16 / 9;" width="560" height="auto" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe src="https://www.youtube-nocookie.com/embed/gAGEar5HQoU" style="max-width: 100%; aspect-ratio: 16 / 9;" width="560" height="auto" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
## Creating a container from scratch
@y
## Creating a container from scratch
@z

@x
If you'd like to see how containers are built from scratch, Liz Rice from Aqua Security has a fantastic talk in which she creates a container from scratch in Go. While the talk does not go into networking, using images for the filesystem, and other advanced topics, it gives a deep dive into how things are working.
@y
If you'd like to see how containers are built from scratch, Liz Rice from Aqua Security has a fantastic talk in which she creates a container from scratch in Go. While the talk does not go into networking, using images for the filesystem, and other advanced topics, it gives a deep dive into how things are working.
@z

@x
<iframe src="https://www.youtube-nocookie.com/embed/8fi7uSYlOdc" style="max-width: 100%; aspect-ratio: 16 / 9;" width="560" height="auto" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe src="https://www.youtube-nocookie.com/embed/8fi7uSYlOdc" style="max-width: 100%; aspect-ratio: 16 / 9;" width="560" height="auto" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
## Language-specific guides
@y
## Language-specific guides
@z

@x
If you are looking for information on how to containerize an application using your favorite language, see the [Language-specific guides](/guides/language/_index.md).
@y
If you are looking for information on how to containerize an application using your favorite language, see the [Language-specific guides](guides/language/_index.md).
@z
