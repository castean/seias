class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.integer :department_id
      t.string :internal_office_number
      t.string :external_office_number
      t.string :record_no
      t.integer :type_id
      t.string :to
      t.datetime :office_date
      t.datetime :office_recive_date
      t.string :name
      t.text :observations
      t.integer :person_id
      t.integer :activity_type_id
      t.has_attached_file :avatar
      t.integer :user_id
      t.integer :priority_id
      t.integer :status_id

      t.timestamps
    end
  end
end
