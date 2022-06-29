module Telegram
  module Bot
    class Client
      def initialize(token = nil, username = nil, server: SERVER, **options)
        @client = HTTPClient.new
        @client.receive_timeout = 0
        @token = token || options[:token]
        @username = username || options[:username]
        @base_uri = format(URL_TEMPLATE, server: server, token: self.token)
      end

      def http_request(uri, body)
        client.post(uri, body)
      rescue RuntimeError => e
        warn 'client had a problem'
        warn e.message
      end

    end

    class UpdatesPoller
      def fetch_updates(offset = self.offset)
        response = bot.async(false) { bot.get_updates(offset: offset, timeout: timeout) }
        response.is_a?(Array) ? response : response['result']
      rescue RuntimeError => e
        log { 'Network problem' }
        warn e.message
        nil
      end
    end

  end

end