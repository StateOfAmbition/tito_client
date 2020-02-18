module Tito
  class Event < Tito::Entity

    def endpoint
      id ? slug : 'events'
    end

    def get(includes = [])
      return nil unless slug
      self.class.client.get(slug).resource
    end

    class << self

      def find(slug, includes = [])
        client.get(path_with_includes(slug, includes)).resource
      end
      alias_method :get, :find

      def path_with_includes(slug, includes)
        includes.empty? ? slug : [slug, includes.join(',')].join('?include=')
      end

      def all
        client.get(resource_type).resources
      end

      def destroy(id)
        client.delete(id)
      end

      def attributes
        [:title, :description, :slug, :currency, :credit_card_payment_option_id,
          :start_date, :end_date, :location, :test_mode, :private, :live,
          :logo_url, :banner_url, :google_analytics_property_id]
      end
    end
  end
end
