class Song < ApplicationRecord
  validates :name, :text, :image, :genre_id, presence: true
  validates :genre_id, numericality: { other_than: 1 }
  belongs_to :user
  belongs_to :producer, optional: true
  belongs_to :featuring, optional: true
  has_many :song_artist_relations
  has_many :artists, through: :song_artist_relations, dependent: :destroy
  has_one_attached :image
  has_one :annotation
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_many :comments
  def self.search(search)
    if search != ''
      @song = Song.where('name LIKE(?)', "%#{search}%")
      @text = Song.where('text LIKE(?)', "%#{search}%")
      @translate = Song.where('translate LIKE(?)', "%#{search}%")
      @artist = Artist.where('art_name LIKE(?)', "%#{search}%")
      @producer = Producer.where('producer_name LIKE(?)', "%#{search}%")
      @featuring = Featuring.where('featuring_name LIKE(?)', "%#{search}%")

      @songs = []
      @song.each do |song|
        @songs << song
      end
      @text.each do |text|
        @songs << text
      end
      @translate.each do |translate|
        @songs << translate
      end
      @artist.each do |artist|
        artist.songs.each do |a|
          @songs << a
        end
      end
      @producer.each do |producer|
        producer.songs.each do |pro|
          @songs << pro
        end
      end
      @featuring.each do |featuring|
        featuring.songs.each do |f|
          @songs << f
        end
      end
      @songs = @songs.uniq
      return @songs

    else
      return nil
    end
  end
end
