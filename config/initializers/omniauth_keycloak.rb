# frozen_string_literal: true

if ENV["OMNIAUTH_KEYCLOAK_SITE"].present?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :keycloak_openid, setup: lambda { |env|
                                        request = Rack::Request.new(env)
                                        organization = Decidim::Organization.find_by(host: request.host)
                                        env["omniauth.strategy"].options["organization"] = organization

                                        env["omniauth.strategy"].options["client_id"] = ENV.fetch("OMNIAUTH_KEYCLOAK_CLIENT_ID", nil)
                                        env["omniauth.strategy"].options["client_secret"] = ENV.fetch("OMNIAUTH_KEYCLOAK_CLIENT_SECRET", nil)
                                        env["omniauth.strategy"].options["client_options"] = { site: ENV.fetch("OMNIAUTH_KEYCLOAK_SITE", nil),
                                                                                               realm: ENV.fetch("OMNIAUTH_KEYCLOAK_REALM", nil) }
                                      },
                               fetch_raw_info: lambda { |_strategy, opts, _ticket, user_info, rawxml|
                                                 return {} if user_info.empty? || rawxml.nil? # Auth failed

                                                 user_info.merge!(
                                                   {
                                                     "nickname" => Decidim::UserBaseEntity.nicknamize(user_info["preferred_username"], organization: opts["organization"]),
                                                     "extended_data" => { "user_info" => user_info }
                                                   }
                                                 )
                                                 user_info
                                               }
  end

  # Rails.application.config.to_prepare do
  #   class OmniAuth::Strategies::KeycloakOpenId
  #     uid { raw_info["preferred_username"] }

  #     info do
  #       {
  #         nickname: raw_info["preferred_username"],
  #         name: raw_info["name"],
  #         email: raw_info["email"]
  #       }
  #     end
  #   end
  # end
  # Force Decidim to look at this provider if not defined in secrets.yml
  Rails.application.secrets[:omniauth][:keycloakopenid] = {
    enabled: true,
    icon_path: "media/images/odoo_logo.png",
    host: ENV.fetch("OMNIAUTH_KEYCLOAK_SITE", nil)
  }
  # Generic verification method for users logged with CAS
  # Decidim::Verifications.register_workflow(:keycloak_member) do |workflow|
  # workflow.form = "SomConnexio::Member"
  # end
end
