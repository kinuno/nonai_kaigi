class Room < ApplicationRecord
  belongs_to :user
  has_many :characters, dependent: :destroy
  has_many :comments
  

  validates :name, presence: true, length: { maximum: 40 }
end
