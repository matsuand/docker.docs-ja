%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Build a language translation app
linkTitle: Language translation
keywords: nlp, natural language processing, text summarization, python, language translation, googletrans
description: Learn how to build and run a language translation application using Python, Googletrans, and Docker.
@y
title: 言語翻訳アプリのビルド
linkTitle: Language translation
keywords: nlp, natural language processing, text summarization, python, language translation, googletrans
description: Learn how to build and run a language translation application using Python, Googletrans, and Docker.
@z

@x
summary: |
  This guide demonstrates how to use Docker to deploy language translation
  models for NLP tasks.
@y
summary: |
  このガイドでは Docker を使って自然言語処理 (NLP) タスクの言語翻訳モデルをデプロイする方法について説明します。
@z

@x
tags: [ai]
languages: [python]
@y
tags: [ai]
languages: [python]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
## Overview
@y
## Overview
@z

@x
This guide walks you through building and running a language translation
application. You'll build the application using Python with Googletrans, and
then set up the environment and run the application using Docker.
@y
This guide walks you through building and running a language translation
application. You'll build the application using Python with Googletrans, and
then set up the environment and run the application using Docker.
@z

@x
The application demonstrates a simple but practical use of the Googletrans
library for language translation, showcasing basic Python and Docker concepts.
Googletrans is a free and unlimited Python library that implements the Google
Translate API. It uses the Google Translate Ajax API to make calls to such
methods as detect and translate.
@y
The application demonstrates a simple but practical use of the Googletrans
library for language translation, showcasing basic Python and Docker concepts.
Googletrans is a free and unlimited Python library that implements the Google
Translate API. It uses the Google Translate Ajax API to make calls to such
methods as detect and translate.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
1. Open a terminal, and clone the sample application's repository using the
   following command.
@y
1. Open a terminal, and clone the sample application's repository using the
   following command.
@z

% snip command...

@x
2. Verify that you cloned the repository.
@y
2. Verify that you cloned the repository.
@z

@x
   You should see the following files in your `Docker-NLP` directory.
@y
   You should see the following files in your `Docker-NLP` directory.
@z

% snip text...

@x
## Explore the application code
@y
## Explore the application code
@z

@x
The source code for the application is in the
`Docker-NLP/05_language_translation.py` file. Open `05_language_translation.py`
in a text or code editor to explore its contents in the following steps.
@y
The source code for the application is in the
`Docker-NLP/05_language_translation.py` file. Open `05_language_translation.py`
in a text or code editor to explore its contents in the following steps.
@z

@x
1. Import the required libraries.
@y
1. Import the required libraries.
@z

% snip code...

@x
   This line imports the `Translator` class from `googletrans`.
   Googletrans is a Python library that provides an interface to Google
   Translate's AJAX API.
@y
   This line imports the `Translator` class from `googletrans`.
   Googletrans is a Python library that provides an interface to Google
   Translate's AJAX API.
@z

@x
2. Specify the main execution block.
@y
2. Specify the main execution block.
@z

% snip code...

@x
   This Python idiom ensures that the following code block runs only if this
   script is the main program. It provides flexibility, allowing the script to
   function both as a standalone program and as an imported module.
@y
   This Python idiom ensures that the following code block runs only if this
   script is the main program. It provides flexibility, allowing the script to
   function both as a standalone program and as an imported module.
@z

@x
3. Create an infinite loop for continuous input.
@y
3. Create an infinite loop for continuous input.
@z

% snip code...

@x
   An infinite loop is established here to continuously prompt you for text
   input, ensuring interactivity. The loop breaks when you type `exit`, allowing
   you to control the application flow effectively.
@y
   An infinite loop is established here to continuously prompt you for text
   input, ensuring interactivity. The loop breaks when you type `exit`, allowing
   you to control the application flow effectively.
@z

@x
4. Create an instance of Translator.
@y
4. Create an instance of Translator.
@z

% snip code...

@x
   This creates an instance of the Translator class, which
   performs the translation.
@y
   This creates an instance of the Translator class, which
   performs the translation.
@z

@x
5. Translate text.
@y
5. Translate text.
@z

% snip code...

@x
   Here, the `translator.translate` method is called with the user input. The
   `dest='fr'` argument specifies that the destination language for translation
   is French. The `.text` attribute gets the translated string. For more details
   about the available language codes, see the 
   [Googletrans docs](https://py-googletrans.readthedocs.io/en/latest/).
@y
   Here, the `translator.translate` method is called with the user input. The
   `dest='fr'` argument specifies that the destination language for translation
   is French. The `.text` attribute gets the translated string. For more details
   about the available language codes, see the 
   [Googletrans docs](https://py-googletrans.readthedocs.io/en/latest/).
@z

@x
6. Print the original and translated text.
@y
6. Print the original and translated text.
@z

% snip code...

@x
   These two lines print the original text entered by the user and the
   translated text.
@y
   These two lines print the original text entered by the user and the
   translated text.
@z

@x
7. Create `requirements.txt`. The sample application already contains the
   `requirements.txt` file to specify the necessary modules that the
   application imports. Open `requirements.txt` in a code or text editor to
   explore its contents.
@y
7. Create `requirements.txt`. The sample application already contains the
   `requirements.txt` file to specify the necessary modules that the
   application imports. Open `requirements.txt` in a code or text editor to
   explore its contents.
@z

% snip text...

@x
   Only `googletrans` is required for the language translation application.
@y
   Only `googletrans` is required for the language translation application.
@z

@x
## Explore the application environment
@y
## Explore the application environment
@z

@x
You'll use Docker to run the application in a container. Docker lets you
containerize the application, providing a consistent and isolated environment
for running it. This means the application will operate as intended within its
Docker container, regardless of the underlying system differences.
@y
You'll use Docker to run the application in a container. Docker lets you
containerize the application, providing a consistent and isolated environment
for running it. This means the application will operate as intended within its
Docker container, regardless of the underlying system differences.
@z

@x
To run the application in a container, a Dockerfile is required. A Dockerfile is
a text document that contains all the commands you would call on the command
line to assemble an image. An image is a read-only template with instructions
for creating a Docker container.
@y
To run the application in a container, a Dockerfile is required. A Dockerfile is
a text document that contains all the commands you would call on the command
line to assemble an image. An image is a read-only template with instructions
for creating a Docker container.
@z

@x
The sample application already contains a `Dockerfile`. Open the `Dockerfile` in a code or text editor to explore its contents.
@y
The sample application already contains a `Dockerfile`. Open the `Dockerfile` in a code or text editor to explore its contents.
@z

@x
The following steps explain each part of the `Dockerfile`. For more details, see the [Dockerfile reference](/reference/dockerfile/).
@y
The following steps explain each part of the `Dockerfile`. For more details, see the [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
1. Specify the base image.
@y
1. Specify the base image.
@z

% snip code...

@x
   This command sets the foundation for the build. `python:3.8-slim` is a
   lightweight version of the Python 3.8 image, optimized for size and speed.
   Using this slim image reduces the overall size of your Docker image, leading
   to quicker downloads and less surface area for security vulnerabilities. This
   is particularly useful for a Python-based application where you might not
   need the full standard Python image.
@y
   This command sets the foundation for the build. `python:3.8-slim` is a
   lightweight version of the Python 3.8 image, optimized for size and speed.
   Using this slim image reduces the overall size of your Docker image, leading
   to quicker downloads and less surface area for security vulnerabilities. This
   is particularly useful for a Python-based application where you might not
   need the full standard Python image.
@z

@x
2. Set the working directory.
@y
2. Set the working directory.
@z

% snip code...

@x
   `WORKDIR` sets the current working directory within the Docker image. By
   setting it to `/app`, you ensure that all subsequent commands in the
   Dockerfile
   (like `COPY` and `RUN`) are executed in this directory. This also helps in
   organizing your Docker image, as all application-related files are contained
   in a specific directory.
@y
   `WORKDIR` sets the current working directory within the Docker image. By
   setting it to `/app`, you ensure that all subsequent commands in the
   Dockerfile
   (like `COPY` and `RUN`) are executed in this directory. This also helps in
   organizing your Docker image, as all application-related files are contained
   in a specific directory.
@z

@x
3. Copy the requirements file into the image.
@y
3. Copy the requirements file into the image.
@z

% snip code...

@x
   The `COPY` command transfers the `requirements.txt` file from
   your local machine into the Docker image. This file lists all Python
   dependencies required by the application. Copying it into the container
   lets the next command (`RUN pip install`) install these dependencies
   inside the image environment.
@y
   The `COPY` command transfers the `requirements.txt` file from
   your local machine into the Docker image. This file lists all Python
   dependencies required by the application. Copying it into the container
   lets the next command (`RUN pip install`) install these dependencies
   inside the image environment.
@z

@x
4. Install the Python dependencies in the image.
@y
4. Install the Python dependencies in the image.
@z

% snip code...

@x
   This line uses `pip`, Python's package installer, to install the packages
   listed in `requirements.txt`. The `--no-cache-dir` option disables
   the cache, which reduces the size of the Docker image by not storing the
   unnecessary cache data.
@y
   This line uses `pip`, Python's package installer, to install the packages
   listed in `requirements.txt`. The `--no-cache-dir` option disables
   the cache, which reduces the size of the Docker image by not storing the
   unnecessary cache data.
@z

@x
5. Run additional commands.
@y
5. Run additional commands.
@z

% snip code...

@x
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy. While not needed for this app, it's included for compatibility with other NLP applications that might use this Dockerfile.
@y
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy. While not needed for this app, it's included for compatibility with other NLP applications that might use this Dockerfile.
@z

@x
6. Copy the application code into the image.
@y
6. Copy the application code into the image.
@z

% snip code...

@x
   These commands copy your Python scripts and the `entrypoint.sh` script into the image's `/app` directory. This is crucial because the container needs these scripts to run the application. The `entrypoint.sh` script is particularly important as it dictates how the application starts inside the container.
@y
   These commands copy your Python scripts and the `entrypoint.sh` script into the image's `/app` directory. This is crucial because the container needs these scripts to run the application. The `entrypoint.sh` script is particularly important as it dictates how the application starts inside the container.
@z

@x
7. Set permissions for the `entrypoint.sh` script.
@y
7. Set permissions for the `entrypoint.sh` script.
@z

% snip code...

@x
   This command modifies the file permissions of `entrypoint.sh`, making it
   executable. This step is necessary to ensure that the Docker container can
   run this script to start the application.
@y
   This command modifies the file permissions of `entrypoint.sh`, making it
   executable. This step is necessary to ensure that the Docker container can
   run this script to start the application.
@z

@x
8. Set the entry point.
@y
8. Set the entry point.
@z

% snip code...

@x
   The `ENTRYPOINT` instruction configures the container to run `entrypoint.sh`
   as its default executable. This means that when the container starts, it
   automatically executes the script.
@y
   The `ENTRYPOINT` instruction configures the container to run `entrypoint.sh`
   as its default executable. This means that when the container starts, it
   automatically executes the script.
@z

@x
   You can explore the `entrypoint.sh` script by opening it in a code or text
   editor. As the sample contains several applications, the script lets you
   specify which application to run when the container starts.
@y
   You can explore the `entrypoint.sh` script by opening it in a code or text
   editor. As the sample contains several applications, the script lets you
   specify which application to run when the container starts.
@z

@x
## Run the application
@y
## Run the application
@z

@x
To run the application using Docker:
@y
To run the application using Docker:
@z

@x
1. Build the image.
@y
1. Build the image.
@z

@x
   In a terminal, run the following command inside the directory of where the `Dockerfile` is located.
@y
   In a terminal, run the following command inside the directory of where the `Dockerfile` is located.
@z

% snip command...

@x
   The following is a break down of the command:
@y
   The following is a break down of the command:
@z

@x
   - `docker build`: This is the primary command used to build a Docker image
     from a Dockerfile and a context. The context is typically a set of files at
     a specified location, often the directory containing the Dockerfile.
   - `-t basic-nlp`: This is an option for tagging the image. The `-t` flag
     stands for tag. It assigns a name to the image, which in this case is
     `basic-nlp`. Tags are a convenient way to reference images later,
     especially when pushing them to a registry or running containers.
   - `.`: This is the last part of the command and specifies the build context.
     The period (`.`) denotes the current directory. Docker will look for a
     Dockerfile in this directory. The build context (the current directory, in
     this case) is sent to the Docker daemon to enable the build. It includes
     all the files and subdirectories in the specified directory.
@y
   - `docker build`: This is the primary command used to build a Docker image
     from a Dockerfile and a context. The context is typically a set of files at
     a specified location, often the directory containing the Dockerfile.
   - `-t basic-nlp`: This is an option for tagging the image. The `-t` flag
     stands for tag. It assigns a name to the image, which in this case is
     `basic-nlp`. Tags are a convenient way to reference images later,
     especially when pushing them to a registry or running containers.
   - `.`: This is the last part of the command and specifies the build context.
     The period (`.`) denotes the current directory. Docker will look for a
     Dockerfile in this directory. The build context (the current directory, in
     this case) is sent to the Docker daemon to enable the build. It includes
     all the files and subdirectories in the specified directory.
@z

@x
   For more details, see the [docker build CLI reference](/reference/cli/docker/buildx/build/).
@y
   For more details, see the [docker build CLI reference](__SUBDIR__/reference/cli/docker/buildx/build/).
@z

@x
   Docker outputs several logs to your console as it builds the image. You'll
   see it download and install the dependencies. Depending on your network
   connection, this may take several minutes. Docker does have a caching
   feature, so subsequent builds can be faster. The console will
   return to the prompt when it's complete.
@y
   Docker outputs several logs to your console as it builds the image. You'll
   see it download and install the dependencies. Depending on your network
   connection, this may take several minutes. Docker does have a caching
   feature, so subsequent builds can be faster. The console will
   return to the prompt when it's complete.
@z

@x
2. Run the image as a container.
@y
2. Run the image as a container.
@z

@x
   In a terminal, run the following command.
@y
   In a terminal, run the following command.
@z

% snip command...

@x
   The following is a break down of the command:
@y
   The following is a break down of the command:
@z

@x
   - `docker run`: This is the primary command used to run a new container from
     a Docker image.
   - `-it`: This is a combination of two options:
     - `-i` or `--interactive`: This keeps the standard input (STDIN) open even
       if not attached. It lets the container remain running in the
       foreground and be interactive.
     - `-t` or `--tty`: This allocates a pseudo-TTY, essentially simulating a
       terminal, like a command prompt or a shell. It's what lets you
       interact with the application inside the container.
   - `basic-nlp`: This specifies the name of the Docker image to use for
     creating the container. In this case, it's the image named `basic-nlp` that
     you created with the `docker build` command.
   - `05_language_translation.py`: This is the script you want to run inside the
     Docker container. It gets passed to the `entrypoint.sh` script, which runs
     it when the container starts.
@y
   - `docker run`: This is the primary command used to run a new container from
     a Docker image.
   - `-it`: This is a combination of two options:
     - `-i` or `--interactive`: This keeps the standard input (STDIN) open even
       if not attached. It lets the container remain running in the
       foreground and be interactive.
     - `-t` or `--tty`: This allocates a pseudo-TTY, essentially simulating a
       terminal, like a command prompt or a shell. It's what lets you
       interact with the application inside the container.
   - `basic-nlp`: This specifies the name of the Docker image to use for
     creating the container. In this case, it's the image named `basic-nlp` that
     you created with the `docker build` command.
   - `05_language_translation.py`: This is the script you want to run inside the
     Docker container. It gets passed to the `entrypoint.sh` script, which runs
     it when the container starts.
@z

@x
   For more details, see the [docker run CLI reference](/reference/cli/docker/container/run/).
@y
   For more details, see the [docker run CLI reference](__SUBDIR__/reference/cli/docker/container/run/).
@z

@x
   > [!NOTE]
   >
   > For Windows users, you may get an error when running the container. Verify
   > that the line endings in the `entrypoint.sh` are `LF` (`\n`) and not `CRLF` (`\r\n`),
   > then rebuild the image. For more details, see [Avoid unexpected syntax errors, use Unix style line endings for files in containers](/desktop/troubleshoot-and-support/troubleshoot/topics/#Unexpected-syntax-errors-use-Unix-style-line endings-for-files-in-containers).
@y
   > [!NOTE]
   >
   > For Windows users, you may get an error when running the container. Verify
   > that the line endings in the `entrypoint.sh` are `LF` (`\n`) and not `CRLF` (`\r\n`),
   > then rebuild the image. For more details, see [Avoid unexpected syntax errors, use Unix style line endings for files in containers](__SUBDIR__/desktop/troubleshoot-and-support/troubleshoot/topics/#Unexpected-syntax-errors-use-Unix-style-line endings-for-files-in-containers).
@z

@x
   You will see the following in your console after the container starts.
@y
   You will see the following in your console after the container starts.
@z

% snip output...

@x
3. Test the application.
@y
3. Test the application.
@z

@x
   Enter some text to get the text summarization.
@y
   Enter some text to get the text summarization.
@z

% snip output...

@x
## Summary
@y
## Summary
@z

@x
In this guide, you learned how to build and run a language translation
application. You learned how to build the application using Python with
Googletrans, and then set up the environment and run the application using
Docker.
@y
In this guide, you learned how to build and run a language translation
application. You learned how to build the application using Python with
Googletrans, and then set up the environment and run the application using
Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Docker CLI reference](/reference/cli/docker/)
- [Dockerfile reference](/reference/dockerfile/)
- [Googletrans](https://github.com/ssut/py-googletrans)
- [Python documentation](https://docs.python.org/3/)
@y
- [Docker CLI reference](__SUBDIR__/reference/cli/docker/)
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
- [Googletrans](https://github.com/ssut/py-googletrans)
- [Python documentation](https://docs.python.org/3/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Explore more [natural language processing guides](./_index.md).
@y
Explore more [natural language processing guides](./_index.md).
@z
