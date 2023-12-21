%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Collecting Docker metrics with Prometheus
keywords: prometheus, metrics
title: Collect Docker metrics with Prometheus
aliases:
  - /engine/admin/prometheus/
  - /config/thirdparty/monitoring/
  - /config/thirdparty/prometheus/
---
@y
---
description: Collecting Docker metrics with Prometheus
keywords: prometheus, metrics
title: Collect Docker metrics with Prometheus
aliases:
  - /engine/admin/prometheus/
  - /config/thirdparty/monitoring/
  - /config/thirdparty/prometheus/
---
@z

@x
[Prometheus](https://prometheus.io/) is an open-source systems monitoring and
alerting toolkit. You can configure Docker as a Prometheus target.
@y
[Prometheus](https://prometheus.io/) is an open-source systems monitoring and
alerting toolkit. You can configure Docker as a Prometheus target.
@z

@x
> **Warning**
>
> The available metrics and the names of those metrics are in active
> development and may change at any time.
{ .warning }
@y
> **Warning**
>
> The available metrics and the names of those metrics are in active
> development and may change at any time.
{ .warning }
@z

@x
Currently, you can only monitor Docker itself. You can't currently monitor your
application using the Docker target.
@y
Currently, you can only monitor Docker itself. You can't currently monitor your
application using the Docker target.
@z

@x
## Example
@y
## Example
@z

@x
The following example shows you how to configure your Docker daemon, set up
Prometheus to run as a container on your local machine, and monitor your Docker
instance using Prometheus.
@y
The following example shows you how to configure your Docker daemon, set up
Prometheus to run as a container on your local machine, and monitor your Docker
instance using Prometheus.
@z

@x
### Configure the daemon
@y
### Configure the daemon
@z

@x
To configure the Docker daemon as a Prometheus target, you need to specify the
`metrics-address` in the `daemon.json` configuration file. This daemon expects
the file to be located at one of the following locations by default. If the
file doesn't exist, create it.
@y
To configure the Docker daemon as a Prometheus target, you need to specify the
`metrics-address` in the `daemon.json` configuration file. This daemon expects
the file to be located at one of the following locations by default. If the
file doesn't exist, create it.
@z

@x
- **Linux**: `/etc/docker/daemon.json`
- **Windows Server**: `C:\ProgramData\docker\config\daemon.json`
- **Docker Desktop**: Open the Docker Desktop settings and select **Docker Engine** to edit the file.
@y
- **Linux**: `/etc/docker/daemon.json`
- **Windows Server**: `C:\ProgramData\docker\config\daemon.json`
- **Docker Desktop**: Open the Docker Desktop settings and select **Docker Engine** to edit the file.
@z

@x
Add the following configuration:
@y
Add the following configuration:
@z

@x
```json
{
  "metrics-addr": "127.0.0.1:9323"
}
```
@y
```json
{
  "metrics-addr": "127.0.0.1:9323"
}
```
@z

@x
Save the file, or in the case of Docker Desktop for Mac or Docker Desktop for
Windows, save the configuration. Restart Docker.
@y
Save the file, or in the case of Docker Desktop for Mac or Docker Desktop for
Windows, save the configuration. Restart Docker.
@z

@x
Docker now exposes Prometheus-compatible metrics on port 9323 on the loopback
interface.
@y
Docker now exposes Prometheus-compatible metrics on port 9323 on the loopback
interface.
@z

@x
### Create a Prometheus configuration
@y
### Create a Prometheus configuration
@z

@x
Copy the following configuration file and save it to a location of your choice,
for example `/tmp/prometheus.yml`. This is a stock Prometheus configuration file,
except for the addition of the Docker job definition at the bottom of the file.
@y
Copy the following configuration file and save it to a location of your choice,
for example `/tmp/prometheus.yml`. This is a stock Prometheus configuration file,
except for the addition of the Docker job definition at the bottom of the file.
@z

@x
```yml
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).
@y
```yml
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).
@z

@x
  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
    monitor: "codelab-monitor"
@y
  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
    monitor: "codelab-monitor"
@z

@x
# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first.rules"
  # - "second.rules"
@y
# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first.rules"
  # - "second.rules"
@z

@x
# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: prometheus
@y
# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: prometheus
@z

@x
    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.
@y
    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.
@z

@x
    static_configs:
      - targets: ["localhost:9090"]
@y
    static_configs:
      - targets: ["localhost:9090"]
@z

@x
  - job_name: docker
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.
@y
  - job_name: docker
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.
@z

@x
    static_configs:
      - targets: ["host.docker.internal:9323"]
```
@y
    static_configs:
      - targets: ["host.docker.internal:9323"]
```
@z

@x
### Run Prometheus in a container
@y
### Run Prometheus in a container
@z

@x
Next, start a Prometheus container using this configuration.
@y
Next, start a Prometheus container using this configuration.
@z

@x
```console
$ docker run --name my-prometheus \
    --mount type=bind,source=/tmp/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
    -p 9090:9090 \
    --add-host host.docker.internal=host-gateway \
    prom/prometheus
```
@y
```console
$ docker run --name my-prometheus \
    --mount type=bind,source=/tmp/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
    -p 9090:9090 \
    --add-host host.docker.internal=host-gateway \
    prom/prometheus
```
@z

@x
If you're using Docker Desktop, the `--add-host` flag is optional. This flag
makes sure that the host's internal IP gets exposed to the Prometheus
container. Docker Desktop does this by default. The host IP is exposed as the
`host.docker.internal` hostname. This matches the configuration defined in
`prometheus.yml` in the previous step.
@y
If you're using Docker Desktop, the `--add-host` flag is optional. This flag
makes sure that the host's internal IP gets exposed to the Prometheus
container. Docker Desktop does this by default. The host IP is exposed as the
`host.docker.internal` hostname. This matches the configuration defined in
`prometheus.yml` in the previous step.
@z

@x
### Open the Prometheus Dashboard
@y
### Open the Prometheus Dashboard
@z

@x
Verify that the Docker target is listed at `http://localhost:9090/targets/`.
@y
Verify that the Docker target is listed at `http://localhost:9090/targets/`.
@z

@x
![Prometheus targets page](images/prometheus-targets.webp)
@y
![Prometheus targets page](images/prometheus-targets.webp)
@z

@x
> **Note**
>
> You can't access the endpoint URLs on this page directly if you use Docker
> Desktop.
@y
> **Note**
>
> You can't access the endpoint URLs on this page directly if you use Docker
> Desktop.
@z

@x
### Use Prometheus
@y
### Use Prometheus
@z

@x
Create a graph. Select the **Graphs** link in the Prometheus UI. Choose a metric
from the combo box to the right of the **Execute** button, and click
**Execute**. The screenshot below shows the graph for
`engine_daemon_network_actions_seconds_count`.
@y
Create a graph. Select the **Graphs** link in the Prometheus UI. Choose a metric
from the combo box to the right of the **Execute** button, and click
**Execute**. The screenshot below shows the graph for
`engine_daemon_network_actions_seconds_count`.
@z

@x
![Idle Prometheus report](images/prometheus-graph_idle.webp)
@y
![Idle Prometheus report](images/prometheus-graph_idle.webp)
@z

@x
The graph shows a pretty idle Docker instance, unless you're already running
active workloads on your system.
@y
The graph shows a pretty idle Docker instance, unless you're already running
active workloads on your system.
@z

@x
To make the graph more interesting, run a container that uses some network
actions by starting downloading some packages using a package manager:
@y
To make the graph more interesting, run a container that uses some network
actions by starting downloading some packages using a package manager:
@z

@x
```console
$ docker run --rm alpine apk add git make musl-dev go
```
@y
```console
$ docker run --rm alpine apk add git make musl-dev go
```
@z

@x
Wait a few seconds (the default scrape interval is 15 seconds) and reload your
graph. You should see an uptick in the graph, showing the increased network
traffic caused by the container you just ran.
@y
Wait a few seconds (the default scrape interval is 15 seconds) and reload your
graph. You should see an uptick in the graph, showing the increased network
traffic caused by the container you just ran.
@z

@x
![Prometheus report showing traffic](images/prometheus-graph_load.webp)
@y
![Prometheus report showing traffic](images/prometheus-graph_load.webp)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The example provided here shows how to run Prometheus as a container on your
local system. In practice, you'll probably be running Prometheus on another
system or as a cloud service somewhere. You can set up the Docker daemon as a
Prometheus target in such contexts too. Configure the `metrics-addr` of the
daemon and add the address of the daemon as a scrape endpoint in your
Prometheus configuration.
@y
The example provided here shows how to run Prometheus as a container on your
local system. In practice, you'll probably be running Prometheus on another
system or as a cloud service somewhere. You can set up the Docker daemon as a
Prometheus target in such contexts too. Configure the `metrics-addr` of the
daemon and add the address of the daemon as a scrape endpoint in your
Prometheus configuration.
@z

@x
```yaml
- job_name: docker
  static_configs:
    - targets: ["docker.daemon.example:<PORT>"]
```
@y
```yaml
- job_name: docker
  static_configs:
    - targets: ["docker.daemon.example:<PORT>"]
```
@z

@x
For more information about Prometheus, refer to the
[Prometheus documentation](https://prometheus.io/docs/introduction/overview/)
@y
For more information about Prometheus, refer to the
[Prometheus documentation](https://prometheus.io/docs/introduction/overview/)
@z
