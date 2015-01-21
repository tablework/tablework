# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "codeclimate-test-reporter"
require 'vcr'
require 'webmock/rspec'

CodeClimate::TestReporter.start
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.allow_http_connections_when_no_cassette = false
  c.ignore_localhost = true
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Features::SessionHelpers, type: :controller
  config.include Features::SessionHelpers, type: :feature
  config.include Capybara::DSL
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
