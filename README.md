# README

## Setup

0. Install ruby (>=3.0.0).

1. Install rails.

```bash
$ gem install rails
```

2. Get dependencies by running bundle install and npm install in the app directory.

```bash
$ bundle install
$ npm install
```

3. Run database migrations.

```bash
$ rails db:migrate
```

4. Run the server.

```bash
$ rails server
```

5. Setup for production:

- Copy master.key into /config, or generate a new key.
- Create the database:

```
RAILS_ENV=production rake db:create db:migrate db:seed
```

- Compile assets:

```

```

- Run the server:

```

```
