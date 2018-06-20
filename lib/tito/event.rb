module Tito
  class Event < Tito::Entity

    def endpoint
      id ? id : 'events'
    end

    def get(includes = [])
      return nil unless id
      self.class.client.get(id).resource
    end

    class << self

      def find(id)
        client.get(id).resource
      end
      alias_method :get, :find

      def all
        client.get(resource_type).resources
      end

      def destroy(id)
        client.destroy(id)
      end

      def attributes
        [:title, :description, :slug, :currency, :start_date, :end_date, :location, :test_mode, :private, :live, :logo_url, :banner_url]
      end
    end
  end
end
