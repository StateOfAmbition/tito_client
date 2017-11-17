module Tito
  module Setting
    class Base < Tito::Base
      include Eventable, DashboardEndpoint
      
      def update
        self.class.client.patch("#{endpoint}", params)
      end
      
      private
        def generate_params
          {event: {event_attributes_key => parameterize_attributes}}
        end
        
        def parameterize_attributes
          self.class.properties.inject({}) {|params, property| params[property] = send(property); params}.delete_if { |k, v| v.nil? }
        end
        
        def event_attributes_key
          :event_setting_attributes
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