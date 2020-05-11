# Requirements

- Ruby 2.6.3
- Rails 6.0.2.2
- Node 11.14.0
- Yarn 1.17.3
- PostgreSQL 12

# Setup

- Change your database credentials on `config/database.yml` default.
- Creates databases to development and test: `rails db:create`
- Install gems with `bundle install`
- Install yarn packages with `yarn install`
- Run database migrations: `rails db:migrate`

# Run Tests
- Only need to run `rspec` to see model specs
