module Tito
  module DashboardEndpoint
    def self.included(base)

      def initialize(args)
        super(args)
        @client.hostname = 'https://dashboard.tito.io'
        @client.base_endpoint = "#{@client.hostname}/#{@client.account}/"
      end
    
    end
  end
end



