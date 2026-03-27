%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for Python
linkTitle: Testcontainers for Python
description: Learn how to use Testcontainers for Python to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, python, testing, postgresql, integration testing, pytest
summary: |
  Learn how to create a Python application and test database interactions
  using Testcontainers for Python with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for Python
linkTitle: Testcontainers for Python
description: Learn how to use Testcontainers for Python to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, python, testing, postgresql, integration testing, pytest
summary: |
  Learn how to create a Python application and test database interactions
  using Testcontainers for Python with a real PostgreSQL instance.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-python -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-python -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Python application that uses PostgreSQL to store customer data
- Use `psycopg` to interact with the database
- Write integration tests using `testcontainers-python` and `pytest`
- Manage container lifecycle with pytest fixtures
@y
- Create a Python application that uses PostgreSQL to store customer data
- Use `psycopg` to interact with the database
- Write integration tests using `testcontainers-python` and `pytest`
- Manage container lifecycle with pytest fixtures
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Python 3.10+
- pip
- A Docker environment supported by Testcontainers
@y
- Python 3.10+
- pip
- A Docker environment supported by Testcontainers
@z

@x
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@y
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@z
