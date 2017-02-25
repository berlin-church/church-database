# README

* Ruby version
2.4.0

* System dependencies

* Configuration

In the production server, we need to configure the connection
info as a environment variable.

```
export DATABASE_NAME=church_production
export DATABASE_USER=church
export DATABASE_PASSWORD=123456
```

And two more in your continuous delivery server (Codeship for example).

```
export DEPLOY_USER=church
```

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
We use Capistrano 3 to deploy it. Please, check Capfile and config/deploy/production.rb.
* ...
