module Tito
  class Release < Tito::Entity
    include Eventable, DashboardEndpoint

    class << self

      def void_tickets(event_slug, id)
        self.find(event_slug, id, ["tickets"]).included.each do |t|
          Tito::Ticket.void(event_slug, t.id) unless t.state == "void"
        end
      end

      def un_void_tickets(event_slug, id)
        self.find(event_slug, id, ["tickets"]).included.each do |t|
          Tito::Ticket.un_void(event_slug, t.id) if t.state == "void"
        end
      end

      def destroy(event_slug, id)
        client.delete([event_slug, resource_type, id].join("/"))
      end

      def attributes
        [:title, :description, :enable_super_combo_summary, :has_success_message, :invoice, :max_tickets_per_person, :metadata,
          :min_tickets_per_person, :not_a_ticket, :position, :price, :price_degressive, :pricing_type, :quantity, :question_ids, :request_company_name,
          :request_vat_number, :require_billing_address, :require_email, :require_name, :secret, :slug, :state, :start_at,
          :end_at, :success_message_text, :waiting_list_enabled_during_sold_out, :archived, :default_quantity]
      end
    end

  end
end
