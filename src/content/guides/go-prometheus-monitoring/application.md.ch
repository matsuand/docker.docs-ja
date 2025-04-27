%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Building the application
linkTitle: Understand the application
@y
title: Building the application
linkTitle: Understand the application
@z

@x
keywords: go, golang, prometheus, grafana, containerize, monitor
description: Learn how to create a Golang server to register metrics with Prometheus.
@y
keywords: go, golang, prometheus, grafana, containerize, monitor
description: Learn how to create a Golang server to register metrics with Prometheus.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
* You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
You will be creating a Golang server with some endpoints to simulate a real-world application. Then you will expose metrics from the server using Prometheus.
@y
You will be creating a Golang server with some endpoints to simulate a real-world application. Then you will expose metrics from the server using Prometheus.
@z

@x
## Getting the sample application
@y
## Getting the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following
command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following
command to clone the repository:
@z

@x
```console
$ git clone https://github.com/dockersamples/go-prometheus-monitoring.git 
```
@y
```console
$ git clone https://github.com/dockersamples/go-prometheus-monitoring.git 
```
@z

@x
Once you cloned you will see the following content structure inside `go-prometheus-monitoring` directory,
@y
Once you cloned you will see the following content structure inside `go-prometheus-monitoring` directory,
@z

@x
```text
go-prometheus-monitoring
├── CONTRIBUTING.md
├── Docker
│   ├── grafana.yml
│   └── prometheus.yml
├── dashboard.json
├── Dockerfile
├── LICENSE
├── README.md
├── compose.yaml
├── go.mod
├── go.sum
└── main.go
```
@y
```text
go-prometheus-monitoring
├── CONTRIBUTING.md
├── Docker
│   ├── grafana.yml
│   └── prometheus.yml
├── dashboard.json
├── Dockerfile
├── LICENSE
├── README.md
├── compose.yaml
├── go.mod
├── go.sum
└── main.go
```
@z

@x
- **main.go** - The entry point of the application.
- **go.mod and go.sum** - Go module files.
- **Dockerfile** - Dockerfile used to build the app.
- **Docker/** - Contains the Docker Compose configuration files for Grafana and Prometheus.
- **compose.yaml** - Compose file to launch everything (Golang app, Prometheus, and Grafana).
- **dashboard.json** - Grafana dashboard configuration file.
- **Dockerfile** - Dockerfile used to build the Golang app.
- **compose.yaml** - Docker Compose file to launch everything (Golang app, Prometheus, and Grafana).
- Other files are for licensing and documentation purposes.
@y
- **main.go** - The entry point of the application.
- **go.mod and go.sum** - Go module files.
- **Dockerfile** - Dockerfile used to build the app.
- **Docker/** - Contains the Docker Compose configuration files for Grafana and Prometheus.
- **compose.yaml** - Compose file to launch everything (Golang app, Prometheus, and Grafana).
- **dashboard.json** - Grafana dashboard configuration file.
- **Dockerfile** - Dockerfile used to build the Golang app.
- **compose.yaml** - Docker Compose file to launch everything (Golang app, Prometheus, and Grafana).
- Other files are for licensing and documentation purposes.
@z

@x
## Understanding the application
@y
## Understanding the application
@z

@x
The following is the complete logic of the application you will find in `main.go`.
@y
The following is the complete logic of the application you will find in `main.go`.
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"strconv"
@y
import (
	"strconv"
@z

@x
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)
@y
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)
@z

@x
// Define metrics
var (
	HttpRequestTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_total",
		Help: "Total number of requests processed by the API",
	}, []string{"path", "status"})
@y
// Define metrics
var (
	HttpRequestTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_total",
		Help: "Total number of requests processed by the API",
	}, []string{"path", "status"})
@z

@x
	HttpRequestErrorTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_error_total",
		Help: "Total number of errors returned by the API",
	}, []string{"path", "status"})
)
@y
	HttpRequestErrorTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_error_total",
		Help: "Total number of errors returned by the API",
	}, []string{"path", "status"})
)
@z

@x
// Custom registry (without default Go metrics)
var customRegistry = prometheus.NewRegistry()
@y
// Custom registry (without default Go metrics)
var customRegistry = prometheus.NewRegistry()
@z

@x
// Register metrics with custom registry
func init() {
	customRegistry.MustRegister(HttpRequestTotal, HttpRequestErrorTotal)
}
@y
// Register metrics with custom registry
func init() {
	customRegistry.MustRegister(HttpRequestTotal, HttpRequestErrorTotal)
}
@z

@x
func main() {
	router := gin.Default()
@y
func main() {
	router := gin.Default()
@z

@x
	// Register /metrics before middleware
	router.GET("/metrics", PrometheusHandler())
@y
	// Register /metrics before middleware
	router.GET("/metrics", PrometheusHandler())
@z

@x
	router.Use(RequestMetricsMiddleware())
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Up and running!",
		})
	})
	router.GET("/v1/users", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello from /v1/users",
		})
	})
@y
	router.Use(RequestMetricsMiddleware())
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Up and running!",
		})
	})
	router.GET("/v1/users", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello from /v1/users",
		})
	})
@z

@x
	router.Run(":8000")
}
@y
	router.Run(":8000")
}
@z

@x
// Custom metrics handler with custom registry
func PrometheusHandler() gin.HandlerFunc {
	h := promhttp.HandlerFor(customRegistry, promhttp.HandlerOpts{})
	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}
@y
// Custom metrics handler with custom registry
func PrometheusHandler() gin.HandlerFunc {
	h := promhttp.HandlerFor(customRegistry, promhttp.HandlerOpts{})
	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}
@z

@x
// Middleware to record incoming requests metrics
func RequestMetricsMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path
		c.Next()
		status := c.Writer.Status()
		if status < 400 {
			HttpRequestTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		} else {
			HttpRequestErrorTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		}
	}
}
```
@y
// Middleware to record incoming requests metrics
func RequestMetricsMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path
		c.Next()
		status := c.Writer.Status()
		if status < 400 {
			HttpRequestTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		} else {
			HttpRequestErrorTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		}
	}
}
```
@z

@x
In this part of the code, you have imported the required packages `gin`, `prometheus`, and `promhttp`. Then you have defined a couple of variables, `HttpRequestTotal` and `HttpRequestErrorTotal` are Prometheus counter metrics, and `customRegistry` is a custom registry that will be used to register these metrics. The name of the metric is a string that you can use to identify the metric. The help string is a string that will be shown when you query the `/metrics` endpoint to understand the metric. The reason you are using the custom registry is so avoid the default Go metrics that are registered by default by the Prometheus client. Then using the `init` function you are registering the metrics with the custom registry. 
@y
In this part of the code, you have imported the required packages `gin`, `prometheus`, and `promhttp`. Then you have defined a couple of variables, `HttpRequestTotal` and `HttpRequestErrorTotal` are Prometheus counter metrics, and `customRegistry` is a custom registry that will be used to register these metrics. The name of the metric is a string that you can use to identify the metric. The help string is a string that will be shown when you query the `/metrics` endpoint to understand the metric. The reason you are using the custom registry is so avoid the default Go metrics that are registered by default by the Prometheus client. Then using the `init` function you are registering the metrics with the custom registry. 
@z

@x
```go
import (
	"strconv"
@y
```go
import (
	"strconv"
@z

@x
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)
@y
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)
@z

@x
// Define metrics
var (
	HttpRequestTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_total",
		Help: "Total number of requests processed by the API",
	}, []string{"path", "status"})
@y
// Define metrics
var (
	HttpRequestTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_total",
		Help: "Total number of requests processed by the API",
	}, []string{"path", "status"})
@z

@x
	HttpRequestErrorTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_error_total",
		Help: "Total number of errors returned by the API",
	}, []string{"path", "status"})
)
@y
	HttpRequestErrorTotal = prometheus.NewCounterVec(prometheus.CounterOpts{
		Name: "api_http_request_error_total",
		Help: "Total number of errors returned by the API",
	}, []string{"path", "status"})
)
@z

@x
// Custom registry (without default Go metrics)
var customRegistry = prometheus.NewRegistry()
@y
// Custom registry (without default Go metrics)
var customRegistry = prometheus.NewRegistry()
@z

@x
// Register metrics with custom registry
func init() {
	customRegistry.MustRegister(HttpRequestTotal, HttpRequestErrorTotal)
}
```
@y
// Register metrics with custom registry
func init() {
	customRegistry.MustRegister(HttpRequestTotal, HttpRequestErrorTotal)
}
```
@z

@x
In the `main` function, you have created a new instance of the `gin` framework and created three routes. You can see the health endpoint that is on path `/health` that will return a JSON with `{"message": "Up and running!"}` and the `/v1/users` endpoint that will return a JSON with `{"message": "Hello from /v1/users"}`. The third route is for the `/metrics` endpoint that will return the metrics in the Prometheus format. Then you have `RequestMetricsMiddleware` middleware, it will be called for every request made to the API. It will record the incoming requests metrics like status codes and paths. Finally, you are running the gin application on port 8000.
@y
In the `main` function, you have created a new instance of the `gin` framework and created three routes. You can see the health endpoint that is on path `/health` that will return a JSON with `{"message": "Up and running!"}` and the `/v1/users` endpoint that will return a JSON with `{"message": "Hello from /v1/users"}`. The third route is for the `/metrics` endpoint that will return the metrics in the Prometheus format. Then you have `RequestMetricsMiddleware` middleware, it will be called for every request made to the API. It will record the incoming requests metrics like status codes and paths. Finally, you are running the gin application on port 8000.
@z

@x
```golang
func main() {
	router := gin.Default()
@y
```golang
func main() {
	router := gin.Default()
@z

@x
	// Register /metrics before middleware
	router.GET("/metrics", PrometheusHandler())
@y
	// Register /metrics before middleware
	router.GET("/metrics", PrometheusHandler())
@z

@x
	router.Use(RequestMetricsMiddleware())
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Up and running!",
		})
	})
	router.GET("/v1/users", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello from /v1/users",
		})
	})
@y
	router.Use(RequestMetricsMiddleware())
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Up and running!",
		})
	})
	router.GET("/v1/users", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello from /v1/users",
		})
	})
@z

@x
	router.Run(":8000")
}
```
@y
	router.Run(":8000")
}
```
@z

@x
Now comes the middleware function `RequestMetricsMiddleware`. This function is called for every request made to the API. It increments the `HttpRequestTotal` counter (different counter for different paths and status codes) if the status code is less than or equal to 400. If the status code is greater than 400, it increments the `HttpRequestErrorTotal` counter (different counter for different paths and status codes). The `PrometheusHandler` function is the custom handler that will be called for the `/metrics` endpoint. It will return the metrics in the Prometheus format.
@y
Now comes the middleware function `RequestMetricsMiddleware`. This function is called for every request made to the API. It increments the `HttpRequestTotal` counter (different counter for different paths and status codes) if the status code is less than or equal to 400. If the status code is greater than 400, it increments the `HttpRequestErrorTotal` counter (different counter for different paths and status codes). The `PrometheusHandler` function is the custom handler that will be called for the `/metrics` endpoint. It will return the metrics in the Prometheus format.
@z

@x
```golang
// Custom metrics handler with custom registry
func PrometheusHandler() gin.HandlerFunc {
	h := promhttp.HandlerFor(customRegistry, promhttp.HandlerOpts{})
	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}
@y
```golang
// Custom metrics handler with custom registry
func PrometheusHandler() gin.HandlerFunc {
	h := promhttp.HandlerFor(customRegistry, promhttp.HandlerOpts{})
	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}
@z

@x
// Middleware to record incoming requests metrics
func RequestMetricsMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path
		c.Next()
		status := c.Writer.Status()
		if status < 400 {
			HttpRequestTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		} else {
			HttpRequestErrorTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		}
	}
}
```
@y
// Middleware to record incoming requests metrics
func RequestMetricsMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path
		c.Next()
		status := c.Writer.Status()
		if status < 400 {
			HttpRequestTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		} else {
			HttpRequestErrorTotal.WithLabelValues(path, strconv.Itoa(status)).Inc()
		}
	}
}
```
@z

@x
That's it, this was the complete gist of the application. Now it's time to run and test if the app is registering metrics correctly.
@y
That's it, this was the complete gist of the application. Now it's time to run and test if the app is registering metrics correctly.
@z

@x
## Running the application
@y
## Running the application
@z

@x
Make sure you are still inside `go-prometheus-monitoring` directory in the terminal, and run the following command. Install the dependencies by running `go mod tidy` and then build and run the application by running `go run main.go`. Then visit `http://localhost:8000/health` or `http://localhost:8000/v1/users`. You should see the output `{"message": "Up and running!"}` or `{"message": "Hello from /v1/users"}`. If you are able to see this then your app is successfully up and running. 
@y
Make sure you are still inside `go-prometheus-monitoring` directory in the terminal, and run the following command. Install the dependencies by running `go mod tidy` and then build and run the application by running `go run main.go`. Then visit `http://localhost:8000/health` or `http://localhost:8000/v1/users`. You should see the output `{"message": "Up and running!"}` or `{"message": "Hello from /v1/users"}`. If you are able to see this then your app is successfully up and running. 
@z

@x
Now, check your application's metrics by accessing the `/metrics` endpoint. 
Open `http://localhost:8000/metrics` in your browser. You should see similar output to the following.
@y
Now, check your application's metrics by accessing the `/metrics` endpoint. 
Open `http://localhost:8000/metrics` in your browser. You should see similar output to the following.
@z

@x
```sh
# HELP api_http_request_error_total Total number of errors returned by the API
# TYPE api_http_request_error_total counter
api_http_request_error_total{path="/",status="404"} 1
api_http_request_error_total{path="//v1/users",status="404"} 1
api_http_request_error_total{path="/favicon.ico",status="404"} 1
# HELP api_http_request_total Total number of requests processed by the API
# TYPE api_http_request_total counter
api_http_request_total{path="/health",status="200"} 2
api_http_request_total{path="/v1/users",status="200"} 1
```
@y
```sh
# HELP api_http_request_error_total Total number of errors returned by the API
# TYPE api_http_request_error_total counter
api_http_request_error_total{path="/",status="404"} 1
api_http_request_error_total{path="//v1/users",status="404"} 1
api_http_request_error_total{path="/favicon.ico",status="404"} 1
# HELP api_http_request_total Total number of requests processed by the API
# TYPE api_http_request_total counter
api_http_request_total{path="/health",status="200"} 2
api_http_request_total{path="/v1/users",status="200"} 1
```
@z

@x
In the terminal, press `ctrl` + `c` to stop the application.
@y
In the terminal, press `ctrl` + `c` to stop the application.
@z

@x
> [!Note]
> If you don't want to run the application locally, and want to run it in a Docker container, skip to next page where you create a Dockerfile and containerize the application.
@y
> [!Note]
> If you don't want to run the application locally, and want to run it in a Docker container, skip to next page where you create a Dockerfile and containerize the application.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to create a Golang app to register metrics with Prometheus. By implementing middleware functions, you were able to increment the counters based on the request path and status codes.
@y
In this section, you learned how to create a Golang app to register metrics with Prometheus. By implementing middleware functions, you were able to increment the counters based on the request path and status codes.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to containerize your application.
@y
In the next section, you'll learn how to containerize your application.
@z
