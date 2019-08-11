class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast 'room_channel', render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message.html.erb',
      locals: { message: message }
    )
  end
end
