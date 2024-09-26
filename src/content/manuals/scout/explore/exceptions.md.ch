%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Manage vulnerability exceptions
description: |
  Exceptions let you provide additional context and documentation for how
  vulnerabilities affect your artifacts, and provides the ability to
  suppress non-applicable vulnerabilities
keywords: scout, cves, suppress, vex, exceptions
@y
title: Manage vulnerability exceptions
description: |
  Exceptions let you provide additional context and documentation for how
  vulnerabilities affect your artifacts, and provides the ability to
  suppress non-applicable vulnerabilities
keywords: scout, cves, suppress, vex, exceptions
@z

@x
Vulnerabilities found in container images sometimes need additional context.
Just because an image contains a vulnerable package, it doesn't mean that the
vulnerability is exploitable. **Exceptions** in Docker Scout lets you
acknowledge accepted risks or address false positives in image analysis.
@y
Vulnerabilities found in container images sometimes need additional context.
Just because an image contains a vulnerable package, it doesn't mean that the
vulnerability is exploitable. **Exceptions** in Docker Scout lets you
acknowledge accepted risks or address false positives in image analysis.
@z

@x
By negating non-applicable vulnerabilities, you can make it easier for yourself
and downstream consumers of your images to understand the security implications
of a vulnerability in the context of an image.
@y
By negating non-applicable vulnerabilities, you can make it easier for yourself
and downstream consumers of your images to understand the security implications
of a vulnerability in the context of an image.
@z

@x
In Docker Scout, exceptions are automatically factored into the results.
If an image contains an exception that flags a CVE as non-applicable,
then that CVE is excluded from analysis results.
@y
In Docker Scout, exceptions are automatically factored into the results.
If an image contains an exception that flags a CVE as non-applicable,
then that CVE is excluded from analysis results.
@z

@x
## Create exceptions
@y
## Create exceptions
@z

@x
To create an exception for an image, you can:
@y
To create an exception for an image, you can:
@z

@x
- Create an exception in the [GUI](/manuals/scout/how-tos/create-exceptions-gui.md) of
  Docker Scout Dashboard.
@y
- Create an exception in the [GUI](manuals/scout/how-tos/create-exceptions-gui.md) of
  Docker Scout Dashboard.
@z

@x
- Create a [VEX](/manuals/scout/how-tos/create-exceptions-vex.md) document and attach
  it to the image.
@y
- Create a [VEX](manuals/scout/how-tos/create-exceptions-vex.md) document and attach
  it to the image.
@z

@x
The recommended way to create exceptions is to use Docker Scout Dashboard. The
GUI provides a user-friendly interface for creating exceptions. It also lets
you create exceptions for multiple images, or your entire organization, all at
once.
@y
The recommended way to create exceptions is to use Docker Scout Dashboard. The
GUI provides a user-friendly interface for creating exceptions. It also lets
you create exceptions for multiple images, or your entire organization, all at
once.
@z

@x
## View exceptions
@y
## View exceptions
@z

@x
To view exceptions for images, you need to have the appropriate permissions.
@y
To view exceptions for images, you need to have the appropriate permissions.
@z

@x
- Exceptions created [using the GUI](/manuals/scout/how-tos/create-exceptions-gui.md)
  are visible to members of your Docker organization. Unauthenticated users or
  users who aren't members of your organization cannot see these exceptions.
- Exceptions created [using VEX documents](/manuals/scout/how-tos/create-exceptions-vex.md)
  are visible to anyone who can pull the image, since the VEX document is
  stored in the image manifest or on filesystem of the image.
@y
- Exceptions created [using the GUI](manuals/scout/how-tos/create-exceptions-gui.md)
  are visible to members of your Docker organization. Unauthenticated users or
  users who aren't members of your organization cannot see these exceptions.
- Exceptions created [using VEX documents](manuals/scout/how-tos/create-exceptions-vex.md)
  are visible to anyone who can pull the image, since the VEX document is
  stored in the image manifest or on filesystem of the image.
@z

@x
### View exceptions in Docker Scout Dashboard
@y
### View exceptions in Docker Scout Dashboard
@z

@x
The [**Exceptions** tab](https://scout.docker.com/reports/vulnerabilities/exceptions)
of the Vulnerabilities page in Docker Scout Dashboard lists all exceptions for
for all images in your organization. From here, you can see more details about
each exception, the CVEs being suppressed, the images that exceptions apply to,
the type of exception and how it was created, and more.
@y
The [**Exceptions** tab](https://scout.docker.com/reports/vulnerabilities/exceptions)
of the Vulnerabilities page in Docker Scout Dashboard lists all exceptions for
for all images in your organization. From here, you can see more details about
each exception, the CVEs being suppressed, the images that exceptions apply to,
the type of exception and how it was created, and more.
@z

@x
For exceptions created using the [GUI](/manuals/scout/how-tos/create-exceptions-gui.md),
selecting the action menu lets you edit or remove the exception.
@y
For exceptions created using the [GUI](manuals/scout/how-tos/create-exceptions-gui.md),
selecting the action menu lets you edit or remove the exception.
@z

@x
To view all exceptions for a specific image tag:
@y
To view all exceptions for a specific image tag:
@z

@x
1. Go to the [Images page](https://scout.docker.com/reports/images).
2. Select the tag that you want to inspect.
3. Open the **Exceptions** tab.
@y
1. Go to the [Images page](https://scout.docker.com/reports/images).
2. Select the tag that you want to inspect.
3. Open the **Exceptions** tab.
@z

@x
### View exceptions in the CLI
@y
### View exceptions in the CLI
@z

@x
{{% experimental %}}
Viewing exceptions in the CLI is an experimental feature.
It requires the latest version of the Docker Scout CLI plugin.
Some exceptions may not appear correctly in the CLI.
{{% /experimental %}}
@y
{{% experimental %}}
Viewing exceptions in the CLI is an experimental feature.
It requires the latest version of the Docker Scout CLI plugin.
Some exceptions may not appear correctly in the CLI.
{{% /experimental %}}
@z

@x
Vulnerability exceptions are highlighted in the CLI when you run `docker scout
cves <image>`. If a CVE is suppressed by an exception, a `SUPPRESSED` label
appears next to the CVE ID. Details about the exception are also displayed.
@y
Vulnerability exceptions are highlighted in the CLI when you run `docker scout
cves <image>`. If a CVE is suppressed by an exception, a `SUPPRESSED` label
appears next to the CVE ID. Details about the exception are also displayed.
@z

@x
![SUPPRESSED label in the CLI output](/scout/images/suppressed-cve-cli.png)
@y
![SUPPRESSED label in the CLI output](__SUBDIR__/scout/images/suppressed-cve-cli.png)
@z

@x
> [!IMPORTANT]
> In order to view exceptions in the CLI, you must configure the CLI to use
> the same Docker organization that you used to create the exceptions.
>
> To configure an organization for the CLI, run:
>
> ```console
> $ docker scout configure organization <organization>
> ```
>
> Replace `<organization>` with the name of your Docker organization.
>
> You can also set the organization on a per-command basis by using the
> `--org` flag:
>
> ```console
> $ docker scout cves --org <organization> <image>
> ```
@y
> [!IMPORTANT]
> In order to view exceptions in the CLI, you must configure the CLI to use
> the same Docker organization that you used to create the exceptions.
>
> To configure an organization for the CLI, run:
>
> ```console
> $ docker scout configure organization <organization>
> ```
>
> Replace `<organization>` with the name of your Docker organization.
>
> You can also set the organization on a per-command basis by using the
> `--org` flag:
>
> ```console
> $ docker scout cves --org <organization> <image>
> ```
@z

@x
To exclude suppressed CVEs from the output, use the `--ignore-suppressed` flag:
@y
To exclude suppressed CVEs from the output, use the `--ignore-suppressed` flag:
@z

@x
```console
$ docker scout cves --ignore-suppressed <image>
```
@y
```console
$ docker scout cves --ignore-suppressed <image>
```
@z