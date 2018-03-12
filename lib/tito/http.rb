module Tito
  class Http < ::Api::Client::Base
    attr_accessor :hostname, :base_endpoint, :api_version, :account

    def base_endpoint
      @base_endpoint ||= "#{hostname}/v#{api_version}/#{account}"
    end

    private

      def generate_token
        Tito::Client.api_key
      end

      def header_params
        {accept: 'application/vnd.api+json', Authorization: "Token token=#{access_token}"}
      end

      def default_config
        {hostname: Tito::Client.hostname, access_token: Tito::Client.access_token, api_version: Tito::Client.api_version, account: Tito::Client.account }
      end
  end
end
