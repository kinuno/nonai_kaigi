class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :character

  validates :text, presence: true
end
