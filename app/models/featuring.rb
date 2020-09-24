class Featuring < ApplicationRecord
  has_many :songs
  validates :featuring_name,  uniqueness: true
end
