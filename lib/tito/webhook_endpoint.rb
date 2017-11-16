module Tito
  class WebhookEndpoint < Tito::Base
    include Eventable, DashboardEndpoint
    
    class << self
      def attributes
        [:url, :included_triggers]
      end
    end
    
  end
end