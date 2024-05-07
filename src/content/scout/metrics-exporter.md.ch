%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
and policy data from Docker Scout, using Prometheus. With this you can create
your own, self-hosted Docker Scout dashboards for visualizing supply chain
metrics.
@y
Docker Scout exposes a metrics HTTP endpoint that lets you scrape vulnerability
and policy data from Docker Scout, using Prometheus. With this you can create
your own, self-hosted Docker Scout dashboards for visualizing supply chain
metrics.
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
> In Docker Scout, the streams concept is a superset of [environments](./integrations/environment/_index.md).
> Streams include all runtime environments that you've defined,
> as well as the special `latest-indexed` stream.
> The `latest-indexed` stream contains the most recently pushed (and analyzed) tag for each repository.
>
> Streams is mostly an internal concept in Docker Scout,
> with the exception of the data exposed through this metrics endpoint.
{ .tip }
@y
> **Streams**
>
> In Docker Scout, the streams concept is a superset of [environments](./integrations/environment/_index.md).
> Streams include all runtime environments that you've defined,
> as well as the special `latest-indexed` stream.
> The `latest-indexed` stream contains the most recently pushed (and analyzed) tag for each repository.
>
> Streams is mostly an internal concept in Docker Scout,
> with the exception of the data exposed through this metrics endpoint.
{ .tip }
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
## Configure Prometheus
@y
## Configure Prometheus
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
    metrics_path: /v1/exporter/org/<ORG>
    scheme: https
    static_configs:
      - targets:
          - api.scout.docker.com
```
@y
```yaml
scrape_configs:
  - job_name: <ORG>
    metrics_path: /v1/exporter/org/<ORG>
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
### Scrape interval
@y
### Scrape interval
@z

@x
By default, Prometheus scrapes the metrics every 15 seconds.
You can change the scrape interval by setting the `scrape_interval` field in the Prometheus configuration file at the global or job level.
A scraping interval of 60 minutes or higher is recommended.
@y
By default, Prometheus scrapes the metrics every 15 seconds.
You can change the scrape interval by setting the `scrape_interval` field in the Prometheus configuration file at the global or job level.
A scraping interval of 60 minutes or higher is recommended.
@z

@x
Because of the own nature of vulnerability data, the metrics exposed through this API are unlikely to change at a high frequency.
For this reason, the metrics endpoint has a 60-minute cache by default.
If you set the scrape interval to less than 60 minutes, you will see the same data in the metrics for multiple scrapes during that time window.
@y
Because of the own nature of vulnerability data, the metrics exposed through this API are unlikely to change at a high frequency.
For this reason, the metrics endpoint has a 60-minute cache by default.
If you set the scrape interval to less than 60 minutes, you will see the same data in the metrics for multiple scrapes during that time window.
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
## Sample project
@y
## Sample project
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
   ```
@y
   ```console
   $ git clone git@github.com:dockersamples/scout-metrics-exporter.git
   ```
@z

@x
2. [Create a Docker access token](/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `prometheus/token` under the template directory.
@y
2. [Create a Docker access token](__SUBDIR__/security/for-developers/access-tokens/#create-an-access-token)
   and store it in a plain text file at `prometheus/token` under the template directory.
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
3. In the Prometheus configuration file at `prometheus/prometheus.yml`,
   replace `ORG` in the `metrics_path` property on line 6 with the namespace of your Docker organization.
@y
3. In the Prometheus configuration file at `prometheus/prometheus.yml`,
   replace `ORG` in the `metrics_path` property on line 6 with the namespace of your Docker organization.
@z

@x
   ```yaml {title="prometheus/prometheus.yml",hl_lines="6",linenos=1}
   global:
     scrape_interval: 60s
     scrape_timeout: 40s
   scrape_configs:
     - job_name: Docker Scout policy
       metrics_path: /v1/exporter/org/<ORG>
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
       metrics_path: /v1/exporter/org/<ORG>
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
![Docker Scout metrics exporter Prometheus target](./images/scout-metrics-prom-target.png "Docker Scout metrics exporter Prometheus target")
@y
![Docker Scout metrics exporter Prometheus target](./images/scout-metrics-prom-target.png "Docker Scout metrics exporter Prometheus target")
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
![Policy dashboard in Grafana](./images/scout-metrics-grafana.png "Policy dashboard in Grafana")
@y
![Policy dashboard in Grafana](./images/scout-metrics-grafana.png "Policy dashboard in Grafana")
@z

@x
The dashboards are pre-configured to visualize the vulnerability and policy metrics scraped by Prometheus.
@y
The dashboards are pre-configured to visualize the vulnerability and policy metrics scraped by Prometheus.
@z

@x
### Revoke an access token
@y
### Revoke an access token
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
