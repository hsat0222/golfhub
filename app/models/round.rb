class Round < ApplicationRecord

  has_many :users, through: :comments
  has_many :comments, dependent: :destroy
  has_many :users, through: :users_rounds
  has_many :users_rounds, dependent: :destroy
  belongs_to :prefecture
  belongs_to :map
  accepts_nested_attributes_for :map

  validates :round_title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :round_date, presence: true
  validates :round_intro, presence: true
  validates :recruitment_sex, presence: true
  validates :capacity, presence: true
end
