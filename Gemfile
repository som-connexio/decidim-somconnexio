# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

ruby RUBY_VERSION
DECIDIM_VERSION = { github: "decidim/decidim", branch: "release/0.29-stable" }.freeze

gem "decidim", DECIDIM_VERSION

gem "decidim-decidim_awesome", github: "decidim-ice/decidim-module-decidim_awesome", branch: "main"
# gem "decidim-odoo", "~> 0.2.2"
gem "decidim-term_customizer", github: "CodiTramuntana/decidim-module-term_customizer", branch: "upgrade/decidim_0.29"

gem "bootsnap", "~> 1.7"
gem "deface", ">= 1.9"
gem "health_check"
gem "omniauth-keycloak"
gem "puma", ">= 6.3.1"
gem "rails_semantic_logger"
gem "sentry-rails"
gem "sentry-ruby"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman"
  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web"
  gem "web-console"
end

group :production do
  gem "sidekiq"
  gem "sidekiq-cron"
end
