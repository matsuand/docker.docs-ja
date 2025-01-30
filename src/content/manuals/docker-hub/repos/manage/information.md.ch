%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to describe and optimize your Docker Hub repositories for better discoverability.
keywords: Docker Hub, Hub, repository information, repository discoverability, best practices
title: Repository information
@y
description: Learn how to describe and optimize your Docker Hub repositories for better discoverability.
keywords: Docker Hub, Hub, repository information, repository discoverability, best practices
title: Repository information
@z

@x
Each repository can include a description, an overview, and categories to help
users understand its purpose and usage. Adding clear repository information
ensures that others can find your images and use them effectively.
@y
Each repository can include a description, an overview, and categories to help
users understand its purpose and usage. Adding clear repository information
ensures that others can find your images and use them effectively.
@z

@x
You can only modify the repository information of repositories that aren't
archived. If a repository is archived, you must unarchive it to modify the
information. For more details, see [Unarchive a repository](../archive.md#unarchive-a-repository).
@y
You can only modify the repository information of repositories that aren't
archived. If a repository is archived, you must unarchive it to modify the
information. For more details, see [Unarchive a repository](../archive.md#unarchive-a-repository).
@z

@x
## Repository description
@y
## Repository description
@z

@x
The description appears in search results when using the `docker search` command
and in the search results on Docker Hub.
@y
The description appears in search results when using the `docker search` command
and in the search results on Docker Hub.
@z

@x
Consider the following repository description best practices.
@y
Consider the following repository description best practices.
@z

@x
- Summarize the purpose. Clearly state what the image does in a concise and
  specific manner. Make it clear if it's for a particular application, tool, or
  platform, or has a distinct use case.
- Highlight key features or benefits. Briefly mention the primary benefits or
  unique features that differentiate the image. Examples include high
  performance, ease of use, lightweight build, or compatibility with specific
  frameworks or operating systems.
- Include relevant keywords. Use keywords that users may search for to increase
  visibility, such as technology stacks, use cases, or environments.
- Keep it concise. The description can be a maximum of 100 characters. Aim to
  stay within one or two sentences for the description to ensure it's easy to
  read in search results. Users should quickly understand the image's value.
- Focus on the audience. Consider your target audience (developers, system
  administrators, etc.) and write the description to address their needs
  directly.
@y
- Summarize the purpose. Clearly state what the image does in a concise and
  specific manner. Make it clear if it's for a particular application, tool, or
  platform, or has a distinct use case.
- Highlight key features or benefits. Briefly mention the primary benefits or
  unique features that differentiate the image. Examples include high
  performance, ease of use, lightweight build, or compatibility with specific
  frameworks or operating systems.
- Include relevant keywords. Use keywords that users may search for to increase
  visibility, such as technology stacks, use cases, or environments.
- Keep it concise. The description can be a maximum of 100 characters. Aim to
  stay within one or two sentences for the description to ensure it's easy to
  read in search results. Users should quickly understand the image's value.
- Focus on the audience. Consider your target audience (developers, system
  administrators, etc.) and write the description to address their needs
  directly.
@z

@x
Following these practices can help make the description more engaging and
effective in search results, driving more relevant traffic to your repository.
@y
Following these practices can help make the description more engaging and
effective in search results, driving more relevant traffic to your repository.
@z

@x
### Add or update a repository description
@y
### Add or update a repository description
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **Repositories**.
@y
2. Select **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the pencil icon under the description field.
@y
4. Select the pencil icon under the description field.
@z

@x
5. Specify a description.
@y
5. Specify a description.
@z

@x
   The description can be up to 100 characters long.
@y
   The description can be up to 100 characters long.
@z

@x
6. Select **Update**.
@y
6. Select **Update**.
@z

@x
## Repository overview
@y
## Repository overview
@z

@x
An overview describes what your image does and how to run it. It displays in the
public view of your repository when the repository has at least one image. If
automated builds are enabled, the overview will be synced from the source code
repository's `README.md` file on each successful build.
@y
An overview describes what your image does and how to run it. It displays in the
public view of your repository when the repository has at least one image. If
automated builds are enabled, the overview will be synced from the source code
repository's `README.md` file on each successful build.
@z

@x
Consider the following repository overview best practices.
@y
Consider the following repository overview best practices.
@z

@x
- Describe what the image is, the features it offers, and why it should be used.
  Can include examples of usage or the team behind the project.
- Explain how to get started with running a container using the image. You can
  include a minimal example of how to use the image in a Dockerfile.
- List the key image variants and tags to use them, as well as use cases for the
  variants.
- Link to documentation or support sites, communities, or mailing lists for
  additional resources.
- Provide contact information for the image maintainers.
- Include the license for the image and where to find more details if needed.
@y
- Describe what the image is, the features it offers, and why it should be used.
  Can include examples of usage or the team behind the project.
- Explain how to get started with running a container using the image. You can
  include a minimal example of how to use the image in a Dockerfile.
- List the key image variants and tags to use them, as well as use cases for the
  variants.
- Link to documentation or support sites, communities, or mailing lists for
  additional resources.
- Provide contact information for the image maintainers.
- Include the license for the image and where to find more details if needed.
@z

@x
### Add or update a repository overview
@y
### Add or update a repository overview
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **Repositories**.
@y
2. Select **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Under **Repository overview**, select **Edit** or **Add overview**.
@y
4. Under **Repository overview**, select **Edit** or **Add overview**.
@z

@x
   The **Write** and **Preview** tabs appear.
@y
   The **Write** and **Preview** tabs appear.
@z

@x
5. Under **Write**, specify your repository overview.
@y
5. Under **Write**, specify your repository overview.
@z

@x
   You can use basic Markdown and use the **Preview** tab to preview the formatting.
@y
   You can use basic Markdown and use the **Preview** tab to preview the formatting.
@z

@x
6. Select **Update**.
@y
6. Select **Update**.
@z

@x
## Repository categories
@y
## Repository categories
@z

@x
You can tag Docker Hub repositories with categories, representing the primary
intended use cases for your images. This lets users more easily find and
explore content for the problem domain that they're interested in.
@y
You can tag Docker Hub repositories with categories, representing the primary
intended use cases for your images. This lets users more easily find and
explore content for the problem domain that they're interested in.
@z

@x
### Available categories
@y
### Available categories
@z

@x
The Docker Hub content team maintains a curated list of categories.
@y
The Docker Hub content team maintains a curated list of categories.
@z

@x
{{% include "hub-categories.md" %}}
@y
{{% include "hub-categories.md" %}}
@z

@x
### Auto-generated categories
@y
### Auto-generated categories
@z

@x
> [!NOTE]
>
> Auto-generated categories only apply to Docker Verified Publishers and
> Docker-Sponsored Open Source program participants.
@y
> [!NOTE]
>
> Auto-generated categories only apply to Docker Verified Publishers and
> Docker-Sponsored Open Source program participants.
@z

@x
For repositories that pre-date the Categories feature in Docker Hub,
categories have been automatically generated and applied, using OpenAI, based
on the repository title and description.
@y
For repositories that pre-date the Categories feature in Docker Hub,
categories have been automatically generated and applied, using OpenAI, based
on the repository title and description.
@z

@x
As an owner of a repository that has been auto-categorized, you can manually
edit the categories if you think they're inaccurate. See [Manage categories for
a repository](#manage-categories-for-a-repository).
@y
As an owner of a repository that has been auto-categorized, you can manually
edit the categories if you think they're inaccurate. See [Manage categories for
a repository](#manage-categories-for-a-repository).
@z

@x
The auto-generated categorization was a one-time effort to help seed categories
onto repositories created before the feature existed. Categories are not
assigned to new repositories automatically.
@y
The auto-generated categorization was a one-time effort to help seed categories
onto repositories created before the feature existed. Categories are not
assigned to new repositories automatically.
@z

@x
### Manage categories for a repository
@y
### Manage categories for a repository
@z

@x
You can tag a repository with up to three categories.
@y
You can tag a repository with up to three categories.
@z

@x
To edit the categories of a repository:
@y
To edit the categories of a repository:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the pencil icon under the description field.
5. Select the categories you want to apply.
6. Select **Update**.
@y
4. Select the pencil icon under the description field.
5. Select the categories you want to apply.
6. Select **Update**.
@z

@x
If you're missing a category, use the
[Give feedback link](https://docker.qualtrics.com/jfe/form/SV_03CrMyAkCWVylKu)
to let us know what categories you'd like to see.
@y
If you're missing a category, use the
[Give feedback link](https://docker.qualtrics.com/jfe/form/SV_03CrMyAkCWVylKu)
to let us know what categories you'd like to see.
@z
