require 'telegram/bot'
require "active_support"
require 'active_support/core_ext'

class Telegram::WebhookController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  use_session!

  self.session_store = :memory_store, {expires_in: 1.month}

  def message(message)
    puts 'we have a visitor'
    puts message.class
  end

  def start!
    respond_with :message, text: 'Hello!'
  end

  def learn!
    respond_with :message, text: 'Select level:'
    session[:my_profession] = rand(10)
    save_context :select_level
  end

  def select_level(*words)
    level = words[0].to_i
    respond_with :message, text: "Profession: #{session[:my_profession]} Level #{level} selected!"
  end

end