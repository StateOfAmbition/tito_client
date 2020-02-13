module Tito
  class Link < Tito::Entity
    include Eventable

    class << self

      def attributes
        [:url, :link_text]
      end
    end
  end
end
