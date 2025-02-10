# Tasty Challenge

A simple Rails application with Grape and ActiveAdmin.

## Requirements

Install the ruby version specified in the `.ruby_version` file, preferably using a version manager. Some options: 
   - [asdf](https://asdf-vm.com/)
   - [rbenv](https://github.com/rbenv/rbenv)

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

4. Run the server

```shell
bundle exec rails server
```

The app should be running in `127.0.0.1:3000`.

## Test suite

This project uses [RSpec](https://rspec.info). To run all tests use:

```shell
bundle exec rspec
```
Check [rspec-rails](https://github.com/rspec/rspec-rails) for more examples and information.
