module Tito
  class Base
    attr_accessor :client, :attributes, :params

    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(method, *args, &block)
      attributes.has_key?(method) ? attributes[method] : nil
    end

    def params
      @params ||= generate_params
    end

    class << self

      attr_reader :client

      def client
        @client ||= Tito::Client.http
      end

      def resource_prefix
        nil
      end

      def resource_name
        @resouce_name ||= self.name.split('::').last.
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
      end

      def resource_type
        match = /^(\w+)(?:y)$/i.match(resource_name)
        match ? (match[1] + "ies") : (resource_name + "s")
      end

    end

  end
end
