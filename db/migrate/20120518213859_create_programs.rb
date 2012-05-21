class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.integer :department_id
      t.integer :responsable_id

      t.timestamps
    end
  end
end
