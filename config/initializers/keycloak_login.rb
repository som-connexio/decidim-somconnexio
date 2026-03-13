# frozen_string_literal: true

if ENV["OMNIAUTH_WORKER_KEYCLOAK_CLIENT_ID"].present?
  require "omniauth/strategies/worker_keycloak"

  # This is used to create the rails routes for the omniauth provider, so we need to define it before the application is initialized
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

  # reorder the omniauth providers to show the worker_keycloak provider after the odoo_keycloak provider
  Rails.application.config.to_prepare do
    Decidim.omniauth_providers.delete(:worker_keycloak)
    Decidim.omniauth_providers[:worker_keycloak] = {
      enabled: true,
      icon_path: "media/images/keycloak_logo.png"
    }
  end
end
