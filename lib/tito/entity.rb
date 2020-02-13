module Tito
  class Entity < Tito::Base

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

    def destroy
      self.class.client.delete(endpoint)
    end

    private

      def persisted?
        !!(id)
      end

      def generate_params
        {self.class.resource_name => parameterize_attributes}
      end

      def parameterize_attributes
        self.class.attributes.inject({}) {|params, property| params[property.to_s.gsub('_','-')] = send(property); params}.delete_if { |k, v| v.nil? }
      end

  end
end
