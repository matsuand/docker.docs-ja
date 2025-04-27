%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Containerize a Golang application and monitor it with Prometheus and Grafana.
keywords: golang, prometheus, grafana, monitoring, containerize
title: Monitor a Golang application with Prometheus and Grafana
summary: |
  Learn how to containerize a Golang application and monitor it with Prometheus and Grafana.
linkTitle: Monitor with Prometheus and Grafana
@y
description: Containerize a Golang application and monitor it with Prometheus and Grafana.
keywords: golang, prometheus, grafana, monitoring, containerize
title: Monitor a Golang application with Prometheus and Grafana
summary: |
  Learn how to containerize a Golang application and monitor it with Prometheus and Grafana.
linkTitle: Monitor with Prometheus and Grafana
@z

@x
  time: 45 minutes
@y
  time: 45 分
@z

@x
The guide teaches you how to containerize a Golang application and monitor it with Prometheus and Grafana. 
@y
The guide teaches you how to containerize a Golang application and monitor it with Prometheus and Grafana. 
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@z

@x
## Overview
@y
## Overview
@z

@x
To make sure your application is working as intended, monitoring is important. One of the most popular monitoring tools is Prometheus. Prometheus is an open-source monitoring and alerting toolkit that is designed for reliability and scalability. It collects metrics from monitored targets by scraping metrics HTTP endpoints on these targets. To visualize the metrics, you can use Grafana. Grafana is an open-source platform for monitoring and observability that allows you to query, visualize, alert on, and understand your metrics no matter where they are stored.
@y
To make sure your application is working as intended, monitoring is important. One of the most popular monitoring tools is Prometheus. Prometheus is an open-source monitoring and alerting toolkit that is designed for reliability and scalability. It collects metrics from monitored targets by scraping metrics HTTP endpoints on these targets. To visualize the metrics, you can use Grafana. Grafana is an open-source platform for monitoring and observability that allows you to query, visualize, alert on, and understand your metrics no matter where they are stored.
@z

@x
In this guide, you will be creating a Golang server with some endpoints to simulate a real-world application. Then you will expose metrics from the server using Prometheus. Finally, you will visualize the metrics using Grafana. You will containerize the Golang application, and using the Docker Compose file, you will connect all the services: Golang, Prometheus, and Grafana.
@y
In this guide, you will be creating a Golang server with some endpoints to simulate a real-world application. Then you will expose metrics from the server using Prometheus. Finally, you will visualize the metrics using Grafana. You will containerize the Golang application, and using the Docker Compose file, you will connect all the services: Golang, Prometheus, and Grafana.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
* Create a Golang application with custom Prometheus metrics.
* Containerize a Golang application.
* Use Docker Compose to run multiple services and connect them together to monitor a Golang application with Prometheus and Grafana.
* Visualize the metrics using Grafana dashboards.
@y
* Create a Golang application with custom Prometheus metrics.
* Containerize a Golang application.
* Use Docker Compose to run multiple services and connect them together to monitor a Golang application with Prometheus and Grafana.
* Visualize the metrics using Grafana dashboards.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- A good understanding of Golang is assumed.
- You must me familiar with Prometheus and creating dashboards in Grafana.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- A good understanding of Golang is assumed.
- You must me familiar with Prometheus and creating dashboards in Grafana.
- You must have familiarity with Docker concepts like containers, images, and Dockerfiles. If you are new to Docker, you can start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
## Next steps
@y
## Next steps
@z

@x
You will create a Golang server and expose metrics using Prometheus.
@y
You will create a Golang server and expose metrics using Prometheus.
@z
