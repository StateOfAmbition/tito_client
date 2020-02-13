module Tito
  module Setting
    class Base < Tito::Base
      include Eventable

      def update
        self.class.client.patch("#{endpoint}", params)
      end

      private
        def generate_params
          {event: parameterize_attributes}
        end

        def parameterize_attributes
          self.class.attributes.inject({}) {|params, property| params[property] = send(property); params}.delete_if { |k, v| v.nil? }
        end

      class << self

        def resource_prefix
          'settings'
        end

        def resource_type
          resource_name
        end
      end
    end
  end
end
