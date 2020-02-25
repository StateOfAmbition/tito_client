module Tito
  class Configuration < ::Api::Client::Configuration
    attr_accessor :base_endpoint, :hostname, :access_token, :api_version, :account

    def base_endpoint
      @base_endpoint || "#{hostname}/#{api_version}"
    end

    def hostname
      @hostname || "https://api.tito.io"
    end

    def api_version
      @api_version || 3
    end
  end
end
