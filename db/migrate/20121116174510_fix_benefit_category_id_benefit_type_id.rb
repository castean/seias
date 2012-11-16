class FixBenefitCategoryIdBenefitTypeId < ActiveRecord::Migration
  def up
    rename_column :benefits, :benefit_category_id, :benefit_type_id
  end

  def down
  end
end
