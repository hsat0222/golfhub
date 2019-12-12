class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rounds, through: :comments
  has_many :comments
  has_many :rounds, through: :users_rounds
  has_many :users_rounds
  belongs_to :prefecture

  attachment :user_image
end
