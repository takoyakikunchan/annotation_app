class Artist < ApplicationRecord
  has_many :song_artist_relations
  has_many :songs, through: :song_artist_relations
  # validates :art_name, uniqueness: true
  # validates :featuring, uniqueness: true
end
