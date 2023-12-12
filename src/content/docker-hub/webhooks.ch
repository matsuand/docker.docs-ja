%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub Webhooks
keywords: Docker, webhooks, hub, builds
title: Webhooks
---
@y
---
description: Docker Hub Webhooks
keywords: Docker, webhooks, hub, builds
title: Webhooks
---
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

@x
```json
{
  "callback_url": "https://registry.hub.docker.com/u/svendowideit/testhook/hook/2141b5bi5i5b02bec211i4eeih0242eg11000a/",
  "push_data": {
    "pushed_at": 1417566161,
    "pusher": "trustedbuilder",
    "tag": "latest"
  },
  "repository": {
    "comment_count": 0,
    "date_created": 1417494799,
    "description": "",
    "dockerfile": "#\n# BUILD\u0009\u0009docker build -t svendowideit/apt-cacher .\n# RUN\u0009\u0009docker run -d -p 3142:3142 -name apt-cacher-run apt-cacher\n#\n# and then you can run containers with:\n# \u0009\u0009docker run -t -i -rm -e http_proxy http://192.168.1.2:3142/ debian bash\n#\nFROM\u0009\u0009ubuntu\n\n\nVOLUME\u0009\u0009[/var/cache/apt-cacher-ng]\nRUN\u0009\u0009apt-get update ; apt-get install -yq apt-cacher-ng\n\nEXPOSE \u0009\u00093142\nCMD\u0009\u0009chmod 777 /var/cache/apt-cacher-ng ; /etc/init.d/apt-cacher-ng start ; tail -f /var/log/apt-cacher-ng/*\n",
    "full_description": "Docker Hub based automated build from a GitHub repo",
    "is_official": false,
    "is_private": true,
    "is_trusted": true,
    "name": "testhook",
    "namespace": "svendowideit",
    "owner": "svendowideit",
    "repo_name": "svendowideit/testhook",
    "repo_url": "https://registry.hub.docker.com/u/svendowideit/testhook/",
    "star_count": 0,
    "status": "Active"
  }
}
```
@y
```json
{
  "callback_url": "https://registry.hub.docker.com/u/svendowideit/testhook/hook/2141b5bi5i5b02bec211i4eeih0242eg11000a/",
  "push_data": {
    "pushed_at": 1417566161,
    "pusher": "trustedbuilder",
    "tag": "latest"
  },
  "repository": {
    "comment_count": 0,
    "date_created": 1417494799,
    "description": "",
    "dockerfile": "#\n# BUILD\u0009\u0009docker build -t svendowideit/apt-cacher .\n# RUN\u0009\u0009docker run -d -p 3142:3142 -name apt-cacher-run apt-cacher\n#\n# and then you can run containers with:\n# \u0009\u0009docker run -t -i -rm -e http_proxy http://192.168.1.2:3142/ debian bash\n#\nFROM\u0009\u0009ubuntu\n\n\nVOLUME\u0009\u0009[/var/cache/apt-cacher-ng]\nRUN\u0009\u0009apt-get update ; apt-get install -yq apt-cacher-ng\n\nEXPOSE \u0009\u00093142\nCMD\u0009\u0009chmod 777 /var/cache/apt-cacher-ng ; /etc/init.d/apt-cacher-ng start ; tail -f /var/log/apt-cacher-ng/*\n",
    "full_description": "Docker Hub based automated build from a GitHub repo",
    "is_official": false,
    "is_private": true,
    "is_trusted": true,
    "name": "testhook",
    "namespace": "svendowideit",
    "owner": "svendowideit",
    "repo_name": "svendowideit/testhook",
    "repo_url": "https://registry.hub.docker.com/u/svendowideit/testhook/",
    "star_count": 0,
    "status": "Active"
  }
}
```
@z

@x
## Validate a webhook callback
@y
## Validate a webhook callback
@z

@x
To validate a callback in a webhook chain, you need to:
@y
To validate a callback in a webhook chain, you need to:
@z

@x
1. Retrieve the `callback_url` value in the request's JSON payload.
2. Send a POST request to this URL containing a valid JSON body.
@y
1. Retrieve the `callback_url` value in the request's JSON payload.
2. Send a POST request to this URL containing a valid JSON body.
@z

@x
> **Note**
>
> A chain request is only considered complete once the last callback is validated.
@y
> **Note**
>
> A chain request is only considered complete once the last callback is validated.
@z

@x
### Callback JSON data
@y
### Callback JSON data
@z

@x
The following parameters are recognized in callback data:
@y
The following parameters are recognized in callback data:
@z

@x
* `state` (required): Accepted values are `success`, `failure`, and `error`.
  If the state isn't `success`, the webhook chain is interrupted.
* `description`: A string containing miscellaneous information that is
  available on Docker Hub. Maximum 255 characters.
* `context`: A string containing the context of the operation. Can be retrieved
  from the Docker Hub. Maximum 100 characters.
* `target_url`: The URL where the results of the operation can be found. Can be
  retrieved on the Docker Hub.
@y
* `state` (required): Accepted values are `success`, `failure`, and `error`.
  If the state isn't `success`, the webhook chain is interrupted.
* `description`: A string containing miscellaneous information that is
  available on Docker Hub. Maximum 255 characters.
* `context`: A string containing the context of the operation. Can be retrieved
  from the Docker Hub. Maximum 100 characters.
* `target_url`: The URL where the results of the operation can be found. Can be
  retrieved on the Docker Hub.
@z

@x
The following is an example of a callback payload:
@y
The following is an example of a callback payload:
@z

@x
    {
      "state": "success",
      "description": "387 tests PASSED",
      "context": "Continuous integration by Acme CI",
      "target_url": "https://ci.acme.com/results/afd339c1c3d27"
    }
@y
    {
      "state": "success",
      "description": "387 tests PASSED",
      "context": "Continuous integration by Acme CI",
      "target_url": "https://ci.acme.com/results/afd339c1c3d27"
    }
@z
