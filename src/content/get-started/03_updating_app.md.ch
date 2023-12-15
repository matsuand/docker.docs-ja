%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Update the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making changes to your application
---
@y
---
title: Update the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Making changes to your application
---
@z

@x
In [part 2](./02_our_app.md), you containerized a todo application. In this part, you'll update the application and image. You'll also learn how to stop and remove a container.
@y
In [part 2](./02_our_app.md), you containerized a todo application. In this part, you'll update the application and image. You'll also learn how to stop and remove a container.
@z

@x
## Update the source code
@y
## Update the source code
@z

@x
In the following steps, you'll change the "empty text" when you don't have any todo list items to "You have no todo items yet! Add one above!"
@y
In the following steps, you'll change the "empty text" when you don't have any todo list items to "You have no todo items yet! Add one above!"
@z

@x
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@y
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@z

@x
   ```diff
   - <p className="text-center">No items yet! Add one above!</p>
   + <p className="text-center">You have no todo items yet! Add one above!</p>
   ```
@y
   ```diff
   - <p className="text-center">No items yet! Add one above!</p>
   + <p className="text-center">You have no todo items yet! Add one above!</p>
   ```
@z

@x
2. Build your updated version of the image, using the `docker build` command.
@y
2. Build your updated version of the image, using the `docker build` command.
@z

@x
   ```console
   $ docker build -t getting-started .
   ```
@y
   ```console
   $ docker build -t getting-started .
   ```
@z

@x
3. Start a new container using the updated code.
@y
3. Start a new container using the updated code.
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@z

@x
You probably saw an error like this:
@y
You probably saw an error like this:
@z

@x
```console
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 127.0.0.1:3000 failed: port is already allocated.
```
@y
```console
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 127.0.0.1:3000 failed: port is already allocated.
```
@z

@x
The error occurred because you aren't able to start the new container while your old container is still running. The reason is that the old container is already using the host's port 3000 and only one process on the machine (containers included) can listen to a specific port. To fix this, you need to remove the old container.
@y
The error occurred because you aren't able to start the new container while your old container is still running. The reason is that the old container is already using the host's port 3000 and only one process on the machine (containers included) can listen to a specific port. To fix this, you need to remove the old container.
@z

@x
## Remove the old container
@y
## Remove the old container
@z

@x
To remove a container, you first need to stop it. Once it has stopped, you can remove it. You can remove the old container using the CLI or Docker Desktop's graphical interface. Choose the option that you're most comfortable with.
@y
To remove a container, you first need to stop it. Once it has stopped, you can remove it. You can remove the old container using the CLI or Docker Desktop's graphical interface. Choose the option that you're most comfortable with.
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
### Remove a container using the CLI
@y
### Remove a container using the CLI
@z

@x
1. Get the ID of the container by using the `docker ps` command.
@y
1. Get the ID of the container by using the `docker ps` command.
@z

@x
   ```console
   $ docker ps
   ```
@y
   ```console
   $ docker ps
   ```
@z

@x
2. Use the `docker stop` command to stop the container. Replace `<the-container-id>` with the ID from `docker ps`.
@y
2. Use the `docker stop` command to stop the container. Replace `<the-container-id>` with the ID from `docker ps`.
@z

@x
   ```console
   $ docker stop <the-container-id>
   ```
@y
   ```console
   $ docker stop <the-container-id>
   ```
@z

@x
3. Once the container has stopped, you can remove it by using the `docker rm` command.
@y
3. Once the container has stopped, you can remove it by using the `docker rm` command.
@z

@x
   ```console
   $ docker rm <the-container-id>
   ```
@y
   ```console
   $ docker rm <the-container-id>
   ```
@z

@x
>**Note**
>
>You can stop and remove a container in a single command by adding the `force` flag to the `docker rm` command. For example: `docker rm -f <the-container-id>`
@y
>**Note**
>
>You can stop and remove a container in a single command by adding the `force` flag to the `docker rm` command. For example: `docker rm -f <the-container-id>`
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
### Remove a container using Docker Desktop
@y
### Remove a container using Docker Desktop
@z

@x
1. Open Docker Desktop to the **Containers** view.
2. Select the trash can icon under the **Actions** column for the container that you want to delete.
3. In the confirmation dialog, select **Delete forever**.
@y
1. Open Docker Desktop to the **Containers** view.
2. Select the trash can icon under the **Actions** column for the container that you want to delete.
3. In the confirmation dialog, select **Delete forever**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Start the updated app container
@y
### Start the updated app container
@z

@x
1. Now, start your updated app using the `docker run` command.
@y
1. Now, start your updated app using the `docker run` command.
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 getting-started
   ```
@z

@x
2. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text.
@y
2. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to update and rebuild a container, as well as how to stop and remove a container.
@y
In this section, you learned how to update and rebuild a container, as well as how to stop and remove a container.
@z

@x
Related information:
 - [docker CLI reference](/engine/reference/commandline/cli/)
@y
Related information:
 - [docker CLI reference](/engine/reference/commandline/cli/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn how to share images with others.
@y
Next, you'll learn how to share images with others.
@z

@x
{{< button text="Share the application" url="04_sharing_app.md" >}}
@y
{{< button text="Share the application" url="04_sharing_app.md" >}}
@z
