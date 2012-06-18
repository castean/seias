class AddPriorityAndUserIdToActivityType < ActiveRecord::Migration
  def change
    change_table :activity_types do |t|
      t.integer :priority
      t.integer :user_id
    end
  end
end
