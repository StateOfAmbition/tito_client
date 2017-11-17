module Tito
  module Setting
    class Payment < Tito::Setting::Base
      
      class << self
        
        def resource_name
          'register_form'
        end
        
        def properties
          [:show_company_field, :requires_company_name, :requires_vat_number, 
            :requires_billing_address, :requires_country, :default_billing_country,
              :show_phone_number_field, :show_invoice_purchase_order_number_field, :show_sharing_links]
        end
      end
    end
  end
end