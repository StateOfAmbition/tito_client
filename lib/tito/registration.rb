module Tito
  class Registration < Tito::Entity
    include Eventable

    def void
      self.class.client.post([event_slug, self.class.resource_type, id, "cancellation"].join("/"))
    end

    class << self

      def void(event_slug, id)
        self.client.post([event_slug, resource_type, id, "cancellation"].join("/"))
      end

      def un_void(event_slug, id)
        self.find(event_slug, id, ["tickets"]).included.each do |t|
          Tito::Ticket.un_void(event_slug, t.id) if t.state == "void"
        end
      end

      def attributes
        [:ticket_ids, :cancel]
      end
    end
  end
end


