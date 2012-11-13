class CreateBenefitCategories < ActiveRecord::Migration
  def change
    create_table :benefit_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
