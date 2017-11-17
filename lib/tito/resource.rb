module Tito
  class Resource < Tito::Base
    
    def sync
      response = persisted? ? update : create
      block_given? ? (yield response) : response
    end
    
    def create
      self.class.client.post(endpoint, params)
    end
    
    def update
      self.class.client.patch(endpoint, params)
    end
    
    private
      
      def persisted?
        !!(id)
      end 
      
      def generate_params
        {data: {type: self.class.resource_type, attributes: parameterize_attributes}}
      end
      
      def parameterize_attributes
        self.class.properties.inject({}) {|params, property| params[property.to_s.gsub('_','-')] = send(property); params}.delete_if { |k, v| v.nil? }
      end
      
  end
end