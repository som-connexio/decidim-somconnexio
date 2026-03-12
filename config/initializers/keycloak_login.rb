# frozen_string_literal: true

require "omniauth/strategies/worker_keycloak"

if ENV["OMNIAUTH_WORKER_KEYCLOAK_CLIENT_ID"].present?
  Decidim.omniauth_providers[:worker_keycloak] = {
    enabled: true,
    icon_path: "media/images/keycloak_logo.png"
  }

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :worker_keycloak,
             ENV["OMNIAUTH_WORKER_KEYCLOAK_CLIENT_ID"],
             ENV.fetch("OMNIAUTH_WORKER_KEYCLOAK_CLIENT_SECRET", nil),
             client_options: {
               site: ENV.fetch("OMNIAUTH_WORKER_KEYCLOAK_SITE", nil),
               realm: ENV.fetch("OMNIAUTH_WORKER_KEYCLOAK_REALM", nil)
             }
  end
end
