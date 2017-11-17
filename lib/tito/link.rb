module Tito
  class Link < Tito::Resource
    include Eventable, DashboardEndpoint
    
    class << self

      def properties
        [:url, :link_text]
      end
    end
  end
end