class CreateFeaturings < ActiveRecord::Migration[6.0]
  def change
    create_table :featurings do |t|
      t.string :featuring_name, uniqueness: true
      t.timestamps
    end
  end
end
