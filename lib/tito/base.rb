module Tito
  class Base
    attr_accessor :client, :attributes
    
    def initialize(attributes = {})
      @attributes = attributes
    end
    
    def sync
      response = persisted? ? update : create
      block_given? ? (yield response) : response
    end
    
    def create
      self.client.post(endpoint, params)
    end
    
    def update
      self.client.patch("#{endpoint}/#{id}", params)
    end
    
    def params
      @params ||= generate_params
    end
    
    def method_missing(method, *args, &block)
      attributes.has_key?(method) ? attributes[method] : nil
    end
    
    class << self
      
      attr_reader :client
      
      def client
        @client ||= Tito::Client.http
      end
      
      def resource_name
        @resouce_name ||= self.name.split('::').last.
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
      end
      
      def resource_type
         resource_name + 's'
      end
      
    end
    
    private
    
      def persisted?
        !!(id)
      end 
      
      def generate_params
        {data: {type: self.class.resource_type, attributes: parameterize_attributes}}
      end
      
      def parameterize_attributes
        self.class.properties.inject({}) {|params, property| params[property.to_s.dasherize] = send(property); params}
      end
      
  end
end