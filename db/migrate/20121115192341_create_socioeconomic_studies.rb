class CreateSocioeconomicStudies < ActiveRecord::Migration
  def change
    create_table :socioeconomic_studies do |t|
      t.integer :person_id
      t.text :family_history
      t.string :labor_company
      t.string :labor_work_seniority
      t.string :labor_time
      t.decimal :spending_food
      t.decimal :spending_auto
      t.decimal :spending_rent
      t.decimal :spending_monthly_payment
      t.decimal :spending_education
      t.decimal :spending_payment
      t.decimal :spending_other
      t.decimal :service_water
      t.decimal :service_electricity
      t.decimal :service_drainage
      t.decimal :service_phone
      t.decimal :service_paving
      t.decimal :service_transportation
      t.decimal :service_gas
      t.integer :housing_feature_id
      t.string :construction_material_wall
      t.string :construction_material_roof
      t.string :construction_material_floor
      t.integer :number_of_room_id
      t.integer :people_by_room_id
      t.integer :condition_id
      t.boolean :stove
      t.boolean :phone
      t.boolean :dvd
      t.boolean :fridge
      t.boolean :microweave
      t.boolean :air_conditioning
      t.integer :health
      t.text :family_dinamyc
      t.text :environment
      t.text :children_education
      t.text :neighbor_references
      t.text :heritage_assets
      t.string :study_person_name
      t.string :study_place
      t.integer :relationship_id
      t.integer :total_point
      t.text :description_evaluation_general

      t.timestamps
    end
  end
end
