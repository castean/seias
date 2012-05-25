class AddActivityTypeToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.references :activity_type
    end
  end
end
