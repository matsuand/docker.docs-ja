%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
title: Ask Gordon
description: Learn how to streamline your workflow with Docker's AI-powered assistant.
@y
title: Ask Gordon
description: Learn how to streamline your workflow with Docker's AI-powered assistant.
@z

@x
{{< summary-bar feature_name="Ask Gordon" >}}
@y
{{< summary-bar feature_name="Ask Gordon" >}}
@z

@x
Ask Gordon is your personal AI assistant embedded in Docker Desktop and the
Docker CLI. It's designed to streamline your workflow and help you make the
most of the Docker ecosystem.
@y
Ask Gordon is your personal AI assistant embedded in Docker Desktop and the
Docker CLI. It's designed to streamline your workflow and help you make the
most of the Docker ecosystem.
@z

@x
## What is Ask Gordon?
@y
## What is Ask Gordon?
@z

@x
Ask Gordon is a suite of AI-powered capabilities integrated into Docker's
tools. These features, currently in Beta, are not enabled by default, and are
not production-ready. You may also encounter the term "Docker AI" as a broader
reference to this technology.
@y
Ask Gordon is a suite of AI-powered capabilities integrated into Docker's
tools. These features, currently in Beta, are not enabled by default, and are
not production-ready. You may also encounter the term "Docker AI" as a broader
reference to this technology.
@z

@x
The goal of Ask Gordon is to make Docker's tools for managing images and
containers more intuitive and accessible. It provides contextual assistance
tailored to your local environment, including Dockerfiles, containers, and
applications.
@y
The goal of Ask Gordon is to make Docker's tools for managing images and
containers more intuitive and accessible. It provides contextual assistance
tailored to your local environment, including Dockerfiles, containers, and
applications.
@z

@x
Ask Gordon integrates directly with Docker's tools to help you perform specific
tasks. It understands your local setup, such as your local source code and
images. For example, you can ask Gordon to help you identify vulnerabilities in
your project or how to optimize a Dockerfile in your local repository. This
tight integration ensures responses are practical and actionable.
@y
Ask Gordon integrates directly with Docker's tools to help you perform specific
tasks. It understands your local setup, such as your local source code and
images. For example, you can ask Gordon to help you identify vulnerabilities in
your project or how to optimize a Dockerfile in your local repository. This
tight integration ensures responses are practical and actionable.
@z

@x
> [!NOTE]
> Ask Gordon is powered by Large Language Models (LLMs). Like all LLM-based
> tools, its responses may sometimes be inaccurate. Always verify the
> information provided.
@y
> [!NOTE]
> Ask Gordon is powered by Large Language Models (LLMs). Like all LLM-based
> tools, its responses may sometimes be inaccurate. Always verify the
> information provided.
@z

@x
### What data does Gordon access?
@y
### What data does Gordon access?
@z

@x
When you use Ask Gordon, the data it accesses depends on the context of your
query:
@y
When you use Ask Gordon, the data it accesses depends on the context of your
query:
@z

@x
- Local files: If you use the `docker ai` command, Ask Gordon can access
  files and directories in the current working directory where the command is
  executed. In Docker Desktop, if you ask about a specific file or directory in
  the **Ask Gordon** view, you'll be prompted to select the relevant context.
- Local images: Gordon integrates with Docker Desktop and can view all images
  in your local image store. This includes images you've built or pulled from a
  registry.
@y
- Local files: If you use the `docker ai` command, Ask Gordon can access
  files and directories in the current working directory where the command is
  executed. In Docker Desktop, if you ask about a specific file or directory in
  the **Ask Gordon** view, you'll be prompted to select the relevant context.
- Local images: Gordon integrates with Docker Desktop and can view all images
  in your local image store. This includes images you've built or pulled from a
  registry.
@z

@x
To provide accurate responses, Ask Gordon may send relevant files, directories,
or image metadata to the Gordon backend along with your query. This data
transfer occurs over the network but is never stored persistently or shared
with third parties. It is used exclusively to process your request and
formulate a response. For more information about privacy terms and conditions
for Docker AI, review [Gordon's Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
@y
To provide accurate responses, Ask Gordon may send relevant files, directories,
or image metadata to the Gordon backend along with your query. This data
transfer occurs over the network but is never stored persistently or shared
with third parties. It is used exclusively to process your request and
formulate a response. For more information about privacy terms and conditions
for Docker AI, review [Gordon's Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
@z

@x
All data transferred is encrypted in transit.
@y
All data transferred is encrypted in transit.
@z

@x
### How your data is collected and used
@y
### How your data is collected and used
@z

@x
Docker collects anonymized data from your interactions with Ask Gordon to
enhance the service. This includes the following:
@y
Docker collects anonymized data from your interactions with Ask Gordon to
enhance the service. This includes the following:
@z

@x
- Your queries: Questions you ask Gordon.
- Responses: Answers provided by Gordon.
- Feedback: Thumbs-up and thumbs-down ratings.
@y
- Your queries: Questions you ask Gordon.
- Responses: Answers provided by Gordon.
- Feedback: Thumbs-up and thumbs-down ratings.
@z

@x
To ensure privacy and security:
@y
To ensure privacy and security:
@z

@x
- Data is anonymized and cannot be traced back to you or your account.
- Docker does not use this data to train AI models or share it with third
  parties.
@y
- Data is anonymized and cannot be traced back to you or your account.
- Docker does not use this data to train AI models or share it with third
  parties.
@z

@x
By using Ask Gordon, you help improve Docker AI's reliability and accuracy,
making it more effective for all users.
@y
By using Ask Gordon, you help improve Docker AI's reliability and accuracy,
making it more effective for all users.
@z

@x
If you have concerns about data collection or usage, you can
[disable](#disable-ask-gordon) the feature at any time.
@y
If you have concerns about data collection or usage, you can
[disable](#disable-ask-gordon) the feature at any time.
@z

@x
## Setup
@y
## Setup
@z

@x
To use this feature, you must have:
@y
To use this feature, you must have:
@z

@x
- Docker Desktop version 4.38 or later.
@y
- Docker Desktop version 4.38 or later.
@z

@x
Ask Gordon is not enabled by default. To enable the feature:
@y
Ask Gordon is not enabled by default. To enable the feature:
@z

@x
1. [Sign in](#sign-in) to your Docker account.
2. [Enable the feature](#enable-the-feature) in the Docker Desktop settings.
@y
1. [Sign in](#sign-in) to your Docker account.
2. [Enable the feature](#enable-the-feature) in the Docker Desktop settings.
@z

@x
### Sign in
@y
### Sign in
@z

@x
1. Open Docker Desktop.
2. Select the **Sign in** button.
3. Complete the sign-in process in your web browser.
@y
1. Open Docker Desktop.
2. Select the **Sign in** button.
3. Complete the sign-in process in your web browser.
@z

@x
### Enable the feature
@y
### Enable the feature
@z

@x
After signing in to your Docker Account, enable the Docker AI feature:
@y
After signing in to your Docker Account, enable the Docker AI feature:
@z

@x
1. Open the **Settings** view in Docker Desktop.
2. Navigate to **Features in development**.
3. Check the **Enable Docker AI** checkbox.
@y
1. Open the **Settings** view in Docker Desktop.
2. Navigate to **Features in development**.
3. Check the **Enable Docker AI** checkbox.
@z

@x
## Using Ask Gordon
@y
## Using Ask Gordon
@z

@x
The primary interfaces to Docker's AI capabilities are through the **Ask
Gordon** view in Docker Desktop, or if you prefer to use the CLI: the `docker
ai` CLI command.
@y
The primary interfaces to Docker's AI capabilities are through the **Ask
Gordon** view in Docker Desktop, or if you prefer to use the CLI: the `docker
ai` CLI command.
@z

@x
If you've used an AI chatbot before, these interfaces will be pretty familiar
to you. You can chat with the Docker AI to get help with your Docker tasks.
@y
If you've used an AI chatbot before, these interfaces will be pretty familiar
to you. You can chat with the Docker AI to get help with your Docker tasks.
@z

@x
### Contextual help
@y
### Contextual help
@z

@x
Once you've enabled the Docker AI features, you'll also find references to
**Ask Gordon** in various other places throughout the Docker Desktop user
interface. Whenever you encounter a button with the "sparkles" (âœ¨) icon in the
user interface, you can use the button to get contextual support from Ask
Gordon.
@y
Once you've enabled the Docker AI features, you'll also find references to
**Ask Gordon** in various other places throughout the Docker Desktop user
interface. Whenever you encounter a button with the "sparkles" (âœ¨) icon in the
user interface, you can use the button to get contextual support from Ask
Gordon.
@z

@x
## Example workflows
@y
## Example workflows
@z

@x
Ask Gordon is a general-purpose AI assistant created to help you with all your
Docker-related tasks and workflows. If you need some inspiration, here are a
few ways things you can try:
@y
Ask Gordon is a general-purpose AI assistant created to help you with all your
Docker-related tasks and workflows. If you need some inspiration, here are a
few ways things you can try:
@z

@x
- [Troubleshoot a crashed container](#troubleshoot-a-crashed-container)
- [Get help with running a container](#get-help-with-running-a-container)
- [Improve a Dockerfile](#improve-a-dockerfile)
@y
- [Troubleshoot a crashed container](#troubleshoot-a-crashed-container)
- [Get help with running a container](#get-help-with-running-a-container)
- [Improve a Dockerfile](#improve-a-dockerfile)
@z

@x
For more examples, try asking Gordon directly. For example:
@y
For more examples, try asking Gordon directly. For example:
@z

@x
```console
$ docker ai "What can you do?"
```
@y
```console
$ docker ai "What can you do?"
```
@z

@x
### Troubleshoot a crashed container
@y
### Troubleshoot a crashed container
@z

@x
If you try to start a container with an invalid configuration or command, you
can use Ask Gordon to troubleshoot the error. For example, try starting a
Postgres container without specifying a database password:
@y
If you try to start a container with an invalid configuration or command, you
can use Ask Gordon to troubleshoot the error. For example, try starting a
Postgres container without specifying a database password:
@z

@x
```console
$ docker run postgres
Error: Database is uninitialized and superuser password is not specified.
       You must specify POSTGRES_PASSWORD to a non-empty value for the
       superuser. For example, "-e POSTGRES_PASSWORD=password" on "docker run".
@y
```console
$ docker run postgres
Error: Database is uninitialized and superuser password is not specified.
       You must specify POSTGRES_PASSWORD to a non-empty value for the
       superuser. For example, "-e POSTGRES_PASSWORD=password" on "docker run".
@z

@x
       You may also use "POSTGRES_HOST_AUTH_METHOD=trust" to allow all
       connections without a password. This is *not* recommended.
@y
       You may also use "POSTGRES_HOST_AUTH_METHOD=trust" to allow all
       connections without a password. This is *not* recommended.
@z

@x
       See PostgreSQL documentation about "trust":
       https://www.postgresql.org/docs/current/auth-trust.html
```
@y
       See PostgreSQL documentation about "trust":
       https://www.postgresql.org/docs/current/auth-trust.html
```
@z

@x
In the **Containers** view in Docker Desktop, select the âœ¨ icon next to the
container's name, or inspect the container and open the **Ask Gordon** tab.
@y
In the **Containers** view in Docker Desktop, select the âœ¨ icon next to the
container's name, or inspect the container and open the **Ask Gordon** tab.
@z

@x
### Get help with running a container
@y
### Get help with running a container
@z

@x
If you want to run a specific image but you're not sure how, Gordon might be
able to help you get set up:
@y
If you want to run a specific image but you're not sure how, Gordon might be
able to help you get set up:
@z

@x
1. Pull an image from Docker Hub (for example, `postgres`).
2. Open the **Images** view in Docker Desktop and select the image.
3. Select the **Run** button.
@y
1. Pull an image from Docker Hub (for example, `postgres`).
2. Open the **Images** view in Docker Desktop and select the image.
3. Select the **Run** button.
@z

@x
In the _Run a new container_ dialog that opens, you should see a message about
**Ask Gordon**.
@y
In the _Run a new container_ dialog that opens, you should see a message about
**Ask Gordon**.
@z

@x
![Ask Gordon hint in Docker Desktop](../../images/gordon-run-ctr.png)
@y
![Ask Gordon hint in Docker Desktop](../../images/gordon-run-ctr.png)
@z

@x
The linked text in the hint is a suggested prompt to start a conversation with
Ask Gordon.
@y
The linked text in the hint is a suggested prompt to start a conversation with
Ask Gordon.
@z

@x
### Improve a Dockerfile
@y
### Improve a Dockerfile
@z

@x
Gordon can analyze your Dockerfile and suggest improvements. To have Gordon
evaluate your Dockerfile using the `docker ai` command:
@y
Gordon can analyze your Dockerfile and suggest improvements. To have Gordon
evaluate your Dockerfile using the `docker ai` command:
@z

@x
1. Navigate to your project directory:
@y
1. Navigate to your project directory:
@z

@x
   ```console
   $ cd path/to/my/project
   ```
@y
   ```console
   $ cd path/to/my/project
   ```
@z

@x
2. Use the `docker ai` command to rate your Dockerfile:
@y
2. Use the `docker ai` command to rate your Dockerfile:
@z

@x
   ```console
   $ docker ai rate my Dockerfile
   ```
@y
   ```console
   $ docker ai rate my Dockerfile
   ```
@z

@x
Gordon will analyze your Dockerfile and identify opportunities for improvement
across several dimensions:
@y
Gordon will analyze your Dockerfile and identify opportunities for improvement
across several dimensions:
@z

@x
- Build cache optimization
- Security
- Image size efficiency
- Best practices compliance
- Maintainability
- Reproducibility
- Portability
- Resource efficiency
@y
- Build cache optimization
- Security
- Image size efficiency
- Best practices compliance
- Maintainability
- Reproducibility
- Portability
- Resource efficiency
@z

@x
## Disable Ask Gordon
@y
## Disable Ask Gordon
@z

@x
If you've enabled Ask Gordon and you want to disable it again:
@y
If you've enabled Ask Gordon and you want to disable it again:
@z

@x
1. Open the **Settings** view in Docker Desktop.
2. Navigate to **Features in development**.
3. Clear the **Enable Docker AI** checkbox.
4. Select **Apply & restart**.
@y
1. Open the **Settings** view in Docker Desktop.
2. Navigate to **Features in development**.
3. Clear the **Enable Docker AI** checkbox.
4. Select **Apply & restart**.
@z

@x
If you want to disable Ask Gordon for your entire Docker organization, using
[Settings Management](/manuals/security/for-admins/hardened-desktop/settings-management/_index.md),
add the following property to your `admin-settings.json` file:
@y
If you want to disable Ask Gordon for your entire Docker organization, using
[Settings Management](manuals/security/for-admins/hardened-desktop/settings-management/_index.md),
add the following property to your `admin-settings.json` file:
@z

@x
```json
{
  "enableDockerAI": {
    "value": false,
    "locked": true
  }
}
```
@y
```json
{
  "enableDockerAI": {
    "value": false,
    "locked": true
  }
}
```
@z

@x
Alternatively, you can disable all Beta features by setting `allowBetaFeatures` to false:
@y
Alternatively, you can disable all Beta features by setting `allowBetaFeatures` to false:
@z

@x
```json
{
  "allowBetaFeatures": {
    "value": false,
    "locked": true
  }
}
```
@y
```json
{
  "allowBetaFeatures": {
    "value": false,
    "locked": true
  }
}
```
@z

@x
## Feedback
@y
## Feedback
@z

@x
<!-- vale Docker.We = NO -->
@y
<!-- vale Docker.We = NO -->
@z

@x
We value your input on Ask Gordon and encourage you to share your experience.
Your feedback helps us improve and refine Ask Gordon for all users. If you
encounter issues, have suggestions, or simply want to share what you like,
here's how you can get in touch:
@y
We value your input on Ask Gordon and encourage you to share your experience.
Your feedback helps us improve and refine Ask Gordon for all users. If you
encounter issues, have suggestions, or simply want to share what you like,
here's how you can get in touch:
@z

@x
- Thumbs-up and thumbs-down buttons
@y
- Thumbs-up and thumbs-down buttons
@z

@x
  Rate Ask Gordon's responses using the thumbs-up or thumbs-down buttons in the
  response.
@y
  Rate Ask Gordon's responses using the thumbs-up or thumbs-down buttons in the
  response.
@z

@x
- Feedback survey
@y
- Feedback survey
@z

@x
  You can access the Ask Gordon survey by following the _Give feedback_ link in
  the **Ask Gordon** view in Docker Desktop, or from the CLI by running the
  `docker ai feedback` command.
@y
  You can access the Ask Gordon survey by following the _Give feedback_ link in
  the **Ask Gordon** view in Docker Desktop, or from the CLI by running the
  `docker ai feedback` command.
@z

@x
Thank you for helping us improve Ask Gordon.
@y
Thank you for helping us improve Ask Gordon.
@z
