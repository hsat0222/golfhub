class Round < ApplicationRecord

  has_many :users, through: :comments
  has_many :comments
  has_many :users, through: :users_rounds
  has_many :users_rounds
  belongs_to :prefecture
  belongs_to :map
  accepts_nested_attributes_for :map
end
