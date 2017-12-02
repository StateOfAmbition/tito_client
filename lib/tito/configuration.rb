module Tito
  class Configuration
    attr_accessor :host_name, :access_token, :api_version, :account

    def host_name
      @host_name || "https://api.tito.io"
    end

    def api_version
      @api_version || 2
    end
  end
end
