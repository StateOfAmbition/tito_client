module Tito
  class Confirmation < Tito::Entity
    include Eventable, DashboardEndpoint

    def resource_prefix_id
      raise InvalidConfirmationResource unless attributes.has_key?(:registration_id)
      registration_id
    end

    def generate_params
      {}
    end

    class << self

      def resource_prefix
        "registrations"
      end

      def attributes
        []
      end
    end

  end
  class InvalidConfirmationResource < StandardError; end
end
