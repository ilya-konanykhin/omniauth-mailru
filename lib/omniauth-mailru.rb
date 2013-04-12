require "omniauth-oauth2"
require_relative "omniauth/strategies/mailru"
require_relative "omniauth-mailru/version"

OmniAuth.config.add_camelization("mailru", "Mailru")
