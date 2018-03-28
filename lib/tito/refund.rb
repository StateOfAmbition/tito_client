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

      def find(event_slug, registration_id, id, includes = [])
        client.get(path_with_includes([event_slug, resource_prefix, registration_id, resource_type, id].join("/"), includes)).resource
      end
      alias_method :get, :find

      def all_for(event_slug, registration_id, includes = [])
        client.get(path_with_includes([event_slug, resource_prefix, registration_id, resource_type].join("/"), includes)).resources
      end

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
