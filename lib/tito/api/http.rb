module Tito
  module Api
    class Http < ::Api::Client::Base
      attr_accessor :hostname, :base_endpoint, :api_version, :account

      def base_endpoint
        @base_endpoint ||= "#{Tito::Client.base_endpoint}/#{account}"
      end

      def log_response?
        Tito::Client.config.logger_active
      end

      private
        def parse(response)
          begin
            # puts "[Tito::http#parse] #{response.body}"
            body = JSON.parse(response.body)
            puts "[Tito::http#parse] #{body.keys.first}"
            ::Api::Client::Response.new(response.code, response.headers, Tito::Api::Resource.parse(body, body.keys.first)).tap do |r|
              ::Api::Client.logger.info "[API::Client] Response: status #{r.status} data: #{r.data.inspect}" if log_response?
            end
          rescue JSON::ParserError => e
            ::Api::Client::Response.new(response.code, response.headers, response.body)
          end
        end

        def generate_token
          Tito::Client.api_key
        end

        def header_params
          {accept: 'application/json', Authorization: "Token token=#{access_token}"}
        end

        def default_config
          {hostname: Tito::Client.hostname, access_token: Tito::Client.access_token, api_version: Tito::Client.api_version, account: Tito::Client.account }
        end
    end
  end
end
