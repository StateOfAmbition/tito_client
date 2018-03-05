module Tito
  class Configuration
    attr_accessor :hostname, :access_token, :api_version, :account

    def hostname
      @hostname || "https://api.tito.io"
    end

    def api_version
      @api_version || 2
    end
  end
end
