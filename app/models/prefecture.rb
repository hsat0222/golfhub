class Prefecture < ApplicationRecord
	has_many :users
  has_many :rounds
  belongs_to :region
end
