%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Add or edit your run commands
description: Learn how to add or edit your run commands in Docker Projects
keywords: Docker, projects, docker deskotp, containerization, open, remote, local, run commands
@y
title: Add or edit your run commands
description: Learn how to add or edit your run commands in Docker Projects
keywords: Docker, projects, docker deskotp, containerization, open, remote, local, run commands
@z

@x
## Add a run command to a project
@y
## Add a run command to a project
@z

@x
1. Open an existing project and ensure that it is stopped.
@y
1. Open an existing project and ensure that it is stopped.
@z

@x
2. From the command drop-down menu, select **New run command**.
@y
2. From the command drop-down menu, select **New run command**.
@z

@x
3. Specify the following information for the run command:
@y
3. Specify the following information for the run command:
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
4. Select **Save changes**. 
@y
4. Select **Save changes**. 
@z

@x
You can now select the new run command from the drop-down menu after opening the project.
@y
You can now select the new run command from the drop-down menu after opening the project.
@z

@x
## Edit a run command
@y
## Edit a run command
@z

@x
1. Open an existing project and ensure that it is stopped.
@y
1. Open an existing project and ensure that it is stopped.
@z

@x
2. Select the run command you want to change from the command drop-down menu.
@y
2. Select the run command you want to change from the command drop-down menu.
@z

@x
3. Select the **Edit** icon next to the **Run** button.
@y
3. Select the **Edit** icon next to the **Run** button.
@z

@x
4. Specify your changes and then select **Save changes**.
@y
4. Specify your changes and then select **Save changes**.
@z

@x
## What's next?
@y
## What's next?
@z

@x
 - [Manage your projects](/manuals/projects/manage.md)
@y
 - [Manage your projects](manuals/projects/manage.md)
@z
