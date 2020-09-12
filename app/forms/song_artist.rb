class SongArtist
  include ActiveModel::Model
  attr_accessor :name, :text, :image, :genre_id, :translate, :youtube_url, :art_name,:producer,:featuring, :user_id

  def save
    artist = Artist.where(art_name: art_name,producer: producer,featuring: featuring).first_or_initialize
    artist.save
    song = Song.create(name: name, text: text, image: image, genre_id: genre_id, translate: translate, youtube_url: youtube_url, user_id: user_id)
    SongArtistRelation.create(song_id: song.id, artist_id: artist.id)
  end
end
