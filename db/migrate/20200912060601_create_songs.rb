class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name,            null: false
      t.text :text,              null: false 
      t.string :youtube_url
      t.text :translate   
      t.integer :genre_id,       null: false 
      t.date :sales_date,          null: false
      t.references :user,        null: false, foreign_key: true
      t.references :producer,        foreign_key: true
      t.references :featuring,       foreign_key: true
      t.timestamps

    end
  end
end
