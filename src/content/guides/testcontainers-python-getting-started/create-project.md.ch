%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Python project
linkTitle: Create the project
description: Set up a Python project with a PostgreSQL-backed customer service.
@y
title: Create the Python project
linkTitle: Create the project
description: Set up a Python project with a PostgreSQL-backed customer service.
@z

@x
## Initialize the project
@y
## Initialize the project
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
## Create the database helper
@y
## Create the database helper
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
## Create the business logic
@y
## Create the business logic
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
