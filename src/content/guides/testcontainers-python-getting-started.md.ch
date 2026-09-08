%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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

@x
## Create the Python project
@y
## Create the Python project
@z

@x
### Initialize the project
@y
### Initialize the project
@z

@x
Start by creating a Python project with a virtual environment:
@y
Start by creating a Python project with a virtual environment:
@z

@x
```console
$ mkdir tc-python-demo
$ cd tc-python-demo
$ python3 -m venv venv
$ source venv/bin/activate
```
@y
```console
$ mkdir tc-python-demo
$ cd tc-python-demo
$ python3 -m venv venv
$ source venv/bin/activate
```
@z

@x
This guide uses [psycopg3](https://www.psycopg.org/psycopg3/) to interact
with the Postgres database, [pytest](https://pytest.org/) for testing, and
[testcontainers-python](https://testcontainers-python.readthedocs.io/) for
running a PostgreSQL database in a container.
@y
This guide uses [psycopg3](https://www.psycopg.org/psycopg3/) to interact
with the Postgres database, [pytest](https://pytest.org/) for testing, and
[testcontainers-python](https://testcontainers-python.readthedocs.io/) for
running a PostgreSQL database in a container.
@z

@x
Install the dependencies:
@y
Install the dependencies:
@z

@x
```console
$ pip install "psycopg[binary]" pytest testcontainers[postgres]
$ pip freeze > requirements.txt
```
@y
```console
$ pip install "psycopg[binary]" pytest testcontainers[postgres]
$ pip freeze > requirements.txt
```
@z

@x
The `pip freeze` command generates a `requirements.txt` file so that others
can install the same package versions using `pip install -r requirements.txt`.
@y
The `pip freeze` command generates a `requirements.txt` file so that others
can install the same package versions using `pip install -r requirements.txt`.
@z

@x
### Create the database helper
@y
### Create the database helper
@z

@x
Create a `db/connection.py` file with a function to get a database connection:
@y
Create a `db/connection.py` file with a function to get a database connection:
@z

@x
```python
import os
@y
```python
import os
@z

@x
import psycopg
@y
import psycopg
@z

@x
def get_connection():
    host = os.getenv("DB_HOST", "localhost")
    port = os.getenv("DB_PORT", "5432")
    username = os.getenv("DB_USERNAME", "postgres")
    password = os.getenv("DB_PASSWORD", "postgres")
    database = os.getenv("DB_NAME", "postgres")
    return psycopg.connect(f"host={host} dbname={database} user={username} password={password} port={port}")
```
@y
def get_connection():
    host = os.getenv("DB_HOST", "localhost")
    port = os.getenv("DB_PORT", "5432")
    username = os.getenv("DB_USERNAME", "postgres")
    password = os.getenv("DB_PASSWORD", "postgres")
    database = os.getenv("DB_NAME", "postgres")
    return psycopg.connect(f"host={host} dbname={database} user={username} password={password} port={port}")
```
@z

@x
Instead of hard-coding the database connection parameters, the function uses
environment variables. This makes it possible to run the application in
different environments without changing code.
@y
Instead of hard-coding the database connection parameters, the function uses
environment variables. This makes it possible to run the application in
different environments without changing code.
@z

@x
### Create the business logic
@y
### Create the business logic
@z

@x
Create a `customers/customers.py` file and define the `Customer` class:
@y
Create a `customers/customers.py` file and define the `Customer` class:
@z

@x
```python
class Customer:
    def __init__(self, cust_id, name, email):
        self.id = cust_id
        self.name = name
        self.email = email
@y
```python
class Customer:
    def __init__(self, cust_id, name, email):
        self.id = cust_id
        self.name = name
        self.email = email
@z

@x
    def __str__(self):
        return f"Customer({self.id}, {self.name}, {self.email})"
```
@y
    def __str__(self):
        return f"Customer({self.id}, {self.name}, {self.email})"
```
@z

@x
Add a `create_table()` function to create the `customers` table:
@y
Add a `create_table()` function to create the `customers` table:
@z

@x
```python
from db.connection import get_connection
@y
```python
from db.connection import get_connection
@z

@x
def create_table():
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("""
                CREATE TABLE customers (
                    id serial PRIMARY KEY,
                    name varchar not null,
                    email varchar not null unique)
                """)
            conn.commit()
```
@y
def create_table():
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("""
                CREATE TABLE customers (
                    id serial PRIMARY KEY,
                    name varchar not null,
                    email varchar not null unique)
                """)
            conn.commit()
```
@z

@x
The function obtains a database connection using `get_connection()` and creates
the `customers` table. The `with` statement automatically closes the connection
when done.
@y
The function obtains a database connection using `get_connection()` and creates
the `customers` table. The `with` statement automatically closes the connection
when done.
@z

@x
Add the remaining CRUD functions:
@y
Add the remaining CRUD functions:
@z

@x
```python
def create_customer(name, email):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "INSERT INTO customers (name, email) VALUES (%s, %s)", (name, email))
            conn.commit()
@y
```python
def create_customer(name, email):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "INSERT INTO customers (name, email) VALUES (%s, %s)", (name, email))
            conn.commit()
@z

@x
def get_all_customers() -> list[Customer]:
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM customers")
            return [Customer(cid, name, email) for cid, name, email in cur]
@y
def get_all_customers() -> list[Customer]:
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM customers")
            return [Customer(cid, name, email) for cid, name, email in cur]
@z

@x
def get_customer_by_email(email) -> Customer:
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT id, name, email FROM customers WHERE email = %s", (email,))
            (cid, name, email) = cur.fetchone()
            return Customer(cid, name, email)
@y
def get_customer_by_email(email) -> Customer:
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT id, name, email FROM customers WHERE email = %s", (email,))
            (cid, name, email) = cur.fetchone()
            return Customer(cid, name, email)
@z

@x
def delete_all_customers():
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("DELETE FROM customers")
            conn.commit()
```
@y
def delete_all_customers():
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("DELETE FROM customers")
            conn.commit()
```
@z

@x
> [!NOTE]
> To keep it straightforward for this guide, each function creates a new
> connection. In a real-world application, use a connection pool to reuse
> connections.
@y
> [!NOTE]
> To keep it straightforward for this guide, each function creates a new
> connection. In a real-world application, use a connection pool to reuse
> connections.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
You'll create a PostgreSQL container using Testcontainers and use it for all
the tests. Before each test, you'll delete all customer records so that tests
run with a clean database.
@y
You'll create a PostgreSQL container using Testcontainers and use it for all
the tests. Before each test, you'll delete all customer records so that tests
run with a clean database.
@z

@x
### Set up pytest fixtures
@y
### Set up pytest fixtures
@z

@x
This guide uses [pytest fixtures](https://pytest.org/en/stable/how-to/fixtures.html)
for setup and teardown logic. A recommended approach is to use
[finalizers](https://pytest.org/en/stable/how-to/fixtures.html#adding-finalizers-directly)
to guarantee cleanup runs even if setup fails:
@y
This guide uses [pytest fixtures](https://pytest.org/en/stable/how-to/fixtures.html)
for setup and teardown logic. A recommended approach is to use
[finalizers](https://pytest.org/en/stable/how-to/fixtures.html#adding-finalizers-directly)
to guarantee cleanup runs even if setup fails:
@z

@x
```python
@pytest.fixture
def setup(request):
    # setup code
@y
```python
@pytest.fixture
def setup(request):
    # setup code
@z

@x
    def cleanup():
        # teardown code
@y
    def cleanup():
        # teardown code
@z

@x
    request.addfinalizer(cleanup)
    return some_value
```
@y
    request.addfinalizer(cleanup)
    return some_value
```
@z

@x
### Create the test file
@y
### Create the test file
@z

@x
Create a `tests/__init__.py` file with empty content to enable pytest
[auto-discovery](https://pytest.org/explanation/goodpractices.html#test-discovery).
@y
Create a `tests/__init__.py` file with empty content to enable pytest
[auto-discovery](https://pytest.org/explanation/goodpractices.html#test-discovery).
@z

@x
Then create `tests/test_customers.py` with the fixtures:
@y
Then create `tests/test_customers.py` with the fixtures:
@z

@x
```python
import os
import pytest
from testcontainers.postgres import PostgresContainer
@y
```python
import os
import pytest
from testcontainers.postgres import PostgresContainer
@z

@x
from customers import customers
@y
from customers import customers
@z

@x
postgres = PostgresContainer("postgres:16-alpine")
@y
postgres = PostgresContainer("postgres:16-alpine")
@z

@x
@pytest.fixture(scope="module", autouse=True)
def setup(request):
    postgres.start()
@y
@pytest.fixture(scope="module", autouse=True)
def setup(request):
    postgres.start()
@z

@x
    def remove_container():
        postgres.stop()
@y
    def remove_container():
        postgres.stop()
@z

@x
    request.addfinalizer(remove_container)
    os.environ["DB_CONN"] = postgres.get_connection_url()
    os.environ["DB_HOST"] = postgres.get_container_host_ip()
    os.environ["DB_PORT"] = str(postgres.get_exposed_port(5432))
    os.environ["DB_USERNAME"] = postgres.username
    os.environ["DB_PASSWORD"] = postgres.password
    os.environ["DB_NAME"] = postgres.dbname
    customers.create_table()
@y
    request.addfinalizer(remove_container)
    os.environ["DB_CONN"] = postgres.get_connection_url()
    os.environ["DB_HOST"] = postgres.get_container_host_ip()
    os.environ["DB_PORT"] = str(postgres.get_exposed_port(5432))
    os.environ["DB_USERNAME"] = postgres.username
    os.environ["DB_PASSWORD"] = postgres.password
    os.environ["DB_NAME"] = postgres.dbname
    customers.create_table()
@z

@x
@pytest.fixture(scope="function", autouse=True)
def setup_data():
    customers.delete_all_customers()
```
@y
@pytest.fixture(scope="function", autouse=True)
def setup_data():
    customers.delete_all_customers()
```
@z

@x
Here's what the fixtures do:
@y
Here's what the fixtures do:
@z

@x
- The `setup` fixture has `scope="module"`, so it runs once for all tests in
  the file. It starts a PostgreSQL container, sets environment variables with
  the connection details, and creates the `customers` table. A cleanup
  function removes the container after all tests complete.
- The `setup_data` fixture has `scope="function"`, so it runs before every
  test. It deletes all records to give each test a clean database.
@y
- The `setup` fixture has `scope="module"`, so it runs once for all tests in
  the file. It starts a PostgreSQL container, sets environment variables with
  the connection details, and creates the `customers` table. A cleanup
  function removes the container after all tests complete.
- The `setup_data` fixture has `scope="function"`, so it runs before every
  test. It deletes all records to give each test a clean database.
@z

@x
### Write the tests
@y
### Write the tests
@z

@x
Add the test functions to the same file:
@y
Add the test functions to the same file:
@z

@x
```python
def test_get_all_customers():
    customers.create_customer("Siva", "siva@gmail.com")
    customers.create_customer("James", "james@gmail.com")
    customers_list = customers.get_all_customers()
    assert len(customers_list) == 2
@y
```python
def test_get_all_customers():
    customers.create_customer("Siva", "siva@gmail.com")
    customers.create_customer("James", "james@gmail.com")
    customers_list = customers.get_all_customers()
    assert len(customers_list) == 2
@z

@x
def test_get_customer_by_email():
    customers.create_customer("John", "john@gmail.com")
    customer = customers.get_customer_by_email("john@gmail.com")
    assert customer.name == "John"
    assert customer.email == "john@gmail.com"
```
@y
def test_get_customer_by_email():
    customers.create_customer("John", "john@gmail.com")
    customer = customers.get_customer_by_email("john@gmail.com")
    assert customer.name == "John"
    assert customer.email == "john@gmail.com"
```
@z

@x
- `test_get_all_customers()` inserts two customer records, fetches all
  customers, and asserts the count.
- `test_get_customer_by_email()` inserts a customer, fetches it by email, and
  asserts the details.
@y
- `test_get_all_customers()` inserts two customer records, fetches all
  customers, and asserts the count.
- `test_get_customer_by_email()` inserts a customer, fetches it by email, and
  asserts the details.
@z

@x
Because `setup_data` deletes all records before each test, the tests can run in
any order.
@y
Because `setup_data` deletes all records before each test, the tests can run in
any order.
@z

@x
## Run tests and next steps
@y
## Run tests and next steps
@z

@x
### Run the tests
@y
### Run the tests
@z

@x
Run the tests using pytest:
@y
Run the tests using pytest:
@z

@x
```console
$ pytest -v
```
@y
```console
$ pytest -v
```
@z

@x
You should see output similar to:
@y
You should see output similar to:
@z

@x
```text
============================= test session starts ==============================
platform linux -- Python 3.13.x, pytest-9.x.x
collected 2 items
@y
```text
============================= test session starts ==============================
platform linux -- Python 3.13.x, pytest-9.x.x
collected 2 items
@z

@x
tests/test_customers.py::test_get_all_customers PASSED                   [ 50%]
tests/test_customers.py::test_get_customer_by_email PASSED               [100%]
@y
tests/test_customers.py::test_get_all_customers PASSED                   [ 50%]
tests/test_customers.py::test_get_customer_by_email PASSED               [100%]
@z

@x
============================== 2 passed in 1.90s ===============================
```
@y
============================== 2 passed in 1.90s ===============================
```
@z

@x
The tests run against a real PostgreSQL database instead of mocks, which gives
more confidence in the implementation.
@y
The tests run against a real PostgreSQL database instead of mocks, which gives
more confidence in the implementation.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers for Python library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Python library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to PostgreSQL, Testcontainers for Python provides modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
@y
In addition to PostgreSQL, Testcontainers for Python provides modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
@z

@x
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@y
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@z

@x
### Further reading
@y
### Further reading
@z

@x
- [testcontainers-python documentation](https://testcontainers-python.readthedocs.io/)
- [Getting started with Testcontainers for Go](/guides/testcontainers-go-getting-started/)
- [Getting started with Testcontainers for Java](https://testcontainers.com/guides/getting-started-with-testcontainers-for-java/)
- [Getting started with Testcontainers for Node.js](https://testcontainers.com/guides/getting-started-with-testcontainers-for-nodejs/)
@y
- [testcontainers-python documentation](https://testcontainers-python.readthedocs.io/)
- [Getting started with Testcontainers for Go](__SUBDIR__/guides/testcontainers-go-getting-started/)
- [Getting started with Testcontainers for Java](https://testcontainers.com/guides/getting-started-with-testcontainers-for-java/)
- [Getting started with Testcontainers for Node.js](https://testcontainers.com/guides/getting-started-with-testcontainers-for-nodejs/)
@z
