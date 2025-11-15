%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Test your Ruby on Rails deployment
linkTitle: Test your deployment
@y
title: Ruby on Rails デプロイのテスト
linkTitle: デプロイのテスト
@z

@x
keywords: deploy, kubernetes, ruby
description: Learn how to develop locally using Kubernetes
@y
keywords: deploy, kubernetes, ruby
description: Learn how to develop locally using Kubernetes
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Complete all the previous sections of this guide, starting with [Containerize a Ruby on Rails application](containerize.md).
- [Turn on Kubernetes](/manuals/desktop/use-desktop/kubernetes.md#enable-kubernetes) in Docker Desktop.
@y
- Complete all the previous sections of this guide, starting with [Containerize a Ruby on Rails application](containerize.md).
- [Turn on Kubernetes](manuals/desktop/use-desktop/kubernetes.md#enable-kubernetes) in Docker Desktop.
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This lets you to test and debug your workloads on Kubernetes locally before deploying.
@y
In this section, you'll learn how to use Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. This lets you to test and debug your workloads on Kubernetes locally before deploying.
@z

@x
## Create a Kubernetes YAML file
@y
## Create a Kubernetes YAML file
@z

@x
In your `docker-ruby-on-rails` directory, create a file named
`docker-ruby-on-rails-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Ruby on Rails application](configure-github-actions.md).
@y
In your `docker-ruby-on-rails` directory, create a file named
`docker-ruby-on-rails-kubernetes.yaml`. Open the file in an IDE or text editor and add
the following contents. Replace `DOCKER_USERNAME/REPO_NAME` with your Docker
username and the name of the repository that you created in [Configure CI/CD for
your Ruby on Rails application](configure-github-actions.md).
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
  described under `template`, has just one container in it. The
  container is created from the image built by GitHub Actions in [Configure CI/CD for
  your Ruby on Rails application](configure-github-actions.md).
- A NodePort service, which will route traffic from port 30001 on your host to
  port 8001 inside the pods it routes to, allowing you to reach your app
  from the network.
@y
- A Deployment, describing a scalable group of identical pods. In this case,
  you'll get just one replica, or copy of your pod. That pod, which is
  described under `template`, has just one container in it. The
  container is created from the image built by GitHub Actions in [Configure CI/CD for
  your Ruby on Rails application](configure-github-actions.md).
- A NodePort service, which will route traffic from port 30001 on your host to
  port 8001 inside the pods it routes to, allowing you to reach your app
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
1. In a terminal, navigate to `docker-ruby-on-rails` and deploy your application to
   Kubernetes.
@y
1. In a terminal, navigate to `docker-ruby-on-rails` and deploy your application to
   Kubernetes.
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
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services.
@y
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services.
@z

% snip command...

@x
   You should get output like the following.
@y
   You should get output like the following.
@z

% snip output...

@x
   In addition to the default `kubernetes` service, you can see your `docker-ruby-on-rails-demo` service, accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, you can see your `docker-ruby-on-rails-demo` service, accepting traffic on port 30001/TCP.
@z

@x
3. To create and migrate the database in a Ruby on Rails application running on Kubernetes, you need to follow these steps.
@y
3. To create and migrate the database in a Ruby on Rails application running on Kubernetes, you need to follow these steps.
@z

@x
   **Get the Current Pods**:
   First, you need to identify the pods running in your Kubernetes cluster. Execute the following command to list the current pods in the `default` namespace:
@y
   **Get the Current Pods**:
   First, you need to identify the pods running in your Kubernetes cluster. Execute the following command to list the current pods in the `default` namespace:
@z

% snip command...

@x
   This command will display a list of all pods in the `default` namespace. Look for the pod with the prefix `docker-ruby-on-rails-demo-`. Here is an example output:
@y
   This command will display a list of all pods in the `default` namespace. Look for the pod with the prefix `docker-ruby-on-rails-demo-`. Here is an example output:
@z

% snip output...

@x
   **Execute the Migration Command**:
   Once you've identified the correct pod, use the `kubectl exec` command to run the database migration inside the pod.
@y
   **Execute the Migration Command**:
   Once you've identified the correct pod, use the `kubectl exec` command to run the database migration inside the pod.
@z

% snip command...

@x
   This command opens an interactive terminal session (`-it`) in the specified pod and runs the `rails db:migrate` command with the environment set to development (`RAILS_ENV=development`).
@y
   This command opens an interactive terminal session (`-it`) in the specified pod and runs the `rails db:migrate` command with the environment set to development (`RAILS_ENV=development`).
@z

@x
   By following these steps, you ensure that your database is properly migrated within the Ruby on Rails application running in your Kubernetes cluster. This process helps maintain the integrity and consistency of your application's data structure during deployment and updates.
@y
   By following these steps, you ensure that your database is properly migrated within the Ruby on Rails application running in your Kubernetes cluster. This process helps maintain the integrity and consistency of your application's data structure during deployment and updates.
@z

@x
4. Open the browser and go to [http://localhost:30001](http://localhost:30001), you should see the ruby on rails application working.
@y
4. Open the browser and go to [http://localhost:30001](http://localhost:30001), you should see the ruby on rails application working.
@z

@x
5. Run the following command to tear down your application.
@y
5. Run the following command to tear down your application.
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
- [Deploy on Kubernetes with Docker Desktop](/manuals/desktop/use-desktop/kubernetes.md)
- [Swarm mode overview](/manuals/engine/swarm/_index.md)
@y
- [Kubernetes documentation](https://kubernetes.io/docs/home/)
- [Deploy on Kubernetes with Docker Desktop](manuals/desktop/use-desktop/kubernetes.md)
- [Swarm mode overview](manuals/engine/swarm/_index.md)
@z
