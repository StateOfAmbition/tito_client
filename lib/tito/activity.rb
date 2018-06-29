module Tito
  class Activity < Tito::Entity
    include Eventable, DashboardEndpoint

    class << self
      def attributes
        [:name, :capacity, :private, :release_ids, :date, :start_at, :end_at]
      end
    end

  end
end
