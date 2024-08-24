%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Docker Run Cloud
description: Learn how you can run your applications in the cloud with Docker Run Cloud
keywords: run, cloud, docker desktop, resources
@y
title: Docker Run Cloud
description: Learn how you can run your applications in the cloud with Docker Run Cloud
keywords: run, cloud, docker desktop, resources
@z

@x
{{% restricted title="Private preview" %}}
Docker Run Cloud is in Private preview.
{{% /restricted %}}
@y
{{% restricted title="Private preview" %}}
Docker Run Cloud is in Private preview.
{{% /restricted %}}
@z

@x
Docker Run Cloud brings the power of the cloud to your local development workflow. You can now run your applications in the cloud whilst continuing to use your existing tools and workflows and without worrying about local resource limitations. Docker Run Cloud also lets you share previews of your cloud-based applications for real-time feedback. 
@y
Docker Run Cloud brings the power of the cloud to your local development workflow. You can now run your applications in the cloud whilst continuing to use your existing tools and workflows and without worrying about local resource limitations. Docker Run Cloud also lets you share previews of your cloud-based applications for real-time feedback. 
@z

@x
## Set up 
@y
## Set up 
@z

@x
To get started with Docker Run Cloud, you need to:
@y
To get started with Docker Run Cloud, you need to:
@z

@x
- Have a Docker account that's part of a Docker organization
- Email `run.cloud@docker.com` to get help with onboarding
@y
- Have a Docker account that's part of a Docker organization
- Email `run.cloud@docker.com` to get help with onboarding
@z

@x
## Quickstart
@y
## Quickstart
@z

@x
You can use Docker Run Cloud from the Docker Dashboard or from the CLI. 
@y
You can use Docker Run Cloud from the Docker Dashboard or from the CLI. 
@z

@x
This guide introduces you to essential commands and steps for creating, managing, and sharing a cloud engine. 
@y
This guide introduces you to essential commands and steps for creating, managing, and sharing a cloud engine. 
@z

@x
### Step one: Create a cloud engine
@y
### Step one: Create a cloud engine
@z

@x
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@z

@x
1. In the Docker Dashboard, navigate to the **Docker Run Cloud** tab. 
2. In the top right-hand corner, select **Create Cloud Engine**.
3. Fill out the creation form:
   - Enter `cloudengine` as the name
   - Choose an organization to associate the cloud engine with
   - Select the engine size and architecture
@y
1. In the Docker Dashboard, navigate to the **Docker Run Cloud** tab. 
2. In the top right-hand corner, select **Create Cloud Engine**.
3. Fill out the creation form:
   - Enter `cloudengine` as the name
   - Choose an organization to associate the cloud engine with
   - Select the engine size and architecture
@z

@x
   Note that the **Switch Docker Context to use remote engine** is selected by default. The automatically switches you to your new cloud engine once it has been created. 
4. Select **Create**.
@y
   Note that the **Switch Docker Context to use remote engine** is selected by default. The automatically switches you to your new cloud engine once it has been created. 
4. Select **Create**.
@z

@x
To verify creation, check the context switcher in the top-left corner of the Docker Dashboard; it should display `cloudengine`. You’re now ready to use it.
@y
To verify creation, check the context switcher in the top-left corner of the Docker Dashboard; it should display `cloudengine`. You’re now ready to use it.
@z

@x
{{< /tab >}}
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
@z

@x
Run the following command: 
@y
Run the following command: 
@z

@x
```console
$ docker harmonia engine create cloudengine --arch "amd64"  --use
```
@y
```console
$ docker harmonia engine create cloudengine --arch "amd64"  --use
```
@z

@x
This creates an engine called `cloudengine` and:
- Immediately switches you to the new cloud engine with the `--use` flag.
- Sets the engine's CPU architecture to amd64 using the `--arch "amd64"` flag. You can choose between amd64 and arm64.
- Configures the engine size with the `--size "standard"` flag. Options are standard (2 CPU cores, 4GB RAM, default) or large (4 CPU cores, 8GB RAM).
@y
This creates an engine called `cloudengine` and:
- Immediately switches you to the new cloud engine with the `--use` flag.
- Sets the engine's CPU architecture to amd64 using the `--arch "amd64"` flag. You can choose between amd64 and arm64.
- Configures the engine size with the `--size "standard"` flag. Options are standard (2 CPU cores, 4GB RAM, default) or large (4 CPU cores, 8GB RAM).
@z

@x
To verify you're using the newly created cloud engine, run:
@y
To verify you're using the newly created cloud engine, run:
@z

@x
```console
$ docker context inspect
```
@y
```console
$ docker context inspect
```
@z

@x
You should see the following:
@y
You should see the following:
@z

@x
```text
[
    {
        "Name": "cloudengine2",
...
```
@y
```text
[
    {
        "Name": "cloudengine2",
...
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
### Step two: Run and remove containers with the newly created cloud engine 
@y
### Step two: Run and remove containers with the newly created cloud engine 
@z

@x
1. Run an Nginx container in the cloud engine:
   ```console
   $ docker run -d -p 8080:80 nginx
   ```
   This maps the container's port `80` to the host's port `8080`. If port `8080` is already in use on your host, you can specify a different port.
2. View the Nginx welcome page. Navigate to [`http://localhost/`](http://localhost/).
3. Verify the running container:
   - In the **Containers** tab in the Docker Dashboard, you should see your Nginx container listed. 
   - Alternatively, list all running containers in the cloud engine via the terminal:
      ```console
      $ docker ps
      ```
@y
1. Run an Nginx container in the cloud engine:
   ```console
   $ docker run -d -p 8080:80 nginx
   ```
   This maps the container's port `80` to the host's port `8080`. If port `8080` is already in use on your host, you can specify a different port.
2. View the Nginx welcome page. Navigate to [`http://localhost/`](http://localhost/).
3. Verify the running container:
   - In the **Containers** tab in the Docker Dashboard, you should see your Nginx container listed. 
   - Alternatively, list all running containers in the cloud engine via the terminal:
      ```console
      $ docker ps
      ```
@z

@x
Running a container with a cloud engine is just as straightforward as running it locally.
@y
Running a container with a cloud engine is just as straightforward as running it locally.
@z

@x
### Step three: Create and switch to a new cloud engine
@y
### Step three: Create and switch to a new cloud engine
@z

@x
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@z

@x
1. Create a new cloud engine:
   - Enter `cloudengine2` as the name
   - Choose an organization to associate the cloud engine with
   - Select the **Standard** engine size with the **AMD-64** architecture
   In the **Docker Run Cloud** view you should now see both `cloudengine` and `cloudengine2`. 
2. Switch between engines, also known as your Docker contexts. Use the context switcher in the top-left corner of the Docker Dashboard to toggle between your cloud engines or switch from your local engine (`desktop-linux`) to a cloud engine. 
@y
1. Create a new cloud engine:
   - Enter `cloudengine2` as the name
   - Choose an organization to associate the cloud engine with
   - Select the **Standard** engine size with the **AMD-64** architecture
   In the **Docker Run Cloud** view you should now see both `cloudengine` and `cloudengine2`. 
2. Switch between engines, also known as your Docker contexts. Use the context switcher in the top-left corner of the Docker Dashboard to toggle between your cloud engines or switch from your local engine (`desktop-linux`) to a cloud engine. 
@z

@x
{{< /tab >}}
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
@z

@x
1. Create a new cloud engine. Run:
   ```console
   $ docker harmonia engine create cloudengine2
   ```
   Docker automatically switches you to your new cloud engine. 
2. Switch between engines, also known as your Docker contexts. Either switch to your first cloud engine:
   ```console
   $ docker context use cloudengine
   ``` 
   Or switch back to your local engine: 
   ```console
   $ docker context use desktop-linux
   ```
@y
1. Create a new cloud engine. Run:
   ```console
   $ docker harmonia engine create cloudengine2
   ```
   Docker automatically switches you to your new cloud engine. 
2. Switch between engines, also known as your Docker contexts. Either switch to your first cloud engine:
   ```console
   $ docker context use cloudengine
   ``` 
   Or switch back to your local engine: 
   ```console
   $ docker context use desktop-linux
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
### Step four: Use a file sync for your cloud engine
@y
### Step four: Use a file sync for your cloud engine
@z

@x
Docker Run Cloud takes advantage of [Synchronized file shares](/desktop/synchronized-file-sharing.md) to enable local-to-remote file shares and port mappings. 
@y
Docker Run Cloud takes advantage of [Synchronized file shares](desktop/synchronized-file-sharing.md) to enable local-to-remote file shares and port mappings. 
@z

@x
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@z

@x
1. Clone the [Awesome Compose](https://github.com/docker/awesome-compose) repository. 
2. In the Docker Dashboard, navigate to the **Docker Run Cloud** view. 
3. For the `cloudengine` cloud engine, select the **Actions** menu and then **Manage file syncs**.
4. Select **Create file sync**.
5. Navigate to the `awesome-compose/react-express-mysql` folder and select **Open**.
6. In your terminal, navigate to the `awesome-compose/react-express-mysql` directory.
7. Run the project in the cloud engine with:
   ```console
   $ docker compose up -d
   ```
8. Test the application by visiting [`http://localhost:3000`](http://localhost:3000/).  
   You should see the home page. The code for this page is located in `react-express-mysql/frontend/src/App.js`.
9. In an IDE or text editor, open the `App.js` file, change some text, and save. Watch as the code reloads live in your browser.
@y
1. Clone the [Awesome Compose](https://github.com/docker/awesome-compose) repository. 
2. In the Docker Dashboard, navigate to the **Docker Run Cloud** view. 
3. For the `cloudengine` cloud engine, select the **Actions** menu and then **Manage file syncs**.
4. Select **Create file sync**.
5. Navigate to the `awesome-compose/react-express-mysql` folder and select **Open**.
6. In your terminal, navigate to the `awesome-compose/react-express-mysql` directory.
7. Run the project in the cloud engine with:
   ```console
   $ docker compose up -d
   ```
8. Test the application by visiting [`http://localhost:3000`](http://localhost:3000/).  
   You should see the home page. The code for this page is located in `react-express-mysql/frontend/src/App.js`.
9. In an IDE or text editor, open the `App.js` file, change some text, and save. Watch as the code reloads live in your browser.
@z

@x
{{< /tab >}}
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
@z

@x
1. Clone the [Awesome Compose](https://github.com/docker/awesome-compose) repository. 
2. In your terminal, change into the `awesome-compose/react-express-mysql` directory.
3. Create a file sync for `cloudengine`:
   ```console
   $ docker harmonia file-sync create --engine cloudengine $PWD
4. Run the project in the cloud engine with:
   ```console
   $ docker compose up -d
   ```
5. Test the application by visiting [`http://localhost:3000`](http://localhost:3000/).  
   You should see the home page. The code for this page is located in `react-express-mysql/frontend/src/App.js`.
6. In an IDE or text editor, open the `App.js` file, change some text, and save. Watch as the code reloads live in your browser.
@y
1. Clone the [Awesome Compose](https://github.com/docker/awesome-compose) repository. 
2. In your terminal, change into the `awesome-compose/react-express-mysql` directory.
3. Create a file sync for `cloudengine`:
   ```console
   $ docker harmonia file-sync create --engine cloudengine $PWD
4. Run the project in the cloud engine with:
   ```console
   $ docker compose up -d
   ```
5. Test the application by visiting [`http://localhost:3000`](http://localhost:3000/).  
   You should see the home page. The code for this page is located in `react-express-mysql/frontend/src/App.js`.
6. In an IDE or text editor, open the `App.js` file, change some text, and save. Watch as the code reloads live in your browser.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Step five: Share a container port 
@y
### Step five: Share a container port 
@z

@x
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@z

@x
1. Make sure your Docker context is set to `cloudengine`. 
2. In your terminal, run the Nginx container:
   ```console
   $ docker run -d -p 8080:80 nginx
   ```
3. In the Docker Dashboard, navigate to the **Containers** view. 
4. Select the **lock** icon in the **Ports** column of your running container. 
   This creates a publicly accessible URL that you can share with teammates. 
5. Select the **copy** icon, to copy this URL. 
@y
1. Make sure your Docker context is set to `cloudengine`. 
2. In your terminal, run the Nginx container:
   ```console
   $ docker run -d -p 8080:80 nginx
   ```
3. In the Docker Dashboard, navigate to the **Containers** view. 
4. Select the **lock** icon in the **Ports** column of your running container. 
   This creates a publicly accessible URL that you can share with teammates. 
5. Select the **copy** icon, to copy this URL. 
@z

@x
To view all shared ports for your Docker context, select the **Shared ports** icon in the bottom-right corner of the Docker Dashboard.
@y
To view all shared ports for your Docker context, select the **Shared ports** icon in the bottom-right corner of the Docker Dashboard.
@z

@x
{{< /tab >}}
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
@z

@x
To share a container port, make sure your Docker context is set to `cloudengine` and then run: 
``` console
$ docker harmonia engine share create cloudengine 3000
```
This returns a publicly accessible URL for your React app hosted on port `3000`, that you can share with teammates.
@y
To share a container port, make sure your Docker context is set to `cloudengine` and then run: 
``` console
$ docker harmonia engine share create cloudengine 3000
```
This returns a publicly accessible URL for your React app hosted on port `3000`, that you can share with teammates.
@z

@x
To see a list of all your shared ports, run:
@y
To see a list of all your shared ports, run:
@z

@x
```console
$ docker harmonia engine share list 
```
@y
```console
$ docker harmonia engine share list 
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
### Step six: Clean up 
@y
### Step six: Clean up 
@z

@x
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs group="method" >}}
{{< tab name="Docker Desktop">}}
@z

@x
To remove a file sync session:
1. Navigate to your cloud engine in the **Docker Run Cloud** view.
2. Select the **Actions** menu and then **Manage file syncs**.
3. Select the **drop-down** icon on the file sync.
4. Select **Delete**.
@y
To remove a file sync session:
1. Navigate to your cloud engine in the **Docker Run Cloud** view.
2. Select the **Actions** menu and then **Manage file syncs**.
3. Select the **drop-down** icon on the file sync.
4. Select **Delete**.
@z

@x
To remove a cloud engine, navigate to the **Docker Run Cloud** view and then select the **delete** icon.
@y
To remove a cloud engine, navigate to the **Docker Run Cloud** view and then select the **delete** icon.
@z

@x
{{< /tab >}}
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
@z

@x
To remove the file sync session, run:
@y
To remove the file sync session, run:
@z

@x
```console
$ docker harmonia file-sync delete --engine cloudengine $PWD
```
@y
```console
$ docker harmonia file-sync delete --engine cloudengine $PWD
```
@z

@x
To remove a cloud engine, run:
@y
To remove a cloud engine, run:
@z

@x
```console
$ docker harmonia engine delete <name-of-engine>
```
@y
```console
$ docker harmonia engine delete <name-of-engine>
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
## Troubleshoot
@y
## Troubleshoot
@z

@x
Run `docker harmonia doctor` to print helpful troubleshooting information. 
@y
Run `docker harmonia doctor` to print helpful troubleshooting information. 
@z

@x
## Known issues
@y
## Known issues
@z

@x
- KinD does not run on Docker Run Cloud due to some hard-coded assumptions to ensure it's running in a privileged container. K3d is a good alternative.
- Containers cannot access host through DNS `host.docker.internal`.
- File binds (non-directory binds) are currently static, meaning changes will not be reflected until the container is restarted. This also affects Compose configs and secrets directives.
- Bind volumes are not supported.
- Port-forwarding support for UDP
- Docker Compose projects relying on `watch` in `sync` mode are not working with the `tar` synchronizer. Configure it to use `docker cp` instead, disable tar sync by setting `COMPOSE_EXPERIMENTAL_WATCH_TAR=0` in your environment.
- Some Docker Engine features that let you access the underlying host, such as `--pid=host`, `--network=host`, and `--ipc=host`, are currently disabled.
@y
- KinD does not run on Docker Run Cloud due to some hard-coded assumptions to ensure it's running in a privileged container. K3d is a good alternative.
- Containers cannot access host through DNS `host.docker.internal`.
- File binds (non-directory binds) are currently static, meaning changes will not be reflected until the container is restarted. This also affects Compose configs and secrets directives.
- Bind volumes are not supported.
- Port-forwarding support for UDP
- Docker Compose projects relying on `watch` in `sync` mode are not working with the `tar` synchronizer. Configure it to use `docker cp` instead, disable tar sync by setting `COMPOSE_EXPERIMENTAL_WATCH_TAR=0` in your environment.
- Some Docker Engine features that let you access the underlying host, such as `--pid=host`, `--network=host`, and `--ipc=host`, are currently disabled.
@z
