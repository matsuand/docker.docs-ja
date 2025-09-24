%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Ask Gordon
description: Streamline your workflow with Docker's AI-powered assistant in Docker Desktop and CLI.
@y
title: Ask Gordon
description: Streamline your workflow with Docker's AI-powered assistant in Docker Desktop and CLI.
@z

@x
{{< summary-bar feature_name="Ask Gordon" >}}
@y
{{< summary-bar feature_name="Ask Gordon" >}}
@z

@x
Ask Gordon is your personal AI assistant embedded in Docker Desktop and the
Docker CLI. It's designed to streamline your workflow and help you make the most
of the Docker ecosystem.
@y
Ask Gordon is your personal AI assistant embedded in Docker Desktop and the
Docker CLI. It's designed to streamline your workflow and help you make the most
of the Docker ecosystem.
@z

@x
## Key features
@y
## Key features
@z

@x
Ask Gordon provides AI-powered assistance in Docker tools. It can:
@y
Ask Gordon provides AI-powered assistance in Docker tools. It can:
@z

@x
- Improve Dockerfiles
- Run and troubleshoot containers
- Interact with your images and code
- Find vulnerabilities or configuration issues
- Migrate a Dockerfile to use [Docker Hardened Images](/manuals/dhi/_index.md)
@y
- Improve Dockerfiles
- Run and troubleshoot containers
- Interact with your images and code
- Find vulnerabilities or configuration issues
- Migrate a Dockerfile to use [Docker Hardened Images](manuals/dhi/_index.md)
@z

@x
It understands your local environment, including source code, Dockerfiles, and
images, to provide personalized and actionable guidance.
@y
It understands your local environment, including source code, Dockerfiles, and
images, to provide personalized and actionable guidance.
@z

@x
Ask Gordon remembers conversations, allowing you to switch topics more easily.
@y
Ask Gordon remembers conversations, allowing you to switch topics more easily.
@z

@x
Ask Gordon is not enabled by default, and is not
production-ready. You may also encounter the term "Docker AI" as a broader
reference to this technology.
@y
Ask Gordon is not enabled by default, and is not
production-ready. You may also encounter the term "Docker AI" as a broader
reference to this technology.
@z

@x
> [!NOTE]
>
> Ask Gordon is powered by Large Language Models (LLMs). Like all
> LLM-based tools, its responses may sometimes be inaccurate. Always verify the
> information provided.
@y
> [!NOTE]
>
> Ask Gordon is powered by Large Language Models (LLMs). Like all
> LLM-based tools, its responses may sometimes be inaccurate. Always verify the
> information provided.
@z

@x
### What data does Gordon access?
@y
### What data does Gordon access?
@z

@x
When you use Ask Gordon, the data it accesses depends on your query:
@y
When you use Ask Gordon, the data it accesses depends on your query:
@z

@x
- Local files: If you use the `docker ai` command, Ask Gordon can access files
  and directories in the current working directory where the command is
  executed. In Docker Desktop, if you ask about a specific file or directory in
  the **Ask Gordon** view, you'll be prompted to select the relevant context.
- Local images: Gordon integrates with Docker Desktop and can view all images in
  your local image store. This includes images you've built or pulled from a
  registry.
@y
- Local files: If you use the `docker ai` command, Ask Gordon can access files
  and directories in the current working directory where the command is
  executed. In Docker Desktop, if you ask about a specific file or directory in
  the **Ask Gordon** view, you'll be prompted to select the relevant context.
- Local images: Gordon integrates with Docker Desktop and can view all images in
  your local image store. This includes images you've built or pulled from a
  registry.
@z

@x
To provide accurate responses, Ask Gordon may send relevant files, directories,
or image metadata to the Gordon backend with your query. This data transfer
occurs over the network but is never stored persistently or shared with third
parties. It is used only to process your request and formulate a response. For
details about privacy terms and conditions for Docker AI, review [Gordon's
Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
@y
To provide accurate responses, Ask Gordon may send relevant files, directories,
or image metadata to the Gordon backend with your query. This data transfer
occurs over the network but is never stored persistently or shared with third
parties. It is used only to process your request and formulate a response. For
details about privacy terms and conditions for Docker AI, review [Gordon's
Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
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
improve the service. This includes:
@y
Docker collects anonymized data from your interactions with Ask Gordon to
improve the service. This includes:
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
By using Ask Gordon, you help improve Docker AI's reliability and accuracy for
everyone.
@y
By using Ask Gordon, you help improve Docker AI's reliability and accuracy for
everyone.
@z

@x
If you have concerns about data collection or usage, you can
[disable](#disable-ask-gordon) the feature at any time.
@y
If you have concerns about data collection or usage, you can
[disable](#disable-ask-gordon) the feature at any time.
@z

@x
## Enable Ask Gordon
@y
## Enable Ask Gordon
@z

@x
1. Sign in to your Docker account.
1. Go to the **Beta features** tab in settings.
1. Check the **Enable Docker AI** checkbox.
@y
1. Sign in to your Docker account.
1. Go to the **Beta features** tab in settings.
1. Check the **Enable Docker AI** checkbox.
@z

@x
   The Docker AI terms of service agreement appears. You must agree to the terms
   before you can enable the feature. Review the terms and select **Accept and
   enable** to continue.
@y
   The Docker AI terms of service agreement appears. You must agree to the terms
   before you can enable the feature. Review the terms and select **Accept and
   enable** to continue.
@z

@x
1. Select **Apply**.
@y
1. Select **Apply**.
@z

@x
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, this setting is under the
> **Experimental features** tab on the **Features in development** page.
@y
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, this setting is under the
> **Experimental features** tab on the **Features in development** page.
@z

@x
## Using Ask Gordon
@y
## Using Ask Gordon
@z

@x
You can access Gordon:
@y
You can access Gordon:
@z

@x
- In Docker Desktop, in the **Ask Gordon** view.
- In the Docker CLI, with the `docker ai` command.
@y
- In Docker Desktop, in the **Ask Gordon** view.
- In the Docker CLI, with the `docker ai` command.
@z

@x
After you enable Docker AI features, you will also see **Ask Gordon** in other
places in Docker Desktop. Whenever you see a button with the **Sparkles** (✨)
icon, you can use it to get contextual support from Ask Gordon.
@y
After you enable Docker AI features, you will also see **Ask Gordon** in other
places in Docker Desktop. Whenever you see a button with the **Sparkles** (✨)
icon, you can use it to get contextual support from Ask Gordon.
@z

@x
## Example workflows
@y
## Example workflows
@z

@x
Ask Gordon is a general-purpose AI assistant for Docker tasks and workflows. Here
are some things you can try:
@y
Ask Gordon is a general-purpose AI assistant for Docker tasks and workflows. Here
are some things you can try:
@z

@x
- [Troubleshoot a crashed container](#troubleshoot-a-crashed-container)
- [Get help with running a container](#get-help-with-running-a-container)
- [Improve a Dockerfile](#improve-a-dockerfile)
- [Migrate a Dockerfile to DHI](#migrate-a-dockerfile-to-dhi)
@y
- [Troubleshoot a crashed container](#troubleshoot-a-crashed-container)
- [Get help with running a container](#get-help-with-running-a-container)
- [Improve a Dockerfile](#improve-a-dockerfile)
- [Migrate a Dockerfile to DHI](#migrate-a-dockerfile-to-dhi)
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
If you start a container with an invalid configuration or command, use Ask Gordon
to troubleshoot the error. For example, try starting a Postgres container without
a database password:
@y
If you start a container with an invalid configuration or command, use Ask Gordon
to troubleshoot the error. For example, try starting a Postgres container without
a database password:
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
In the **Containers** view in Docker Desktop, select the ✨ icon next to the
container's name, or inspect the container and open the **Ask Gordon** tab.
@y
In the **Containers** view in Docker Desktop, select the ✨ icon next to the
container's name, or inspect the container and open the **Ask Gordon** tab.
@z

@x
### Get help with running a container
@y
### Get help with running a container
@z

@x
If you want to run a specific image but are not sure how, Gordon can help you get
set up:
@y
If you want to run a specific image but are not sure how, Gordon can help you get
set up:
@z

@x
1. Pull an image from Docker Hub (for example, `postgres`).
1. Open the **Images** view in Docker Desktop and select the image.
1. Select the **Run** button.
@y
1. Pull an image from Docker Hub (for example, `postgres`).
1. Open the **Images** view in Docker Desktop and select the image.
1. Select the **Run** button.
@z

@x
In the **Run a new container** dialog, you see a message about **Ask Gordon**.
@y
In the **Run a new container** dialog, you see a message about **Ask Gordon**.
@z

@x
![Screenshot showing Ask Gordon hint in Docker Desktop.](../../images/gordon-run-ctr.png)
@y
![Screenshot showing Ask Gordon hint in Docker Desktop.](../../images/gordon-run-ctr.png)
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
1. Go to your project directory:
@y
1. Go to your project directory:
@z

@x
   ```console
   $ cd <path-to-your-project>
   ```
@y
   ```console
   $ cd <path-to-your-project>
   ```
@z

@x
1. Use the `docker ai` command to rate your Dockerfile:
@y
1. Use the `docker ai` command to rate your Dockerfile:
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
### Migrate a Dockerfile to DHI
@y
### Migrate a Dockerfile to DHI
@z

@x
Migrating your Dockerfile to use [Docker Hardened Images](/manuals/dhi/_index.md)
helps you build more secure, minimal, and production-ready containers. DHIs
reduce vulnerabilities, enforce best practices, and simplify compliance, making
them a strong foundation for secure software supply chains.
@y
Migrating your Dockerfile to use [Docker Hardened Images](manuals/dhi/_index.md)
helps you build more secure, minimal, and production-ready containers. DHIs
reduce vulnerabilities, enforce best practices, and simplify compliance, making
them a strong foundation for secure software supply chains.
@z

@x
To request Gordon's help for the migration:
@y
To request Gordon's help for the migration:
@z

@x
{{% include "gordondhi.md" %}}
@y
{{% include "gordondhi.md" %}}
@z

@x
## Disable Ask Gordon
@y
## Disable Ask Gordon
@z

@x
### For individual users
@y
### For individual users
@z

@x
If you've enabled Ask Gordon and you want to disable it again:
@y
If you've enabled Ask Gordon and you want to disable it again:
@z

@x
1. Open the **Settings** view in Docker Desktop.
1. Go to **Beta features**.
1. Clear the **Enable Docker AI** checkbox.
1. Select **Apply**.
@y
1. Open the **Settings** view in Docker Desktop.
1. Go to **Beta features**.
1. Clear the **Enable Docker AI** checkbox.
1. Select **Apply**.
@z

@x
### For organizations
@y
### For organizations
@z

@x
To disable Ask Gordon for your entire Docker organization, use [Settings
Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md)
and add this property to your `admin-settings.json` file:
@y
To disable Ask Gordon for your entire Docker organization, use [Settings
Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md)
and add this property to your `admin-settings.json` file:
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
Or disable all Beta features by setting `allowBetaFeatures` to false:
@y
Or disable all Beta features by setting `allowBetaFeatures` to false:
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
