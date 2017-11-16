module Tito
  class Event < Tito::Base

    def endpoint
      tito_id ? '' : 'events'
    end
    
    class << self
      def attributes
        [:title, :description, :slug, :currency, :start_date, :end_date, :location, :test_mode, :public, :live, :logo_url, :banner_url]
      end
    end
  end
end