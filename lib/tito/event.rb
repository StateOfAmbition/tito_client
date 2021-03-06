module Tito
  class Event < Tito::Entity

    def endpoint
      id ? slug : 'events'
    end

    def get(includes = [])
      return nil unless slug
      self.class.client.get(slug).resource
    end

    class << self

      def find(slug, includes = [])
        client.get(path_with_includes(slug, includes)).resource
      end
      alias_method :get, :find

      def attributes
        [ :additional_info, :address, :after_registration_closed_url, :after_registration_complete_url, :banner_url, :city, :country,
          :credit_card_payment_option_id, :currency, :custom_background_color, :custom_complete_ticket_label, :custom_email_signature,
          :custom_registration_confirmation_subject, :custom_registration_unavailable_message, :custom_ticket_added_subject,
          :custom_ticket_gifted_subject, :custom_ticket_message, :custom_ticket_updated_subject, :custom_view_ticket_label,
          :default_billing_country, :description, :display_date, :display_title, :email_address, :email_image_url, :end_date,
          :facebook_share_message, :google_analytics_property_id, :invoice_change_cutoff_days, :invoice_extra, :invoice_number_format,
          :invoice_prefix, :invoice_tax_details, :live, :location, :logo_height, :logo_url, :logo_width, :map_latitude,
          :map_longitude, :map_link, :map_zoomlevel, :max_tickets_per_person, :min_tickets_per_person, :organization_address,
          :organisation_name, :passbook_icon_url, :payment_instructions, :private, :receipt_footer_message, :register_button_label,
          :register_interest_form_label, :organization_name, :passbook_icon_url, :receipt_footer_message, :register_button_label,
          :register_interest_form_label, :requires_billing_address, :requires_company_name, :requires_country, :show_additional_info,
          :show_banner, :show_company_field, :show_date, :show_description, :show_discount_code_field, :show_email_address,
          :show_location, :show_logo, :show_past_tickets, :show_phone_number_field, :show_prices_ex_tax, :show_register_interest_form,
          :show_register_interest_form_tickets_not_on_sale, :show_register_interest_form_tickets_on_sale, :show_sharing_links,
          :show_tickets_remaining, :show_tickets_remaining_threshold, :show_title, :show_venue, :slug, :start_date, :state_province_region,
          :team_signoff, :test_mode, :title, :theme, :ticket_cancelling_enabled, :ticket_fail_message, :ticket_success_message,
          :tickets_form_label, :timezone, :twitter_share_message, :using_widget, :webhook_checkin, :webhook_ticket, :webhook_url, :zip_postal_code
        ]
      end
    end
  end
end
