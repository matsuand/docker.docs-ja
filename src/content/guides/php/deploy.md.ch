%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Test your PHP deployment
linkTitle: Test your deployment
@y
title: PHP デプロイのテスト
linkTitle: デプロイのテスト
@z

@x
keywords: deploy, php, local, development
description: Learn how to deploy your application
@y
keywords: deploy, php, local, development
description: Learn how to deploy your application
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize
  a PHP application](containerize.md).
- [Turn on Kubernetes](/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker
  Desktop.
@y
- Complete all the previous sections of this guide, starting with [Containerize
  a PHP application](containerize.md).
- [Turn on Kubernetes](__SUBDIR__/desktop/kubernetes/#install-and-turn-on-kubernetes) in Docker
  Desktop.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your
application to a fully-featured Kubernetes environment on your development
machine. This allows you to test and debug your workloads on Kubernetes locally
before deploying.
@y
In this section, you'll learn how to use Docker Desktop to deploy your
application to a fully-featured Kubernetes environment on your development
machine. This allows you to test and debug your workloads on Kubernetes locally
before deploying.
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
In your `docker-php-sample` directory, create a file named
`docker-php-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your PHP application](configure-ci-cd.md).
@y
In your `docker-php-sample` directory, create a file named
`docker-php-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your PHP application](configure-ci-cd.md).
@z

% snip code...

@x
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@y
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@z

@x
- A Deployment, describing a scalable group of identical pods. In this case,
  you'll get just one replica, or copy of your pod. That pod, which is
  described under `template`, has just one container in it. The container is
  created from the image built by GitHub Actions in [Configure CI/CD for your
  PHP application](configure-ci-cd.md).
- A NodePort service, which will route traffic from port 30001 on your host to
  port 80 inside the pods it routes to, allowing you to reach your app
  from the network.
@y
- A Deployment, describing a scalable group of identical pods. In this case,
  you'll get just one replica, or copy of your pod. That pod, which is
  described under `template`, has just one container in it. The container is
  created from the image built by GitHub Actions in [Configure CI/CD for your
  PHP application](configure-ci-cd.md).
- A NodePort service, which will route traffic from port 30001 on your host to
  port 80 inside the pods it routes to, allowing you to reach your app
  from the network.
@z

@x
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@y
To learn more about Kubernetes objects, see the [Kubernetes documentation](https://kubernetes.io/docs/home/).
@z

@x
## Deploy and check your application
@y
## Deploy and check your application
@z

@x
1. In a terminal, navigate to the `docker-php-sample` directory
   and deploy your application to Kubernetes.
@y
1. In a terminal, navigate to the `docker-php-sample` directory
   and deploy your application to Kubernetes.
@z

% snip command...

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@y
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully.
@z

% snip output...

@x
2. Make sure everything worked by listing your deployments.
@y
2. Make sure everything worked by listing your deployments.
@z

% snip command...

@x
   Your deployment should be listed as follows:
@y
   Your deployment should be listed as follows:
@z

% snip output...

@x
   This indicates all of the pods are up and running. Do the same check for your services.
@y
   This indicates all of the pods are up and running. Do the same check for your services.
@z

% snip command...

@x
   You should get output like the following.
@y
   You should get output like the following.
@z

% snip output...

@x
   In addition to the default `kubernetes` service, you can see your `php-entrypoint` service. The `php-entrypoint` service is accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, you can see your `php-entrypoint` service. The `php-entrypoint` service is accepting traffic on port 30001/TCP.
@z

@x
3. Open a browser and visit your app at
   [http://localhost:30001/hello.php](http://localhost:30001/hello.php). You
   should see your application.
@y
3. Open a browser and visit your app at
   [http://localhost:30001/hello.php](http://localhost:30001/hello.php). You
   should see your application.
@z

@x
4. Run the following command to tear down your application.
@y
4. Run the following command to tear down your application.
@z

% snip command...

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine.
@y
In this section, you learned how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Kubernetes documentation](https://kubernetes.io/docs/home/)
- [Deploy on Kubernetes with Docker Desktop](/manuals/desktop/kubernetes.md)
- [Swarm mode overview](/manuals/engine/swarm/_index.md)
@y
- [Kubernetes documentation](https://kubernetes.io/docs/home/)
- [Deploy on Kubernetes with Docker Desktop](manuals/desktop/kubernetes.md)
- [Swarm mode overview](manuals/engine/swarm/_index.md)
@z
