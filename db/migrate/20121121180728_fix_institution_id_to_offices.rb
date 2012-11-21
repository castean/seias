class FixInstitutionIdToOffices < ActiveRecord::Migration
  def up
    rename_column :offices, :Institution_id, :institution_id
  end

  def down
  end
end
