%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Run, develop, and share data science projects using JupyterLab and Docker
keywords: getting started, jupyter, notebook, python, jupyterlab, data science
title: Data science with JupyterLab
@y
description: Run, develop, and share data science projects using JupyterLab and Docker
keywords: getting started, jupyter, notebook, python, jupyterlab, data science
title: Data science with JupyterLab
@z

@x
Docker and JupyterLab are two powerful tools that can enhance your data science
workflow. In this guide, you will learn how to use them together to create and
run reproducible data science environments. This guide is based on
[Supercharging AI/ML Development with JupyterLab and
Docker](https://www.docker.com/blog/supercharging-ai-ml-development-with-jupyterlab-and-docker/).
@y
Docker and JupyterLab are two powerful tools that can enhance your data science
workflow. In this guide, you will learn how to use them together to create and
run reproducible data science environments. This guide is based on
[Supercharging AI/ML Development with JupyterLab and
Docker](https://www.docker.com/blog/supercharging-ai-ml-development-with-jupyterlab-and-docker/).
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Run a personal Jupyter Server with JupyterLab on your local machine
- Customize your JupyterLab environment
- Share your JupyterLab notebook and environment with other data scientists
@y
- Run a personal Jupyter Server with JupyterLab on your local machine
- Customize your JupyterLab environment
- Share your JupyterLab notebook and environment with other data scientists
@z

@x
## What is JupyterLab?
@y
## What is JupyterLab?
@z

@x
[JupyterLab](https://jupyterlab.readthedocs.io/en/stable/) is an open source application built around the concept of a computational notebook document. It enables sharing and executing code, data processing, visualization, and offers a range of interactive features for creating graphs.
@y
[JupyterLab](https://jupyterlab.readthedocs.io/en/stable/) is an open source application built around the concept of a computational notebook document. It enables sharing and executing code, data processing, visualization, and offers a range of interactive features for creating graphs.
@z

@x
## Why use Docker and JupyterLab together?
@y
## Why use Docker and JupyterLab together?
@z

@x
By combining Docker and JupyterLab, you can benefit from the advantages of both tools, such as:
@y
By combining Docker and JupyterLab, you can benefit from the advantages of both tools, such as:
@z

@x
- Containerization ensures a consistent JupyterLab environment across all
  deployments, eliminating compatibility issues.
- Containerized JupyterLab simplifies sharing and collaboration by removing the
  need for manual environment setup.
- Containers offer scalability for JupyterLab, supporting workload distribution
  and efficient resource management with platforms like Kubernetes.
@y
- Containerization ensures a consistent JupyterLab environment across all
  deployments, eliminating compatibility issues.
- Containerized JupyterLab simplifies sharing and collaboration by removing the
  need for manual environment setup.
- Containers offer scalability for JupyterLab, supporting workload distribution
  and efficient resource management with platforms like Kubernetes.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To follow along with this guide, you must install the latest version of [Docker Desktop](../../../get-docker.md).
@y
To follow along with this guide, you must install the latest version of [Docker Desktop](../../../get-docker.md).
@z

@x
## Run and access a JupyterLab container
@y
## Run and access a JupyterLab container
@z

@x
In a terminal, run the following command to run your JupyterLab container.
@y
In a terminal, run the following command to run your JupyterLab container.
@z

@x
```console
$ docker run --rm -p 8889:8888 quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
The following are the notable parts of the command:
@y
```console
$ docker run --rm -p 8889:8888 quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
The following are the notable parts of the command:
@z

@x
- `-p 8889:8888`: Maps port 8889 from the host to port 8888 on the container.
- `start-notebook.py --NotebookApp.token='my-token'`: Sets an access token
  rather than using a random token.
@y
- `-p 8889:8888`: Maps port 8889 from the host to port 8888 on the container.
- `start-notebook.py --NotebookApp.token='my-token'`: Sets an access token
  rather than using a random token.
@z

@x
For more details, see the [Jupyter Server Options](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#jupyter-server-options) and the [docker run CLI reference](/reference/cli/docker/container/run/).
@y
For more details, see the [Jupyter Server Options](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#jupyter-server-options) and the [docker run CLI reference](__SUBDIR__/reference/cli/docker/container/run/).
@z

@x
If this is the first time you are running the image, Docker will download and
run it. The amount of time it takes to download the image will vary depending on
your network connection.
@y
If this is the first time you are running the image, Docker will download and
run it. The amount of time it takes to download the image will vary depending on
your network connection.
@z

@x
After the image downloads and runs, you can access the container. To access the
container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@y
After the image downloads and runs, you can access the container. To access the
container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@z

@x
To stop the container, in the terminal press `ctrl`+`c`.
@y
To stop the container, in the terminal press `ctrl`+`c`.
@z

@x
To access an existing notebook on your system, you can use a
[bind mount](/storage/bind-mounts/). Open a terminal and
change directory to where your existing notebook is. Then,
run the following command based on your operating system.
@y
To access an existing notebook on your system, you can use a
[bind mount](__SUBDIR__/storage/bind-mounts/). Open a terminal and
change directory to where your existing notebook is. Then,
run the following command based on your operating system.
@z

@x
{{< tabs >}}
{{< tab name="Mac / Linux" >}}
@y
{{< tabs >}}
{{< tab name="Mac / Linux" >}}
@z

@x
```console
$ docker run --rm -p 8889:8888 -v "$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 -v "$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
{{< /tab >}}
{{< tab name="Windows (Command Prompt)" >}}
@y
{{< /tab >}}
{{< tab name="Windows (Command Prompt)" >}}
@z

@x
```console
$ docker run --rm -p 8889:8888 -v "%cd%":/home/jovyan/work quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 -v "%cd%":/home/jovyan/work quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
{{< /tab >}}
{{< tab name="Windows (PowerShell)" >}}
@y
{{< /tab >}}
{{< tab name="Windows (PowerShell)" >}}
@z

@x
```console
$ docker run --rm -p 8889:8888 -v "$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 -v "$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
{{< /tab >}}
{{< tab name="Windows (Git Bash)" >}}
@y
{{< /tab >}}
{{< tab name="Windows (Git Bash)" >}}
@z

@x
```console
$ docker run --rm -p 8889:8888 -v "/$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 -v "/$(pwd):/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
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
The `-v` option tells Docker to mount your current working directory to
`/home/jovyan/work` inside the container. By default, the Jupyter image's root
directory is `/home/jovyan` and you can only access or save notebooks to that
directory in the container.
@y
The `-v` option tells Docker to mount your current working directory to
`/home/jovyan/work` inside the container. By default, the Jupyter image's root
directory is `/home/jovyan` and you can only access or save notebooks to that
directory in the container.
@z

@x
Now you can access [localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token) and open notebooks contained in the bind mounted directory.
@y
Now you can access [localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token) and open notebooks contained in the bind mounted directory.
@z

@x
To stop the container, in the terminal press `ctrl`+`c`.
@y
To stop the container, in the terminal press `ctrl`+`c`.
@z

@x
Docker also has volumes, which are the preferred mechanism for persisting
data generated by and used by Docker containers. While bind mounts are dependent
on the directory structure and OS of the host machine, volumes are completely
managed by Docker.
@y
Docker also has volumes, which are the preferred mechanism for persisting
data generated by and used by Docker containers. While bind mounts are dependent
on the directory structure and OS of the host machine, volumes are completely
managed by Docker.
@z

@x
## Save and access notebooks
@y
## Save and access notebooks
@z

@x
When you remove a container, all data in that container is deleted. To save
notebooks outside of the container, you can use a [volume](/storage/volumes/).
@y
When you remove a container, all data in that container is deleted. To save
notebooks outside of the container, you can use a [volume](__SUBDIR__/storage/volumes/).
@z

@x
### Run a JupterLab container with a volume
@y
### Run a JupterLab container with a volume
@z

@x
To start the container with a volume, open a terminal and run the following command
@y
To start the container with a volume, open a terminal and run the following command
@z

@x
```console
$ docker run --rm -p 8889:8888 -v jupyter-data:/home/jovyan/work quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 -v jupyter-data:/home/jovyan/work quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
The `-v` option tells Docker to create a volume named `jupyter-data` and mount it in the container at `/home/jovyan/work`.
@y
The `-v` option tells Docker to create a volume named `jupyter-data` and mount it in the container at `/home/jovyan/work`.
@z

@x
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
Notebooks can now be saved to the volume and will accessible even when
the container is deleted.
@y
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
Notebooks can now be saved to the volume and will accessible even when
the container is deleted.
@z

@x
### Save a notebook to the volume
@y
### Save a notebook to the volume
@z

@x
For this example, you'll use the [Iris Dataset](https://scikit-learn.org/stable/auto_examples/datasets/plot_iris_dataset.html) example from scikit-learn.
@y
For this example, you'll use the [Iris Dataset](https://scikit-learn.org/stable/auto_examples/datasets/plot_iris_dataset.html) example from scikit-learn.
@z

@x
1. Open a web browser and access your JupyterLab container at [localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@y
1. Open a web browser and access your JupyterLab container at [localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@z

@x
2. In the **Launcher**, under **Notebook**, select **Python 3**.
@y
2. In the **Launcher**, under **Notebook**, select **Python 3**.
@z

@x
3. In the notebook, specify the following to install the necessary packages.
@y
3. In the notebook, specify the following to install the necessary packages.
@z

@x
   ```console
   !pip install matplotlib scikit-learn
   ```
@y
   ```console
   !pip install matplotlib scikit-learn
   ```
@z

@x
4. Select the play button to run the code.
@y
4. Select the play button to run the code.
@z

@x
5. In the notebook, specify the following code.
   ```python
   from sklearn import datasets
@y
5. In the notebook, specify the following code.
   ```python
   from sklearn import datasets
@z

@x
   iris = datasets.load_iris()
   import matplotlib.pyplot as plt
@y
   iris = datasets.load_iris()
   import matplotlib.pyplot as plt
@z

@x
   _, ax = plt.subplots()
   scatter = ax.scatter(iris.data[:, 0], iris.data[:, 1], c=iris.target)
   ax.set(xlabel=iris.feature_names[0], ylabel=iris.feature_names[1])
   _ = ax.legend(
      scatter.legend_elements()[0], iris.target_names, loc="lower right", title="Classes"
   )
   ```
6. Select the play button to run the code. You should see a scatter plot of the
   Iris dataset.
@y
   _, ax = plt.subplots()
   scatter = ax.scatter(iris.data[:, 0], iris.data[:, 1], c=iris.target)
   ax.set(xlabel=iris.feature_names[0], ylabel=iris.feature_names[1])
   _ = ax.legend(
      scatter.legend_elements()[0], iris.target_names, loc="lower right", title="Classes"
   )
   ```
6. Select the play button to run the code. You should see a scatter plot of the
   Iris dataset.
@z

@x
7. In the top menu, select **File** and then **Save Notebook**.
@y
7. In the top menu, select **File** and then **Save Notebook**.
@z

@x
8. Specify a name in the `work` directory to save the notebook to the volume.
   For example, `work/mynotebook.ipynb`.
@y
8. Specify a name in the `work` directory to save the notebook to the volume.
   For example, `work/mynotebook.ipynb`.
@z

@x
9. Select **Rename** to save the notebook.
@y
9. Select **Rename** to save the notebook.
@z

@x
The notebook is now saved in the volume.
@y
The notebook is now saved in the volume.
@z

@x
In the terminal, press `ctrl`+ `c` to stop the container.
@y
In the terminal, press `ctrl`+ `c` to stop the container.
@z

@x
Now, any time you run a Jupyter container with the volume, you'll have access to the saved notebook.
@y
Now, any time you run a Jupyter container with the volume, you'll have access to the saved notebook.
@z

@x
When you do run a new container, and then run the data plot code again, it'll
need to run `!pip install matplotlib scikit-learn` and download the packages.
You can avoid reinstalling packages every time you run a new container by
creating your own image with the packages already installed.
@y
When you do run a new container, and then run the data plot code again, it'll
need to run `!pip install matplotlib scikit-learn` and download the packages.
You can avoid reinstalling packages every time you run a new container by
creating your own image with the packages already installed.
@z

@x
## Customize your JupyterLab environment
@y
## Customize your JupyterLab environment
@z

@x
You can create your own JupyterLab environment and build it into an image using
Docker. By building your own image, you can customize your JupyterLab
environment with the packages and tools you need, and ensure that it's
consistent and reproducible across different deployments. Building your own
image also makes it easier to share your JupyterLab environment with others, or
to use it as a base for further development.
@y
You can create your own JupyterLab environment and build it into an image using
Docker. By building your own image, you can customize your JupyterLab
environment with the packages and tools you need, and ensure that it's
consistent and reproducible across different deployments. Building your own
image also makes it easier to share your JupyterLab environment with others, or
to use it as a base for further development.
@z

@x
### Define your environment in a Dockerfile
@y
### Define your environment in a Dockerfile
@z

@x
In the previous Iris Dataset example from [Save a notebook to the volume](#save-a-notebook-to-the-volume), you had to install the dependencies, `matplotlib` and `scikit-learn`, every time you ran a new container. While the dependencies in that small example download and
install quickly, it may become a problem as your list of dependencies grow.
There may also be other tools, packages, or files that you always want in your
environment.
@y
In the previous Iris Dataset example from [Save a notebook to the volume](#save-a-notebook-to-the-volume), you had to install the dependencies, `matplotlib` and `scikit-learn`, every time you ran a new container. While the dependencies in that small example download and
install quickly, it may become a problem as your list of dependencies grow.
There may also be other tools, packages, or files that you always want in your
environment.
@z

@x
In this case, you can install the dependencies as part of the environment in the
image. Then, every time you run your container, the dependencies will always be
installed.
@y
In this case, you can install the dependencies as part of the environment in the
image. Then, every time you run your container, the dependencies will always be
installed.
@z

@x
You can define your environment in a Dockerfile. A Dockerfile is a text file
that instructs Docker how to create an image of your JupyterLab environment. An
image contains everything you want and need when running JupyterLab, such as
files, packages, and tools.
@y
You can define your environment in a Dockerfile. A Dockerfile is a text file
that instructs Docker how to create an image of your JupyterLab environment. An
image contains everything you want and need when running JupyterLab, such as
files, packages, and tools.
@z

@x
In a directory of your choice, create a new text file named `Dockerfile`. Open the `Dockerfile` in an IDE or text editor and then add the following contents.
@y
In a directory of your choice, create a new text file named `Dockerfile`. Open the `Dockerfile` in an IDE or text editor and then add the following contents.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM quay.io/jupyter/base-notebook
RUN pip install --no-cache-dir matplotlib scikit-learn
```
@y
FROM quay.io/jupyter/base-notebook
RUN pip install --no-cache-dir matplotlib scikit-learn
```
@z

@x
This Dockerfile uses the `quay.io/jupyter/base-notebook` image as the base, and then runs `pip` to install the dependencies. For more details about the instructions in the Dockerfile, see the [Dockerfile reference](/reference/dockerfile/).
@y
This Dockerfile uses the `quay.io/jupyter/base-notebook` image as the base, and then runs `pip` to install the dependencies. For more details about the instructions in the Dockerfile, see the [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
Before you proceed, save your changes to the `Dockerfile`.
@y
Before you proceed, save your changes to the `Dockerfile`.
@z

@x
### Build your environment into an image
@y
### Build your environment into an image
@z

@x
After you have a `Dockerfile` to define your environment, you can use `docker
build` to build an image using your `Dockerfile`.
@y
After you have a `Dockerfile` to define your environment, you can use `docker
build` to build an image using your `Dockerfile`.
@z

@x
Open a terminal, change directory to the directory where your `Dockerfile` is
located, and then run the following command.
@y
Open a terminal, change directory to the directory where your `Dockerfile` is
located, and then run the following command.
@z

@x
```console
$ docker build -t my-jupyter-image .
```
@y
```console
$ docker build -t my-jupyter-image .
```
@z

@x
The command  builds a Docker image from your `Dockerfile` and a context. The
`-t` option specifies the name and tag of the image, in this case
`my-jupyter-image`. The `.` indicates that the current directory is the context,
which means that the files in that directory can be used in the image creation
process.
@y
The command  builds a Docker image from your `Dockerfile` and a context. The
`-t` option specifies the name and tag of the image, in this case
`my-jupyter-image`. The `.` indicates that the current directory is the context,
which means that the files in that directory can be used in the image creation
process.
@z

@x
You can verify that the image was built by viewing the `Images` view in Docker Desktop, or by running the `docker image ls` command in a terminal. You should see an image named `my-jupyter-image`.
@y
You can verify that the image was built by viewing the `Images` view in Docker Desktop, or by running the `docker image ls` command in a terminal. You should see an image named `my-jupyter-image`.
@z

@x
## Run your image as a container
@y
## Run your image as a container
@z

@x
To run your image as a container, you use the `docker run` command. In the
`docker run` command, you'll specify your own image name.
@y
To run your image as a container, you use the `docker run` command. In the
`docker run` command, you'll specify your own image name.
@z

@x
```console
$ docker run --rm -p 8889:8888 my-jupyter-image start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 my-jupyter-image start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@y
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@z

@x
You can now use the packages without having to install them in your notebook.
@y
You can now use the packages without having to install them in your notebook.
@z

@x
1. In the **Launcher**, under **Notebook**, select **Python 3**.
@y
1. In the **Launcher**, under **Notebook**, select **Python 3**.
@z

@x
2. In the notebook, specify the following code.
@y
2. In the notebook, specify the following code.
@z

@x
   ```python
   from sklearn import datasets
@y
   ```python
   from sklearn import datasets
@z

@x
   iris = datasets.load_iris()
   import matplotlib.pyplot as plt
@y
   iris = datasets.load_iris()
   import matplotlib.pyplot as plt
@z

@x
   _, ax = plt.subplots()
   scatter = ax.scatter(iris.data[:, 0], iris.data[:, 1], c=iris.target)
   ax.set(xlabel=iris.feature_names[0], ylabel=iris.feature_names[1])
   _ = ax.legend(
      scatter.legend_elements()[0], iris.target_names, loc="lower right", title="Classes"
   )
   ```
@y
   _, ax = plt.subplots()
   scatter = ax.scatter(iris.data[:, 0], iris.data[:, 1], c=iris.target)
   ax.set(xlabel=iris.feature_names[0], ylabel=iris.feature_names[1])
   _ = ax.legend(
      scatter.legend_elements()[0], iris.target_names, loc="lower right", title="Classes"
   )
   ```
@z

@x
3. Select the play button to run the code. You should see a scatter plot of the Iris dataset.
@y
3. Select the play button to run the code. You should see a scatter plot of the Iris dataset.
@z

@x
In the terminal, press `ctrl`+ `c` to stop the container.
@y
In the terminal, press `ctrl`+ `c` to stop the container.
@z

@x
## Use Compose to run your container
@y
## Use Compose to run your container
@z

@x
Docker Compose is a tool for defining and running multi-container applications.
In this case, the application isn't a multi-container application, but Docker
Compose can make it easier to run by defining all the `docker run` options in a
file.
@y
Docker Compose is a tool for defining and running multi-container applications.
In this case, the application isn't a multi-container application, but Docker
Compose can make it easier to run by defining all the `docker run` options in a
file.
@z

@x
### Create a Compose file
@y
### Create a Compose file
@z

@x
To use Compose, you need a `compose.yaml` file. In the same directory as your
`Dockerfile`, create a new file named `compose.yaml`.
@y
To use Compose, you need a `compose.yaml` file. In the same directory as your
`Dockerfile`, create a new file named `compose.yaml`.
@z

@x
Open the `compose.yaml` file in an IDE or text editor and add the following
contents.
@y
Open the `compose.yaml` file in an IDE or text editor and add the following
contents.
@z

@x
```yaml
services:
  jupyter:
    build:
      context: .
    ports:
      - 8889:8888
    volumes:
      - jupyter-data:/home/jovyan/work
    command: start-notebook.py --NotebookApp.token='my-token'
@y
```yaml
services:
  jupyter:
    build:
      context: .
    ports:
      - 8889:8888
    volumes:
      - jupyter-data:/home/jovyan/work
    command: start-notebook.py --NotebookApp.token='my-token'
@z

@x
volumes:
  jupyter-data:
    name: jupyter-data
```
@y
volumes:
  jupyter-data:
    name: jupyter-data
```
@z

@x
This Compose file specifies all the options you used in the `docker run` command. For more details about the Compose instructions, see the
[Compose file reference](../../../compose/compose-file/_index.md).
@y
This Compose file specifies all the options you used in the `docker run` command. For more details about the Compose instructions, see the
[Compose file reference](../../../compose/compose-file/_index.md).
@z

@x
Before you proceed, save your changes to the `compose.yaml` file.
@y
Before you proceed, save your changes to the `compose.yaml` file.
@z

@x
### Run your container using Compose
@y
### Run your container using Compose
@z

@x
Open a terminal, change directory to where your `compose.yaml` file is located, and then run the following command.
@y
Open a terminal, change directory to where your `compose.yaml` file is located, and then run the following command.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
This command builds your image and runs it as a container using the instructions
specified in the `compose.yaml` file. The `--build` option ensures that your
image is rebuilt, which is necessary if you made changes to your `Dockefile`.
@y
This command builds your image and runs it as a container using the instructions
specified in the `compose.yaml` file. The `--build` option ensures that your
image is rebuilt, which is necessary if you made changes to your `Dockefile`.
@z

@x
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@y
To access the container, in a web browser navigate to
[localhost:8889/lab?token=my-token](http://localhost:8889/lab?token=my-token).
@z

@x
In the terminal, press `ctrl`+ `c` to stop the container.
@y
In the terminal, press `ctrl`+ `c` to stop the container.
@z

@x
## Share your work
@y
## Share your work
@z

@x
By sharing your image and notebook, you create a portable and replicable
research environment that can be easily accessed and used by other data
scientists. This process not only facilitates collaboration but also ensures
that your work is preserved in an environment where it can be run without
compatibility issues.
@y
By sharing your image and notebook, you create a portable and replicable
research environment that can be easily accessed and used by other data
scientists. This process not only facilitates collaboration but also ensures
that your work is preserved in an environment where it can be run without
compatibility issues.
@z

@x
To share your image and data, you'll use [Docker Hub](https://hub.docker.com/). Docker Hub is a cloud-based registry service that lets you share and distribute container images.
@y
To share your image and data, you'll use [Docker Hub](https://hub.docker.com/). Docker Hub is a cloud-based registry service that lets you share and distribute container images.
@z

@x
### Share your image
@y
### Share your image
@z

@x
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or sign in to [Docker Hub](https://hub.docker.com).
@y
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Rename your image so that Docker knows which repository to push it to. Open a
   terminal and run the following `docker tag` command. Replace `YOUR-USER-NAME`
   with your Docker ID.
@y
2. Rename your image so that Docker knows which repository to push it to. Open a
   terminal and run the following `docker tag` command. Replace `YOUR-USER-NAME`
   with your Docker ID.
@z

@x
   ```console
   $ docker tag my-jupyter-image YOUR-USER-NAME/my-jupyter-image
   ```
@y
   ```console
   $ docker tag my-jupyter-image YOUR-USER-NAME/my-jupyter-image
   ```
@z

@x
3. Run the following `docker push` command to push the image to Docker Hub.
   Replace `YOUR-USER-NAME` with your Docker ID.
@y
3. Run the following `docker push` command to push the image to Docker Hub.
   Replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
   ```console
   $ docker push YOUR-USER-NAME/my-jupyter-image
   ```
@y
   ```console
   $ docker push YOUR-USER-NAME/my-jupyter-image
   ```
@z

@x
4. Verify that you pushed the image to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@y
4. Verify that you pushed the image to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@z

@x
Other users can now download and run your image using the `docker run` command. They need to replace `YOUR-USER-NAME` with your Docker ID.
@y
Other users can now download and run your image using the `docker run` command. They need to replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
```console
$ docker run --rm -p 8889:8888 YOUR-USER-NAME/my-jupyer-image start-notebook.py --NotebookApp.token='my-token'
```
@y
```console
$ docker run --rm -p 8889:8888 YOUR-USER-NAME/my-jupyer-image start-notebook.py --NotebookApp.token='my-token'
```
@z

@x
### Share your volume
@y
### Share your volume
@z

@x
This example uses the Docker Desktop [Volumes Backup & Share](https://hub.docker.com/extensions/docker/volumes-backup-extension) extension. Alternatively, in the CLI you can [back up the volume](/storage/volumes/#back-up-a-volume) and then [push it using the ORAS CLI](/docker-hub/oci-artifacts/#push-a-volume).
@y
This example uses the Docker Desktop [Volumes Backup & Share](https://hub.docker.com/extensions/docker/volumes-backup-extension) extension. Alternatively, in the CLI you can [back up the volume](__SUBDIR__/storage/volumes/#back-up-a-volume) and then [push it using the ORAS CLI](__SUBDIR__/docker-hub/oci-artifacts/#push-a-volume).
@z

@x
1. Install the Volumes Backup & Share extension.
   1. Open the Docker Dashboard and select **Extensions**.
   2. Search for `Volumes Backup & Share`.
   3. In the search results select **Install** for the extension.
@y
1. Install the Volumes Backup & Share extension.
   1. Open the Docker Dashboard and select **Extensions**.
   2. Search for `Volumes Backup & Share`.
   3. In the search results select **Install** for the extension.
@z

@x
2. Open the **Volumes Backup & Share** extension in the Docker Dashboard.
3. Next to the **jupyter-data** volume, select the **Export volume** icon.
4. In the **Export content** window, select **Registry**.
5. In the text box under **Registry**, specify your Docker ID and a name for the
   volume. For example, `YOUR-USERNAME/jupyter-data`.
6. Select **Export**.
7. Verify that you exported the volume to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@y
2. Open the **Volumes Backup & Share** extension in the Docker Dashboard.
3. Next to the **jupyter-data** volume, select the **Export volume** icon.
4. In the **Export content** window, select **Registry**.
5. In the text box under **Registry**, specify your Docker ID and a name for the
   volume. For example, `YOUR-USERNAME/jupyter-data`.
6. Select **Export**.
7. Verify that you exported the volume to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@z

@x
Other users can now download and import your volume. To import the volume and then run it with your image:
@y
Other users can now download and import your volume. To import the volume and then run it with your image:
@z

@x
1. In the Volumes Backup & Share extension, select **Import into new volume**.
2. In the **Import into a new volume** window, select **Registry**.
3. In the text box under **Registry**, specify your Docker ID and the repository
   name for the volume. For example, `YOUR-USERNAME/jupyter-data`.
4. In **Volume name**, specify the name you want to give the
   volume. This example uses `jupyter-data` as the name.
5. Select **Import**.
6. In a terminal, run `docker run` to run your image with the imported volume.
   Replace `YOUR-USER-NAME` with your Docker ID.
@y
1. In the Volumes Backup & Share extension, select **Import into new volume**.
2. In the **Import into a new volume** window, select **Registry**.
3. In the text box under **Registry**, specify your Docker ID and the repository
   name for the volume. For example, `YOUR-USERNAME/jupyter-data`.
4. In **Volume name**, specify the name you want to give the
   volume. This example uses `jupyter-data` as the name.
5. Select **Import**.
6. In a terminal, run `docker run` to run your image with the imported volume.
   Replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
   ```console
   $ docker run --rm -p 8889:8888 -v jupyter-data:/home/jovyan/work YOUR-USER-NAME/my-jupyter-image start-notebook.py --NotebookApp.token='my-token'
   ```
@y
   ```console
   $ docker run --rm -p 8889:8888 -v jupyter-data:/home/jovyan/work YOUR-USER-NAME/my-jupyter-image start-notebook.py --NotebookApp.token='my-token'
   ```
@z

@x
## Summary
@y
## Summary
@z

@x
In this guide, you learned how to leverage Docker and JupyterLab to create
reproducible data science environments, facilitating the development and sharing
of data science projects. This included, running a personal JupyterLab server,
customizing the environment with necessary tools and packages, and sharing
notebooks and environments with other data scientists.
@y
In this guide, you learned how to leverage Docker and JupyterLab to create
reproducible data science environments, facilitating the development and sharing
of data science projects. This included, running a personal JupyterLab server,
customizing the environment with necessary tools and packages, and sharing
notebooks and environments with other data scientists.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile/)
- [Compose file reference](/compose/compose-file/)
- [Docker CLI reference](reference/cli/docker/)
- [Jupyter Docker Stacks docs](https://jupyter-docker-stacks.readthedocs.io/en/latest/)
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
- [Compose file reference](__SUBDIR__/compose/compose-file/)
- [Docker CLI reference](reference/cli/docker/)
- [Jupyter Docker Stacks docs](https://jupyter-docker-stacks.readthedocs.io/en/latest/)
@z
