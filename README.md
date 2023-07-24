# Rumbl

![rumbl-image](./image.png)

Let's get Rumbl-ed!

## Start in local

To start your own `Rumbl` server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deploy to Fly.io

First you need to login to [Fly.io](https://fly.io/) with `flyctl`.

```bash
$ flyctl auth login
```

Then you'll need to create a new remote server.  
It will create some useful files that `flyctl` will use for easy deployment.

```bash
$ fly launch --now
```

At the very last part of deployment, you'll confront error that `DATABASE_URL` is missing.  
That's obvious since we've got no database connected.

There are several options for remote databases.  
For ease I use _Fly Postgres_. I can just create it by typing,

```bash
$ fly postgres create
```

Then you can attach Postgres database to our app with this command.  
Replace `<app-name>` and `<database-name>` with real app/db name that you've created on previous step.

```bash
$ flyctl postgres attach --app <app-name> <database-name>
```
