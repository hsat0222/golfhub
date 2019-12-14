class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # delete_flagが0のみログイン許可
  def self.find_first_by_auth_conditions(warden_conditions)
    User.where(:email => warden_conditions[:email],:delete_flag=>0).first
  end

  has_many :rounds, through: :comments
  has_many :comments
  has_many :rounds, through: :users_rounds
  has_many :users_rounds
  belongs_to :prefecture

  attachment :user_image
end
