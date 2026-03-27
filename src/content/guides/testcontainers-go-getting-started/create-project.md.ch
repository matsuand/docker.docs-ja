%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Go project
linkTitle: Create the project
description: Set up a Go project with a PostgreSQL-backed repository.
@y
title: Create the Go project
linkTitle: Create the project
description: Set up a Go project with a PostgreSQL-backed repository.
@z

@x
## Initialize the project
@y
## Initialize the project
@z

@x
Start by creating a Go project.
@y
Start by creating a Go project.
@z

@x
```console
$ mkdir testcontainers-go-demo
$ cd testcontainers-go-demo
$ go mod init github.com/testcontainers/testcontainers-go-demo
```
@y
```console
$ mkdir testcontainers-go-demo
$ cd testcontainers-go-demo
$ go mod init github.com/testcontainers/testcontainers-go-demo
```
@z

@x
This guide uses the [jackc/pgx](https://github.com/jackc/pgx) PostgreSQL
driver to interact with the Postgres database and the testcontainers-go
[Postgres module](https://golang.testcontainers.org/modules/postgres/) to
spin up a Postgres Docker instance for testing. It also uses
[testify](https://github.com/stretchr/testify) for running multiple tests
as a suite and for writing assertions.
@y
This guide uses the [jackc/pgx](https://github.com/jackc/pgx) PostgreSQL
driver to interact with the Postgres database and the testcontainers-go
[Postgres module](https://golang.testcontainers.org/modules/postgres/) to
spin up a Postgres Docker instance for testing. It also uses
[testify](https://github.com/stretchr/testify) for running multiple tests
as a suite and for writing assertions.
@z

@x
Install these dependencies:
@y
Install these dependencies:
@z

@x
```console
$ go get github.com/jackc/pgx/v5
$ go get github.com/testcontainers/testcontainers-go
$ go get github.com/testcontainers/testcontainers-go/modules/postgres
$ go get github.com/stretchr/testify
```
@y
```console
$ go get github.com/jackc/pgx/v5
$ go get github.com/testcontainers/testcontainers-go
$ go get github.com/testcontainers/testcontainers-go/modules/postgres
$ go get github.com/stretchr/testify
```
@z

@x
## Create Customer struct
@y
## Create Customer struct
@z

@x
Create a `types.go` file in the `customer` package and define the `Customer`
struct to model the customer details:
@y
Create a `types.go` file in the `customer` package and define the `Customer`
struct to model the customer details:
@z

@x
```go
package customer
@y
```go
package customer
@z

@x
type Customer struct {
	Id    int
	Name  string
	Email string
}
```
@y
type Customer struct {
	Id    int
	Name  string
	Email string
}
```
@z

@x
## Create Repository
@y
## Create Repository
@z

@x
Next, create `customer/repo.go`, define the `Repository` struct, and add
methods to create a customer and get a customer by email:
@y
Next, create `customer/repo.go`, define the `Repository` struct, and add
methods to create a customer and get a customer by email:
@z

@x
```go
package customer
@y
```go
package customer
@z

@x
import (
	"context"
	"fmt"
	"os"
@y
import (
	"context"
	"fmt"
	"os"
@z

@x
	"github.com/jackc/pgx/v5"
)
@y
	"github.com/jackc/pgx/v5"
)
@z

@x
type Repository struct {
	conn *pgx.Conn
}
@y
type Repository struct {
	conn *pgx.Conn
}
@z

@x
func NewRepository(ctx context.Context, connStr string) (*Repository, error) {
	conn, err := pgx.Connect(ctx, connStr)
	if err != nil {
		_, _ = fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		return nil, err
	}
	return &Repository{
		conn: conn,
	}, nil
}
@y
func NewRepository(ctx context.Context, connStr string) (*Repository, error) {
	conn, err := pgx.Connect(ctx, connStr)
	if err != nil {
		_, _ = fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		return nil, err
	}
	return &Repository{
		conn: conn,
	}, nil
}
@z

@x
func (r Repository) CreateCustomer(ctx context.Context, customer Customer) (Customer, error) {
	err := r.conn.QueryRow(ctx,
		"INSERT INTO customers (name, email) VALUES ($1, $2) RETURNING id",
		customer.Name, customer.Email).Scan(&customer.Id)
	return customer, err
}
@y
func (r Repository) CreateCustomer(ctx context.Context, customer Customer) (Customer, error) {
	err := r.conn.QueryRow(ctx,
		"INSERT INTO customers (name, email) VALUES ($1, $2) RETURNING id",
		customer.Name, customer.Email).Scan(&customer.Id)
	return customer, err
}
@z

@x
func (r Repository) GetCustomerByEmail(ctx context.Context, email string) (Customer, error) {
	var customer Customer
	query := "SELECT id, name, email FROM customers WHERE email = $1"
	err := r.conn.QueryRow(ctx, query, email).
		Scan(&customer.Id, &customer.Name, &customer.Email)
	if err != nil {
		return Customer{}, err
	}
	return customer, nil
}
```
@y
func (r Repository) GetCustomerByEmail(ctx context.Context, email string) (Customer, error) {
	var customer Customer
	query := "SELECT id, name, email FROM customers WHERE email = $1"
	err := r.conn.QueryRow(ctx, query, email).
		Scan(&customer.Id, &customer.Name, &customer.Email)
	if err != nil {
		return Customer{}, err
	}
	return customer, nil
}
```
@z

@x
Here's what the code does:
@y
Here's what the code does:
@z

@x
- `Repository` holds a `*pgx.Conn` for performing database operations.
- `NewRepository(connStr)` takes a database connection string and initializes a `Repository`.
- `CreateCustomer()` and `GetCustomerByEmail()` are methods on the `Repository` receiver that insert and query customer records.
@y
- `Repository` holds a `*pgx.Conn` for performing database operations.
- `NewRepository(connStr)` takes a database connection string and initializes a `Repository`.
- `CreateCustomer()` and `GetCustomerByEmail()` are methods on the `Repository` receiver that insert and query customer records.
@z
