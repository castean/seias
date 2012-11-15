class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.integer :institution_type_id
      t.string :name
      t.integer :type_person
      t.string :legal_name
      t.string :legal_last_name
      t.string :legal_second_last_name
      t.string :rfc
      t.integer :link_user_id
      t.integer :country_id
      t.integer :town_id
      t.string :address
      t.integer :external_address_number
      t.integer :internal_address_number
      t.string :second_address
      t.integer :zip_code
      t.integer :phone
      t.datetime :date_operation_start
      t.datetime :date_operation_end
      t.integer :religion_id
      t.string :email
      t.integer :business_line_id
      t.integer :status_id
      t.integer :father_institution_id
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
