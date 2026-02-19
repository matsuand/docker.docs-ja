%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Using Gordon via CLI
linkTitle: CLI
description: Access and use Gordon through the docker ai command
@y
title: Using Gordon via CLI
linkTitle: CLI
description: Access and use Gordon through the docker ai command
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
The `docker ai` command provides a Terminal User Interface (TUI) for Gordon,
integrating AI assistance directly into your terminal.
@y
The `docker ai` command provides a Terminal User Interface (TUI) for Gordon,
integrating AI assistance directly into your terminal.
@z

@x
## Basic usage
@y
## Basic usage
@z

@x
Launch the interactive TUI:
@y
Launch the interactive TUI:
@z

@x
```console
$ docker ai
```
@y
```console
$ docker ai
```
@z

@x
This opens Gordon's terminal interface where you can type prompts, approve
actions, and continue conversations with full context.
@y
This opens Gordon's terminal interface where you can type prompts, approve
actions, and continue conversations with full context.
@z

@x
<script src="https://asciinema.org/a/9kvZFH9LO9ZVDpwS.js" id="asciicast-9kvZFH9LO9ZVDpwS" async="true"></script>
@y
<script src="https://asciinema.org/a/9kvZFH9LO9ZVDpwS.js" id="asciicast-9kvZFH9LO9ZVDpwS" async="true"></script>
@z

@x
Pass a prompt directly as an argument:
@y
Pass a prompt directly as an argument:
@z

@x
```console
$ docker ai "list my running containers"
```
@y
```console
$ docker ai "list my running containers"
```
@z

@x
Exit the TUI with `/exit` or <kbd>Ctrl+C</kbd>.
@y
Exit the TUI with `/exit` or <kbd>Ctrl+C</kbd>.
@z

@x
## Working directory
@y
## Working directory
@z

@x
The working directory sets the default context for Gordon's file operations.
@y
The working directory sets the default context for Gordon's file operations.
@z

@x
Gordon uses your current shell directory as the working directory:
@y
Gordon uses your current shell directory as the working directory:
@z

@x
```console
$ cd ~/my-project
$ docker ai
```
@y
```console
$ cd ~/my-project
$ docker ai
```
@z

@x
Override with `-C` or `--working-dir`:
@y
Override with `-C` or `--working-dir`:
@z

@x
```console
$ docker ai -C ~/different-project
```
@y
```console
$ docker ai -C ~/different-project
```
@z

@x
## Disabling Gordon
@y
## Disabling Gordon
@z

@x
Gordon CLI is part of Docker Desktop. To disable it, disable Gordon in Docker
Desktop Settings:
@y
Gordon CLI is part of Docker Desktop. To disable it, disable Gordon in Docker
Desktop Settings:
@z

@x
1. Open Docker Desktop Settings.
2. Navigate to the **Beta features** section.
3. Clear the **Enable Docker AI** option.
4. Select **Apply**.
@y
1. Open Docker Desktop Settings.
2. Navigate to the **Beta features** section.
3. Clear the **Enable Docker AI** option.
4. Select **Apply**.
@z

@x
## Commands
@y
## Commands
@z

@x
The `docker ai` command includes several subcommands:
@y
The `docker ai` command includes several subcommands:
@z

@x
Interactive mode (default):
@y
Interactive mode (default):
@z

@x
```console
$ docker ai
```
@y
```console
$ docker ai
```
@z

@x
Opens the TUI for conversational interaction.
@y
Opens the TUI for conversational interaction.
@z

@x
Version:
@y
Version:
@z

@x
```console
$ docker ai version
```
@y
```console
$ docker ai version
```
@z

@x
Displays the Gordon version.
@y
Displays the Gordon version.
@z

@x
Feedback:
@y
Feedback:
@z

@x
```console
$ docker ai feedback
```
@y
```console
$ docker ai feedback
```
@z

@x
Opens a feedback form in your browser.
@y
Opens a feedback form in your browser.
@z
