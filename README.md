# Service Web Api

This backend application (will serve/serves, depending on when you're reading this) as source and CRUD interface for all resources, users, reviews, etc. for the serviceweb website.

```
hostname goes here once that is known
```

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

I recommend using a version manager such as [asdf](https://github.com/asdf-vm/asdf) or [rbenv](https://github.com/rbenv/rbenv).

```
ruby 2.4
rails 5.2
postgres 9.6
```

### Installing

install dependencies

```
bundle install
```

construct the database and migrate development data

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake seed:migrate

# or use the custom rake take which can also be used to reconstruct

bundle exec rake db:rebuild
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Unit tests are run entirely with [rspec-rails](https://github.com/rspec/rspec-rails)

```
bundle exec rspec
```

### And coding style tests

Style enforcement is provided by [rubocop](https://github.com/rubocop-hq/rubocop). Check out `.rubocop.yml` for settings.

```
bundle exec rubocop
```

## Deployment

No deployment strategy as of yet.

## Versioning

This api uses standard REST practices whenever possible and api versions are controlled by url `/api/v1/...`.

## Authors

* **gatorjuice** - *Initial work* - [gatorjuice](https://github.com/gatorjuice)

See also the list of [contributors](https://github.com/gatorjuice/service_web_api/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
