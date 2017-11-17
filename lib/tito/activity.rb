module Tito
  class Activity < Tito::Resource
    include Eventable, DashboardEndpoint
    
    class << self
      def properties
        [:name, :capacity, :private, :release_ids]
      end
    end
    
  end
end