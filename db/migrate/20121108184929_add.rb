class Add < ActiveRecord::Migration
  def change
    add_column :offices, :person_info, :text
    add_column :offices, :user_info, :text
  end
end
