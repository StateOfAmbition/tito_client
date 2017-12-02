module Tito
  module Setting
    class Homepage < Tito::Setting::Base

      def theme
        !@theme.nil? && self.theme_set.include?(@theme) ? @theme : theme_set.first
      end

      class << self

        def theme_set
          ['mcdonagh', 'classic']
        end

        def attributes
          [:additional_info, :theme, :custom_background_color, :show_register_interest_form_tickets_on_sale,
            :show_register_interest_form_tickets_not_on_sale, :register_interest_form_label]
        end
      end
    end
  end
end
