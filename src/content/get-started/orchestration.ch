%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deployment and orchestration
keywords: orchestration, deploy, kubernetes, swarm,
description: Get oriented on some basics of Docker and install Docker Desktop.
---
@y
---
title: Deployment and orchestration
keywords: orchestration, deploy, kubernetes, swarm,
description: Get oriented on some basics of Docker and install Docker Desktop.
---
@z

@x
Containerization provides an opportunity to move and scale applications to
clouds and data centers. Containers effectively guarantee that those applications run the
same way anywhere, allowing you to quickly and easily take advantage of all
these environments. Additionally, as you scale your applications up, you need some
tooling to help automate the maintenance of those applications, enable the
replacement of failed containers automatically, and manage the roll-out of
updates and reconfigurations of those containers during their lifecycle.
@y
Containerization provides an opportunity to move and scale applications to
clouds and data centers. Containers effectively guarantee that those applications run the
same way anywhere, allowing you to quickly and easily take advantage of all
these environments. Additionally, as you scale your applications up, you need some
tooling to help automate the maintenance of those applications, enable the
replacement of failed containers automatically, and manage the roll-out of
updates and reconfigurations of those containers during their lifecycle.
@z

@x
Tools to manage, scale, and maintain containerized applications are called
orchestrators. Two of the most popular orchestration tools are Kubernetes and
Docker Swarm. Docker Desktop provides development environments for both of these
orchestrators.
@y
Tools to manage, scale, and maintain containerized applications are called
orchestrators. Two of the most popular orchestration tools are Kubernetes and
Docker Swarm. Docker Desktop provides development environments for both of these
orchestrators.
@z

@x
The advanced modules teach you how to:
@y
The advanced modules teach you how to:
@z

@x
1. [Set up and use a Kubernetes environment on your development machine](kube-deploy.md)
2. [Set up and use a Swarm environment on your development machine](swarm-deploy.md)
@y
1. [Set up and use a Kubernetes environment on your development machine](kube-deploy.md)
2. [Set up and use a Swarm environment on your development machine](swarm-deploy.md)
@z

@x
## Turn on Kubernetes
@y
## Turn on Kubernetes
@z

@x
Docker Desktop sets up Kubernetes for you quickly and easily. Follow the setup and validation instructions appropriate for your operating system:
@y
Docker Desktop sets up Kubernetes for you quickly and easily. Follow the setup and validation instructions appropriate for your operating system:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Mac and Linux" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Mac and Linux" >}}
@z

@x
### Mac
@y
### Mac
@z

@x
1.  From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@y
1.  From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@z

@x
2.  Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in **Settings**.
@y
2.  Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in **Settings**.
@z

@x
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@y
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@z

@x
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: demo
    spec:
      containers:
      - name: testpod
        image: alpine:latest
        command: ["ping", "8.8.8.8"]
    ```
@y
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: demo
    spec:
      containers:
      - name: testpod
        image: alpine:latest
        command: ["ping", "8.8.8.8"]
    ```
@z

@x
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@y
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@z

@x
4. In a terminal, navigate to where you created `pod.yaml` and create your pod:
@y
4. In a terminal, navigate to where you created `pod.yaml` and create your pod:
@z

@x
    ```console
    $ kubectl apply -f pod.yaml
    ```
@y
    ```console
    $ kubectl apply -f pod.yaml
    ```
@z

@x
5. Check that your pod is up and running:
@y
5. Check that your pod is up and running:
@z

@x
    ```console
    $ kubectl get pods
    ```
@y
    ```console
    $ kubectl get pods
    ```
@z

@x
    You should see something like:
@y
    You should see something like:
@z

@x
    ```shell
    NAME      READY     STATUS    RESTARTS   AGE
    demo      1/1       Running   0          4s
    ```
@y
    ```shell
    NAME      READY     STATUS    RESTARTS   AGE
    demo      1/1       Running   0          4s
    ```
@z

@x
6. Check that you get the logs you'd expect for a ping process:
@y
6. Check that you get the logs you'd expect for a ping process:
@z

@x
    ```console
    $ kubectl logs demo
    ```
@y
    ```console
    $ kubectl logs demo
    ```
@z

@x
    You should see the output of a healthy ping process:
@y
    You should see the output of a healthy ping process:
@z

@x
    ```shell
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=21.393 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=15.320 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=11.111 ms
    ...
    ```
@y
    ```shell
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=21.393 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=15.320 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=11.111 ms
    ...
    ```
@z

@x
7. Finally, tear down your test pod:
@y
7. Finally, tear down your test pod:
@z

@x
    ```console
    $ kubectl delete -f pod.yaml
    ```
@y
    ```console
    $ kubectl delete -f pod.yaml
    ```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
### Windows
@y
### Windows
@z

@x
1. From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@y
1. From the Docker Dashboard, navigate to **Settings**, and select the **Kubernetes** tab.
@z

@x
2. Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in the **Settings** menu.
@y
2. Select the checkbox labeled **Enable Kubernetes**, and select **Apply & Restart**. Docker Desktop automatically sets up Kubernetes for you. You'll know that Kubernetes has been successfully enabled when you see a green light beside 'Kubernetes _running_' in the **Settings** menu.
@z

@x
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@y
3. To confirm that Kubernetes is up and running, create a text file called `pod.yaml` with the following content:
@z

@x
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: demo
    spec:
      containers:
      - name: testpod
        image: alpine:latest
        command: ["ping", "8.8.8.8"]
    ```
@y
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: demo
    spec:
      containers:
      - name: testpod
        image: alpine:latest
        command: ["ping", "8.8.8.8"]
    ```
@z

@x
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@y
    This describes a pod with a single container, isolating a simple ping to 8.8.8.8.
@z

@x
4. In PowerShell, navigate to where you created `pod.yaml` and create your pod:
@y
4. In PowerShell, navigate to where you created `pod.yaml` and create your pod:
@z

@x
    ```console
    $ kubectl apply -f pod.yaml
    ```
@y
    ```console
    $ kubectl apply -f pod.yaml
    ```
@z

@x
5. Check that your pod is up and running:
@y
5. Check that your pod is up and running:
@z

@x
    ```console
    $ kubectl get pods
    ```
@y
    ```console
    $ kubectl get pods
    ```
@z

@x
    You should see something like:
@y
    You should see something like:
@z

@x
    ```shell
    NAME      READY     STATUS    RESTARTS   AGE
    demo      1/1       Running   0          4s
    ```
@y
    ```shell
    NAME      READY     STATUS    RESTARTS   AGE
    demo      1/1       Running   0          4s
    ```
@z

@x
6. Check that you get the logs you'd expect for a ping process:
@y
6. Check that you get the logs you'd expect for a ping process:
@z

@x
    ```console
    $ kubectl logs demo
    ```
@y
    ```console
    $ kubectl logs demo
    ```
@z

@x
    You should see the output of a healthy ping process:
@y
    You should see the output of a healthy ping process:
@z

@x
    ```shell
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=21.393 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=15.320 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=11.111 ms
    ...
    ```
@y
    ```shell
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=21.393 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=15.320 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=11.111 ms
    ...
    ```
@z

@x
7. Finally, tear down your test pod:
@y
7. Finally, tear down your test pod:
@z

@x
    ```console
    $ kubectl delete -f pod.yaml
    ```
@y
    ```console
    $ kubectl delete -f pod.yaml
    ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Enable Docker Swarm
@y
## Enable Docker Swarm
@z

@x
Docker Desktop runs primarily on Docker Engine, which has everything you need to run a Swarm built in. Follow the setup and validation instructions appropriate for your operating system:
@y
Docker Desktop runs primarily on Docker Engine, which has everything you need to run a Swarm built in. Follow the setup and validation instructions appropriate for your operating system:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Mac" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Mac" >}}
@z

@x
### Mac
@y
### Mac
@z

@x
1. Open a terminal, and initialize Docker Swarm mode:
@y
1. Open a terminal, and initialize Docker Swarm mode:
@z

@x
    ```console
    $ docker swarm init
    ```
@y
    ```console
    $ docker swarm init
    ```
@z

@x
    If all goes well, you should see a message similar to the following:
@y
    If all goes well, you should see a message similar to the following:
@z

@x
    ```shell
    Swarm initialized: current node (tjjggogqpnpj2phbfbz8jd5oq) is now a manager.
@y
    ```shell
    Swarm initialized: current node (tjjggogqpnpj2phbfbz8jd5oq) is now a manager.
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join --token SWMTKN-1-3e0hh0jd5t4yjg209f4g5qpowbsczfahv2dea9a1ay2l8787cf-2h4ly330d0j917ocvzw30j5x9 192.168.65.3:2377
@y
        docker swarm join --token SWMTKN-1-3e0hh0jd5t4yjg209f4g5qpowbsczfahv2dea9a1ay2l8787cf-2h4ly330d0j917ocvzw30j5x9 192.168.65.3:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@y
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@z

@x
    ```console
    $ docker service create --name demo alpine:latest ping 8.8.8.8
    ```
@y
    ```console
    $ docker service create --name demo alpine:latest ping 8.8.8.8
    ```
@z

@x
3. Check that your service created one running container:
@y
3. Check that your service created one running container:
@z

@x
    ```console
    $ docker service ps demo
    ```
@y
    ```console
    $ docker service ps demo
    ```
@z

@x
    You should see something like:
@y
    You should see something like:
@z

@x
    ```shell
    ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
    463j2s3y4b5o        demo.1              alpine:latest       docker-desktop      Running             Running 8 seconds ago
    ```
@y
    ```shell
    ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
    463j2s3y4b5o        demo.1              alpine:latest       docker-desktop      Running             Running 8 seconds ago
    ```
@z

@x
4. Check that you get the logs you'd expect for a ping process:
@y
4. Check that you get the logs you'd expect for a ping process:
@z

@x
    ```console
    $ docker service logs demo
    ```
@y
    ```console
    $ docker service logs demo
    ```
@z

@x
    You should see the output of a healthy ping process:
@y
    You should see the output of a healthy ping process:
@z

@x
    ```shell
    demo.1.463j2s3y4b5o@docker-desktop    | PING 8.8.8.8 (8.8.8.8): 56 data bytes
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=0 ttl=37 time=13.005 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=1 ttl=37 time=13.847 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=2 ttl=37 time=41.296 ms
    ...
    ```
@y
    ```shell
    demo.1.463j2s3y4b5o@docker-desktop    | PING 8.8.8.8 (8.8.8.8): 56 data bytes
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=0 ttl=37 time=13.005 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=1 ttl=37 time=13.847 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=2 ttl=37 time=41.296 ms
    ...
    ```
@z

@x
5. Finally, tear down your test service:
@y
5. Finally, tear down your test service:
@z

@x
    ```console
    $ docker service rm demo
    ```
@y
    ```console
    $ docker service rm demo
    ```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
### Windows
@y
### Windows
@z

@x
1. Open a PowerShell, and initialize Docker Swarm mode:
@y
1. Open a PowerShell, and initialize Docker Swarm mode:
@z

@x
    ```console
    $ docker swarm init
    ```
@y
    ```console
    $ docker swarm init
    ```
@z

@x
    If all goes well, you should see a message similar to the following:
@y
    If all goes well, you should see a message similar to the following:
@z

@x
    ```shell
    Swarm initialized: current node (tjjggogqpnpj2phbfbz8jd5oq) is now a manager.
@y
    ```shell
    Swarm initialized: current node (tjjggogqpnpj2phbfbz8jd5oq) is now a manager.
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join --token SWMTKN-1-3e0hh0jd5t4yjg209f4g5qpowbsczfahv2dea9a1ay2l8787cf-2h4ly330d0j917ocvzw30j5x9 192.168.65.3:2377
@y
        docker swarm join --token SWMTKN-1-3e0hh0jd5t4yjg209f4g5qpowbsczfahv2dea9a1ay2l8787cf-2h4ly330d0j917ocvzw30j5x9 192.168.65.3:2377
@z

@x
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@y
    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
    ```
@z

@x
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@y
2. Run a simple Docker service that uses an alpine-based filesystem, and isolates a ping to 8.8.8.8:
@z

@x
    ```console
    $ docker service create --name demo alpine:latest ping 8.8.8.8
    ```
@y
    ```console
    $ docker service create --name demo alpine:latest ping 8.8.8.8
    ```
@z

@x
3. Check that your service created one running container:
@y
3. Check that your service created one running container:
@z

@x
    ```console
    $ docker service ps demo
    ```
@y
    ```console
    $ docker service ps demo
    ```
@z

@x
    You should see something like:
@y
    You should see something like:
@z

@x
    ```shell
    ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
    463j2s3y4b5o        demo.1              alpine:latest       docker-desktop      Running             Running 8 seconds ago
    ```
@y
    ```shell
    ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
    463j2s3y4b5o        demo.1              alpine:latest       docker-desktop      Running             Running 8 seconds ago
    ```
@z

@x
4. Check that you get the logs you'd expect for a ping process:
@y
4. Check that you get the logs you'd expect for a ping process:
@z

@x
    ```console
    $ docker service logs demo
    ```
@y
    ```console
    $ docker service logs demo
    ```
@z

@x
    You should see the output of a healthy ping process:
@y
    You should see the output of a healthy ping process:
@z

@x
    ```shell
    demo.1.463j2s3y4b5o@docker-desktop    | PING 8.8.8.8 (8.8.8.8): 56 data bytes
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=0 ttl=37 time=13.005 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=1 ttl=37 time=13.847 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=2 ttl=37 time=41.296 ms
    ...
    ```
@y
    ```shell
    demo.1.463j2s3y4b5o@docker-desktop    | PING 8.8.8.8 (8.8.8.8): 56 data bytes
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=0 ttl=37 time=13.005 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=1 ttl=37 time=13.847 ms
    demo.1.463j2s3y4b5o@docker-desktop    | 64 bytes from 8.8.8.8: seq=2 ttl=37 time=41.296 ms
    ...
    ```
@z

@x
5. Finally, tear down your test service:
@y
5. Finally, tear down your test service:
@z

@x
    ```console
    $ docker service rm demo
    ```
@y
    ```console
    $ docker service rm demo
    ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
At this point, you've confirmed that you can run simple containerized workloads in Kubernetes and Swarm. The next step is to write a YAML file that describes how to run and manage these containers.
@y
At this point, you've confirmed that you can run simple containerized workloads in Kubernetes and Swarm. The next step is to write a YAML file that describes how to run and manage these containers.
@z

@x
- [Deploy to Kubernetes](kube-deploy.md)
- [Deploy to Swarm](swarm-deploy.md)
@y
- [Deploy to Kubernetes](kube-deploy.md)
- [Deploy to Swarm](swarm-deploy.md)
@z

@x
## CLI references
@y
## CLI references
@z

@x
Further documentation for all CLI commands used in this article are available here:
@y
Further documentation for all CLI commands used in this article are available here:
@z

@x
- [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)
- [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)
- [`kubectl logs`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [`kubectl delete`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#delete)
- [`docker swarm init`](/engine/reference/commandline/swarm_init/)
- [`docker service *`](/engine/reference/commandline/service/)
@y
- [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)
- [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)
- [`kubectl logs`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [`kubectl delete`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#delete)
- [`docker swarm init`](/engine/reference/commandline/swarm_init/)
- [`docker service *`](/engine/reference/commandline/service/)
@z
