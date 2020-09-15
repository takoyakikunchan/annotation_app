class SongsArtist
  include ActiveModel::Model
  attr_accessor :name, :text, :image, :genre_id, :translate, :youtube_url, :art_name,:producer,:featuring, :user_id,:song_id
  validates :name, :text,:image,:genre_id, presence: true
  validates  :genre_id, numericality: { other_than: 1 }
  def save
    artist = Artist.where(art_name: art_name,producer: producer,featuring: featuring).first_or_initialize
    artist.save
    song = Song.create(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, user_id: user_id)
    SongArtistRelation.create(song_id: song.id, artist_id: artist.id)
  end
  def update
    artist = Artist.where(art_name: art_name,producer: producer,featuring: featuring).first_or_initialize
    artist.update(art_name: art_name,producer: producer,featuring: featuring)
    song= Song.find_by(id: song_id)
    song.update(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, user_id: user_id, id: song_id)
  end
end
