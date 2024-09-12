%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リン クへの (no slash) 対応

@x
---
title: Build a named entity recognition app
linkTitle: Named entity recognition
keywords: nlp, natural language processing, named entity recognition, python, spacy, ner
description: Learn how to build and run a named entity recognition application using Python, spaCy, and Docker.
---
@y
---
title: Build a named entity recognition app
linkTitle: Named entity recognition
keywords: nlp, natural language processing, named entity recognition, python, spacy, ner
description: Learn how to build and run a named entity recognition application using Python, spaCy, and Docker.
---
@z

@x
## Overview
@y
## Overview
@z

@x
This guide walks you through building and running a named entity recognition
(NER) application. You'll build the application using Python with
spaCy, and then set up the environment and run the application using Docker.
@y
This guide walks you through building and running a named entity recognition
(NER) application. You'll build the application using Python with
spaCy, and then set up the environment and run the application using Docker.
@z

@x
The application processes input text to identify and print named entities, like people, organizations, or locations.
@y
The application processes input text to identify and print named entities, like people, organizations, or locations.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have installed the latest version of [Docker Desktop](/get-started/get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
* You have installed the latest version of [Docker Desktop](get-started/get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
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

@x
   ```console
   $ git clone https://github.com/harsh4870/Docker-NLP.git
   ```
@y
   ```console
   $ git clone https://github.com/harsh4870/Docker-NLP.git
   ```
@z

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

@x
   ```text
   01_sentiment_analysis.py
   02_name_entity_recognition.py
   03_text_classification.py
   04_text_summarization.py
   05_language_translation.py
   entrypoint.sh
   requirements.txt
   Dockerfile
   README.md
   ```
@y
   ```text
   01_sentiment_analysis.py
   02_name_entity_recognition.py
   03_text_classification.py
   04_text_summarization.py
   05_language_translation.py
   entrypoint.sh
   requirements.txt
   Dockerfile
   README.md
   ```
@z

@x
## Explore the application code
@y
## Explore the application code
@z

@x
The source code for the name recognition application is in the `Docker-NLP/02_name_entity_recognition.py` file. Open `02_name_entity_recognition.py` in a text or code editor to explore its contents in the following steps.
@y
The source code for the name recognition application is in the `Docker-NLP/02_name_entity_recognition.py` file. Open `02_name_entity_recognition.py` in a text or code editor to explore its contents in the following steps.
@z

@x
1. Import the required libraries.
@y
1. Import the required libraries.
@z

@x
   ```python
   import spacy
   ```
@y
   ```python
   import spacy
   ```
@z

@x
   This line imports the `spaCy` library. `spaCy` is a popular library in Python
   used for natural language processing (NLP).
@y
   This line imports the `spaCy` library. `spaCy` is a popular library in Python
   used for natural language processing (NLP).
@z

@x
2. Load the language model.
@y
2. Load the language model.
@z

@x
   ```python
   nlp = spacy.load("en_core_web_sm")
   ```
@y
   ```python
   nlp = spacy.load("en_core_web_sm")
   ```
@z

@x
   Here, the `spacy.load` function loads a language model. The `en_core_web_sm`
   model is a small English language model. You can use this model for various
   NLP tasks, including tokenization, part-of-speech tagging, and named entity
   recognition.
@y
   Here, the `spacy.load` function loads a language model. The `en_core_web_sm`
   model is a small English language model. You can use this model for various
   NLP tasks, including tokenization, part-of-speech tagging, and named entity
   recognition.
@z

@x
3. Specify the main execution block.
@y
3. Specify the main execution block.
@z

@x
   ```python
   if __name__ == "__main__":
   ```
@y
   ```python
   if __name__ == "__main__":
   ```
@z

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
4. Create an infinite loop for continuous input.
@y
4. Create an infinite loop for continuous input.
@z

@x
   ```python
      while True:
   ```
@y
   ```python
      while True:
   ```
@z

@x
   This while loop runs indefinitely until it's explicitly broken. It lets
   the user continuously enter text for entity recognition until they decide
   to exit.
@y
   This while loop runs indefinitely until it's explicitly broken. It lets
   the user continuously enter text for entity recognition until they decide
   to exit.
@z

@x
5. Get user input.
@y
5. Get user input.
@z

@x
   ```python
   input_text = input("Enter the text for entity recognition (type 'exit' to end): ")
   ```
@y
   ```python
   input_text = input("Enter the text for entity recognition (type 'exit' to end): ")
   ```
@z

@x
   This line prompts the user to enter text. The program will then perform entity recognition on this text.
@y
   This line prompts the user to enter text. The program will then perform entity recognition on this text.
@z

@x
6. Define an exit condition.
@y
6. Define an exit condition.
@z

@x
   ```python
   if input_text.lower() == 'exit':
      print("Exiting...")
      break
   ```
@y
   ```python
   if input_text.lower() == 'exit':
      print("Exiting...")
      break
   ```
@z

@x
   If the user types something, the program converts the input to lowercase and
   compares it to `exit`. If they match, the program prints **Exiting...** and
   breaks out of the while loop, effectively ending the program.
@y
   If the user types something, the program converts the input to lowercase and
   compares it to `exit`. If they match, the program prints **Exiting...** and
   breaks out of the while loop, effectively ending the program.
@z

@x
7. Perform named entity recognition.
@y
7. Perform named entity recognition.
@z

@x
   ```python
   doc = nlp(input_text)
@y
   ```python
   doc = nlp(input_text)
@z

@x
   for ent in doc.ents:
      print(f"Entity: {ent.text}, Type: {ent.label_}")
   ```
@y
   for ent in doc.ents:
      print(f"Entity: {ent.text}, Type: {ent.label_}")
   ```
@z

@x
   - `doc = nlp(input_text)`: Here, the nlp model processes the user-input text. This creates a Doc object which contains various NLP attributes, including identified entities.
   - `for ent in doc.ents:`: This loop iterates over the entities found in the text.
   - `print(f"Entity: {ent.text}, Type: {ent.label_}")`: For each entity, it prints the entity text and its type (like PERSON, ORG, or GPE).
@y
   - `doc = nlp(input_text)`: Here, the nlp model processes the user-input text. This creates a Doc object which contains various NLP attributes, including identified entities.
   - `for ent in doc.ents:`: This loop iterates over the entities found in the text.
   - `print(f"Entity: {ent.text}, Type: {ent.label_}")`: For each entity, it prints the entity text and its type (like PERSON, ORG, or GPE).
@z

@x
8. Create `requirements.txt`.
@y
8. Create `requirements.txt`.
@z

@x
   The sample application already contains the `requirements.txt` file to specify the necessary packages that the application imports. Open `requirements.txt` in a code or text editor to explore its contents.
@y
   The sample application already contains the `requirements.txt` file to specify the necessary packages that the application imports. Open `requirements.txt` in a code or text editor to explore its contents.
@z

@x
   ```text
   # 02 named_entity_recognition
   spacy==3.7.2
@y
   ```text
   # 02 named_entity_recognition
   spacy==3.7.2
@z

@x
   ...
   ```
@y
   ...
   ```
@z

@x
   Only the `spacy` package is required for the named recognition application.
@y
   Only the `spacy` package is required for the named recognition application.
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

@x
   ```dockerfile
   FROM python:3.8-slim
   ```
@y
   ```dockerfile
   FROM python:3.8-slim
   ```
@z

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

@x
   ```dockerfile
   WORKDIR /app
   ```
@y
   ```dockerfile
   WORKDIR /app
   ```
@z

@x
   `WORKDIR` sets the current working directory within the Docker image. By
   setting it to `/app`, you ensure that all subsequent commands in the
   Dockerfile (like `COPY` and `RUN`) are executed in this directory. This also
   helps in organizing your Docker image, as all application-related files are
   contained in a specific directory.
@y
   `WORKDIR` sets the current working directory within the Docker image. By
   setting it to `/app`, you ensure that all subsequent commands in the
   Dockerfile (like `COPY` and `RUN`) are executed in this directory. This also
   helps in organizing your Docker image, as all application-related files are
   contained in a specific directory.
@z

@x
3. Copy the requirements file into the image.
@y
3. Copy the requirements file into the image.
@z

@x
   ```dockerfile
   COPY requirements.txt /app
   ```
@y
   ```dockerfile
   COPY requirements.txt /app
   ```
@z

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

@x
   ```dockerfile
   RUN pip install --no-cache-dir -r requirements.txt
   ```
@y
   ```dockerfile
   RUN pip install --no-cache-dir -r requirements.txt
   ```
@z

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

@x
   ```dockerfile
   RUN python -m spacy download en_core_web_sm
   ```
@y
   ```dockerfile
   RUN python -m spacy download en_core_web_sm
   ```
@z

@x
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy.
@y
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy.
@z

@x
6. Copy the application code into the image.
@y
6. Copy the application code into the image.
@z

@x
   ```dockerfile
   COPY *.py /app
   COPY entrypoint.sh /app
   ```
@y
   ```dockerfile
   COPY *.py /app
   COPY entrypoint.sh /app
   ```
@z

@x
   These commands copy your Python scripts and the `entrypoint.sh` script into
   the image's `/app` directory. This is crucial because the container needs
   these scripts to run the application. The `entrypoint.sh` script is
   particularly important as it dictates how the application starts inside the
   container.
@y
   These commands copy your Python scripts and the `entrypoint.sh` script into
   the image's `/app` directory. This is crucial because the container needs
   these scripts to run the application. The `entrypoint.sh` script is
   particularly important as it dictates how the application starts inside the
   container.
@z

@x
7. Set permissions for the `entrypoint.sh` script.
@y
7. Set permissions for the `entrypoint.sh` script.
@z

@x
   ```dockerfile
   RUN chmod +x /app/entrypoint.sh
   ```
@y
   ```dockerfile
   RUN chmod +x /app/entrypoint.sh
   ```
@z

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

@x
   ```dockerfile
   ENTRYPOINT ["/app/entrypoint.sh"]
   ```
@y
   ```dockerfile
   ENTRYPOINT ["/app/entrypoint.sh"]
   ```
@z

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

@x
   ```console
   $ docker build -t basic-nlp .
   ```
@y
   ```console
   $ docker build -t basic-nlp .
   ```
@z

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

@x
   ```console
   $ docker run -it basic-nlp 02_name_entity_recognition.py
   ```
@y
   ```console
   $ docker run -it basic-nlp 02_name_entity_recognition.py
   ```
@z

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
   - `02_name_entity_recognition.py`: This is the script you want to run inside
     the Docker container. It gets passed to the `entrypoint.sh` script, which
     runs it when the container starts.
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
   - `02_name_entity_recognition.py`: This is the script you want to run inside
     the Docker container. It gets passed to the `entrypoint.sh` script, which
     runs it when the container starts.
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
   > then rebuild the image. For more details, see [Avoid unexpected syntax errors, use Unix style line endings for files in containers](/desktop/troubleshoot/topics/#avoid-unexpected-syntax-errors-use-unix-style-line-endings-for-files-in-containers).
@y
   > [!NOTE]
   >
   > For Windows users, you may get an error when running the container. Verify
   > that the line endings in the `entrypoint.sh` are `LF` (`\n`) and not `CRLF` (`\r\n`),
   > then rebuild the image. For more details, see [Avoid unexpected syntax errors, use Unix style line endings for files in containers](__SUBDIR__/desktop/troubleshoot/topics/#avoid-unexpected-syntax-errors-use-unix-style-line-endings-for-files-in-containers).
@z

@x
   You will see the following in your console after the container starts.
@y
   You will see the following in your console after the container starts.
@z

@x
   ```console
   Enter the text for entity recognition (type 'exit' to end):
   ```
@y
   ```console
   Enter the text for entity recognition (type 'exit' to end):
   ```
@z

@x
3. Test the application.
@y
3. Test the application.
@z

@x
   Enter some information to get the named entity recognition.
@y
   Enter some information to get the named entity recognition.
@z

@x
   ```console
   Enter the text for entity recognition (type 'exit' to end): Apple Inc. is planning to open a new store in San Francisco. Tim Cook is the CEO of Apple.
@y
   ```console
   Enter the text for entity recognition (type 'exit' to end): Apple Inc. is planning to open a new store in San Francisco. Tim Cook is the CEO of Apple.
@z

@x
   Entity: Apple Inc., Type: ORG
   Entity: San Francisco, Type: GPE
   Entity: Tim Cook, Type: PERSON
   Entity: Apple, Type: ORG
   ```
@y
   Entity: Apple Inc., Type: ORG
   Entity: San Francisco, Type: GPE
   Entity: Tim Cook, Type: PERSON
   Entity: Apple, Type: ORG
   ```
@z

@x
## Summary
@y
## Summary
@z

@x
This guide demonstrated how to build and run a named entity recognition
application. You learned how to build the application using Python with spaCy,
and then set up the environment and run the application using Docker.
@y
This guide demonstrated how to build and run a named entity recognition
application. You learned how to build the application using Python with spaCy,
and then set up the environment and run the application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
* [Docker CLI reference](/reference/cli/docker/)
* [Dockerfile reference](/reference/dockerfile/)
* [spaCy](https://spacy.io/)
* [Python documentation](https://docs.python.org/3/)
@y
* [Docker CLI reference](__SUBDIR__/reference/cli/docker/)
* [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
* [spaCy](https://spacy.io/)
* [Python documentation](https://docs.python.org/3/)
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
