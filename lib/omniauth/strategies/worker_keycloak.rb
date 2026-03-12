# frozen_string_literal: true

require "omniauth-keycloak"

module OmniAuth
  module Strategies
    class WorkerKeycloak < OmniAuth::Strategies::KeycloakOpenId
      option :name, "worker_keycloak"

      uid { raw_info[:ref] }

      info do
        {
          name: raw_info["name"],
          email: raw_info["email"]
        }
      end

      def authorize_params
        super.tap do |param|
          param[:kc_locale] = current_locale
        end
      end

      def query_string
        ""
      end

      private

      def current_locale
        request.params["locale"] || I18n.default_locale
      end
    end
  end
end
