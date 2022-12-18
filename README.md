# Backend code exercise
Simple demonstration on how to utilize GenServers.

## Requirements
  * [Elixir and Erlang](https://elixir-lang.org/install.html)
  * [PostgreSQL](https://www.postgresql.org/download/)

## Development
Setup the database (first run only):

  * `psql -h localhost -U <USERNAME> -d <DEFAULT_DATABASE>`
  * `CREATE DATABASE remote_backend_exercise_dev;`

Start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
