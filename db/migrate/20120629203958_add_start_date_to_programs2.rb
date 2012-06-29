class AddStartDateToPrograms2 < ActiveRecord::Migration
  def change
    change_table :programs do |t|
      t.datetime :start_date
    end
  end
end
