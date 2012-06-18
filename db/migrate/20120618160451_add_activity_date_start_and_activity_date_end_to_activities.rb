class AddActivityDateStartAndActivityDateEndToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.datetime :activity_date_start
      t.datetime :activity_date_end
    end
     remove_column :activities, :activity_date
  end
  
end
