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

  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  attachment :user_image

  validates :user_name, presence: true, uniqueness: true
  validates :age, presence: true
  validates :prefecture_id, presence: true
  validates :exp_golf, presence: true
  validates :av_score, presence: true
  validates :user_sex, presence: true
  validates :user_job, presence: true
end
