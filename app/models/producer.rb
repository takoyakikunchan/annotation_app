class Producer < ApplicationRecord
  has_many :songs
  has_one :producer_profile
  validates :producer_name, uniqueness: true
end
