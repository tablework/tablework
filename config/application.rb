require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tablework
  class Application < Rails::Application
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.stylesheets false
      generate.request_specs false
      generate.routing_specs false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(#{config.root}/lib/classes)
    config.active_job.queue_adapter = :delayed_job
  end
end
