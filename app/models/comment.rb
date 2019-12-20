class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :round

  validates :comment, presence: true
end
