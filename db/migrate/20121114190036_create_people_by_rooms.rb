class CreatePeopleByRooms < ActiveRecord::Migration
  def change
    create_table :people_by_rooms do |t|
      t.string :description
      t.integer :point

      t.timestamps
    end
  end
end
