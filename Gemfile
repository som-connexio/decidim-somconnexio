# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { github: "decidim/decidim", branch: "release/0.28-stable" }.freeze

gem "decidim", DECIDIM_VERSION

gem "decidim-decidim_awesome", github: "decidim-ice/decidim-module-decidim_awesome"
gem "decidim-term_customizer", github: "mainio/decidim-module-term_customizer", branch: "main"

# gem "decidim-action_delegator", github: "coopdevs/decidim-module-action_delegator"
# gem "decidim-odoo", "~> 0.2.2"

gem "bootsnap", "~> 1.7"

gem "puma"

gem "faker", "~> 3.2"

gem "wicked_pdf"

gem "deface", "~> 1.9"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman"
  gem "decidim-dev", DECIDIM_VERSION
  gem "rubocop-faker", "~> 1.0"
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 4.0"

  gem "capistrano", "~> 3.14"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails"
  gem "capistrano-rails-console"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
end

group :production do
  gem "figaro", "~> 1.2"
  gem "sidekiq", "< 7"
  gem "whenever", "~> 1.0"
end
