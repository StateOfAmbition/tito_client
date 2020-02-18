module Tito
  class Team < Tito::Entity

    class << self
      def attributes
        [:name, :user_ids, :event_ids]
      end
    end

  end
end
