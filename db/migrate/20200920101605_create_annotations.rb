class CreateAnnotations < ActiveRecord::Migration[6.0]
  def change
    create_table :annotations do |t|
      t.string :album        
      t.string :sample        
      t.text  :message
      t.text :trouble      
      t.text :intention,          null: false 
      t.text :slang          
      t.text :info          
      t.text :award          
      t.text :relationship    
      t.text :image_text
      t.references :song,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
