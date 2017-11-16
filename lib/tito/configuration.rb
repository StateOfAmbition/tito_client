module Tito
  class Configuration
    attr_accessor :host_name, :access_token, :api_version, :account
    
    def api_version
      @api_version || 2
    end
  end
end