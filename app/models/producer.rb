class Producer < ApplicationRecord
  has_many :songs
  validates :producer_name, uniqueness: true
end
