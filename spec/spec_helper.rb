require "codeclimate-test-reporter"
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "factory_girl_rails"
require "omniauth"
require "vcr"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  VCR.configure do |configuration|
    configuration.cassette_library_dir = "spec/fixtures/vcr_cassettes"
    configuration.hook_into :webmock
    configuration.default_cassette_options = {
      match_requests_on: [:uri, :body, :method]
    }
    configuration.ignore_hosts "codeclimate.com"
  end
end
