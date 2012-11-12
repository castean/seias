class CreateBenefitTypes < ActiveRecord::Migration
  def change
    create_table :benefit_types do |t|
      t.string :name
      t.integer :benefit_category_id

      t.timestamps
    end
  end
end
