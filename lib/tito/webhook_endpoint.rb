module Tito
  class WebhookEndpoint < Tito::Resource
    include Eventable, DashboardEndpoint

    class << self
      def attributes
        [:url, :included_triggers]
      end
    end

  end
end
