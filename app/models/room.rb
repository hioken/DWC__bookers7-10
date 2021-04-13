class Room < ApplicationRecord
  has_many :chats
  has_many :user_rooms
  
  def create_user_rooms(current_user_id, companion_user_id)
    [current_user_id, companion_user_id].each do |id|
      UserRoom.create(room_id: self.id, user_id: id)
    end
  end
end
