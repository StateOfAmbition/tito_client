module Tito
  module DashboardEndpoint
    
    def self.included(base)
      base.extend ClassMethods
      def initialize(args)
        super(args)
      end
    
    end
    
    module ClassMethods
      
      def client
        @@client ||= Tito::Http.new({host_name: 'https://dashboard.tito.io', base_endpoint: "https://dashboard.tito.io/#{Tito::Client.config.account}/"})
      end
      
    end
  end
end