class ChatsController < ApplicationController
  def show
    my_room_ids = current_user.user_rooms.pluck(:room_id)
    @room = UserRoom.find_by(user_id: params[:companion_user].to_i, room_id: my_room_ids)&.room
    if @room
      @chats = @room.chats
    else
      @room = Room.new
      @room.save
      @room.create_user_rooms(current_user.id, params[:companion_user].to_i)
      @chats = []
    end
  end
  
  def create
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.room_id = params[:room_id].to_i
    if chat.save
      @chats = Chat.where(room_id: chat.room_id)
    else
      @message = 'チャットの送信に失敗しました'
      render :save_false
    end
  end
  
  private
  def chat_params
    params.require(:chat).permit(:text)
  end
end
