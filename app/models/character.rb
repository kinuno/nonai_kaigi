class Character < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :personality, presence: true, length: { maximum: 40 }
end
