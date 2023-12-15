%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Persist the DB
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making your DB persistent in your application
---
@y
---
title: Persist the DB
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making your DB persistent in your application
---
@z

@x
In case you didn't notice, your todo list is empty every single time
you launch the container. Why is this? In this part, you'll dive into how the container is working.
@y
In case you didn't notice, your todo list is empty every single time
you launch the container. Why is this? In this part, you'll dive into how the container is working.
@z

@x
## The container's filesystem
@y
## The container's filesystem
@z

@x
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, even if they're using the same image.
@y
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, even if they're using the same image.
@z

@x
### See this in practice
@y
### See this in practice
@z

@x
To see this in action, you're going to start two containers and create a file in each.
What you'll see is that the files created in one container aren't available in another.
@y
To see this in action, you're going to start two containers and create a file in each.
What you'll see is that the files created in one container aren't available in another.
@z

@x
> **Note**
>
> If you use Windows and want to use Git Bash to run Docker commands, see [Working with Git Bash](../desktop/troubleshoot/topics.md#working-with-git-bash) for syntax differences.
@y
> **Note**
>
> If you use Windows and want to use Git Bash to run Docker commands, see [Working with Git Bash](../desktop/troubleshoot/topics.md#working-with-git-bash) for syntax differences.
@z

@x
1. Start an `ubuntu` container that will create a file named `/data.txt` with a random number
   between 1 and 10000.
@y
1. Start an `ubuntu` container that will create a file named `/data.txt` with a random number
   between 1 and 10000.
@z

@x
    ```console
    $ docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@y
    ```console
    $ docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@z

@x
    In case you're curious about the command, you're starting a bash shell and invoking two
    commands (why you have the `&&`). The first portion picks a single random number and writes
    it to `/data.txt`. The second command is simply watching a file to keep the container running.
@y
    In case you're curious about the command, you're starting a bash shell and invoking two
    commands (why you have the `&&`). The first portion picks a single random number and writes
    it to `/data.txt`. The second command is simply watching a file to keep the container running.
@z

@x
2. Validate that you can see the output by accessing the terminal in the container. To do so, you can use the CLI or Docker Desktop's graphical interface.
@y
2. Validate that you can see the output by accessing the terminal in the container. To do so, you can use the CLI or Docker Desktop's graphical interface.
@z

@x
   {{< tabs group="ui" >}}
   {{< tab name="CLI" >}}
@y
   {{< tabs group="ui" >}}
   {{< tab name="CLI" >}}
@z

@x
   On the command line, use the `docker exec` command to access the container. You need to get the
   container's ID (use `docker ps` to get it). In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, get the content with the following command.
@y
   On the command line, use the `docker exec` command to access the container. You need to get the
   container's ID (use `docker ps` to get it). In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, get the content with the following command.
@z

@x
   ```console
   $ docker exec <container-id> cat /data.txt
   ```
@y
   ```console
   $ docker exec <container-id> cat /data.txt
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Docker Desktop" >}}
@y
   {{< /tab >}}
   {{< tab name="Docker Desktop" >}}
@z

@x
   In Docker Desktop, go to **Containers**, hover over the container running the **ubuntu** image, and select the **Show container actions** menu. From the drop-down menu, select **Open in terminal**.
@y
   In Docker Desktop, go to **Containers**, hover over the container running the **ubuntu** image, and select the **Show container actions** menu. From the drop-down menu, select **Open in terminal**.
@z

@x
   You will see a terminal that is running a shell in the Ubuntu container. Run the following command to see the content of the `/data.txt` file. Close this terminal afterwards again.
@y
   You will see a terminal that is running a shell in the Ubuntu container. Run the following command to see the content of the `/data.txt` file. Close this terminal afterwards again.
@z

@x
   ```console
   $ cat /data.txt
   ```
@y
   ```console
   $ cat /data.txt
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
   You should see a random number.
@y
   You should see a random number.
@z

@x
3. Now, start another `ubuntu` container (the same image) and you'll see you don't have the same file. In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, get the content with the following command.
@y
3. Now, start another `ubuntu` container (the same image) and you'll see you don't have the same file. In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, get the content with the following command.
@z

@x
    ```console
    $ docker run -it ubuntu ls /
    ```
@y
    ```console
    $ docker run -it ubuntu ls /
    ```
@z

@x
    In this case the command lists the files in the root directory of the container.
    Look, there's no `data.txt` file there! That's because it was written to the scratch space for
    only the first container.
@y
    In this case the command lists the files in the root directory of the container.
    Look, there's no `data.txt` file there! That's because it was written to the scratch space for
    only the first container.
@z

@x
4. Go ahead and remove the first container using the `docker rm -f <container-id>` command.
@y
4. Go ahead and remove the first container using the `docker rm -f <container-id>` command.
@z

@x
## Container volumes
@y
## Container volumes
@z

@x
With the previous experiment, you saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when you remove the container 
and Docker isolates all changes to that container. With volumes, you can change all of this.
@y
With the previous experiment, you saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when you remove the container 
and Docker isolates all changes to that container. With volumes, you can change all of this.
@z

@x
[Volumes](../storage/volumes.md) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If you mount a directory in the container, changes in that
directory are also seen on the host machine. If you mount that same directory across container restarts, you'd see
the same files.
@y
[Volumes](../storage/volumes.md) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If you mount a directory in the container, changes in that
directory are also seen on the host machine. If you mount that same directory across container restarts, you'd see
the same files.
@z

@x
There are two main types of volumes. You'll eventually use both, but you'll start with volume mounts.
@y
There are two main types of volumes. You'll eventually use both, but you'll start with volume mounts.
@z

@x
## Persist the todo data
@y
## Persist the todo data
@z

@x
By default, the todo app stores its data in a SQLite database at
`/etc/todos/todo.db` in the container's filesystem. If you're not familiar with SQLite, no worries! It's simply a relational database that stores all the data in a single file. While this isn't the best for large-scale applications,
it works for small demos. You'll learn how to switch this to a different database engine later.
@y
By default, the todo app stores its data in a SQLite database at
`/etc/todos/todo.db` in the container's filesystem. If you're not familiar with SQLite, no worries! It's simply a relational database that stores all the data in a single file. While this isn't the best for large-scale applications,
it works for small demos. You'll learn how to switch this to a different database engine later.
@z

@x
With the database being a single file, if you can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory where you stored the data, you can persist the data. As your container 
writes to the `todo.db` file, it will persist the data to the host in the volume.
@y
With the database being a single file, if you can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory where you stored the data, you can persist the data. As your container 
writes to the `todo.db` file, it will persist the data to the host in the volume.
@z

@x
As mentioned, you're going to use a volume mount. Think of a volume mount as an opaque bucket of data. 
Docker fully manages the volume, including the storage location on disk. You only need to remember the
name of the volume.
@y
As mentioned, you're going to use a volume mount. Think of a volume mount as an opaque bucket of data. 
Docker fully manages the volume, including the storage location on disk. You only need to remember the
name of the volume.
@z

@x
### Create a volume and start the container
@y
### Create a volume and start the container
@z

@x
You can create the volume and start the container using the CLI or Docker Desktop's graphical interface.
@y
You can create the volume and start the container using the CLI or Docker Desktop's graphical interface.
@z

@x
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="ui" >}}
{{< tab name="CLI" >}}
@z

@x
1. Create a volume by using the `docker volume create` command.
@y
1. Create a volume by using the `docker volume create` command.
@z

@x
   ```console
   $ docker volume create todo-db
   ```
@y
   ```console
   $ docker volume create todo-db
   ```
@z

@x
2. Stop and remove the todo app container once again with `docker rm -f <id>`, as it is still running without using the persistent volume.
@y
2. Stop and remove the todo app container once again with `docker rm -f <id>`, as it is still running without using the persistent volume.
@z

@x
3. Start the todo app container, but add the `--mount` option to specify a volume mount. Give the volume a name, and mount
   it to `/etc/todos` in the container, which captures all files created at the path. In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, run the following command:
@y
3. Start the todo app container, but add the `--mount` option to specify a volume mount. Give the volume a name, and mount
   it to `/etc/todos` in the container, which captures all files created at the path. In your Mac or Linux terminal, or in Windows Command Prompt or PowerShell, run the following command:
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started
   ```
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
To create a volume:
@y
To create a volume:
@z

@x
1. Select **Volumes** in Docker Desktop.
2. In **Volumes**, select **Create**.
3. Specify `todo-db` as the volume name, and then select **Create**.
@y
1. Select **Volumes** in Docker Desktop.
2. In **Volumes**, select **Create**.
3. Specify `todo-db` as the volume name, and then select **Create**.
@z

@x
To stop and remove the app container:
@y
To stop and remove the app container:
@z

@x
1. Select **Containers** in Docker Desktop.
2. Select **Delete** in the **Actions** column for the container.
@y
1. Select **Containers** in Docker Desktop.
2. Select **Delete** in the **Actions** column for the container.
@z

@x
To start the todo app container with the volume mounted:
@y
To start the todo app container with the volume mounted:
@z

@x
1. Select the search box at the top of Docker Desktop.
2. In the search window, select the **Images** tab.
3. In the search box, specify the container name, `getting-started`.
@y
1. Select the search box at the top of Docker Desktop.
2. In the search window, select the **Images** tab.
3. In the search box, specify the container name, `getting-started`.
@z

@x
   > **Tip**
   >
   >  Use the search filter to filter images and only show **Local images**.
   { .tip }
@y
   > **Tip**
   >
   >  Use the search filter to filter images and only show **Local images**.
   { .tip }
@z

@x
4. Select your image and then select **Run**.
5. Select **Optional settings**.
6. In **Host port**, specify the port, for example, `3000`.
7. In **Host path**, specify the name of the volume, `todo-db`.
8. In **Container path**, specify `/etc/todos`.
9. Select **Run**.
@y
4. Select your image and then select **Run**.
5. Select **Optional settings**.
6. In **Host port**, specify the port, for example, `3000`.
7. In **Host path**, specify the name of the volume, `todo-db`.
8. In **Container path**, specify `/etc/todos`.
9. Select **Run**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Verify that the data persists
@y
### Verify that the data persists
@z

@x
1. Once the container starts up, open the app and add a few items to your todo list.
@y
1. Once the container starts up, open the app and add a few items to your todo list.
@z

@x
    ![Items added to todo list](images/items-added.webp)
@y
    ![Items added to todo list](images/items-added.webp)
@z

@x
2. Stop and remove the container for the todo app. Use Docker Desktop or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@y
2. Stop and remove the container for the todo app. Use Docker Desktop or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@z

@x
3. Start a new container using the previous steps.
@y
3. Start a new container using the previous steps.
@z

@x
4. Open the app. You should see your items still in your list.
@y
4. Open the app. You should see your items still in your list.
@z

@x
5. Go ahead and remove the container when you're done checking out your list.
@y
5. Go ahead and remove the container when you're done checking out your list.
@z

@x
You've now learned how to persist data.
@y
You've now learned how to persist data.
@z

@x
## Dive into the volume
@y
## Dive into the volume
@z

@x
A lot of people frequently ask "Where is Docker storing my data when I use a volume?" If you want to know, 
you can use the `docker volume inspect` command.
@y
A lot of people frequently ask "Where is Docker storing my data when I use a volume?" If you want to know, 
you can use the `docker volume inspect` command.
@z

@x
```console
$ docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@y
```console
$ docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@z

@x
The `Mountpoint` is the actual location of the data on the disk. Note that on most machines, you will
need to have root access to access this directory from the host.
@y
The `Mountpoint` is the actual location of the data on the disk. Note that on most machines, you will
need to have root access to access this directory from the host.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to persist container data.
@y
In this section, you learned how to persist container data.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Volumes](../storage/volumes.md)
@y
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Volumes](../storage/volumes.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn how you can develop your app more efficiently using bind mounts.
@y
Next, you'll learn how you can develop your app more efficiently using bind mounts.
@z

@x
{{< button text="Use bind mounts" url="06_bind_mounts.md" >}}
@y
{{< button text="Use bind mounts" url="06_bind_mounts.md" >}}
@z
