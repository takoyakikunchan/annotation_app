class ArtistProfile < ApplicationRecord
  belongs_to :artist
  has_one_attached :image
end
