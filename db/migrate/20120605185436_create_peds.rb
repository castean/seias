class CreatePeds < ActiveRecord::Migration
  def change
    create_table :peds do |t|
      t.string :name
      t.text :description
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
