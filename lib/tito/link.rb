module Tito
  class Link < Tito::Resource
    include Eventable, DashboardEndpoint

    class << self

      def attributes
        [:url, :link_text]
      end
    end
  end
end
