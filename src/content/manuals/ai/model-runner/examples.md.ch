%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: DMR examples
description: Example projects and CI/CD workflows for Docker Model Runner.
@y
title: DMR examples
description: Example projects and CI/CD workflows for Docker Model Runner.
@z

@x
keywords: Docker, ai, model runner, examples, github actions, genai, sample project
@y
keywords: Docker, ai, model runner, examples, github actions, genai, sample project
@z

@x
See some examples of complete workflows using Docker Model Runner.
@y
See some examples of complete workflows using Docker Model Runner.
@z

@x
## Sample project
@y
## Sample project
@z

@x
You can now start building your generative AI application powered by Docker
Model Runner.
@y
You can now start building your generative AI application powered by Docker
Model Runner.
@z

@x
If you want to try an existing GenAI application, follow these steps:
@y
If you want to try an existing GenAI application, follow these steps:
@z

@x
1. Set up the sample app. Clone and run the following repository:
@y
1. Set up the sample app. Clone and run the following repository:
@z

% snip command...

@x
1. In your terminal, go to the `hello-genai` directory.
@y
1. In your terminal, go to the `hello-genai` directory.
@z

@x
1. Run `run.sh` to pull the chosen model and run the app.
@y
1. Run `run.sh` to pull the chosen model and run the app.
@z

@x
1. Open your app in the browser at the addresses specified in the repository
   [README](https://github.com/docker/hello-genai).
@y
1. Open your app in the browser at the addresses specified in the repository
   [README](https://github.com/docker/hello-genai).
@z

@x
You see the GenAI app's interface where you can start typing your prompts.
@y
You see the GenAI app's interface where you can start typing your prompts.
@z

@x
You can now interact with your own GenAI app, powered by a local model. Try a
few prompts and notice how fast the responses are — all running on your machine
with Docker.
@y
You can now interact with your own GenAI app, powered by a local model. Try a
few prompts and notice how fast the responses are — all running on your machine
with Docker.
@z

@x
## Use Model Runner in GitHub Actions
@y
## Use Model Runner in GitHub Actions
@z

@x
Here is an example of how to use Model Runner as part of a GitHub workflow.
The example installs Model Runner, tests the installation, pulls and runs a
model, interacts with the model via the API, and deletes the model.
@y
Here is an example of how to use Model Runner as part of a GitHub workflow.
The example installs Model Runner, tests the installation, pulls and runs a
model, interacts with the model via the API, and deletes the model.
@z

@x within code
          # Add Docker's official GPG key:
@y
          # Add Docker's official GPG key:
@z
@x
          # Add the repository to Apt sources:
@y
          # Add the repository to Apt sources:
@z
@x
          # Test model pull
@y
          # Test model pull
@z
@x
          # Test basic model run (with timeout to avoid hanging)
@y
          # Test basic model run (with timeout to avoid hanging)
@z
@x
          # Test model pull
@y
          # Test model pull
@z
@x
          # Test basic model run (with timeout to avoid hanging)
@y
          # Test basic model run (with timeout to avoid hanging)
@z
@x
          # Test API call with curl
@y
          # Test API call with curl
@z
@x
            # Check if response contains "hello" (case-insensitive)
@y
            # Check if response contains "hello" (case-insensitive)
@z
@x
          # Verify model was removed
@y
          # Verify model was removed
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Models and Compose](../compose/models-and-compose.md)
@y
- [Models and Compose](../compose/models-and-compose.md)
@z
