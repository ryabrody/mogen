require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'pry'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  # TODO: What can be here?
  config.app_host = 'https://example.com'
  config.save_path = 'tmp/capybara'
end
