%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
samples:
# Awesome Compose ----------------------------
  - title: ASP.NET / MS-SQL 
    url: https://github.com/docker/awesome-compose/tree/master/aspnet-mssql
    description: A sample ASP.NET core application with MS SQL server database.
    services:
      - .net
      - ms-sql
  - title: Elasticsearch / Logstash / Kibana
    url: https://github.com/docker/awesome-compose/tree/master/elasticsearch-logstash-kibana
    description: A sample Elasticsearch, Logstash, and Kibana stack.
    services:
      - elasticsearch
      - logstash
      - kibana
      - elk
  - title: Go / NGINX / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql
    description: A sample Go application with an Nginx proxy and a MySQL database.
    services: 
      - go
      - nginx
      - mysql
  - title: Go / NGINX / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang-postgres
    description: A sample Go application with an Nginx proxy and a PostgreSQL database.
    services:
      - go
      - nginx
      - postgresql
  - title: Java Spark / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/sparkjava-mysql
    description: A sample Java application and a MySQL database. 
    services:
      - spark
      - java
      - mysql
  - title: NGINX / ASP.NET / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-aspnet-mysql
    description: A sample Nginx reverse proxy with an C# backend using ASP.NET.
    services: 
      - nginx
      - .net
      - mysql
  - title: NGINX / Flask / MongoDB 
    url: https://github.com/docker/awesome-compose/tree/master/nginx-flask-mongo
    description: A sample Python/Flask application with Nginx proxy and a Mongo database.
    services:
      - nginx
      - flask
      - mongodb
      - python
  - title: NGINX / Flask / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-flask-mysql
    description: A sample Python/Flask application with an Nginx proxy and a MySQL database.
    services:
      - nginx
      - flask
      - python
      - mysql
  - title: NGINX / Node.js / Redis
    url: https://github.com/docker/awesome-compose/tree/master/nginx-nodejs-redis
    description: A sample Node.js application with Nginx proxy and a Redis database.
    services:
      - nginx
      - nodejs
      - redis
      - javascript
  - title: NGINX / Go
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang
    description: A sample Nginx proxy with a Go backend.
    services:
      - nginx
      - go
  - title: NGINX / WSGI / Flask
    url: https://github.com/docker/awesome-compose/tree/master/nginx-wsgi-flask
    description: A sample Nginx reverse proxy with a Flask backend using WSGI.
    services:
      - nginx
      - flask
      - python
      - wsgi
  - title: PostgreSQL / pgAdmin
    url: https://github.com/docker/awesome-compose/tree/master/postgresql-pgadmin
    description: A sample setup for postgreSQL database with pgAdmin web interface.
    services:
      - postgresql
      - pgadmin
  - title: Python / Flask / Redis
    url: https://github.com/docker/awesome-compose/tree/master/flask-redis
    description: A sample Python/Flask and a Redis database.
    services:
      - python
      - flask
      - redis
  - title: React / Spring / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/react-java-mysql
    description: A sample React application with a Spring backend and a MySQL database.
    services:
      - react
      - spring
      - java
      - javascript
      - mysql
  - title: React / Express / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/react-express-mysql
    description: A sample React application with a Node.js backend and a MySQL database.
    services:
      - react
      - javascript
      - express
      - mysql
      - nodejs
  - title: React / Express / MongoDB 
    url: https://github.com/docker/awesome-compose/tree/master/react-express-mongodb
    description: A sample React application with a Node.js backend and a Mongo database.
    services:
      - react
      - javascript
      - express
      - nodejs
      - mongodb
  - title: React / Rust / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/react-rust-postgres
    description: A sample React application with a Rust backend and a Postgres database.
    services:
      - react
      - rust
      - postgresql
      - javascript
  - title: React / NGINX
    url: https://github.com/docker/awesome-compose/tree/master/react-nginx
    description: A sample React application with Nginx.
    services:
      - react
      - javascript
      - nginx
  - title: Spring / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/spring-postgres
    description: A sample Java application with Spring framework and a Postgres database.
    services:
      - java
      - spring
      - postgresql
  - title: Angular
    url: https://github.com/docker/awesome-compose/tree/master/angular
    description: A sample Angular application.
    services:
      - angular
      - typescript
  - title: Spark
    url: https://github.com/docker/awesome-compose/tree/master/sparkjava
    description: A sample Spark application.
    services:
      - spark
      - java
  - title: VueJS
    url: https://github.com/docker/awesome-compose/tree/master/vuejs
    description: A sample Vue.js application.
    services:
      - vuejs
      - javascript
  - title: Flask
    url: https://github.com/docker/awesome-compose/tree/master/flask
    description: A sample Flask application.
    services:
      - flask
      - python
  - title: PHP
    url: https://github.com/docker/awesome-compose/tree/master/apache-php
    description: A sample PHP application.
    services:
      - php
  - title: Traefik
    url: https://github.com/docker/awesome-compose/tree/master/traefik-golang
    description: A sample Traefik proxy with a Go backend.
    services:
      - traefik
      - go
  - title: Django
    url: https://github.com/docker/awesome-compose/tree/master/django
    description: A sample Django application.
    services:
      - django
      - python
  - title: Minecraft server
    url: https://github.com/docker/awesome-compose/tree/master/minecraft
    description: A sample Minecraft server.
    services:
      - minecraft
  - title: Plex
    url: https://github.com/docker/awesome-compose/tree/master/plex
    description: A sample Plex setup.
    services:
      - plex
  - title: Portainer
    url: https://github.com/docker/awesome-compose/tree/master/portainer
    description: A sample Portainer setup.
    services:
      - portainer
  - title: Wireguard
    url: https://github.com/docker/awesome-compose/tree/master/wireguard
    description: A sample Wireguard setup.
    services:
      - wireguard
  - title: FastAPI
    url: https://github.com/docker/awesome-compose/tree/master/fastapi
    description: A sample FastAPI application.
    services:
      - python
      - fastapi
  - title: Gitea / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/gitea-postgres
    description: A sample setup for Gitea.
    services:
      - gitea
      - popstgresql
  - title: Nextcloud / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/nextcloud-postgres
    description: A sample Nextcloud setup.
    services:
      - nextcloud
      - postgresql
  - title: Nextcloud / Redis / MariaDB
    url: https://github.com/docker/awesome-compose/tree/master/nextcloud-redis-mariadb
    description: A sample Nextcloud setup.
    services:
      - nextcloud
      - mariadb
      - redis
  - title: Pi-hole / cloudflared
    url: https://github.com/docker/awesome-compose/tree/master/pihole-cloudflared-DoH
    description: A sample Pi-hole setup with use of DoH cloudflared service.
    services:
      - pi-hole
      - cloudflared
  - title: Prometheus / Grafana
    url: https://github.com/docker/awesome-compose/tree/master/prometheus-grafana
    description: A sample Prometheus and Grafana stack.
    services:
      - prometheus
      - grafana
  - title: WordPress / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/wordpress-mysql
    description: A sample WordPress setup.
    services:
      - wordpress
      - mysql
# Dockersamples ----------------------------
  - title: example-voting-app
    url: https://github.com/dockersamples/example-voting-app
    description: A sample Docker Compose app.
    services:
      - python
      - nodejs
      - .net
      - java
      - redis
      - postgresql
      - c#
  - title: docker-swarm-visualizer
    url: https://github.com/dockersamples/docker-swarm-visualizer
    description: A visualizer for Docker Swarm Mode using the Docker Remote API, Node.JS, and D3.
    services:
      - javascript
  - title: atsea-sample-shop-app
    url: https://github.com/dockersamples/atsea-sample-shop-app
    description: A sample app that uses a Java Spring Boot backend connected to a database to display a fictitious art shop with a React front-end.
    services:
      - java
      - spring
      - react
      - javascript
      - nginx
      - postgresql
  - title: wordsmith
    url: https://github.com/dockersamples/wordsmith
    description: A demo app that runs three containers, including PostgreSQL, Java, and Go.
    services:
      - postgresql
      - java
      - go
  - title: dotnet-album-viewer
    url: https://github.com/dockersamples/dotnet-album-viewer
    description: West Wind Album Viewer ASP.NET Core and Angular sample.
    services:
      - angular
      - typescript
      - javascript
      - .net
      - tidb
      - mysql
  - title: aspnet-monitoring
    url: https://github.com/dockersamples/aspnet-monitoring
    description: Monitoring ASP.NET Fx applications in Windows Docker containers, using Prometheus.
    services:
      - .net
      - prometheus
      - javascript
      - c#
  - title: linux_tweet_app
    url: https://github.com/dockersamples/linux_tweet_app
    description: A very simple webapp based on NGINX.
    services:
      - nginx
  - title: gopher-task-system
    url: https://github.com/dockersamples/gopher-task-system
    description: A Task System using Go Docker SDK.
    services:
      - go
  - title: link-shortener-typescript
    url: https://github.com/dockersamples/link-shortener-typescript
    description: A Simple URL Shortener built using TypeScript and Nest.js powered with Docker.
    services:
      - typescript
      - nestjs
      - redis
  - title: slack-clone-docker
    url: https://github.com/dockersamples/slack-clone-docker
    description: A sample Slack Clone app built with the MERN stack.
    services:
      - mongodb
      - express
      - react
      - javascript
      - nodejs
  - title: Compose and Rails
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/
    description: This Quickstart guide shows you how to use Docker Compose to set up and run a Rails/PostgreSQL app.
    services:
      - rails
      - postgres
      - ruby
  - title: Compose and Django
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
    description: This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/PostgreSQL app.
    services:
      - django
      - python
      - postgres
  - title: Compose and WordPress
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/wordpress/
    description: This quick-start guide demonstrates how to use Compose to set up and run WordPress.
    services:
      - wordpress
      - mariadb
      - postgres
  - title: AI/ML with Docker
    url: https://github.com/docker/genai-stack
    description: Get started with AI and ML using Docker, Neo4j, LangChain, and Ollama
    services:
      - python
      - aiml
@y
samples:
# Awesome Compose ----------------------------
  - title: ASP.NET / MS-SQL 
    url: https://github.com/docker/awesome-compose/tree/master/aspnet-mssql
    description: A sample ASP.NET core application with MS SQL server database.
    services:
      - .net
      - ms-sql
  - title: Elasticsearch / Logstash / Kibana
    url: https://github.com/docker/awesome-compose/tree/master/elasticsearch-logstash-kibana
    description: A sample Elasticsearch, Logstash, and Kibana stack.
    services:
      - elasticsearch
      - logstash
      - kibana
      - elk
  - title: Go / NGINX / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql
    description: A sample Go application with an Nginx proxy and a MySQL database.
    services: 
      - go
      - nginx
      - mysql
  - title: Go / NGINX / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang-postgres
    description: A sample Go application with an Nginx proxy and a PostgreSQL database.
    services:
      - go
      - nginx
      - postgresql
  - title: Java Spark / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/sparkjava-mysql
    description: A sample Java application and a MySQL database. 
    services:
      - spark
      - java
      - mysql
  - title: NGINX / ASP.NET / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-aspnet-mysql
    description: A sample Nginx reverse proxy with an C# backend using ASP.NET.
    services: 
      - nginx
      - .net
      - mysql
  - title: NGINX / Flask / MongoDB 
    url: https://github.com/docker/awesome-compose/tree/master/nginx-flask-mongo
    description: A sample Python/Flask application with Nginx proxy and a Mongo database.
    services:
      - nginx
      - flask
      - mongodb
      - python
  - title: NGINX / Flask / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/nginx-flask-mysql
    description: A sample Python/Flask application with an Nginx proxy and a MySQL database.
    services:
      - nginx
      - flask
      - python
      - mysql
  - title: NGINX / Node.js / Redis
    url: https://github.com/docker/awesome-compose/tree/master/nginx-nodejs-redis
    description: A sample Node.js application with Nginx proxy and a Redis database.
    services:
      - nginx
      - nodejs
      - redis
      - javascript
  - title: NGINX / Go
    url: https://github.com/docker/awesome-compose/tree/master/nginx-golang
    description: A sample Nginx proxy with a Go backend.
    services:
      - nginx
      - go
  - title: NGINX / WSGI / Flask
    url: https://github.com/docker/awesome-compose/tree/master/nginx-wsgi-flask
    description: A sample Nginx reverse proxy with a Flask backend using WSGI.
    services:
      - nginx
      - flask
      - python
      - wsgi
  - title: PostgreSQL / pgAdmin
    url: https://github.com/docker/awesome-compose/tree/master/postgresql-pgadmin
    description: A sample setup for postgreSQL database with pgAdmin web interface.
    services:
      - postgresql
      - pgadmin
  - title: Python / Flask / Redis
    url: https://github.com/docker/awesome-compose/tree/master/flask-redis
    description: A sample Python/Flask and a Redis database.
    services:
      - python
      - flask
      - redis
  - title: React / Spring / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/react-java-mysql
    description: A sample React application with a Spring backend and a MySQL database.
    services:
      - react
      - spring
      - java
      - javascript
      - mysql
  - title: React / Express / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/react-express-mysql
    description: A sample React application with a Node.js backend and a MySQL database.
    services:
      - react
      - javascript
      - express
      - mysql
      - nodejs
  - title: React / Express / MongoDB 
    url: https://github.com/docker/awesome-compose/tree/master/react-express-mongodb
    description: A sample React application with a Node.js backend and a Mongo database.
    services:
      - react
      - javascript
      - express
      - nodejs
      - mongodb
  - title: React / Rust / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/react-rust-postgres
    description: A sample React application with a Rust backend and a Postgres database.
    services:
      - react
      - rust
      - postgresql
      - javascript
  - title: React / NGINX
    url: https://github.com/docker/awesome-compose/tree/master/react-nginx
    description: A sample React application with Nginx.
    services:
      - react
      - javascript
      - nginx
  - title: Spring / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/spring-postgres
    description: A sample Java application with Spring framework and a Postgres database.
    services:
      - java
      - spring
      - postgresql
  - title: Angular
    url: https://github.com/docker/awesome-compose/tree/master/angular
    description: A sample Angular application.
    services:
      - angular
      - typescript
  - title: Spark
    url: https://github.com/docker/awesome-compose/tree/master/sparkjava
    description: A sample Spark application.
    services:
      - spark
      - java
  - title: VueJS
    url: https://github.com/docker/awesome-compose/tree/master/vuejs
    description: A sample Vue.js application.
    services:
      - vuejs
      - javascript
  - title: Flask
    url: https://github.com/docker/awesome-compose/tree/master/flask
    description: A sample Flask application.
    services:
      - flask
      - python
  - title: PHP
    url: https://github.com/docker/awesome-compose/tree/master/apache-php
    description: A sample PHP application.
    services:
      - php
  - title: Traefik
    url: https://github.com/docker/awesome-compose/tree/master/traefik-golang
    description: A sample Traefik proxy with a Go backend.
    services:
      - traefik
      - go
  - title: Django
    url: https://github.com/docker/awesome-compose/tree/master/django
    description: A sample Django application.
    services:
      - django
      - python
  - title: Minecraft server
    url: https://github.com/docker/awesome-compose/tree/master/minecraft
    description: A sample Minecraft server.
    services:
      - minecraft
  - title: Plex
    url: https://github.com/docker/awesome-compose/tree/master/plex
    description: A sample Plex setup.
    services:
      - plex
  - title: Portainer
    url: https://github.com/docker/awesome-compose/tree/master/portainer
    description: A sample Portainer setup.
    services:
      - portainer
  - title: Wireguard
    url: https://github.com/docker/awesome-compose/tree/master/wireguard
    description: A sample Wireguard setup.
    services:
      - wireguard
  - title: FastAPI
    url: https://github.com/docker/awesome-compose/tree/master/fastapi
    description: A sample FastAPI application.
    services:
      - python
      - fastapi
  - title: Gitea / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/gitea-postgres
    description: A sample setup for Gitea.
    services:
      - gitea
      - popstgresql
  - title: Nextcloud / PostgreSQL
    url: https://github.com/docker/awesome-compose/tree/master/nextcloud-postgres
    description: A sample Nextcloud setup.
    services:
      - nextcloud
      - postgresql
  - title: Nextcloud / Redis / MariaDB
    url: https://github.com/docker/awesome-compose/tree/master/nextcloud-redis-mariadb
    description: A sample Nextcloud setup.
    services:
      - nextcloud
      - mariadb
      - redis
  - title: Pi-hole / cloudflared
    url: https://github.com/docker/awesome-compose/tree/master/pihole-cloudflared-DoH
    description: A sample Pi-hole setup with use of DoH cloudflared service.
    services:
      - pi-hole
      - cloudflared
  - title: Prometheus / Grafana
    url: https://github.com/docker/awesome-compose/tree/master/prometheus-grafana
    description: A sample Prometheus and Grafana stack.
    services:
      - prometheus
      - grafana
  - title: WordPress / MySQL
    url: https://github.com/docker/awesome-compose/tree/master/wordpress-mysql
    description: A sample WordPress setup.
    services:
      - wordpress
      - mysql
# Dockersamples ----------------------------
  - title: example-voting-app
    url: https://github.com/dockersamples/example-voting-app
    description: A sample Docker Compose app.
    services:
      - python
      - nodejs
      - .net
      - java
      - redis
      - postgresql
      - c#
  - title: docker-swarm-visualizer
    url: https://github.com/dockersamples/docker-swarm-visualizer
    description: A visualizer for Docker Swarm Mode using the Docker Remote API, Node.JS, and D3.
    services:
      - javascript
  - title: atsea-sample-shop-app
    url: https://github.com/dockersamples/atsea-sample-shop-app
    description: A sample app that uses a Java Spring Boot backend connected to a database to display a fictitious art shop with a React front-end.
    services:
      - java
      - spring
      - react
      - javascript
      - nginx
      - postgresql
  - title: wordsmith
    url: https://github.com/dockersamples/wordsmith
    description: A demo app that runs three containers, including PostgreSQL, Java, and Go.
    services:
      - postgresql
      - java
      - go
  - title: dotnet-album-viewer
    url: https://github.com/dockersamples/dotnet-album-viewer
    description: West Wind Album Viewer ASP.NET Core and Angular sample.
    services:
      - angular
      - typescript
      - javascript
      - .net
      - tidb
      - mysql
  - title: aspnet-monitoring
    url: https://github.com/dockersamples/aspnet-monitoring
    description: Monitoring ASP.NET Fx applications in Windows Docker containers, using Prometheus.
    services:
      - .net
      - prometheus
      - javascript
      - c#
  - title: linux_tweet_app
    url: https://github.com/dockersamples/linux_tweet_app
    description: A very simple webapp based on NGINX.
    services:
      - nginx
  - title: gopher-task-system
    url: https://github.com/dockersamples/gopher-task-system
    description: A Task System using Go Docker SDK.
    services:
      - go
  - title: link-shortener-typescript
    url: https://github.com/dockersamples/link-shortener-typescript
    description: A Simple URL Shortener built using TypeScript and Nest.js powered with Docker.
    services:
      - typescript
      - nestjs
      - redis
  - title: slack-clone-docker
    url: https://github.com/dockersamples/slack-clone-docker
    description: A sample Slack Clone app built with the MERN stack.
    services:
      - mongodb
      - express
      - react
      - javascript
      - nodejs
  - title: Compose and Rails
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/
    description: This Quickstart guide shows you how to use Docker Compose to set up and run a Rails/PostgreSQL app.
    services:
      - rails
      - postgres
      - ruby
  - title: Compose and Django
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
    description: This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/PostgreSQL app.
    services:
      - django
      - python
      - postgres
  - title: Compose and WordPress
    url: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/wordpress/
    description: This quick-start guide demonstrates how to use Compose to set up and run WordPress.
    services:
      - wordpress
      - mariadb
      - postgres
  - title: AI/ML with Docker
    url: https://github.com/docker/genai-stack
    description: Get started with AI and ML using Docker, Neo4j, LangChain, and Ollama
    services:
      - python
      - aiml
@z
