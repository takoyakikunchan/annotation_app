class CreateProducerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :producer_profiles do |t|
      t.text :biography
      t.string :insta
      t.string :twitter
      t.references :producer,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
