%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Publish in the Marketplace
description: Docker extension distribution
keywords: Docker, extensions, publish
@y
title: Publish in the Marketplace
description: Docker extension distribution
keywords: Docker, extensions, publish
@z

@x
## Submit your extension to the Marketplace
@y
## Submit your extension to the Marketplace
@z

@x
Docker Desktop displays published extensions in the Extensions Marketplace on [Docker Desktop](https://open.docker.com/extensions/marketplace) and [Docker Hub](https://hub.docker.com/search?q=&type=extension).
The Extensions Marketplace is a space where developers can discover extensions to improve their developer experience and propose their own extension to be available for all Desktop users.
@y
Docker Desktop displays published extensions in the Extensions Marketplace on [Docker Desktop](https://open.docker.com/extensions/marketplace) and [Docker Hub](https://hub.docker.com/search?q=&type=extension).
The Extensions Marketplace is a space where developers can discover extensions to improve their developer experience and propose their own extension to be available for all Desktop users.
@z

@x
Whenever you are [ready to publish](DISTRIBUTION.md) your extension in the Marketplace, you can [self-publish your extension](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
@y
Whenever you are [ready to publish](DISTRIBUTION.md) your extension in the Marketplace, you can [self-publish your extension](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
@z

@x
> [!NOTE]
>
> As the Extension Marketplace continues to add new features for both Extension users and publishers, you are expected
> to maintain your extension over time to ensure it stays available in the Marketplace.
@y
> [!NOTE]
>
> As the Extension Marketplace continues to add new features for both Extension users and publishers, you are expected
> to maintain your extension over time to ensure it stays available in the Marketplace.
@z

@x
> [!IMPORTANT]
>
> The Docker manual review process for extensions is paused at the moment. Submit your extension through the [automated submission process](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
@y
> [!IMPORTANT]
>
> The Docker manual review process for extensions is paused at the moment. Submit your extension through the [automated submission process](https://github.com/docker/extensions-submissions/issues/new?assignees=&labels=&template=1_automatic_review.yaml&title=%5BSubmission%5D%3A+)
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
extension. If you request a review from the Docker Extensions team and have not followed the guidelines, the review process may take longer. 
@y
It is highly recommended that your extension follows the guidelines outlined in this section before submitting your
extension. If you request a review from the Docker Extensions team and have not followed the guidelines, the review process may take longer. 
@z

@x
These guidelines don't replace Docker's terms of service or guarantee approval:
- Review the [design guidelines](../design/design-guidelines.md)
- Ensure the [UI styling](../design/_index.md) is in line with Docker Desktop guidelines
- Ensure your extensions support both light and dark mode
- Consider the needs of both new and existing users of your extension
- Test your extension with potential users
- Test your extension for crashes, bugs, and performance issues
- Test your extension on various platforms (Mac, Windows, Linux)
- Read the [Terms of Service](https://www.docker.com/legal/extensions_marketplace_developer_agreement/)
@y
These guidelines don't replace Docker's terms of service or guarantee approval:
- Review the [design guidelines](../design/design-guidelines.md)
- Ensure the [UI styling](../design/_index.md) is in line with Docker Desktop guidelines
- Ensure your extensions support both light and dark mode
- Consider the needs of both new and existing users of your extension
- Test your extension with potential users
- Test your extension for crashes, bugs, and performance issues
- Test your extension on various platforms (Mac, Windows, Linux)
- Read the [Terms of Service](https://www.docker.com/legal/extensions_marketplace_developer_agreement/)
@z

@x
#### Validation process
@y
#### Validation process
@z

@x
Submitted extensions go through an automated validation process. If all the validation checks pass successfully, the extension is
published on the Marketplace and accessible to all users within a few hours.
It is the fastest way to get developers the tools they need and to get feedback from them as you work to
evolve/polish your extension.
@y
Submitted extensions go through an automated validation process. If all the validation checks pass successfully, the extension is
published on the Marketplace and accessible to all users within a few hours.
It is the fastest way to get developers the tools they need and to get feedback from them as you work to
evolve/polish your extension.
@z

@x
> [!IMPORTANT]
>
> Docker Desktop caches the list of extensions available in the Marketplace for 12 hours. If you don't see your
> extension in the Marketplace, you can restart Docker Desktop to force the cache to refresh.
@y
> [!IMPORTANT]
>
> Docker Desktop caches the list of extensions available in the Marketplace for 12 hours. If you don't see your
> extension in the Marketplace, you can restart Docker Desktop to force the cache to refresh.
@z
