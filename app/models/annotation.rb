class Annotation < ApplicationRecord
  belongs_to :song
  has_one_attached :image
  validates :intention, presence: true
end
