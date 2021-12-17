class Room < ApplicationRecord
	has_many :messages
	# has_many :users, through: :messages
	belongs_to :sender, foreign_key: :sender_id, class_name: "User"
	belongs_to :receiver, foreign_key: :receiver_id, class_name: "User"

	scope :between, -> (sender_id, receiver_id) do
    where(sender_id: sender_id, receiver_id: receiver_id).or(
      where(sender_id: receiver_id, receiver_id: sender_id)
    )
  end

  def self.get(sender_id, receiver_id)
    room = between(sender_id, receiver_id).first
    return room if room.present?

    create(sender_id: sender_id, receiver_id: receiver_id)
  end
end
