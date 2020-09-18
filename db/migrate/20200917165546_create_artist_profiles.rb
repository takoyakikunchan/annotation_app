class CreateArtistProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_profiles do |t|
      t.text :biography
      t.string :insta
      t.string :twitter
      t.references :artist,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
