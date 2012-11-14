class AddCutDayToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :cut_day, :integer
  end
end
