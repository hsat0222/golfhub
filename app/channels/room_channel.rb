class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create(room_id: data['room_id'], user_id: current_user.id, content: data['message'])
    Room.find(data['room_id']).touch
    RoomChannel.broadcast_to "room_#{data['room_id']}", content: render_message(message),user_id: current_user.id
  end
end
