module Tito
  class WebhookEndpoint < Tito::Entity
    include Eventable
    class << self
      def attributes
        [:url, :included_triggers]
      end
    end

  end
end
