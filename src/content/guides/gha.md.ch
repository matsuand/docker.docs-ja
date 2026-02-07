%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Introduction to GitHub Actions with Docker
linkTitle: GitHub Actions and Docker
summary: |
  Learn how to automate image build and push with GitHub Actions.
@y
title: Introduction to GitHub Actions with Docker
linkTitle: GitHub Actions and Docker
summary: |
  Learn how to automate image build and push with GitHub Actions.
@z

%params:
@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
This guide provides an introduction to building CI pipelines using Docker and
GitHub Actions. You will learn how to use Docker's official GitHub Actions to
build your application as a Docker image and push it to Docker Hub. By the end
of the guide, you'll have a simple, functional GitHub Actions configuration for
Docker builds. Use it as-is, or extend it further to fit your needs.
@y
This guide provides an introduction to building CI pipelines using Docker and
GitHub Actions. You will learn how to use Docker's official GitHub Actions to
build your application as a Docker image and push it to Docker Hub. By the end
of the guide, you'll have a simple, functional GitHub Actions configuration for
Docker builds. Use it as-is, or extend it further to fit your needs.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
If you want to follow along with the guide, ensure you have the following:
@y
If you want to follow along with the guide, ensure you have the following:
@z

@x
- A verified Docker account.
- Familiarity with Dockerfiles.
@y
- A verified Docker account.
- Familiarity with Dockerfiles.
@z

@x
This guide assumes basic knowledge of Docker concepts but provides explanations
for using Docker in GitHub Actions workflows.
@y
This guide assumes basic knowledge of Docker concepts but provides explanations
for using Docker in GitHub Actions workflows.
@z

@x
## Get the sample app
@y
## Get the sample app
@z

@x
This guide is project-agnostic and assumes you have an application with a
Dockerfile.
@y
This guide is project-agnostic and assumes you have an application with a
Dockerfile.
@z

@x
If you need a sample project to follow along, you can use [this sample
application](https://github.com/dvdksn/rpg-name-generator.git), which includes
a Dockerfile for building a containerized version of the app. Alternatively,
use your own GitHub project or create a new repository from the template.
@y
If you need a sample project to follow along, you can use [this sample
application](https://github.com/dvdksn/rpg-name-generator.git), which includes
a Dockerfile for building a containerized version of the app. Alternatively,
use your own GitHub project or create a new repository from the template.
@z

@x
{{% dockerfile.inline %}}
@y
{{% dockerfile.inline %}}
@z

@x
{{ $data := resources.GetRemote "https://raw.githubusercontent.com/dvdksn/rpg-name-generator/refs/heads/main/Dockerfile" }}
@y
{{ $data := resources.GetRemote "https://raw.githubusercontent.com/dvdksn/rpg-name-generator/refs/heads/main/Dockerfile" }}
@z

% snip code...

@x
{{% /dockerfile.inline %}}
@y
{{% /dockerfile.inline %}}
@z

@x
## Configure your GitHub repository
@y
## Configure your GitHub repository
@z

@x
The workflow in this guide pushes the image you build to Docker Hub. To do
that, you must authenticate with your Docker credentials (username and access
token) as part of the GitHub Actions workflow.
@y
The workflow in this guide pushes the image you build to Docker Hub. To do
that, you must authenticate with your Docker credentials (username and access
token) as part of the GitHub Actions workflow.
@z

@x
For instructions on how to create a Docker access token, see
[Create and manage access tokens](/manuals/security/access-tokens.md).
@y
For instructions on how to create a Docker access token, see
[Create and manage access tokens](manuals/security/access-tokens.md).
@z

@x
Once you have your Docker credentials ready, add the credentials to your GitHub
repository so you can use them in GitHub Actions:
@y
Once you have your Docker credentials ready, add the credentials to your GitHub
repository so you can use them in GitHub Actions:
@z

@x
1. Open your repository's **Settings**.
2. Under **Security**, go to **Secrets and variables > Actions**.
3. Under **Secrets**, create a new repository secret named `DOCKER_PASSWORD`,
   containing your Docker access token.
4. Next, under **Variables**, create a `DOCKER_USERNAME` repository variable
   containing your Docker Hub username.
@y
1. Open your repository's **Settings**.
2. Under **Security**, go to **Secrets and variables > Actions**.
3. Under **Secrets**, create a new repository secret named `DOCKER_PASSWORD`,
   containing your Docker access token.
4. Next, under **Variables**, create a `DOCKER_USERNAME` repository variable
   containing your Docker Hub username.
@z

@x
## Set up your GitHub Actions workflow
@y
## Set up your GitHub Actions workflow
@z

@x
GitHub Actions workflows define a series of steps to automate tasks, such as
building and pushing Docker images, in response to triggers like commits or
pull requests. In this guide, the workflow focuses on automating Docker builds
and testing, ensuring your containerized application works correctly before
publishing it.
@y
GitHub Actions workflows define a series of steps to automate tasks, such as
building and pushing Docker images, in response to triggers like commits or
pull requests. In this guide, the workflow focuses on automating Docker builds
and testing, ensuring your containerized application works correctly before
publishing it.
@z

@x
Create a file named `docker-ci.yml` in the `.github/workflows/` directory of
your repository. Start with the basic workflow configuration:
@y
Create a file named `docker-ci.yml` in the `.github/workflows/` directory of
your repository. Start with the basic workflow configuration:
@z

% snip code...

@x
This configuration runs the workflow on pushes to the main branch and on pull
requests. By including both triggers, you can ensure that the image builds
correctly for a pull request before it's merged.
@y
This configuration runs the workflow on pushes to the main branch and on pull
requests. By including both triggers, you can ensure that the image builds
correctly for a pull request before it's merged.
@z

@x
## Extract metadata for tags and annotations
@y
## Extract metadata for tags and annotations
@z

@x
For the first step in your workflow, use the `docker/metadata-action` to
generate metadata for your image. This action extracts information about your
Git repository, such as branch names and commit SHAs, and generates image
metadata such as tags and annotations.
@y
For the first step in your workflow, use the `docker/metadata-action` to
generate metadata for your image. This action extracts information about your
Git repository, such as branch names and commit SHAs, and generates image
metadata such as tags and annotations.
@z

@x
Add the following YAML to your workflow file:
@y
Add the following YAML to your workflow file:
@z

% snip code...

@x
These steps prepare metadata to tag and annotate your images during the build
and push process.
@y
These steps prepare metadata to tag and annotate your images during the build
and push process.
@z

@x
- The **Checkout** step clones the Git repository.
- The **Extract Docker image metadata** step extracts Git metadata and
  generates image tags and annotations for the Docker build.
@y
- The **Checkout** step clones the Git repository.
- The **Extract Docker image metadata** step extracts Git metadata and
  generates image tags and annotations for the Docker build.
@z

@x
## Authenticate to your registry
@y
## Authenticate to your registry
@z

@x
Before you build the image, authenticate to your registry to ensure that you
can push your built image to the registry.
@y
Before you build the image, authenticate to your registry to ensure that you
can push your built image to the registry.
@z

@x
To authenticate with Docker Hub, add the following step to your workflow:
@y
To authenticate with Docker Hub, add the following step to your workflow:
@z

% snip code...

@x
This step uses the Docker credentials [configured in the repository settings](#configure-your-github-repository).
@y
This step uses the Docker credentials [configured in the repository settings](#configure-your-github-repository).
@z

@x
## Build and push the image
@y
## Build and push the image
@z

@x
Finally, build the final production image and push it to your registry. The
following configuration builds the image and pushes it directly to a registry.
@y
Finally, build the final production image and push it to your registry. The
following configuration builds the image and pushes it directly to a registry.
@z

% snip code...

@x
In this configuration:
@y
In this configuration:
@z

@x
- `push: ${{ github.event_name != 'pull_request' }}` ensures that images are
  only pushed when the event is not a pull request. This way, the workflow
  builds and tests images for pull requests but only pushes images for commits
  to the main branch.
- `tags` and `annotations` use the outputs from the metadata action to apply
  consistent tags and [annotations](/manuals/build/metadata/annotations.md) to
  the image automatically.
@y
- `push: ${{ github.event_name != 'pull_request' }}` ensures that images are
  only pushed when the event is not a pull request. This way, the workflow
  builds and tests images for pull requests but only pushes images for commits
  to the main branch.
- `tags` and `annotations` use the outputs from the metadata action to apply
  consistent tags and [annotations](manuals/build/metadata/annotations.md) to
  the image automatically.
@z

@x
## Attestations
@y
## Attestations
@z

@x
SBOM (Software Bill of Materials) and provenance attestations improve security
and traceability, ensuring your images meet modern software supply chain
requirements.
@y
SBOM (Software Bill of Materials) and provenance attestations improve security
and traceability, ensuring your images meet modern software supply chain
requirements.
@z

@x
With a small amount of additional configuration, you can configure
`docker/build-push-action` to generate Software Bill of Materials (SBOM) and
provenance attestations for the image, at build-time.
@y
With a small amount of additional configuration, you can configure
`docker/build-push-action` to generate Software Bill of Materials (SBOM) and
provenance attestations for the image, at build-time.
@z

@x
To generate this additional metadata, you need to make two changes to your
workflow:
@y
To generate this additional metadata, you need to make two changes to your
workflow:
@z

@x
- Before the build step, add a step that uses `docker/setup-buildx-action`.
  This action configures your Docker build client with additional capabilities
  that the default client doesn't support.
- Then, update the **Build and push Docker image** step to also enable SBOM and
  provenance attestations.
@y
- Before the build step, add a step that uses `docker/setup-buildx-action`.
  This action configures your Docker build client with additional capabilities
  that the default client doesn't support.
- Then, update the **Build and push Docker image** step to also enable SBOM and
  provenance attestations.
@z

@x
Here's the updated snippet:
@y
Here's the updated snippet:
@z

% snip code...

@x
For more details about attestations, refer to
[the documentation](/manuals/build/metadata/attestations/_index.md).
@y
For more details about attestations, refer to
[the documentation](manuals/build/metadata/attestations/_index.md).
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
With all the steps outlined in the previous section, here's the full workflow
configuration:
@y
With all the steps outlined in the previous section, here's the full workflow
configuration:
@z

% snip code...

@x
This workflow implements best practices for building and pushing Docker images
using GitHub Actions. This configuration can be used as-is or extended with
additional features based on your project's needs, such as
[multi-platform](/manuals/build/building/multi-platform.md).
@y
This workflow implements best practices for building and pushing Docker images
using GitHub Actions. This configuration can be used as-is or extended with
additional features based on your project's needs, such as
[multi-platform](manuals/build/building/multi-platform.md).
@z

@x
### Further reading
@y
### Further reading
@z

@x
- Learn more about advanced configurations and examples in the [Docker Build GitHub Actions](/manuals/build/ci/github-actions/_index.md) section.
- For more complex build setups, you may want to consider [Bake](/manuals/build/bake/_index.md). (See also the [Mastering Buildx Bake guide](/guides/bake/index.md).)
- Learn about Docker's managed build service, designed for faster, multi-platform builds, see [Docker Build Cloud](/guides/docker-build-cloud/_index.md).
@y
- Learn more about advanced configurations and examples in the [Docker Build GitHub Actions](manuals/build/ci/github-actions/_index.md) section.
- For more complex build setups, you may want to consider [Bake](manuals/build/bake/_index.md). (See also the [Mastering Buildx Bake guide](guides/bake/index.md).)
- Learn about Docker's managed build service, designed for faster, multi-platform builds, see [Docker Build Cloud](guides/docker-build-cloud/_index.md).
@z
