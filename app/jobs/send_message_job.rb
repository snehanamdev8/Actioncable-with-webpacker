class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    mine = ApplicationController.render(
      partial: 'messages/mine', 
      locals: { message: message }
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs', 
      locals: { message: message }
    )

    data = {
      mine: mine, 
      theirs: theirs, 
      message: message
    }

    ActionCable.server.broadcast "room_channel_#{message.room_id}", data
  end
end
