module Tito
  class Refund < Tito::Entity
    include Eventable, DashboardEndpoint

    def resource_prefix_id
      raise InvalidRefundResource unless attributes.has_key?(:registration_id)
      registration_id
    end

    def generate_params
      {refund: parameterize_attributes}
    end

    class << self
      def resource_prefix
        "registrations"
      end

      def attributes
        [:amount, :manual]
      end
    end

  end
  class InvalidRefundResource < StandardError; end
end
