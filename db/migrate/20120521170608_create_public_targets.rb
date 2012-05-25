class CreatePublicTargets < ActiveRecord::Migration
  def change
    create_table :public_targets do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end