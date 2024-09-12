%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create an exception using the GUI
description: Create an exception for a vulnerability in an image using the Docker Scout Dashboard.
keywords: Docker, Docker Scout, vulnerability, exception, create, GUI
@y
title: Create an exception using the GUI
description: Create an exception for a vulnerability in an image using the Docker Scout Dashboard.
keywords: Docker, Docker Scout, vulnerability, exception, create, GUI
@z

@x
The Docker Scout Dashboard provides a user-friendly interface for creating
[exceptions](/manuals/scout/explore/exceptions.md) for vulnerabilities found in
container images. Exceptions let you acknowledge accepted risks or address
false positives in image analysis.
@y
The Docker Scout Dashboard provides a user-friendly interface for creating
[exceptions](manuals/scout/explore/exceptions.md) for vulnerabilities found in
container images. Exceptions let you acknowledge accepted risks or address
false positives in image analysis.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To create an in the Docker Scout Dashboard, you need a Docker account with
**Editor** or **Owner** permissions for the Docker organization that owns the
image.
@y
To create an in the Docker Scout Dashboard, you need a Docker account with
**Editor** or **Owner** permissions for the Docker organization that owns the
image.
@z

@x
## Steps
@y
## Steps
@z

@x
To create an exception for a vulnerability in an image using the Docker Scout
Dashboard:
@y
To create an exception for a vulnerability in an image using the Docker Scout
Dashboard:
@z

@x
1. Go to the [Images page](https://scout.docker.com/reports/images).
2. Select the image tag that contains the vulnerability you want to create an
   exception for.
3. Open the **Image layers** tab.
4. Select the layer that contains the vulnerability you want to create an
   exception for.
5. In the **Vulnerabilities** tab, find the vulnerability you want to create an
   exception for. Vulnerabilities are grouped by package. Find the package that
   contains the vulnerability you want to create an exception for, and then
   expand the package.
6. Select the **Create exception** button next to the vulnerability.
@y
1. Go to the [Images page](https://scout.docker.com/reports/images).
2. Select the image tag that contains the vulnerability you want to create an
   exception for.
3. Open the **Image layers** tab.
4. Select the layer that contains the vulnerability you want to create an
   exception for.
5. In the **Vulnerabilities** tab, find the vulnerability you want to create an
   exception for. Vulnerabilities are grouped by package. Find the package that
   contains the vulnerability you want to create an exception for, and then
   expand the package.
6. Select the **Create exception** button next to the vulnerability.
@z

@x
{{% create_panel.inline %}}
Selecting the **Create exception** button opens the **Create exception** side panel.
In this panel, you can provide the details of the exception:
@y
{{% create_panel.inline %}}
Selecting the **Create exception** button opens the **Create exception** side panel.
In this panel, you can provide the details of the exception:
@z

@x
- **Exception type**: The type of exception. The only supported types are:
@y
- **Exception type**: The type of exception. The only supported types are:
@z

@x
  - **Accepted risk**: The vulnerability is not addressed due to its minimal
    security risk, high remediation costs, dependence on an upstream fix, or
    similar.
  - **False positive**: The vulnerability presents no security risk in your
    specific use case, configuration, or because of measures in place that
    block exploitation
@y
  - **Accepted risk**: The vulnerability is not addressed due to its minimal
    security risk, high remediation costs, dependence on an upstream fix, or
    similar.
  - **False positive**: The vulnerability presents no security risk in your
    specific use case, configuration, or because of measures in place that
    block exploitation
@z

@x
    If you select **False positive**, you must provide a justification for why
    the vulnerability is a false positive:
@y
    If you select **False positive**, you must provide a justification for why
    the vulnerability is a false positive:
@z

@x
- **Additional details**: Any additional information that you want to
  provide about the exception.
@y
- **Additional details**: Any additional information that you want to
  provide about the exception.
@z

@x
- **Scope**: The scope of the exception. The scope can be:
@y
- **Scope**: The scope of the exception. The scope can be:
@z

@x
  - **Image**: The exception applies to the selected image.
  - **All images in repository**: The exception applies to all images in the
    repository.
  - **Specific repository**: The exception applies to all images in the
    specified repositories.
  - **All images in my organization**: The exception applies to all images in
    your organization.
@y
  - **Image**: The exception applies to the selected image.
  - **All images in repository**: The exception applies to all images in the
    repository.
  - **Specific repository**: The exception applies to all images in the
    specified repositories.
  - **All images in my organization**: The exception applies to all images in
    your organization.
@z

@x
- **Package scope**: The scope of the exception. The package scope can be:
@y
- **Package scope**: The scope of the exception. The package scope can be:
@z

@x
  - **Selected package**: The exception applies to the selected package.
  - **Any packages**: The exception applies to all packages vulnerable to this
    CVE.
@y
  - **Selected package**: The exception applies to the selected package.
  - **Any packages**: The exception applies to all packages vulnerable to this
    CVE.
@z

@x
When you've filled in the details, select the **Create** button to create the
exception.
@y
When you've filled in the details, select the **Create** button to create the
exception.
@z

@x
The exception is now created and factored into the analysis results for the
images that you selected. The exception is also listed on the **Exceptions**
tab of the [Vulnerabilities page](https://scout.docker.com/reports/vulnerabilities/exceptions)
in the Docker Scout Dashboard.
@y
The exception is now created and factored into the analysis results for the
images that you selected. The exception is also listed on the **Exceptions**
tab of the [Vulnerabilities page](https://scout.docker.com/reports/vulnerabilities/exceptions)
in the Docker Scout Dashboard.
@z

@x
{{% /create_panel.inline %}}
@y
{{% /create_panel.inline %}}
@z
