module Tito
  class Activity < Tito::Base
    include Eventable, DashboardEndpoint
    
    class << self
      def attributes
        [:name, :capacity, :private, :release_ids]
      end
    end
    
  end
end