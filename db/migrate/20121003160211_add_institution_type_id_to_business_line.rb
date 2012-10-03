class AddInstitutionTypeIdToBusinessLine < ActiveRecord::Migration
  def change
    add_column :business_lines, :institution_type_id, :integer
  end
end
