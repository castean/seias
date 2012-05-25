class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :value
      t.text :description
      t.datetime :activity_date
      t.references :town
      t.references :group
      t.references :public_target

      t.timestamps
    end
    add_index :activities, :town_id
    add_index :activities, :group_id
    add_index :activities, :public_target_id
  end
end
