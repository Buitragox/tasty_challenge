# Tasty Challenge

----

A simple Rails application with Grape and ActiveAdmin.

## Features

- Product resource with standard CRUD operations.
  - GET /api/v1/products
  - GET /api/v1/products/:id
  - POST /api/v1/products
  - PUT /api/v1/products/:id
  - DELETE /api/v1/products/:id

- Admin panel at `/admin` where you can read, edit and delete products

- Simple swagger docs at `/api-docs`

## Requirements

1. Install the ruby version specified in the `.ruby_version` file, preferably using a version manager. Some options: 
   - [asdf](https://asdf-vm.com/)
   - [rbenv](https://github.com/rbenv/rbenv)

2. Install [yarn](https://yarnpkg.com/getting-started/install) 4.6.0. 
If the standard installation does not add `yarn` to your path,
you can try installing it using the [asdf-yarn plugin](https://github.com/twuni/asdf-yarn).

## How to run

To run the application in a local environment, follow these steps:

1. Clone the repository

```shell
git clone https://github.com/Buitragox/tasty_challenge.git
```

2. Install the gems

```shell
bundle install
```

3. Set up the database

```shell
bundle exec rails db:prepare
```

4. Install the package.json dependencies

```shell
yarn install
```

5. Run the server

```shell
bundle exec rails server
```

The app should be running in `http://127.0.0.1:3000`.

## Test suite

This project uses [RSpec](https://rspec.info). To run all tests use:

```shell
bundle exec rspec
```
Check [rspec-rails](https://github.com/rspec/rspec-rails) for more examples and information.
