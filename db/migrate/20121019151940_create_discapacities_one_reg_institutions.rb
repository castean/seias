class CreateDiscapacitiesOneRegInstitutions < ActiveRecord::Migration
  def change
    create_table :discapacities_one_reg_institutions, :id => false do |t|
      t.integer :one_reg_institution_id
      t.integer :discapacity_id
    end
  end
end
