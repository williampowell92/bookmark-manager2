require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

require_relative '../app'
require_relative './features/web_helper'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
 SimpleCov::Formatter::Console,
])
SimpleCov.start do
 add_filter "feature_spec"
end

Capybara.app = BookmarkManager

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    load 'setup_test_database.rb'
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
