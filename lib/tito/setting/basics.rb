module Tito
  module Setting
    class Basics < Tito::Setting::Base

      class << self
        def attributes
          [:email_address, :slug, :domain, :private, :meta_robots]
        end
      end
    end
  end
end
