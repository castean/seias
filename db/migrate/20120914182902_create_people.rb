class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.has_attached_file :avatar
      t.string    :name,                :null => false
      t.string    :last_name,           :null => false
      t.string    :second_last_name
      t.integer   :marital_status_id
      t.integer   :sex,                 :null => false
      t.integer   :ethnic_group_id,     :null => false
      t.datetime  :birthday,            :null => false
      t.integer   :born_town_id
      t.integer   :town_id
      t.string    :address
      t.string    :address_two
      t.integer   :code_area
      t.integer   :phone
      t.integer   :cel_phone
      t.integer   :emergency_phone
      t.string    :rfc
      t.string    :curp
      t.string    :email
      t.string    :tutor
      t.integer   :tutor_relationship_id
      t.integer   :tutor_marital_status_id
      t.integer   :medical_service_id
      t.boolean   :student
      t.boolean   :reader
      t.integer   :schooling
      t.integer   :school_type_id
      t.boolean   :worker
      t.string    :job
      t.boolean   :self_employment
      t.string    :occupation
      t.boolean   :job_seeker
      t.integer   :user_id
      t.boolean   :discapacity_status
      t.boolean   :diagnosis
      t.text      :diagnosis_description
      t.integer   :discapacity_origin_id
      t.integer   :discapacity_origin_year
      t.text      :observations
      t.integer   :status_id
      t.boolean   :use_functional_support
      t.integer   :born_county_id
      t.integer   :county_id


      t.timestamps
    end
  end
end
