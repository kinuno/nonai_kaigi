class Room < ApplicationRecord
  belongs_to :user
  has_many :characters, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
end
