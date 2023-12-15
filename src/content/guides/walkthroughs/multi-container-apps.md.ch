%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Run multi-container applications
keywords: get started, quick start, intro, concepts
description: Learn how to use Docker to run multi-container applications
---
@y
---
title: Run multi-container applications
keywords: get started, quick start, intro, concepts
description: Learn how to use Docker to run multi-container applications
---
@z

@x
If you've already completed the [How do I run a container?](./run-a-container.md) walkthrough, you learned that you must start each container individually. Imagine how great it would be if a tool could start multiple containers with a single command. That tool is Docker Compose.
@y
If you've already completed the [How do I run a container?](./run-a-container.md) walkthrough, you learned that you must start each container individually. Imagine how great it would be if a tool could start multiple containers with a single command. That tool is Docker Compose.
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Get the sample application
@y
## Step 1: Get the sample application
@z

@x
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
If you have git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@z

@x
{{< tabs >}}
{{< tab name="Clone with git" >}}
@y
{{< tabs >}}
{{< tab name="Clone with git" >}}
@z

@x
Use the following command in a terminal to clone the sample application repository.
@y
Use the following command in a terminal to clone the sample application repository.
@z

@x
```console
$ git clone https://github.com/docker/multi-container-app
```
@y
```console
$ git clone https://github.com/docker/multi-container-app
```
@z

@x
{{< /tab >}}
{{< tab name="Download" >}}
@y
{{< /tab >}}
{{< tab name="Download" >}}
@z

@x
Download the source and extract it.
@y
Download the source and extract it.
@z

@x
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="Download the source" >}}
@y
{{< button url="https://github.com/docker/multi-container-app/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The sample application is a simple todo application built using ExpressJS and Node.js. The application saves all todos in a MongoDB database. You don't need to know any of these technologies to continue with the walkthrough.
@y
The sample application is a simple todo application built using ExpressJS and Node.js. The application saves all todos in a MongoDB database. You don't need to know any of these technologies to continue with the walkthrough.
@z

@x
![The sample app architecture](images/getting-started-multi-container.webp?w=450&border=true)
@y
![The sample app architecture](images/getting-started-multi-container.webp?w=450&border=true)
@z

@x
## Step 2: Dig into the Compose file
@y
## Step 2: Dig into the Compose file
@z

@x
View the files of the sample application. Notice that it has a `compose.yaml` file. This file tells Docker how to run your application. Open the `compose.yaml` file in a code or text editor to view what it contains.
@y
View the files of the sample application. Notice that it has a `compose.yaml` file. This file tells Docker how to run your application. Open the `compose.yaml` file in a code or text editor to view what it contains.
@z

@x
## Step 3: Run the application
@y
## Step 3: Run the application
@z

@x
To run the multi-container application, open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@y
To run the multi-container application, open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
@z

@x
{{< include "open-terminal.md" >}}
@y
{{< include "open-terminal.md" >}}
@z

@x
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@y
```console
$ cd /path/to/multi-container-app/
```
```console
$ docker compose up -d
```
@z

@x
In the previous command, the `-d` flag tells Docker Compose to run in detached mode.
@y
In the previous command, the `-d` flag tells Docker Compose to run in detached mode.
@z

@x
## Step 4: View the frontend and add todos
@y
## Step 4: View the frontend and add todos
@z

@x
In the **Containers** tab of Docker Desktop, you should now have an application stack with two containers running (the todo-app, and todo-database).
@y
In the **Containers** tab of Docker Desktop, you should now have an application stack with two containers running (the todo-app, and todo-database).
@z

@x
To view the frontend:
@y
To view the frontend:
@z

@x
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [https://localhost:3000](https://localhost:3000)⁠.
@y
1. In Docker Desktop, expand the application stack in **Containers**.
2. Select the link to port **3000** in the **Port(s)** column or open [https://localhost:3000](https://localhost:3000)⁠.
@z

@x
Add some todo tasks in the frontend, and then open [https://localhost:3000](https://localhost:3000) in a new browser tab. Notice that the tasks are still visible.
@y
Add some todo tasks in the frontend, and then open [https://localhost:3000](https://localhost:3000) in a new browser tab. Notice that the tasks are still visible.
@z

@x
## Step 5: Develop in your containers
@y
## Step 5: Develop in your containers
@z

@x
When developing with Docker, you may need to automatically update and preview your running services as you edit and save your code. You can use Docker Compose Watch for this.
@y
When developing with Docker, you may need to automatically update and preview your running services as you edit and save your code. You can use Docker Compose Watch for this.
@z

@x
To run Compose Watch and see the real-time changes:
@y
To run Compose Watch and see the real-time changes:
@z

@x
1. Open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
   ```console
   $ cd /path/to/multi-container-app/
   ```
   ```console
   $ docker compose watch
   ```
2. Open `app/views/todos.ejs` in a text or code editor, then change the text on line 18.
3. Save the changes in `app/views/todos.ejs`.
4. View your application at [https://localhost:3000](https://localhost:3000) to see the changes in real-time.
@y
1. Open a terminal and run the following commands. Replace `/path/to/multi-container-app/` with the path to your application's directory.
   ```console
   $ cd /path/to/multi-container-app/
   ```
   ```console
   $ docker compose watch
   ```
2. Open `app/views/todos.ejs` in a text or code editor, then change the text on line 18.
3. Save the changes in `app/views/todos.ejs`.
4. View your application at [https://localhost:3000](https://localhost:3000) to see the changes in real-time.
@z

@x
## Step 6: Delete everything and start over
@y
## Step 6: Delete everything and start over
@z

@x
Having your configuration stored in a Compose file has another advantage, you can easily delete everything and start over.
@y
Having your configuration stored in a Compose file has another advantage, you can easily delete everything and start over.
@z

@x
To delete the application stack:
@y
To delete the application stack:
@z

@x
1. Open the **Containers** tab of Docker Desktop
2. Select the Delete icon next to your application stack.
@y
1. Open the **Containers** tab of Docker Desktop
2. Select the Delete icon next to your application stack.
@z

@x
![Deleting the application stack](images/getting-started-delete-stack.webp?border=true)
@y
![Deleting the application stack](images/getting-started-delete-stack.webp?border=true)
@z

@x
After you delete the application stack, follow the steps from [Step 3: Run the
application](#step-3-run-the-application) to run the application again. Note
that when you delete the containers and run them again, any todos that you
created don't persist.
@y
After you delete the application stack, follow the steps from [Step 3: Run the
application](#step-3-run-the-application) to run the application again. Note
that when you delete the containers and run them again, any todos that you
created don't persist.
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you ran a multi-container application with Docker Compose. You also learned how to develop in containers and how to delete the application stack along with all of the data.
@y
In this walkthrough, you ran a multi-container application with Docker Compose. You also learned how to develop in containers and how to delete the application stack along with all of the data.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into the [Docker Compose manual](../../compose/_index.md)
- Reference Compose commands in the [Docker Compose CLI reference](../../compose/reference/_index.md)
- Explore samples in the [Awesome Compose GitHub repository](https://github.com/docker/awesome-compose)
- Learn how to implement Compose Watch for your projects in [Use Compose Watch](../../compose/file-watch.md)
@y
- Deep dive into the [Docker Compose manual](../../compose/_index.md)
- Reference Compose commands in the [Docker Compose CLI reference](../../compose/reference/_index.md)
- Explore samples in the [Awesome Compose GitHub repository](https://github.com/docker/awesome-compose)
- Learn how to implement Compose Watch for your projects in [Use Compose Watch](../../compose/file-watch.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how to persist data even after deleting the application stack.
@y
Continue to the next walkthrough to learn how to persist data even after deleting the application stack.
@z

@x
{{< button url="./persist-data.md" text="Persist container data" >}}
@y
{{< button url="./persist-data.md" text="Persist container data" >}}
@z
