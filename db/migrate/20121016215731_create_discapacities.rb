class CreateDiscapacities < ActiveRecord::Migration
  def change
    create_table :discapacities do |t|
      t.string :name

      t.timestamps
    end
  end
end
