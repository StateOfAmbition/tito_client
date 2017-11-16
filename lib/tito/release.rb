module Tito
  class Release < Tito::Base
    include Eventable, DashboardEndpoint

    class << self
      def attributes
        [:title, :description, :enable_super_combo_summary, :has_success_message, :max_tickets_per_person,
          :min_tickets_per_person, :not_a_ticket, :position, :price, :quantity, :question_ids, :request_company_name,
          :request_vat_number, :require_billing_address, :require_email, :require_name, :secret, :state, :start_at, :end_at, 
          :success_message_text, :waiting_list_enabled_during_sold_out, :archived, :default_quantity]
      end
    end
    
  end
end