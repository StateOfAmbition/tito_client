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

    class << self

      def find(id, includes = [])
        client.get(path_with_includes(id, includes)).resource
      end
      alias_method :get, :find

      def path_with_includes(id, includes)
        includes.empty? ? slug : [id, includes.join(',')].join('?include=')
      end

      def all
        client.get(resource_type).resources
      end

      def destroy(id)
        client.delete(id)
      end
    end

    private

      def persisted?
        !!(id)
      end

      def generate_params
        {self.class.resource_name => parameterize_attributes}
      end

      def parameterize_attributes
        self.class.attributes.inject({}) {|params, property| params[property] = send(property); params}.delete_if { |k, v| v.nil? }
      end

  end
end
