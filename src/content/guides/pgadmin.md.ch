%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Visualizing your PostgreSQL databases with pgAdmin
keywords: pgadmin, container-supported development
title: Visualizing your PostgreSQL databases with pgAdmin
linktitle: Visualizing your PostgreSQL databases with pgAdmin
summary: |
  Explore how to add pgAdmin to your development stack and make it as easy as possible for your teammates to navigate through your PostgreSQL databases.
@y
description: Visualizing your PostgreSQL databases with pgAdmin
keywords: pgadmin, container-supported development
title: Visualizing your PostgreSQL databases with pgAdmin
linktitle: Visualizing your PostgreSQL databases with pgAdmin
summary: |
  Explore how to add pgAdmin to your development stack and make it as easy as possible for your teammates to navigate through your PostgreSQL databases.
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
Many applications use PostgreSQL databases in the application stack. However, not all developers are knowledgeable about navigating and working with PostgreSQL databases.
@y
Many applications use PostgreSQL databases in the application stack. However, not all developers are knowledgeable about navigating and working with PostgreSQL databases.
@z

@x
Fortunately, when you use containers in development, it is easy to add additional services to help with troubleshooting and debugging.
@y
Fortunately, when you use containers in development, it is easy to add additional services to help with troubleshooting and debugging.
@z

@x
The [pgAdmin](https://www.pgadmin.org/) tool is a popular open-source tool designed to help administer and visualize PostgreSQL databases.
@y
The [pgAdmin](https://www.pgadmin.org/) tool is a popular open-source tool designed to help administer and visualize PostgreSQL databases.
@z

@x
In this guide you will learn how to:
@y
In this guide you will learn how to:
@z

@x
1. Add pgAdmin to your application stack
2. Configure pgAdmin to automatically connect to the development database
@y
1. Add pgAdmin to your application stack
2. Configure pgAdmin to automatically connect to the development database
@z

@x
## Adding pgAdmin to your stack
@y
## Adding pgAdmin to your stack
@z

@x
1. In your `compose.yaml` file, add the `pgadmin` service next to your existing `postgres` service:
@y
1. In your `compose.yaml` file, add the `pgadmin` service next to your existing `postgres` service:
@z

@x within code
          # Required by pgAdmin
@y
          # Required by pgAdmin
@z
@x
          # Don't require the user to login
@y
          # Don't require the user to login
@z
@x
          # Don't require a "master" password after logging in
@y
          # Don't require a "master" password after logging in
@z

@x
2. Start the Compose stack with the following command:
@y
2. Start the Compose stack with the following command:
@z

% snip command...

@x
    After the image is downloaded the container starts, you will see output that looks similar to the following indicating pgAdmin is ready:
@y
    After the image is downloaded the container starts, you will see output that looks similar to the following indicating pgAdmin is ready:
@z

% snip output...

@x
3. Open pgAdmin by going to http://localhost:5050.
@y
3. Open pgAdmin by going to http://localhost:5050.
@z

@x
4. Once in the admin panel, select the **Add New Server** link to define a new server. Enter the following details:
@y
4. Once in the admin panel, select the **Add New Server** link to define a new server. Enter the following details:
@z

@x
    - **General** tab:
        - **Name**: `postgres`
    - **Connection** tab:
        - **Host name/address**: `postgres`
        - **Username**: `postgres`
        - **Password**: `secret`
        - Enable the **Save password?** field
@y
    - **General** tab:
        - **Name**: `postgres`
    - **Connection** tab:
        - **Host name/address**: `postgres`
        - **Username**: `postgres`
        - **Password**: `secret`
        - Enable the **Save password?** field
@z

@x
    > [!IMPORTANT]
    >
    > These connection details assume you are using the previous Compose file snippet. If you are using an existing Compose file,
    > adjust the connection details as required. The **Host name/address** field should match the name of your postgres service.
@y
    > [!IMPORTANT]
    >
    > These connection details assume you are using the previous Compose file snippet. If you are using an existing Compose file,
    > adjust the connection details as required. The **Host name/address** field should match the name of your postgres service.
@z

@x
5. Select the **Save** button to create the new database.
@y
5. Select the **Save** button to create the new database.
@z

@x
You now have pgAdmin setup and connected to your containerized database. Feel free to navigate around, view the tables, and explore your database.
@y
You now have pgAdmin setup and connected to your containerized database. Feel free to navigate around, view the tables, and explore your database.
@z

@x
## Configuring pgAdmin to auto-connect to the database
@y
## Configuring pgAdmin to auto-connect to the database
@z

@x
Although you have pgAdmin running, it would be nice if you could simply open the app without needing to configure the database connection. Reducing the setup steps would be a great way to make it easier for teammates to get value from this tool.
@y
Although you have pgAdmin running, it would be nice if you could simply open the app without needing to configure the database connection. Reducing the setup steps would be a great way to make it easier for teammates to get value from this tool.
@z

@x
Fortunately, there is an ability to auto-connect to the database.
@y
Fortunately, there is an ability to auto-connect to the database.
@z

@x
> [!WARNING]
>
> In order to auto-connect, the database credentials are shared using plaintext files. During local development, this is often acceptable as local data is not real customer data.
> However, if you are using production or sensitive data, this practice is strongly discouraged.
@y
> [!WARNING]
>
> In order to auto-connect, the database credentials are shared using plaintext files. During local development, this is often acceptable as local data is not real customer data.
> However, if you are using production or sensitive data, this practice is strongly discouraged.
@z

@x
1. First, you need to define the server itself, which pgAdmin does using a `servers.json` file. 
@y
1. First, you need to define the server itself, which pgAdmin does using a `servers.json` file. 
@z

@x
    Add the following to your `compose.yaml` file to define a config file for the `servers.json` file:
@y
    Add the following to your `compose.yaml` file to define a config file for the `servers.json` file:
@z

% snip code...

@x
2. The `servers.json` file defines a `PassFile` field, which is a reference to a [postgreSQL password files](https://www.postgresql.org/docs/current/libpq-pgpass.html). These are often referred to as a pgpass file.
@y
2. The `servers.json` file defines a `PassFile` field, which is a reference to a [postgreSQL password files](https://www.postgresql.org/docs/current/libpq-pgpass.html). These are often referred to as a pgpass file.
@z

@x
    Add the following config to your `compose.yaml` file to define a pgpass file:
@y
    Add the following config to your `compose.yaml` file to define a pgpass file:
@z

% snip code...

@x
    This will indicate any connection requests to `postgres:5432` using the username `postgres` should provide a password of `secret`.
@y
    This will indicate any connection requests to `postgres:5432` using the username `postgres` should provide a password of `secret`.
@z

@x
3. In your `compose.yaml`, update the `pgadmin` service to inject the config files:
@y
3. In your `compose.yaml`, update the `pgadmin` service to inject the config files:
@z

% snip code...

@x
4. Update the application stack by running `docker compose up` again:
@y
4. Update the application stack by running `docker compose up` again:
@z

% snip command...

@x
5. Once the application is restarted, open your browser to http://localhost:5050. You should be able to access the database without any logging in or configuration.
@y
5. Once the application is restarted, open your browser to http://localhost:5050. You should be able to access the database without any logging in or configuration.
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
Using containers makes it easy to not only run your application's dependencies, but also additional tools to help with troubleshooting and debugging. 
@y
Using containers makes it easy to not only run your application's dependencies, but also additional tools to help with troubleshooting and debugging. 
@z

@x
When you add tools, think about the experience and possible friction your teammates might experience and how you might be able to remove it. In this case, you were able to take an extra step to add configuration to automatically configure and connect the databases, saving your teammates valuable time.
@y
When you add tools, think about the experience and possible friction your teammates might experience and how you might be able to remove it. In this case, you were able to take an extra step to add configuration to automatically configure and connect the databases, saving your teammates valuable time.
@z
