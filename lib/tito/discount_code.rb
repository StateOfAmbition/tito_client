module Tito
  class DiscountCode < Tito::Entity
    include Eventable, DashboardEndpoint

    class << self

      def attributes
        [:code, :value, :type, :quantity, :min_quantity_per_release,
          :max_quantity_per_release, :start_at, :end_at, :release_ids,
          :only_show_attached, :reveal_secret, :source_id, :disable_for_degressive
        ]
      end
    end

  end
end
