# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'database_cleaner'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
end
