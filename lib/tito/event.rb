module Tito
  class Event < Tito::Base

    def endpoint
      id ? '' : 'events'
    end
    
    class << self
      
      def find(id)
        client.get(id).resource
      end
      
      def all
        client.get(resource_type).resources
      end
      
      def attributes
        [:title, :description, :slug, :currency, :start_date, :end_date, :location, :test_mode, :public, :live, :logo_url, :banner_url]
      end
    end
  end
end