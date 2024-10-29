%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Common challenges and questions
description: Explore common challenges and questions related to Testcontainers Cloud by Docker.
weight: 40
---
@y
---
title: Common challenges and questions
description: Explore common challenges and questions related to Testcontainers Cloud by Docker.
weight: 40
---
@z

@x
<!-- vale Docker.HeadingLength = NO -->
@y
<!-- vale Docker.HeadingLength = NO -->
@z

@x
### How is Testcontainers Cloud different from the open-source Testcontainers framework?
@y
### How is Testcontainers Cloud different from the open-source Testcontainers framework?
@z

@x
While the open-source Testcontainers is a library that provides a lightweight APIs for bootstrapping local development and test dependencies with real services wrapped in Docker containers, Testcontainers Cloud provides a cloud runtime for these containers. This reduces the resource strain on local environments and provides more scalability, especially in CI/CD workflows, that enables consistent Testcontainers experience across the organization.
@y
While the open-source Testcontainers is a library that provides a lightweight APIs for bootstrapping local development and test dependencies with real services wrapped in Docker containers, Testcontainers Cloud provides a cloud runtime for these containers. This reduces the resource strain on local environments and provides more scalability, especially in CI/CD workflows, that enables consistent Testcontainers experience across the organization.
@z

@x
### What types of containers can I run with Testcontainers Cloud?
@y
### What types of containers can I run with Testcontainers Cloud?
@z

@x
Testcontainers Cloud supports any containers you would typically use with the Testcontainers framework, including databases (PostgreSQL, MySQL, MongoDB), message brokers (Kafka, RabbitMQ), and other services required for integration testing.
@y
Testcontainers Cloud supports any containers you would typically use with the Testcontainers framework, including databases (PostgreSQL, MySQL, MongoDB), message brokers (Kafka, RabbitMQ), and other services required for integration testing.
@z

@x
### Do I need to change my existing test code to use Testcontainers Cloud?
@y
### Do I need to change my existing test code to use Testcontainers Cloud?
@z

@x
No, you don't need to change your existing test code. Testcontainers Cloud integrates seamlessly with the open-source Testcontainers framework. Once the cloud configuration is set up, it automatically manages the containers in the cloud without requiring code changes.
@y
No, you don't need to change your existing test code. Testcontainers Cloud integrates seamlessly with the open-source Testcontainers framework. Once the cloud configuration is set up, it automatically manages the containers in the cloud without requiring code changes.
@z

@x
### How do I integrate Testcontainers Cloud into my project?
@y
### How do I integrate Testcontainers Cloud into my project?
@z

@x
To integrate Testcontainers Cloud, you need to install the Testcontainers Desktop app and select run with Testcontainers Cloud option in the menu. In CI you’ll need to add a workflow step that downloads Testcontainers Cloud agent. No code changes are required beyond enabling Cloud runtime via the Testcontainers Desktop app locally or installing Testcontainers Cloud agent in CI.
@y
To integrate Testcontainers Cloud, you need to install the Testcontainers Desktop app and select run with Testcontainers Cloud option in the menu. In CI you’ll need to add a workflow step that downloads Testcontainers Cloud agent. No code changes are required beyond enabling Cloud runtime via the Testcontainers Desktop app locally or installing Testcontainers Cloud agent in CI.
@z

@x
### Can I use Testcontainers Cloud in a CI/CD pipeline?
@y
### Can I use Testcontainers Cloud in a CI/CD pipeline?
@z

@x
Yes, Testcontainers Cloud is designed to work efficiently in CI/CD pipelines. It helps reduce build times and resource bottlenecks by offloading containers that you spin up with Testcontainers library to the cloud, making it a perfect fit for continuous testing environments.
@y
Yes, Testcontainers Cloud is designed to work efficiently in CI/CD pipelines. It helps reduce build times and resource bottlenecks by offloading containers that you spin up with Testcontainers library to the cloud, making it a perfect fit for continuous testing environments.
@z

@x
### What are the benefits of using Testcontainers Cloud?
@y
### What are the benefits of using Testcontainers Cloud?
@z

@x
The key benefits include reduced resource usage on local machines and CI servers, scalability (run more containers without performance degradation), consistent testing environments, centralized monitoring, ease of CI configuration with removed security concerns of running Docker-in-Docker or a privileged daemon.
@y
The key benefits include reduced resource usage on local machines and CI servers, scalability (run more containers without performance degradation), consistent testing environments, centralized monitoring, ease of CI configuration with removed security concerns of running Docker-in-Docker or a privileged daemon.
@z

@x
### Does Testcontainers Cloud support all programming languages?
@y
### Does Testcontainers Cloud support all programming languages?
@z

@x
Testcontainers Cloud supports any language that works with the open-source Testcontainers libraries, including Java, Python, Node.js, Go, and others. As long as your project uses Testcontainers, it can be offloaded to Testcontainers Cloud.
@y
Testcontainers Cloud supports any language that works with the open-source Testcontainers libraries, including Java, Python, Node.js, Go, and others. As long as your project uses Testcontainers, it can be offloaded to Testcontainers Cloud.
@z

@x
### How is container cleanup handled in Testcontainers Cloud?
@y
### How is container cleanup handled in Testcontainers Cloud?
@z

@x
While Testcontainers library automatically handles container lifecycle management, Testcontainers Cloud manages the allocated cloud worker lifetime. This means that containers are spun up, monitored, and cleaned up after tests are completed by Testcontainers library, and the worker where these containers have being running will be removed automatically after the ~35 min idle period by Testcontainers Cloud. This approach frees developers from manually managing containers and assosiated cloud resources. 
@y
While Testcontainers library automatically handles container lifecycle management, Testcontainers Cloud manages the allocated cloud worker lifetime. This means that containers are spun up, monitored, and cleaned up after tests are completed by Testcontainers library, and the worker where these containers have being running will be removed automatically after the ~35 min idle period by Testcontainers Cloud. This approach frees developers from manually managing containers and assosiated cloud resources. 
@z

@x
### Is there a free tier or pricing model for Testcontainers Cloud?
@y
### Is there a free tier or pricing model for Testcontainers Cloud?
@z

@x
Pricing details for Testcontainers Cloud can be found on the [pricing page](https://testcontainers.com/cloud/pricing/).
@y
Pricing details for Testcontainers Cloud can be found on the [pricing page](https://testcontainers.com/cloud/pricing/).
@z
