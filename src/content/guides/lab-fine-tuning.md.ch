%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Lab: Fine-Tuning Local Models"
linkTitle: "Lab: Fine-Tuning Models"
description: |
  Fine-tune AI models using Docker Offload, Docker Model Runner, and Unsloth
  in this hands-on interactive lab.
summary: |
  Hands-on lab: Fine-tune, validate, and share custom AI models using Docker
  Offload, Unsloth, and Docker Model Runner.
keywords: AI, Docker, fine-tuning, Docker Offload, Unsloth, Model Runner, lab, labspace
@y
title: "Lab: Fine-Tuning Local Models"
linkTitle: "Lab: Fine-Tuning Models"
description: |
  Fine-tune AI models using Docker Offload, Docker Model Runner, and Unsloth
  in this hands-on interactive lab.
summary: |
  Hands-on lab: Fine-tune, validate, and share custom AI models using Docker
  Offload, Unsloth, and Docker Model Runner.
keywords: AI, Docker, fine-tuning, Docker Offload, Unsloth, Model Runner, lab, labspace
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
    - title: Docker Model Runner docs
      url: /ai/model-runner/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-fine-tuning
@y
    - title: Docker Model Runner docs
      url: __SUBDIR__/ai/model-runner/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-fine-tuning
@z

@x
This lab provides a hands-on walkthrough of fine-tuning AI models using Docker
Offload, Docker Model Runner, and Unsloth. Learn how to customize models for
your specific use case, validate the results, and share them via Docker Hub.
@y
This lab provides a hands-on walkthrough of fine-tuning AI models using Docker
Offload, Docker Model Runner, and Unsloth. Learn how to customize models for
your specific use case, validate the results, and share them via Docker Hub.
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- Use Docker Offload to fine-tune a model with GPU acceleration
- Package and share the fine-tuned model on Docker Hub
- Run the custom model with Docker Model Runner
- Understand the end-to-end workflow from training to deployment
@y
- Use Docker Offload to fine-tune a model with GPU acceleration
- Package and share the fine-tuned model on Docker Hub
- Run the custom model with Docker Model Runner
- Understand the end-to-end workflow from training to deployment
@z

@x
## Modules
@y
## Modules
@z

@x
| # | Module | Description |
|---|--------|-------------|
| 1 | Introduction | Overview of fine-tuning concepts and the Docker AI stack |
| 2 | Fine-Tuning with Docker Offload | Run fine-tuning using Unsloth and Docker Offload |
| 3 | Validate and Publish | Test the fine-tuned model and publish to Docker Hub |
| 4 | Conclusion | Summary, key takeaways, and next steps |
@y
| # | Module | Description |
|---|--------|-------------|
| 1 | Introduction | Overview of fine-tuning concepts and the Docker AI stack |
| 2 | Fine-Tuning with Docker Offload | Run fine-tuning using Unsloth and Docker Offload |
| 3 | Validate and Publish | Test the fine-tuned model and publish to Docker Hub |
| 4 | Conclusion | Summary, key takeaways, and next steps |
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Docker Desktop with Docker Offload enabled
- GPU access with Docker Offload cloud resources
@y
- Docker Desktop with Docker Offload enabled
- GPU access with Docker Offload cloud resources
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
Ensure you have Docker Offload running, then start the labspace:
@y
Ensure you have Docker Offload running, then start the labspace:
@z

@x
```console
$ docker compose -f oci://dockersamples/labspace-fine-tuning up -d
```
@y
```console
$ docker compose -f oci://dockersamples/labspace-fine-tuning up -d
```
@z

@x
Then open your browser to [http://localhost:3030](http://localhost:3030).
@y
Then open your browser to [http://localhost:3030](http://localhost:3030).
@z
