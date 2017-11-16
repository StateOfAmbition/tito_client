require "api_client"
require 'tito/eventable.rb'
require 'tito/dashboard_endpoint.rb'
require 'tito/http'

require_relative './tito/configuration.rb'
require_relative './tito/base.rb'
require_relative './tito/activity.rb'
require_relative './tito/event.rb'
require_relative './tito/question.rb'
require_relative './tito/release.rb'
require_relative './tito/webhook_endpoint.rb'

module Tito
  module Client
    
    def self.http
      @http ||= Tito::Http.new
    end
    
    def self.config
      @@config ||= Tito::Configuration.new
    end
    
    def self.setup
      yield config
    end
    
    def self.method_missing(name, *args)
      config.send(name) if config.respond_to?(name)
    end
    
    extend self
  end
end
