class Map < ApplicationRecord
  has_many :rounds

  geocoded_by :place
  after_validation :geocode
end
