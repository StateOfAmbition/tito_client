module Tito
  module Eventable
    def self.included(base)
      base.extend ClassMethods
      def endpoint
        [event_slug, self.class.resource_prefix, self&.resource_prefix_id, self.class.resource_type, id].reject{|a|a.nil? || a.to_s.empty?}.join("/")
      end

      def event_slug
        raise InvalidEventableResource unless attributes.has_key?(:event_slug)
        attributes[:event_slug]
      end

      def get(includes = [])
        return nil unless id
        self.class.client.get(path_with_includes([event_slug, resource_type, id].join("/"), includes))
      end
    end

    module ClassMethods

      def find(event_slug, id, includes = [])
        client.get(path_with_includes([event_slug, resource_type, id].join("/"), includes))
      end
      alias_method :get, :find

      def all_for(event_slug, includes = [])
        client.get(path_with_includes([event_slug, resource_type].join("/"), includes))
      end

      private
        def path_with_includes(path, includes)
          includes.empty? ? path : [path, includes.join(',')].join('?include=')
        end

    end

    class InvalidEventableResource < StandardError; end
  end
end
