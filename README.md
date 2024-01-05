# README

Banks Account management challenge, where i can manage all my customer accounts.

## Tools
* Ruby 3.2.2
* Postgres 13.11

## Docker Setup

```bash
docker compose up
```

## Local installation
* Clone the repo
* Install ruby dependencies

```bash
bundle install
```

* Create the database and run the migrations
```bash
rails db:setup
```

* Run the server on [localhost:3000](http://localhost:3000)
```bash
./bin/dev
```

* Run the tests
```bash
./bin/rake
```
