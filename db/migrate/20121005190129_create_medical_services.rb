class CreateMedicalServices < ActiveRecord::Migration
  def change
    create_table :medical_services do |t|
      t.string :name

      t.timestamps
    end
  end
end
