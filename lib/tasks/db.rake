# frozen_string_literal: true

namespace :db do
  desc 'rebuilds the database from scratch'
  task rebuild: :environment do
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    `rake seed:migrate`
  end
end
