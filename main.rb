require 'telegram/bot'
require_relative 'webhook_controller'

CHAT_BOT_TOKEN = 'hehe'
bot = Telegram::Bot::Client.new(CHAT_BOT_TOKEN)

require 'logger'
logger = Logger.new(STDOUT)
poller = Telegram::Bot::UpdatesPoller.new(bot, Telegram::WebhookController, logger: logger)
poller.start