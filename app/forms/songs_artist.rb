class SongsArtist
  include ActiveModel::Model
  attr_accessor :name, :text, :image, :genre_id, :translate, :youtube_url, :art_name,:producer_name,:featuring, :user_id,:song_id
  validates :name, :text,:image,:genre_id, presence: true
  validates  :genre_id, numericality: { other_than: 1 }
  def save
    artist = Artist.where(art_name: art_name,featuring: featuring).first_or_initialize
    artist.save
    producer = Producer.where(producer_name: producer_name).first_or_initialize
    producer.save
    song = Song.create(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, user_id: user_id,producer_id: producer.id)
    SongArtistRelation.create(song_id: song.id, artist_id: artist.id)
  end
  def update
    producer = Producer.where(producer_name: producer_name).first_or_initialize
    producer.update(producer_name: producer_name)
    artist = Artist.where(art_name: art_name,featuring: featuring).first_or_initialize
    artist.update(art_name: art_name,featuring: featuring)
    song= Song.find_by(id: song_id)
    song.update(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, user_id: user_id, id: song_id,producer_id:producer.id)
  end
end
