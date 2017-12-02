module Tito
  module Setting
    class Email < Tito::Setting::Base

      class << self

        def attributes
          [:custom_email_signature, :remote_email_image_url, :receipt_footer_message, :custom_ticket_message,
            :custom_complete_ticket_label, :custom_view_ticket_label, :send_registration_confirmation_email,
              :send_ticket_updated_email, :send_ticket_gifted_email]
        end
      end
    end
  end
end
