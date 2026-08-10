Brilliant Fantastic
===================

> A treehouse on the internet.

For the best experience reading this README, please [set the mood](https://www.youtube.com/watch?v=UHNVQ2PHTr4) first.

## DESCRIPTION

Brilliant Fantastic is the personal website of Jamie Wright. It features a dual-theme experience — a clean brutalist "Brilliant" side and an expressive, playful "Fantastic" side — with a blog, contact form, and animated illustrations.

## INSTALLATION

* Install the dependencies

```
mix deps.get
```

* Create the database

```
mix ecto.create
```

The app connects to Postgres as `postgres`/`postgres` on `localhost:5432`. If your Postgres
listens elsewhere, set `DATABASE_PORT`:

```
DATABASE_PORT=5452 mix ecto.create
```

If you see `FATAL 28P01 (invalid_password)`, check the port before the credentials. That error
means something answered on 5432 and rejected the login — often another project's Postgres
(a Docker container, say) sitting on the default port. Confirm what is actually there:

```
docker ps | grep 5432
lsof -nP -iTCP:5432 -sTCP:LISTEN
```

Note that an unprivileged `lsof` will not list a container's listener, so check both.
Export `DATABASE_PORT` in your shell profile to avoid prefixing every command. CI runs Postgres
on 5432, which is why the default stays as it is.

* Start the Phoenix server

```
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## TESTING

You can run the tests with the standard mix command:

```
mix test
```

The same `DATABASE_PORT` note from the installation section applies here.

You can also run the full precommit suite:

```
mix precommit
```

This runs compilation with warnings as errors, dependency audit, formatting, and tests.

## DEPLOYMENT

This application is deployed to [Gigalixir](https://gigalixir.com) using buildpacks.

The application is automatically deployed to production when code is merged into the `main` branch. CI must pass before deployment is triggered.

The production application lives at https://bf.lol.

### Services used

* [Gigalixir](https://gigalixir.com) for hosting
* [Resend](https://resend.com) for transactional email
* [Tailwind CSS](https://tailwindcss.com) for styling

### Manual deployment

1. Install the Gigalixir CLI

```
brew tap gigalixir/brew && brew install gigalixir
```

2. Log in

```
gigalixir login
```

3. Add the git remote

```
gigalixir git:remote bf
```

4. Deploy

```
git push gigalixir main:master
```

5. Run migrations (if necessary)

```
gigalixir ps:migrate
```

## CONTRIBUTING

1. Clone the repository `git clone https://github.com/brilliantfantastic/bf`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request
