class ActivityTypesOffices < ActiveRecord::Migration
  def change
    create_table :activity_types_offices , :id => false do |t|
      t.integer :activity_type_id
      t.integer :office_id
    end
  end
end
