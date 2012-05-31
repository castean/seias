class CreatePlaceTypes < ActiveRecord::Migration
  def change
    create_table :place_types do |t|
      t.string :nick
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
