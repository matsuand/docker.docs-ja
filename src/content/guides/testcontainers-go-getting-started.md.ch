%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for Go
linkTitle: Testcontainers for Go
description: Learn how to use Testcontainers for Go to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, go, golang, testing, postgresql, integration testing
summary: |
  Learn how to create a Go application and test database interactions
  using Testcontainers for Go with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for Go
linkTitle: Testcontainers for Go
description: Learn how to use Testcontainers for Go to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, go, golang, testing, postgresql, integration testing
summary: |
  Learn how to create a Go application and test database interactions
  using Testcontainers for Go with a real PostgreSQL instance.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-go -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-go -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Go application with modules support
- Implement a Repository to manage customer data in a PostgreSQL database using the pgx driver
- Write integration tests using testcontainers-go
- Reuse containers across multiple tests using test suites
@y
- Create a Go application with modules support
- Implement a Repository to manage customer data in a PostgreSQL database using the pgx driver
- Write integration tests using testcontainers-go
- Reuse containers across multiple tests using test suites
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Go 1.25+
- Your preferred IDE (VS Code, GoLand)
- A Docker environment supported by Testcontainers. For details, see
  the [testcontainers-go system requirements](https://golang.testcontainers.org/system_requirements/).
@y
- Go 1.25+
- Your preferred IDE (VS Code, GoLand)
- A Docker environment supported by Testcontainers. For details, see
  the [testcontainers-go system requirements](https://golang.testcontainers.org/system_requirements/).
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
## Create the Go project
@y
## Create the Go project
@z

@x
### Initialize the project
@y
### Initialize the project
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
### Create Customer struct
@y
### Create Customer struct
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
### Create Repository
@y
### Create Repository
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

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
You have the `Repository` implementation ready, but for testing you need a
PostgreSQL database. You can use testcontainers-go to spin up a Postgres
database in a Docker container and run your tests against that database.
@y
You have the `Repository` implementation ready, but for testing you need a
PostgreSQL database. You can use testcontainers-go to spin up a Postgres
database in a Docker container and run your tests against that database.
@z

@x
### Set up the test database
@y
### Set up the test database
@z

@x
In real applications you might use a database migration tool, but for this
guide, use a script to initialize the database.
@y
In real applications you might use a database migration tool, but for this
guide, use a script to initialize the database.
@z

@x
Create a `testdata/init-db.sql` file to create the `CUSTOMERS` table and
insert sample data:
@y
Create a `testdata/init-db.sql` file to create the `CUSTOMERS` table and
insert sample data:
@z

@x
```sql
CREATE TABLE IF NOT EXISTS customers (id serial, name varchar(255), email varchar(255));
@y
```sql
CREATE TABLE IF NOT EXISTS customers (id serial, name varchar(255), email varchar(255));
@z

@x
INSERT INTO customers(name, email) VALUES ('John', 'john@gmail.com');
```
@y
INSERT INTO customers(name, email) VALUES ('John', 'john@gmail.com');
```
@z

@x
### Understand the testcontainers-go API
@y
### Understand the testcontainers-go API
@z

@x
The testcontainers-go library provides the generic `Container` abstraction
that can run any containerized service. To further simplify, testcontainers-go
provides technology-specific modules that reduce boilerplate and provide a
functional options pattern to construct the container instance.
@y
The testcontainers-go library provides the generic `Container` abstraction
that can run any containerized service. To further simplify, testcontainers-go
provides technology-specific modules that reduce boilerplate and provide a
functional options pattern to construct the container instance.
@z

@x
For example, `PostgresContainer` provides `WithDatabase()`,
`WithUsername()`, `WithPassword()`, and other functions to set various
properties of Postgres containers.
@y
For example, `PostgresContainer` provides `WithDatabase()`,
`WithUsername()`, `WithPassword()`, and other functions to set various
properties of Postgres containers.
@z

@x
### Write the test
@y
### Write the test
@z

@x
Create the `customer/repo_test.go` file and implement the test:
@y
Create the `customer/repo_test.go` file and implement the test:
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
	"path/filepath"
	"testing"
@y
import (
	"context"
	"path/filepath"
	"testing"
@z

@x
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/modules/postgres"
)
@y
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/modules/postgres"
)
@z

@x
func TestCustomerRepository(t *testing.T) {
	ctx := context.Background()
@y
func TestCustomerRepository(t *testing.T) {
	ctx := context.Background()
@z

@x
	ctr, err := postgres.Run(ctx,
		"postgres:16-alpine",
		postgres.WithInitScripts(filepath.Join("..", "testdata", "init-db.sql")),
		postgres.WithDatabase("test-db"),
		postgres.WithUsername("postgres"),
		postgres.WithPassword("postgres"),
		postgres.BasicWaitStrategies(),
	)
	testcontainers.CleanupContainer(t, ctr)
	require.NoError(t, err)
@y
	ctr, err := postgres.Run(ctx,
		"postgres:16-alpine",
		postgres.WithInitScripts(filepath.Join("..", "testdata", "init-db.sql")),
		postgres.WithDatabase("test-db"),
		postgres.WithUsername("postgres"),
		postgres.WithPassword("postgres"),
		postgres.BasicWaitStrategies(),
	)
	testcontainers.CleanupContainer(t, ctr)
	require.NoError(t, err)
@z

@x
	connStr, err := ctr.ConnectionString(ctx, "sslmode=disable")
	require.NoError(t, err)
@y
	connStr, err := ctr.ConnectionString(ctx, "sslmode=disable")
	require.NoError(t, err)
@z

@x
	customerRepo, err := NewRepository(ctx, connStr)
	require.NoError(t, err)
@y
	customerRepo, err := NewRepository(ctx, connStr)
	require.NoError(t, err)
@z

@x
	c, err := customerRepo.CreateCustomer(ctx, Customer{
		Name:  "Henry",
		Email: "henry@gmail.com",
	})
	assert.NoError(t, err)
	assert.NotNil(t, c)
@y
	c, err := customerRepo.CreateCustomer(ctx, Customer{
		Name:  "Henry",
		Email: "henry@gmail.com",
	})
	assert.NoError(t, err)
	assert.NotNil(t, c)
@z

@x
	customer, err := customerRepo.GetCustomerByEmail(ctx, "henry@gmail.com")
	assert.NoError(t, err)
	assert.NotNil(t, customer)
	assert.Equal(t, "Henry", customer.Name)
	assert.Equal(t, "henry@gmail.com", customer.Email)
}
```
@y
	customer, err := customerRepo.GetCustomerByEmail(ctx, "henry@gmail.com")
	assert.NoError(t, err)
	assert.NotNil(t, customer)
	assert.Equal(t, "Henry", customer.Name)
	assert.Equal(t, "henry@gmail.com", customer.Email)
}
```
@z

@x
Here's what the test does:
@y
Here's what the test does:
@z

@x
- Calls `postgres.Run()` with the `postgres:16-alpine` Docker image as the
  first argument. This is the v0.41.0 API — the image is a required positional
  parameter instead of an option.
- Configures initialization scripts using `WithInitScripts(...)` so that the
  `CUSTOMERS` table is created and sample data is inserted after the database
  starts.
- Uses `postgres.BasicWaitStrategies()` which combines waiting for the Postgres
  log message and for the port to be ready. This replaces manual wait strategy
  configuration.
- Calls `testcontainers.CleanupContainer(t, ctr)` right after `postgres.Run()`.
  This registers automatic cleanup with the test framework, replacing the manual
  `t.Cleanup` and `Terminate` pattern.
- Obtains the database `ConnectionString` from the container and initializes a
  `Repository`.
- Creates a customer with the email `henry@gmail.com` and verifies that the
  customer exists in the database.
@y
- Calls `postgres.Run()` with the `postgres:16-alpine` Docker image as the
  first argument. This is the v0.41.0 API — the image is a required positional
  parameter instead of an option.
- Configures initialization scripts using `WithInitScripts(...)` so that the
  `CUSTOMERS` table is created and sample data is inserted after the database
  starts.
- Uses `postgres.BasicWaitStrategies()` which combines waiting for the Postgres
  log message and for the port to be ready. This replaces manual wait strategy
  configuration.
- Calls `testcontainers.CleanupContainer(t, ctr)` right after `postgres.Run()`.
  This registers automatic cleanup with the test framework, replacing the manual
  `t.Cleanup` and `Terminate` pattern.
- Obtains the database `ConnectionString` from the container and initializes a
  `Repository`.
- Creates a customer with the email `henry@gmail.com` and verifies that the
  customer exists in the database.
@z

@x
## Reuse containers with test suites
@y
## Reuse containers with test suites
@z

@x
In the previous section, you saw how to spin up a Postgres Docker container
for a single test. But often you have multiple tests in a single file, and you
may want to reuse the same Postgres Docker container for all of them.
@y
In the previous section, you saw how to spin up a Postgres Docker container
for a single test. But often you have multiple tests in a single file, and you
may want to reuse the same Postgres Docker container for all of them.
@z

@x
You can use the [testify suite](https://pkg.go.dev/github.com/stretchr/testify/suite)
package to implement common test setup and teardown actions.
@y
You can use the [testify suite](https://pkg.go.dev/github.com/stretchr/testify/suite)
package to implement common test setup and teardown actions.
@z

@x
### Extract container setup
@y
### Extract container setup
@z

@x
First, extract the `PostgresContainer` creation logic into a separate file
called `testhelpers/containers.go`:
@y
First, extract the `PostgresContainer` creation logic into a separate file
called `testhelpers/containers.go`:
@z

@x
```go
package testhelpers
@y
```go
package testhelpers
@z

@x
import (
	"context"
	"path/filepath"
	"testing"
@y
import (
	"context"
	"path/filepath"
	"testing"
@z

@x
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/modules/postgres"
)
@y
	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/modules/postgres"
)
@z

@x
type PostgresContainer struct {
	*postgres.PostgresContainer
	ConnectionString string
}
@y
type PostgresContainer struct {
	*postgres.PostgresContainer
	ConnectionString string
}
@z

@x
func CreatePostgresContainer(t *testing.T, ctx context.Context) *PostgresContainer {
	t.Helper()
@y
func CreatePostgresContainer(t *testing.T, ctx context.Context) *PostgresContainer {
	t.Helper()
@z

@x
	ctr, err := postgres.Run(ctx,
		"postgres:16-alpine",
		postgres.WithInitScripts(filepath.Join("..", "testdata", "init-db.sql")),
		postgres.WithDatabase("test-db"),
		postgres.WithUsername("postgres"),
		postgres.WithPassword("postgres"),
		postgres.BasicWaitStrategies(),
	)
	testcontainers.CleanupContainer(t, ctr)
	require.NoError(t, err)
@y
	ctr, err := postgres.Run(ctx,
		"postgres:16-alpine",
		postgres.WithInitScripts(filepath.Join("..", "testdata", "init-db.sql")),
		postgres.WithDatabase("test-db"),
		postgres.WithUsername("postgres"),
		postgres.WithPassword("postgres"),
		postgres.BasicWaitStrategies(),
	)
	testcontainers.CleanupContainer(t, ctr)
	require.NoError(t, err)
@z

@x
	connStr, err := ctr.ConnectionString(ctx, "sslmode=disable")
	require.NoError(t, err)
@y
	connStr, err := ctr.ConnectionString(ctx, "sslmode=disable")
	require.NoError(t, err)
@z

@x
	return &PostgresContainer{
		PostgresContainer: ctr,
		ConnectionString:  connStr,
	}
}
```
@y
	return &PostgresContainer{
		PostgresContainer: ctr,
		ConnectionString:  connStr,
	}
}
```
@z

@x
In `containers.go`, `PostgresContainer` extends the testcontainers-go
`PostgresContainer` to provide easy access to `ConnectionString`. The
`CreatePostgresContainer()` function accepts `*testing.T` as its first
parameter, calls `t.Helper()` so that test failures point to the caller,
and uses `testcontainers.CleanupContainer()` to register automatic cleanup.
@y
In `containers.go`, `PostgresContainer` extends the testcontainers-go
`PostgresContainer` to provide easy access to `ConnectionString`. The
`CreatePostgresContainer()` function accepts `*testing.T` as its first
parameter, calls `t.Helper()` so that test failures point to the caller,
and uses `testcontainers.CleanupContainer()` to register automatic cleanup.
@z

@x
### Write the test suite
@y
### Write the test suite
@z

@x
Create `customer/repo_suite_test.go` and implement tests for creating
a customer and getting a customer by email using the testify suite package:
@y
Create `customer/repo_suite_test.go` and implement tests for creating
a customer and getting a customer by email using the testify suite package:
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
	"testing"
@y
import (
	"context"
	"testing"
@z

@x
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/stretchr/testify/suite"
	"github.com/testcontainers/testcontainers-go-demo/testhelpers"
)
@y
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/stretchr/testify/suite"
	"github.com/testcontainers/testcontainers-go-demo/testhelpers"
)
@z

@x
type CustomerRepoTestSuite struct {
	suite.Suite
	pgContainer *testhelpers.PostgresContainer
	repository  *Repository
	ctx         context.Context
}
@y
type CustomerRepoTestSuite struct {
	suite.Suite
	pgContainer *testhelpers.PostgresContainer
	repository  *Repository
	ctx         context.Context
}
@z

@x
func (suite *CustomerRepoTestSuite) SetupSuite() {
	suite.ctx = context.Background()
	suite.pgContainer = testhelpers.CreatePostgresContainer(suite.T(), suite.ctx)
@y
func (suite *CustomerRepoTestSuite) SetupSuite() {
	suite.ctx = context.Background()
	suite.pgContainer = testhelpers.CreatePostgresContainer(suite.T(), suite.ctx)
@z

@x
	repository, err := NewRepository(suite.ctx, suite.pgContainer.ConnectionString)
	require.NoError(suite.T(), err)
	suite.repository = repository
}
@y
	repository, err := NewRepository(suite.ctx, suite.pgContainer.ConnectionString)
	require.NoError(suite.T(), err)
	suite.repository = repository
}
@z

@x
func (suite *CustomerRepoTestSuite) TestCreateCustomer() {
	t := suite.T()
@y
func (suite *CustomerRepoTestSuite) TestCreateCustomer() {
	t := suite.T()
@z

@x
	customer, err := suite.repository.CreateCustomer(suite.ctx, Customer{
		Name:  "Henry",
		Email: "henry@gmail.com",
	})
	require.NoError(t, err)
	assert.NotNil(t, customer.Id)
}
@y
	customer, err := suite.repository.CreateCustomer(suite.ctx, Customer{
		Name:  "Henry",
		Email: "henry@gmail.com",
	})
	require.NoError(t, err)
	assert.NotNil(t, customer.Id)
}
@z

@x
func (suite *CustomerRepoTestSuite) TestGetCustomerByEmail() {
	t := suite.T()
@y
func (suite *CustomerRepoTestSuite) TestGetCustomerByEmail() {
	t := suite.T()
@z

@x
	customer, err := suite.repository.GetCustomerByEmail(suite.ctx, "john@gmail.com")
	require.NoError(t, err)
	assert.Equal(t, "John", customer.Name)
	assert.Equal(t, "john@gmail.com", customer.Email)
}
@y
	customer, err := suite.repository.GetCustomerByEmail(suite.ctx, "john@gmail.com")
	require.NoError(t, err)
	assert.Equal(t, "John", customer.Name)
	assert.Equal(t, "john@gmail.com", customer.Email)
}
@z

@x
func TestCustomerRepoTestSuite(t *testing.T) {
	suite.Run(t, new(CustomerRepoTestSuite))
}
```
@y
func TestCustomerRepoTestSuite(t *testing.T) {
	suite.Run(t, new(CustomerRepoTestSuite))
}
```
@z

@x
Here's what the code does:
@y
Here's what the code does:
@z

@x
- `CustomerRepoTestSuite` extends `suite.Suite` and includes fields shared
  across multiple tests.
- `SetupSuite()` runs once before all tests. It calls
  `CreatePostgresContainer(suite.T(), ...)` which handles cleanup registration
  automatically via `CleanupContainer`, so no `TearDownSuite()` is needed.
- `TestCreateCustomer()` uses `require.NoError()` for the create operation
  (fail immediately if it errors) and `assert.NotNil()` for the ID check.
- `TestGetCustomerByEmail()` uses `require.NoError()` then asserts on the
  returned values.
- `TestCustomerRepoTestSuite(t *testing.T)` runs the test suite when you
  execute `go test`.
@y
- `CustomerRepoTestSuite` extends `suite.Suite` and includes fields shared
  across multiple tests.
- `SetupSuite()` runs once before all tests. It calls
  `CreatePostgresContainer(suite.T(), ...)` which handles cleanup registration
  automatically via `CleanupContainer`, so no `TearDownSuite()` is needed.
- `TestCreateCustomer()` uses `require.NoError()` for the create operation
  (fail immediately if it errors) and `assert.NotNil()` for the ID check.
- `TestGetCustomerByEmail()` uses `require.NoError()` then asserts on the
  returned values.
- `TestCustomerRepoTestSuite(t *testing.T)` runs the test suite when you
  execute `go test`.
@z

@x
> [!TIP]
> For the purpose of this guide, the tests don't reset data in the database.
> In practice, it's a good idea to reset the database to a known state before
> running each test.
@y
> [!TIP]
> For the purpose of this guide, the tests don't reset data in the database.
> In practice, it's a good idea to reset the database to a known state before
> running each test.
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
Run all the tests using `go test ./...`. Optionally add the `-v` flag for
verbose output:
@y
Run all the tests using `go test ./...`. Optionally add the `-v` flag for
verbose output:
@z

@x
```console
$ go test -v ./...
```
@y
```console
$ go test -v ./...
```
@z

@x
You should see two Postgres Docker containers start automatically: one for the
suite and its two tests, and another for the initial standalone test. All tests
should pass. After the tests finish, the containers are stopped and removed
automatically.
@y
You should see two Postgres Docker containers start automatically: one for the
suite and its two tests, and another for the initial standalone test. All tests
should pass. After the tests finish, the containers are stopped and removed
automatically.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers for Go library helps you write integration tests by using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Go library helps you write integration tests by using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
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
- [Testcontainers for Go documentation](https://golang.testcontainers.org/)
- [Testcontainers for Go quickstart](https://golang.testcontainers.org/quickstart/)
- [Testcontainers Postgres module for Go](https://golang.testcontainers.org/modules/postgres/)
@y
- [Testcontainers for Go documentation](https://golang.testcontainers.org/)
- [Testcontainers for Go quickstart](https://golang.testcontainers.org/quickstart/)
- [Testcontainers Postgres module for Go](https://golang.testcontainers.org/modules/postgres/)
@z
