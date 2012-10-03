class CreateInstitutionsTypes < ActiveRecord::Migration
  def change
    create_table :institutions_types , :id => false do |t|
      t.string :name

      t.timestamps
    end
  end
end
