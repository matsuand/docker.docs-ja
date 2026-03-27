%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using testcontainers-python and pytest with a real PostgreSQL database.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using testcontainers-python and pytest with a real PostgreSQL database.
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
## Set up pytest fixtures
@y
## Set up pytest fixtures
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
## Create the test file
@y
## Create the test file
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
## Write the tests
@y
## Write the tests
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
