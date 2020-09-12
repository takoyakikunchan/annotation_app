class Artist < ApplicationRecord
  has_many :song_artist_relations
  has_many :songs, through: :song_artist_relations
end
