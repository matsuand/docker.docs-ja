%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Integrate Docker Scout with Sysdig
linkTitle: Sysdig
description: Integrate your runtime environments with Docker Scout using Sysdig
keywords: scout, sysdig, integration, image analysis, environments, supply chain
@y
title: Integrate Docker Scout with Sysdig
linkTitle: Sysdig
description: Integrate your runtime environments with Docker Scout using Sysdig
keywords: scout, sysdig, integration, image analysis, environments, supply chain
@z

@x
{{< include "scout-early-access.md" >}}
@y
{{< include "scout-early-access.md" >}}
@z

@x
The Sysdig integration enables Docker Scout to automatically detect the images
you're using for your running workloads. Activating this integration gives you
real-time insights about your security posture, and lets you compare your
builds with what's running in production.
@y
The Sysdig integration enables Docker Scout to automatically detect the images
you're using for your running workloads. Activating this integration gives you
real-time insights about your security posture, and lets you compare your
builds with what's running in production.
@z

@x
## How it works
@y
## How it works
@z

@x
The Sysdig Agent captures the images of your container workloads. Docker Scout
integrates with the Sysdig API to discover the images in your cluster. This
integration uses Sysdig's Risk Spotlight feature. For more information, see
[Risk Spotlight Integrations (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/integrations-for-sysdig-secure/risk-spotlight-integrations/).
@y
The Sysdig Agent captures the images of your container workloads. Docker Scout
integrates with the Sysdig API to discover the images in your cluster. This
integration uses Sysdig's Risk Spotlight feature. For more information, see
[Risk Spotlight Integrations (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/integrations-for-sysdig-secure/risk-spotlight-integrations/).
@z

@x
> [!TIP]
>
> Sysdig offers a free trial for Docker users to try out the new Docker Scout integration.
>
> {{< button url=`https://sysdig.com/free-trial-for-docker-customers/` text="Sign up" >}}
@y
> [!TIP]
>
> Sysdig offers a free trial for Docker users to try out the new Docker Scout integration.
>
> {{< button url=`https://sysdig.com/free-trial-for-docker-customers/` text="Sign up" >}}
@z

@x
Each Sysdig integration maps to an environment. When you enable a Sysdig
integration, you specify the environment name for that cluster, such as
`production` or `staging`. Docker Scout assigns the images in the cluster to
the corresponding environment. This lets you use the environment filters to see
vulnerability status and policy compliance for an environment.
@y
Each Sysdig integration maps to an environment. When you enable a Sysdig
integration, you specify the environment name for that cluster, such as
`production` or `staging`. Docker Scout assigns the images in the cluster to
the corresponding environment. This lets you use the environment filters to see
vulnerability status and policy compliance for an environment.
@z

@x
Only images analyzed by Docker Scout can be assigned to an environment. The
Sysdig runtime integration doesn't trigger image analysis by itself. To analyze
images automatically, enable a [registry integration](../_index.md#container-registries).
@y
Only images analyzed by Docker Scout can be assigned to an environment. The
Sysdig runtime integration doesn't trigger image analysis by itself. To analyze
images automatically, enable a [registry integration](../_index.md#container-registries).
@z

@x
Image analysis must not necessarily precede the runtime integration, but the
environment assignment only takes place once Docker Scout has analyzed the
image.
@y
Image analysis must not necessarily precede the runtime integration, but the
environment assignment only takes place once Docker Scout has analyzed the
image.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Install the Sysdig Agent in the cluster that you want to integrate, see [Install Sysdig Agent (Sysdig docs)](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/).
- Enable profiling for Risk Spotlight Integrations in Sysdig, see [Profiling (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/policies/profiling/#enablement).
- You must be an organization owner to enable the integration in the Docker Scout Dashboard.
@y
- Install the Sysdig Agent in the cluster that you want to integrate, see [Install Sysdig Agent (Sysdig docs)](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/).
- Enable profiling for Risk Spotlight Integrations in Sysdig, see [Profiling (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/policies/profiling/#enablement).
- You must be an organization owner to enable the integration in the Docker Scout Dashboard.
@z

@x
## Integrate an environment
@y
## Integrate an environment
@z

@x
1. Go to the [Sysdig integration page](https://scout.docker.com/settings/integrations/sysdig/)
   on the Docker Scout Dashboard.
2. In the **How to integrate** section, enter a configuration name for this
   integration. Docker Scout uses this label as a display name for the
   integration.
@y
1. Go to the [Sysdig integration page](https://scout.docker.com/settings/integrations/sysdig/)
   on the Docker Scout Dashboard.
2. In the **How to integrate** section, enter a configuration name for this
   integration. Docker Scout uses this label as a display name for the
   integration.
@z

@x
3. Select **Next**.
@y
3. Select **Next**.
@z

@x
4. Enter a Risk Spotlight API token and select the region in the drop-down list.
@y
4. Enter a Risk Spotlight API token and select the region in the drop-down list.
@z

@x
   The Risk Spotlight API token is the Sysdig token that Docker Scout needs to
   integrate with Sysdig. For more instructions on how to generate a Risk
   Spotlight token, See [Risk Spotlight Integrations (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/integrations-for-sysdig-secure/risk-spotlight-integrations/docker-scout/#generate-a-token-for-the-integration).
@y
   The Risk Spotlight API token is the Sysdig token that Docker Scout needs to
   integrate with Sysdig. For more instructions on how to generate a Risk
   Spotlight token, See [Risk Spotlight Integrations (Sysdig docs)](https://docs.sysdig.com/en/docs/sysdig-secure/integrations-for-sysdig-secure/risk-spotlight-integrations/docker-scout/#generate-a-token-for-the-integration).
@z

@x
   The region corresponds to the `global.sysdig.region` configuration parameter
   set when deploying the Sysdig Agent.
@y
   The region corresponds to the `global.sysdig.region` configuration parameter
   set when deploying the Sysdig Agent.
@z

@x
5. Select **Next**.
@y
5. Select **Next**.
@z

@x
   After selecting **Next**, Docker Scout connects to Sysdig and retrieves the
   cluster names for your Sysdig account. Cluster names correspond to the
   `global.clusterConfig.name` configuration parameter set when deploying
   Sysdig Agents.
@y
   After selecting **Next**, Docker Scout connects to Sysdig and retrieves the
   cluster names for your Sysdig account. Cluster names correspond to the
   `global.clusterConfig.name` configuration parameter set when deploying
   Sysdig Agents.
@z

@x
   An error displays if Docker Scout fails to connect to Sysdig using the
   provided token. If there's an error, you won't be able to continue the
   integration. Go back and verify that the configuration details are correct.
@y
   An error displays if Docker Scout fails to connect to Sysdig using the
   provided token. If there's an error, you won't be able to continue the
   integration. Go back and verify that the configuration details are correct.
@z

@x
6. Select a cluster name in the drop-down list.
@y
6. Select a cluster name in the drop-down list.
@z

@x
7. Select **Next**.
@y
7. Select **Next**.
@z

@x
8. Assign an environment name for this cluster.
@y
8. Assign an environment name for this cluster.
@z

@x
    You can reuse an existing environment or create a new one.
@y
    You can reuse an existing environment or create a new one.
@z

@x
9. Select **Enable integration**.
@y
9. Select **Enable integration**.
@z

@x
After enabling the integration, Docker Scout automatically detects images
running in the cluster, and assigns those images to the environment associated
with the cluster. For more information about environments, see [Environment
monitoring](./_index.md).
@y
After enabling the integration, Docker Scout automatically detects images
running in the cluster, and assigns those images to the environment associated
with the cluster. For more information about environments, see [Environment
monitoring](./_index.md).
@z

@x
> [!NOTE]
>
> Docker Scout only detects images that have been analyzed. To trigger an image
> analysis, enable a [registry integration](../_index.md#container-registries)
> and push an image to your registry.
>
> If you created a new environment for this integration, the environment
> appears in Docker Scout when at least one image has been analyzed.
@y
> [!NOTE]
>
> Docker Scout only detects images that have been analyzed. To trigger an image
> analysis, enable a [registry integration](../_index.md#container-registries)
> and push an image to your registry.
>
> If you created a new environment for this integration, the environment
> appears in Docker Scout when at least one image has been analyzed.
@z

@x
To integrate more clusters, go to the [Sysdig integrations page](https://scout.docker.com/settings/integrations/sysdig/)
and select the **Add** button.
@y
To integrate more clusters, go to the [Sysdig integrations page](https://scout.docker.com/settings/integrations/sysdig/)
and select the **Add** button.
@z
