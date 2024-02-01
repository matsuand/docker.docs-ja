%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Scout quickstart
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
aliases:
  - /atomist/get-started/
---
@y
---
title: Docker Scout quickstart
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
aliases:
  - /atomist/get-started/
---
@z

@x
Docker Scout analyzes image contents and generates a detailed report of packages
and vulnerabilities that it detects. It can provide you with
suggestions for how to remediate issues discovered by image analysis.
@y
Docker Scout analyzes image contents and generates a detailed report of packages
and vulnerabilities that it detects. It can provide you with
suggestions for how to remediate issues discovered by image analysis.
@z

@x
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@y
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@z

@x
## Step 1: Setup
@y
## Step 1: Setup
@z

@x
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@y
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@z

@x
1. Clone its repository:
@y
1. Clone its repository:
@z

@x
   ```console
   $ git clone https://github.com/docker/scout-demo-service.git
   ```
@y
   ```console
   $ git clone https://github.com/docker/scout-demo-service.git
   ```
@z

@x
2. Move into the directory:
@y
2. Move into the directory:
@z

@x
   ```console
   $ cd scout-demo-service
   ```
@y
   ```console
   $ cd scout-demo-service
   ```
@z

@x
3. Make sure you're signed in to your Docker account,
   either by running the `docker login` command or by signing in with Docker Desktop.
@y
3. Make sure you're signed in to your Docker account,
   either by running the `docker login` command or by signing in with Docker Desktop.
@z

@x
4. Build the image and push it to a `<ORG_NAME>/scout-demo:v1`,
   where `<ORG_NAME>` is the Docker Hub namespace you push to.
@y
4. Build the image and push it to a `<ORG_NAME>/scout-demo:v1`,
   where `<ORG_NAME>` is the Docker Hub namespace you push to.
@z

@x
   ```console
   $ docker build --push -t <ORG_NAME>/scout-demo:v1 .
   ```
@y
   ```console
   $ docker build --push -t <ORG_NAME>/scout-demo:v1 .
   ```
@z

@x
## Step 2: Enable Docker Scout
@y
## Step 2: Enable Docker Scout
@z

@x
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](/scout).
@y
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](/scout).
@z

@x
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
2. Use the Docker CLI [`docker scout repo enable`](/engine/reference/commandline/scout_repo_enable)
   command to enable analysis on an existing repository:
@y
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
2. Use the Docker CLI [`docker scout repo enable`](/engine/reference/commandline/scout_repo_enable)
   command to enable analysis on an existing repository:
@z

@x
   ```console
   $ docker scout repo enable --org <ORG_NAME> <ORG_NAME>/scout-demo
   ```
@y
   ```console
   $ docker scout repo enable --org <ORG_NAME> <ORG_NAME>/scout-demo
   ```
@z

@x
## Step 3: Analyze image vulnerabilities
@y
## Step 3: Analyze image vulnerabilities
@z

@x
After building, use the `docker scout` CLI command to see vulnerabilities
detected by Docker Scout.
@y
After building, use the `docker scout` CLI command to see vulnerabilities
detected by Docker Scout.
@z

@x
The example application for this guide uses a vulnerable version of Express.
The following command shows all CVEs affecting Express in the image you just
built:
@y
The example application for this guide uses a vulnerable version of Express.
The following command shows all CVEs affecting Express in the image you just
built:
@z

@x
```console
$ docker scout cves --only-package express
```
@y
```console
$ docker scout cves --only-package express
```
@z

@x
Docker Scout analyzes the image you built most recently by default,
so there's no need to specify the name of the image in this case.
@y
Docker Scout analyzes the image you built most recently by default,
so there's no need to specify the name of the image in this case.
@z

@x
Learn more about the `docker scout cves` command in the
[`CLI reference documentation`](/engine/reference/commandline/scout_cves).
@y
Learn more about the `docker scout cves` command in the
[`CLI reference documentation`](/engine/reference/commandline/scout_cves).
@z

@x
## Step 4: Fix application vulnerabilities
@y
## Step 4: Fix application vulnerabilities
@z

@x
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@y
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@z

@x
1. Update the `package.json` file with the new package version.
@y
1. Update the `package.json` file with the new package version.
@z

@x
   ```diff
      "dependencies": {
   -    "express": "4.17.1"
   +    "express": "4.17.3"
      }
   ```
@y
   ```diff
      "dependencies": {
   -    "express": "4.17.1"
   +    "express": "4.17.3"
      }
   ```
@z

@x
2. Rebuild the image with a new tag and push it to your Docker Hub repository:
@y
2. Rebuild the image with a new tag and push it to your Docker Hub repository:
@z

@x
   ```console
   $ docker build --push -t <ORG_NAME>/scout-demo:v2 .
   ```
@y
   ```console
   $ docker build --push -t <ORG_NAME>/scout-demo:v2 .
   ```
@z

@x
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@y
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@z

@x
```console
$ docker scout cves --only-package express
    ✓ Provenance obtained from attestation
    ✓ Image stored for indexing
    ✓ Indexed 79 packages
    ✓ No vulnerable package detected
@y
```console
$ docker scout cves --only-package express
    ✓ Provenance obtained from attestation
    ✓ Image stored for indexing
    ✓ Indexed 79 packages
    ✓ No vulnerable package detected
@z

@x
  ## Overview
@y
  ## Overview
@z

@x
                      │                  Analyzed Image                   
  ────────────────────┼───────────────────────────────────────────────────
    Target            │  mobywhale/scout-demo:v2                   
      digest          │  ef68417b2866                                     
      platform        │ linux/arm64                                       
      provenance      │ https://github.com/docker/scout-demo-service.git  
                      │  7c3a06793fc8f97961b4a40c73e0f7ed85501857         
      vulnerabilities │    0C     0H     0M     0L                        
      size            │ 19 MB                                             
      packages        │ 1                                                 
@y
                      │                  Analyzed Image                   
  ────────────────────┼───────────────────────────────────────────────────
    Target            │  mobywhale/scout-demo:v2                   
      digest          │  ef68417b2866                                     
      platform        │ linux/arm64                                       
      provenance      │ https://github.com/docker/scout-demo-service.git  
                      │  7c3a06793fc8f97961b4a40c73e0f7ed85501857         
      vulnerabilities │    0C     0H     0M     0L                        
      size            │ 19 MB                                             
      packages        │ 1                                                 
@z

@x
  ## Packages and Vulnerabilities
@y
  ## Packages and Vulnerabilities
@z

@x
  No vulnerable packages detected
@y
  No vulnerable packages detected
@z

@x
```
@y
```
@z

@x
## Step 5: Evaluate policy compliance
@y
## Step 5: Evaluate policy compliance
@z

@x
While inspecting vulnerabilities based on specific packages can be useful,
it isn't the most effective way to improve your supply chain conduct.
@y
While inspecting vulnerabilities based on specific packages can be useful,
it isn't the most effective way to improve your supply chain conduct.
@z

@x
Docker Scout also supports policy evaluation,
a higher-level concept for detecting and fixing issues in your images.
Policies are a set of customizable rules that lets organizations track whether
images are compliant with their supply chain requirements.
@y
Docker Scout also supports policy evaluation,
a higher-level concept for detecting and fixing issues in your images.
Policies are a set of customizable rules that lets organizations track whether
images are compliant with their supply chain requirements.
@z

@x
Because policy rules are specific to each organization,
you must specify which organization's policy you're evaluating against.
Use the `docker scout config` command to configure your Docker organization.
@y
Because policy rules are specific to each organization,
you must specify which organization's policy you're evaluating against.
Use the `docker scout config` command to configure your Docker organization.
@z

@x
```console
$ docker scout config organization <ORG_NAME>
    ✓ Successfully set organization to <ORG_NAME>
```
@y
```console
$ docker scout config organization <ORG_NAME>
    ✓ Successfully set organization to <ORG_NAME>
```
@z

@x
Now you can run the `quickview` command to get an overview
of the compliance status for the image you just built.
The image is evaluated against the default, out-of-the-box policies.
@y
Now you can run the `quickview` command to get an overview
of the compliance status for the image you just built.
The image is evaluated against the default, out-of-the-box policies.
@z

@x
```console
$ docker scout quickview
@y
```console
$ docker scout quickview
@z

@x
...
Policy status  FAILED  (2/7 policies met, 2 missing data)
@y
...
Policy status  FAILED  (2/7 policies met, 2 missing data)
@z

@x
  Status │                  Policy                   │           Results
─────────┼───────────────────────────────────────────┼──────────────────────────────
  ✓      │ Copyleft licenses                         │    0 packages
  !      │ Critical vulnerabilities                  │    2C     0H     0M     0L
  !      │ Default non-root user                     │
  !      │ Fixable critical and high vulnerabilities │    2C    16H     0M     0L
  ✓      │ High-profile vulnerabilities              │    0C     0H     0M     0L
  ?      │ Outdated base images                      │    No data
  ?      │ Supply chain attestations                 │    No data
```
@y
  Status │                  Policy                   │           Results
─────────┼───────────────────────────────────────────┼──────────────────────────────
  ✓      │ Copyleft licenses                         │    0 packages
  !      │ Critical vulnerabilities                  │    2C     0H     0M     0L
  !      │ Default non-root user                     │
  !      │ Fixable critical and high vulnerabilities │    2C    16H     0M     0L
  ✓      │ High-profile vulnerabilities              │    0C     0H     0M     0L
  ?      │ Outdated base images                      │    No data
  ?      │ Supply chain attestations                 │    No data
```
@z

@x
Exclamation marks in the status column indicate a violated policy.
Question marks indicate that there isn't enough metadata to complete the evaluation.
A check mark indicates compliance.
@y
Exclamation marks in the status column indicate a violated policy.
Question marks indicate that there isn't enough metadata to complete the evaluation.
A check mark indicates compliance.
@z

@x
## Step 6: Improve compliance
@y
## Step 6: Improve compliance
@z

@x
The output of the `quickview` command shows that there's room for improvement.
Some of the policies couldn't evaluate successfully (`No data`)
because the image lacks provenance and SBOM attestations.
The image also failed the check on a few of the evaluations.
@y
The output of the `quickview` command shows that there's room for improvement.
Some of the policies couldn't evaluate successfully (`No data`)
because the image lacks provenance and SBOM attestations.
The image also failed the check on a few of the evaluations.
@z

@x
Policy evaluation does more than just check for vulnerabilities.
Take the `Default non-root user` policy for example.
This policy helps improve runtime security by ensuring that
images aren't set to run as the `root` superuser by default.
@y
Policy evaluation does more than just check for vulnerabilities.
Take the `Default non-root user` policy for example.
This policy helps improve runtime security by ensuring that
images aren't set to run as the `root` superuser by default.
@z

@x
To address this policy violation, edit the Dockerfile by adding a `USER`
instruction, specifying a non-root user:
@y
To address this policy violation, edit the Dockerfile by adding a `USER`
instruction, specifying a non-root user:
@z

@x
```diff
  CMD ["node","/app/app.js"]
  EXPOSE 3000
+ USER appuser
```
@y
```diff
  CMD ["node","/app/app.js"]
  EXPOSE 3000
+ USER appuser
```
@z

@x
Additionally, to get a more complete policy evaluation result,
your image should have SBOM and provenance attestations attached to it.
Docker Scout uses the provenance attestations to determine how the image was
built so that it can provide a better evaluation result.
@y
Additionally, to get a more complete policy evaluation result,
your image should have SBOM and provenance attestations attached to it.
Docker Scout uses the provenance attestations to determine how the image was
built so that it can provide a better evaluation result.
@z

@x
Before you can build an image with attestations,
you must enable the [containerd image store](../desktop/containerd.md)
(or create a custom builder using the `docker-container` driver).
The default image store doesn't support manifest lists,
which is how the provenance attestations are attached to an image.
@y
Before you can build an image with attestations,
you must enable the [containerd image store](../desktop/containerd.md)
(or create a custom builder using the `docker-container` driver).
The default image store doesn't support manifest lists,
which is how the provenance attestations are attached to an image.
@z

@x
Open **Settings** in Docker Desktop. Under the **General** section,
check the **Use containerd for pulling and storing images** option.
Note that changing the image store hides existing images and containers until you switch back.
@y
Open **Settings** in Docker Desktop. Under the **General** section,
check the **Use containerd for pulling and storing images** option.
Note that changing the image store hides existing images and containers until you switch back.
@z

@x
With the containerd image store enabled, rebuild the image with a new `v3` tag.
This time, add the `--provenance=true` and `--sbom=true` flags.
@y
With the containerd image store enabled, rebuild the image with a new `v3` tag.
This time, add the `--provenance=true` and `--sbom=true` flags.
@z

@x
```console
$ docker build --provenance=true --sbom=true --push -t <ORG_NAME>/scout-demo:v3 .
```
@y
```console
$ docker build --provenance=true --sbom=true --push -t <ORG_NAME>/scout-demo:v3 .
```
@z

@x
## Step 7: View in Dashboard
@y
## Step 7: View in Dashboard
@z

@x
After pushing the updated image with attestations, it's time to view the
results through a different lens: the Docker Scout Dashboard.
@y
After pushing the updated image with attestations, it's time to view the
results through a different lens: the Docker Scout Dashboard.
@z

@x
1. Open the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in with your Docker account.
3. Go to the **Images** tab.
@y
1. Open the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in with your Docker account.
3. Go to the **Images** tab.
@z

@x
The images tab lists your Scout-enabled repositories.
Select the image in the list to open the **Image details** sidebar.
The sidebar shows a compliance overview for the last pushed tag of a repository.
@y
The images tab lists your Scout-enabled repositories.
Select the image in the list to open the **Image details** sidebar.
The sidebar shows a compliance overview for the last pushed tag of a repository.
@z

@x
> **Note**
>
> If policy results haven't appeared yet, try refreshing the page.
> It might take a few minutes before the results appear if this is your
> first time using the Docker Scout Dashboard.
@y
> **Note**
>
> If policy results haven't appeared yet, try refreshing the page.
> It might take a few minutes before the results appear if this is your
> first time using the Docker Scout Dashboard.
@z

@x
Inspect the **Outdated base images** policy.
This policy checks whether base images you use are up-to-date.
It currently has a non-compliant status,
because the example image uses an old version `alpine` as a base image.
@y
Inspect the **Outdated base images** policy.
This policy checks whether base images you use are up-to-date.
It currently has a non-compliant status,
because the example image uses an old version `alpine` as a base image.
@z

@x
Select the **View fix** button next to the policy name for details about the violation,
and recommendations on how to address it.
In this case, the recommended action is to enable
[Docker Scout's GitHub integration](./integrations/source-code-management/github.md),
which helps keep your base images up-to-date automatically.
@y
Select the **View fix** button next to the policy name for details about the violation,
and recommendations on how to address it.
In this case, the recommended action is to enable
[Docker Scout's GitHub integration](./integrations/source-code-management/github.md),
which helps keep your base images up-to-date automatically.
@z

@x
> **Tip**
>
> You can't enable this integration for the demo app used in this guide.
> Feel free to push the code to a GitHub repository that you own,
> and try out the integration there!
{ .tip }
@y
> **Tip**
>
> You can't enable this integration for the demo app used in this guide.
> Feel free to push the code to a GitHub repository that you own,
> and try out the integration there!
{ .tip }
@z

@x
## Summary
@y
## Summary
@z

@x
This quickstart guide has scratched the surface on some of the ways
Docker Scout can support software supply chain management:
@y
This quickstart guide has scratched the surface on some of the ways
Docker Scout can support software supply chain management:
@z

@x
- How to enable Docker Scout for your repositories
- Analyzing images for vulnerabilities
- Policy and compliance
- Fixing vulnerabilities and improving compliance
@y
- How to enable Docker Scout for your repositories
- Analyzing images for vulnerabilities
- Policy and compliance
- Fixing vulnerabilities and improving compliance
@z

@x
## What's next?
@y
## What's next?
@z

@x
There's lots more to discover, from third-party integrations,
to policy customization, and runtime environment monitoring in real-time.
@y
There's lots more to discover, from third-party integrations,
to policy customization, and runtime environment monitoring in real-time.
@z

@x
Check out the following sections:
@y
Check out the following sections:
@z

@x
- [Image analysis](./image-analysis.md)
- [Data sources](/scout/advisory-db-sources)
- [Docker Scout Dashboard](/scout/dashboard)
- [Integrations](./integrations/_index.md)
- [Policy evaluation](./policy/_index.md)
@y
- [Image analysis](./image-analysis.md)
- [Data sources](/scout/advisory-db-sources)
- [Docker Scout Dashboard](/scout/dashboard)
- [Integrations](./integrations/_index.md)
- [Policy evaluation](./policy/_index.md)
@z
