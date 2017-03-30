module OmniAuth
  module Strategies
    #   http://api.mail.ru/docs/guides/oauth/sites/
    class Mailru < OAuth2
      DEFAULT_SCOPE = ''

      option :name, "mailru"

      option :client_options, {
        :site => 'https://connect.mail.ru/',
        :token_url     => '/oauth/token',
        :authorize_url => '/oauth/authorize'
      }

      option :callback_url

      uid do
        access_token.params['x_mailru_vid']
      end

      info do
        {
          :nickname => raw_info['nick'],
          :email => raw_info['email'],
          :name => [raw_info['first_name'], raw_info['last_name']].join(' '),
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => (raw_info['has_pic'].to_s != "0") && raw_info['pic_50'] || nil,
          :location => ((raw_info['location'] || {})['city'] || {})['name'],
          # gender is binary :)
          :gender => raw_info['sex'] == 0 ? 'male' : 'female',
          :birthday => raw_info['birthday'],
          :urls => {
            'Mailru' => raw_info['link']
          }
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def callback_url
        options.callback_url || super
      end

      # You can pass +display+ or +scope+ params to the auth request, if
      # you need to set them dynamically.
      #
      # http://vk.com/dev/oauth_dialog
      #
      def authorize_params
        super.tap do |params|
          # just a copypaste from ominauth-facebook
          %w[code state].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]

              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end

          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      private

      def raw_info
        @raw_info ||= begin
          params = {
            :method => 'users.getInfo',
            :app_id => options.client_id,
            :session_key => access_token.token,
            :format => "json"
          }
          params[:sig] = calc_signature(params)
          result = access_token.get('http://appsmail.ru/platform/api', :params => params).parsed.first
          result
        end
      end

      def calc_signature(hash)
        raw = hash.map{|key, value| [key, value].join('=')}.sort.join
        raw = [uid, raw, options.client_secret].join
        Digest::MD5.hexdigest(raw)
      end

    end

  end
end
