%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: What is Docker Compose?
@y
title: What is Docker Compose?
@z

@x
keywords: concepts, build, images, container, docker desktop
description: What is Docker Compose?
@y
keywords: concepts, build, images, container, docker desktop
description: What is Docker Compose?
@z

@x
{{< youtube-embed xhcUIK4fGtY >}}
@y
{{< youtube-embed xhcUIK4fGtY >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
If you've been following the guides so far, you've been working with single container applications. But, now you're wanting to do something more complicated - run databases, message queues, caches, or a variety of other services. Do you install everything in a single container? Run multiple containers? If you run multiple, how do you connect them all together?
@y
If you've been following the guides so far, you've been working with single container applications. But, now you're wanting to do something more complicated - run databases, message queues, caches, or a variety of other services. Do you install everything in a single container? Run multiple containers? If you run multiple, how do you connect them all together?
@z

@x
One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.
@y
One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.
@z

@x
You can use multiple `docker run` commands to start multiple containers. But, you'll soon realize you'll need to manage networks, all of the flags needed to connect containers to those networks, and more. And when you're done, cleanup is a little more complicated.
@y
You can use multiple `docker run` commands to start multiple containers. But, you'll soon realize you'll need to manage networks, all of the flags needed to connect containers to those networks, and more. And when you're done, cleanup is a little more complicated.
@z

@x
With Docker Compose, you can define all of your containers and their configurations in a single YAML file. If you include this file in your code repository, anyone that clones your repository can get up and running with a single command.
@y
With Docker Compose, you can define all of your containers and their configurations in a single YAML file. If you include this file in your code repository, anyone that clones your repository can get up and running with a single command.
@z

@x
It's important to understand that Compose is a declarative tool - you simply define it and go. You don't always need to recreate everything from scratch. If you make a change, run `docker compose up` again and Compose will reconcile the changes in your file and apply them intelligently.
@y
It's important to understand that Compose is a declarative tool - you simply define it and go. You don't always need to recreate everything from scratch. If you make a change, run `docker compose up` again and Compose will reconcile the changes in your file and apply them intelligently.
@z

@x
> **Dockerfile versus Compose file**
>
> A Dockerfile provides instructions to build a container image while a Compose file defines your running containers. Quite often, a Compose file references a Dockerfile to build an image to use for a particular service.
@y
> **Dockerfile versus Compose file**
>
> A Dockerfile provides instructions to build a container image while a Compose file defines your running containers. Quite often, a Compose file references a Dockerfile to build an image to use for a particular service.
@z

@x
## Try it out 
@y
## Try it out 
@z

@x
In this hands-on, you will learn how to use a Docker Compose to run a multi-container application. You'll use a simple to-do list app built with Node.js and MySQL as a database server.
@y
In this hands-on, you will learn how to use a Docker Compose to run a multi-container application. You'll use a simple to-do list app built with Node.js and MySQL as a database server.
@z

@x
### Start the application
@y
### Start the application
@z

@x
Follow the instructions to run the to-do list app on your system.
@y
Follow the instructions to run the to-do list app on your system.
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
2. Open a terminal and [clone this sample application](https://github.com/dockersamples/todo-list-app).
@y
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
2. Open a terminal and [clone this sample application](https://github.com/dockersamples/todo-list-app).
@z

% snip command...

@x
3. Navigate into the `todo-list-app` directory:
@y
3. Navigate into the `todo-list-app` directory:
@z

% snip command...

@x
    Inside this directory, you'll find a file named `compose.yaml`. This YAML file is where all the magic happens! It defines all the services that make up your application, along with their configurations. Each service specifies its image, ports, volumes, networks, and any other settings necessary for its functionality. Take some time to explore the YAML file and familiarize yourself with its structure. 
@y
    Inside this directory, you'll find a file named `compose.yaml`. This YAML file is where all the magic happens! It defines all the services that make up your application, along with their configurations. Each service specifies its image, ports, volumes, networks, and any other settings necessary for its functionality. Take some time to explore the YAML file and familiarize yourself with its structure. 
@z

@x
4. Use the [`docker compose up`](/reference/cli/docker/compose/up/) command to start the application:
@y
4. Use the [`docker compose up`](__SUBDIR__/reference/cli/docker/compose/up/) command to start the application:
@z

% snip command...

@x
    When you run this command, you should see an output like this:
@y
    When you run this command, you should see an output like this:
@z

% snip output...

@x
    A lot happened here! A couple of things to call out:
@y
    A lot happened here! A couple of things to call out:
@z

@x
    - Two container images were downloaded from Docker Hub - node and MySQL
    - A network was created for your application
    - A volume was created to persist the database files between container restarts
    - Two containers were started with all of their necessary config
@y
    - Two container images were downloaded from Docker Hub - node and MySQL
    - A network was created for your application
    - A volume was created to persist the database files between container restarts
    - Two containers were started with all of their necessary config
@z

@x
    If this feels overwhelming, don't worry! You'll get there!
@y
    If this feels overwhelming, don't worry! You'll get there!
@z

@x
5. With everything now up and running, you can open [http://localhost:3000](http://localhost:3000) in your browser to see the site. Feel free to add items to the list, check them off, and remove them.
@y
5. With everything now up and running, you can open [http://localhost:3000](http://localhost:3000) in your browser to see the site. Feel free to add items to the list, check them off, and remove them.
@z

@x
    ![A screenshot of a webpage showing the todo-list application running on port 3000](images/todo-list-app.webp?border=true&w=950&h=400)
@y
    ![A screenshot of a webpage showing the todo-list application running on port 3000](images/todo-list-app.webp?border=true&w=950&h=400)
@z

@x
6. If you look at the Docker Desktop GUI, you can see the containers and dive deeper into their configuration.
@y
6. If you look at the Docker Desktop GUI, you can see the containers and dive deeper into their configuration.
@z

@x
    ![A screenshot of Docker Desktop dashboard showing the list of containers running todo-list app](images/todo-list-containers.webp?border=true&w=950&h=400)
@y
    ![A screenshot of Docker Desktop dashboard showing the list of containers running todo-list app](images/todo-list-containers.webp?border=true&w=950&h=400)
@z

@x
### Tear it down
@y
### Tear it down
@z

@x
Since this application was started using Docker Compose, it's easy to tear it all down when you're done.
@y
Since this application was started using Docker Compose, it's easy to tear it all down when you're done.
@z

@x
1. In the CLI, use the [`docker compose down`](/reference/cli/docker/compose/down/) command to remove everything:
@y
1. In the CLI, use the [`docker compose down`](__SUBDIR__/reference/cli/docker/compose/down/) command to remove everything:
@z

% snip command...

@x
    You'll see output similar to the following:
@y
    You'll see output similar to the following:
@z

% snip output...

@x
    > **Volume persistence**
    >
    > By default, volumes _aren't_ automatically removed when you tear down a Compose stack. The idea is that you might want the data back if you start the stack again.
    >
    > If you do want to remove the volumes, add the `--volumes` flag when running the `docker compose down` command:
@y
    > **Volume persistence**
    >
    > By default, volumes _aren't_ automatically removed when you tear down a Compose stack. The idea is that you might want the data back if you start the stack again.
    >
    > If you do want to remove the volumes, add the `--volumes` flag when running the `docker compose down` command:
@z

% snip command...

@x
2. Alternatively, you can use the Docker Desktop GUI to remove the containers by selecting the application stack and selecting the **Delete** button.
@y
2. Alternatively, you can use the Docker Desktop GUI to remove the containers by selecting the application stack and selecting the **Delete** button.
@z

@x
    ![A screenshot of the Docker Desktop GUI showing the containers view with an arrow pointing to the "Delete" button](images/todo-list-delete.webp?w=930&h=400)
@y
    ![A screenshot of the Docker Desktop GUI showing the containers view with an arrow pointing to the "Delete" button](images/todo-list-delete.webp?w=930&h=400)
@z

@x
    > **Using the GUI for Compose stacks**
    >
    > Note that if you remove the containers for a Compose app in the GUI, it's removing only the containers. You'll have to manually remove the network and volumes if you want to do so.
@y
    > **Using the GUI for Compose stacks**
    >
    > Note that if you remove the containers for a Compose app in the GUI, it's removing only the containers. You'll have to manually remove the network and volumes if you want to do so.
@z

@x
In this walkthrough, you learned how to use Docker Compose to start and stop a multi-container application.
@y
In this walkthrough, you learned how to use Docker Compose to start and stop a multi-container application.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
This page was a brief introduction to Compose. In the following resources, you can dive deeper into Compose and how to write Compose files.
@y
This page was a brief introduction to Compose. In the following resources, you can dive deeper into Compose and how to write Compose files.
@z

@x
* [Overview of Docker Compose](/compose/)
* [Overview of Docker Compose CLI](/compose/reference/)
* [How Compose works](/compose/intro/compose-application-model/)
@y
* [Overview of Docker Compose](__SUBDIR__/compose/)
* [Overview of Docker Compose CLI](__SUBDIR__/compose/reference/)
* [How Compose works](__SUBDIR__/compose/intro/compose-application-model/)
@z
