%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Publish your extension to the marketplace
description: Docker extension distribution
keywords: Docker, extensions, publish
---
@y
---
title: Publish your extension to the marketplace
description: Docker extension distribution
keywords: Docker, extensions, publish
---
@z

@x
## Submit your extension to the marketplace
@y
## Submit your extension to the marketplace
@z

@x
Docker Desktop displays published extensions in the Extensions Marketplace on [Docker Desktop](https://open.docker.com/extensions/marketplace) and [Docker Hub](https://hub.docker.com/search?q=&type=extension).
The Extensions Marketplace is a curated space where developers can discover extensions to improve their developer experience and propose their own extension to be available for all Desktop users.
@y
Docker Desktop displays published extensions in the Extensions Marketplace on [Docker Desktop](https://open.docker.com/extensions/marketplace) and [Docker Hub](https://hub.docker.com/search?q=&type=extension).
The Extensions Marketplace is a curated space where developers can discover extensions to improve their developer experience and propose their own extension to be available for all Desktop users.
@z

@x
Whenever you are [ready to publish](./DISTRIBUTION.md) your extension in the Marketplace, you have two publishing options:
@y
Whenever you are [ready to publish](./DISTRIBUTION.md) your extension in the Marketplace, you have two publishing options:
@z

@x
[Self-publish your extension](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
[Request that Docker reviews your extension](https://www.docker.com/products/extensions/submissions/)
@y
[Self-publish your extension](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
[Request that Docker reviews your extension](https://www.docker.com/products/extensions/submissions/)
@z

@x
> **Note**
>
> As the Extension Marketplace continues to add new features for both Extension users and publishers, we expect you
> to maintain your extension over time to ensure it stays available in the Marketplace.
@y
> **Note**
>
> As the Extension Marketplace continues to add new features for both Extension users and publishers, we expect you
> to maintain your extension over time to ensure it stays available in the Marketplace.
@z

@x
### Before you submit
@y
### Before you submit
@z

@x
Before you submit your extension, it must pass the [validation](validate.md) checks.
@y
Before you submit your extension, it must pass the [validation](validate.md) checks.
@z

@x
It is highly recommended that your extension follows the guidelines outlined in this section before submitting your
extension. If you request a review from the Docker Extensions team and have not followed the guidelines above, the review process may take longer. 
@y
It is highly recommended that your extension follows the guidelines outlined in this section before submitting your
extension. If you request a review from the Docker Extensions team and have not followed the guidelines above, the review process may take longer. 
@z

@x
These guidelines don't replace Docker's terms of service or guarantee approval:
- Review the [design guidelines](../design/design-guidelines.md)
- Ensure the [UI styling](../design/index.md) is in line with Docker Desktop guidelines
- Ensure your extensions support both light and dark mode
- Consider the needs of both new and existing users of your extension
- Test your extension with potential users
- Test your extension for crashes, bugs, and performance issues
- Test your extension on various platforms (Mac, Windows, Linux)
- Read the [Terms of Service](https://www.docker.com/legal/extensions_marketplace_developer_agreement/)
@y
These guidelines don't replace Docker's terms of service or guarantee approval:
- Review the [design guidelines](../design/design-guidelines.md)
- Ensure the [UI styling](../design/index.md) is in line with Docker Desktop guidelines
- Ensure your extensions support both light and dark mode
- Consider the needs of both new and existing users of your extension
- Test your extension with potential users
- Test your extension for crashes, bugs, and performance issues
- Test your extension on various platforms (Mac, Windows, Linux)
- Read the [Terms of Service](https://www.docker.com/legal/extensions_marketplace_developer_agreement/)
@z

@x
### Which publishing option to choose
@y
### Which publishing option to choose
@z

@x
When submitting an extension to the extensions submissions [repository](https://github.com/docker/extensions-submissions/issues/new/choose), you have two publishing options. Publish as either:
- A Self-published extension
- A Docker-reviewed extension
@y
When submitting an extension to the extensions submissions [repository](https://github.com/docker/extensions-submissions/issues/new/choose), you have two publishing options. Publish as either:
- A Self-published extension
- A Docker-reviewed extension
@z

@x
Depending on which option you select, the publishing process will differ.
@y
Depending on which option you select, the publishing process will differ.
@z

@x
#### Process for Self-published extensions
@y
#### Process for Self-published extensions
@z

@x
Self-published extensions are automatically validated. If all the validation checks pass successfully, it is
published on the Marketplace and accessible to all users within a few hours.
It is the fastest way to get developers the tools they need and to get feedback from them as you work to
evolve/polish your extension. You can request a review from the Docker Extensions team at any time.
@y
Self-published extensions are automatically validated. If all the validation checks pass successfully, it is
published on the Marketplace and accessible to all users within a few hours.
It is the fastest way to get developers the tools they need and to get feedback from them as you work to
evolve/polish your extension. You can request a review from the Docker Extensions team at any time.
@z

@x
> **Important**
>
> Docker Desktop caches the list of extensions available in the Marketplace for 12 hours. If you don't see your
> extension in the Marketplace, you can restart Docker Desktop to force the cache to be refreshed.
{ .important }
@y
> **Important**
>
> Docker Desktop caches the list of extensions available in the Marketplace for 12 hours. If you don't see your
> extension in the Marketplace, you can restart Docker Desktop to force the cache to be refreshed.
{ .important }
@z

@x
#### Process for Docker-reviewed extensions
@y
#### Process for Docker-reviewed extensions
@z

@x
Docker-reviewed extensions are manually reviewed by the Docker Extensions team. This process ensures a level of trust
and quality for developers using Docker Extensions and allows extension developers to get feedback.
@y
Docker-reviewed extensions are manually reviewed by the Docker Extensions team. This process ensures a level of trust
and quality for developers using Docker Extensions and allows extension developers to get feedback.
@z

@x
Although we strive to have your submission approved as soon as possible, bear in mind this is a manual process to
ensure extensions meet high standards. If your extension is complex, if it doesn't follow the guidelines, or if you
didn't complete the submission form properly, it may take longer to review your extension.
@y
Although we strive to have your submission approved as soon as possible, bear in mind this is a manual process to
ensure extensions meet high standards. If your extension is complex, if it doesn't follow the guidelines, or if you
didn't complete the submission form properly, it may take longer to review your extension.
@z

@x
Once the extension is reviewed, we will do our best to provide adequate and actionable feedback for you so that you can
improve it. If your extension has been rejected, you can communicate directly with us.
@y
Once the extension is reviewed, we will do our best to provide adequate and actionable feedback for you so that you can
improve it. If your extension has been rejected, you can communicate directly with us.
@z

@x
The review process also offers some advantages for extension developers of reviewed and approved extensions:
- The extension appears as **Reviewed** in the Marketplace
- The extension is added to our monthly "Docker Extensions Roundup" blog post
- The same blog post is featured in our monthly newsletter
- The extension is promoted on our social media channels
- You receive weekly reports on your extension's performance
@y
The review process also offers some advantages for extension developers of reviewed and approved extensions:
- The extension appears as **Reviewed** in the Marketplace
- The extension is added to our monthly "Docker Extensions Roundup" blog post
- The same blog post is featured in our monthly newsletter
- The extension is promoted on our social media channels
- You receive weekly reports on your extension's performance
@z

@x
> **Note**
>
> If it doesn't meet the approval requirements for a reviewed extension, you can still publish it without a review,
> and get your extension in the hands of developers. However, you will not benefit from
> the advantages listed above.
@y
> **Note**
>
> If it doesn't meet the approval requirements for a reviewed extension, you can still publish it without a review,
> and get your extension in the hands of developers. However, you will not benefit from
> the advantages listed above.
@z
