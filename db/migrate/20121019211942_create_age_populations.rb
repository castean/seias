class CreateAgePopulations < ActiveRecord::Migration
  def change
    create_table :age_populations do |t|
      t.integer :institution_id
      t.integer :guardianship_id
      t.integer :sex_id
      t.integer :age_range_id
      t.integer :total_qty_registered
      t.integer :real_qty_registered

      t.timestamps
    end
  end
end
