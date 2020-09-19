class SongsArtist
  include ActiveModel::Model
  attr_accessor :name, :text, :image, :genre_id, :translate, :youtube_url, :sales_date,:art_name,:producer_name,:featuring_name, :user_id,:song_id
  validates :name, :text,:image,:genre_id, presence: true
  validates  :genre_id, numericality: { other_than: 1 }
  def save
    artist = Artist.where(art_name: art_name).first_or_initialize
    artist.save
    featuring = Featuring.where(featuring_name: featuring_name).first_or_initialize
    featuring.save
    producer = Producer.where(producer_name: producer_name).first_or_initialize
    producer.save
    song = Song.create(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, sales_date: sales_date,user_id: user_id,producer_id: producer.id,featuring_id: featuring.id)
    SongArtistRelation.create(song_id: song.id, artist_id: artist.id)
  end
  def update
    featuring = Featuring.where(featuring_name: featuring_name).first_or_create
    featuring.update(featuring_name: featuring_name)
    producer = Producer.where(producer_name: producer_name).first_or_create
    producer.update(producer_name: producer_name)
    song= Song.find_by(id: song_id)
    song.update(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url,sales_date: sales_date, user_id: user_id, id: song_id,producer_id: producer.id,featuring_id: featuring.id)
    artist = Artist.where(art_name: art_name).first_or_create
    song.artists.clear
    song.artists << artist
  end
end
