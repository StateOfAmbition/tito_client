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
        @@client ||= Tito::http.new({host_name: 'https://dashboard.tito.io', base_endpoint: "#{Tito::config.host_name}/#{Tito::config.account}/"})
      end
      
    end
  end
end