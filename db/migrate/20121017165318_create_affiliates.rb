class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.integer :public_target_id
      t.integer :activity_type_id
      t.integer :period_time_id
      t.integer :period_number
      t.integer :institution_id
      t.integer :person_id

      t.timestamps
    end
  end
end
