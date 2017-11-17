module Tito
  class Http < ::Api::Client::Base
    attr_accessor :host_name, :api_version, :account
    
    def base_endpoint
      @base_endpoint ||= "#{host_name}/v#{api_version}/#{account}"
    end
    
    private 
    
      def generate_token
        Tito::Client.api_key
      end

      def authorization_params
        {accept: 'application/vnd.api+json', Authorization: "Token token=#{access_token}"}
      end
  
      def default_config
        {host_name: Tito::Client.host_name, access_token: Tito::Client.access_token, api_version: Tito::Client.api_version, account: Tito::Client.account }
      end
  end
end