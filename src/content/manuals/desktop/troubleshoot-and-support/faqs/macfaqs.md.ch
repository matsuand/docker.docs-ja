%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked questions for Docker Desktop for Mac
keywords: desktop, mac, faqs
title: FAQs for Docker Desktop for Mac
linkTitle: Mac
@y
description: Frequently asked questions for Docker Desktop for Mac
keywords: desktop, mac, faqs
title: FAQs for Docker Desktop for Mac
linkTitle: Mac
@z

@x
### What is HyperKit?
@y
### What is HyperKit?
@z

@x
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other dependencies.
@y
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other dependencies.
@z

@x
Docker uses HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMware Fusion.
@y
Docker uses HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMware Fusion.
@z

@x
### What is the benefit of HyperKit?
@y
### What is the benefit of HyperKit?
@z

@x
HyperKit is thinner than VirtualBox and VMware fusion, and the version included is customized for Docker workloads on Mac.
@y
HyperKit is thinner than VirtualBox and VMware fusion, and the version included is customized for Docker workloads on Mac.
@z

@x
### Where does Docker Desktop store Linux containers and images? 
@y
### Where does Docker Desktop store Linux containers and images? 
@z

@x
Docker Desktop stores Linux containers and images in a single, large "disk image" file in the Mac filesystem. This is different from Docker on Linux, which usually stores containers and images in the `/var/lib/docker` directory.
@y
Docker Desktop stores Linux containers and images in a single, large "disk image" file in the Mac filesystem. This is different from Docker on Linux, which usually stores containers and images in the `/var/lib/docker` directory.
@z

@x
#### Where is the disk image file?
@y
#### Where is the disk image file?
@z

@x
To locate the disk image file, select **Settings** from the Docker Desktop Dashboard then **Advanced** from the **Resources** tab.
@y
To locate the disk image file, select **Settings** from the Docker Desktop Dashboard then **Advanced** from the **Resources** tab.
@z

@x
The **Advanced** tab displays the location of the disk image. It also displays the maximum size of the disk image and the actual space the disk image is consuming. Note that other tools might display space usage of the file in terms of the maximum file size, and not the actual file size.
@y
The **Advanced** tab displays the location of the disk image. It also displays the maximum size of the disk image and the actual space the disk image is consuming. Note that other tools might display space usage of the file in terms of the maximum file size, and not the actual file size.
@z

@x
#### What if the file is too big?
@y
#### What if the file is too big?
@z

@x
If the disk image file is too big, you can:
@y
If the disk image file is too big, you can:
@z

@x
- Move it to a bigger drive
- Delete unnecessary containers and images
- Reduce the maximum allowable size of the file
@y
- Move it to a bigger drive
- Delete unnecessary containers and images
- Reduce the maximum allowable size of the file
@z

@x
##### How do I move the file to a bigger drive?
@y
##### How do I move the file to a bigger drive?
@z

@x
To move the disk image file to a different location:
@y
To move the disk image file to a different location:
@z

@x
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@y
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@z

@x
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@y
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@z

@x
3. Select **Apply** for the changes to take effect.
@y
3. Select **Apply** for the changes to take effect.
@z

@x
> [!IMPORTANT]
>
> Do not move the file directly in Finder as this can cause Docker Desktop to lose track of the file.
@y
> [!IMPORTANT]
>
> Do not move the file directly in Finder as this can cause Docker Desktop to lose track of the file.
@z

@x
##### How do I delete unnecessary containers and images?
@y
##### How do I delete unnecessary containers and images?
@z

@x
Check whether you have any unnecessary containers and images. If your client and daemon API are running version 1.25 or later (use the `docker version` command on the client to check your client and daemon API versions), you can see the detailed space usage information by running:
@y
Check whether you have any unnecessary containers and images. If your client and daemon API are running version 1.25 or later (use the `docker version` command on the client to check your client and daemon API versions), you can see the detailed space usage information by running:
@z

@x
```console
$ docker system df -v
```
@y
```console
$ docker system df -v
```
@z

@x
Alternatively, to list images, run:
@y
Alternatively, to list images, run:
@z

@x
```console
$ docker image ls
```
@y
```console
$ docker image ls
```
@z

@x
To list containers, run:
@y
To list containers, run:
@z

@x
```console
$ docker container ls -a
```
@y
```console
$ docker container ls -a
```
@z

@x
If there are lots of redundant objects, run the command:
@y
If there are lots of redundant objects, run the command:
@z

@x
```console
$ docker system prune
```
@y
```console
$ docker system prune
```
@z

@x
This command removes all stopped containers, unused networks, dangling images, and build cache.
@y
This command removes all stopped containers, unused networks, dangling images, and build cache.
@z

@x
It might take a few minutes to reclaim space on the host depending on the format of the disk image file. If the file is named:
@y
It might take a few minutes to reclaim space on the host depending on the format of the disk image file. If the file is named:
@z

@x
- `Docker.raw`, space on the host is reclaimed within a few seconds.
- `Docker.qcow2`, space is freed by a background process after a few minutes.
@y
- `Docker.raw`, space on the host is reclaimed within a few seconds.
- `Docker.qcow2`, space is freed by a background process after a few minutes.
@z

@x
Space is only freed when images are deleted. Space is not freed automatically when files are deleted inside running containers. To trigger a space reclamation at any point, run the command:
@y
Space is only freed when images are deleted. Space is not freed automatically when files are deleted inside running containers. To trigger a space reclamation at any point, run the command:
@z

@x
```console
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@y
```console
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@z

@x
Note that many tools report the maximum file size, not the actual file size.
To query the actual size of the file on the host from a terminal, run:
@y
Note that many tools report the maximum file size, not the actual file size.
To query the actual size of the file on the host from a terminal, run:
@z

@x
```console
$ cd ~/Library/Containers/com.docker.docker/Data/vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@y
```console
$ cd ~/Library/Containers/com.docker.docker/Data/vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@z

@x
In this example, the actual size of the disk is `2333548` KB, whereas the maximum size of the disk is `64` GB.
@y
In this example, the actual size of the disk is `2333548` KB, whereas the maximum size of the disk is `64` GB.
@z

@x
##### How do I reduce the maximum size of the file?
@y
##### How do I reduce the maximum size of the file?
@z

@x
To reduce the maximum size of the disk image file:
@y
To reduce the maximum size of the disk image file:
@z

@x
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@y
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@z

@x
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@y
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@z

@x
3. Select **Apply**.
@y
3. Select **Apply**.
@z

@x
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@y
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@z

@x
### How do I add TLS certificates?
@y
### How do I add TLS certificates?
@z

@x
You can add trusted Certificate Authorities (CAs) (used to verify registry
server certificates) and client certificates (used to authenticate to
registries) to your Docker daemon.
@y
You can add trusted Certificate Authorities (CAs) (used to verify registry
server certificates) and client certificates (used to authenticate to
registries) to your Docker daemon.
@z

@x
#### Add custom CA certificates (server side)
@y
#### Add custom CA certificates (server side)
@z

@x
All trusted CAs (root or intermediate) are supported. Docker Desktop creates a
certificate bundle of all user-trusted CAs based on the Mac Keychain, and
appends it to Moby trusted certificates. So if an enterprise SSL certificate is
trusted by the user on the host, it is trusted by Docker Desktop.
@y
All trusted CAs (root or intermediate) are supported. Docker Desktop creates a
certificate bundle of all user-trusted CAs based on the Mac Keychain, and
appends it to Moby trusted certificates. So if an enterprise SSL certificate is
trusted by the user on the host, it is trusted by Docker Desktop.
@z

@x
To manually add a custom, self-signed certificate, start by adding the
certificate to the macOS keychain, which is picked up by Docker Desktop. Here is
an example:
@y
To manually add a custom, self-signed certificate, start by adding the
certificate to the macOS keychain, which is picked up by Docker Desktop. Here is
an example:
@z

@x
```console
$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.crt
```
@y
```console
$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.crt
```
@z

@x
Or, if you prefer to add the certificate to your own local keychain only (rather
than for all users), run this command instead:
@y
Or, if you prefer to add the certificate to your own local keychain only (rather
than for all users), run this command instead:
@z

@x
```console
$ security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain ca.crt
```
@y
```console
$ security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain ca.crt
```
@z

@x
See also, [Directory structures for
certificates](#directory-structures-for-certificates).
@y
See also, [Directory structures for
certificates](#directory-structures-for-certificates).
@z

@x
> [!NOTE]
>
> You need to restart Docker Desktop after making any changes to the keychain or
> to the `~/.docker/certs.d` directory in order for the changes to take effect.
@y
> [!NOTE]
>
> You need to restart Docker Desktop after making any changes to the keychain or
> to the `~/.docker/certs.d` directory in order for the changes to take effect.
@z

@x
For a complete explanation of how to do this, see the blog post [Adding
Self-signed Registry Certs to Docker & Docker Desktop for
Mac](https://blog.container-solutions.com/adding-self-signed-registry-certs-docker-mac).
@y
For a complete explanation of how to do this, see the blog post [Adding
Self-signed Registry Certs to Docker & Docker Desktop for
Mac](https://blog.container-solutions.com/adding-self-signed-registry-certs-docker-mac).
@z

@x
#### Add client certificates
@y
#### Add client certificates
@z

@x
You can put your client certificates in
`~/.docker/certs.d/<MyRegistry>:<Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`.
@y
You can put your client certificates in
`~/.docker/certs.d/<MyRegistry>:<Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`.
@z

@x
When the Docker Desktop application starts, it copies the `~/.docker/certs.d`
folder on your Mac to the `/etc/docker/certs.d` directory on Moby (the Docker
Desktop `xhyve` virtual machine).
@y
When the Docker Desktop application starts, it copies the `~/.docker/certs.d`
folder on your Mac to the `/etc/docker/certs.d` directory on Moby (the Docker
Desktop `xhyve` virtual machine).
@z

@x
> [!NOTE]
>
> * You need to restart Docker Desktop after making any changes to the keychain
>   or to the `~/.docker/certs.d` directory in order for the changes to take
>   effect.
>
> * The registry cannot be listed as an _insecure registry_. Docker Desktop ignores certificates listed
>   under insecure registries, and does not send client certificates. Commands
>   like `docker run` that attempt to pull from the registry produce error
>   messages on the command line, as well as on the registry.
@y
> [!NOTE]
>
> * You need to restart Docker Desktop after making any changes to the keychain
>   or to the `~/.docker/certs.d` directory in order for the changes to take
>   effect.
>
> * The registry cannot be listed as an _insecure registry_. Docker Desktop ignores certificates listed
>   under insecure registries, and does not send client certificates. Commands
>   like `docker run` that attempt to pull from the registry produce error
>   messages on the command line, as well as on the registry.
@z

@x
#### Directory structures for certificates
@y
#### Directory structures for certificates
@z

@x
If you have this directory structure, you do not need to manually add the CA
certificate to your Mac OS system login:
@y
If you have this directory structure, you do not need to manually add the CA
certificate to your Mac OS system login:
@z

@x
```text
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
   ├── ca.crt
   ├── client.cert
   └── client.key
```
@y
```text
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
   ├── ca.crt
   ├── client.cert
   └── client.key
```
@z

@x
The following further illustrates and explains a configuration with custom
certificates:
@y
The following further illustrates and explains a configuration with custom
certificates:
@z

@x
```text
/etc/docker/certs.d/        <-- Certificate directory
└── localhost:5000          <-- Hostname:port
   ├── client.cert          <-- Client certificate
   ├── client.key           <-- Client key
   └── ca.crt               <-- Certificate authority that signed
                                the registry certificate
```
@y
```text
/etc/docker/certs.d/        <-- Certificate directory
└── localhost:5000          <-- Hostname:port
   ├── client.cert          <-- Client certificate
   ├── client.key           <-- Client key
   └── ca.crt               <-- Certificate authority that signed
                                the registry certificate
```
@z

@x
You can also have this directory structure, as long as the CA certificate is
also in your keychain.
@y
You can also have this directory structure, as long as the CA certificate is
also in your keychain.
@z

@x
```text
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
    ├── client.cert
    └── client.key
```
@y
```text
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
    ├── client.cert
    └── client.key
```
@z

@x
To learn more about how to install a CA root certificate for the registry and
how to set the client TLS certificate for verification, see
[Verify repository client with certificates](/manuals/engine/security/certificates.md)
in the Docker Engine topics.
@y
To learn more about how to install a CA root certificate for the registry and
how to set the client TLS certificate for verification, see
[Verify repository client with certificates](manuals/engine/security/certificates.md)
in the Docker Engine topics.
@z
