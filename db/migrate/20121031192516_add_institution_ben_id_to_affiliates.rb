class AddInstitutionBenIdToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :institution_ben_id, :integer
  end
end
