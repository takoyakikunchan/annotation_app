class CreateSongArtistRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :song_artist_relations do |t|
      t.references :song, foreign_key: true
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end