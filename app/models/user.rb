class User < ApplicationRecord
  validates_uniqueness_of :username

  has_many :messages
  has_many :rooms, foreign_key: :sender_id
  has_many :rooms, foreign_key: :receiver_id

  scope :all_except, ->(user) { where.not(id: user) }

  def self.generate
    adjectives = ['Ancient', 'Creative', 'Dangerous', 'Effective', 'Flying', 'Gilded']
    nouns = ['Highway', 'Intern', 'Jackhammer', 'Lion', 'Master']
    number = rand.to_s[2..4]
    username = "#{adjectives.sample}-#{nouns.sample}-#{number}"
    create(username: username)
  end

end
