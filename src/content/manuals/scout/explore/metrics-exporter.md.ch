%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Scout metrics exporter
description: |
  Learn how to scrape data from Docker Scout using Prometheus to create your own
  vulnerability and policy dashboards wiht Grafana
keywords: scout, exporter, prometheus, grafana, metrics, dashboard, api, compose
@y
title: Docker Scout metrics exporter
description: |
  Learn how to scrape data from Docker Scout using Prometheus to create your own
  vulnerability and policy dashboards wiht Grafana
keywords: scout, exporter, prometheus, grafana, metrics, dashboard, api, compose
@z

@x
Docker Scout exposes a metrics HTTP endpoint that lets you scrape vulnerability
and policy data from Docker Scout, using Prometheus or Datadog. With this you
can create your own, self-hosted Docker Scout dashboards for visualizing supply
chain metrics.
@y
Docker Scout exposes a metrics HTTP endpoint that lets you scrape vulnerability
and policy data from Docker Scout, using Prometheus or Datadog. With this you
can create your own, self-hosted Docker Scout dashboards for visualizing supply
chain metrics.
@z

@x
## Metrics
@y
## Metrics
@z

@x
The metrics endpoint exposes the following metrics:
@y
The metrics endpoint exposes the following metrics:
@z

@x
| Metric                          | Description                                         | Labels                            | Type  |
| ------------------------------- | --------------------------------------------------- | --------------------------------- | ----- |
| `scout_stream_vulnerabilities`  | Vulnerabilities in a stream                         | `streamName`, `severity`          | Gauge |
| `scout_policy_compliant_images` | Compliant images for a policy in a stream           | `id`, `displayName`, `streamName` | Gauge |
| `scout_policy_evaluated_images` | Total images evaluated against a policy in a stream | `id`, `displayName`, `streamName` | Gauge |
@y
| Metric                          | Description                                         | Labels                            | Type  |
| ------------------------------- | --------------------------------------------------- | --------------------------------- | ----- |
| `scout_stream_vulnerabilities`  | Vulnerabilities in a stream                         | `streamName`, `severity`          | Gauge |
| `scout_policy_compliant_images` | Compliant images for a policy in a stream           | `id`, `displayName`, `streamName` | Gauge |
| `scout_policy_evaluated_images` | Total images evaluated against a policy in a stream | `id`, `displayName`, `streamName` | Gauge |
@z

@x
> **Streams**
>
> In Docker Scout, the streams concept is a superset of [environments](/manuals/scout/integrations/environment/_index.md).
> Streams include all runtime environments that you've defined,
> as well as the special `latest-indexed` stream.
> The `latest-indexed` stream contains the most recently pushed (and analyzed) tag for each repository.
>
> Streams is mostly an internal concept in Docker Scout,
> with the exception of the data exposed through this metrics endpoint.
{ #stream }
@y
> **Streams**
>
> In Docker Scout, the streams concept is a superset of [environments](manuals/scout/integrations/environment/_index.md).
> Streams include all runtime environments that you've defined,
> as well as the special `latest-indexed` stream.
> The `latest-indexed` stream contains the most recently pushed (and analyzed) tag for each repository.
>
> Streams is mostly an internal concept in Docker Scout,
> with the exception of the data exposed through this metrics endpoint.
{ #stream }
@z

@x
## Creating an access token
@y
## Creating an access token
@z

@x
To export metrics from your organization, first make sure your organization is enrolled in Docker Scout.
Then, create a Personal Access Token (PAT) - a secret token that allows the exporter to authenticate with the Docker Scout API.
@y
To export metrics from your organization, first make sure your organization is enrolled in Docker Scout.
Then, create a Personal Access Token (PAT) - a secret token that allows the exporter to authenticate with the Docker Scout API.
@z

@x
The PAT does not require any specific permissions, but it must be created by a user who is an owner of the Docker organization.
To create a PAT, follow the steps in [Create an access token](/security/for-developers/access-tokens/#create-an-access-token).
@y
The PAT does not require any specific permissions, but it must be created by a user who is an owner of the Docker organization.
To create a PAT, follow the steps in [Create an access token](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token).
@z

@x
Once you have created the PAT, store it in a secure location.
You will need to provide this token to the exporter when scraping metrics.
@y
Once you have created the PAT, store it in a secure location.
You will need to provide this token to the exporter when scraping metrics.
@z

@x
## Prometheus
@y
## Prometheus
@z

@x
This section describes how to scrape the metrics endpoint using Prometheus.
@y
This section describes how to scrape the metrics endpoint using Prometheus.
@z

@x
### Add a job for your organization
@y
### Add a job for your organization
@z

@x
In the Prometheus configuration file, add a new job for your organization.
The job should include the following configuration;
replace `ORG` with your organization name:
@y
In the Prometheus configuration file, add a new job for your organization.
The job should include the following configuration;
replace `ORG` with your organization name:
@z

@x
```yaml
scrape_configs:
  - job_name: <ORG>
    metrics_path: /v1/exporter/org/<ORG>/metrics
    scheme: https
    static_configs:
      - targets:
          - api.scout.docker.com
```
@y
```yaml
scrape_configs:
  - job_name: <ORG>
    metrics_path: /v1/exporter/org/<ORG>/metrics
    scheme: https
    static_configs:
      - targets:
          - api.scout.docker.com
```
@z

@x
The address in the `targets` field is set to the domain name of the Docker Scout API, `api.scout.docker.com`.
Make sure that there's no firewall rule in place preventing the server from communicating with this endpoint.
@y
The address in the `targets` field is set to the domain name of the Docker Scout API, `api.scout.docker.com`.
Make sure that there's no firewall rule in place preventing the server from communicating with this endpoint.
@z

@x
### Add bearer token authentication
@y
### Add bearer token authentication
@z

@x
To scrape metrics from the Docker Scout Exporter endpoint using Prometheus, you need to configure Prometheus to use the PAT as a bearer token.
The exporter requires the PAT to be passed in the `Authorization` header of the request.
@y
To scrape metrics from the Docker Scout Exporter endpoint using Prometheus, you need to configure Prometheus to use the PAT as a bearer token.
The exporter requires the PAT to be passed in the `Authorization` header of the request.
@z

@x
Update the Prometheus configuration file to include the `authorization` configuration block.
This block defines the PAT as a bearer token stored in a file:
@y
Update the Prometheus configuration file to include the `authorization` configuration block.
This block defines the PAT as a bearer token stored in a file:
@z

@x
```yaml
scrape_configs:
  - job_name: $ORG
    authorization:
      type: Bearer
      credentials_file: /etc/prometheus/token
```
@y
```yaml
scrape_configs:
  - job_name: $ORG
    authorization:
      type: Bearer
      credentials_file: /etc/prometheus/token
```
@z

@x
The content of the file should be the PAT in plain text:
@y
The content of the file should be the PAT in plain text:
@z

@x
```console
dckr_pat_...
```
@y
```console
dckr_pat_...
```
@z

@x
If you are running Prometheus in a Docker container or Kubernetes pod, mount the file into the container using a volume or secret.
@y
If you are running Prometheus in a Docker container or Kubernetes pod, mount the file into the container using a volume or secret.
@z

@x
Finally, restart Prometheus to apply the changes.
@y
Finally, restart Prometheus to apply the changes.
@z

@x
### Prometheus sample project
@y
### Prometheus sample project
@z

@x
If you don't have a Prometheus server set up, you can run a [sample project](https://github.com/dockersamples/scout-metrics-exporter) using Docker Compose.
The sample includes a Prometheus server that scrapes metrics for a Docker organization enrolled in Docker Scout,
alongside Grafana with a pre-configured dashboard to visualize the vulnerability and policy metrics.
@y
If you don't have a Prometheus server set up, you can run a [sample project](https://github.com/dockersamples/scout-metrics-exporter) using Docker Compose.
The sample includes a Prometheus server that scrapes metrics for a Docker organization enrolled in Docker Scout,
alongside Grafana with a pre-configured dashboard to visualize the vulnerability and policy metrics.
@z

@x
1. Clone the starter template for bootstrapping a set of Compose services
   for scraping and visualizing the Docker Scout metrics endpoint:
@y
1. Clone the starter template for bootstrapping a set of Compose services
   for scraping and visualizing the Docker Scout metrics endpoint:
@z

@x
   ```console
   $ git clone git@github.com:dockersamples/scout-metrics-exporter.git
   $ cd scout-metrics-exporter/prometheus
   ```
@y
   ```console
   $ git clone git@github.com:dockersamples/scout-metrics-exporter.git
   $ cd scout-metrics-exporter/prometheus
   ```
@z

@x
2. [Create a Docker access token](/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `/prometheus/prometheus/token` under the template directory.
@y
2. [Create a Docker access token](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `/prometheus/prometheus/token` under the template directory.
@z

@x
   ```plaintext {title=token}
   $ echo $DOCKER_PAT > ./prometheus/token
   ```
@y
   ```plaintext {title=token}
   $ echo $DOCKER_PAT > ./prometheus/token
   ```
@z

@x
3. In the Prometheus configuration file at `/prometheus/prometheus/prometheus.yml`,
   replace `ORG` in the `metrics_path` property on line 6 with the namespace of your Docker organization.
@y
3. In the Prometheus configuration file at `/prometheus/prometheus/prometheus.yml`,
   replace `ORG` in the `metrics_path` property on line 6 with the namespace of your Docker organization.
@z

@x
   ```yaml {title="prometheus/prometheus.yml",hl_lines="6",linenos=1}
   global:
     scrape_interval: 60s
     scrape_timeout: 40s
   scrape_configs:
     - job_name: Docker Scout policy
       metrics_path: /v1/exporter/org/<ORG>/metrics
       scheme: https
       static_configs:
         - targets:
             - api.scout.docker.com
       authorization:
         type: Bearer
         credentials_file: /etc/prometheus/token
   ```
@y
   ```yaml {title="prometheus/prometheus.yml",hl_lines="6",linenos=1}
   global:
     scrape_interval: 60s
     scrape_timeout: 40s
   scrape_configs:
     - job_name: Docker Scout policy
       metrics_path: /v1/exporter/org/<ORG>/metrics
       scheme: https
       static_configs:
         - targets:
             - api.scout.docker.com
       authorization:
         type: Bearer
         credentials_file: /etc/prometheus/token
   ```
@z

@x
4. Start the compose services.
@y
4. Start the compose services.
@z

@x
   ```console
   docker compose up -d
   ```
@y
   ```console
   docker compose up -d
   ```
@z

@x
   This command starts two services: the Prometheus server and Grafana.
   Prometheus scrapes metrics from the Docker Scout endpoint,
   and Grafana visualizes the metrics using a pre-configured dashboard.
@y
   This command starts two services: the Prometheus server and Grafana.
   Prometheus scrapes metrics from the Docker Scout endpoint,
   and Grafana visualizes the metrics using a pre-configured dashboard.
@z

@x
To stop the demo and clean up any resources created, run:
@y
To stop the demo and clean up any resources created, run:
@z

@x
```console
docker compose down -v
```
@y
```console
docker compose down -v
```
@z

@x
### Access to Prometheus
@y
### Access to Prometheus
@z

@x
After starting the services, you can access the Prometheus expression browser by visiting <http://localhost:9090>.
The Prometheus server runs in a Docker container and is accessible on port 9090.
@y
After starting the services, you can access the Prometheus expression browser by visiting <http://localhost:9090>.
The Prometheus server runs in a Docker container and is accessible on port 9090.
@z

@x
After a few seconds, you should see the metrics endpoint as a target in the
Prometheus UI at <http://localhost:9090/targets>.
@y
After a few seconds, you should see the metrics endpoint as a target in the
Prometheus UI at <http://localhost:9090/targets>.
@z

@x
![Docker Scout metrics exporter Prometheus target](../images/scout-metrics-prom-target.png "Docker Scout metrics exporter Prometheus target")
@y
![Docker Scout metrics exporter Prometheus target](../images/scout-metrics-prom-target.png "Docker Scout metrics exporter Prometheus target")
@z

@x
### Viewing the metrics in Grafana
@y
### Viewing the metrics in Grafana
@z

@x
To view the Grafana dashboards, go to <http://localhost:3000/dashboards>,
and sign in using the credentials defined in the Docker Compose file (username: `admin`, password: `grafana`).
@y
To view the Grafana dashboards, go to <http://localhost:3000/dashboards>,
and sign in using the credentials defined in the Docker Compose file (username: `admin`, password: `grafana`).
@z

@x
![Vulnerability dashboard in Grafana](../images/scout-metrics-grafana-vulns.png "Vulnerability dashboard in Grafana")
@y
![Vulnerability dashboard in Grafana](../images/scout-metrics-grafana-vulns.png "Vulnerability dashboard in Grafana")
@z

@x
![Policy dashboard in Grafana](../images/scout-metrics-grafana-policy.png "Policy dashboard in Grafana")
@y
![Policy dashboard in Grafana](../images/scout-metrics-grafana-policy.png "Policy dashboard in Grafana")
@z

@x
The dashboards are pre-configured to visualize the vulnerability and policy metrics scraped by Prometheus.
@y
The dashboards are pre-configured to visualize the vulnerability and policy metrics scraped by Prometheus.
@z

@x
## Datadog
@y
## Datadog
@z

@x
This section describes how to scrape the metrics endpoint using Datadog.
Datadog pulls data for monitoring by running a customizable
[agent](https://docs.datadoghq.com/agent/?tab=Linux) that scrapes available
endpoints for any exposed metrics. The OpenMetrics and Prometheus checks are
included in the agent, so you don’t need to install anything else on your
containers or hosts.
@y
This section describes how to scrape the metrics endpoint using Datadog.
Datadog pulls data for monitoring by running a customizable
[agent](https://docs.datadoghq.com/agent/?tab=Linux) that scrapes available
endpoints for any exposed metrics. The OpenMetrics and Prometheus checks are
included in the agent, so you don’t need to install anything else on your
containers or hosts.
@z

@x
This guide assumes you have a Datadog account and a Datadog API Key. Refer to
the [Datadog documentation](https://docs.datadoghq.com/agent) to get started.
@y
This guide assumes you have a Datadog account and a Datadog API Key. Refer to
the [Datadog documentation](https://docs.datadoghq.com/agent) to get started.
@z

@x
### Configure the Datadog agent
@y
### Configure the Datadog agent
@z

@x
To start collecting the metrics, you will need to edit the agent’s
configuration file for the OpenMetrics check. If you're running the agent as a
container, such file must be mounted at
`/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml`.
@y
To start collecting the metrics, you will need to edit the agent’s
configuration file for the OpenMetrics check. If you're running the agent as a
container, such file must be mounted at
`/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml`.
@z

@x
The following example shows a Datadog configuration that:
@y
The following example shows a Datadog configuration that:
@z

@x
- Specifies the OpenMetrics endpoint targeting the `dockerscoutpolicy` Docker organization
- A `namespace` that all collected metrics will be prefixed with
- The [`metrics`](#metrics) you want the agent to scrape (`scout_*`)
- An `auth_token` section for the Datadog agent to authenticate to the Metrics
  endpoint, using a Docker PAT as a Bearer token.
@y
- Specifies the OpenMetrics endpoint targeting the `dockerscoutpolicy` Docker organization
- A `namespace` that all collected metrics will be prefixed with
- The [`metrics`](#metrics) you want the agent to scrape (`scout_*`)
- An `auth_token` section for the Datadog agent to authenticate to the Metrics
  endpoint, using a Docker PAT as a Bearer token.
@z

@x
```yaml
instances:
  - openmetrics_endpoint: "https://api.scout.docker.com/v1/exporter/org/dockerscoutpolicy/metrics"
    namespace: "scout-metrics-exporter"
    metrics:
      - scout_*
    auth_token:
      reader:
        type: file
        path: /var/run/secrets/scout-metrics-exporter/token
      writer:
        type: header
        name: Authorization
        value: Bearer <TOKEN>
```
@y
```yaml
instances:
  - openmetrics_endpoint: "https://api.scout.docker.com/v1/exporter/org/dockerscoutpolicy/metrics"
    namespace: "scout-metrics-exporter"
    metrics:
      - scout_*
    auth_token:
      reader:
        type: file
        path: /var/run/secrets/scout-metrics-exporter/token
      writer:
        type: header
        name: Authorization
        value: Bearer <TOKEN>
```
@z

@x
> [!IMPORTANT]
>
> Do not replace the `<TOKEN>` placeholder in the previous configuration
> example. It must stay as it is. Only make sure the Docker PAT is correctly
> mounted into the Datadog agent in the specified filesystem path. Save the
> file as `conf.yaml` and restart the agent.
@y
> [!IMPORTANT]
>
> Do not replace the `<TOKEN>` placeholder in the previous configuration
> example. It must stay as it is. Only make sure the Docker PAT is correctly
> mounted into the Datadog agent in the specified filesystem path. Save the
> file as `conf.yaml` and restart the agent.
@z

@x
When creating a Datadog agent configuration of your own, make sure to edit the
`openmetrics_endpoint` property to target your organization, by replacing
`dockerscoutpolicy` with the namespace of your Docker organization.
@y
When creating a Datadog agent configuration of your own, make sure to edit the
`openmetrics_endpoint` property to target your organization, by replacing
`dockerscoutpolicy` with the namespace of your Docker organization.
@z

@x
### Datadog sample project
@y
### Datadog sample project
@z

@x
If you don't have a Datadog server set up, you can run a [sample project](https://github.com/dockersamples/scout-metrics-exporter)
using Docker Compose. The sample includes a Datadog agent, running as a
container, that scrapes metrics for a Docker organization enrolled in Docker
Scout. This sample project assumes that you have a Datadog account, an API key,
and a Datadog site.
@y
If you don't have a Datadog server set up, you can run a [sample project](https://github.com/dockersamples/scout-metrics-exporter)
using Docker Compose. The sample includes a Datadog agent, running as a
container, that scrapes metrics for a Docker organization enrolled in Docker
Scout. This sample project assumes that you have a Datadog account, an API key,
and a Datadog site.
@z

@x
1. Clone the starter template for bootstrapping a Datadog Compose service for
   scraping the Docker Scout metrics endpoint:
@y
1. Clone the starter template for bootstrapping a Datadog Compose service for
   scraping the Docker Scout metrics endpoint:
@z

@x
   ```console
   $ git clone git@github.com:dockersamples/scout-metrics-exporter.git
   $ cd scout-metrics-exporter/datadog
   ```
@y
   ```console
   $ git clone git@github.com:dockersamples/scout-metrics-exporter.git
   $ cd scout-metrics-exporter/datadog
   ```
@z

@x
2. [Create a Docker access token](/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `/datadog/token` under the template directory.
@y
2. [Create a Docker access token](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `/datadog/token` under the template directory.
@z

@x
   ```plaintext {title=token}
   $ echo $DOCKER_PAT > ./token
   ```
@y
   ```plaintext {title=token}
   $ echo $DOCKER_PAT > ./token
   ```
@z

@x
3. In the `/datadog/compose.yaml` file, update the `DD_API_KEY` and `DD_SITE` environment variables
   with the values for your Datadog deployment.
@y
3. In the `/datadog/compose.yaml` file, update the `DD_API_KEY` and `DD_SITE` environment variables
   with the values for your Datadog deployment.
@z

@x
   ```yaml {hl_lines="5-6"}
     datadog-agent:
       container_name: datadog-agent
       image: gcr.io/datadoghq/agent:7
       environment:
         - DD_API_KEY=${DD_API_KEY} # e.g. 1b6b3a42...
         - DD_SITE=${DD_SITE} # e.g. datadoghq.com
         - DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
       volumes:
         - /var/run/docker.sock:/var/run/docker.sock:ro
         - ./conf.yaml:/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml:ro
         - ./token:/var/run/secrets/scout-metrics-exporter/token:ro
   ```
@y
   ```yaml {hl_lines="5-6"}
     datadog-agent:
       container_name: datadog-agent
       image: gcr.io/datadoghq/agent:7
       environment:
         - DD_API_KEY=${DD_API_KEY} # e.g. 1b6b3a42...
         - DD_SITE=${DD_SITE} # e.g. datadoghq.com
         - DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
       volumes:
         - /var/run/docker.sock:/var/run/docker.sock:ro
         - ./conf.yaml:/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml:ro
         - ./token:/var/run/secrets/scout-metrics-exporter/token:ro
   ```
@z

@x
   The `volumes` section mounts the Docker socket from the host to the
   container. This is required to obtain an accurate hostname when running as a
   container ([more details here](https://docs.datadoghq.com/agent/troubleshooting/hostname_containers/)).
@y
   The `volumes` section mounts the Docker socket from the host to the
   container. This is required to obtain an accurate hostname when running as a
   container ([more details here](https://docs.datadoghq.com/agent/troubleshooting/hostname_containers/)).
@z

@x
   It also mounts the agent's config file and the Docker access token.
@y
   It also mounts the agent's config file and the Docker access token.
@z

@x
4. Edit the `/datadog/config.yaml` file by replacing the placeholder `<ORG>` in
   the `openmetrics_endpoint` property with the namespace of the Docker
   organization that you want to collect metrics for.
@y
4. Edit the `/datadog/config.yaml` file by replacing the placeholder `<ORG>` in
   the `openmetrics_endpoint` property with the namespace of the Docker
   organization that you want to collect metrics for.
@z

@x
   ```yaml {hl_lines=2}
   instances:
     - openmetrics_endpoint: "https://api.scout.docker.com/v1/exporter/org/<<ORG>>/metrics"
       namespace: "scout-metrics-exporter"
   # ...
   ```
@y
   ```yaml {hl_lines=2}
   instances:
     - openmetrics_endpoint: "https://api.scout.docker.com/v1/exporter/org/<<ORG>>/metrics"
       namespace: "scout-metrics-exporter"
   # ...
   ```
@z

@x
5. Start the Compose services.
@y
5. Start the Compose services.
@z

@x
   ```console
   docker compose up -d
   ```
@y
   ```console
   docker compose up -d
   ```
@z

@x
If configured properly, you should see the OpenMetrics check under Running
Checks when you run the agent’s status command whose output should look similar
to:
@y
If configured properly, you should see the OpenMetrics check under Running
Checks when you run the agent’s status command whose output should look similar
to:
@z

@x
```text
openmetrics (4.2.0)
-------------------
  Instance ID: openmetrics:scout-prometheus-exporter:6393910f4d92f7c2 [OK]
  Configuration Source: file:/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml
  Total Runs: 1
  Metric Samples: Last Run: 236, Total: 236
  Events: Last Run: 0, Total: 0
  Service Checks: Last Run: 1, Total: 1
  Average Execution Time : 2.537s
  Last Execution Date : 2024-05-08 10:41:07 UTC (1715164867000)
  Last Successful Execution Date : 2024-05-08 10:41:07 UTC (1715164867000)
```
@y
```text
openmetrics (4.2.0)
-------------------
  Instance ID: openmetrics:scout-prometheus-exporter:6393910f4d92f7c2 [OK]
  Configuration Source: file:/etc/datadog-agent/conf.d/openmetrics.d/conf.yaml
  Total Runs: 1
  Metric Samples: Last Run: 236, Total: 236
  Events: Last Run: 0, Total: 0
  Service Checks: Last Run: 1, Total: 1
  Average Execution Time : 2.537s
  Last Execution Date : 2024-05-08 10:41:07 UTC (1715164867000)
  Last Successful Execution Date : 2024-05-08 10:41:07 UTC (1715164867000)
```
@z

@x
For a comprehensive list of options, take a look at this [example config file](https://github.com/DataDog/integrations-core/blob/master/openmetrics/datadog_checks/openmetrics/data/conf.yaml.example) for the generic OpenMetrics check.
@y
For a comprehensive list of options, take a look at this [example config file](https://github.com/DataDog/integrations-core/blob/master/openmetrics/datadog_checks/openmetrics/data/conf.yaml.example) for the generic OpenMetrics check.
@z

@x
### Visualizing your data
@y
### Visualizing your data
@z

@x
Once the agent is configured to grab Prometheus metrics, you can use them to build comprehensive Datadog graphs, dashboards, and alerts.
@y
Once the agent is configured to grab Prometheus metrics, you can use them to build comprehensive Datadog graphs, dashboards, and alerts.
@z

@x
Go into your [Metric summary page](https://app.datadoghq.com/metric/summary?filter=scout_prometheus_exporter)
to see the metrics collected from this example. This configuration will collect
all exposed metrics starting with `scout_` under the namespace
`scout_metrics_exporter`.
@y
Go into your [Metric summary page](https://app.datadoghq.com/metric/summary?filter=scout_prometheus_exporter)
to see the metrics collected from this example. This configuration will collect
all exposed metrics starting with `scout_` under the namespace
`scout_metrics_exporter`.
@z

@x
![datadog_metrics_summary](../images/datadog_metrics_summary.png)
@y
![datadog_metrics_summary](../images/datadog_metrics_summary.png)
@z

@x
The following screenshots show examples of a Datadog dashboard containing
graphs about vulnerability and policy compliance for a specific [stream](#stream).
@y
The following screenshots show examples of a Datadog dashboard containing
graphs about vulnerability and policy compliance for a specific [stream](#stream).
@z

@x
![datadog_dashboard_1](../images/datadog_dashboard_1.png)
![datadog_dashboard_2](../images/datadog_dashboard_2.png)
@y
![datadog_dashboard_1](../images/datadog_dashboard_1.png)
![datadog_dashboard_2](../images/datadog_dashboard_2.png)
@z

@x
> The reason why the lines in the graphs look flat is due to the own nature of
> vulnerabilities (they don't change too often) and the short time interval
> selected in the date picker.
@y
> The reason why the lines in the graphs look flat is due to the own nature of
> vulnerabilities (they don't change too often) and the short time interval
> selected in the date picker.
@z

@x
## Scrape interval
@y
## Scrape interval
@z

@x
By default, Prometheus and Datadog scrape metrics at a 15 second interval.
Because of the own nature of vulnerability data, the metrics exposed through this API are unlikely to change at a high frequency.
For this reason, the metrics endpoint has a 60-minute cache by default,
which means a scraping interval of 60 minutes or higher is recommended.
If you set the scrape interval to less than 60 minutes, you will see the same data in the metrics for multiple scrapes during that time window.
@y
By default, Prometheus and Datadog scrape metrics at a 15 second interval.
Because of the own nature of vulnerability data, the metrics exposed through this API are unlikely to change at a high frequency.
For this reason, the metrics endpoint has a 60-minute cache by default,
which means a scraping interval of 60 minutes or higher is recommended.
If you set the scrape interval to less than 60 minutes, you will see the same data in the metrics for multiple scrapes during that time window.
@z

@x
To change the scrape interval:
@y
To change the scrape interval:
@z

@x
- Prometheus: set the `scrape_interval` field in the Prometheus configuration
  file at the global or job level.
- Datadog: set the `min_collection_interval` property in the Datadog agent
  configuration file, see [Datadog documentation](https://docs.datadoghq.com/developers/custom_checks/write_agent_check/#updating-the-collection-interval).
@y
- Prometheus: set the `scrape_interval` field in the Prometheus configuration
  file at the global or job level.
- Datadog: set the `min_collection_interval` property in the Datadog agent
  configuration file, see [Datadog documentation](https://docs.datadoghq.com/developers/custom_checks/write_agent_check/#updating-the-collection-interval).
@z

@x
## Revoke an access token
@y
## Revoke an access token
@z

@x
If you suspect that your PAT has been compromised or is no longer needed, you can revoke it at any time.
To revoke a PAT, follow the steps in the [Create and manage access tokens](/security/for-developers/access-tokens/#modify-existing-tokens).
@y
If you suspect that your PAT has been compromised or is no longer needed, you can revoke it at any time.
To revoke a PAT, follow the steps in the [Create and manage access tokens](__SUBDIR__/security/for-developers/access-tokens/#modify-existing-tokens).
@z

@x
Revoking a PAT immediately invalidates the token, and prevents Prometheus from scraping metrics using that token.
You will need to create a new PAT and update the Prometheus configuration to use the new token.
@y
Revoking a PAT immediately invalidates the token, and prevents Prometheus from scraping metrics using that token.
You will need to create a new PAT and update the Prometheus configuration to use the new token.
@z
