# README

A web app written using Rails to let people send me pictures of their dogs for my dog breed teaching app.
Users upload an image and tag it with their name and which breed it is. The app allows admins to export the metadata database as a CSV and the image library in a zip archive.

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

### Production

1. Copy master.key into /config, or generate a new key.
2. Create the database:

```bash
RAILS_ENV=production rake db:create db:migrate db:seed
```

3. Compile assets:

```bash
bin/yarn install
rake assets:precompile
```

4. Run the server:

```bash
rails s -e production
```

### Setting up Admin Accounts

1. Enable the sign-up page by changing config/initializers/clearance.rb:

```ruby
Clearance.configure do |config|
  # Other clearance config.

  config.allow_sign_up = true
end
```

2. Sign up with an email address and password at https://localhost:3000/sign_up. All accounts can be used to export the database and normal users should not need to, nor be able to sign up.

3. Disable sign-up.
