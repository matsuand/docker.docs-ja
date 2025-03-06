%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Open a new project
description: Learn how to open a new local or remote project, or an existing project in Docker Projects. 
keywords: Docker, projects, docker deskotp, containerization, open, remote, local
@y
title: Open a new project
description: Learn how to open a new local or remote project, or an existing project in Docker Projects. 
keywords: Docker, projects, docker deskotp, containerization, open, remote, local
@z

@x
> [!IMPORTANT]
> 
> To use Docker Projects, you must enable the **Access experimental features** setting in Docker Desktop. See [Features in development](/manuals/desktop/settings-and-maintenance/settings.md#features-in-development) for more information. 
@y
> [!IMPORTANT]
> 
> To use Docker Projects, you must enable the **Access experimental features** setting in Docker Desktop. See [Features in development](manuals/desktop/settings-and-maintenance/settings.md#features-in-development) for more information. 
@z

@x
## New projects
@y
## New projects
@z

@x
To run a new project, it must be stored locally. In the **Projects** view in Docker Desktop, local projects display the local path under the project.
@y
To run a new project, it must be stored locally. In the **Projects** view in Docker Desktop, local projects display the local path under the project.
@z

@x
### Open a new local project
@y
### Open a new local project
@z

@x
A project consists of your code and at least one Compose file. Ensure that you have a Compose file before trying to open a new project.
@y
A project consists of your code and at least one Compose file. Ensure that you have a Compose file before trying to open a new project.
@z

@x
To open a new project:
@y
To open a new project:
@z

@x
1. Sign in to Docker Desktop, and go to **Projects**.
@y
1. Sign in to Docker Desktop, and go to **Projects**.
@z

@x
2. Select **Open a local folder**. This lets you select a local folder that contains your project’s code and a Compose file.
@y
2. Select **Open a local folder**. This lets you select a local folder that contains your project’s code and a Compose file.
@z

@x
   > [!NOTE]
   >
   > A local folder can also be the folder of a Git repository that you have already cloned. 
@y
   > [!NOTE]
   >
   > A local folder can also be the folder of a Git repository that you have already cloned. 
@z

@x
3. Configure your project by giving it a name and setting the owner, then select **Next**.
@y
3. Configure your project by giving it a name and setting the owner, then select **Next**.
@z

@x
   > [!NOTE]
   >
   > If you are part of a Docker organization you have the option to [share your project](share.md) with the organization. 
@y
   > [!NOTE]
   >
   > If you are part of a Docker organization you have the option to [share your project](share.md) with the organization. 
@z

@x
4. Specify how to run your project by selecting **New run command**:
@y
4. Specify how to run your project by selecting **New run command**:
@z

@x
   > [!TIP]
   >
   > While configuring your run command, you can view the equivalent `docker compose up` command in the **Run command** section on the configuration page. You can also use this command to run your project from the command line. You can refer to the [`docker compose up` reference documentation](/reference/cli/docker/compose/up.md) to learn more about the options you configure. 
@y
   > [!TIP]
   >
   > While configuring your run command, you can view the equivalent `docker compose up` command in the **Run command** section on the configuration page. You can also use this command to run your project from the command line. You can refer to the [`docker compose up` reference documentation](reference/cli/docker/compose/up.md) to learn more about the options you configure. 
@z

@x
   - **Name**: Specify a name to identify the run command.
   - **Compose files**: Select one or more Compose files from your project. 
   - **Flags**: Optionally, select one or more flags for your run command.
@y
   - **Name**: Specify a name to identify the run command.
   - **Compose files**: Select one or more Compose files from your project. 
   - **Flags**: Optionally, select one or more flags for your run command.
@z

@x
   > [!TIP]
   > 
   > While the `--env-file` flag isn't currently supported, you can specify environment variables in your Compose file, or use the **Tasks** option to run a script that sets your environment variables. 
@y
   > [!TIP]
   > 
   > While the `--env-file` flag isn't currently supported, you can specify environment variables in your Compose file, or use the **Tasks** option to run a script that sets your environment variables. 
@z

@x
   - **Services that will run**: After selecting one or more Compose files, the services defined in the files will appear here. If there is more than one service, you can optionally choose to not run a service by deselecting the checkbox.
   - **Tasks (Advanced options)**: Optionally specify a command to run before running the project. For example, if you want to run a bash script from the project directory named `set-vars.sh`, you can specify bash `set-vars.sh`. Or, on Windows, to run a script with `cmd.exe` named `set-vars.bat`, specify `set-vars.bat`. Note that a task can access environment variables from your terminal profile, but it can't access local shell functions nor aliases.
@y
   - **Services that will run**: After selecting one or more Compose files, the services defined in the files will appear here. If there is more than one service, you can optionally choose to not run a service by deselecting the checkbox.
   - **Tasks (Advanced options)**: Optionally specify a command to run before running the project. For example, if you want to run a bash script from the project directory named `set-vars.sh`, you can specify bash `set-vars.sh`. Or, on Windows, to run a script with `cmd.exe` named `set-vars.bat`, specify `set-vars.bat`. Note that a task can access environment variables from your terminal profile, but it can't access local shell functions nor aliases.
@z

@x
5. Select **Save changes**.
@y
5. Select **Save changes**.
@z

@x
Your project is now ready to run. 
@y
Your project is now ready to run. 
@z

@x
### Open a new remote project
@y
### Open a new remote project
@z

@x
The following steps prompt you to clone the Git repository for your project. 
@y
The following steps prompt you to clone the Git repository for your project. 
@z

@x
If you have already cloned the repository outside of Docker Projects, then you can open the project as a new project and Docker Projects will automatically detect and link the repository.
@y
If you have already cloned the repository outside of Docker Projects, then you can open the project as a new project and Docker Projects will automatically detect and link the repository.
@z

@x
To clone and open a remote project:
@y
To clone and open a remote project:
@z

@x
1. Sign in to Docker Desktop, and go to **Projects**.
@y
1. Sign in to Docker Desktop, and go to **Projects**.
@z

@x
2. Select **Clone a git repository**. This lets you specify a Git repository and a local folder to clone that repository to. The repository must contain at least your project’s code and a Compose file.
@y
2. Select **Clone a git repository**. This lets you specify a Git repository and a local folder to clone that repository to. The repository must contain at least your project’s code and a Compose file.
@z

@x
3. Enter the remote source and choose the local destination to clone to. 
@y
3. Enter the remote source and choose the local destination to clone to. 
@z

@x
4. Select **Clone project**.
@y
4. Select **Clone project**.
@z

@x
5. Configure your project by giving it a name and setting the owner, then select **Next**.
@y
5. Configure your project by giving it a name and setting the owner, then select **Next**.
@z

@x
   > [!NOTE]
   >
   > If you are part of a Docker organization you have the option to [share your project](share.md) with the organization. 
@y
   > [!NOTE]
   >
   > If you are part of a Docker organization you have the option to [share your project](share.md) with the organization. 
@z

@x
6. Specify how to run your project by selecting **New run command**:
@y
6. Specify how to run your project by selecting **New run command**:
@z

@x
   > [!TIP]
   >
   > While configuring your run command, you can view the equivalent `docker compose up` command in the **Run command** section on the configuration page. You can also use this command to run your project from the command line. You can refer to the [`docker compose up` reference documentation](/reference/cli/docker/compose/up.md) to learn more about the options you configure. 
@y
   > [!TIP]
   >
   > While configuring your run command, you can view the equivalent `docker compose up` command in the **Run command** section on the configuration page. You can also use this command to run your project from the command line. You can refer to the [`docker compose up` reference documentation](reference/cli/docker/compose/up.md) to learn more about the options you configure. 
@z

@x
   - **Name**: Specify a name to identify the run command.
   - **Compose files**: Select one or more Compose files from your project. 
   - **Flags**: Optionally, select one or more flags for your run command.
@y
   - **Name**: Specify a name to identify the run command.
   - **Compose files**: Select one or more Compose files from your project. 
   - **Flags**: Optionally, select one or more flags for your run command.
@z

@x
   > [!TIP]
   > 
   > While the `--env-file` flag isn't currently supported, you can specify environment variables in your Compose file, or use the **Tasks** option to run a script that sets your environment variables. 
@y
   > [!TIP]
   > 
   > While the `--env-file` flag isn't currently supported, you can specify environment variables in your Compose file, or use the **Tasks** option to run a script that sets your environment variables. 
@z

@x
   - **Services that will run**: After selecting one or more Compose files, the services defined in the files will appear here. If there is more than one service, you can optionally choose to not run a service by deselecting the checkbox.
   - **Tasks (Advanced options)**: Optionally specify a command to run before running the project. For example, if you want to run a bash script from the project directory named `set-vars.sh`, you can specify bash `set-vars.sh`. Or, on Windows, to run a script with `cmd.exe` named `set-vars.bat`, specify `set-vars.bat`. Note that a task can access environment variables from your terminal profile, but it can't access local shell functions nor aliases.
@y
   - **Services that will run**: After selecting one or more Compose files, the services defined in the files will appear here. If there is more than one service, you can optionally choose to not run a service by deselecting the checkbox.
   - **Tasks (Advanced options)**: Optionally specify a command to run before running the project. For example, if you want to run a bash script from the project directory named `set-vars.sh`, you can specify bash `set-vars.sh`. Or, on Windows, to run a script with `cmd.exe` named `set-vars.bat`, specify `set-vars.bat`. Note that a task can access environment variables from your terminal profile, but it can't access local shell functions nor aliases.
@z

@x
7. Select **Save changes**.
@y
7. Select **Save changes**.
@z

@x
## Existing projects
@y
## Existing projects
@z

@x
### Open an existing local project
@y
### Open an existing local project
@z

@x
1. Sign in to Docker Desktop, and go to **Projects**.
@y
1. Sign in to Docker Desktop, and go to **Projects**.
@z

@x
2. Open your project by selecting your project under **Recents**, or by selecting the specific owner that your project is associated with and then select your project. 
@y
2. Open your project by selecting your project under **Recents**, or by selecting the specific owner that your project is associated with and then select your project. 
@z

@x
### Open an existing remote project
@y
### Open an existing remote project
@z

@x
In the **Projects** view in Docker Desktop, existing remote projects display **No local copy** under the project. 
@y
In the **Projects** view in Docker Desktop, existing remote projects display **No local copy** under the project. 
@z

@x
You’ll see remote projects when you are new to the team and are accessing a shared project, remove a project from Docker Desktop, or access Docker Desktop from a new device after creating a project associated with a Git repository.
@y
You’ll see remote projects when you are new to the team and are accessing a shared project, remove a project from Docker Desktop, or access Docker Desktop from a new device after creating a project associated with a Git repository.
@z

@x
To open an existing remote project, you can choose between:
@y
To open an existing remote project, you can choose between:
@z

@x
   - Cloning the project into a local destination. 
   - Linking to an existing folder where the project has already been cloned
@y
   - Cloning the project into a local destination. 
   - Linking to an existing folder where the project has already been cloned
@z

@x
## What's next?
@y
## What's next?
@z

@x
 - [View your project](/manuals/projects/view.md)
 - [Add or edit your run commands](/manuals/projects/edit.md)
 - [Manage your projects](/manuals/projects/manage.md)
@y
 - [View your project](manuals/projects/view.md)
 - [Add or edit your run commands](manuals/projects/edit.md)
 - [Manage your projects](manuals/projects/manage.md)
@z
