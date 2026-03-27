%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Reuse containers with test suites
linkTitle: Test suites
description: Share a single Postgres container across multiple tests using testify suites.
@y
title: Reuse containers with test suites
linkTitle: Test suites
description: Share a single Postgres container across multiple tests using testify suites.
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
## Extract container setup
@y
## Extract container setup
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
## Write the test suite
@y
## Write the test suite
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
