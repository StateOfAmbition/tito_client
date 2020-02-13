module Tito
  class Configuration < ::Api::Client::Configuration
    attr_accessor :hostname, :access_token, :api_version, :account

    def hostname
      @hostname || "https://api.tito.io"
    end

    def api_version
      @api_version || 3
    end
  end
end
