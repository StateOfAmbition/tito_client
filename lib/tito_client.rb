require "api_client"
require 'tito/eventable.rb'
require 'tito/http'

require_relative './tito/configuration.rb'
require_relative './tito/base.rb'
require_relative './tito/entity.rb'
require_relative './tito/activity.rb'
require_relative './tito/confirmation.rb'
require_relative './tito/event.rb'
require_relative './tito/event_setting.rb'
require_relative './tito/discount_code.rb'
require_relative './tito/question.rb'
require_relative './tito/refund.rb'
require_relative './tito/registration.rb'
require_relative './tito/release.rb'
require_relative './tito/ticket.rb'
require_relative './tito/webhook_endpoint.rb'

require_relative './tito/setting/base.rb'
require_relative './tito/setting/basics.rb'
require_relative './tito/setting/email.rb'
require_relative './tito/setting/homepage.rb'
require_relative './tito/setting/invoicing.rb'
require_relative './tito/setting/payment.rb'
require_relative './tito/setting/services.rb'
require_relative './tito/setting/tickets.rb'


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

    def self.logger
      @logger ||= logger = Logger.new(STDOUT).tap do |l|
        l.level = Logger::INFO
      end
    end

    def self.method_missing(name, *args)
      config.send(name) if config.respond_to?(name)
    end

    extend self
  end
end
