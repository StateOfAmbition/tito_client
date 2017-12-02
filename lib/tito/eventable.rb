module Tito
  module Eventable
    def self.included(base)
      base.extend ClassMethods
      def endpoint
        [event_slug, self.class.resource_prefix, self.class.resource_type, id].reject{|a|a.nil? || a.empty?}.join("/")
      end

      def event_slug
        raise InvalidEventableResource unless attributes.has_key?(:event_slug)
        attributes[:event_slug]
      end
    end

    module ClassMethods

      def find(event_slug, id)
        self.client.get([event_slug, resource_type, id].join("/"))
      end

      def all_for(event_slug)
        self.client.get([event_slug, resource_type].join("/"))
      end

    end

    class InvalidEventableResource < StandardError; end
  end
end
