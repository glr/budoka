require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require 'neo4j/railtie'
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Budoka
  class Application < Rails::Application
    
    config.generators do |g|
      g.orm             :neo4j
    end

    # Configure where to connect to the Neo4j DB
    # Note that embedded db is only available for JRuby
    # config.neo4j.session.type = :http
    # config.neo4j.session.url = 'http://db:7474'
    # config.neo4j.session_options = { basic_auth: { username: 'neo4j', password: 'asdf'} }
    #  or
    config.neo4j.session.type = :bolt
    config.neo4j.session.url = 'bolt://neo4j:asdf@db:7687'
    # config.neo4j.session_options = { basic_auth: { username: 'neo4j', password: 'asdf'} }
    #  or
    # config.neo4j.session.type = :embedded
    # config.neo4j.session.path = Rails.root.join('neo4j-db').to_s

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('app', 'graph', 'types')
  end
end
