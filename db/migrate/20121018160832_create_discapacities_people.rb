class CreateDiscapacitiesPeople < ActiveRecord::Migration
  def change
    create_table :discapacities_people , :id => false do |t|
      t.integer :discapacity_id
      t.integer :person_id
    end
  end
end
