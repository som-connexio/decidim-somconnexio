# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

ruby RUBY_VERSION
DECIDIM_VERSION = { github: "openpoke/decidim", branch: "0.31-backports" }.freeze

gem "decidim", DECIDIM_VERSION

gem "decidim-action_delegator", github: "openpoke/decidim-module-action_delegator", branch: "release/0.31-stable"
gem "decidim-decidim_awesome", github: "decidim-ice/decidim-module-decidim_awesome", branch: "release/0.31-stable"
gem "decidim-elections", DECIDIM_VERSION
gem "decidim-odoo", github: "openpoke/decidim-module-odoo", branch: "release/0.31-stable"
gem "decidim-pokecode", github: "openpoke/decidim-module-pokecode", branch: "release/0.31-stable"
gem "decidim-term_customizer", github: "openpoke/decidim-module-term_customizer", branch: "release/0.31-stable"

gem "bootsnap", "~> 1.7"
gem "omniauth-keycloak", "~> 1.5"
gem "puma", ">= 6.3.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman"
  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web"
  gem "web-console"
end
