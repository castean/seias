class AddInstitutionIdToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :Institution_id, :integer
  end
end
