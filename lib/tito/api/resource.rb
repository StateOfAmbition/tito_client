module Tito
  module Api
    class Resource < ::Api::Client::Resource

      def initialize(data)
        @data = data
        @type = @data['type']
        @id = @data['id']
        @attributes = JSON.parse(@data.to_json, object_class: OpenStruct)
      end

    end
  end
end
