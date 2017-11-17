module Tito
  module Setting
    class Payment < Tito::Setting::Base
      
      class << self
        
        def resource_name
          'register_form'
        end
        
        def properties
          [:invoice_number_format, :invoice_change_cutoff_days, :organization_name, :organization_address, :invoice_tax_details]
        end
      end
    end
  end
end

