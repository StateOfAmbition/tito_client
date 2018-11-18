module Tito
  module Setting
    class Invoicing < Tito::Setting::Base

      class << self

        def resource_name
          'invoicing'
        end

        def attributes
          [
            :invoice_number_format, :invoice_number_offset, :invoice_change_cutoff_days, :organization_name, :organization_address, :invoice_tax_details,
            :email_invoice, :invoice_form_message, :invoice_purchase_message, :invoice_payment_instructions
          ]
        end
      end
    end
  end
end
