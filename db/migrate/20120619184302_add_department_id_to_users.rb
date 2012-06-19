class AddDepartmentIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :department_id
    end
  end
end
