%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Lab: AI Fundamentals for Developers"
linkTitle: "Lab: AI Fundamentals"
description: |
  Learn the core concepts of AI development — models, prompt engineering, tool
  calling, and RAG — through hands-on exercises in a live environment.
summary: |
  Hands-on lab: Learn the four core pillars of AI application development.
  Work with the Chat Completions API, prompt engineering, tool calling, and RAG
  through interactive exercises.
keywords: AI, Docker, Model Runner, prompt engineering, RAG, tool calling, lab, labspace
@y
title: "Lab: AI Fundamentals for Developers"
linkTitle: "Lab: AI Fundamentals"
description: |
  Learn the core concepts of AI development — models, prompt engineering, tool
  calling, and RAG — through hands-on exercises in a live environment.
summary: |
  Hands-on lab: Learn the four core pillars of AI application development.
  Work with the Chat Completions API, prompt engineering, tool calling, and RAG
  through interactive exercises.
keywords: AI, Docker, Model Runner, prompt engineering, RAG, tool calling, lab, labspace
@z

@x
  time: 45 minutes
@y
  time: 45 分
@z

@x
    - title: Docker Model Runner docs
      url: /ai/model-runner/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-ai-fundamentals
@y
    - title: Docker Model Runner docs
      url: __SUBDIR__/ai/model-runner/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-ai-fundamentals
@z

@x
Get hands-on with the four core pillars of AI application development: models,
prompt engineering, tool calling, and RAG. This lab runs entirely on your
machine using Docker Model Runner — no API key or cloud account required.
@y
Get hands-on with the four core pillars of AI application development: models,
prompt engineering, tool calling, and RAG. This lab runs entirely on your
machine using Docker Model Runner — no API key or cloud account required.
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
{{< labspace-launch image="dockersamples/labspace-ai-fundamentals" model-download="true" >}}
@y
{{< labspace-launch image="dockersamples/labspace-ai-fundamentals" model-download="true" >}}
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
By the end of this Labspace, you will have completed the following:
@y
By the end of this Labspace, you will have completed the following:
@z

@x
- Understand the Chat Completions API and how to structure messages for a model
- Use prompt engineering techniques including system prompts, few-shot examples, and structured output
- Implement tool calling and the agentic loop in code
- Build a RAG pipeline that grounds model responses in your own data
@y
- Understand the Chat Completions API and how to structure messages for a model
- Use prompt engineering techniques including system prompts, few-shot examples, and structured output
- Implement tool calling and the agentic loop in code
- Build a RAG pipeline that grounds model responses in your own data
@z

@x
## Modules
@y
## Modules
@z

@x
| #   | Module                               | Description                                                       |
| --- | ------------------------------------ | ----------------------------------------------------------------- |
| 1   | Welcome & Setup                      | Introduction to the lab and verifying your environment            |
| 2   | Talking to Models                    | Chat Completions API, message roles, and stateless model behavior |
| 3   | Prompt Engineering                   | System prompts, few-shot examples, and structured output          |
| 4   | Tool Calling                         | Tool definitions, the agentic loop, and executing tools in code   |
| 5   | Retrieval Augmented Generation (RAG) | Retrieve, augment, and generate with your own knowledge base      |
| 6   | Wrap-up                              | Summary of concepts and next steps                                |
@y
| #   | Module                               | Description                                                       |
| --- | ------------------------------------ | ----------------------------------------------------------------- |
| 1   | Welcome & Setup                      | Introduction to the lab and verifying your environment            |
| 2   | Talking to Models                    | Chat Completions API, message roles, and stateless model behavior |
| 3   | Prompt Engineering                   | System prompts, few-shot examples, and structured output          |
| 4   | Tool Calling                         | Tool definitions, the agentic loop, and executing tools in code   |
| 5   | Retrieval Augmented Generation (RAG) | Retrieve, augment, and generate with your own knowledge base      |
| 6   | Wrap-up                              | Summary of concepts and next steps                                |
@z
