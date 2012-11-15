class CreateNumberOfRooms < ActiveRecord::Migration
  def change
    create_table :number_of_rooms do |t|
      t.string :description
      t.integer :point

      t.timestamps
    end
  end
end
