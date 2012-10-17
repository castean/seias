class CreateFuncionalSupports < ActiveRecord::Migration
  def change
    create_table :funcional_supports do |t|
      t.string :name

      t.timestamps
    end
  end
end
