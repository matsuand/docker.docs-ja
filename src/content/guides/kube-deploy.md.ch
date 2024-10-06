%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Deploy to Kubernetes
keywords: kubernetes, pods, deployments, kubernetes services
description: Learn how to describe and deploy a simple application on Kubernetes.
@y
title: Deploy to Kubernetes
keywords: kubernetes, pods, deployments, kubernetes services
description: Learn how to describe and deploy a simple application on Kubernetes.
@z

@x
summary: |
  Learn how to deploy and orchestrate Docker containers using Kubernetes, with
  step-by-step guidance on setup, configuration, and best practices to enhance
  your application's scalability and reliability.
@y
summary: |
  Learn how to deploy and orchestrate Docker containers using Kubernetes, with
  step-by-step guidance on setup, configuration, and best practices to enhance
  your application's scalability and reliability.
@z

@x
subjects: [deploy]
levels: [beginner]
@y
subjects: [デプロイ]
levels: [初心者向け]
@z

% params:
@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Download and install Docker Desktop as described in [Get Docker](/get-started/get-docker.md).
- Work through containerizing an application in [Part 2](02_our_app.md).
- Make sure that Kubernetes is turned on in Docker Desktop:
  If Kubernetes isn't running, follow the instructions in [Orchestration](orchestration.md) to finish setting it up.
@y
- Download and install Docker Desktop as described in [Get Docker](get-started/get-docker.md).
- Work through containerizing an application in [Part 2](02_our_app.md).
- Make sure that Kubernetes is turned on in Docker Desktop:
  If Kubernetes isn't running, follow the instructions in [Orchestration](orchestration.md) to finish setting it up.
@z

@x
## Introduction
@y
## Introduction
@z

@x
Now that you've demonstrated that the individual components of your application run as stand-alone containers, it's time to arrange for them to be managed by an orchestrator like Kubernetes. Kubernetes provides many tools for scaling, networking, securing and maintaining your containerized applications, above and beyond the abilities of containers themselves.
@y
Now that you've demonstrated that the individual components of your application run as stand-alone containers, it's time to arrange for them to be managed by an orchestrator like Kubernetes. Kubernetes provides many tools for scaling, networking, securing and maintaining your containerized applications, above and beyond the abilities of containers themselves.
@z

@x
In order to validate that your containerized application works well on Kubernetes, you'll use Docker Desktop's built in Kubernetes environment right on your development machine to deploy your application, before handing it off to run on a full Kubernetes cluster in production. The Kubernetes environment created by Docker Desktop is _fully featured_, meaning it has all the Kubernetes features your app will enjoy on a real cluster, accessible from the convenience of your development machine.
@y
In order to validate that your containerized application works well on Kubernetes, you'll use Docker Desktop's built in Kubernetes environment right on your development machine to deploy your application, before handing it off to run on a full Kubernetes cluster in production. The Kubernetes environment created by Docker Desktop is _fully featured_, meaning it has all the Kubernetes features your app will enjoy on a real cluster, accessible from the convenience of your development machine.
@z

@x
## Describing apps using Kubernetes YAML
@y
## Describing apps using Kubernetes YAML
@z

@x
All containers in Kubernetes are scheduled as pods, which are groups of co-located containers that share some resources. Furthermore, in a realistic application you almost never create individual pods. Instead, most of your workloads are scheduled as deployments, which are scalable groups of pods maintained automatically by Kubernetes. Lastly, all Kubernetes objects can and should be described in manifests called Kubernetes YAML files. These YAML files describe all the components and configurations of your Kubernetes app, and can be used to create and destroy your app in any Kubernetes environment.
@y
All containers in Kubernetes are scheduled as pods, which are groups of co-located containers that share some resources. Furthermore, in a realistic application you almost never create individual pods. Instead, most of your workloads are scheduled as deployments, which are scalable groups of pods maintained automatically by Kubernetes. Lastly, all Kubernetes objects can and should be described in manifests called Kubernetes YAML files. These YAML files describe all the components and configurations of your Kubernetes app, and can be used to create and destroy your app in any Kubernetes environment.
@z

@x
You already wrote a basic Kubernetes YAML file in the Orchestration overview part of this tutorial. Now, you can write a slightly more sophisticated YAML file to run and manage your Todo app, the container `getting-started` image created in [Part 2](02_our_app.md) of the Quickstart tutorial. Place the following in a file called `bb.yaml`:
@y
You already wrote a basic Kubernetes YAML file in the Orchestration overview part of this tutorial. Now, you can write a slightly more sophisticated YAML file to run and manage your Todo app, the container `getting-started` image created in [Part 2](02_our_app.md) of the Quickstart tutorial. Place the following in a file called `bb.yaml`:
@z

% snip code...

% snip code...

@x
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@y
In this Kubernetes YAML file, there are two objects, separated by the `---`:
@z

@x
- A `Deployment`, describing a scalable group of identical pods. In this case, you'll get just one `replica`, or copy of your pod, and that pod (which is described under the `template:` key) has just one container in it, based off of your `getting-started` image from the previous step in this tutorial.
- A `NodePort` service, which will route traffic from port 30001 on your host to port 3000 inside the pods it routes to, allowing you to reach your Todo app from the network.
@y
- A `Deployment`, describing a scalable group of identical pods. In this case, you'll get just one `replica`, or copy of your pod, and that pod (which is described under the `template:` key) has just one container in it, based off of your `getting-started` image from the previous step in this tutorial.
- A `NodePort` service, which will route traffic from port 30001 on your host to port 3000 inside the pods it routes to, allowing you to reach your Todo app from the network.
@z

@x
Also, notice that while Kubernetes YAML can appear long and complicated at first, it almost always follows the same pattern:
@y
Also, notice that while Kubernetes YAML can appear long and complicated at first, it almost always follows the same pattern:
@z

@x
- The `apiVersion`, which indicates the Kubernetes API that parses this object
- The `kind` indicating what sort of object this is
- Some `metadata` applying things like names to your objects
- The `spec` specifying all the parameters and configurations of your object.
@y
- The `apiVersion`, which indicates the Kubernetes API that parses this object
- The `kind` indicating what sort of object this is
- Some `metadata` applying things like names to your objects
- The `spec` specifying all the parameters and configurations of your object.
@z

@x
## Deploy and check your application
@y
## Deploy and check your application
@z

@x
1. In a terminal, navigate to where you created `bb.yaml` and deploy your application to Kubernetes:
@y
1. In a terminal, navigate to where you created `bb.yaml` and deploy your application to Kubernetes:
@z

% snip command...

@x
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully:
@y
   You should see output that looks like the following, indicating your Kubernetes objects were created successfully:
@z

% snip output...

@x
2. Make sure everything worked by listing your deployments:
@y
2. Make sure everything worked by listing your deployments:
@z

% snip command...

@x
   if all is well, your deployment should be listed as follows:
@y
   if all is well, your deployment should be listed as follows:
@z

% snip output...

@x
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services:
@y
   This indicates all one of the pods you asked for in your YAML are up and running. Do the same check for your services:
@z

% snip command...

@x
   In addition to the default `kubernetes` service, we see our `bb-entrypoint` service, accepting traffic on port 30001/TCP.
@y
   In addition to the default `kubernetes` service, we see our `bb-entrypoint` service, accepting traffic on port 30001/TCP.
@z

@x
3. Open a browser and visit your Todo app at `localhost:30001`. You should see your Todo application, the same as when you ran it as a stand-alone container in [Part 2](02_our_app.md) of the tutorial.
@y
3. Open a browser and visit your Todo app at `localhost:30001`. You should see your Todo application, the same as when you ran it as a stand-alone container in [Part 2](02_our_app.md) of the tutorial.
@z

@x
4. Once satisfied, tear down your application:
@y
4. Once satisfied, tear down your application:
@z

% snip command...

@x
## Conclusion
@y
## Conclusion
@z

@x
At this point, you have successfully used Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. You can now add other components to your app and taking advantage of all the features and power of Kubernetes, right on your own machine.
@y
At this point, you have successfully used Docker Desktop to deploy your application to a fully-featured Kubernetes environment on your development machine. You can now add other components to your app and taking advantage of all the features and power of Kubernetes, right on your own machine.
@z

@x
In addition to deploying to Kubernetes, you have also described your application as a Kubernetes YAML file. This simple text file contains everything you need to create your application in a running state. You can check it in to version control and share it with your colleagues. This let you distribute your applications to other clusters (like the testing and production clusters that probably come after your development environments).
@y
In addition to deploying to Kubernetes, you have also described your application as a Kubernetes YAML file. This simple text file contains everything you need to create your application in a running state. You can check it in to version control and share it with your colleagues. This let you distribute your applications to other clusters (like the testing and production clusters that probably come after your development environments).
@z

@x
## Kubernetes references
@y
## Kubernetes references
@z

@x
Further documentation for all new Kubernetes objects used in this article are available here:
@y
Further documentation for all new Kubernetes objects used in this article are available here:
@z

@x
- [Kubernetes Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/)
- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)
@y
- [Kubernetes Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/)
- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)
@z
