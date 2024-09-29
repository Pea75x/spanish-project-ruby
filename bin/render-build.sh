#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec bin/rails db:drop
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
