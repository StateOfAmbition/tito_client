module Tito
  module Setting
    class Services < Tito::Setting::Base

      class << self

        def resource_name
          'services'
        end

        def attributes
          [
            :after_registration_complete_url, :after_registration_redirect_after_questions,
            :after_registration_closed_url, :google_analytics_property_id, :google_analytics_domains,
            :show_sharing_links, :twitter_share_message_en, :social_sharing_title, :social_sharing_description, :metadata
          ]
        end
      end
    end
  end
end
