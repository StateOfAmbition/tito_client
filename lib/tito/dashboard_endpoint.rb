module Tito
  module DashboardEndpoint
    base.extend ClassMethods
    
    def self.included(base)

      def initialize(args)
        super(args)
      end
    
    end
    
    def ClassMethods
      
      def client
        @@client ||= Tito::http.new({host_name: 'https://dashboard.tito.io', base_endpoint: "#{Tito::config.host_name}/#{Tito::config.account}/"})
      end
      
    end
  end
end