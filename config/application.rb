require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nakama
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    
    config.to_prepare do
      DeviseController.respond_to :html, :json, :js
    end

    # 有効にする言語のホワイトリスト
    # config.i18n.available_locales = %i(ja en)

    # ホワイトリストをチェックするかどうか
    # config.i18n.enforce_available_locales = true

    # 言語を指定されなかった場合のデフォルト値
    config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
