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

@x
   ```console
   $ git clone https://github.com/docker/hello-genai.git
   ```
@y
   ```console
   $ git clone https://github.com/docker/hello-genai.git
   ```
@z

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

@x
```yaml {title="dmr-run.yml", collapse=true}
name: Docker Model Runner Example Workflow
@y
```yaml {title="dmr-run.yml", collapse=true}
name: Docker Model Runner Example Workflow
@z

@x
permissions:
  contents: read
@y
permissions:
  contents: read
@z

@x
on:
  workflow_dispatch:
    inputs:
      test_model:
        description: 'Model to test with (default: ai/smollm2:360M-Q4_K_M)'
        required: false
        type: string
        default: 'ai/smollm2:360M-Q4_K_M'
@y
on:
  workflow_dispatch:
    inputs:
      test_model:
        description: 'Model to test with (default: ai/smollm2:360M-Q4_K_M)'
        required: false
        type: string
        default: 'ai/smollm2:360M-Q4_K_M'
@z

@x
jobs:
  dmr-test:
    runs-on: ubuntu-latest
    timeout-minutes: 30
@y
jobs:
  dmr-test:
    runs-on: ubuntu-latest
    timeout-minutes: 30
@z

@x
    steps:
      - name: Set up Docker
        uses: docker/setup-docker-action@v4
@y
    steps:
      - name: Set up Docker
        uses: docker/setup-docker-action@v4
@z

@x
      - name: Install docker-model-plugin
        run: |
          echo "Installing docker-model-plugin..."
          # Add Docker's official GPG key:
          sudo apt-get update
          sudo apt-get install ca-certificates curl
          sudo install -m 0755 -d /etc/apt/keyrings
          sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
          sudo chmod a+r /etc/apt/keyrings/docker.asc
@y
      - name: Install docker-model-plugin
        run: |
          echo "Installing docker-model-plugin..."
          # Add Docker's official GPG key:
          sudo apt-get update
          sudo apt-get install ca-certificates curl
          sudo install -m 0755 -d /etc/apt/keyrings
          sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
          sudo chmod a+r /etc/apt/keyrings/docker.asc
@z

@x
          # Add the repository to Apt sources:
          echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
          $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
          sudo apt-get update
          sudo apt-get install -y docker-model-plugin
@y
          # Add the repository to Apt sources:
          echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
          $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
          sudo apt-get update
          sudo apt-get install -y docker-model-plugin
@z

@x
          echo "Installation completed successfully"
@y
          echo "Installation completed successfully"
@z

@x
      - name: Test docker model version
        run: |
          echo "Testing docker model version command..."
          sudo docker model version
@y
      - name: Test docker model version
        run: |
          echo "Testing docker model version command..."
          sudo docker model version
@z

@x
          # Verify the command returns successfully
          if [ $? -eq 0 ]; then
            echo "✅ docker model version command works correctly"
          else
            echo "❌ docker model version command failed"
            exit 1
          fi
@y
          # Verify the command returns successfully
          if [ $? -eq 0 ]; then
            echo "✅ docker model version command works correctly"
          else
            echo "❌ docker model version command failed"
            exit 1
          fi
@z

@x
      - name: Pull the provided model and run it
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing with model: $MODEL"
@y
      - name: Pull the provided model and run it
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing with model: $MODEL"
@z

@x
          # Test model pull
          echo "Pulling model..."
          sudo docker model pull "$MODEL"
@y
          # Test model pull
          echo "Pulling model..."
          sudo docker model pull "$MODEL"
@z

@x
          if [ $? -eq 0 ]; then
            echo "✅ Model pull successful"
          else
            echo "❌ Model pull failed"
            exit 1
          fi
@y
          if [ $? -eq 0 ]; then
            echo "✅ Model pull successful"
          else
            echo "❌ Model pull failed"
            exit 1
          fi
@z

@x
          # Test basic model run (with timeout to avoid hanging)
          echo "Testing docker model run..."
          timeout 60s sudo docker model run "$MODEL" "Give me a fact about whales." || {
            exit_code=$?
            if [ $exit_code -eq 124 ]; then
              echo "✅ Model run test completed (timed out as expected for non-interactive test)"
            else
              echo "❌ Model run failed with exit code: $exit_code"
              exit 1
            fi
          }
               - name: Test model pull and run
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing with model: $MODEL"
@y
          # Test basic model run (with timeout to avoid hanging)
          echo "Testing docker model run..."
          timeout 60s sudo docker model run "$MODEL" "Give me a fact about whales." || {
            exit_code=$?
            if [ $exit_code -eq 124 ]; then
              echo "✅ Model run test completed (timed out as expected for non-interactive test)"
            else
              echo "❌ Model run failed with exit code: $exit_code"
              exit 1
            fi
          }
               - name: Test model pull and run
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing with model: $MODEL"
@z

@x
          # Test model pull
          echo "Pulling model..."
          sudo docker model pull "$MODEL"
@y
          # Test model pull
          echo "Pulling model..."
          sudo docker model pull "$MODEL"
@z

@x
          if [ $? -eq 0 ]; then
            echo "✅ Model pull successful"
          else
            echo "❌ Model pull failed"
            exit 1
          fi
@y
          if [ $? -eq 0 ]; then
            echo "✅ Model pull successful"
          else
            echo "❌ Model pull failed"
            exit 1
          fi
@z

@x
          # Test basic model run (with timeout to avoid hanging)
          echo "Testing docker model run..."
          timeout 60s sudo docker model run "$MODEL" "Give me a fact about whales." || {
            exit_code=$?
            if [ $exit_code -eq 124 ]; then
              echo "✅ Model run test completed (timed out as expected for non-interactive test)"
            else
              echo "❌ Model run failed with exit code: $exit_code"
              exit 1
            fi
          }
@y
          # Test basic model run (with timeout to avoid hanging)
          echo "Testing docker model run..."
          timeout 60s sudo docker model run "$MODEL" "Give me a fact about whales." || {
            exit_code=$?
            if [ $exit_code -eq 124 ]; then
              echo "✅ Model run test completed (timed out as expected for non-interactive test)"
            else
              echo "❌ Model run failed with exit code: $exit_code"
              exit 1
            fi
          }
@z

@x
      - name: Test API endpoint
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing API endpoint with model: $MODEL"
@y
      - name: Test API endpoint
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
          echo "Testing API endpoint with model: $MODEL"
@z

@x
          # Test API call with curl
          echo "Testing API call..."
          RESPONSE=$(curl -s http://localhost:12434/engines/llama.cpp/v1/chat/completions \
            -H "Content-Type: application/json" \
            -d "{
                \"model\": \"$MODEL\",
                \"messages\": [
                    {
                        \"role\": \"user\",
                        \"content\": \"Say hello\"
                    }
                ],
                \"top_k\": 1,
                \"temperature\": 0
            }")
@y
          # Test API call with curl
          echo "Testing API call..."
          RESPONSE=$(curl -s http://localhost:12434/engines/llama.cpp/v1/chat/completions \
            -H "Content-Type: application/json" \
            -d "{
                \"model\": \"$MODEL\",
                \"messages\": [
                    {
                        \"role\": \"user\",
                        \"content\": \"Say hello\"
                    }
                ],
                \"top_k\": 1,
                \"temperature\": 0
            }")
@z

@x
          if [ $? -eq 0 ]; then
            echo "✅ API call successful"
            echo "Response received: $RESPONSE"
@y
          if [ $? -eq 0 ]; then
            echo "✅ API call successful"
            echo "Response received: $RESPONSE"
@z

@x
            # Check if response contains "hello" (case-insensitive)
            if echo "$RESPONSE" | grep -qi "hello"; then
              echo "✅ Response contains 'hello' (case-insensitive)"
            else
              echo "❌ Response does not contain 'hello'"
              echo "Full response: $RESPONSE"
              exit 1
            fi
          else
            echo "❌ API call failed"
            exit 1
          fi
@y
            # Check if response contains "hello" (case-insensitive)
            if echo "$RESPONSE" | grep -qi "hello"; then
              echo "✅ Response contains 'hello' (case-insensitive)"
            else
              echo "❌ Response does not contain 'hello'"
              echo "Full response: $RESPONSE"
              exit 1
            fi
          else
            echo "❌ API call failed"
            exit 1
          fi
@z

@x
      - name: Test model cleanup
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
@y
      - name: Test model cleanup
        run: |
          MODEL="${{ github.event.inputs.test_model || 'ai/smollm2:360M-Q4_K_M' }}"
@z

@x
          echo "Cleaning up test model..."
          sudo docker model rm "$MODEL" || echo "Model removal failed or model not found"
@y
          echo "Cleaning up test model..."
          sudo docker model rm "$MODEL" || echo "Model removal failed or model not found"
@z

@x
          # Verify model was removed
          echo "Verifying model cleanup..."
          sudo docker model ls
@y
          # Verify model was removed
          echo "Verifying model cleanup..."
          sudo docker model ls
@z

@x
          echo "✅ Model cleanup completed"
@y
          echo "✅ Model cleanup completed"
@z

@x
      - name: Report success
        if: success()
        run: |
          echo "🎉 Docker Model Runner daily health check completed successfully!"
          echo "All tests passed:"
          echo "  ✅ docker-model-plugin installation successful"
          echo "  ✅ docker model version command working"
          echo "  ✅ Model pull and run operations successful"
          echo "  ✅ API endpoint operations successful"
          echo "  ✅ Cleanup operations successful"
```
@y
      - name: Report success
        if: success()
        run: |
          echo "🎉 Docker Model Runner daily health check completed successfully!"
          echo "All tests passed:"
          echo "  ✅ docker-model-plugin installation successful"
          echo "  ✅ docker model version command working"
          echo "  ✅ Model pull and run operations successful"
          echo "  ✅ API endpoint operations successful"
          echo "  ✅ Cleanup operations successful"
```
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
