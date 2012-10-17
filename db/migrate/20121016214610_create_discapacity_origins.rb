class CreateDiscapacityOrigins < ActiveRecord::Migration
  def change
    create_table :discapacity_origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
