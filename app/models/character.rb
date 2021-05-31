class Character < ApplicationRecord
  MAX_CHARACTERS_COUNT = 5

  belongs_to :user
  belongs_to :room
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :personality, presence: true, length: { maximum: 40 }
  validate :characters_count_must_be_within_limit


  def characters_count_must_be_within_limit
    errors.add(:room, "characters count limit:#{MAX_CHARACTERS_COUNT}") if room.characters.count >= MAX_CHARACTERS_COUNT
  end

end
