module Tito
  class WebhookEndpoint < Tito::Resource
    include Eventable, DashboardEndpoint
    
    class << self
      def properties
        [:url, :included_triggers]
      end
    end
    
  end
end