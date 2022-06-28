require 'telegram/bot'
require_relative 'client_patch'
require_relative 'webhook_controller'

CHAT_BOT_TOKEN = ENV['DEMO_BOT_TOKEN']
bot = Telegram::Bot::Client.new(CHAT_BOT_TOKEN)

require 'logger'
logger = Logger.new(STDOUT)
poller = Telegram::Bot::UpdatesPoller.new(bot, Telegram::WebhookController, logger: logger)
poller.start