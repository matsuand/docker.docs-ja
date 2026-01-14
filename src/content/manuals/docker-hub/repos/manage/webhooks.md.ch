%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Docker Hub Webhooks
keywords: Docker, webhooks, hub, builds
title: Webhooks
@y
description: Docker Hub Webhooks
keywords: Docker, webhooks, hub, builds
title: Webhooks
@z

@x
You can use webhooks to cause an action in another service in response to a push event in the repository. Webhooks are POST requests sent to a URL you define in Docker Hub.
@y
You can use webhooks to cause an action in another service in response to a push event in the repository. Webhooks are POST requests sent to a URL you define in Docker Hub.
@z

@x
## Create a webhook
@y
## Create a webhook
@z

@x
To create a webhook:
1. In your chosen repository, select the **Webhooks** tab.
2. Provide a name for the webhook.
3. Provide a destination webhook URL. This is where webhook POST requests are delivered.
4. Select **Create**.
@y
To create a webhook:
1. In your chosen repository, select the **Webhooks** tab.
2. Provide a name for the webhook.
3. Provide a destination webhook URL. This is where webhook POST requests are delivered.
4. Select **Create**.
@z

@x
## View webhook delivery history
@y
## View webhook delivery history
@z

@x
To view the history of the webhook:
1. Hover over your webhook under the **Current Webhooks section**.
2. Select the **Menu options** icon.
3. Select **View History**.
@y
To view the history of the webhook:
1. Hover over your webhook under the **Current Webhooks section**.
2. Select the **Menu options** icon.
3. Select **View History**.
@z

@x
You can then view the delivery history, and whether delivering the POST request was successful or not.
@y
You can then view the delivery history, and whether delivering the POST request was successful or not.
@z

@x
## Example webhook payload
@y
## Example webhook payload
@z

@x
Webhook payloads have the following JSON format:
@y
Webhook payloads have the following JSON format:
@z

% snip code...

@x
> [!NOTE]
>
> The `callback_url` field is a legacy field and is no longer supported.
@y
> [!NOTE]
>
> The `callback_url` field is a legacy field and is no longer supported.
@z
