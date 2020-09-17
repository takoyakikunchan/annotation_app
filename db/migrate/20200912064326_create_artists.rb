class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :art_name, null: false, uniqueness: true
      t.timestamps
    end
  end
end
