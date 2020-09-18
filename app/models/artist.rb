class Artist < ApplicationRecord
  has_many :song_artist_relations
  has_many :songs, through: :song_artist_relations
  has_one :artist_profile
   validates :art_name, uniqueness: true
end
