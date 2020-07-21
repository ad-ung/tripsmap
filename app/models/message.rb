class Message < ApplicationRecord
  belongs_to :chatroom, foreign_key: :chatroom_id
  belongs_to :user
end
