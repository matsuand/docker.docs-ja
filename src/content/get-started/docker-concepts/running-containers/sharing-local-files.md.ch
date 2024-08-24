%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Sharing local files with containers
keywords: concepts, images, container, docker desktop
description: This concept page will teach you the various storage options available in Docker and their common usage.
@y
title: Sharing local files with containers
keywords: concepts, images, container, docker desktop
description: This concept page will teach you the various storage options available in Docker and their common usage.
@z

@x
{{< youtube-embed 2dAzsVg3Dek >}}
@y
{{< youtube-embed 2dAzsVg3Dek >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
Each container has everything it needs to function with no reliance on any pre-installed dependencies on the host machine. Since containers run in isolation, they have minimal influence on the host and other containers. This isolation has a major benefit: containers minimize conflicts with the host system and other containers. However, this isolation also means containers can't directly access data on the host machine by default.
@y
Each container has everything it needs to function with no reliance on any pre-installed dependencies on the host machine. Since containers run in isolation, they have minimal influence on the host and other containers. This isolation has a major benefit: containers minimize conflicts with the host system and other containers. However, this isolation also means containers can't directly access data on the host machine by default.
@z

@x
Consider a scenario where you have a web application container that requires access to configuration settings stored in a file on your host system. This file may contain sensitive data such as database credentials or API keys. Storing such sensitive information directly within the container image poses security risks, especially during image sharing. To address this challenge, Docker offers storage options that bridge the gap between container isolation and your host machine's data.
@y
Consider a scenario where you have a web application container that requires access to configuration settings stored in a file on your host system. This file may contain sensitive data such as database credentials or API keys. Storing such sensitive information directly within the container image poses security risks, especially during image sharing. To address this challenge, Docker offers storage options that bridge the gap between container isolation and your host machine's data.
@z

@x
Docker offers two primary storage options for persisting data and sharing files between the host machine and containers: volumes and bind mounts.
@y
Docker offers two primary storage options for persisting data and sharing files between the host machine and containers: volumes and bind mounts.
@z

@x
### Volume versus bind mounts
@y
### Volume versus bind mounts
@z

@x
If you want to ensure that data generated or modified inside the container persists even after the container stops running, you would opt for a volume. See [Persisting container data](/get-started/docker-concepts/running-containers/persisting-container-data/) to learn more about volumes and their use cases.
@y
If you want to ensure that data generated or modified inside the container persists even after the container stops running, you would opt for a volume. See [Persisting container data](__SUBDIR__/get-started/docker-concepts/running-containers/persisting-container-data/) to learn more about volumes and their use cases.
@z

@x
If you have specific files or directories on your host system that you want to directly share with your container, like configuration files or development code, then you would use a bind mount. It's like opening a direct portal between your host and container for sharing. Bind mounts are ideal for development environments where real-time file access and sharing between the host and container are crucial.
@y
If you have specific files or directories on your host system that you want to directly share with your container, like configuration files or development code, then you would use a bind mount. It's like opening a direct portal between your host and container for sharing. Bind mounts are ideal for development environments where real-time file access and sharing between the host and container are crucial.
@z

@x
### Sharing files between a host and container
@y
### Sharing files between a host and container
@z

@x
Both `-v` (or `--volume`) and `--mount` flags used with the `docker run` command let you share files or directories between your local machine (host) and a Docker container. However, there are some key differences in their behavior and usage.
@y
Both `-v` (or `--volume`) and `--mount` flags used with the `docker run` command let you share files or directories between your local machine (host) and a Docker container. However, there are some key differences in their behavior and usage.
@z

@x
The `-v` flag is simpler and more convenient for basic volume or bind mount operations. If the host location doesn’t exist when using `-v` or `--volume`, a directory will be automatically created.
@y
The `-v` flag is simpler and more convenient for basic volume or bind mount operations. If the host location doesn’t exist when using `-v` or `--volume`, a directory will be automatically created.
@z

@x
Imagine you're a developer working on a project. You have a source directory on your development machine where your code resides. When you compile or build your code, the generated artifacts (compiled code, executables, images, etc.) are saved in a separate subdirectory within your source directory. In the following examples, this subdirectory is `/HOST/PATH`. Now you want these build artifacts to be accessible within a Docker container running your application. Additionally, you want the container to automatically access the latest build artifacts whenever you rebuild your code.
@y
Imagine you're a developer working on a project. You have a source directory on your development machine where your code resides. When you compile or build your code, the generated artifacts (compiled code, executables, images, etc.) are saved in a separate subdirectory within your source directory. In the following examples, this subdirectory is `/HOST/PATH`. Now you want these build artifacts to be accessible within a Docker container running your application. Additionally, you want the container to automatically access the latest build artifacts whenever you rebuild your code.
@z

@x
Here's a way to use `docker run` to start a container using a bind mount and map it to the container file location.
@y
Here's a way to use `docker run` to start a container using a bind mount and map it to the container file location.
@z

@x
```console
$ docker run -v /HOST/PATH:/CONTAINER/PATH -it nginx
```
@y
```console
$ docker run -v /HOST/PATH:/CONTAINER/PATH -it nginx
```
@z

@x
The `--mount` flag offers more advanced features and granular control, making it suitable for complex mount scenarios or production deployments. If you use `--mount` to bind-mount a file or directory that doesn't yet exist on the Docker host, the `docker run` command doesn't automatically create it for you but generates an error.
@y
The `--mount` flag offers more advanced features and granular control, making it suitable for complex mount scenarios or production deployments. If you use `--mount` to bind-mount a file or directory that doesn't yet exist on the Docker host, the `docker run` command doesn't automatically create it for you but generates an error.
@z

@x
```console
$ docker run --mount type=bind,source=/HOST/PATH,target=/CONTAINER/PATH,readonly nginx
```
@y
```console
$ docker run --mount type=bind,source=/HOST/PATH,target=/CONTAINER/PATH,readonly nginx
```
@z

@x
> [!NOTE]
>
> Docker recommends using the `--mount` syntax instead of `-v`. It provides better control over the mounting process and avoids potential issues with missing directories.
@y
> [!NOTE]
>
> Docker recommends using the `--mount` syntax instead of `-v`. It provides better control over the mounting process and avoids potential issues with missing directories.
@z

@x
### File permissions for Docker access to host files
@y
### File permissions for Docker access to host files
@z

@x
When using bind mounts, it's crucial to ensure that Docker has the necessary permissions to access the host directory. To grant read/write access, you can use the `:ro` flag (read-only) or `:rw` (read-write) with the `-v` or `--mount` flag during container creation.
For example, the following command grants read-write access permission.
@y
When using bind mounts, it's crucial to ensure that Docker has the necessary permissions to access the host directory. To grant read/write access, you can use the `:ro` flag (read-only) or `:rw` (read-write) with the `-v` or `--mount` flag during container creation.
For example, the following command grants read-write access permission.
@z

@x
```console
$ docker run -v HOST-DIRECTORY:/CONTAINER-DIRECTORY:rw nginx
```
@y
```console
$ docker run -v HOST-DIRECTORY:/CONTAINER-DIRECTORY:rw nginx
```
@z

@x
Read-only bind mounts let the container access the mounted files on the host for reading, but it can't change or delete the files. With read-write bind mounts, containers can modify or delete mounted files, and these changes or deletions will also be reflected on the host system. Read-only bind mounts ensures that files on the host can't be accidentally modified or deleted by a container.
@y
Read-only bind mounts let the container access the mounted files on the host for reading, but it can't change or delete the files. With read-write bind mounts, containers can modify or delete mounted files, and these changes or deletions will also be reflected on the host system. Read-only bind mounts ensures that files on the host can't be accidentally modified or deleted by a container.
@z

@x
> **Synchronised File Share**
>
> As your codebase grows larger, traditional methods of file sharing like bind mounts may become inefficient or slow, especially in development environments where frequent access to files is necessary. [Synchronized file shares](/desktop/synchronized-file-sharing/) improve bind mount performance by leveraging synchronized filesystem caches. This optimization ensures that file access between the host and virtual machine (VM) is fast and efficient.
@y
> **Synchronised File Share**
>
> As your codebase grows larger, traditional methods of file sharing like bind mounts may become inefficient or slow, especially in development environments where frequent access to files is necessary. [Synchronized file shares](__SUBDIR__/desktop/synchronized-file-sharing/) improve bind mount performance by leveraging synchronized filesystem caches. This optimization ensures that file access between the host and virtual machine (VM) is fast and efficient.
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you’ll practice how to create and use a bind mount to share files between a host and a container.
@y
In this hands-on guide, you’ll practice how to create and use a bind mount to share files between a host and a container.
@z

@x
### Run a container
@y
### Run a container
@z

@x
1. [Download and install](/get-started/get-docker/) Docker Desktop.
@y
1. [Download and install](__SUBDIR__/get-started/get-docker/) Docker Desktop.
@z

@x
2. Start a container using the [httpd](https://hub.docker.com/_/httpd) image with the following command:
@y
2. Start a container using the [httpd](https://hub.docker.com/_/httpd) image with the following command:
@z

@x
   ```console
   $ docker run -d -p 8080:80 --name my_site httpd:2.4
   ```
@y
   ```console
   $ docker run -d -p 8080:80 --name my_site httpd:2.4
   ```
@z

@x
   This will start the `httpd` service in the background, and publish the webpage to port `8080` on the host.
@y
   This will start the `httpd` service in the background, and publish the webpage to port `8080` on the host.
@z

@x
3. Open the browser and access [http://localhost:8080](http://localhost:8080) or use the curl command to verify if it's working fine or not.
@y
3. Open the browser and access [http://localhost:8080](http://localhost:8080) or use the curl command to verify if it's working fine or not.
@z

@x
    ```console
    $ curl localhost:8080
    ```
@y
    ```console
    $ curl localhost:8080
    ```
@z

@x
### Use a bind mount
@y
### Use a bind mount
@z

@x
Using a bind mount, you can map the configuration file on your host computer to a specific location within the container. In this example, you’ll see how to change the look and feel of the webpage by using bind mount:
@y
Using a bind mount, you can map the configuration file on your host computer to a specific location within the container. In this example, you’ll see how to change the look and feel of the webpage by using bind mount:
@z

@x
1. Delete the existing container by using the Docker Dashboard:
@y
1. Delete the existing container by using the Docker Dashboard:
@z

@x
   ![A screenshot of Docker dashboard showing how to delete the httpd container](images/delete-httpd-container.webp?border=true)
@y
   ![A screenshot of Docker dashboard showing how to delete the httpd container](images/delete-httpd-container.webp?border=true)
@z

@x
2. Create a new directory called `public_html` on your host system.
@y
2. Create a new directory called `public_html` on your host system.
@z

@x
    ```console
    $ mkdir public_html
    ```
@y
    ```console
    $ mkdir public_html
    ```
@z

@x
3. Change the directory to `public_html` and create a file called `index.html` with the following content. This is a basic HTML document that creates a simple webpage that welcomes you with a friendly whale.
@y
3. Change the directory to `public_html` and create a file called `index.html` with the following content. This is a basic HTML document that creates a simple webpage that welcomes you with a friendly whale.
@z

@x
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <title> My Website with a Whale & Docker!</title>
    </head>
    <body>
    <h1>Whalecome!!</h1>
    <p>Look! There's a friendly whale greeting you!</p>
    <pre id="docker-art">
       ##         .
      ## ## ##        ==
     ## ## ## ## ##    ===
     /"""""""""""""""""\___/ ===
   {                       /  ===-
   \______ O           __/
    \    \         __/
     \____\_______/
@y
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <title> My Website with a Whale & Docker!</title>
    </head>
    <body>
    <h1>Whalecome!!</h1>
    <p>Look! There's a friendly whale greeting you!</p>
    <pre id="docker-art">
       ##         .
      ## ## ##        ==
     ## ## ## ## ##    ===
     /"""""""""""""""""\___/ ===
   {                       /  ===-
   \______ O           __/
    \    \         __/
     \____\_______/
@z

@x
    Hello from Docker!
    </pre>
    </body>
    </html>
    ```
@y
    Hello from Docker!
    </pre>
    </body>
    </html>
    ```
@z

@x
4. It's time to run the container. The `--mount` and `-v` examples produce the same result. You can't run them both unless you remove the `my_site` container after running the first one.
@y
4. It's time to run the container. The `--mount` and `-v` examples produce the same result. You can't run them both unless you remove the `my_site` container after running the first one.
@z

@x
   {{< tabs >}}
   {{< tab name="`-v`" >}}
@y
   {{< tabs >}}
   {{< tab name="`-v`" >}}
@z

@x
   ```console
   $ docker run -d --name my_site -p 8080:80 -v .:/usr/local/apache2/htdocs/ httpd:2.4
   ```
@y
   ```console
   $ docker run -d --name my_site -p 8080:80 -v .:/usr/local/apache2/htdocs/ httpd:2.4
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="`--mount`" >}}
@y
   {{< /tab >}}
   {{< tab name="`--mount`" >}}
@z

@x
   ```console
   $ docker run -d --name my_site -p 8080:80 --mount type=bind,source=./,target=/usr/local/apache2/htdocs/ httpd:2.4
   ```
@y
   ```console
   $ docker run -d --name my_site -p 8080:80 --mount type=bind,source=./,target=/usr/local/apache2/htdocs/ httpd:2.4
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
   > [!TIP]  
   > When using the `-v` or `--mount` flag in Windows PowerShell, you need to provide the absolute path to your directory instead of just `./`. This is because PowerShell handles relative paths differently from bash (commonly used in Mac and Linux environments).    
@y
   > [!TIP]  
   > When using the `-v` or `--mount` flag in Windows PowerShell, you need to provide the absolute path to your directory instead of just `./`. This is because PowerShell handles relative paths differently from bash (commonly used in Mac and Linux environments).    
@z

@x
   With everything now up and running, you should be able to access the site via [http://localhost:8080](http://localhost:8080) and find a new webpage that welcomes you with a friendly whale.
@y
   With everything now up and running, you should be able to access the site via [http://localhost:8080](http://localhost:8080) and find a new webpage that welcomes you with a friendly whale.
@z

@x
### Access the file on the Docker Dashboard
@y
### Access the file on the Docker Dashboard
@z

@x
1. You can view the mounted files inside a container by selecting the container's **Files** tab and then selecting a file inside the `/usr/local/apache2/htdocs/` directory. Then, select **Open file editor**.
@y
1. You can view the mounted files inside a container by selecting the container's **Files** tab and then selecting a file inside the `/usr/local/apache2/htdocs/` directory. Then, select **Open file editor**.
@z

@x
   ![A screenshot of Docker dashboard showing the mounted files inside the a container](images/mounted-files.webp?border=true)
@y
   ![A screenshot of Docker dashboard showing the mounted files inside the a container](images/mounted-files.webp?border=true)
@z

@x
2. Delete the file on the host and verify the file is also deleted in the container. You will find that the files no longer exist under **Files** in the Docker Dashboard.
@y
2. Delete the file on the host and verify the file is also deleted in the container. You will find that the files no longer exist under **Files** in the Docker Dashboard.
@z

@x
   ![A screenshot of Docker dashboard showing the deleted files inside the a container](images/deleted-files.webp?border=true)
@y
   ![A screenshot of Docker dashboard showing the deleted files inside the a container](images/deleted-files.webp?border=true)
@z

@x
3. Recreate the HTML file on the host system and see that file re-appears under the **Files** tab under **Containers** on the Docker Dashboard. By now, you will be able to access the site too.
@y
3. Recreate the HTML file on the host system and see that file re-appears under the **Files** tab under **Containers** on the Docker Dashboard. By now, you will be able to access the site too.
@z

@x
### Stop your container
@y
### Stop your container
@z

@x
The container continues to run until you stop it.
@y
The container continues to run until you stop it.
@z

@x
1. Go to the **Containers** view in the Docker Dashboard.
@y
1. Go to the **Containers** view in the Docker Dashboard.
@z

@x
2. Locate the container you'd like to stop.
@y
2. Locate the container you'd like to stop.
@z

@x
3. Select the **Delete** action in the Actions column.
@y
3. Select the **Delete** action in the Actions column.
@z

@x
![A screenshot of Docker dashboard showing how to delete the container](images/delete-the-container.webp?border=true)
@y
![A screenshot of Docker dashboard showing how to delete the container](images/delete-the-container.webp?border=true)
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
The following resources will help you learn more about bind mounts:
@y
The following resources will help you learn more about bind mounts:
@z

@x
* [Manage data in Docker](/storage/)
* [Volumes](/storage/volumes/)
* [Bind mounts](/storage/bind-mounts/)
* [Running containers](/reference/run/)
* [Troubleshoot storage errors](/storage/troubleshooting_volume_errors/)
* [Persisting container data](/get-started/docker-concepts/running-containers/persisting-container-data/)
@y
* [Manage data in Docker](__SUBDIR__/storage/)
* [Volumes](__SUBDIR__/storage/volumes/)
* [Bind mounts](__SUBDIR__/storage/bind-mounts/)
* [Running containers](__SUBDIR__/reference/run/)
* [Troubleshoot storage errors](__SUBDIR__/storage/troubleshooting_volume_errors/)
* [Persisting container data](__SUBDIR__/get-started/docker-concepts/running-containers/persisting-container-data/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have learned about sharing local files with containers, it’s time to learn about multi-container applications.
@y
Now that you have learned about sharing local files with containers, it’s time to learn about multi-container applications.
@z

@x
{{< button text="Multi-container applications" url="Multi-container applications" >}}
@y
{{< button text="Multi-container applications" url="Multi-container applications" >}}
@z
