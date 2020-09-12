class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name,            null: false
      t.text :text,              null: false 
      t.string :youtube_url,     null: false                                                            
      t.text :translate                                   
      t.integer :genre_id,       null: false                    
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
