class AddColumnIncomeToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :income, :decimal
  end
end
