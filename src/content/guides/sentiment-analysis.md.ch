%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Build a sentiment analysis app
linkTitle: Sentiment analysis
keywords: nlp, natural language processing, sentiment analysis, python, nltk
description: Learn how to build and run a sentiment analysis application using Python, NLTK, and Docker.
summary: |
  This guide demonstrates how to containerize sentiment analysis models using
  Docker.
@y
title: センチメント分析アプリのビルド
linkTitle: Sentiment analysis
keywords: nlp, natural language processing, sentiment analysis, python, nltk
description: Learn how to build and run a sentiment analysis application using Python, NLTK, and Docker.
summary: |
  このガイドでは Docker を使ってセンチメント分析モデルをコンテナー化する方法について説明します。
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
In this guide, you learn how to build and run a sentiment analysis application.
You'll build the application using Python with the Natural Language Toolkit
(NLTK), and then set up the environment and run the application using Docker.
@y
In this guide, you learn how to build and run a sentiment analysis application.
You'll build the application using Python with the Natural Language Toolkit
(NLTK), and then set up the environment and run the application using Docker.
@z

@x
The application analyzes user input text for sentiment using NLTK's
SentimentIntensityAnalyzer and outputs whether the sentiment is positive,
negative, or neutral.
@y
The application analyzes user input text for sentiment using NLTK's
SentimentIntensityAnalyzer and outputs whether the sentiment is positive,
negative, or neutral.
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
The source code for the sentiment analysis application is in the `Docker-NLP/01_sentiment_analysis.py` file. Open `01_sentiment_analysis.py` in a text or code editor to explore its contents in the following steps.
@y
The source code for the sentiment analysis application is in the `Docker-NLP/01_sentiment_analysis.py` file. Open `01_sentiment_analysis.py` in a text or code editor to explore its contents in the following steps.
@z

@x
1. Import the required libraries.
@y
1. Import the required libraries.
@z

@x
   ```python
   import nltk
   from nltk.sentiment import SentimentIntensityAnalyzer
   import ssl
   ```
@y
   ```python
   import nltk
   from nltk.sentiment import SentimentIntensityAnalyzer
   import ssl
   ```
@z

@x
   - `nltk`: This is the Natural Language Toolkit library used for working with
     human language data in Python.
   - `SentimentIntensityAnalyzer`: This is a specific tool from NLTK used for
     determining the sentiment of a piece of text.
   - `ssl`: This module provides access to Transport Layer Security (encryption)
     functions used for secure web connections.
@y
   - `nltk`: This is the Natural Language Toolkit library used for working with
     human language data in Python.
   - `SentimentIntensityAnalyzer`: This is a specific tool from NLTK used for
     determining the sentiment of a piece of text.
   - `ssl`: This module provides access to Transport Layer Security (encryption)
     functions used for secure web connections.
@z

@x
2. Handle SSL certificate verification.
@y
2. Handle SSL certificate verification.
@z

@x
   ```python
   try:
       _create_unverified_https_context = ssl._create_unverified_context
   except AttributeError:
       pass
   else:
       ssl._create_default_https_context = _create_unverified_https_context
   ```
@y
   ```python
   try:
       _create_unverified_https_context = ssl._create_unverified_context
   except AttributeError:
       pass
   else:
       ssl._create_default_https_context = _create_unverified_https_context
   ```
@z

@x
   This block is a workaround for certain environments where downloading data through NLTK might fail due to SSL certificate verification issues. It's telling Python to ignore SSL certificate verification for HTTPS requests.
@y
   This block is a workaround for certain environments where downloading data through NLTK might fail due to SSL certificate verification issues. It's telling Python to ignore SSL certificate verification for HTTPS requests.
@z

@x
3. Download NLTK resources.
@y
3. Download NLTK resources.
@z

@x
   ```python
   nltk.download('vader_lexicon')
   nltk.download('punkt')
   ```
@y
   ```python
   nltk.download('vader_lexicon')
   nltk.download('punkt')
   ```
@z

@x
   - `vader_lexicon`: This is a lexicon used by the `SentimentIntensityAnalyzer`
     for sentiment analysis.
   - `punkt`: This is used by NLTK for tokenizing sentences. It's necessary for
     the `SentimentIntensityAnalyzer` to function correctly.
@y
   - `vader_lexicon`: This is a lexicon used by the `SentimentIntensityAnalyzer`
     for sentiment analysis.
   - `punkt`: This is used by NLTK for tokenizing sentences. It's necessary for
     the `SentimentIntensityAnalyzer` to function correctly.
@z

@x
4. Create a sentiment analysis function.
@y
4. Create a sentiment analysis function.
@z

@x
   ```python
   def perform_semantic_analysis(text):
       sid = SentimentIntensityAnalyzer()
       sentiment_score = sid.polarity_scores(text)
@y
   ```python
   def perform_semantic_analysis(text):
       sid = SentimentIntensityAnalyzer()
       sentiment_score = sid.polarity_scores(text)
@z

@x
       if sentiment_score['compound'] >= 0.05:
           return "Positive"
       elif sentiment_score['compound'] <= -0.05:
           return "Negative"
       else:
           return "Neutral"
   ```
@y
       if sentiment_score['compound'] >= 0.05:
           return "Positive"
       elif sentiment_score['compound'] <= -0.05:
           return "Negative"
       else:
           return "Neutral"
   ```
@z

@x
   - `SentimentIntensityAnalyzer()` creates an instance of the
     analyzer.
   - `polarity_scores(text)` generates a sentiment score for the input text.
@y
   - `SentimentIntensityAnalyzer()` creates an instance of the
     analyzer.
   - `polarity_scores(text)` generates a sentiment score for the input text.
@z

@x
   The function returns **Positive**, **Negative**, or **Neutral** based on the
   compound score.
@y
   The function returns **Positive**, **Negative**, or **Neutral** based on the
   compound score.
@z

@x
5. Create the main loop.
@y
5. Create the main loop.
@z

@x
   ```python
   if __name__ == "__main__":
       while True:
           input_text = input("Enter the text for semantic analysis (type 'exit' to end): ")
@y
   ```python
   if __name__ == "__main__":
       while True:
           input_text = input("Enter the text for semantic analysis (type 'exit' to end): ")
@z

@x
           if input_text.lower() == 'exit':
               print("Exiting...")
               break
@y
           if input_text.lower() == 'exit':
               print("Exiting...")
               break
@z

@x
           result = perform_semantic_analysis(input_text)
           print(f"Sentiment: {result}")
   ```
@y
           result = perform_semantic_analysis(input_text)
           print(f"Sentiment: {result}")
   ```
@z

@x
   This part of the script runs an infinite loop to accept user input for
   analysis. If the user types `exit`, the program terminates. Otherwise, it
   prints out the sentiment of the provided text.
@y
   This part of the script runs an infinite loop to accept user input for
   analysis. If the user types `exit`, the program terminates. Otherwise, it
   prints out the sentiment of the provided text.
@z

@x
6. Create `requirements.txt`.
@y
6. Create `requirements.txt`.
@z

@x
   The sample application already contains the
   `requirements.txt` file to specify the necessary packages that the
   application imports. Open `requirements.txt` in a code or text editor to
   explore its contents.
@y
   The sample application already contains the
   `requirements.txt` file to specify the necessary packages that the
   application imports. Open `requirements.txt` in a code or text editor to
   explore its contents.
@z

@x
   ```text
   # 01 sentiment_analysis
   nltk==3.6.5
@y
   ```text
   # 01 sentiment_analysis
   nltk==3.6.5
@z

@x
   ...
   ```
@y
   ...
   ```
@z

@x
   Only the `nltk` package is required for the sentiment analysis application.
@y
   Only the `nltk` package is required for the sentiment analysis application.
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
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy. While not needed for this app, it's included for compatibility with other NLP applications that might use this Dockerfile.
@y
   This step is specific to NLP applications that require the spaCy library. It downloads the `en_core_web_sm` model, which is a small English language model for spaCy. While not needed for this app, it's included for compatibility with other NLP applications that might use this Dockerfile.
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
   For more details, see the [docker build CLI reference](/reference/cli/docker/buildx/build/).
@y
   For more details, see the [docker build CLI reference](__SUBDIR__/reference/cli/docker/buildx/build/).
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
   $ docker run -it basic-nlp 01_sentiment_analysis.py
   ```
@y
   ```console
   $ docker run -it basic-nlp 01_sentiment_analysis.py
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
   - `01_sentiment_analysis.py`: This is the script you want to run inside the
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
   - `01_sentiment_analysis.py`: This is the script you want to run inside the
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

@x
   ```console
   Enter the text for semantic analysis (type 'exit' to end):
   ```
@y
   ```console
   Enter the text for semantic analysis (type 'exit' to end):
   ```
@z

@x
3. Test the application.
@y
3. Test the application.
@z

@x
   Enter a comment to get the sentiment analysis.
@y
   Enter a comment to get the sentiment analysis.
@z

@x
   ```console
   Enter the text for semantic analysis (type 'exit' to end): I love containers!
   Sentiment: Positive
   Enter the text for semantic analysis (type 'exit' to end): I'm still learning about containers.
   Sentiment: Neutral
   ```
@y
   ```console
   Enter the text for semantic analysis (type 'exit' to end): I love containers!
   Sentiment: Positive
   Enter the text for semantic analysis (type 'exit' to end): I'm still learning about containers.
   Sentiment: Neutral
   ```
@z

@x
## Summary
@y
## Summary
@z

@x
In this guide, you learned how to build and run a sentiment analysis
application. You learned how to build the application using Python with NLTK,
and then set up the environment and run the application using Docker.
@y
In this guide, you learned how to build and run a sentiment analysis
application. You learned how to build the application using Python with NLTK,
and then set up the environment and run the application using Docker.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Docker CLI reference](/reference/cli/docker/)
- [Dockerfile reference](/reference/dockerfile/)
- [Natural Language Toolkit](https://www.nltk.org/)
- [Python documentation](https://docs.python.org/3/)
@y
- [Docker CLI reference](__SUBDIR__/reference/cli/docker/)
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
- [Natural Language Toolkit](https://www.nltk.org/)
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
