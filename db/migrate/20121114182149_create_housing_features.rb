class CreateHousingFeatures < ActiveRecord::Migration
  def change
    create_table :housing_features do |t|
      t.string :description
      t.integer :point

      t.timestamps
    end
  end
end
