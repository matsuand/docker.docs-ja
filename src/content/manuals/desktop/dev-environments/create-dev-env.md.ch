%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Dev Environments
keywords: Dev Environments, share, Docker Desktop, Compose, launch
title: Launch a dev environment
aliases:
- /desktop/dev-environments/create-compose-dev-env/
---
@y
---
description: Dev Environments
keywords: Dev Environments, share, Docker Desktop, Compose, launch
title: Launch a dev environment
aliases:
- /desktop/dev-environments/create-compose-dev-env/
---
@z

@x
{{< include "dev-envs-changing.md" >}}
@y
{{< include "dev-envs-changing.md" >}}
@z

@x
You can launch a dev environment from a:
- Git repository
- Branch or tag of a Git repository
- Sub-folder of a Git repository
- Local folder
@y
You can launch a dev environment from a:
- Git repository
- Branch or tag of a Git repository
- Sub-folder of a Git repository
- Local folder
@z

@x
This does not conflict with any of the local files or local tooling set up on your host. 
@y
This does not conflict with any of the local files or local tooling set up on your host. 
@z

@x
>Tip
>
>Install the [Dev Environments browser extension](https://github.com/docker/dev-envs-extension) for [Chrome](https://chrome.google.com/webstore/detail/docker-dev-environments/gnagpachnalcofcblcgdbofnfakdbeka) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/docker-dev-environments/), to launch a dev environment faster.
@y
>Tip
>
>Install the [Dev Environments browser extension](https://github.com/docker/dev-envs-extension) for [Chrome](https://chrome.google.com/webstore/detail/docker-dev-environments/gnagpachnalcofcblcgdbofnfakdbeka) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/docker-dev-environments/), to launch a dev environment faster.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To get started with Dev Environments, you must also install the following tools and extension on your machine:
@y
To get started with Dev Environments, you must also install the following tools and extension on your machine:
@z

@x
- [Git](https://git-scm.com). Make sure add Git to your PATH if you're a Windows user. 
- [Visual Studio Code](https://code.visualstudio.com/)
- [Visual Studio Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
@y
- [Git](https://git-scm.com). Make sure add Git to your PATH if you're a Windows user. 
- [Visual Studio Code](https://code.visualstudio.com/)
- [Visual Studio Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
@z

@x
 After Git is installed, restart Docker Desktop. Select **Quit Docker Desktop**, and then start it again.
@y
 After Git is installed, restart Docker Desktop. Select **Quit Docker Desktop**, and then start it again.
@z

@x
## Launch a dev environment from a Git repository
@y
## Launch a dev environment from a Git repository
@z

@x
> [!NOTE]
>
> When cloning a Git repository using SSH, ensure you've added your SSH key to the ssh-agent. To do this, open a terminal and run `ssh-add <path to your private ssh key>`.
@y
> [!NOTE]
>
> When cloning a Git repository using SSH, ensure you've added your SSH key to the ssh-agent. To do this, open a terminal and run `ssh-add <path to your private ssh key>`.
@z

@x
> [!IMPORTANT]
>
> If you have enabled the WSL 2 integration in Docker Desktop for Windows, make sure you have an SSH agent running in your WSL 2 distribution.
@y
> [!IMPORTANT]
>
> If you have enabled the WSL 2 integration in Docker Desktop for Windows, make sure you have an SSH agent running in your WSL 2 distribution.
@z

@x
{{< accordion title="How to start an SSH agent in WSL 2" >}}
@y
{{< accordion title="How to start an SSH agent in WSL 2" >}}
@z

@x
If your WSL 2 distribution doesn't have an `ssh-agent` running, you can append this script at the end of your profile file (that is: ~/.profile, ~/.zshrc, ...).
@y
If your WSL 2 distribution doesn't have an `ssh-agent` running, you can append this script at the end of your profile file (that is: ~/.profile, ~/.zshrc, ...).
@z

@x
```bash
SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
```
@y
```bash
SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
```
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
To launch a dev environment:
@y
To launch a dev environment:
@z

@x
1. From the **Dev Environments** tab in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**. 
3. Optional: Provide a name for you dev environment.
4. Select **Existing Git repo** as the source and then paste your Git repository link into the field provided.
5. Choose your IDE. You can choose either:
    - **Visual Studio Code**. The Git repository is cloned into a Volume and attaches to your containers. This allows you to develop directly inside of them using Visual Studio Code.
    - **Other**. The Git repository is cloned into your chosen local directory and attaches to your containers as a bind mount. This shares the directory from your computer to the container, and allows you to develop using any local editor or IDE.
6. Select **Continue**.
@y
1. From the **Dev Environments** tab in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**. 
3. Optional: Provide a name for you dev environment.
4. Select **Existing Git repo** as the source and then paste your Git repository link into the field provided.
5. Choose your IDE. You can choose either:
    - **Visual Studio Code**. The Git repository is cloned into a Volume and attaches to your containers. This allows you to develop directly inside of them using Visual Studio Code.
    - **Other**. The Git repository is cloned into your chosen local directory and attaches to your containers as a bind mount. This shares the directory from your computer to the container, and allows you to develop using any local editor or IDE.
6. Select **Continue**.
@z

@x
To launch the application, run the command `make run` in your terminal. This opens an http server on port 8080. Open [http://localhost:8080](http://localhost:8080) in your browser to see the running application.
@y
To launch the application, run the command `make run` in your terminal. This opens an http server on port 8080. Open [http://localhost:8080](http://localhost:8080) in your browser to see the running application.
@z

@x
## Launch from a specific branch or tag
@y
## Launch from a specific branch or tag
@z

@x
You can launch a dev environment from a specific branch, for example a branch corresponding to a Pull Request, or a tag by adding `@mybranch` or `@tag` as a suffix to your Git URL:
@y
You can launch a dev environment from a specific branch, for example a branch corresponding to a Pull Request, or a tag by adding `@mybranch` or `@tag` as a suffix to your Git URL:
@z

@x
 `https://github.com/dockersamples/single-dev-env@mybranch`
@y
 `https://github.com/dockersamples/single-dev-env@mybranch`
@z

@x
 or
@y
 or
@z

@x
 `git@github.com:dockersamples/single-dev-env.git@mybranch`
@y
 `git@github.com:dockersamples/single-dev-env.git@mybranch`
@z

@x
Docker then clones the repository with your specified branch or tag.
@y
Docker then clones the repository with your specified branch or tag.
@z

@x
## Launch from a subfolder of a Git repository
@y
## Launch from a subfolder of a Git repository
@z

@x
>Note
>
>Currently, Dev Environments is not able to detect the main language of the subdirectory. You need to define your own base image or services in a `compose-dev.yaml`file located in your subdirectory. For more information on how to configure, see the [React application with a Spring backend and a MySQL database sample](https://github.com/docker/awesome-compose/tree/master/react-java-mysql) or the [Go server with an Nginx proxy and a Postgres database sample](https://github.com/docker/awesome-compose/tree/master/nginx-golang-postgres). 
@y
>Note
>
>Currently, Dev Environments is not able to detect the main language of the subdirectory. You need to define your own base image or services in a `compose-dev.yaml`file located in your subdirectory. For more information on how to configure, see the [React application with a Spring backend and a MySQL database sample](https://github.com/docker/awesome-compose/tree/master/react-java-mysql) or the [Go server with an Nginx proxy and a Postgres database sample](https://github.com/docker/awesome-compose/tree/master/nginx-golang-postgres). 
@z

@x
1. From **Dev Environments** in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**.
3. Optional: Provide a name for you dev environment.
4. Select **Existing Git repo** as the source and then paste the link of your Git repo subfolder into the field provided.
5. Choose your IDE. You can choose either:
    - **Visual Studio Code**. The Git repository is cloned into a Volume and attaches to your containers. This allows you to develop directly inside of them using Visual Studio Code.
    - **Other**. The Git repository is cloned into your chosen local directory and attaches to your containers as a bind mount. This shares the directory from your computer to the container, and allows you to develop using any local editor or IDE.
6. Select **Continue**.
@y
1. From **Dev Environments** in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**.
3. Optional: Provide a name for you dev environment.
4. Select **Existing Git repo** as the source and then paste the link of your Git repo subfolder into the field provided.
5. Choose your IDE. You can choose either:
    - **Visual Studio Code**. The Git repository is cloned into a Volume and attaches to your containers. This allows you to develop directly inside of them using Visual Studio Code.
    - **Other**. The Git repository is cloned into your chosen local directory and attaches to your containers as a bind mount. This shares the directory from your computer to the container, and allows you to develop using any local editor or IDE.
6. Select **Continue**.
@z

@x
To launch the application, run the command `make run` in your terminal. This opens an http server on port 8080. Open [http://localhost:8080](http://localhost:8080) in your browser to see the running application.
@y
To launch the application, run the command `make run` in your terminal. This opens an http server on port 8080. Open [http://localhost:8080](http://localhost:8080) in your browser to see the running application.
@z

@x
## Launch from a local folder
@y
## Launch from a local folder
@z

@x
1. From **Dev Environments** in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**.
3. Optional: Provide a name for your dev environment.
4. Choose **Local directory** as the source.
5. Select **Select** to open the root directory of the code that you would like to work on.
@y
1. From **Dev Environments** in Docker Dashboard, select **Create**. The **Create a Dev Environment** dialog displays.
2. Select **Get Started**.
3. Optional: Provide a name for your dev environment.
4. Choose **Local directory** as the source.
5. Select **Select** to open the root directory of the code that you would like to work on.
@z

@x
   A directory from your computer is bind mounted to the container, so any changes you make locally is reflected in the dev environment. You can use an editor or IDE of your choice.
@y
   A directory from your computer is bind mounted to the container, so any changes you make locally is reflected in the dev environment. You can use an editor or IDE of your choice.
@z

@x
> [!NOTE]
>
> When using a local folder for a dev environment, file changes are synchronized between your environment container and your local files. This can affect the performance inside the container, depending on the number of files in your local folder and the operations performed in the container.
@y
> [!NOTE]
>
> When using a local folder for a dev environment, file changes are synchronized between your environment container and your local files. This can affect the performance inside the container, depending on the number of files in your local folder and the operations performed in the container.
@z

@x
## What's next?
@y
## What's next?
@z

@x
Learn how to:
- [Set up a dev environment](set-up.md)
- [Distribute your dev environment](share.md)
@y
Learn how to:
- [Set up a dev environment](set-up.md)
- [Distribute your dev environment](share.md)
@z
