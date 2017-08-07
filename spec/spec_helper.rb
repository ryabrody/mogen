require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'pry'
require 'support/capybara'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Support::Capybara
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = 'https://example.com'
  config.save_path = 'tmp/capybara'
end
