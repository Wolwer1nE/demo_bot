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
    end
  end
end